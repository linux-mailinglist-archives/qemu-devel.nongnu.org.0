Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0871F453895
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:34:34 +0100 (CET)
Received: from localhost ([::1]:41698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn2Lo-0000LL-TI
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:34:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mn2K0-0007kP-4o
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:32:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mn2Jx-0005VN-Pv
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:32:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637083956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wMFCuemyxiuT6X/YrJG6Ua24xJxiATlq7pLWpytdHUk=;
 b=hGqV+lhALeWg6oHSQDrkxfvY7gje2twyCVhMNGf6UHCXNJN60IqqI8wiyBS8GBbvE+iJm9
 knvpPDVERjEE8U44DoLMBHCAsmIuuxTqT65dOc5MBzrEdDxWCmzn9OEA4L7xhzEloniPgJ
 hq+T/KIHAM42JbVTXenGUB+o6kIMmgs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-LAxjLOiQNmGta1MaWu4Jag-1; Tue, 16 Nov 2021 12:32:35 -0500
X-MC-Unique: LAxjLOiQNmGta1MaWu4Jag-1
Received: by mail-qk1-f198.google.com with SMTP id
 p18-20020a05620a057200b00467bc32b45aso14219139qkp.12
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 09:32:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wMFCuemyxiuT6X/YrJG6Ua24xJxiATlq7pLWpytdHUk=;
 b=KaUphapRDe5Pmtm26/bv4l/LYmN4/D2K1LtxEMCf4YtOq/29HwuamKojCdkeRy3ySR
 zjPzeOZHe4ESrf6LUzwCEX1wqy5VlU0KKBwq1P1QLhNu+dfkqaOLaBkRCbbggSIqjBiD
 I9iOrL9fhm3GKF7sSZ2I6KLh88Omg3ZdqPaEAYqXM9s2ZqbqMexgVGo7Bro1rU+2wsgl
 TUgcR0Rzjum7MhXCtnoarskvhI/syDluO2lijwbTqYLce/xUZ7QhLsxG3wUbmgStZ3rX
 XGlFgUUCVCugp3wDaxQmCeoNvdCT3+X8F99eneirA8hkFNAp+o1KzQHoAnp6/rDixMs3
 p9zA==
X-Gm-Message-State: AOAM533me9YY3S2BklofgBWpbZOAyKEpkgSXtkyRAmre4RXcGQQvi5dV
 VNJzBzFUS+8jCAFxkBijOQP4IsJtcRzrLn/G2555kT+MXVx/upevzn7xHpStcXdzbClU/71tCD7
 yoBvhRAvOy1+wZnY=
X-Received: by 2002:a05:622a:1d5:: with SMTP id
 t21mr9131082qtw.119.1637083954473; 
 Tue, 16 Nov 2021 09:32:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzezM4FCRHuvBKXwDVY3iInlzwMOFBh2uP2gsROc/jxlX3APhk0jfOlNCeEwLp+vKAIl0HCHg==
X-Received: by 2002:a05:622a:1d5:: with SMTP id
 t21mr9131044qtw.119.1637083954222; 
 Tue, 16 Nov 2021 09:32:34 -0800 (PST)
Received: from [192.168.1.234] (pool-71-175-3-221.phlapa.fios.verizon.net.
 [71.175.3.221])
 by smtp.gmail.com with ESMTPSA id v7sm8687700qki.98.2021.11.16.09.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 09:32:34 -0800 (PST)
Message-ID: <bcb591d1-5ce6-8222-2ced-e60d8bf0947d@redhat.com>
Date: Tue, 16 Nov 2021 12:32:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] sev: allow capabilities to check for SEV-ES support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211115193804.294529-1-tfanelli@redhat.com>
 <YZN3OECfHBXd55M5@redhat.com>
 <26204690-493f-67a8-1791-c9c9d38c0240@redhat.com>
 <YZPT3ojgzdmH3lkq@redhat.com>
 <02e72302-8cb3-9268-32bd-57e9423f1590@redhat.com>
 <YZPpGSFMQZBx71QN@redhat.com>
