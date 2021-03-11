Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93784337C81
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:25:02 +0100 (CET)
Received: from localhost ([::1]:58996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPzZ-0005C3-7X
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKPxO-0004Bp-E3; Thu, 11 Mar 2021 13:22:46 -0500
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:37449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lKPxM-0008ID-Fh; Thu, 11 Mar 2021 13:22:46 -0500
Received: by mail-qk1-x734.google.com with SMTP id s7so21629320qkg.4;
 Thu, 11 Mar 2021 10:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0zkDKxh/xN0xiW7r5m9FQ9kK5DvbCgkpUkXhvBh8K2I=;
 b=Jm9QeAlI0QEEu9lASqmLJkFLHCDNq9+iFMV1h44SZtj1AZx0zjkPxlesQxHqd3dQjl
 +IiUMZVfVtXAKgBdC2nIwUXV6+tzGaF1Occ+nK77YGrFeUW5PKayZXVI+57saFMtvqQG
 frUwpxwAmim8s6EBDo5Hu5Wo0XSCKyaM5nq2iww+cevOlTvBJ56D/GbVODfRN4mcSfuO
 TVSzfwsxeBN7EvaR0BlK5E3XI9NqlmxF38YP5ozd4YJcUhX61OCMuPFpEBES8q5DQPx4
 nC+N4TyFuSn0YWYy6ASS6pwvk8y4bYL5bsf8d6MCQYiW3kyEpk+/5CSlkQ6mjdrW8Cr/
 jj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0zkDKxh/xN0xiW7r5m9FQ9kK5DvbCgkpUkXhvBh8K2I=;
 b=SQkLEoqH32mRmnJqbfNMsx13J8FydH4B1QLnOSDYZKtwizTue2JIhwH+zP/UpoSwXr
 6LvR2RtbsGx+ti1z9tdVAB2HYqol3rQChTBMzOiBFf9BQbLsyOn9R8vIwFPdx35/Ru2g
 wVXOWL247yqAeECqCi/DmH8QcwZ8X0SlFjmagCnhWNfhLR5oWQCWeQe9nHb/A1NdVmpa
 jqaJWQMGgUtxSDkFIqnAqGzUzNooTrghB3enDJmNzcvs1faNHw0Zmpx4qSTSHSxpI+G7
 CZlSJ0pF72e43QtEHy289QG7LuNhOcsILeKT5GFHVWVlOnhrNOZ3ZYy1ufzJcUdm9Dc1
 EaCg==
X-Gm-Message-State: AOAM530088Bf/sn7QvjKn2djUcrOSs4hVdVX33pEoW41F1/w1hbjEXJ7
 8vjyrKePR2ZkGq+AMB/u9eQ=
X-Google-Smtp-Source: ABdhPJzSqNXGkH2l9KIc53X2aDVLe1OHM2s6yDLwX8pj3PFMflagF8+KvLvMtVxOgVs/yoIZ+YiTHg==
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr9039896qkn.273.1615486963082; 
 Thu, 11 Mar 2021 10:22:43 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:cc80:21a:fa87:b9b8:5376?
 ([2804:431:c7c7:cc80:21a:fa87:b9b8:5376])
 by smtp.gmail.com with ESMTPSA id m3sm2413188qkk.15.2021.03.11.10.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 10:22:42 -0800 (PST)
Subject: Re: [PATCH 1/1] spapr.c: remove 'ibm,chip-id' from DT
To: Greg Kurz <groug@kaod.org>
References: <20210311151557.705863-1-danielhb413@gmail.com>
 <20210311172954.26e2b10d@bahia.lan>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <0bbe42b0-a17c-550c-2e0c-fa8514db355b@gmail.com>
Date: Thu, 11 Mar 2021 15:22:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311172954.26e2b10d@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/11/21 1:29 PM, Greg Kurz wrote:
> On Thu, 11 Mar 2021 12:15:57 -0300
> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> 
>> The attribute 'ibm,chip-id' does not exist in PAPR. This alone would be
>> enough reason to remove it from the spapr DT, but before doing that,
>> let's give a brief context on how and why it was introduced.
>>
>> 'ibm,chip-id' was added in the spapr DT by commit 10582ff83279. This
>> commit references kernel commit 256f2d4b463d ("powerpc: Use ibm, chip-id
>> property to compute cpu_core_mask if available"). In this kernel commit,
>> the 'ibm,chip-id' DT attribute is being used to calculate the
>> cpu_core_mask in traverse_siblings_chip_id(). This function still need
>> to consider 'ibm,chip-id' not being available as well to avoid breaking
>> older guests.
>>
>> Later on, kernel commit df52f6714071 ("powerpc/smp: Rework CPU topology
>> construction") removed traverse_siblings_chip_id() and its callers,
>> making the CPU topology calculation independent of the 'ibm,chip-id'
>> attribute. Today, the kernel uses 'ibm,chip-id' for PowerNV related code
>> only - the pseries kernel does not rely on it.
>>
> 
> Thanks for the archaeology ! So this means that the pseries kernel used
> to rely on it up to kernel v4.14, right ?


The pseries kernel up to 4.14 used to consider the existence of 'ibm,chip-id',
but it also had an error path for its absence as well.

> 
>> All that said, since it's not in PAPR and the pseries kernel does not
>> rely on it, let's remove ibm,chip-id from the DT.
>>
> 
> Even if it isn't part of PAPR, this is something that we've been
> exposing to guests with existing machine types and someone could
> have found a use for it or still using a pre-4.14 kernel, e.g.
> debian stretch still relies on 4.9.

I understand that it's generally not cool to change guest visible information.

If we want to be on the safe, I can send a v2 where this change if effective only
on pseries-6.0.0 and newer.


Thanks,


DHB


> 
> In theory we should change this behavior in the default machine only.
> But in case David is okay to merge the patch anyway,
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>
> 
>> CC: Alexey Kardashevskiy <aik@ozlabs.ru>
>> Suggested-by: Cédric Le Goater <clg@kaod.org>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 85fe65f894..d2e448fd9c 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -657,7 +657,6 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
>>       uint32_t page_sizes_prop[64];
>>       size_t page_sizes_prop_size;
>>       unsigned int smp_threads = ms->smp.threads;
>> -    uint32_t vcpus_per_socket = smp_threads * ms->smp.cores;
>>       uint32_t pft_size_prop[] = {0, cpu_to_be32(spapr->htab_shift)};
>>       int compat_smt = MIN(smp_threads, ppc_compat_max_vthreads(cpu));
>>       SpaprDrc *drc;
>> @@ -744,9 +743,6 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
>>   
>>       spapr_dt_pa_features(spapr, cpu, fdt, offset);
>>   
>> -    _FDT((fdt_setprop_cell(fdt, offset, "ibm,chip-id",
>> -                           cs->cpu_index / vcpus_per_socket)));
>> -
>>       _FDT((fdt_setprop(fdt, offset, "ibm,pft-size",
>>                         pft_size_prop, sizeof(pft_size_prop))));
>>   
> 

