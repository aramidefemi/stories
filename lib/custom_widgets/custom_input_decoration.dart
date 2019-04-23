import 'package:flutter/material.dart';

@immutable
class CustomInputDecoration extends InputDecoration {
  /// Creates a bundle of the border, labels, icons, and styles used to
  /// decorate a Material Design text field.
  ///
  /// Unless specified by [ThemeData.inputDecorationTheme],
  /// [InputDecorator] defaults [isDense] to true, and [filled] to false,
  /// and [maxLines] to 1. The default border is an instance
  /// of [UnderlineInputBorder]. If [border] is [InputBorder.none] then
  /// no border is drawn.
  ///
  /// The [enabled] argument must not be null.
  ///
  /// Only one of [prefix] and [prefixText] can be specified.
  ///
  /// Similarly, only one of [suffix] and [suffixText] can be specified.
  const CustomInputDecoration({
    this.icon,
    this.labelText,
    this.labelStyle,
    this.helperText,
    this.helperStyle,
    this.hintText,
    this.hintStyle,
    this.hintMaxLines,
    this.errorText,
    this.errorStyle,
    this.errorMaxLines,
    this.hasFloatingPlaceholder = true,
    this.isDense,
    this.contentPadding,
    this.prefixIcon,
    this.prefix,
    this.prefixText,
    this.prefixStyle,
    this.suffixIcon,
    this.suffix,
    this.suffixText,
    this.suffixStyle,
    this.counter,
    this.counterText,
    this.counterStyle,
    this.filled,
    this.fillColor,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.border,
    this.enabled = true,
    this.semanticCounterText,
    this.alignLabelWithHint,
  })  : assert(enabled != null),
        assert(!(prefix != null && prefixText != null),
            'Declaring both prefix and prefixText is not supported.'),
        assert(!(suffix != null && suffixText != null),
            'Declaring both suffix and suffixText is not supported.'),
        isCollapsed = false;

  /// Defines an [InputDecorator] that is the same size as the input field.
  ///
  /// This type of input decoration does not include a border by default.
  ///
  /// Sets the [isCollapsed] property to true.
  const CustomInputDecoration.collapsed(
      {@required this.hintText,
      this.hasFloatingPlaceholder = true,
      this.hintStyle,
      this.filled = false,
      this.fillColor,
      this.border = InputBorder.none,
      this.enabled = true,
      this.suffix,
      this.labelText,
      this.labelStyle,
      this.suffixIcon,
      this.suffixText,
      this.suffixStyle})
      : assert(enabled != null),
        icon = null,
        // labelText = null,
        // labelStyle = null,
        helperText = null,
        helperStyle = null,
        hintMaxLines = null,
        errorText = null,
        errorStyle = null,
        errorMaxLines = null,
        isDense = false,
        contentPadding = EdgeInsets.zero,
        isCollapsed = true,
        prefixIcon = null,
        prefix = null,
        prefixText = null,
        prefixStyle = null,
        //  suffix = null,
        // suffixIcon = null,
        // suffixText = null,
        //  suffixStyle = null,
        counter = null,
        counterText = null,
        counterStyle = null,
        errorBorder = null,
        focusedBorder = null,
        focusedErrorBorder = null,
        disabledBorder = null,
        enabledBorder = null,
        semanticCounterText = null,
        alignLabelWithHint = false;

  /// An icon to show before the input field and outside of the decoration's
  /// container.
  ///
  /// The size and color of the icon is configured automatically using an
  /// [IconTheme] and therefore does not need to be explicitly given in the
  /// icon widget.
  ///
  /// The trailing edge of the icon is padded by 16dps.
  ///
  /// The decoration's container is the area which is filled if [filled] is
  /// true and bordered per the [border]. It's the area adjacent to
  /// [decoration.icon] and above the widgets that contain [helperText],
  /// [errorText], and [counterText].
  ///
  /// See [Icon], [ImageIcon].
  final Widget icon;

  /// Text that describes the input field.
  ///
  /// When the input field is empty and unfocused, the label is displayed on
  /// top of the input field (i.e., at the same location on the screen where
  /// text may be entered in the input field). When the input field receives
  /// focus (or if the field is non-empty), the label moves above (i.e.,
  /// vertically adjacent to) the input field.
  final String labelText;

