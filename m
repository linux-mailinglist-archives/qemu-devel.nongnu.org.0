Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A6B26FB3F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 13:17:25 +0200 (CEST)
Received: from localhost ([::1]:41438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJEOK-0003kH-0r
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 07:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kJENF-0003Gx-Br
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 07:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kJELI-00024g-AN
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 07:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600427654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HEHSYGV1lSq3WMxbVmGAvpLzkVKnYNN/UzjnIX/TR/U=;
 b=KmU9fBSd50MlF44KXkgixW2RNquPmO2cBMnSbs0wjXI8LDYbXJF/mYobRigBvqwgFCmwpK
 pTGYJq2wtxYEnPwF2XXJvdku1c94wfXEbcsyKFXU/TiThm83xZMbw84JP/g6XgP8tCSpzv
 gJrE0srRQoW/Pc6zBSxkqz53tGveTaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-3OTAZtmZMzafDp5t8ulb-g-1; Fri, 18 Sep 2020 07:14:10 -0400
X-MC-Unique: 3OTAZtmZMzafDp5t8ulb-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA21110082EB;
 Fri, 18 Sep 2020 11:14:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AF5710013C1;
 Fri, 18 Sep 2020 11:14:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EEB76113864A; Fri, 18 Sep 2020 13:14:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 13/37] qapi/common.py: add notational type hints
References: <20200915224027.2529813-1-jsnow@redhat.com>
 <20200915224027.2529813-14-jsnow@redhat.com>
 <87h7rwpj8d.fsf@dusky.pond.sub.org>
 <d1f725b3-c23c-d619-5cd2-ead63e3faa9a@redhat.com>
Date: Fri, 18 Sep 2020 13:14:07 +0200
In-Reply-To: <d1f725b3-c23c-d619-5cd2-ead63e3faa9a@redhat.com> (John Snow's
 message of "Thu, 17 Sep 2020 14:18:02 -0400")
Message-ID: <87r1qzibgg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 00:20:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 9/17/20 10:32 AM, Markus Armbruster wrote:
>> Question on the subject line: what makes a type hint notational?
>> 
>
> My cover letter explains that every time I use this phrase, I mean to
> state that "This patch adds exclusively type notations and makes no 
> functional changes to the runtime operation whatsoever."
>
> i.e. notations-only.

By the time I get to PATCH 13, details explained in the cover letter
have been flushed from my memory.  Moreover, the cover letter won't make
it into Git.  Best to repeat them right in the commit message.  Perhaps:

    qapi/common; Add type hints

    Type hints do not change behavior.

>> John Snow <jsnow@redhat.com> writes:
>> 
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/common.py | 27 ++++++++++++++++-----------
>>>   1 file changed, 16 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
>>> index 4c079755d3..af01348b35 100644
>>> --- a/scripts/qapi/common.py
>>> +++ b/scripts/qapi/common.py
>>> @@ -12,6 +12,7 @@
>>>   # See the COPYING file in the top-level directory.
>>>     import re
>>> +from typing import Optional, Union, Sequence
>>>     
>>>   EATSPACE = '\033EATSPACE.'
>>> @@ -22,7 +23,7 @@
>>>   # ENUMName -> ENUM_NAME, EnumName1 -> ENUM_NAME1
>>>   # ENUM_NAME -> ENUM_NAME, ENUM_NAME1 -> ENUM_NAME1, ENUM_Name2 -> ENUM_NAME2
>>>   # ENUM24_Name -> ENUM24_NAME
>>> -def camel_to_upper(value):
>>> +def camel_to_upper(value: str) -> str:
>>>       c_fun_str = c_name(value, False)
>>>       if value.isupper():
>>>           return c_fun_str
>>> @@ -41,7 +42,9 @@ def camel_to_upper(value):
>>>       return new_name.lstrip('_').upper()
>>>     
>>> -def c_enum_const(type_name, const_name, prefix=None):
>>> +def c_enum_const(type_name: str,
>>> +                 const_name: str,
>>> +                 prefix: Optional[str] = None) -> str:
>>>       if prefix is not None:
>>>           type_name = prefix
>>>       return camel_to_upper(type_name) + '_' + c_name(const_name, False).upper()
>>> @@ -56,7 +59,7 @@ def c_enum_const(type_name, const_name, prefix=None):
>>>   # into substrings of a generated C function name.
>>>   # '__a.b_c' -> '__a_b_c', 'x-foo' -> 'x_foo'
>>>   # protect=True: 'int' -> 'q_int'; protect=False: 'int' -> 'int'
>>> -def c_name(name, protect=True):
>>> +def c_name(name: str, protect: bool = True) -> str:
>>>       # ANSI X3J11/88-090, 3.1.1
>>>       c89_words = set(['auto', 'break', 'case', 'char', 'const', 'continue',
>>>                        'default', 'do', 'double', 'else', 'enum', 'extern',
>>> @@ -134,24 +137,24 @@ def pop(self, amount: int = 4) -> int:
>>>     # Generate @code with @kwds interpolated.
>>>   # Obey INDENT level, and strip EATSPACE.
>>> -def cgen(code, **kwds):
>>> +def cgen(code: str, **kwds: Union[str, int]) -> str:
>> Hmm.
>> The @kwds values can be anything, provided they match the conversion
>> specifiers in @code:
>> 
>>>       raw = code % kwds
>> Your type hint adds a restriction that wasn't there before.
>> Is there a better way?
>> 
>
> Maybe there are format-like type annotation tricks you can do to
> enforce this, but I did not research them. I tried to resist
> "improving" our usage of the old % formatter prematurely. I may do a
> wholesale f-string conversion at some point, but not now, it's not
> important.
>
> In practice, we pass strings and integers. This typing *is*
> artificially restrictive, though. We can declare the type to be "Any"
> and allow the function to fail or succeed at runtime if you'd prefer.
>
>>>       if INDENT:
>>>           raw, _ = re.subn(r'^(?!(#|$))', str(INDENT), raw, flags=re.MULTILINE)
>>>       return re.sub(re.escape(EATSPACE) + r' *', '', raw)
>>>     
>>> -def mcgen(code, **kwds):
>>> +def mcgen(code: str, **kwds: Union[str, int]) -> str:
>> Likewise.
>> 
>
> Unresearched idea: It's possible that we can subclass the
> string.Formatter class and extend it to perform our special variable 
> replacements (chomping EATSPACE, etc.)
>
> And *maybe* because it inherits from the standard formatter, we would
> benefit from any analysis Mypy performs on such things.
>
> Basically, replace mcgen/cgen with class CFormatter(string.Formatter).
>
> (maybe. assume that none of what I just said will work or is feasible.)

Sounds worth exploring.  No need to do it now, of course.


