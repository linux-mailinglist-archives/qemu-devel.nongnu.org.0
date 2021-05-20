Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65938B9B9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 00:50:39 +0200 (CEST)
Received: from localhost ([::1]:42124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljrUz-0001to-JS
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 18:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljrTe-0001BI-Dl
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:49:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljrTZ-00013k-Dm
 for qemu-devel@nongnu.org; Thu, 20 May 2021 18:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621550947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbSqYe+JpWls4D2KTo/R0eOf1xK/JTlZ5MeGv2zKbi4=;
 b=YaZKdmcTVup3qk6jnuGAOsmUgFim/ZqoT8BznggZvm5bjwys1HowqP8tS77/exZCDnkEU9
 /jNmFNFp+5BdryxY0dTqB7ubYj+kxculwSUYVkrq2ZVyP9Wu9/U3xCyO+6Ooiit2tk/HQg
 hPay3WyNm3fsQ2giFtuiaBRXKjUQo2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-KmtYB_mWMae2t07tPKeFjA-1; Thu, 20 May 2021 18:48:45 -0400
X-MC-Unique: KmtYB_mWMae2t07tPKeFjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A132501FA;
 Thu, 20 May 2021 22:48:44 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0AD16064B;
 Thu, 20 May 2021 22:48:43 +0000 (UTC)
Subject: Re: [PATCH 3/6] qapi/parser.py: add type hint annotations (QAPIDoc)
To: Markus Armbruster <armbru@redhat.com>
References: <20210519191718.3950330-1-jsnow@redhat.com>
 <20210519191718.3950330-4-jsnow@redhat.com>
 <87r1i14f9c.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <9d5fc364-7d3f-b09f-f7dc-5a36f471b11f@redhat.com>
Date: Thu, 20 May 2021 18:48:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87r1i14f9c.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 11:05 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Annotations do not change runtime behavior.
>>
>> This commit adds mostly annotations, but uses a TYPE_CHECKING runtime
>> check to conditionally import dependencies, which only triggers during
>> runs of mypy.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>>
>> ---
>>
>> TopLevelExpr, an idea from previous drafts, makes a return here in order
>> to give a semantic meaning to check_expr(). The type is intended to be
>> used more in forthcoming commits (pt5c), but I opted to include it now
>> instead of creating yet-another Dict[str, object] type hint that I would
>> forget to change later.
> 
> There's just one use.  Since you assure me it'll make sense later...
> 

Check for yourself in pt5c, patch #2.

>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/parser.py | 74 +++++++++++++++++++++++++-----------------
>>   1 file changed, 45 insertions(+), 29 deletions(-)
>>
>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>> index 71e982bff57..fefe4c37f44 100644
>> --- a/scripts/qapi/parser.py
>> +++ b/scripts/qapi/parser.py
>> @@ -18,6 +18,7 @@
>>   import os
>>   import re
>>   from typing import (
>> +    TYPE_CHECKING,
>>       Dict,
>>       List,
>>       Optional,
>> @@ -30,6 +31,14 @@
>>   from .source import QAPISourceInfo
>>   
>>   
>> +if TYPE_CHECKING:
>> +    # pylint: disable=cyclic-import
>> +    from .schema import QAPISchemaFeature, QAPISchemaMember
> 
> Oh boy :)
> 
> Any ideas on how to clean this up later?
> 

Uhhhh .........

It turns out you don't need the pylint pragma for pylint >= 2.8.x 
anymore. (But, I will leave this alone for now to try and offer some 
compatibility to older pylint versions, at least for a little while.)

Oddly enough I can't seme to get pylint to warn about the cycle at all 
right now, but it will still indeed crash at runtime without these 
shenanigans:

Traceback (most recent call last):
   File "/home/jsnow/src/qemu/scripts/qapi-gen.py", line 16, in <module>
     from qapi import main
   File "/home/jsnow/src/qemu/scripts/qapi/main.py", line 14, in <module>
     from .commands import gen_commands
   File "/home/jsnow/src/qemu/scripts/qapi/commands.py", line 25, in 
<module>
     from .gen import (
   File "/home/jsnow/src/qemu/scripts/qapi/gen.py", line 34, in <module>
     from .schema import (
   File "/home/jsnow/src/qemu/scripts/qapi/schema.py", line 24, in <module>
     from .expr import check_exprs
   File "/home/jsnow/src/qemu/scripts/qapi/expr.py", line 47, in <module>
     from .parser import QAPIDoc
   File "/home/jsnow/src/qemu/scripts/qapi/parser.py", line 30, in <module>
     from .schema import QAPISchemaFeature, QAPISchemaMember


schema -> expr -> parser -> schema is the cycle.

schema needs check_exprs and QAPISchemaParser both.
parser needs types from schema.

Maybe QAPISchema could be handed already-validated expressions instead, 
relying on common definition types in common.py instead to remove its 
dependency on the other modules.

It makes the constructor for QAPISchema a little less convenient, but it 
emphasizes that each module "does one thing, and does it well."

main.py or similar would need to compensate by breaking out more of the 
component steps into its generate() function.

>> +
>> +
>> +#: Represents a single Top Level QAPI schema expression.
>> +TopLevelExpr = Dict[str, object]
>> +
>>   # Return value alias for get_expr().
>>   _ExprValue = Union[List[object], Dict[str, object], str, bool]
>>   
>> @@ -447,7 +456,8 @@ class QAPIDoc:
>>       """
>>   
>>       class Section:
>> -        def __init__(self, parser, name=None, indent=0):
>> +        def __init__(self, parser: QAPISchemaParser,
>> +                     name: Optional[str] = None, indent: int = 0):
>>               # parser, for error messages about indentation
>>               self._parser = parser
>>               # optional section name (argument/member or section name)
>> @@ -459,7 +469,7 @@ def __init__(self, parser, name=None, indent=0):
>>           def __bool__(self) -> bool:
>>               return bool(self.name or self.text)
>>   
>> -        def append(self, line):
>> +        def append(self, line: str) -> None:
>>               # Strip leading spaces corresponding to the expected indent level
>>               # Blank lines are always OK.
>>               if line:
>> @@ -474,39 +484,40 @@ def append(self, line):
>>               self.text += line.rstrip() + '\n'
>>   
>>       class ArgSection(Section):
>> -        def __init__(self, parser, name, indent=0):
>> +        def __init__(self, parser: QAPISchemaParser,
>> +                     name: Optional[str] = None, indent: int = 0):
>>               super().__init__(parser, name, indent)
>> -            self.member = None
>> +            self.member: Optional['QAPISchemaMember'] = None
>>   
>> -        def connect(self, member):
>> +        def connect(self, member: 'QAPISchemaMember') -> None:
>>               self.member = member
>>   
>> -    def __init__(self, parser, info):
>> +    def __init__(self, parser: QAPISchemaParser, info: QAPISourceInfo):
>>           # self._parser is used to report errors with QAPIParseError.  The
>>           # resulting error position depends on the state of the parser.
>>           # It happens to be the beginning of the comment.  More or less
>>           # servicable, but action at a distance.
>>           self._parser = parser
>>           self.info = info
>> -        self.symbol = None
>> +        self.symbol: Optional[str] = None
>>           self.body = QAPIDoc.Section(parser)
>>           # dict mapping parameter name to ArgSection
>> -        self.args = OrderedDict()
>> -        self.features = OrderedDict()
>> +        self.args: Dict[str, QAPIDoc.ArgSection] = OrderedDict()
>> +        self.features: Dict[str, QAPIDoc.ArgSection] = OrderedDict()
>>           # a list of Section
>> -        self.sections = []
>> +        self.sections: List[QAPIDoc.Section] = []
>>           # the current section
>>           self._section = self.body
>>           self._append_line = self._append_body_line
>>   
>> -    def has_section(self, name):
>> +    def has_section(self, name: str) -> bool:
>>           """Return True if we have a section with this name."""
>>           for i in self.sections:
>>               if i.name == name:
>>                   return True
>>           return False
>>   
>> -    def append(self, line):
>> +    def append(self, line: str) -> None:
>>           """
>>           Parse a comment line and add it to the documentation.
>>   
>> @@ -527,18 +538,18 @@ def append(self, line):
>>           line = line[1:]
>>           self._append_line(line)
>>   
>> -    def end_comment(self):
>> +    def end_comment(self) -> None:
>>           self._end_section()
>>   
>>       @staticmethod
>> -    def _is_section_tag(name):
>> +    def _is_section_tag(name: str) -> bool:
>>           return name in ('Returns:', 'Since:',
>>                           # those are often singular or plural
>>                           'Note:', 'Notes:',
>>                           'Example:', 'Examples:',
>>                           'TODO:')
>>   
>> -    def _append_body_line(self, line):
>> +    def _append_body_line(self, line: str) -> None:
>>           """
>>           Process a line of documentation text in the body section.
>>   
>> @@ -578,7 +589,7 @@ def _append_body_line(self, line):
>>               # This is a free-form documentation block
>>               self._append_freeform(line)
>>   
>> -    def _append_args_line(self, line):
>> +    def _append_args_line(self, line: str) -> None:
>>           """
>>           Process a line of documentation text in an argument section.
>>   
>> @@ -624,7 +635,7 @@ def _append_args_line(self, line):
>>   
>>           self._append_freeform(line)
>>   
>> -    def _append_features_line(self, line):
>> +    def _append_features_line(self, line: str) -> None:
>>           name = line.split(' ', 1)[0]
>>   
>>           if name.startswith('@') and name.endswith(':'):
>> @@ -656,7 +667,7 @@ def _append_features_line(self, line):
>>   
>>           self._append_freeform(line)
>>   
>> -    def _append_various_line(self, line):
>> +    def _append_various_line(self, line: str) -> None:
>>           """
>>           Process a line of documentation text in an additional section.
>>   
>> @@ -692,7 +703,11 @@ def _append_various_line(self, line):
>>   
>>           self._append_freeform(line)
>>   
>> -    def _start_symbol_section(self, symbols_dict, name, indent):
>> +    def _start_symbol_section(
>> +            self,
>> +            symbols_dict: Dict[str, 'QAPIDoc.ArgSection'],
> 
> Sure we need to quote QAPIDoc.ArgSection here?
> 

Yes ... due to *when* this definition is evaluated. (It's BEFORE QAPIDoc 
is finished being defined. It's unavailable at evaluation time.)

Python 3.7+ allows us to use

from __future__ import annotations

which allows us to drop the quotes. This becomes the default behavior in 
3.10 or whatever. They may have pushed it back to 3.11.

>> +            name: str,
>> +            indent: int) -> None:
>>           # FIXME invalid names other than the empty string aren't flagged
>>           if not name:
>>               raise QAPIParseError(self._parser, "invalid parameter name")
>> @@ -704,13 +719,14 @@ def _start_symbol_section(self, symbols_dict, name, indent):
>>           self._section = QAPIDoc.ArgSection(self._parser, name, indent)
>>           symbols_dict[name] = self._section
>>   
>> -    def _start_args_section(self, name, indent):
>> +    def _start_args_section(self, name: str, indent: int) -> None:
>>           self._start_symbol_section(self.args, name, indent)
>>   
>> -    def _start_features_section(self, name, indent):
>> +    def _start_features_section(self, name: str, indent: int) -> None:
>>           self._start_symbol_section(self.features, name, indent)
>>   
>> -    def _start_section(self, name=None, indent=0):
>> +    def _start_section(self, name: Optional[str] = None,
>> +                       indent: int = 0) -> None:
>>           if name in ('Returns', 'Since') and self.has_section(name):
>>               raise QAPIParseError(self._parser,
>>                                    "duplicated '%s' section" % name)
>> @@ -718,7 +734,7 @@ def _start_section(self, name=None, indent=0):
>>           self._section = QAPIDoc.Section(self._parser, name, indent)
>>           self.sections.append(self._section)
>>   
>> -    def _end_section(self):
>> +    def _end_section(self) -> None:
>>           if self._section:
>>               text = self._section.text = self._section.text.strip()
>>               if self._section.name and (not text or text.isspace()):
>> @@ -727,7 +743,7 @@ def _end_section(self):
>>                       "empty doc section '%s'" % self._section.name)
>>               self._section = QAPIDoc.Section(self._parser)
>>   
>> -    def _append_freeform(self, line):
>> +    def _append_freeform(self, line: str) -> None:
>>           match = re.match(r'(@\S+:)', line)
>>           if match:
>>               raise QAPIParseError(self._parser,
>> @@ -735,28 +751,28 @@ def _append_freeform(self, line):
>>                                    % match.group(1))
>>           self._section.append(line)
>>   
>> -    def connect_member(self, member):
>> +    def connect_member(self, member: 'QAPISchemaMember') -> None:
> 
> Sure we need to quote QAPISchemaMember here?
> 

Yes, to avoid it being evaluated in non-type checking scenarios, to 
avoid the cycle.

>>           if member.name not in self.args:
>>               # Undocumented TODO outlaw
>>               self.args[member.name] = QAPIDoc.ArgSection(self._parser,
>>                                                           member.name)
>>           self.args[member.name].connect(member)
>>   
>> -    def connect_feature(self, feature):
>> +    def connect_feature(self, feature: 'QAPISchemaFeature') -> None:
> 
> Sure we need to quote QAPISchemaFeature here?
> 

ditto

>>           if feature.name not in self.features:
>>               raise QAPISemError(feature.info,
>>                                  "feature '%s' lacks documentation"
>>                                  % feature.name)
>>           self.features[feature.name].connect(feature)
>>   
>> -    def check_expr(self, expr):
>> +    def check_expr(self, expr: TopLevelExpr) -> None:
>>           if self.has_section('Returns') and 'command' not in expr:
>>               raise QAPISemError(self.info,
>>                                  "'Returns:' is only valid for commands")
>>   
>> -    def check(self):
>> +    def check(self) -> None:
>>   
>> -        def check_args_section(args):
>> +        def check_args_section(args: Dict[str, QAPIDoc.ArgSection]) -> None:
>>               bogus = [name for name, section in args.items()
>>                        if not section.member]
>>               if bogus:

Current opinion is to just leave well enough alone, but I can be 
motivated to do further cleanups after part 6 to attempt to remove cycles.

If I press forward with my Sphinx extension, QAPIDoc is going to need a 
rewrite anyway. I can do it then.

--js