  /// The style to use for the [labelText] when the label is above (i.e.,
  /// vertically adjacent to) the input field.
  ///
  /// When the [labelText] is on top of the input field, the text uses the
  /// [hintStyle] instead.
  ///
  /// If null, defaults to a value derived from the base [TextStyle] for the
  /// input field and the current [Theme].
  final TextStyle labelStyle;

  /// Text that provides context about the input [child]'s value, such as how
  /// the value will be used.
  ///
  /// If non-null, the text is displayed below the input [child], in the same
  /// location as [errorText]. If a non-null [errorText] value is specified then
  /// the helper text is not shown.
  final String helperText;

  /// The style to use for the [helperText].
  final TextStyle helperStyle;

  /// Text that suggests what sort of input the field accepts.
  ///
  /// Displayed on top of the input [child] (i.e., at the same location on the
  /// screen where text may be entered in the input [child]) when the input
  /// [isEmpty] and either (a) [labelText] is null or (b) the input has the focus.
  final String hintText;

  /// The style to use for the [hintText].
  ///
  /// Also used for the [labelText] when the [labelText] is displayed on
  /// top of the input field (i.e., at the same location on the screen where
  /// text may be entered in the input [child]).
  ///
  /// If null, defaults to a value derived from the base [TextStyle] for the
  /// input field and the current [Theme].
  final TextStyle hintStyle;

  /// The maximum number of lines the [hintText] can occupy.
  ///
  /// Defaults to the value of [TextField.maxLines] attribute.
  ///
  /// This value is passed along to the [Text.maxLines] attribute
  /// of the [Text] widget used to display the hint text. [TextOverflow.ellipsis] is
  /// used to handle the overflow when it is limited to single line.
  final int hintMaxLines;

  /// Text that appears below the input [child] and the border.
  ///
  /// If non-null, the border's color animates to red and the [helperText] is
  /// not shown.
  ///
  /// In a [TextFormField], this is overridden by the value returned from
  /// [TextFormField.validator], if that is not null.
  final String errorText;

  /// The style to use for the [errorText].
  ///
  /// If null, defaults of a value derived from the base [TextStyle] for the
  /// input field and the current [Theme].
  final TextStyle errorStyle;

  /// The maximum number of lines the [errorText] can occupy.
  ///
  /// Defaults to null, which means that the [errorText] will be limited
  /// to a single line with [TextOverflow.ellipsis].
  ///
  /// This value is passed along to the [Text.maxLines] attribute
  /// of the [Text] widget used to display the error.
  final int errorMaxLines;

  /// Whether the label floats on focus.
  ///
  /// If this is false, the placeholder disappears when the input has focus or
  /// inputted text.
  /// If this is true, the placeholder will rise to the top of the input when
  /// the input has focus or inputted text.
  ///
  /// Defaults to true.
  final bool hasFloatingPlaceholder;

  /// Whether the input [child] is part of a dense form (i.e., uses less vertical
  /// space).
  ///
  /// Defaults to false.
  final bool isDense;

  /// The padding for the input decoration's container.
  ///
  /// The decoration's container is the area which is filled if [filled] is
  /// true and bordered per the [border]. It's the area adjacent to
  /// [decoration.icon] and above the widgets that contain [helperText],
  /// [errorText], and [counterText].
  ///
  /// By default the `contentPadding` reflects [isDense] and the type of the
  /// [border]. If [isCollapsed] is true then `contentPadding` is
  /// [EdgeInsets.zero].
  final EdgeInsetsGeometry contentPadding;

  /// Whether the decoration is the same size as the input field.
  ///
  /// A collapsed decoration cannot have [labelText], [errorText], an [icon].
  ///
  /// To create a collapsed input decoration, use [InputDecoration..collapsed].
  final bool isCollapsed;

