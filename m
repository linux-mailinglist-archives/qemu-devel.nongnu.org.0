Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0BD41BAFC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 01:27:06 +0200 (CEST)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVMV7-0004yl-Ov
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 19:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVMUC-0004EG-SZ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 19:26:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVMU6-0003dZ-Ow
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 19:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632871561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GSZYundpgF3Ps1NY75TWsqLfOe84RzRMjdqu/vpIAro=;
 b=SHLZXL7plJmLHfssl3PpDfVIR3PQOpFeVbdVcgWZnLW7+DWEs2KB5LiR1gGqA/wTOnVfmu
 25pxzlz84ZsAZQuPZul6VA/PGkOZ43shzD7WzIZiKVnRdwgkRFf3mvlB/ecX0oNOX9sQ4b
 d7KtD8Lv2qE/+BwbnM6M/rFEXGNHDMU=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-54fQLA4eM1uaGqv5EZt3gw-1; Tue, 28 Sep 2021 19:25:42 -0400
X-MC-Unique: 54fQLA4eM1uaGqv5EZt3gw-1
Received: by mail-vk1-f200.google.com with SMTP id
 i2-20020a1fea02000000b00297965f4754so253084vkh.2
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 16:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GSZYundpgF3Ps1NY75TWsqLfOe84RzRMjdqu/vpIAro=;
 b=dwsUnLq7KKyZXLqbVq+Jc1Si5tNDTbifMHdz9z10+wDWNmrvaKMBUqWHPTfTfY4Xn4
 GabFre5BFNHdasPETbr07FPF7kjKnligoZJ0+o3zIngGnyNPv7eJ9MeVf5DF92Gd+soM
 zZcxYs7Iv68deoKVjmcHTXrjs8rDSqXMSlTnSKV0GcTillhc50zT1sH0QEIJGXRzJoxy
 rFbnoYscA98a5HfErRZwPOLQpOdRDZlmhfBCJ//LwIO0D/7NIgCBDe0DmBaFmKbOlHh3
 hE5AMYn7MkXpteqsiSIXOJ7AmJD3Rfxr9DrnzNpXemeBF5KQVmUEdPqhtxeiA3C/600D
 R6/Q==
X-Gm-Message-State: AOAM532XdHFCyRPBTWrEh/nAI6HXyp7HSAr+H+F8SyZpAkDYJdmS9u2V
 x4q21guKA9yWmRZc4znHZTkLUF0Au3OKmviy+erC3PDLSBOX/OTeEim3/FKi246hmw8YgtqZi0K
 FWPK8cfE2OvHbfwKtaXjMNJP63CGPc+k=
X-Received: by 2002:ab0:3c89:: with SMTP id a9mr8320747uax.32.1632871541633;
 Tue, 28 Sep 2021 16:25:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLN8eylKu1KY2ABKKa021mZ0U921DTBQG3ZdOyMRu3/Di6qB6z59gU87rkGVM3P+x0zcfzFQhFdfMSvjk91is=
X-Received: by 2002:ab0:3c89:: with SMTP id a9mr8320676uax.32.1632871540639;
 Tue, 28 Sep 2021 16:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210520225710.168356-1-jsnow@redhat.com>
 <20210520225710.168356-4-jsnow@redhat.com>
 <87o8943brt.fsf@dusky.pond.sub.org>
In-Reply-To: <87o8943brt.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 28 Sep 2021 19:25:29 -0400
Message-ID: <CAFn=p-Y4uqnLEvemPkTwYAdnFfoPLojyjRsWbD2zsEBpfvpqhQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] qapi/parser: add type hint annotations (QAPIDoc)
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000024e01f05cd1688c0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000024e01f05cd1688c0
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 7, 2021 at 6:44 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > Annotations do not change runtime behavior.
> >
> > This commit adds mostly annotations, but uses a TYPE_CHECKING runtime
> > check to conditionally import dependencies, which only triggers during
> > runs of mypy.
>
> Please add a reference to
> https://mypy.readthedocs.io/en/latest/runtime_troubles.html#import-cycles
>
>
OK.


