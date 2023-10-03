import 'package:petitparser/petitparser.dart';
import 'package:swan/plugins/swa/model.dart';

class SimpleWidgetAnnotationGrammer
    extends GrammarDefinition<SimpleWidgetAnnotation> {
  @override
  Parser<SimpleWidgetAnnotation> start() => [
        ref0(annotation),
        endOfInput(),
      ].toSequenceParser().pick(0).cast();

  Parser<SimpleWidgetAnnotation> annotation() => [
        ref0(name),
        ref0(parameters).optional(),
        ref0(children).optional(),
      ].toSequenceParser().map(
            (value) => SimpleWidgetAnnotation(
              name: value[0],
              parameters: value[1],
              children: value[2],
            ),
          );

  Parser name() => ref1(token, word().plus().flatten());

  Parser<Map<SimpleWidgetKey, SimpleWidgetToken>?> parameters() => [
        ref1(token, char('(')),
        ref0(parameter)
            .plusSeparated(ref1(token, char(',')))
            .map(
              (value) => Map.fromEntries(value.elements),
            )
            .optional(),
        ref1(token, char(',')).optional(),
        ref1(token, char(')')),
      ].toSequenceParser().pick(1).cast();

  Parser<MapEntry<SimpleWidgetKey, SimpleWidgetToken>> parameter() => [
        [
          ref0(parameterKey),
          ref1(token, char(':')),
        ]
            .toSequenceParser()
            .pick(0)
            .optional()
            .map((value) => SimpleWidgetKey(value)),
        ref0(parameterValue),
      ].toSequenceParser().map((value) => MapEntry(
            value[0] as SimpleWidgetKey,
            value[1],
          ));

  Parser<String> parameterKey() => word().plus().flatten();

  Parser<SimpleWidgetToken> parameterValue() => [
        [
          word().plus(),
          char('.'),
          word().plus().plusSeparated(char('.')).flatten(),
        ]
            .toSequenceParser()
            .flatten()
            .map((value) => SimpleWidgetLiteral(value)),
        [
          ref1(token, ref0(quote)),
          any()
              .starLazy(ref0(quote))
              .flatten()
              .map((value) => SimpleWidgetLiteral("'$value'")),
          ref1(token, ref0(quote)),
        ].toSequenceParser().pick(1).cast<SimpleWidgetToken>(),
        ref0(annotation),
      ].toChoiceParser();

  Parser quote() => char(r'\').not() & (char("'") | char('"'));

  Parser<List<SimpleWidgetAnnotation>> children() => [
        [
          connector().optional(),
          ref1(token, char('[')),
          ref0(annotation)
              .plusSeparated(ref1(token, char(',')))
              .map((value) => value.elements),
          ref1(token, char(',')).optional(),
          ref1(token, char(']')),
        ].toSequenceParser().pick(2).castList<SimpleWidgetAnnotation>(),
        [
          connector(),
          ref0(annotation),
        ]
            .toSequenceParser()
            .pick(1)
            .map((e) => [e])
            .castList<SimpleWidgetAnnotation>(),
      ].toChoiceParser();

  Parser connector() => ref1(token, char('>'));

  Parser token(Parser value) => [
        ref0(space),
        value,
        ref0(space),
      ].toSequenceParser().pick(1);

  Parser space() => (newline() | whitespace()).star();
}
