Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734A36B881
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 20:03:01 +0200 (CEST)
Received: from localhost ([::1]:44210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb5ZU-00063z-2u
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 14:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb5XK-00054c-00
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 14:00:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lb5XF-0005Zo-QG
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 14:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619460040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LcD7W0Tcfg0Dr8QRUoCylq8fLi05BhNpC9THEPk841Q=;
 b=KEZMHOnBESy1AjeDalqoA/1Do9CuQ3uR/pZzU4+CyQ3GS9FBNnWe6Iuwqwxda+RmAKsWp3
 aBsx0OhkJQ8NYstm+TVJQVfw/J8xiN+ME8UNNI8u9mo92Hhyp2HDNqAqK///QkYRW+aqt8
 jRQIwbJSmxZ18krhUCp61fQLD9Dd3Bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-im7qSGNLM76UCLBQSEOHPQ-1; Mon, 26 Apr 2021 14:00:37 -0400
X-MC-Unique: im7qSGNLM76UCLBQSEOHPQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41F988030B5;
 Mon, 26 Apr 2021 18:00:36 +0000 (UTC)
Received: from [10.10.120.13] (ovpn-120-13.rdu2.redhat.com [10.10.120.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CF2010074F1;
 Mon, 26 Apr 2021 18:00:35 +0000 (UTC)
Subject: Re: [PATCH 12/22] qapi/parser: add type hint annotations
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-13-jsnow@redhat.com>
 <87zgxm5yrp.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <b19c350f-19f0-9f68-7531-d0a1db8e410e@redhat.com>
Date: Mon, 26 Apr 2021 14:00:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87zgxm5yrp.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/21 8:34 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Annotations do not change runtime behavior.
>> This commit *only* adds annotations.
>>
>> (Annotations for QAPIDoc are in a later commit.)
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/parser.py | 61 ++++++++++++++++++++++++++++--------------
>>   1 file changed, 41 insertions(+), 20 deletions(-)
>>
>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>> index d02a134aae9..f2b57d5642a 100644
>> --- a/scripts/qapi/parser.py
>> +++ b/scripts/qapi/parser.py
>> @@ -17,16 +17,29 @@
>>   from collections import OrderedDict
>>   import os
>>   import re
>> -from typing import List
>> +from typing import (
>> +    Dict,
>> +    List,
>> +    Optional,
>> +    Set,
>> +    Union,
>> +)
>>   
>>   from .common import match_nofail
>>   from .error import QAPISemError, QAPISourceError
>>   from .source import QAPISourceInfo
>>   
>>   
>> +#: Represents a parsed JSON object; semantically: one QAPI schema expression.
>> +Expression = Dict[str, object]
> 
> I believe you use this for what qapi-code-gen.txt calls a top-level
> expression.  TopLevelExpression is rather long, but it's used just once,
> and once more in RFC PATCH 13.  What do you think?
> 

Yeah, I left a comment on gitlab about this -- Sorry for splitting the 
stream, I didn't expect you to reply on-list without at least clicking 
the link ;)

You're right, this is TOP LEVEL EXPR. I actually do mean to start using 
it in expr.py as well too, in what will become (I think) pt5c: 
non-immediately-necessary parser cleanups.

I can use TopLevelExpression as the type name if you'd like, but if you 
have a suggestion for something shorter I am open to suggestions if 
"Expression" is way too overloaded/confusing.

>> +
>> +# Return value alias for get_expr().
>> +_ExprValue = Union[List[object], Dict[str, object], str, bool]
> 
> This is essentially a node in our pidgin-JSON parser's abstract syntax
> tree.  Tree roots use the Dict branch of this Union.
> 
> See also my review of PATCH 06.
> 

OK, I skimmed that one for now but I'll get back to it.

>> +
>> +
>>   class QAPIParseError(QAPISourceError):
>>       """Error class for all QAPI schema parsing errors."""
>> -    def __init__(self, parser, msg):
>> +    def __init__(self, parser: 'QAPISchemaParser', msg: str):
> 
> Forward reference needs quotes.  Can't be helped.
> 
>>           col = 1
>>           for ch in parser.src[parser.line_pos:parser.pos]:
>>               if ch == '\t':
>> @@ -38,7 +51,10 @@ def __init__(self, parser, msg):
>>   
>>   class QAPISchemaParser:
>>   
>> -    def __init__(self, fname, previously_included=None, incl_info=None):
>> +    def __init__(self,
>> +                 fname: str,
>> +                 previously_included: Optional[Set[str]] = None,
> 
> This needs to be Optional[] because using the empty set as default
> parameter value would be a dangerous trap.  Python's choice to evaluate
> the default parameter value just once has always been iffy.  Stirring
> static typing into the language makes it iffier.  Can't be helped.
> 

We could force it to accept a tuple and convert it into a set 
internally. It's just that we seem to use it for sets now.

Or ... in pt5c I float the idea of just passing the parent parser in, 
and I reach up and grab the previously-included stuff directly.

>> +                 incl_info: Optional[QAPISourceInfo] = None):
>>           self._fname = fname
>>           self._included = previously_included or set()
>>           self._included.add(os.path.abspath(self._fname))
>> @@ -46,20 +62,20 @@ def __init__(self, fname, previously_included=None, incl_info=None):
>>   
>>           # Lexer state (see `accept` for details):
>>           self.info = QAPISourceInfo(self._fname, incl_info)
>> -        self.tok = None
>> +        self.tok: Optional[str] = None
> 
> Would
> 
>             self.tok: str
> 
> work?
> 

Not without modifications, because the Token being None is used to 
represent EOF.

>>           self.pos = 0
>>           self.cursor = 0
>> -        self.val = None
>> +        self.val: Optional[Union[bool, str]] = None
>>           self.line_pos = 0
>>   
>>           # Parser output:
>> -        self.exprs = []
>> -        self.docs = []
>> +        self.exprs: List[Expression] = []
>> +        self.docs: List[QAPIDoc] = []
>>   
>>           # Showtime!
>>           self._parse()
>>   
>> -    def _parse(self):
>> +    def _parse(self) -> None:
>>           cur_doc = None
>>   
>>           with open(self._fname, 'r', encoding='utf-8') as fp:
>> @@ -122,7 +138,7 @@ def _parse(self):
>>           self.reject_expr_doc(cur_doc)
>>   
>>       @staticmethod
>> -    def reject_expr_doc(doc):
>> +    def reject_expr_doc(doc: Optional['QAPIDoc']) -> None:
>>           if doc and doc.symbol:
>>               raise QAPISemError(
>>                   doc.info,
>> @@ -130,10 +146,14 @@ def reject_expr_doc(doc):
>>                   % doc.symbol)
>>   
>>       @staticmethod
>> -    def _include(include, info, incl_fname, previously_included):
>> +    def _include(include: str,
>> +                 info: QAPISourceInfo,
>> +                 incl_fname: str,
>> +                 previously_included: Set[str]
>> +                 ) -> Optional['QAPISchemaParser']:
>>           incl_abs_fname = os.path.abspath(incl_fname)
>>           # catch inclusion cycle
>> -        inf = info
>> +        inf: Optional[QAPISourceInfo] = info
>>           while inf:
>>               if incl_abs_fname == os.path.abspath(inf.fname):
>>                   raise QAPISemError(info, "inclusion loop for %s" % include)
>> @@ -152,9 +172,9 @@ def _include(include, info, incl_fname, previously_included):
>>               ) from err
>>   
>>       @staticmethod
>> -    def _pragma(name, value, info):
>> +    def _pragma(name: str, value: object, info: QAPISourceInfo) -> None:
> 
> value: object isn't wrong, but why not _ExprValue?
> 

I forget; admit this one slipped through from an earlier revision.

Right now: because _ExprValue is too broad. It really wants Dict[str, 
object] but the typing on get_expr() is challenging.

I'll revisit this with better excuses after I digest your patch 6 review.

>>   
>> -        def _check(name, value) -> List[str]:
>> +        def _check(name: str, value: object) -> List[str]:
>>               if (not isinstance(value, list) or
>>                       any([not isinstance(elt, str) for elt in value])):
>>                   raise QAPISemError(
>> @@ -176,7 +196,7 @@ def _check(name, value) -> List[str]:
>>           else:
>>               raise QAPISemError(info, "unknown pragma '%s'" % name)
>>   
>> -    def accept(self, skip_comment=True):
>> +    def accept(self, skip_comment: bool = True) -> None:
>>           while True:
>>               self.tok = self.src[self.cursor]
>>               self.pos = self.cursor
>> @@ -240,8 +260,8 @@ def accept(self, skip_comment=True):
>>                                        self.src[self.cursor-1:])
>>                   raise QAPIParseError(self, "stray '%s'" % match.group(0))
>>   
>> -    def get_members(self):
>> -        expr = OrderedDict()
>> +    def get_members(self) -> 'OrderedDict[str, object]':
>> +        expr: 'OrderedDict[str, object]' = OrderedDict()
>>           if self.tok == '}':
>>               self.accept()
>>               return expr
>> @@ -267,8 +287,8 @@ def get_members(self):
>>               if self.tok != "'":
>>                   raise QAPIParseError(self, "expected string")
>>   
>> -    def get_values(self):
>> -        expr = []
>> +    def get_values(self) -> List[object]:
>> +        expr: List[object] = []
>>           if self.tok == ']':
>>               self.accept()
>>               return expr
>> @@ -284,8 +304,9 @@ def get_values(self):
>>                   raise QAPIParseError(self, "expected ',' or ']'")
>>               self.accept()
>>   
>> -    def get_expr(self, nested):
>> +    def get_expr(self, nested: bool = False) -> _ExprValue:
>>           # TODO: Teach mypy that nested=False means the retval is a Dict.
>> +        expr: _ExprValue
>>           if self.tok != '{' and not nested:
>>               raise QAPIParseError(self, "expected '{'")
>>           if self.tok == '{':
>> @@ -303,7 +324,7 @@ def get_expr(self, nested):
>>                   self, "expected '{', '[', string, or boolean")
>>           return expr
>>   
>> -    def get_doc(self, info):
>> +    def get_doc(self, info: QAPISourceInfo) -> List['QAPIDoc']:
>>           if self.val != '##':
>>               raise QAPIParseError(
>>                   self, "junk after '##' at start of documentation comment")

Thanks!

--js