  /// An icon that that appears before the [prefix] or [prefixText] and before
  /// the editable part of the text field, within the decoration's container.
  ///
  /// The size and color of the prefix icon is configured automatically using an
  /// [IconTheme] and therefore does not need to be explicitly given in the
  /// icon widget.
  ///
  /// The prefix icon is constrained with a minimum size of 48px by 48px, but
  /// can be expanded beyond that. Anything larger than 24px will require
  /// additional padding to ensure it matches the material spec of 12px padding
  /// between the left edge of the input and leading edge of the prefix icon.
  /// The following snippet shows how to pad the leading edge of the prefix
  /// icon:
  ///
  /// ```dart
  /// prefixIcon: Padding(
  ///   padding: const EdgeInsetsDirectional.only(start: 12.0),
  ///   child: myIcon, // myIcon is a 48px-wide widget.
  /// )
  /// ```
  ///
  /// The decoration's container is the area which is filled if [filled] is
  /// true and bordered per the [border]. It's the area adjacent to
  /// [decoration.icon] and above the widgets that contain [helperText],
  /// [errorText], and [counterText].
  ///
  /// See also:
  ///
  ///  * [Icon] and [ImageIcon], which are typically used to show icons.
  ///  * [prefix] and [prefixText], which are other ways to show content
  ///    before the text field (but after the icon).
  ///  * [suffixIcon], which is the same but on the trailing edge.
  final Widget prefixIcon;

  /// Optional widget to place on the line before the input.
  ///
  /// This can be used, for example, to add some padding to text that would
  /// otherwise be specified using [prefixText], or to add a custom widget in
  /// front of the input. The widget's baseline is lined up with the input
  /// baseline.
  ///
  /// Only one of [prefix] and [prefixText] can be specified.
  ///
  /// The [prefix] appears after the [prefixIcon], if both are specified.
  ///
  /// See also:
  ///
  ///  * [suffix], the equivalent but on the trailing edge.
  final Widget prefix;

  /// Optional text prefix to place on the line before the input.
  ///
  /// Uses the [prefixStyle]. Uses [hintStyle] if [prefixStyle] isn't specified.
  /// The prefix text is not returned as part of the user's input.
  ///
  /// If a more elaborate prefix is required, consider using [prefix] instead.
  /// Only one of [prefix] and [prefixText] can be specified.
  ///
  /// The [prefixText] appears after the [prefixIcon], if both are specified.
  ///
  /// See also:
  ///
  ///  * [suffixText], the equivalent but on the trailing edge.
  final String prefixText;

  /// The style to use for the [prefixText].
  ///
  /// If null, defaults to the [hintStyle].
  ///
  /// See also:
  ///
  ///  * [suffixStyle], the equivalent but on the trailing edge.
  final TextStyle prefixStyle;

  /// An icon that that appears after the editable part of the text field and
  /// after the [suffix] or [suffixText], within the decoration's container.
  ///
  /// The size and color of the suffix icon is configured automatically using an
  /// [IconTheme] and therefore does not need to be explicitly given in the
  /// icon widget.
  ///
  /// The suffix icon is constrained with a minimum size of 48px by 48px, but
  /// can be expanded beyond that. Anything larger than 24px will require
  /// additional padding to ensure it matches the material spec of 12px padding
  /// between the right edge of the input and trailing edge of the prefix icon.
  /// The following snippet shows how to pad the trailing edge of the suffix
  /// icon:
  ///
  /// ```dart
  /// suffixIcon: Padding(
  ///   padding: const EdgeInsetsDirectional.only(end: 12.0),
  ///   child: myIcon, // myIcon is a 48px-wide widget.
  /// )
  /// ```
  ///
  /// The decoration's container is the area which is filled if [filled] is
  /// true and bordered per the [border]. It's the area adjacent to
  /// [decoration.icon] and above the widgets that contain [helperText],
  /// [errorText], and [counterText].
  ///
  /// See also:
  ///
  ///  * [Icon] and [ImageIcon], which are typically used to show icons.
  ///  * [suffix] and [suffixText], which are other ways to show content
  ///    after the text field (but before the icon).
  ///  * [prefixIcon], which is the same but on the leading edge.
  final Widget suffixIcon;

  /// Optional widget to place on the line after the input.
  ///
  /// This can be used, for example, to add some padding to the text that would
  /// otherwise be specified using [suffixText], or to add a custom widget after
  /// the input. The widget's baseline is lined up with the input baseline.
  ///
  /// Only one of [suffix] and [suffixText] can be specified.
  ///
  /// The [suffix] appears before the [suffixIcon], if both are specified.
  ///
  /// See also:
  ///
  ///  * [prefix], the equivalent but on the leading edge.
  final Widget suffix;

