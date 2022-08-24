Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A82D59F4CC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 10:11:11 +0200 (CEST)
Received: from localhost ([::1]:55084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQlTh-0003QR-O7
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 04:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oQlPV-0000FL-NV
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:06:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oQlPQ-0003qb-GF
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661328402;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agflgaflTBOwGFb0gjJzF7s1UfuruAV9dLoW+MoUvow=;
 b=XX2flh3WiyRtan3j82dBn7/OU4cINnrtdL3MBcqOEGu+SHhxAp7YrvEmNaGl88cGRWrh7A
 JmkNmKSwidFXU3chheFpt7O5orEWPEPPDVQTWF7+Pf01OijJkBTGTHO/ficKeXKngoo5TF
 sAUqZmgBDLubekAdAU+SLxD4KRHcMQ4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-kWDQjw-tMrqKMBVGGOQAdQ-1; Wed, 24 Aug 2022 04:06:41 -0400
X-MC-Unique: kWDQjw-tMrqKMBVGGOQAdQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j22-20020a05600c485600b003a5e4420552so476691wmo.8
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 01:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=agflgaflTBOwGFb0gjJzF7s1UfuruAV9dLoW+MoUvow=;
 b=oflpKQcjZ8RbAn9MgCWYX/9l8TQ1XBHylwmRHz6iyENvAQMGYJ3QMvjTGvaJov1uaK
 08zIHabmdKqFJtTJBt7t1pNNr4nwSwZwUEdt3J0/mdlxsyAChdHybQbJ/PSmhxNKdMzr
 c02Vp9y/eaMUjbbCJp0ujB5yYABBuGk+s1u1b0UPgF6RVmkrGwPsSHRD+SV4PgJLBSXy
 rxHvrNnja2BL09ZHF9Doz+XFrno+TBvrTPt+Kpoe1OqYBpuuDvCZqESsAwLLhtUweUDe
 3SgBUaW7Me2GPwfmaLtI2mvWi/t5WvQEFNEvDxRnu3h0f6siQh7qAkn+8FSfkeFSxEth
 tzEA==
X-Gm-Message-State: ACgBeo1NVFRzEJnTQlwlE8zoIg+7VBnpDCk5YmFqrv0BSGFaKExKovpV
 C3evRNsIO2hPFibLrbuAjbmD+yIwy3c6yPHAMbiKPUtHxPsSSnjXT9R6qb8OtKQgXVtD86g0rlf
 7oppCd+oh0CUlqgc=
X-Received: by 2002:a5d:48c5:0:b0:225:2f99:430d with SMTP id
 p5-20020a5d48c5000000b002252f99430dmr16482624wrs.358.1661328400520; 
 Wed, 24 Aug 2022 01:06:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4CqO3hSH2xAF7FC+F1kWH8/u+WCjj5qfddsMRZgk0LpKiSeaVSKJeR6PX8j/FkynHZnMkHng==
X-Received: by 2002:a5d:48c5:0:b0:225:2f99:430d with SMTP id
 p5-20020a5d48c5000000b002252f99430dmr16482593wrs.358.1661328400149; 
 Wed, 24 Aug 2022 01:06:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a056000023c00b00225213fd4a9sm16175683wrz.33.2022.08.24.01.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 01:06:39 -0700 (PDT)
Message-ID: <67f44b09-7c9a-fd83-d222-f505a91ca99e@redhat.com>
Date: Wed, 24 Aug 2022 10:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/4] hw/arm/virt: Improve address assignment for high
 memory regions
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, peter.maydell@linaro.org, richard.henderson@linaro.org,
 shan.gavin@gmail.com
References: <20220815062958.100366-1-gshan@redhat.com>
 <8f219b9f-d5ee-aa9d-519e-e3a7623c2c63@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <8f219b9f-d5ee-aa9d-519e-e3a7623c2c63@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gavin,

On 8/24/22 05:29, Gavin Shan wrote:
> Hi Marc,
>
> On 8/15/22 4:29 PM, Gavin Shan wrote:
>> There are three high memory regions, which are VIRT_HIGH_REDIST2,
>> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
>> are floating on highest RAM address. However, they can be disabled
>> in several cases.
>>      (1) One specific high memory region is disabled by developer by
>>      toggling vms->highmem_{redists, ecam, mmio}.
>>      (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>>      'virt-2.12' or ealier than it.
>>      (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>>      on 32-bits system.
>>      (4) One specific high memory region is disabled when it breaks the
>>      PA space limit.
>>      The current implementation of virt_set_memmap() isn't comprehensive
>> because the space for one specific high memory region is always
>> reserved from the PA space for case (1), (2) and (3). In the code,
>> 'base' and 'vms->highest_gpa' are always increased for those three
>> cases. It's unnecessary since the assigned space of the disabled
>> high memory region won't be used afterwards.
>>
>> The series intends to improve the address assignment for these
>> high memory regions:
>>
>> PATCH[1] and PATCH[2] are cleanup and preparatory works.
>> PATCH[3] improves address assignment for these high memory regions
>> PATCH[4] moves the address assignment logic into standalone helper
>>
>> History
>> =======
>> v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html
>>
>> Changelog
>> =========
>> v2:
>>    * Split the patches for easier review                        (Gavin)
>>    * Improved changelog                                         (Marc)
>>    * Use 'bool fits' in virt_set_high_memmap()                  (Eric)
>>
You did not really convince me about migration compat wrt the high MMIO
region. Aren't the PCI BARs saved/restored meaning the device driver is
expecting to find data at the same GPA. But what if your high MMIO
region was relocated in the dest QEMU with a possibly smaller VM IPA?
Don't you have MMIO regions now allocated outside of the dest MMIO
region? How does the PCI host bridge route accesses to those regions?
What do I miss?

Thanks

Eric
>
> Could you help to review when you have free cycles? It's just a kindly
> ping :)
>
> Thanks,
> Gavin
>
>>
>> Gavin Shan (4):
>>    hw/arm/virt: Rename variable size to region_size in virt_set_memmap()
>>    hw/arm/virt: Introduce variable region_base in virt_set_memmap()
>>    hw/arm/virt: Improve address assignment for high memory regions
>>    virt/hw/virt: Add virt_set_high_memmap() helper
>>
>>   hw/arm/virt.c | 84 ++++++++++++++++++++++++++++++---------------------
>>   1 file changed, 50 insertions(+), 34 deletions(-)
>>
>