From: Tyler Fanelli <tfanelli@redhat.com>
In-Reply-To: <YZPpGSFMQZBx71QN@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=tfanelli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=tfanelli@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kvm@vger.kernel.org, mtosatti@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 12:23 PM, Daniel P. Berrangé wrote:
> On Tue, Nov 16, 2021 at 11:58:12AM -0500, Tyler Fanelli wrote:
>> On 11/16/21 10:53 AM, Daniel P. Berrangé wrote:
>>> On Tue, Nov 16, 2021 at 10:29:35AM -0500, Tyler Fanelli wrote:
>>>> On 11/16/21 4:17 AM, Daniel P. Berrangé wrote:
>>>>> On Mon, Nov 15, 2021 at 02:38:04PM -0500, Tyler Fanelli wrote:
>>>>>> Probe for SEV-ES and SEV-SNP capabilities to distinguish between Rome,
>>>>>> Naples, and Milan processors. Use the CPUID function to probe if a
>>>>>> processor is capable of running SEV-ES or SEV-SNP, rather than if it
>>>>>> actually is running SEV-ES or SEV-SNP.
>>>>>>
>>>>>> Signed-off-by: Tyler Fanelli <tfanelli@redhat.com>
>>>>>> ---
>>>>>>     qapi/misc-target.json | 11 +++++++++--
>>>>>>     target/i386/sev.c     |  6 ++++--
>>>>>>     2 files changed, 13 insertions(+), 4 deletions(-)
>>>>>>
>>>>>> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>>>>>> index 5aa2b95b7d..c3e9bce12b 100644
>>>>>> --- a/qapi/misc-target.json
>>>>>> +++ b/qapi/misc-target.json
>>>>>> @@ -182,13 +182,19 @@
>>>>>>     # @reduced-phys-bits: Number of physical Address bit reduction when SEV is
>>>>>>     #                     enabled
>>>>>>     #
>>>>>> +# @es: SEV-ES capability of the machine.
>>>>>> +#
>>>>>> +# @snp: SEV-SNP capability of the machine.
>>>>>> +#
>>>>>>     # Since: 2.12
>>>>>>     ##
>>>>>>     { 'struct': 'SevCapability',
>>>>>>       'data': { 'pdh': 'str',
>>>>>>                 'cert-chain': 'str',
>>>>>>                 'cbitpos': 'int',
>>>>>> -            'reduced-phys-bits': 'int'},
>>>>>> +            'reduced-phys-bits': 'int',
>>>>>> +            'es': 'bool',
>>>>>> +            'snp': 'bool'},
>>>>>>       'if': 'TARGET_I386' }
>>>>>>     ##
>>>>>> @@ -205,7 +211,8 @@
>>>>>>     #
>>>>>>     # -> { "execute": "query-sev-capabilities" }
>>>>>>     # <- { "return": { "pdh": "8CCDD8DDD", "cert-chain": "888CCCDDDEE",
>>>>>> -#                  "cbitpos": 47, "reduced-phys-bits": 5}}
>>>>>> +#                  "cbitpos": 47, "reduced-phys-bits": 5
>>>>>> +#                  "es": false, "snp": false}}
>>>>> We've previously had patches posted to support SNP in QEMU
>>>>>
>>>>>      https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04761.html
>>>>>
>>>>> and this included an update to query-sev for reporting info
>>>>> about the VM instance.
>>>>>
>>>>> Your patch is updating query-sev-capabilities, which is a
>>>>> counterpart for detecting host capabilities separate from
>>>>> a guest instance.
>>>> Yes, that's because with this patch, I'm more interested in determining
>>>> which AMD processor is running on a host, and less if ES or SNP is actually
>>>> running on a guest instance or not.
>>>>> None the less I wonder if the same design questions from
>>>>> query-sev apply. ie do we need to have the ability to
>>>>> report any SNP specific information fields, if so we need
>>>>> to use a discriminated union of structs, not just bool
>>>>> flags.
>>>>>
>>>>> More generally I'm some what wary of adding this to
>>>>> query-sev-capabilities at all, unless it is part of the
>>>>> main SEV-SNP series.
>>>>>
>>>>> Also what's the intended usage for the mgmt app from just
>>>>> having these boolean fields ? Are they other more explicit
>>>>> feature flags we should be reporting, instead of what are
>>>>> essentially SEV generation codenames.
>>>> If by "mgmt app" you're referring to sevctl, in order to determine which
>>>> certificate chain to use (Naples vs Rome vs Milan ARK/ASK) we must query
>>>> which processor we are running on. Although sevctl has a feature which can
>>>> do this already, we cannot guarantee that sevctl is running on the same host
>>>> that a VM is running on, so we must query this capability from QEMU. My
>>>> logic was determining the processor would have been the following:
>>> I'm not really talking about a specific, rather any tool which wants
>>> to deal with SEV and QEMU, whether libvirt or an app using libvirt,
>>> or something else using QEMU directly.
>> Ah, my mistake.
>>
>>> Where does the actual cert chain payload come from ? Is that something
>>> the app has to acquire out of band, or can the full cert chain be
>>> acquired from the hardware itself ?
>> The cert chain (or the ARK/ASK specifically) comes from AMD's KDS, yet
>> sevctl is able to cache the values, and has them on-hand when needed. This
>> patch would tell sevctl *which* of the cert chains to use (Naples vs Rome vs
>> Milan chain). If need be, I could just focus on Naples and Rome processors
>> for now and bring support for SNP (Milan processors) later on when it is
>> more mature.
>>
>>>> !es && !snp --> Naples
>>>>
>>>> es && !snp --> Rome
>>>>
>>>> es && snp --> Milan
>>> This approach isn't future proof if subsequent generations introduce
>>> new certs. It feels like we should be explicitly reporting something
>>> about the certs rather than relying on every app to re-implement tihs
>>> logic.
>> Alright, like an encoding of which processor generation the host is running
>> on?
> IIUC (from looking at sev-tool), the certificates can be acquired
> from
>
>     https://developer.amd.com/wp-content/resources/ask_ark_{gen}.cert
>
> where {gen} is one of "milan", "naples", "rome".
>
> With this in mind, I'd think that query-sev-capabilities could just
> report the required certificate name. e.g.
>
>    { 'enum': 'SevAskArkCertName',
>      'data': ['milan', 'naples', 'rome'] }
>
> and then report it in SevCapability struct with
>
>      "ask-ark-cert-name":  "SevAskArkCertName"

That seems reasonable to me, I'll give it a try and submit a v2 patch.

>
> Regards,
> Daniel


-- 
Tyler Fanelli (tfanelli)