  /// Optional text suffix to place on the line after the input.
  ///
  /// Uses the [suffixStyle]. Uses [hintStyle] if [suffixStyle] isn't specified.
  /// The suffix text is not returned as part of the user's input.
  ///
  /// If a more elaborate suffix is required, consider using [suffix] instead.
  /// Only one of [suffix] and [suffixText] can be specified.
  ///
  /// The [suffixText] appears before the [suffixIcon], if both are specified.
  ///
  /// See also:
  ///
  ///  * [prefixText], the equivalent but on the leading edge.
  final String suffixText;

  /// The style to use for the [suffixText].
  ///
  /// If null, defaults to the [hintStyle].
  ///
  /// See also:
  ///
  ///  * [prefixStyle], the equivalent but on the leading edge.
  final TextStyle suffixStyle;

  /// Optional text to place below the line as a character count.
  ///
  /// Rendered using [counterStyle]. Uses [helperStyle] if [counterStyle] is
  /// null.
  ///
  /// The semantic label can be replaced by providing a [semanticCounterText].
  ///
  /// If null or an empty string and [counter] isn't specified, then nothing
  /// will appear in the counter's location.
  final String counterText;

  /// Optional custom counter widget to go in the place otherwise occupied by
  /// [counterText].  If this property is non null, then [counterText] is
  /// ignored.
  final Widget counter;

  /// The style to use for the [counterText].
  ///
  /// If null, defaults to the [helperStyle].
  final TextStyle counterStyle;

  /// If true the decoration's container is filled with [fillColor].
  ///
  /// Typically this field set to true if [border] is an
  /// [UnderlineInputBorder].
  ///
  /// The decoration's container is the area which is filled if [filled] is
  /// true and bordered per the [border]. It's the area adjacent to
  /// [decoration.icon] and above the widgets that contain [helperText],
  /// [errorText], and [counterText].
  ///
  /// This property is false by default.
  final bool filled;

  /// The color to fill the decoration's container with, if [filled] is true.
  ///
  /// By default the fillColor is based on the current [Theme].
  ///
  /// The decoration's container is the area which is filled if [filled] is
  /// true and bordered per the [border]. It's the area adjacent to
  /// [decoration.icon] and above the widgets that contain [helperText],
  /// [errorText], and [counterText].
  final Color fillColor;

  /// The border to display when the [InputDecorator] does not have the focus and
  /// is showing an error.
  ///
  /// See also:
  ///
  ///  * [InputDecorator.isFocused], which is true if the [InputDecorator]'s child
  ///    has the focus.
  ///  * [InputDecoration.errorText], the error shown by the [InputDecorator], if non-null.
  ///  * [border], for a description of where the [InputDecorator] border appears.
  ///  * [UnderlineInputBorder], an [InputDecorator] border which draws a horizontal
  ///    line at the bottom of the input decorator's container.
  ///  * [OutlineInputBorder], an [InputDecorator] border which draws a
  ///    rounded rectangle around the input decorator's container.
  ///  * [InputBorder.none], which doesn't draw a border.
  ///  * [focusedBorder], displayed when [InputDecorator.isFocused] is true
  ///    and [InputDecoration.errorText] is null.
  ///  * [focusedErrorBorder], displayed when [InputDecorator.isFocused] is true
  ///    and [InputDecoration.errorText] is non-null.
  ///  * [disabledBorder], displayed when [InputDecoration.enabled] is false
  ///    and [InputDecoration.errorText] is null.
  ///  * [enabledBorder], displayed when [InputDecoration.enabled] is true
  ///    and [InputDecoration.errorText] is null.
  final InputBorder errorBorder;

  /// The border to display when the [InputDecorator] has the focus and is not
  /// showing an error.
  ///
  /// See also:
  ///
  ///  * [InputDecorator.isFocused], which is true if the [InputDecorator]'s child
  ///    has the focus.
  ///  * [InputDecoration.errorText], the error shown by the [InputDecorator], if non-null.
  ///  * [border], for a description of where the [InputDecorator] border appears.
  ///  * [UnderlineInputBorder], an [InputDecorator] border which draws a horizontal
  ///    line at the bottom of the input decorator's container.
  ///  * [OutlineInputBorder], an [InputDecorator] border which draws a
  ///    rounded rectangle around the input decorator's container.
  ///  * [InputBorder.none], which doesn't draw a border.
  ///  * [errorBorder], displayed when [InputDecorator.isFocused] is false
  ///    and [InputDecoration.errorText] is non-null.
  ///  * [focusedErrorBorder], displayed when [InputDecorator.isFocused] is true
  ///    and [InputDecoration.errorText] is non-null.
  ///  * [disabledBorder], displayed when [InputDecoration.enabled] is false
  ///    and [InputDecoration.errorText] is null.
  ///  * [enabledBorder], displayed when [InputDecoration.enabled] is true
  ///    and [InputDecoration.errorText] is null.
  final InputBorder focusedBorder;

