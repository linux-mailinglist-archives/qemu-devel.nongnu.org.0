Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FE7286208
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 17:25:06 +0200 (CEST)
Received: from localhost ([::1]:57282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQBJQ-0000KP-Vg
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 11:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQBHm-0008Jy-Uh
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 11:23:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQBHi-0003jt-Rb
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 11:23:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602084195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4kAEOY/AQFgolJmBPAGyBiwVlzMTPP2tKutiBsD5MY=;
 b=HjsigZrDnj5pqtuzhBrmrjhfS3YPoaw53fDUdfU0nGKESODCy0QV0pGtb1A3jSSopz6D49
 Jin63AuLWk4XPrEqFt/pgepA4m1dsekSCqozNP0nTSGJm5wOY+N6O5WtpSyqVleTJoYQYv
 FJ+fIbti5OvJgZIMTFlOpjzw6uQ6hxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-6cAcv3pAMFCIptSFnHXlWQ-1; Wed, 07 Oct 2020 11:23:10 -0400
X-MC-Unique: 6cAcv3pAMFCIptSFnHXlWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ECC2EA5F5
 for <qemu-devel@nongnu.org>; Wed,  7 Oct 2020 15:23:09 +0000 (UTC)
Received: from [10.10.120.38] (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1D4A6EF62;
 Wed,  7 Oct 2020 15:23:07 +0000 (UTC)
Subject: Re: [PATCH v5 16/36] qapi/common.py: Convert comments into
 docstrings, and elaborate
To: Markus Armbruster <armbru@redhat.com>
References: <20201005195158.2348217-1-jsnow@redhat.com>
 <20201005195158.2348217-17-jsnow@redhat.com>
 <87zh4ygzzb.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <762ffec5-088f-8f25-b298-99e50abe7909@redhat.com>
Date: Wed, 7 Oct 2020 11:23:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87zh4ygzzb.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:54:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/20 5:14 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> As docstrings, they'll show up in documentation and IDE help.
>>
>> The docstring style being targeted is the Sphinx documentation
>> style. Sphinx uses an extension of ReST with "domains". We use the
>> (implicit) Python domain, which supports a number of custom "info
>> fields". Those info fields are documented here:
>> https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html#info-field-lists
>>
>> Primarily, we use `:param X: descr`, `:return[s]: descr`, and `:raise[s]
>> Z: when`. Everything else is the Sphinx dialect of ReST.
>>
>> (No, nothing checks or enforces this style that I am aware of. Sphinx
>> either chokes or succeeds, but does not enforce a standard of what is
>> otherwise inside the docstring. Pycharm does highlight when your param
>> fields are not aligned with the actual fields present. It does not
>> highlight missing return or exception statements. There is no existing
>> style guide I am aware of that covers a standard for a minimally
>> acceptable docstring. I am debating writing one.)
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   scripts/qapi/common.py | 53 +++++++++++++++++++++++++++++++-----------
>>   1 file changed, 39 insertions(+), 14 deletions(-)
>>
>> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
>> index 74a2c001ed9..0ef38ea5fe0 100644
>> --- a/scripts/qapi/common.py
>> +++ b/scripts/qapi/common.py
>> @@ -15,15 +15,24 @@
>>   from typing import Optional, Sequence
>>   
>>   
>> +#: Sentinel value that causes all space to its right to be removed.
> 
> What's the purpose of : after # ?
> 

Documents this name in Sphinx. We had a small discussion about it, I 
think; "Does using this special form or the docstring make the comment 
visible in any IDE?" (No.)

There's no Python-AST way to document these, but there is a Sphinx way 
to document them, so I did that.

(Doing it like this allows `EATSPACE` to be used as a cross-reference.)

> I'm not sure this is a "sentinel value".  Wikipedia:
> 
>      In computer programming, a sentinel value (also referred to as a
>      flag value, trip value, rogue value, signal value, or dummy data)[1]
>      is a special value in the context of an algorithm which uses its
>      presence as a condition of termination, typically in a loop or
>      recursive algorithm.
> 
>      https://en.wikipedia.org/wiki/Sentinel_value
> 

I really should try to learn English as a second language so I know what 
any of the words I use mean, I guess. I had slipped to a less strict 
usage where it meant more like "placeholder".

> Perhaps
> 
>     # Magic string value that gets removed along with all space to the
>     # right.
> 

This can be written on one line if we gently disregard the 72 column 
limit. (Maybe you already did when you wrote it and my client wrapped 
it. Who knows!)

>>   EATSPACE = '\033EATSPACE.'
>>   POINTER_SUFFIX = ' *' + EATSPACE
>>   _C_NAME_TRANS = str.maketrans('.-', '__')
>>   
>>   
>> -# ENUMName -> ENUM_NAME, EnumName1 -> ENUM_NAME1
>> -# ENUM_NAME -> ENUM_NAME, ENUM_NAME1 -> ENUM_NAME1, ENUM_Name2 -> ENUM_NAME2
>> -# ENUM24_Name -> ENUM24_NAME
>>   def camel_to_upper(value: str) -> str:
>> +    """
>> +    Converts CamelCase to CAMEL_CASE.
>> +
>> +    Examples:
>> +      ENUMName -> ENUM_NAME
>> +      EnumName1 -> ENUM_NAME1
>> +      ENUM_NAME -> ENUM_NAME
>> +      ENUM_NAME1 -> ENUM_NAME1
>> +      ENUM_Name2 -> ENUM_NAME2
>> +      ENUM24_Name -> ENUM24_NAME
>> +    """
> 
> I wonder whether these indented lines get wrapped into one
> unintelligible parapgraph.
> 
> Have you eyeballed the output of Sphinx?
> 

Eyeballed, but didn't validate this specific one. Yeah, it's nonsense.

Examples::

     ENUMName -> ENUM_NAME

etc. works better.

>>       c_fun_str = c_name(value, False)
>>       if value.isupper():
>>           return c_fun_str
>> @@ -45,21 +54,33 @@ def camel_to_upper(value: str) -> str:
>>   def c_enum_const(type_name: str,
>>                    const_name: str,
>>                    prefix: Optional[str] = None) -> str:
>> +    """
>> +    Generate a C enumeration constant name.
>> +
>> +    :param type_name: The name of the enumeration.
>> +    :param const_name: The name of this constant.
>> +    :param prefix: Optional, prefix that overrides the type_name.
>> +    """
>>       if prefix is not None:
>>           type_name = prefix
>>       return camel_to_upper(type_name) + '_' + c_name(const_name, False).upper()
>>   
>>   
>> -# Map @name to a valid C identifier.
>> -# If @protect, avoid returning certain ticklish identifiers (like
>> -# C keywords) by prepending 'q_'.
>> -#
>> -# Used for converting 'name' from a 'name':'type' qapi definition
>> -# into a generated struct member, as well as converting type names
>> -# into substrings of a generated C function name.
>> -# '__a.b_c' -> '__a_b_c', 'x-foo' -> 'x_foo'
>> -# protect=True: 'int' -> 'q_int'; protect=False: 'int' -> 'int'
>>   def c_name(name: str, protect: bool = True) -> str:
>> +    """
>> +    Map ``name`` to a valid C identifier.
>> +
>> +    Used for converting 'name' from a 'name':'type' qapi definition
>> +    into a generated struct member, as well as converting type names
>> +    into substrings of a generated C function name.
>> +
>> +    '__a.b_c' -> '__a_b_c', 'x-foo' -> 'x_foo'
>> +    protect=True: 'int' -> 'q_int'; protect=False: 'int' -> 'int'
>> +
>> +    :param name: The name to map.
>> +    :param protect: If true, avoid returning certain ticklish identifiers
>> +                    (like C keywords) by prepending ``q_``.
>> +    """
>>       # ANSI X3J11/88-090, 3.1.1
>>       c89_words = set(['auto', 'break', 'case', 'char', 'const', 'continue',
>>                        'default', 'do', 'double', 'else', 'enum', 'extern',
>> @@ -129,12 +150,16 @@ def decrease(self, amount: int = 4) -> None:
>>           self._level -= amount
>>   
>>   
>> +#: Global, current indent level for code generation.
>>   indent = Indentation()
>>   
>>   
>> -# Generate @code with @kwds interpolated.
>> -# Obey indent, and strip EATSPACE.
>>   def cgen(code: str, **kwds: object) -> str:
>> +    """
>> +    Generate ``code`` with ``kwds`` interpolated.
>> +
>> +    Obey `indent`, and strip `EATSPACE`.
>> +    """
>>       raw = code % kwds
>>       if indent:
>>           raw = re.sub(r'^(?!(#|$))', str(indent), raw, flags=re.MULTILINE)