> > Signed-off-by: John Snow <jsnow@redhat.com>
> >
> > ---
> >
> > TopLevelExpr, an idea from previous drafts, makes a return here in order
> > to give a semantic meaning to check_expr(). The type is intended to be
> > used more in forthcoming commits (pt5c), but I opted to include it now
> > instead of creating yet-another Dict[str, object] type hint that I would
> > forget to change later.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  scripts/qapi/parser.py | 77 ++++++++++++++++++++++++++----------------
> >  1 file changed, 48 insertions(+), 29 deletions(-)
> >
> > diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> > index 3ddde318376..b1e2fa5c577 100644
> > --- a/scripts/qapi/parser.py
> > +++ b/scripts/qapi/parser.py
> > @@ -18,6 +18,7 @@
> >  import os
> >  import re
> >  from typing import (
> > +    TYPE_CHECKING,
> >      Dict,
> >      List,
> >      Optional,
> > @@ -30,6 +31,15 @@
> >  from .source import QAPISourceInfo
> >
> >
> > +if TYPE_CHECKING:
> > +    # pylint: disable=cyclic-import
> > +    # TODO: Remove cycle. [schema -> expr -> parser -> schema]
>

WRT this todo: you mentioned that you'd prefer having some idea or plan for
how to eliminate the cycle in order to let this band-aid fly. How about
adding a 'doc' member to e.g. QAPISchemaFeature and doing the connection
entirely inside of schema.py, and dropping connect_member() and
connect_feature()?

Would that be serviceable?


> > +    from .schema import QAPISchemaFeature, QAPISchemaMember
> > +
> > +
> > +#: Represents a single Top Level QAPI schema expression.
> > +TopLevelExpr = Dict[str, object]
>
> Related: _ExprValue below, and _JSONObject in expr.py.  The latter's
> comment gives the best rationale (except I don't get "the purpose of
> this module is to interrogate that type").
>
>
in expr.py, the purpose of that module (expr) is explicitly to interrogate
(check, validate) the shape of arbitrary JSON objects. I am saying that a
more strict definition specifically here in expr.py is not necessary
because the entire purpose of expr.py is to, at runtime, verify the shape
of any such variables that might be annotated that way. I am drawing some
distinction to introspect.py, where we're generating that data ourselves --
the stronger types are more viable there, because we know what they are
already.
(again, sorry about mypy's lack of recursive typing, I hate it too, I
promise)


> I think we'd like to have
>
> * A recursive type for JSON value (in our bastardized version of JSON)
>
>   This is Union of bool, str, List[Self], Dict[str, Self].  It's what
>   .get_expr() returns.
>
>   Since mypy can't do recursive, we approximate with _ExprValue.
>
> * A recursive type for JSON object
>
>   This is the Dict branch of the above.  It's what check_keys() &
>   friends take as argument.
>
>   We approximate with _JSONObject.
>
>   Same for the List branch would make sense if we had a use for the
>   type.
>
> * A recursive type for TOP-LEVEL-EXPR
>
>   Actually the same type as the previous one, to be used only for the
>   schema's top-level expressions.  It's the elements of
>   QAPISchemaParser.exprs[], and what check_exprs() takes as argument.
>
>   We approximate with TopLevelExpr, but so far use it only for
>   check_exprs().
>
>   Doesn't really improve type checking, but may serve as documentation.
>
>
That's the intended effect here -- to help highlight which functions
operate on those top-level expressions, and which might be invoked in more
arbitrary cases.
Consider also a hypothetical TOP-LEVEL-EXPR that is actually a bona-fide
object with additional metadata, too. In these cases, the type really will
be different.


> Shouldn't these types be all defined in one place, namely right here?
> Bonus: we need to explain the mypy sadness just once then.
>
> Shouldn't their names be more systematic?  _ExprValue, _JSONObject and
> TopLevelExpr hardly suggest any relation...
>
>
I drop _JSONObject in pt5c, it was a stop-gap. For the rest, I'll see about
a more rigorous consolidation now that we're this far in.

pt5c was intended as a "cleanup" step that did some of that consolidation
of nearly-redundant types; but I wanted all of parser.py under the mypy gun
*first*.
Will you take a raincheck here and we'll focus on the consolidation in the
next series? I agree it's worth doing.

(I can add a 'FIXME' that will 100% need to be fixed before I move
scripts/qapi under python/qemu/qapi -- the linter config there prohibits
them, so you can be sure I can't ignore it.)


> > +
> >  # Return value alias for get_expr().
> >  _ExprValue = Union[List[object], Dict[str, object], str, bool]
> >
> > @@ -447,7 +457,8 @@ class QAPIDoc:
> >      """
> >
> >      class Section:
> > -        def __init__(self, parser, name=None, indent=0):
> > +        def __init__(self, parser: QAPISchemaParser,
> > +                     name: Optional[str] = None, indent: int = 0):
> >              # parser, for error messages about indentation
> >              self._parser = parser
> >              # optional section name (argument/member or section name)
> > @@ -459,7 +470,7 @@ def __init__(self, parser, name=None, indent=0):
> >          def __bool__(self) -> bool:
> >              return bool(self.name or self.text)
> >
> > -        def append(self, line):
> > +        def append(self, line: str) -> None:
> >              # Strip leading spaces corresponding to the expected indent
> level
> >              # Blank lines are always OK.
> >              if line:
> > @@ -474,39 +485,40 @@ def append(self, line):
> >              self.text += line.rstrip() + '\n'
> >
> >      class ArgSection(Section):
> > -        def __init__(self, parser, name, indent=0):
> > +        def __init__(self, parser: QAPISchemaParser,
> > +                     name: Optional[str] = None, indent: int = 0):
>
> Why not name: str?  All callers pass a str argument...
>
>
Maybe a holdover from when I was trying to stick to LSP for initializers. I
think I have since learned that mypy will only whine about LSP if you hold
pointers to the initializer to be invoked in factory functions. I'll fix it
and we'll worry about the LSP warnings if they ever decide to show up.


> >              super().__init__(parser, name, indent)
> > -            self.member = None
> > +            self.member: Optional['QAPISchemaMember'] = None
>
> I guess you need to quote 'QAPISchemaMember', because we actually import
> it only if TYPE_CHECKING.  More of the same below.
>
>
Yep. Future Python versions may be better about this (You don't have to
quote any types, ever -- they're parsed in a later pass) but we just don't
have that luxury yet.

See https://www.python.org/dev/peps/pep-0563/
Also see
https://www.reddit.com/r/Python/comments/muyz5h/pep_563_getting_rolled_back_from_python_310/
for some discussion on why this feature was not made the default for 3.10

(TLDR: It breaks a library called pydantic that largely does exactly what
expr.py does, using type annotations to define the valid shapes of objects.
I'd love to use it in QAPI, actually, ... a discussion for yet another day.)


> >
> > -        def connect(self, member):
> > +        def connect(self, member: 'QAPISchemaMember') -> None:
> >              self.member = member
> >
> > -    def __init__(self, parser, info):
> > +    def __init__(self, parser: QAPISchemaParser, info: QAPISourceInfo):
> >          # self._parser is used to report errors with QAPIParseError.
> The
> >          # resulting error position depends on the state of the parser.
> >          # It happens to be the beginning of the comment.  More or less
> >          # servicable, but action at a distance.
> >          self._parser = parser
> >          self.info = info
> > -        self.symbol = None
> > +        self.symbol: Optional[str] = None
> >          self.body = QAPIDoc.Section(parser)
> >          # dict mapping parameter name to ArgSection
> > -        self.args = OrderedDict()
> > -        self.features = OrderedDict()
> > +        self.args: Dict[str, QAPIDoc.ArgSection] = OrderedDict()
> > +        self.features: Dict[str, QAPIDoc.ArgSection] = OrderedDict()
> >          # a list of Section
> > -        self.sections = []
> > +        self.sections: List[QAPIDoc.Section] = []
> >          # the current section
> >          self._section = self.body
> >          self._append_line = self._append_body_line
> >
> > -    def has_section(self, name):
> > +    def has_section(self, name: str) -> bool:
> >          """Return True if we have a section with this name."""
> >          for i in self.sections:
> >              if i.name == name:
> >                  return True
> >          return False
> >
> > -    def append(self, line):
> > +    def append(self, line: str) -> None:
> >          """
> >          Parse a comment line and add it to the documentation.
> >
> > @@ -527,18 +539,18 @@ def append(self, line):
> >          line = line[1:]
> >          self._append_line(line)
> >
> > -    def end_comment(self):
> > +    def end_comment(self) -> None:
> >          self._end_section()
> >
> >      @staticmethod
> > -    def _is_section_tag(name):
> > +    def _is_section_tag(name: str) -> bool:
> >          return name in ('Returns:', 'Since:',
> >                          # those are often singular or plural
> >                          'Note:', 'Notes:',
> >                          'Example:', 'Examples:',
> >                          'TODO:')
> >
> > -    def _append_body_line(self, line):
> > +    def _append_body_line(self, line: str) -> None:
> >          """
> >          Process a line of documentation text in the body section.
> >
> > @@ -578,7 +590,7 @@ def _append_body_line(self, line):
> >              # This is a free-form documentation block
> >              self._append_freeform(line)
> >
> > -    def _append_args_line(self, line):
> > +    def _append_args_line(self, line: str) -> None:
> >          """
> >          Process a line of documentation text in an argument section.
> >
> > @@ -624,7 +636,7 @@ def _append_args_line(self, line):
> >
> >          self._append_freeform(line)
> >
> > -    def _append_features_line(self, line):
> > +    def _append_features_line(self, line: str) -> None:
> >          name = line.split(' ', 1)[0]
> >
> >          if name.startswith('@') and name.endswith(':'):
> > @@ -656,7 +668,7 @@ def _append_features_line(self, line):
> >
> >          self._append_freeform(line)
> >
> > -    def _append_various_line(self, line):
> > +    def _append_various_line(self, line: str) -> None:
> >          """
> >          Process a line of documentation text in an additional section.
> >
> > @@ -692,7 +704,11 @@ def _append_various_line(self, line):
> >
> >          self._append_freeform(line)
> >
> > -    def _start_symbol_section(self, symbols_dict, name, indent):
> > +    def _start_symbol_section(
> > +            self,
> > +            symbols_dict: Dict[str, 'QAPIDoc.ArgSection'],
>
> The need to quote this within the very class that defines it is
> annoying.
>

Yep. Python has weird scoping rules for nested classes. In my own hobby
code I've largely started avoiding ever using them, because they don't seem
to be worth the trouble.

Long story short: the name isn't available yet because at the time this
annotation is evaluated, we're still in the middle of defining it. I wish
there was a syntax for $thisclass for a nascent self-reference, but alas.

(Yes, I dislike it too. Nothing I can do about it, to my knowledge.)


>
> > +            name: str,
> > +            indent: int) -> None:
> >          # FIXME invalid names other than the empty string aren't flagged
> >          if not name:
> >              raise QAPIParseError(self._parser, "invalid parameter name")
> > @@ -704,13 +720,14 @@ def _start_symbol_section(self, symbols_dict,
> name, indent):
> >          self._section = QAPIDoc.ArgSection(self._parser, name, indent)
> >          symbols_dict[name] = self._section
> >
> > -    def _start_args_section(self, name, indent):
> > +    def _start_args_section(self, name: str, indent: int) -> None:
> >          self._start_symbol_section(self.args, name, indent)
> >
> > -    def _start_features_section(self, name, indent):
> > +    def _start_features_section(self, name: str, indent: int) -> None:
> >          self._start_symbol_section(self.features, name, indent)
> >
> > -    def _start_section(self, name=None, indent=0):
> > +    def _start_section(self, name: Optional[str] = None,
> > +                       indent: int = 0) -> None:
> >          if name in ('Returns', 'Since') and self.has_section(name):
> >              raise QAPIParseError(self._parser,
> >                                   "duplicated '%s' section" % name)
> > @@ -718,7 +735,7 @@ def _start_section(self, name=None, indent=0):
> >          self._section = QAPIDoc.Section(self._parser, name, indent)
> >          self.sections.append(self._section)
> >
> > -    def _end_section(self):
> > +    def _end_section(self) -> None:
> >          if self._section:
> >              text = self._section.text = self._section.text.strip()
> >              if self._section.name and (not text or text.isspace()):
> > @@ -727,7 +744,7 @@ def _end_section(self):
> >                      "empty doc section '%s'" % self._section.name)
> >              self._section = QAPIDoc.Section(self._parser)
> >
> > -    def _append_freeform(self, line):
> > +    def _append_freeform(self, line: str) -> None:
> >          match = re.match(r'(@\S+:)', line)
> >          if match:
> >              raise QAPIParseError(self._parser,
> > @@ -735,28 +752,30 @@ def _append_freeform(self, line):
> >                                   % match.group(1))
> >          self._section.append(line)
> >
> > -    def connect_member(self, member):
> > +    def connect_member(self, member: 'QAPISchemaMember') -> None:
> >          if member.name not in self.args:
> >              # Undocumented TODO outlaw
> >              self.args[member.name] = QAPIDoc.ArgSection(self._parser,
> >                                                          member.name)
> >          self.args[member.name].connect(member)
> >
> > -    def connect_feature(self, feature):
> > +    def connect_feature(self, feature: 'QAPISchemaFeature') -> None:
> >          if feature.name not in self.features:
> >              raise QAPISemError(feature.info,
> >                                 "feature '%s' lacks documentation"
> >                                 % feature.name)
> >          self.features[feature.name].connect(feature)
> >
> > -    def check_expr(self, expr):
> > +    def check_expr(self, expr: TopLevelExpr) -> None:
> >          if self.has_section('Returns') and 'command' not in expr:
> >              raise QAPISemError(self.info,
> >                                 "'Returns:' is only valid for commands")
> >
> > -    def check(self):
> > +    def check(self) -> None:
> >
> > -        def check_args_section(args, what):
> > +        def check_args_section(
> > +                args: Dict[str, QAPIDoc.ArgSection], what: str
> > +        ) -> None:
>
> This is the fourth use of Dict[str, QAPIDoc.ArgSection].  Still fine,
> but if we acquire even more, we should consider giving it a name.
>
>
If they share something in common that makes it name-able, sure. For now:
eh?


> >              bogus = [name for name, section in args.items()
> >                       if not section.member]
> >              if bogus:
>
>

--00000000000024e01f05cd1688c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 7, 2021 at 6:44 AM Markus=
 Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat=
.com</a>&gt; writes:<br>
<br>
&gt; Annotations do not change runtime behavior.<br>
&gt;<br>
&gt; This commit adds mostly annotations, but uses a TYPE_CHECKING runtime<=
br>
&gt; check to conditionally import dependencies, which only triggers during=
<br>
&gt; runs of mypy.<br>
<br>
Please add a reference to<br>
<a href=3D"https://mypy.readthedocs.io/en/latest/runtime_troubles.html#impo=
rt-cycles" rel=3D"noreferrer" target=3D"_blank">https://mypy.readthedocs.io=
/en/latest/runtime_troubles.html#import-cycles</a><br>
<br></blockquote><div><br></div><div>OK.<br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; TopLevelExpr, an idea from previous drafts, makes a return here in ord=
er<br>
&gt; to give a semantic meaning to check_expr(). The type is intended to be=
<br>
&gt; used more in forthcoming commits (pt5c), but I opted to include it now=
<br>
&gt; instead of creating yet-another Dict[str, object] type hint that I wou=
ld<br>
&gt; forget to change later.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/parser.py | 77 ++++++++++++++++++++++++++----------=
------<br>
&gt;=C2=A0 1 file changed, 48 insertions(+), 29 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py<br>
&gt; index 3ddde318376..b1e2fa5c577 100644<br>
&gt; --- a/scripts/qapi/parser.py<br>
&gt; +++ b/scripts/qapi/parser.py<br>
&gt; @@ -18,6 +18,7 @@<br>
&gt;=C2=A0 import os<br>
&gt;=C2=A0 import re<br>
&gt;=C2=A0 from typing import (<br>
&gt; +=C2=A0 =C2=A0 TYPE_CHECKING,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Dict,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 List,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Optional,<br>
&gt; @@ -30,6 +31,15 @@<br>
&gt;=C2=A0 from .source import QAPISourceInfo<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; +if TYPE_CHECKING:<br>
&gt; +=C2=A0 =C2=A0 # pylint: disable=3Dcyclic-import<br>
&gt; +=C2=A0 =C2=A0 # TODO: Remove cycle. [schema -&gt; expr -&gt; parser -=
&gt; schema]<br></blockquote><div><br></div><div>WRT this todo: you mention=
ed that you&#39;d prefer having some idea or plan for how to eliminate the =
cycle in order to let this band-aid fly. How about adding a &#39;doc&#39; m=
ember to e.g. QAPISchemaFeature and doing the connection entirely inside of=
 schema.py, and dropping connect_member() and connect_feature()?</div><div>=
<br></div><div>Would that be serviceable?</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 from .schema import QAPISchemaFeature, QAPISchemaMember=
<br>
&gt; +<br>
&gt; +<br>
&gt; +#: Represents a single Top Level QAPI schema expression.<br>
&gt; +TopLevelExpr =3D Dict[str, object]<br>
<br>
Related: _ExprValue below, and _JSONObject in expr.py.=C2=A0 The latter&#39=
;s<br>
comment gives the best rationale (except I don&#39;t get &quot;the purpose =
of<br>
this module is to interrogate that type&quot;).<br>
<br></blockquote><div><br></div><div>in expr.py, the purpose of that module=
 (expr) is explicitly to interrogate (check, validate) the shape of arbitra=
ry JSON objects. I am saying that a more strict definition specifically her=
e in expr.py is not necessary because the entire purpose of expr.py is to, =
at runtime, verify the shape of any such variables that might be annotated =
that way. I am drawing some distinction to introspect.py, where we&#39;re g=
enerating that data ourselves -- the stronger types are more viable there, =
because we know what they are already.<br></div><div>(again, sorry about my=
py&#39;s lack of recursive typing, I hate it too, I promise)<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I think we&#39;d like to have<br>
<br>
* A recursive type for JSON value (in our bastardized version of JSON)<br>
<br>
=C2=A0 This is Union of bool, str, List[Self], Dict[str, Self].=C2=A0 It&#3=
9;s what<br>
=C2=A0 .get_expr() returns.<br>
<br>
=C2=A0 Since mypy can&#39;t do recursive, we approximate with _ExprValue.<b=
r>
<br>
* A recursive type for JSON object<br>
<br>
=C2=A0 This is the Dict branch of the above.=C2=A0 It&#39;s what check_keys=
() &amp;<br>
=C2=A0 friends take as argument.<br>
<br>
=C2=A0 We approximate with _JSONObject.<br>
<br>
=C2=A0 Same for the List branch would make sense if we had a use for the<br=
>
=C2=A0 type.<br>
<br>
* A recursive type for TOP-LEVEL-EXPR<br>
<br>
=C2=A0 Actually the same type as the previous one, to be used only for the<=
br>
=C2=A0 schema&#39;s top-level expressions.=C2=A0 It&#39;s the elements of<b=
r>
=C2=A0 QAPISchemaParser.exprs[], and what check_exprs() takes as argument.<=
br>
<br>
=C2=A0 We approximate with TopLevelExpr, but so far use it only for<br>
=C2=A0 check_exprs().<br>
<br>
=C2=A0 Doesn&#39;t really improve type checking, but may serve as documenta=
tion.<br>
<br></blockquote><div><br></div><div>That&#39;s the intended effect here --=
 to help highlight which functions operate on those top-level expressions, =
and which might be invoked in more arbitrary cases.</div><div>Consider also=
 a hypothetical TOP-LEVEL-EXPR that is actually a bona-fide object with add=
itional metadata, too. In these cases, the type really will be different.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Shouldn&#39;t these types be all defined in one place, namely right here?<b=
r>
Bonus: we need to explain the mypy sadness just once then.<br>
<br>
Shouldn&#39;t their names be more systematic?=C2=A0 _ExprValue, _JSONObject=
 and<br>
TopLevelExpr hardly suggest any relation...<br>
<br></blockquote><div><br></div><div>I drop _JSONObject in pt5c, it was a s=
top-gap. For the rest, I&#39;ll see about a more rigorous consolidation now=
 that we&#39;re this far in.</div><div><br></div><div>pt5c was intended as =
a &quot;cleanup&quot; step that did some of that consolidation of nearly-re=
dundant types; but I wanted all of parser.py under the mypy gun *first*.</d=
iv><div>Will you take a raincheck here and we&#39;ll focus on the consolida=
tion in the next series? I agree it&#39;s worth doing.</div><div><br></div>=
<div>(I can add a &#39;FIXME&#39; that will 100% need to be fixed before I =
move scripts/qapi under python/qemu/qapi -- the linter config there prohibi=
ts them, so you can be sure I can&#39;t ignore it.)<br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt;=C2=A0 # Return value alias for get_expr().<br>
&gt;=C2=A0 _ExprValue =3D Union[List[object], Dict[str, object], str, bool]=
<br>
&gt;=C2=A0 <br>
&gt; @@ -447,7 +457,8 @@ class QAPIDoc:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 class Section:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 def __init__(self, parser, name=3DNone, i=
ndent=3D0):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def __init__(self, parser: QAPISchemaPars=
er,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0name: Optional[str] =3D None, indent: int =3D 0):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # parser, for error me=
ssages about indentation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._parser =3D parse=
r<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # optional section nam=
e (argument/member or section name)<br>
&gt; @@ -459,7 +470,7 @@ def __init__(self, parser, name=3DNone, indent=3D0=
):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def __bool__(self) -&gt; bool:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(<a href=3D=
"http://self.name" rel=3D"noreferrer" target=3D"_blank">self.name</a> or se=
lf.text)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 def append(self, line):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def append(self, line: str) -&gt; None:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Strip leading spaces=
 corresponding to the expected indent level<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Blank lines are alwa=
ys OK.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line:<br>
&gt; @@ -474,39 +485,40 @@ def append(self, line):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.text +=3D line.rs=
trip() + &#39;\n&#39;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 class ArgSection(Section):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 def __init__(self, parser, name, indent=
=3D0):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def __init__(self, parser: QAPISchemaPars=
er,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0name: Optional[str] =3D None, indent: int =3D 0):<br>
<br>
Why not name: str?=C2=A0 All callers pass a str argument...<br>
<br></blockquote><div><br></div><div>Maybe a holdover from when I was tryin=
g to stick to LSP for initializers. I think I have since learned that mypy =
will only whine about LSP if you hold pointers to the initializer to be inv=
oked in factory functions. I&#39;ll fix it and we&#39;ll worry about the LS=
P warnings if they ever decide to show up.<br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 super().__init__(parse=
r, name, indent)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.member =3D None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.member: Optional[&#39;=
QAPISchemaMember&#39;] =3D None<br>
<br>
I guess you need to quote &#39;QAPISchemaMember&#39;, because we actually i=
mport<br>
it only if TYPE_CHECKING.=C2=A0 More of the same below.<br>
<br></blockquote><div><br></div><div>Yep. Future Python versions may be bet=
ter about this (You don&#39;t have to quote any types, ever -- they&#39;re =
parsed in a later pass) but we just don&#39;t have that luxury yet.</div><d=
iv><br></div><div>See <a href=3D"https://www.python.org/dev/peps/pep-0563/"=
>https://www.python.org/dev/peps/pep-0563/</a></div><div>Also see <a href=
=3D"https://www.reddit.com/r/Python/comments/muyz5h/pep_563_getting_rolled_=
back_from_python_310/">https://www.reddit.com/r/Python/comments/muyz5h/pep_=
563_getting_rolled_back_from_python_310/</a> for some discussion on why thi=
s feature was not made the default for 3.10</div></div><div class=3D"gmail_=
quote"><br></div><div class=3D"gmail_quote">(TLDR: It breaks a library call=
ed pydantic that largely does exactly what expr.py does, using type annotat=
ions to define the valid shapes of objects. I&#39;d love to use it in QAPI,=
 actually, ... a discussion for yet another day.)<br></div><div class=3D"gm=
ail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 def connect(self, member):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def connect(self, member: &#39;QAPISchema=
Member&#39;) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.member =3D member=
<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def __init__(self, parser, info):<br>
&gt; +=C2=A0 =C2=A0 def __init__(self, parser: QAPISchemaParser, info: QAPI=
SourceInfo):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # self._parser is used to report err=
ors with QAPIParseError.=C2=A0 The<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # resulting error position depends o=
n the state of the parser.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # It happens to be the beginning of =
the comment.=C2=A0 More or less<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # servicable, but action at a distan=
ce.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._parser =3D parser<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://self.info" rel=3D"=
noreferrer" target=3D"_blank">self.info</a> =3D info<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.symbol =3D None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.symbol: Optional[str] =3D None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.body =3D QAPIDoc.Section(parser=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # dict mapping parameter name to Arg=
Section<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.args =3D OrderedDict()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.features =3D OrderedDict()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.args: Dict[str, QAPIDoc.ArgSection] =
=3D OrderedDict()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.features: Dict[str, QAPIDoc.ArgSecti=
on] =3D OrderedDict()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # a list of Section<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sections =3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sections: List[QAPIDoc.Section] =3D =
[]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the current section<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._section =3D self.body<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._append_line =3D self._append_b=
ody_line<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def has_section(self, name):<br>
&gt; +=C2=A0 =C2=A0 def has_section(self, name: str) -&gt; bool:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Return True if we =
have a section with this name.&quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in self.sections:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://i=
.name" rel=3D"noreferrer" target=3D"_blank">i.name</a> =3D=3D name:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return T=
rue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def append(self, line):<br>
&gt; +=C2=A0 =C2=A0 def append(self, line: str) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Parse a comment line and add it to t=
he documentation.<br>
&gt;=C2=A0 <br>
&gt; @@ -527,18 +539,18 @@ def append(self, line):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D line[1:]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._append_line(line)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def end_comment(self):<br>
&gt; +=C2=A0 =C2=A0 def end_comment(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._end_section()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 @staticmethod<br>
&gt; -=C2=A0 =C2=A0 def _is_section_tag(name):<br>
&gt; +=C2=A0 =C2=A0 def _is_section_tag(name: str) -&gt; bool:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return name in (&#39;Returns:&#39;, =
&#39;Since:&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 # those are often singular or plural<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;Note:&#39;, &#39;Notes:&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;Example:&#39;, &#39;Examples:&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;TODO:&#39;)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def _append_body_line(self, line):<br>
&gt; +=C2=A0 =C2=A0 def _append_body_line(self, line: str) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Process a line of documentation text=
 in the body section.<br>
&gt;=C2=A0 <br>
&gt; @@ -578,7 +590,7 @@ def _append_body_line(self, line):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This is a free-form =
documentation block<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._append_freeform(=
line)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def _append_args_line(self, line):<br>
&gt; +=C2=A0 =C2=A0 def _append_args_line(self, line: str) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Process a line of documentation text=
 in an argument section.<br>
&gt;=C2=A0 <br>
&gt; @@ -624,7 +636,7 @@ def _append_args_line(self, line):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._append_freeform(line)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def _append_features_line(self, line):<br>
&gt; +=C2=A0 =C2=A0 def _append_features_line(self, line: str) -&gt; None:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D line.split(&#39; &#39;, 1)[=
0]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name.startswith(&#39;@&#39;) and =
name.endswith(&#39;:&#39;):<br>
&gt; @@ -656,7 +668,7 @@ def _append_features_line(self, line):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._append_freeform(line)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def _append_various_line(self, line):<br>
&gt; +=C2=A0 =C2=A0 def _append_various_line(self, line: str) -&gt; None:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Process a line of documentation text=
 in an additional section.<br>
&gt;=C2=A0 <br>
&gt; @@ -692,7 +704,11 @@ def _append_various_line(self, line):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._append_freeform(line)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def _start_symbol_section(self, symbols_dict, name, ind=
ent):<br>
&gt; +=C2=A0 =C2=A0 def _start_symbol_section(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 symbols_dict: Dict[str, &#3=
9;QAPIDoc.ArgSection&#39;],<br>
<br>
The need to quote this within the very class that defines it is<br>
annoying.<br></blockquote><div><br></div><div>Yep. Python has weird scoping=
 rules for nested classes. In my own hobby code I&#39;ve largely started av=
oiding ever using them, because they don&#39;t seem to be worth the trouble=
.</div><div><br></div><div>Long story short: the name isn&#39;t available y=
et because at the time this annotation is evaluated, we&#39;re still in the=
 middle of defining it. I wish there was a syntax for $thisclass for a nasc=
ent self-reference, but alas.<br></div><div><br></div><div>(Yes, I dislike =
it too. Nothing I can do about it, to my knowledge.)<br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name: str,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indent: int) -&gt; None:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME invalid names other than the=
 empty string aren&#39;t flagged<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not name:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPIParseError(s=
elf._parser, &quot;invalid parameter name&quot;)<br>
&gt; @@ -704,13 +720,14 @@ def _start_symbol_section(self, symbols_dict, na=
me, indent):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._section =3D QAPIDoc.ArgSection=
(self._parser, name, indent)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 symbols_dict[name] =3D self._section=
<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def _start_args_section(self, name, indent):<br>
&gt; +=C2=A0 =C2=A0 def _start_args_section(self, name: str, indent: int) -=
&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._start_symbol_section(self.args=
, name, indent)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def _start_features_section(self, name, indent):<br>
&gt; +=C2=A0 =C2=A0 def _start_features_section(self, name: str, indent: in=
t) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._start_symbol_section(self.feat=
ures, name, indent)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def _start_section(self, name=3DNone, indent=3D0):<br>
&gt; +=C2=A0 =C2=A0 def _start_section(self, name: Optional[str] =3D None,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0indent: int =3D 0) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name in (&#39;Returns&#39;, &#39;=
Since&#39;) and self.has_section(name):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPIParseError(s=
elf._parser,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;duplicated &#3=
9;%s&#39; section&quot; % name)<br>
&gt; @@ -718,7 +735,7 @@ def _start_section(self, name=3DNone, indent=3D0):=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._section =3D QAPIDoc.Section(se=
lf._parser, name, indent)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.sections.append(self._section)<=
br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def _end_section(self):<br>
&gt; +=C2=A0 =C2=A0 def _end_section(self) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._section:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 text =3D self._section=
.text =3D self._section.text.strip()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self._<a href=3D"ht=
tp://section.name" rel=3D"noreferrer" target=3D"_blank">section.name</a> an=
d (not text or text.isspace()):<br>
&gt; @@ -727,7 +744,7 @@ def _end_section(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;empty doc section &#39;%s&#39;&quot; % self._<a href=3D"http:/=
/section.name" rel=3D"noreferrer" target=3D"_blank">section.name</a>)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._section =3D QAPI=
Doc.Section(self._parser)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def _append_freeform(self, line):<br>
&gt; +=C2=A0 =C2=A0 def _append_freeform(self, line: str) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D re.match(r&#39;(@\S+:)&#39=
;, line)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if match:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPIParseError(s=
elf._parser,<br>
&gt; @@ -735,28 +752,30 @@ def _append_freeform(self, line):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% match.group(1))<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._section.append(line)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def connect_member(self, member):<br>
&gt; +=C2=A0 =C2=A0 def connect_member(self, member: &#39;QAPISchemaMember&=
#39;) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://member.name" re=
l=3D"noreferrer" target=3D"_blank">member.name</a> not in self.args:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Undocumented TODO ou=
tlaw<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.args[<a href=3D"h=
ttp://member.name" rel=3D"noreferrer" target=3D"_blank">member.name</a>] =
=3D QAPIDoc.ArgSection(self._parser,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http=
://member.name" rel=3D"noreferrer" target=3D"_blank">member.name</a>)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.args[<a href=3D"http://member.n=
ame" rel=3D"noreferrer" target=3D"_blank">member.name</a>].connect(member)<=
br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def connect_feature(self, feature):<br>
&gt; +=C2=A0 =C2=A0 def connect_feature(self, feature: &#39;QAPISchemaFeatu=
re&#39;) -&gt; None:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://feature.name" r=
el=3D"noreferrer" target=3D"_blank">feature.name</a> not in self.features:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<a =
href=3D"http://feature.info" rel=3D"noreferrer" target=3D"_blank">feature.i=
nfo</a>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;feature &#39;%s&#39; =
lacks documentation&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% <a href=3D"http://feature=
.name" rel=3D"noreferrer" target=3D"_blank">feature.name</a>)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.features[<a href=3D"http://feat=
ure.name" rel=3D"noreferrer" target=3D"_blank">feature.name</a>].connect(fe=
ature)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def check_expr(self, expr):<br>
&gt; +=C2=A0 =C2=A0 def check_expr(self, expr: TopLevelExpr) -&gt; None:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.has_section(&#39;Returns&#39=
;) and &#39;command&#39; not in expr:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise QAPISemError(<a =
href=3D"http://self.info" rel=3D"noreferrer" target=3D"_blank">self.info</a=
>,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&#39;Returns:&#39; is=
 only valid for commands&quot;)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 def check(self):<br>
&gt; +=C2=A0 =C2=A0 def check(self) -&gt; None:<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 def check_args_section(args, what):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 def check_args_section(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args: Dict[st=
r, QAPIDoc.ArgSection], what: str<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ) -&gt; None:<br>
<br>
This is the fourth use of Dict[str, QAPIDoc.ArgSection].=C2=A0 Still fine,<=
br>
but if we acquire even more, we should consider giving it a name.<br>
<br></blockquote><div><br></div><div>If they share something in common that=
 makes it name-able, sure. For now: eh?<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bogus =3D [name for na=
me, section in args.items()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if not section.member]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bogus:<br>
<br>
</blockquote></div></div>

--00000000000024e01f05cd1688c0--