  /// The border to display when the [InputDecorator] has the focus and is
  /// showing an error.
  ///
  /// See also:
  ///
  ///  * [InputDecorator.isFocused], which is true if the [InputDecorator]'s child
  ///    has the focus.
  ///  * [InputDecoration.errorText], the error shown by the [InputDecorator], if non-null.
  ///  * [border], for a description of where the [InputDecorator] border appears.
  ///  * [UnderlineInputBorder], an [InputDecorator] border which draws a horizontal
  ///    line at the bottom of the input decorator's container.
  ///  * [OutlineInputBorder], an [InputDecorator] border which draws a
  ///    rounded rectangle around the input decorator's container.
  ///  * [InputBorder.none], which doesn't draw a border.
  ///  * [errorBorder], displayed when [InputDecorator.isFocused] is false
  ///    and [InputDecoration.errorText] is non-null.
  ///  * [focusedBorder], displayed when [InputDecorator.isFocused] is true
  ///    and [InputDecoration.errorText] is null.
  ///  * [disabledBorder], displayed when [InputDecoration.enabled] is false
  ///    and [InputDecoration.errorText] is null.
  ///  * [enabledBorder], displayed when [InputDecoration.enabled] is true
  ///    and [InputDecoration.errorText] is null.
  final InputBorder focusedErrorBorder;

  /// The border to display when the [InputDecorator] is disabled and is not
  /// showing an error.
  ///
  /// See also:
  ///
  ///  * [InputDecoration.enabled], which is false if the [InputDecorator] is disabled.
  ///  * [InputDecoration.errorText], the error shown by the [InputDecorator], if non-null.
  ///  * [border], for a description of where the [InputDecorator] border appears.
  ///  * [UnderlineInputBorder], an [InputDecorator] border which draws a horizontal
  ///    line at the bottom of the input decorator's container.
  ///  * [OutlineInputBorder], an [InputDecorator] border which draws a
  ///    rounded rectangle around the input decorator's container.
  ///  * [InputBorder.none], which doesn't draw a border.
  ///  * [errorBorder], displayed when [InputDecorator.isFocused] is false
  ///    and [InputDecoration.errorText] is non-null.
  ///  * [focusedBorder], displayed when [InputDecorator.isFocused] is true
  ///    and [InputDecoration.errorText] is null.
  ///  * [focusedErrorBorder], displayed when [InputDecorator.isFocused] is true
  ///    and [InputDecoration.errorText] is non-null.
  ///  * [enabledBorder], displayed when [InputDecoration.enabled] is true
  ///    and [InputDecoration.errorText] is null.
  final InputBorder disabledBorder;

  /// The border to display when the [InputDecorator] is enabled and is not
  /// showing an error.
  ///
  /// See also:
  ///
  ///  * [InputDecoration.enabled], which is false if the [InputDecorator] is disabled.
  ///  * [InputDecoration.errorText], the error shown by the [InputDecorator], if non-null.
  ///  * [border], for a description of where the [InputDecorator] border appears.
  ///  * [UnderlineInputBorder], an [InputDecorator] border which draws a horizontal
  ///    line at the bottom of the input decorator's container.
  ///  * [OutlineInputBorder], an [InputDecorator] border which draws a
  ///    rounded rectangle around the input decorator's container.
  ///  * [InputBorder.none], which doesn't draw a border.
  ///  * [errorBorder], displayed when [InputDecorator.isFocused] is false
  ///    and [InputDecoration.errorText] is non-null.
  ///  * [focusedBorder], displayed when [InputDecorator.isFocused] is true
  ///    and [InputDecoration.errorText] is null.
  ///  * [focusedErrorBorder], displayed when [InputDecorator.isFocused] is true
  ///    and [InputDecoration.errorText] is non-null.
  ///  * [disabledBorder], displayed when [InputDecoration.enabled] is false
  ///    and [InputDecoration.errorText] is null.
  final InputBorder enabledBorder;

