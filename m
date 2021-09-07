Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D4E402759
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 12:46:58 +0200 (CEST)
Received: from localhost ([::1]:42232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNYcz-0008HZ-UQ
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 06:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNYbG-000705-91
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:45:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mNYbC-0005Uz-0y
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631011504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zw66zTct1qzYq1oay75/NHyFTRFNO2YfUe/1e3jBuK8=;
 b=LTIZovNpdTXYTtyLWvTN7HeQlUfxmREzvRgxo/WxzHBAsojlxjWU6IwlQeNEqQzcIvNcen
 51LQm3h1EuiJIfsMKlrHryLZ6xxKNQCNjfKPTbbHNrxNRZurhdUDw/PRNe/ORzL5iixs10
 DXHKol9veEd+tJzlf/ngqGUV2ZEpX48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-uzIoodEeNoK1w1q9lCM2nw-1; Tue, 07 Sep 2021 06:44:57 -0400
X-MC-Unique: uzIoodEeNoK1w1q9lCM2nw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C74201966329;
 Tue,  7 Sep 2021 10:44:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A9246A255;
 Tue,  7 Sep 2021 10:44:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9957E1138606; Tue,  7 Sep 2021 12:44:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 3/6] qapi/parser: add type hint annotations (QAPIDoc)
References: <20210520225710.168356-1-jsnow@redhat.com>
 <20210520225710.168356-4-jsnow@redhat.com>
Date: Tue, 07 Sep 2021 12:44:54 +0200
In-Reply-To: <20210520225710.168356-4-jsnow@redhat.com> (John Snow's message
 of "Thu, 20 May 2021 18:57:07 -0400")
Message-ID: <87o8943brt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_DBL_SPAM=2.5 autolearn=no autolearn_force=no
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
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Annotations do not change runtime behavior.
>
> This commit adds mostly annotations, but uses a TYPE_CHECKING runtime
> check to conditionally import dependencies, which only triggers during
> runs of mypy.

Please add a reference to
https://mypy.readthedocs.io/en/latest/runtime_troubles.html#import-cycles

> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> TopLevelExpr, an idea from previous drafts, makes a return here in order
> to give a semantic meaning to check_expr(). The type is intended to be
> used more in forthcoming commits (pt5c), but I opted to include it now
> instead of creating yet-another Dict[str, object] type hint that I would
> forget to change later.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/parser.py | 77 ++++++++++++++++++++++++++----------------
>  1 file changed, 48 insertions(+), 29 deletions(-)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index 3ddde318376..b1e2fa5c577 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -18,6 +18,7 @@
>  import os
>  import re
>  from typing import (
> +    TYPE_CHECKING,
>      Dict,
>      List,
>      Optional,
> @@ -30,6 +31,15 @@
>  from .source import QAPISourceInfo
>  
>  
> +if TYPE_CHECKING:
> +    # pylint: disable=cyclic-import
> +    # TODO: Remove cycle. [schema -> expr -> parser -> schema]
> +    from .schema import QAPISchemaFeature, QAPISchemaMember
> +
> +
> +#: Represents a single Top Level QAPI schema expression.
> +TopLevelExpr = Dict[str, object]

Related: _ExprValue below, and _JSONObject in expr.py.  The latter's
comment gives the best rationale (except I don't get "the purpose of
this module is to interrogate that type").

I think we'd like to have

* A recursive type for JSON value (in our bastardized version of JSON)

  This is Union of bool, str, List[Self], Dict[str, Self].  It's what
  .get_expr() returns.

  Since mypy can't do recursive, we approximate with _ExprValue.

* A recursive type for JSON object

  This is the Dict branch of the above.  It's what check_keys() &
  friends take as argument.

  We approximate with _JSONObject.

  Same for the List branch would make sense if we had a use for the
  type.

* A recursive type for TOP-LEVEL-EXPR

  Actually the same type as the previous one, to be used only for the
  schema's top-level expressions.  It's the elements of
  QAPISchemaParser.exprs[], and what check_exprs() takes as argument.

  We approximate with TopLevelExpr, but so far use it only for
  check_exprs().

  Doesn't really improve type checking, but may serve as documentation.

Shouldn't these types be all defined in one place, namely right here?
Bonus: we need to explain the mypy sadness just once then.

Shouldn't their names be more systematic?  _ExprValue, _JSONObject and
TopLevelExpr hardly suggest any relation...

> +
>  # Return value alias for get_expr().
>  _ExprValue = Union[List[object], Dict[str, object], str, bool]
>  
> @@ -447,7 +457,8 @@ class QAPIDoc:
>      """
>  
>      class Section:
> -        def __init__(self, parser, name=None, indent=0):
> +        def __init__(self, parser: QAPISchemaParser,
> +                     name: Optional[str] = None, indent: int = 0):
>              # parser, for error messages about indentation
>              self._parser = parser
>              # optional section name (argument/member or section name)
> @@ -459,7 +470,7 @@ def __init__(self, parser, name=None, indent=0):
>          def __bool__(self) -> bool:
>              return bool(self.name or self.text)
>  
> -        def append(self, line):
> +        def append(self, line: str) -> None:
>              # Strip leading spaces corresponding to the expected indent level
>              # Blank lines are always OK.
>              if line:
> @@ -474,39 +485,40 @@ def append(self, line):
>              self.text += line.rstrip() + '\n'
>  
>      class ArgSection(Section):
> -        def __init__(self, parser, name, indent=0):
> +        def __init__(self, parser: QAPISchemaParser,
> +                     name: Optional[str] = None, indent: int = 0):

Why not name: str?  All callers pass a str argument...

>              super().__init__(parser, name, indent)
> -            self.member = None
> +            self.member: Optional['QAPISchemaMember'] = None

I guess you need to quote 'QAPISchemaMember', because we actually import
it only if TYPE_CHECKING.  More of the same below.

>  
> -        def connect(self, member):
> +        def connect(self, member: 'QAPISchemaMember') -> None:
>              self.member = member
>  
> -    def __init__(self, parser, info):
> +    def __init__(self, parser: QAPISchemaParser, info: QAPISourceInfo):
>          # self._parser is used to report errors with QAPIParseError.  The
>          # resulting error position depends on the state of the parser.
>          # It happens to be the beginning of the comment.  More or less
>          # servicable, but action at a distance.
>          self._parser = parser
>          self.info = info
> -        self.symbol = None
> +        self.symbol: Optional[str] = None
>          self.body = QAPIDoc.Section(parser)
>          # dict mapping parameter name to ArgSection
> -        self.args = OrderedDict()
> -        self.features = OrderedDict()
> +        self.args: Dict[str, QAPIDoc.ArgSection] = OrderedDict()
> +        self.features: Dict[str, QAPIDoc.ArgSection] = OrderedDict()
>          # a list of Section
> -        self.sections = []
> +        self.sections: List[QAPIDoc.Section] = []
>          # the current section
>          self._section = self.body
>          self._append_line = self._append_body_line
>  
> -    def has_section(self, name):
> +    def has_section(self, name: str) -> bool:
>          """Return True if we have a section with this name."""
>          for i in self.sections:
>              if i.name == name:
>                  return True
>          return False
>  
> -    def append(self, line):
> +    def append(self, line: str) -> None:
>          """
>          Parse a comment line and add it to the documentation.
>  
> @@ -527,18 +539,18 @@ def append(self, line):
>          line = line[1:]
>          self._append_line(line)
>  
> -    def end_comment(self):
> +    def end_comment(self) -> None:
>          self._end_section()
>  
>      @staticmethod
> -    def _is_section_tag(name):
> +    def _is_section_tag(name: str) -> bool:
>          return name in ('Returns:', 'Since:',
>                          # those are often singular or plural
>                          'Note:', 'Notes:',
>                          'Example:', 'Examples:',
>                          'TODO:')
>  
> -    def _append_body_line(self, line):
> +    def _append_body_line(self, line: str) -> None:
>          """
>          Process a line of documentation text in the body section.
>  
> @@ -578,7 +590,7 @@ def _append_body_line(self, line):
>              # This is a free-form documentation block
>              self._append_freeform(line)
>  
> -    def _append_args_line(self, line):
> +    def _append_args_line(self, line: str) -> None:
>          """
>          Process a line of documentation text in an argument section.
>  
> @@ -624,7 +636,7 @@ def _append_args_line(self, line):
>  
>          self._append_freeform(line)
>  
> -    def _append_features_line(self, line):
> +    def _append_features_line(self, line: str) -> None:
>          name = line.split(' ', 1)[0]
>  
>          if name.startswith('@') and name.endswith(':'):
> @@ -656,7 +668,7 @@ def _append_features_line(self, line):
>  
>          self._append_freeform(line)
>  
> -    def _append_various_line(self, line):
> +    def _append_various_line(self, line: str) -> None:
>          """
>          Process a line of documentation text in an additional section.
>  
> @@ -692,7 +704,11 @@ def _append_various_line(self, line):
>  
>          self._append_freeform(line)
>  
> -    def _start_symbol_section(self, symbols_dict, name, indent):
> +    def _start_symbol_section(
> +            self,
> +            symbols_dict: Dict[str, 'QAPIDoc.ArgSection'],

The need to quote this within the very class that defines it is
annoying.

> +            name: str,
> +            indent: int) -> None:
>          # FIXME invalid names other than the empty string aren't flagged
>          if not name:
>              raise QAPIParseError(self._parser, "invalid parameter name")
> @@ -704,13 +720,14 @@ def _start_symbol_section(self, symbols_dict, name, indent):
>          self._section = QAPIDoc.ArgSection(self._parser, name, indent)
>          symbols_dict[name] = self._section
>  
> -    def _start_args_section(self, name, indent):
> +    def _start_args_section(self, name: str, indent: int) -> None:
>          self._start_symbol_section(self.args, name, indent)
>  
> -    def _start_features_section(self, name, indent):
> +    def _start_features_section(self, name: str, indent: int) -> None:
>          self._start_symbol_section(self.features, name, indent)
>  
> -    def _start_section(self, name=None, indent=0):
> +    def _start_section(self, name: Optional[str] = None,
> +                       indent: int = 0) -> None:
>          if name in ('Returns', 'Since') and self.has_section(name):
>              raise QAPIParseError(self._parser,
>                                   "duplicated '%s' section" % name)
> @@ -718,7 +735,7 @@ def _start_section(self, name=None, indent=0):
>          self._section = QAPIDoc.Section(self._parser, name, indent)
>          self.sections.append(self._section)
>  
> -    def _end_section(self):
> +    def _end_section(self) -> None:
>          if self._section:
>              text = self._section.text = self._section.text.strip()
>              if self._section.name and (not text or text.isspace()):
> @@ -727,7 +744,7 @@ def _end_section(self):
>                      "empty doc section '%s'" % self._section.name)
>              self._section = QAPIDoc.Section(self._parser)
>  
> -    def _append_freeform(self, line):
> +    def _append_freeform(self, line: str) -> None:
>          match = re.match(r'(@\S+:)', line)
>          if match:
>              raise QAPIParseError(self._parser,
> @@ -735,28 +752,30 @@ def _append_freeform(self, line):
>                                   % match.group(1))
>          self._section.append(line)
>  
> -    def connect_member(self, member):
> +    def connect_member(self, member: 'QAPISchemaMember') -> None:
>          if member.name not in self.args:
>              # Undocumented TODO outlaw
>              self.args[member.name] = QAPIDoc.ArgSection(self._parser,
>                                                          member.name)
>          self.args[member.name].connect(member)
>  
> -    def connect_feature(self, feature):
> +    def connect_feature(self, feature: 'QAPISchemaFeature') -> None:
>          if feature.name not in self.features:
>              raise QAPISemError(feature.info,
>                                 "feature '%s' lacks documentation"
>                                 % feature.name)
>          self.features[feature.name].connect(feature)
>  
> -    def check_expr(self, expr):
> +    def check_expr(self, expr: TopLevelExpr) -> None:
>          if self.has_section('Returns') and 'command' not in expr:
>              raise QAPISemError(self.info,
>                                 "'Returns:' is only valid for commands")
>  
> -    def check(self):
> +    def check(self) -> None:
>  
> -        def check_args_section(args, what):
> +        def check_args_section(
> +                args: Dict[str, QAPIDoc.ArgSection], what: str
> +        ) -> None:

This is the fourth use of Dict[str, QAPIDoc.ArgSection].  Still fine,
but if we acquire even more, we should consider giving it a name.

>              bogus = [name for name, section in args.items()
>                       if not section.member]
>              if bogus:


