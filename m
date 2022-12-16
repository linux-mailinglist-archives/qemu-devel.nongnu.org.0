Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F134864F3CF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:13:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IZx-0000LA-Md; Fri, 16 Dec 2022 16:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IZt-0000JZ-4K
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:49:13 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6IZr-0001eb-0t
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:49:12 -0500
Received: by mail-ej1-x632.google.com with SMTP id gh17so9205706ejb.6
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BWf3oRGabjRM7hdL31ucIABn/v8+ic7GVHrD3dU1dTs=;
 b=Z6K3k18T/fBi6THQ8EWOpjCO51MuxhHA3hCAiJ7rddsh5FzTyhhMWWiV2vhYBaVReA
 L9ECoPLAljUfO1z7ql56bAEs/phsMKphF8/GtMRjyMXOGMau7VEihxaWu2EUu4aWKBR+
 pK3NnzO7SEWCfXSQWd9B7qspecvMUrbdUJHibmxo4pG+EHBqq180vqVTAoeqAOPH68OE
 qmbyk9Js3DXxDI52tW/a9hVsIeJTGv11NgBLXXNLIVszPlpPyZgSzVUc7v1gqwuPNJP6
 YMnx6ZQ5WT4NyI4T57HHknnKXhn0YObmTP+pJBYjMTIf1eJae5A6kpWYP3TFcSVFqGdO
 ullA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BWf3oRGabjRM7hdL31ucIABn/v8+ic7GVHrD3dU1dTs=;
 b=8BTssHcDtuG2HMdAfhLHM+KfVtrJFd01/1IVexVBdBKDZuyM3f5Bw5n8YIIFrJd4pJ
 FL9afIxq9gvnYIIYwQANSUwu/WDZQi93cr2qVXfRPXg/XmY7gpW3wRunycs8SA0o99fk
 ny6Wry3cYh4rJIh1wQbsQCgxmADPI19jLTnfltC1YoSFJmuE+C4Wa39UUBMznQUiSY7y
 LjMpXDlmCAqVoaTDA3dj9N02BWfo6LR/pgavA5cnh2+j5ZfN39g8Z8Oz7CAUzv1OEoHD
 /teCNGlZ1J3wB6sJyV+iSp4Mugl+cha8JhOuk3ebKoZlSCWR2XHByfdOqmDrES77vzdN
 5CGA==
X-Gm-Message-State: ANoB5plVQB1MPYXu8yjQBwz9bVUDsErDGUaHFOZmitS2tYgW2YMrEwoI
 PgogAO5RxwjxTz2P10BSAKl1WQ==
X-Google-Smtp-Source: AA0mqf5PV2KBETlL6PJp8qWLNLF8hcrElEe1RiPzIryZH6IB1wKTnRyrQtIMJy4rIXJmjAZbVmrz8w==
X-Received: by 2002:a17:906:3c15:b0:7c1:4d21:abb7 with SMTP id
 h21-20020a1709063c1500b007c14d21abb7mr25171537ejg.54.1671227349325; 
 Fri, 16 Dec 2022 13:49:09 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906328a00b007bc8ef7416asm1280580ejw.25.2022.12.16.13.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 13:49:08 -0800 (PST)
Message-ID: <ddeff670-8b44-b9f4-1188-be6846baf8dd@linaro.org>
Date: Fri, 16 Dec 2022 22:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0] hw: Avoid using inlined functions with
 external linkage
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Babu Moger <babu.moger@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
References: <20221208161152.28976-1-philmd@linaro.org>
 <CAFEAcA8jC_tXvN6WwcO1YHmBw_L5iDiCa8HUMLAo3H_vmbieRQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8jC_tXvN6WwcO1YHmBw_L5iDiCa8HUMLAo3H_vmbieRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/12/22 17:27, Peter Maydell wrote:
> On Thu, 8 Dec 2022 at 16:11, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> When using Clang ("Apple clang version 14.0.0 (clang-1400.0.29.202)")
>> and building with -Wall we get:
>>
>>    hw/arm/smmu-common.c:173:33: warning: static function 'smmu_hash_remove_by_asid_iova' is used in an inline function with external linkage [-Wstatic-in-inline]
>>    hw/arm/smmu-common.h:170:1: note: use 'static' to give inline function 'smmu_iotlb_inv_iova' internal linkage
>>      void smmu_iotlb_inv_iova(SMMUState *s, int asid, dma_addr_t iova,
>>      ^
>>      static
>>
>> None of our code base require / use inlined functions with external
>> linkage. Some places use internal inlining in the hot path. These
>> two functions are certainly not in any hot path and don't justify
>> any inlining.
>>
>> Reported-by: Stefan Weil <sw@weilnetz.de>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> RFC: Any better justification?
> 
> I don't really understand what the warning is trying to warn
> about, and googling didn't enlighten me. Does anybody understand it?
> 
> In any case, it does seem weird to define a function inline and
> also have it be defined in a C file rather than as a 'static inline'
> in a header file, so these are likely oversights rather than
> intentional.
> 
>> ---
>>   hw/arm/smmu-common.c | 10 +++++-----
>>   hw/i386/x86.c        |  3 +--
>>   2 files changed, 6 insertions(+), 7 deletions(-)

>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index 78cc131926..9ac1680180 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -64,8 +64,7 @@
>>   /* Physical Address of PVH entry point read from kernel ELF NOTE */
>>   static size_t pvh_start_addr;
>>
>> -inline void init_topo_info(X86CPUTopoInfo *topo_info,
>> -                           const X86MachineState *x86ms)
>> +void init_topo_info(X86CPUTopoInfo *topo_info, const X86MachineState *x86ms)
>>   {
>>       MachineState *ms = MACHINE(x86ms);
> 
> This function is not used anywhere outside this file, so we
> can delete the prototype from include/hw/i386/x86.h and
> make the function "static void".

Good idea.

> With those changes,
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks!