  /// The shape of the border to draw around the decoration's container.
  ///
  /// This border's [InputBorder.borderSide], i.e. the border's color and width,
  /// will be overridden to reflect the input decorator's state. Only the
  /// border's shape is used. If custom  [BorderSide] values are desired for
  /// a given state, all four borders – [errorBorder], [focusedBorder],
  /// [enabledBorder], [disabledBorder] – must be set.
  ///
  /// The decoration's container is the area which is filled if [filled] is
  /// true and bordered per the [border]. It's the area adjacent to
  /// [InputDecoration.icon] and above the widgets that contain
  /// [InputDecoration.helperText], [InputDecoration.errorText], and
  /// [InputDecoration.counterText].
  ///
  /// The border's bounds, i.e. the value of `border.getOuterPath()`, define
  /// the area to be filled.
  ///
  /// This property is only used when the appropriate one of [errorBorder],
  /// [focusedBorder], [focusedErrorBorder], [disabledBorder], or [enabledBorder]
  /// is not specified. This border's [InputBorder.borderSide] property is
  /// configured by the InputDecorator, depending on the values of
  /// [InputDecoration.errorText], [InputDecoration.enabled],
  /// [InputDecorator.isFocused] and the current [Theme].
  ///
  /// Typically one of [UnderlineInputBorder] or [OutlineInputBorder].
  /// If null, InputDecorator's default is `const UnderlineInputBorder()`.
  ///
  /// See also:
  ///
  ///  * [InputBorder.none], which doesn't draw a border.
  ///  * [UnderlineInputBorder], which draws a horizontal line at the
  ///    bottom of the input decorator's container.
  ///  * [OutlineInputBorder], an [InputDecorator] border which draws a
  ///    rounded rectangle around the input decorator's container.
  final InputBorder border;

  /// If false [helperText],[errorText], and [counterText] are not displayed,
  /// and the opacity of the remaining visual elements is reduced.
  ///
  /// This property is true by default.
  final bool enabled;

  /// A semantic label for the [counterText].
  ///
  /// Defaults to null.
  ///
  /// If provided, this replaces the semantic label of the [counterText].
  final String semanticCounterText;

  /// Typically set to true when the [InputDecorator] contains a multiline
  /// [TextField] ([TextField.maxLines] is null or > 1) to override the default
  /// behavior of aligning the label with the center of the [TextField].
  ///
  /// Defaults to false.
  final bool alignLabelWithHint;

  /// Creates a copy of this input decoration with the given fields replaced
  /// by the new values.
  ///
  /// Always sets [isCollapsed] to false.
  InputDecoration copyWith({
    Widget icon,
    String labelText,
    TextStyle labelStyle,
    String helperText,
    TextStyle helperStyle,
    String hintText,
    TextStyle hintStyle,
    int hintMaxLines,
    String errorText,
    TextStyle errorStyle,
    int errorMaxLines,
    bool hasFloatingPlaceholder,
    bool isDense,
    EdgeInsetsGeometry contentPadding,
    Widget prefixIcon,
    Widget prefix,
    String prefixText,
    TextStyle prefixStyle,
    Widget suffixIcon,
    Widget suffix,
    String suffixText,
    TextStyle suffixStyle,
    Widget counter,
    String counterText,
    TextStyle counterStyle,
    bool filled,
    Color fillColor,
    InputBorder errorBorder,
    InputBorder focusedBorder,
    InputBorder focusedErrorBorder,
    InputBorder disabledBorder,
    InputBorder enabledBorder,
    InputBorder border,
    bool enabled,
    String semanticCounterText,
    bool alignLabelWithHint,
  }) {
    return InputDecoration(
      icon: icon ?? this.icon,
      labelText: labelText ?? this.labelText,
      labelStyle: labelStyle ?? this.labelStyle,
      helperText: helperText ?? this.helperText,
      helperStyle: helperStyle ?? this.helperStyle,
      hintText: hintText ?? this.hintText,
      hintStyle: hintStyle ?? this.hintStyle,
      hintMaxLines: hintMaxLines ?? this.hintMaxLines,
      errorText: errorText ?? this.errorText,
      errorStyle: errorStyle ?? this.errorStyle,
      errorMaxLines: errorMaxLines ?? this.errorMaxLines,
      hasFloatingPlaceholder:
          hasFloatingPlaceholder ?? this.hasFloatingPlaceholder,
      isDense: isDense ?? this.isDense,
      contentPadding: contentPadding ?? this.contentPadding,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      prefix: prefix ?? this.prefix,
      prefixText: prefixText ?? this.prefixText,
      prefixStyle: prefixStyle ?? this.prefixStyle,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      suffix: suffix ?? this.suffix,
      suffixText: suffixText ?? this.suffixText,
      suffixStyle: suffixStyle ?? this.suffixStyle,
      counter: counter ?? this.counter,
      counterText: counterText ?? this.counterText,
      counterStyle: counterStyle ?? this.counterStyle,
      filled: filled ?? this.filled,
      fillColor: fillColor ?? this.fillColor,
      errorBorder: errorBorder ?? this.errorBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      focusedErrorBorder: focusedErrorBorder ?? this.focusedErrorBorder,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      enabledBorder: enabledBorder ?? this.enabledBorder,
      border: border ?? this.border,
      enabled: enabled ?? this.enabled,
      semanticCounterText: semanticCounterText ?? this.semanticCounterText,
      alignLabelWithHint: alignLabelWithHint ?? this.alignLabelWithHint,
    );
  }

