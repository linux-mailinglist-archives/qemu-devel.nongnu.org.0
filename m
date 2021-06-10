Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182F13A3010
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 18:04:37 +0200 (CEST)
Received: from localhost ([::1]:41594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrNAZ-0000xR-SJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 12:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrN6E-0001MR-1g
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:00:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrN6A-0004ic-Gd
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623340801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1TnX2LOTEuUqLvUGOnhgczbxwChaJdSVE0QfVAMlAc=;
 b=AveYW+wTJXu5myFW/GgjDvUovsU4LOgXDPK7n+ijtUBl4JjT5/TEnez6kHw+Srta4nATc0
 14mqGp4P6HSxSHAL4x1WOio2VD42qN3idLHkaqmVGXwjooaMN9hNZ+ooyUPEEB7BBRKAK/
 628ub3elN3vjSWzK8DtgVj0YwbaFrTE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-RXsdNSJWOZei0Og24k3gzQ-1; Thu, 10 Jun 2021 11:59:58 -0400
X-MC-Unique: RXsdNSJWOZei0Og24k3gzQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 128-20020a1c04860000b0290196f3c0a927so4108561wme.3
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 08:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i1TnX2LOTEuUqLvUGOnhgczbxwChaJdSVE0QfVAMlAc=;
 b=I8edqIGt42QMneeGD99abMpBATw9NxRLtw0wt2CR56UHR3oDxnUmV+AZxNjbLzcMnH
 C36ToLxq5tHXrd4IpgDFp28Fq6XTCPJXwvp73AlCCJnAOkIKnhsQNTuC/a4x4ExYxwHQ
 F7YLq+tkFPLcK07eboZhJXsyipX2uE5lIgxD6xKNX77wNv/5reGwcr5kpWn0zm4IgEZQ
 +A5BfAEUwD9iLATYH7S31gnHBp0T7+Rin5ZDdaSsn0rjjmxn3lFdLDym+nXTmxjaiP0z
 7vzlOaCB/3Fe9tzpITFwVhpaUtrmOef+r8tUUUpgriDcivDpB2CSf0qAp+46GgtQwr11
 6iHg==
X-Gm-Message-State: AOAM532o8BOEY97PbfeX6U6pQKlHKmHNUAzCQq4Bykvt76nTY0NZYakH
 rrC1huC+GZ/+OkT3AWemD+NQenx8bVYyLFC7tkJ7dHkH4DszvV54dax2fizwsSYc0UNbxzQA/nl
 ODv42ltfdVyLN7ds=
X-Received: by 2002:a5d:4a43:: with SMTP id v3mr6139564wrs.397.1623340797478; 
 Thu, 10 Jun 2021 08:59:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYooDu73GYsV7axPZ7qiMA83yD3BXv7EGWH2X1qebyGqTvAhaxoI0ijU+bOXqb2hU1YcJT8g==
X-Received: by 2002:a5d:4a43:: with SMTP id v3mr6139533wrs.397.1623340797188; 
 Thu, 10 Jun 2021 08:59:57 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id z10sm1275724wmp.39.2021.06.10.08.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 08:59:56 -0700 (PDT)
Subject: Re: [RFC PATCH v2 1/2] qapi: Inline qmp_marshal_output() functions
To: Markus Armbruster <armbru@redhat.com>
References: <20210609184955.1193081-1-philmd@redhat.com>
 <20210609184955.1193081-2-philmd@redhat.com>
 <20210609202952.r4nb2smrptyckvk2@redhat.com>
 <87eedadpxt.fsf@dusky.pond.sub.org>
 <4050a737-5539-c6a8-3d60-78fc9721a865@redhat.com>
 <87r1haasht.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <76d76c8e-5c0a-d676-f3d7-2d256d033294@redhat.com>
Date: Thu, 10 Jun 2021 17:59:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87r1haasht.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 1:06 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 6/10/21 11:33 AM, Markus Armbruster wrote:
>>> Eric Blake <eblake@redhat.com> writes:
>>>
>>>> On Wed, Jun 09, 2021 at 08:49:54PM +0200, Philippe Mathieu-Daudé wrote:
>>>>> In case we need to use QAPI types but no QAPI command / QAPI event
>>>>> actually use them, the generated qmp_marshal_output() function will
>>>>> trigger the compiler 'unused-function' warnings.
>>>>> To prevent that, emit these functions inlined: the compiler will
>>>>> ignore such unused functions.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> ---
>>>>> RFC: No clue about QAPI...
>>>>> Tested with GCC. If the compiler is picky we could use the 'unused'
>>>>> function attribute.
>>>>
>>>> And I have no clue if clang will warn about an unused inline function.
>>>> Going with the compiler attribute seems safer and just as easy to do
>>>> in the same two-line change (remember, the "unused" attribute merely
>>>> means "suppress warnings if I don't use this", and not "warn me if I
>>>> use it in spite of calling it unused").
>>>>
>>>>> ---
>>>>>  scripts/qapi/commands.py | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>>>>> index 0e13d510547..bbed776a909 100644
>>>>> --- a/scripts/qapi/commands.py
>>>>> +++ b/scripts/qapi/commands.py
>>>>> @@ -91,8 +91,8 @@ def gen_call(name: str,
>>>>>  def gen_marshal_output(ret_type: QAPISchemaType) -> str:
>>>>>      return mcgen('''
>>>>>  
>>>>> -static void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
>>>>> -                                QObject **ret_out, Error **errp)
>>>>> +static inline void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
>>>>> +                                        QObject **ret_out, Error **errp)
>>>>
>>>> On the other hand, the qapi generator is smart enough to only output
>>>> introspection data for qapi types that were actually used by a command
>>>> or event, so how is that working, and why is it not also being used to
>>>> elide the generation of unused qmp_marshal_output_FOO functions?  This
>>>> is where I'll have to defer to Markus.
>>>
>>> This is a QAPI generator restriction.  Let me explain.
>>>
>>> The qmp_marshal_output_T() are shared by all commands returning T.
>>>
>>> The commands may be conditional.  The user is responsible for making T's
>>> 'if' the conjunction of the commands'.  See the FIXME in commands.py.
>>
>> Yes, I noticed the FIXME:
>>
>>     # FIXME: If T is a user-defined type, the user is responsible
>>     # for making this work, i.e. to make T's condition the
>>     # conjunction of the T-returning commands' conditions.  If T
>>     # is a built-in type, this isn't possible: the
>>     # qmp_marshal_output_T() will be generated unconditionally.
>>
>> Using inline / unused attributes don't invalidate this :)
> 
> Generating the unused attribute lets us keep types unconditional even
> when the commands returning them are conditional (also takes care of the
> built-in case, where we cannot make the type conditional).
> 
> However, conditional commands returning an unconditional type is a bit
> of a code smell.  In this particular case, the smell seems to lead to a
> (minor) issue: too much TPM code is compiled even when CONFIG_TPM is
> off.  With the attribute in place, we wouldn't have learned this.
> 
> We may still find non-smelly instances of this pattern.  Until then, I'm
> a bit reluctant to generate the attribute.

I agree with your nose :)

>>> If I do this for tpm.json (appended), then tpm.h misses TpmModel when
>>> CONFIG_TPM is off, and tpm_backend.h misses TpmType and TpmInfo.  I
>>> suspect more TPM code needs to be guarded by CONFIG_TPM.
>>
>> Yes, this is what I did first, use the code below and add #ifdef'ry,
>> but the code becomes ugly and harder to maintain because the enums
>> are used in middle of a QOM interface structure:
>>
>> include/sysemu/tpm.h-37-struct TPMIfClass {
>> include/sysemu/tpm.h-38-    InterfaceClass parent_class;
>> include/sysemu/tpm.h-39-
>> include/sysemu/tpm.h:40:    enum TpmModel model;
>> include/sysemu/tpm.h-41-    void (*request_completed)(TPMIf *obj, int ret);
>> include/sysemu/tpm.h-42-    enum TPMVersion (*get_version)(TPMIf *obj);
>> include/sysemu/tpm.h-43-};
>> include/sysemu/tpm.h-44-
>>
>> If you think using inline / unused attributes is not an option for
>> QAPI, then the #ifdef'ry isn't worth it and I'd prefer use v1 which
>> doesn't use conditional QAPI suggested by Marc-André.
> 
> Ignorant question: why do we want to define QOM type "tpm-if" when
> CONFIG_TPM is off?

Good question. I suppose for historical reasons? Copy/pasting of
another older include/sysemu/ files? Recently I saw these headers
received more love, such better #ifdef'ry to allow code elision.

I'll defer that to Stefan.

Thanks for the review,

Phil.


