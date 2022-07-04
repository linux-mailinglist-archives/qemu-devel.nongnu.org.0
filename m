Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69372565FB2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 01:20:22 +0200 (CEST)
Received: from localhost ([::1]:52832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8VMb-00049U-14
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 19:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o8VLR-00037i-8Q; Mon, 04 Jul 2022 19:19:09 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:38471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o8VLP-0002fz-Iy; Mon, 04 Jul 2022 19:19:08 -0400
Received: by mail-vs1-xe33.google.com with SMTP id k2so726373vsc.5;
 Mon, 04 Jul 2022 16:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=y42XiXE0wD79M8zzSkPxhIjfGjX9hAtcSwhUKalfFh4=;
 b=ABswkWNtNN7pny/ZWc4axQi16em2UoEa7YjvVj1qtUHohJ/NkKwfKEHlbwXKvw3Qv9
 PZ/nwYStcXbwUgSf8RafUINN7cKzzH5ygKYJwOzyx7BRsokyZKMtrKrHbxikbvYpAPC9
 t+U4DWt26Mfxve42nRfu14Ve0TgIny143RBYvBK8f40fEwcIfpvjyVIyPu8OHA42riBA
 j20cIUXmYYs8EW7C4xF2G9nAZyLoB+zzMhsa3myx74ch2SCYjl9GEqLK0TZkhngL2/Sx
 ykXeW0vpPXcdMLmnrgsBeP/NddNBYGt05HfdQnsH+Qp/zFudJesuFHzzsw7DfQLyluIU
 2nUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y42XiXE0wD79M8zzSkPxhIjfGjX9hAtcSwhUKalfFh4=;
 b=A66M6oGc7HV3faP8rwkWawsel23L9NOY63dvdVbafFc4gPBC4yvTk9Lpcte3YIRhiz
 Z+00yNjKWIMSvPdkqM6RcF2uUZJEhV5yVatuA7S/9p2+/I67hzK/HTSkKDzgtMuRuZau
 Y5sqJEbPkHjyPn68X5rwYQT0HolorY075ale4gU9jgMicgD3c69OEFQfVs/yaKYY8oft
 cEOzPc7LC2sv7rwp+JBiusoj95u//h89/ktUHGAqGhay/OHnLQFB7t0bIcfoMQMxYKyD
 gUFw1AwbW+/A4vC7Rnn8eT+D7RHHta4nYA4siPbPWHE7I27dLDY6AM7zEEUeCkYA9sOK
 nsPQ==
X-Gm-Message-State: AJIora+gaa6t8lVtIux3CCAs8Jb5wSEJQ9B8aWfx4EgPOsr75PVa31zp
 8JSOJInwCixkbMnWdGaY/ZBtaVZIHng=
X-Google-Smtp-Source: AGRyM1tDDIAOBrYE4FLig97b2xV4XYFOBNFDL4zQqFx28iKrnRBQNRlkfVdjDe2SyHbfCwYJ1iCHpA==
X-Received: by 2002:a67:c189:0:b0:356:c545:436d with SMTP id
 h9-20020a67c189000000b00356c545436dmr3669615vsj.29.1656976745311; 
 Mon, 04 Jul 2022 16:19:05 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a056102303000b0035609fbb1a9sm4506848vsa.1.2022.07.04.16.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 16:19:05 -0700 (PDT)
Message-ID: <db8d0102-bd93-a572-9902-682846cfdb44@gmail.com>
Date: Mon, 4 Jul 2022 20:19:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/9] target/ppc: add errp to kvmppc_read_int_cpu_dt()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20220630194249.886747-1-danielhb413@gmail.com>
 <20220630194249.886747-3-danielhb413@gmail.com>
 <55014e2a-a668-4843-8338-850abeb5ff04@kaod.org>
 <47277f4f-a6a5-85dc-4806-67df8e2fc153@gmail.com>
 <6d37b1dc-5dfb-2513-f74e-3f58e84e8117@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <6d37b1dc-5dfb-2513-f74e-3f58e84e8117@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/4/22 14:34, Cédric Le Goater wrote:
> On 7/2/22 15:34, Daniel Henrique Barboza wrote:
>>
>>
>> On 7/2/22 03:24, Cédric Le Goater wrote:
>>> On 6/30/22 21:42, Daniel Henrique Barboza wrote:
>>>> The function can't just return 0 whether an error happened and call it a
>>>> day. We must provide a way of letting callers know if the zero return is
>>>> legitimate or due to an error.
>>>>
>>>> Add an Error pointer to kvmppc_read_int_cpu_dt() that will be filled
>>>> with an appropriate error, if one occurs. Callers are then free to pass
>>>> an Error pointer and handle it.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>   target/ppc/kvm.c | 16 +++++++++-------
>>>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>>> index 109823136d..bc17437097 100644
>>>> --- a/target/ppc/kvm.c
>>>> +++ b/target/ppc/kvm.c
>>>> @@ -1925,15 +1925,17 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
>>>>   /*
>>>>    * Read a CPU node property from the host device tree that's a single
>>>> - * integer (32-bit or 64-bit).  Returns 0 if anything goes wrong
>>>> - * (can't find or open the property, or doesn't understand the format)
>>>> + * integer (32-bit or 64-bit).  Returns 0 and set errp if anything goes
>>>> + * wrong (can't find or open the property, or doesn't understand the
>>>> + * format)
>>>>    */
>>>> -static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>>>> +static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
>>>>   {
>>>>       char buf[PATH_MAX], *tmp;
>>>>       uint64_t val;
>>>>       if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
>>>> +        error_setg(errp, "Failed to read CPU property %s", propname);
>>>>           return 0;
>>>>       }
>>>> @@ -1946,12 +1948,12 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>>>>   uint64_t kvmppc_get_clockfreq(void)
>>>>   {
>>>> -    return kvmppc_read_int_cpu_dt("clock-frequency");
>>>> +    return kvmppc_read_int_cpu_dt("clock-frequency", NULL);
>>>
>>>
>>> This should be fatal. no ?
>>
>>
>> I'm not sure. I went under the assumption that there might be some weird
>> condition where 'clock-frequency' might be missing from the DT, and this
>> is why we're not exiting out immediately.
>>
>> That said, the advantage of turning this into fatal is that we won't need
>> all the other patches that handles error on this function. We're going to
>> assume that if 'clock-frequency' is missing then we can't boot. I'm okay
>> with that.
> 
> I think so. Some machines behave badly when 'clock-frequency' is bogus,
> division by zero, no console, etc. We could check easily with pseries
> which is the only KVM PPC platform.


I can assert that with pSeries we can safely error_fatal if the DT doesn't
contain 'clock-frequency' since it's on PAPR under this section:

"C.6.2 OF Root Note

This section defines additional properties and methods associated with PAPR
platforms that OSs expect to find in the root node."

I interpret this as "if there's no clock-frequency just bail out".


Thanks,


Daniel


> 
> C.
> 