  /// Used by widgets like [TextField] and [InputDecorator] to create a new
  /// [InputDecoration] with default values taken from the [theme].
  ///
  /// Only null valued properties from this [InputDecoration] are replaced
  /// by the corresponding values from [theme].
  InputDecoration applyDefaults(InputDecorationTheme theme) {
    return copyWith(
      labelStyle: labelStyle ?? theme.labelStyle,
      helperStyle: helperStyle ?? theme.helperStyle,
      hintStyle: hintStyle ?? theme.hintStyle,
      errorStyle: errorStyle ?? theme.errorStyle,
      errorMaxLines: errorMaxLines ?? theme.errorMaxLines,
      hasFloatingPlaceholder:
          hasFloatingPlaceholder ?? theme.hasFloatingPlaceholder,
      isDense: isDense ?? theme.isDense,
      contentPadding: contentPadding ?? theme.contentPadding,
      prefixStyle: prefixStyle ?? theme.prefixStyle,
      suffixStyle: suffixStyle ?? theme.suffixStyle,
      counterStyle: counterStyle ?? theme.counterStyle,
      filled: filled ?? theme.filled,
      fillColor: fillColor ?? theme.fillColor,
      errorBorder: errorBorder ?? theme.errorBorder,
      focusedBorder: focusedBorder ?? theme.focusedBorder,
      focusedErrorBorder: focusedErrorBorder ?? theme.focusedErrorBorder,
      disabledBorder: disabledBorder ?? theme.disabledBorder,
      enabledBorder: enabledBorder ?? theme.enabledBorder,
      border: border ?? theme.border,
      alignLabelWithHint: alignLabelWithHint ?? theme.alignLabelWithHint,
    );
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final InputDecoration typedOther = other;
    return typedOther.icon == icon &&
        typedOther.labelText == labelText &&
        typedOther.labelStyle == labelStyle &&
        typedOther.helperText == helperText &&
        typedOther.helperStyle == helperStyle &&
        typedOther.hintText == hintText &&
        typedOther.hintStyle == hintStyle &&
        typedOther.hintMaxLines == hintMaxLines &&
        typedOther.errorText == errorText &&
        typedOther.errorStyle == errorStyle &&
        typedOther.errorMaxLines == errorMaxLines &&
        typedOther.hasFloatingPlaceholder == hasFloatingPlaceholder &&
        typedOther.isDense == isDense &&
        typedOther.contentPadding == contentPadding &&
        typedOther.isCollapsed == isCollapsed &&
        typedOther.prefixIcon == prefixIcon &&
        typedOther.prefix == prefix &&
        typedOther.prefixText == prefixText &&
        typedOther.prefixStyle == prefixStyle &&
        typedOther.suffixIcon == suffixIcon &&
        typedOther.suffix == suffix &&
        typedOther.suffixText == suffixText &&
        typedOther.suffixStyle == suffixStyle &&
        typedOther.counter == counter &&
        typedOther.counterText == counterText &&
        typedOther.counterStyle == counterStyle &&
        typedOther.filled == filled &&
        typedOther.fillColor == fillColor &&
        typedOther.errorBorder == errorBorder &&
        typedOther.focusedBorder == focusedBorder &&
        typedOther.focusedErrorBorder == focusedErrorBorder &&
        typedOther.disabledBorder == disabledBorder &&
        typedOther.enabledBorder == enabledBorder &&
        typedOther.border == border &&
        typedOther.enabled == enabled &&
        typedOther.semanticCounterText == semanticCounterText &&
        typedOther.alignLabelWithHint == alignLabelWithHint;
  }

