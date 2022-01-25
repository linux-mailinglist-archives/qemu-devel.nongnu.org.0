Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8375C49BFA5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 00:37:08 +0100 (CET)
Received: from localhost ([::1]:57322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCVN5-0004Gq-3D
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 18:37:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCVKZ-0003HB-24
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 18:34:31 -0500
Received: from [2607:f8b0:4864:20::1032] (port=33501
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCVKW-0000ae-BT
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 18:34:29 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 g11-20020a17090a7d0b00b001b2c12c7273so2120107pjl.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 15:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=21Gf1Lcuk1GPxXtvDKJ8nweB1hNGOxeI5gT2k3UrGOo=;
 b=gJWwQqC9Sl/KZbbkY4VfkJnGQ5wOkmc66HHox5bLQdAuNXkI6JXPNjDMmsX/AVzoqh
 a11DRWquSU4VaJp1sNda/HAx6p7PbrPTpWe+Tp64STdcKN6iM4lyLEyYrHhRC+qTHmhK
 jDIp+vp2Chy7U7c3xCI3WHP0WcdLJy58a7Wsj8Wd4lU0n+hOoxo4FlSHGYbt8JNDh8c/
 QNcsVv87n362BnlFKmzFPttOXO55v6k13n4+mJNKq6Mdsq/vgF16tp3TwuiriajL6XZ+
 0k+8QVc8+AleSTjzeztCtLumsmBFMkW9I7QDrmBl5oix3bH2rPMdKu79tVDlwy5QXUdK
 DJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=21Gf1Lcuk1GPxXtvDKJ8nweB1hNGOxeI5gT2k3UrGOo=;
 b=e3fkUmAlssvxo2pX9cBjGowJ7o26oZmDSJJwPfsAiAV5OVTyFJFfFhqeT0v+gMNFF7
 8UirLdJtsfBT4qbb2QCl3mG+hHrFg0fzGK8qqNFi33OLvM3ibThbh/OG2jiwgq1MFo9J
 foQeZEbf4SiHKOq9TYmANEKeuEUyfdW6Yk9OlpDu25n5G3TgamehBrmh/Z9V1yECjR5l
 7f9wNqID7tN8RcMVhYzblNpmaVlqs3zvDSjYmGOMQvfN9yImyuYWUyvkHBU4aUSL6JlF
 4xjWFY5vaj8X9kECny9adKPMCInH2DqUYy7a1zDrOt1fXKa5fDxMZEJ2ZKorvg4LyG7L
 M1eQ==
X-Gm-Message-State: AOAM531qQGXYt1DNoNLyf+ozFGb7fGffI5i2X3ZlRrjT6SsDnW2DQSHm
 rY98swpy429W5F/51tfHRt1OSw==
X-Google-Smtp-Source: ABdhPJxdwDgPf3LgmbDhNldzvVF39U/NY7LENk3S/nyMALb9KSHvHYlCyhLwQ97v7okNh4532e6vpQ==
X-Received: by 2002:a17:903:2342:b0:14a:e540:6c83 with SMTP id
 c2-20020a170903234200b0014ae5406c83mr19811353plh.69.1643153666861; 
 Tue, 25 Jan 2022 15:34:26 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id j4sm1347696pjv.46.2022.01.25.15.34.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 15:34:26 -0800 (PST)
Subject: Re: [PATCH 2/2] target/arm: Bail out early on 0-length tlb range
 invalidate
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220110164754.1066025-1-idan.horowitz@gmail.com>
 <20220110164754.1066025-2-idan.horowitz@gmail.com>
 <0f211c09-4b4d-2c82-cff6-64711563c6d8@linaro.org>
 <CAFEAcA-VuVPfDaPCZ9ta+vtmj9RUb_BBMCihTGKsEV4SSphaEw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f89816f-5e59-bac5-01bc-d9cc73d15927@linaro.org>
Date: Wed, 26 Jan 2022 10:34:20 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-VuVPfDaPCZ9ta+vtmj9RUb_BBMCihTGKsEV4SSphaEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/22 9:06 AM, Peter Maydell wrote:
> On Tue, 25 Jan 2022 at 22:05, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 1/11/22 3:47 AM, Idan Horowitz wrote:
>>> If the given range specifies no addresses to be flushed there's no reason
>>> to schedule a function on all CPUs that does nothing.
>>>
>>> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
>>> ---
>>>    target/arm/helper.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index cfca0f5ba6..1e819835c2 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -4564,6 +4564,10 @@ static void do_rvae_write(CPUARMState *env, uint64_t value,
>>>        length = tlbi_aa64_range_get_length(env, value);
>>>        bits = tlbbits_for_regime(env, one_idx, baseaddr);
>>>
>>> +    if (length == 0) {
>>> +        return;
>>> +    }
>>> +
>>>        if (synced) {
>>>            tlb_flush_range_by_mmuidx_all_cpus_synced(env_cpu(env),
>>>                                                      baseaddr,
>>>
>>
>> Looks good.  I guess we could sort the extractions above so that we do
>>
>>       length = ...;
>>       if (length == 0) {
>>           return;
>>       }
>>
>>       addr = ...
>>       bits = ...
>>
>> Either way,
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Should we handle this in the tlb_flush_* functions themselves,
> or is it just Arm that has to fix up a special case of "actually
> the length is zero" ?

Hmm.  Probably should handle this in tlb_*, yes.
So far, Arm is the only user regardless.

r~



