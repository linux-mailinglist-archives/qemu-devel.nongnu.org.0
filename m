Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D0638BF0F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 08:06:43 +0200 (CEST)
Received: from localhost ([::1]:55106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljyJ0-0007La-57
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 02:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljyHr-0006fx-R0
 for qemu-devel@nongnu.org; Fri, 21 May 2021 02:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljyHm-0001Qd-Ek
 for qemu-devel@nongnu.org; Fri, 21 May 2021 02:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621577124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FKg4R4uFHQm/lmL2Gy7xTuNhq/P1lnezJuHwbaH9JlY=;
 b=QIvjWalEdODFLA9xKekMLI7QR/2IFQSG+Mh0OWhC4PNW6Ko87l4HJTGfxJUsCfnAB4ORO5
 FAKI1nIkM2abThAKDEJ1Hdw3YFx9tEZcpqKWv+OaUBpFnrsVpZvwKm4r2UX4/oCmAJ38SR
 6CmnEHlYhUhJP7AF4PP+AFaukKULCF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-df80Xz5VOLa7L0KVDEsJ0A-1; Fri, 21 May 2021 02:05:05 -0400
X-MC-Unique: df80Xz5VOLa7L0KVDEsJ0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AF10800D62;
 Fri, 21 May 2021 06:05:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0E426A039;
 Fri, 21 May 2021 06:05:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4D3B9113865F; Fri, 21 May 2021 08:05:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 3/6] qapi/parser.py: add type hint annotations (QAPIDoc)
References: <20210519191718.3950330-1-jsnow@redhat.com>
 <20210519191718.3950330-4-jsnow@redhat.com>
 <87r1i14f9c.fsf@dusky.pond.sub.org>
 <9d5fc364-7d3f-b09f-f7dc-5a36f471b11f@redhat.com>
Date: Fri, 21 May 2021 08:05:02 +0200
In-Reply-To: <9d5fc364-7d3f-b09f-f7dc-5a36f471b11f@redhat.com> (John Snow's
 message of "Thu, 20 May 2021 18:48:43 -0400")