  @override
  int get hashCode {
    // Split into several hashValues calls because the hashValues function is
    // limited to 20 parameters.
    return hashValues(
      icon,
      labelText,
      labelStyle,
      helperText,
      helperStyle,
      hintText,
      hintStyle,
      hintMaxLines,
      errorText,
      errorStyle,
      errorMaxLines,
      hasFloatingPlaceholder,
      isDense,
      contentPadding,
      isCollapsed,
      filled,
      fillColor,
      border,
      enabled,
      hashValues(
        prefixIcon,
        prefix,
        prefixText,
        prefixStyle,
        suffixIcon,
        suffix,
        suffixText,
        suffixStyle,
        counter,
        counterText,
        counterStyle,
        filled,
        fillColor,
        errorBorder,
        focusedBorder,
        focusedErrorBorder,
        disabledBorder,
        enabledBorder,
        border,
        hashValues(
          enabled,
          semanticCounterText,
          alignLabelWithHint,
        ),
      ),
    );
  }

  @override
  String toString() {
    final List<String> description = <String>[];
    if (icon != null) description.add('icon: $icon');
    if (labelText != null) description.add('labelText: "$labelText"');
    if (helperText != null) description.add('helperText: "$helperText"');
    if (hintText != null) description.add('hintText: "$hintText"');
    if (hintMaxLines != null) description.add('hintMaxLines: "$hintMaxLines"');
    if (errorText != null) description.add('errorText: "$errorText"');
    if (errorStyle != null) description.add('errorStyle: "$errorStyle"');
    if (errorMaxLines != null)
      description.add('errorMaxLines: "$errorMaxLines"');
    if (hasFloatingPlaceholder == false)
      description.add('hasFloatingPlaceholder: false');
    if (isDense ?? false) description.add('isDense: $isDense');
    if (contentPadding != null)
      description.add('contentPadding: $contentPadding');
    if (isCollapsed) description.add('isCollapsed: $isCollapsed');
    if (prefixIcon != null) description.add('prefixIcon: $prefixIcon');
    if (prefix != null) description.add('prefix: $prefix');
    if (prefixText != null) description.add('prefixText: $prefixText');
    if (prefixStyle != null) description.add('prefixStyle: $prefixStyle');
    if (suffixIcon != null) description.add('suffixIcon: $suffixIcon');
    if (suffix != null) description.add('suffix: $suffix');
    if (suffixText != null) description.add('suffixText: $suffixText');
    if (suffixStyle != null) description.add('suffixStyle: $suffixStyle');
    if (counter != null) description.add('counter: $counter');
    if (counterText != null) description.add('counterText: $counterText');
    if (counterStyle != null) description.add('counterStyle: $counterStyle');
    if (filled == true) // filled == null same as filled == false
      description.add('filled: true');
    if (fillColor != null) description.add('fillColor: $fillColor');
    if (errorBorder != null) description.add('errorBorder: $errorBorder');
    if (focusedBorder != null) description.add('focusedBorder: $focusedBorder');
    if (focusedErrorBorder != null)
      description.add('focusedErrorBorder: $focusedErrorBorder');
    if (disabledBorder != null)
      description.add('disabledBorder: $disabledBorder');
    if (enabledBorder != null) description.add('enabledBorder: $enabledBorder');
    if (border != null) description.add('border: $border');
    if (!enabled) description.add('enabled: false');
    if (semanticCounterText != null)
      description.add('semanticCounterText: $semanticCounterText');
    if (alignLabelWithHint != null)
      description.add('alignLabelWithHint: $alignLabelWithHint');
    return 'InputDecoration(${description.join(', ')})';
  }
}
