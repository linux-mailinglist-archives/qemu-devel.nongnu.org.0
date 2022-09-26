Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4CC5EB444
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 00:11:19 +0200 (CEST)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocwJq-0000Ee-CE
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 18:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocwG6-0002b8-FE
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 18:07:26 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocwG4-0001Ei-GM
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 18:07:25 -0400
Received: by mail-ed1-x52c.google.com with SMTP id e18so10911818edj.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 15:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=gAhjFF9CTG++Ni0LFTwz2boqz9kxh59OlZWhEiSUIjM=;
 b=UJbODnvf7zbCgFYr+xZtpblJ/FBUWkaVGHGjyxSKuaSz5ZpOEwllsecZj8WlVNgErD
 galNE8uUscBaveVCEhex8H5nVjQeGrZxEtQ4wm/q8Tq7VxaGziCZDb9+BiXefuKv5qrB
 BKLwAeLE3l1X16bLvri7WsFT2utDkXsSj6HJvQU85YFXjO7cuVwDJaI58s8Sgbf9+TIB
 TU56DzR5LooUqIHFWiuFGzmciMiYmepyba5LRkKmcB8m6BeZDhN2uHvbngVxOBZnK3Fp
 Lgec+ukZcbpvj3sAeoUJaGAurReT9WJoW6NXZdN86zw/Lqujt6xREHn01uUh4dP52MSX
 5FFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gAhjFF9CTG++Ni0LFTwz2boqz9kxh59OlZWhEiSUIjM=;
 b=c7caUb665aFB0NMR4EqvEQZ+3jB5sWBeMO9yifFPWcH0U6TxrrZSSTxaIJd+rTmDbQ
 yfyLDwvld+wDJC95POnZidxdtsCUcUJYOAFs3q0lizJ0jad5yxcVbj+VhYrjGNQdDSha
 t4ljdmQTdWMPcJiwO2aGihndkH06iy9xKpgN+2dYRmBTTV+jZi5RijU0QR22nOfbEANY
 mWjNJldRVkFcfomGLDuoho+9oUvKZSDs1xd+/1BnGOnuggXjFPqdrMdc8GWXXAIp/JME
 4+8g/ZuVqAPM7o0FIQ7th6Ovtwu90rWSr/E6MkY5QuUyjPnPXQfPlF4mFKlzDDwyMxsP
 N5Jg==
X-Gm-Message-State: ACrzQf2LPUmK4wo9gxvILL7sdgaH5AroFtvfm/ikzii1xKjH29MqnHZw
 psf79pagVP/L9ndSDCqXGXh4JA==
X-Google-Smtp-Source: AMsMyM7BOKTWI4KI0T/vGMSZ6ESezuIJJQagxkTQpSCY0y15EHpCb0zeQv8cgYJoC134a2gAg+xoOA==
X-Received: by 2002:a05:6402:847:b0:453:944a:ba8e with SMTP id
 b7-20020a056402084700b00453944aba8emr24246519edz.326.1664230041682; 
 Mon, 26 Sep 2022 15:07:21 -0700 (PDT)
Received: from [192.168.190.227] ([31.209.146.210])
 by smtp.gmail.com with ESMTPSA id
 s14-20020aa7cb0e000000b0044e7862ab3fsm12165257edt.7.2022.09.26.15.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 15:07:21 -0700 (PDT)
Message-ID: <45cbdafb-d3ad-dd58-c76c-d6268b581570@linaro.org>
Date: Mon, 26 Sep 2022 07:33:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 1/9] hw: encode accessing CPU index in MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-2-alex.bennee@linaro.org>
 <15a379bf-39f2-5fc5-7a6f-3bdd39e5a2c3@linaro.org> <87h70vha2d.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87h70vha2d.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/25/22 13:02, Alex Bennée wrote:
>> I'm not keen on adding another field like this.
> 
> Hmm I thought it was unavoidable from Edgar's comment:
> 
>    "CPU's can also have a Master-IDs (Requester IDs) which are unrelated to
>    the Clusters CPU index. This is used for example in the Xilinx ZynqMP
>    and Xilinx Versal and the XMPU (Memory Protection Units).
> 
>    Anyway, I think this approach is an improvement from the current state
>    but would rather see a new separate field from requester_id. Overloading
>    requester_id will break some of our use-cases (in the Xilinx tree)..."
> 
> Of course we don't have to care about external use cases but it seemed
> to indicate we might need both.

I missed that one.

>> What bounds our max number of cpus at the moment?  We use "int" in
>> struct CPUCore, but that's almost certainly for convenience.
>>
>> target/s390x/cpu.h:#define S390_MAX_CPUS 248
>> hw/i386/pc_piix.c:    m->max_cpus = HVM_MAX_VCPUS;
>>
>> hw/i386/pc_q35.c:    m->max_cpus = 288;
>>
>> hw/arm/virt.c:    mc->max_cpus = 512;
>>
>> hw/arm/sbsa-ref.c:    mc->max_cpus = 512;
>>
>> hw/i386/microvm.c:    mc->max_cpus = 288;
>>
>> hw/ppc/spapr.c:    mc->max_cpus = INT32_MAX;
>>
>>
>> Most of these are nicely bounded, but HVM_MAX_VCPUS is a magic number
>> from Xen, and ppc appears to be prepared for 31 bits worth of cpus.
> 
>  From 5642e4513e (spapr.c: do not use MachineClass::max_cpus to limit
> CPUs) I think it is being a little optimistic. Even with the beefiest
> hosts you start to see diminishing returns by ~12 vCPUs and it won't
> take long before each extra vCPU just slows you down.

Ok, I guess.  If we decided to add an assert that the cpuid fit in this field, we'd want 
to revisit this, I think.  Not an issue for the moment.

> I was confused by the last comment because I forgot the TLBs are not
> shared between cores. So I can just bang:
> 
>      MemTxAttrs attrs = { .cpu_index = cs->cpu_index };
> 
> into arm_cpu_tlb_fill and be done with it?

Yes, it looks like it.  I don't see any bulk overwrite of attrs in get_phys_addr and 
subroutines.  Mostly modifications of attrs->secure, as expected.


r~