Message-ID: <87lf88r59t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 5/20/21 11:05 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> Annotations do not change runtime behavior.
>>>
>>> This commit adds mostly annotations, but uses a TYPE_CHECKING runtime
>>> check to conditionally import dependencies, which only triggers during
>>> runs of mypy.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>
>>> ---
>>>
>>> TopLevelExpr, an idea from previous drafts, makes a return here in order
>>> to give a semantic meaning to check_expr(). The type is intended to be
>>> used more in forthcoming commits (pt5c), but I opted to include it now
>>> instead of creating yet-another Dict[str, object] type hint that I would
>>> forget to change later.
>> 
>> There's just one use.  Since you assure me it'll make sense later...
>> 
>
> Check for yourself in pt5c, patch #2.
>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/parser.py | 74 +++++++++++++++++++++++++-----------------
>>>   1 file changed, 45 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>>> index 71e982bff57..fefe4c37f44 100644
>>> --- a/scripts/qapi/parser.py
>>> +++ b/scripts/qapi/parser.py
>>> @@ -18,6 +18,7 @@
>>>   import os
>>>   import re
>>>   from typing import (
>>> +    TYPE_CHECKING,
>>>       Dict,
>>>       List,
>>>       Optional,
>>> @@ -30,6 +31,14 @@
>>>   from .source import QAPISourceInfo
>>>   
>>>   
>>> +if TYPE_CHECKING:
>>> +    # pylint: disable=cyclic-import
>>> +    from .schema import QAPISchemaFeature, QAPISchemaMember
>> 
>> Oh boy :)
>> 
>> Any ideas on how to clean this up later?
>> 
>
> Uhhhh .........
>
> It turns out you don't need the pylint pragma for pylint >= 2.8.x 
> anymore. (But, I will leave this alone for now to try and offer some 
> compatibility to older pylint versions, at least for a little while.)
>
> Oddly enough I can't seme to get pylint to warn about the cycle at all 
> right now, but it will still indeed crash at runtime without these 
> shenanigans:
>
> Traceback (most recent call last):
>    File "/home/jsnow/src/qemu/scripts/qapi-gen.py", line 16, in <module>
>      from qapi import main
>    File "/home/jsnow/src/qemu/scripts/qapi/main.py", line 14, in <module>
>      from .commands import gen_commands
>    File "/home/jsnow/src/qemu/scripts/qapi/commands.py", line 25, in 
> <module>
>      from .gen import (
>    File "/home/jsnow/src/qemu/scripts/qapi/gen.py", line 34, in <module>
>      from .schema import (
>    File "/home/jsnow/src/qemu/scripts/qapi/schema.py", line 24, in <module>
>      from .expr import check_exprs
>    File "/home/jsnow/src/qemu/scripts/qapi/expr.py", line 47, in <module>
>      from .parser import QAPIDoc
>    File "/home/jsnow/src/qemu/scripts/qapi/parser.py", line 30, in <module>
>      from .schema import QAPISchemaFeature, QAPISchemaMember
>
>
> schema -> expr -> parser -> schema is the cycle.

The last -> is a layering violation.

This patch adds it so it can type QAPIDoc.connect_member(),
.connect_feature(), .ArgSection.member, and .ArgSection.connect().

.ArgSection.connect() is a stupid setter for .ArgSection.member.  It's
only called from .connect_member() and .connect_feature().

.connect_feature() and .connect_member() are only called from schema.py.
They connect a named thing to the ArgSection with the same name, by
storing it in .ArgSection.member.  The thing needs to provide .name.

The only use of .ArgSection.member is .check(): it searches for
.ArgSection that didn't get their .member set.

Quack!

The purpose of all this is detecting "thing lacks documentation" and
"documented thing does not exist" errors.

Your typing matches the actual arguments.  However, from QAPIDoc's point
of view, it's an overspecification and a layering violation.

I can see two ways out:

1. Decide detecting these errors does not belong here.  Move it to
   schema.py somehow.  Perhaps by replacing .ArgSection.member by a dict
   mapping .ArgSection to the value of .member.

2. Embrace duck typing and avoid the overspecification.  Hamfisted way
   to do it: use object.  Might be a less offensive stop gap than the
   import cycle.

Thoughts?

> schema needs check_exprs and QAPISchemaParser both.
> parser needs types from schema.
>
> Maybe QAPISchema could be handed already-validated expressions instead, 
> relying on common definition types in common.py instead to remove its 
> dependency on the other modules.
>
> It makes the constructor for QAPISchema a little less convenient, but it 
> emphasizes that each module "does one thing, and does it well."
>
> main.py or similar would need to compensate by breaking out more of the 
> component steps into its generate() function.
>
>>> +
>>> +
>>> +#: Represents a single Top Level QAPI schema expression.
>>> +TopLevelExpr = Dict[str, object]
>>> +
>>>   # Return value alias for get_expr().
>>>   _ExprValue = Union[List[object], Dict[str, object], str, bool]
>>>   
>>> @@ -447,7 +456,8 @@ class QAPIDoc:
>>>       """
>>>   
>>>       class Section:
>>> -        def __init__(self, parser, name=None, indent=0):
>>> +        def __init__(self, parser: QAPISchemaParser,
>>> +                     name: Optional[str] = None, indent: int = 0):
>>>               # parser, for error messages about indentation
>>>               self._parser = parser
>>>               # optional section name (argument/member or section name)
>>> @@ -459,7 +469,7 @@ def __init__(self, parser, name=None, indent=0):
>>>           def __bool__(self) -> bool:
>>>               return bool(self.name or self.text)
>>>   
>>> -        def append(self, line):
>>> +        def append(self, line: str) -> None:
>>>               # Strip leading spaces corresponding to the expected indent level
>>>               # Blank lines are always OK.
>>>               if line:
>>> @@ -474,39 +484,40 @@ def append(self, line):
>>>               self.text += line.rstrip() + '\n'
>>>   
>>>       class ArgSection(Section):
>>> -        def __init__(self, parser, name, indent=0):
>>> +        def __init__(self, parser: QAPISchemaParser,
>>> +                     name: Optional[str] = None, indent: int = 0):
>>>               super().__init__(parser, name, indent)
>>> -            self.member = None
>>> +            self.member: Optional['QAPISchemaMember'] = None
>>>   
>>> -        def connect(self, member):
>>> +        def connect(self, member: 'QAPISchemaMember') -> None:
>>>               self.member = member
>>>   
>>> -    def __init__(self, parser, info):
>>> +    def __init__(self, parser: QAPISchemaParser, info: QAPISourceInfo):
>>>           # self._parser is used to report errors with QAPIParseError.  The
>>>           # resulting error position depends on the state of the parser.
>>>           # It happens to be the beginning of the comment.  More or less
>>>           # servicable, but action at a distance.
>>>           self._parser = parser
>>>           self.info = info
>>> -        self.symbol = None
>>> +        self.symbol: Optional[str] = None
>>>           self.body = QAPIDoc.Section(parser)
>>>           # dict mapping parameter name to ArgSection
>>> -        self.args = OrderedDict()
>>> -        self.features = OrderedDict()
>>> +        self.args: Dict[str, QAPIDoc.ArgSection] = OrderedDict()
>>> +        self.features: Dict[str, QAPIDoc.ArgSection] = OrderedDict()
>>>           # a list of Section
>>> -        self.sections = []
>>> +        self.sections: List[QAPIDoc.Section] = []
>>>           # the current section
>>>           self._section = self.body
>>>           self._append_line = self._append_body_line
>>>   
>>> -    def has_section(self, name):
>>> +    def has_section(self, name: str) -> bool:
>>>           """Return True if we have a section with this name."""
>>>           for i in self.sections:
>>>               if i.name == name:
>>>                   return True
>>>           return False
>>>   
>>> -    def append(self, line):
>>> +    def append(self, line: str) -> None:
>>>           """
>>>           Parse a comment line and add it to the documentation.
>>>   
>>> @@ -527,18 +538,18 @@ def append(self, line):
>>>           line = line[1:]
>>>           self._append_line(line)
>>>   
>>> -    def end_comment(self):
>>> +    def end_comment(self) -> None:
>>>           self._end_section()
>>>   
>>>       @staticmethod
>>> -    def _is_section_tag(name):
>>> +    def _is_section_tag(name: str) -> bool:
>>>           return name in ('Returns:', 'Since:',
>>>                           # those are often singular or plural
>>>                           'Note:', 'Notes:',
>>>                           'Example:', 'Examples:',
>>>                           'TODO:')
>>>   
>>> -    def _append_body_line(self, line):
>>> +    def _append_body_line(self, line: str) -> None:
>>>           """
>>>           Process a line of documentation text in the body section.
>>>   
>>> @@ -578,7 +589,7 @@ def _append_body_line(self, line):
>>>               # This is a free-form documentation block
>>>               self._append_freeform(line)
>>>   
>>> -    def _append_args_line(self, line):
>>> +    def _append_args_line(self, line: str) -> None:
>>>           """
>>>           Process a line of documentation text in an argument section.
>>>   
>>> @@ -624,7 +635,7 @@ def _append_args_line(self, line):
>>>   
>>>           self._append_freeform(line)
>>>   
>>> -    def _append_features_line(self, line):
>>> +    def _append_features_line(self, line: str) -> None:
>>>           name = line.split(' ', 1)[0]
>>>   
>>>           if name.startswith('@') and name.endswith(':'):
>>> @@ -656,7 +667,7 @@ def _append_features_line(self, line):
>>>   
>>>           self._append_freeform(line)
>>>   
>>> -    def _append_various_line(self, line):
>>> +    def _append_various_line(self, line: str) -> None:
>>>           """
>>>           Process a line of documentation text in an additional section.
>>>   
>>> @@ -692,7 +703,11 @@ def _append_various_line(self, line):
>>>   
>>>           self._append_freeform(line)
>>>   
>>> -    def _start_symbol_section(self, symbols_dict, name, indent):
>>> +    def _start_symbol_section(
>>> +            self,
>>> +            symbols_dict: Dict[str, 'QAPIDoc.ArgSection'],
>> 
>> Sure we need to quote QAPIDoc.ArgSection here?
>> 
>
> Yes ... due to *when* this definition is evaluated. (It's BEFORE QAPIDoc 
> is finished being defined. It's unavailable at evaluation time.)
>
> Python 3.7+ allows us to use
>
> from __future__ import annotations
>
> which allows us to drop the quotes. This becomes the default behavior in 
> 3.10 or whatever. They may have pushed it back to 3.11.

The state of static typing in Python feels like FORTRAN ca. 1978.

>>> +            name: str,
>>> +            indent: int) -> None:
>>>           # FIXME invalid names other than the empty string aren't flagged
>>>           if not name:
>>>               raise QAPIParseError(self._parser, "invalid parameter name")
>>> @@ -704,13 +719,14 @@ def _start_symbol_section(self, symbols_dict, name, indent):
>>>           self._section = QAPIDoc.ArgSection(self._parser, name, indent)
>>>           symbols_dict[name] = self._section
>>>   
>>> -    def _start_args_section(self, name, indent):
>>> +    def _start_args_section(self, name: str, indent: int) -> None:
>>>           self._start_symbol_section(self.args, name, indent)
>>>   
>>> -    def _start_features_section(self, name, indent):
>>> +    def _start_features_section(self, name: str, indent: int) -> None:
>>>           self._start_symbol_section(self.features, name, indent)
>>>   
>>> -    def _start_section(self, name=None, indent=0):
>>> +    def _start_section(self, name: Optional[str] = None,
>>> +                       indent: int = 0) -> None:
>>>           if name in ('Returns', 'Since') and self.has_section(name):
>>>               raise QAPIParseError(self._parser,
>>>                                    "duplicated '%s' section" % name)
>>> @@ -718,7 +734,7 @@ def _start_section(self, name=None, indent=0):
>>>           self._section = QAPIDoc.Section(self._parser, name, indent)
>>>           self.sections.append(self._section)
>>>   
>>> -    def _end_section(self):
>>> +    def _end_section(self) -> None:
>>>           if self._section:
>>>               text = self._section.text = self._section.text.strip()
>>>               if self._section.name and (not text or text.isspace()):
>>> @@ -727,7 +743,7 @@ def _end_section(self):
>>>                       "empty doc section '%s'" % self._section.name)
>>>               self._section = QAPIDoc.Section(self._parser)
>>>   
>>> -    def _append_freeform(self, line):
>>> +    def _append_freeform(self, line: str) -> None:
>>>           match = re.match(r'(@\S+:)', line)
>>>           if match:
>>>               raise QAPIParseError(self._parser,
>>> @@ -735,28 +751,28 @@ def _append_freeform(self, line):
>>>                                    % match.group(1))
>>>           self._section.append(line)
>>>   
>>> -    def connect_member(self, member):
>>> +    def connect_member(self, member: 'QAPISchemaMember') -> None:
>> 
>> Sure we need to quote QAPISchemaMember here?
>> 
>
> Yes, to avoid it being evaluated in non-type checking scenarios, to 
> avoid the cycle.
>
>>>           if member.name not in self.args:
>>>               # Undocumented TODO outlaw
>>>               self.args[member.name] = QAPIDoc.ArgSection(self._parser,
>>>                                                           member.name)
>>>           self.args[member.name].connect(member)
>>>   
>>> -    def connect_feature(self, feature):
>>> +    def connect_feature(self, feature: 'QAPISchemaFeature') -> None:
>> 
>> Sure we need to quote QAPISchemaFeature here?
>> 
>
> ditto
>
>>>           if feature.name not in self.features:
>>>               raise QAPISemError(feature.info,
>>>                                  "feature '%s' lacks documentation"
>>>                                  % feature.name)
>>>           self.features[feature.name].connect(feature)
>>>   
>>> -    def check_expr(self, expr):
>>> +    def check_expr(self, expr: TopLevelExpr) -> None:
>>>           if self.has_section('Returns') and 'command' not in expr:
>>>               raise QAPISemError(self.info,
>>>                                  "'Returns:' is only valid for commands")
>>>   
>>> -    def check(self):
>>> +    def check(self) -> None:
>>>   
>>> -        def check_args_section(args):
>>> +        def check_args_section(args: Dict[str, QAPIDoc.ArgSection]) -> None:
>>>               bogus = [name for name, section in args.items()
>>>                        if not section.member]
>>>               if bogus:
>
> Current opinion is to just leave well enough alone, but I can be 
> motivated to do further cleanups after part 6 to attempt to remove cycles.
>
> If I press forward with my Sphinx extension, QAPIDoc is going to need a 
> rewrite anyway. I can do it then.

I can accept TODOs, I just like to understand the problem, and have an
idea of how it could be solved.


