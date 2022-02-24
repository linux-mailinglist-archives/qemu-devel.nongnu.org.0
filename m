Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67A64C3694
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:10:57 +0100 (CET)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKS0-00016N-PH
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:10:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNKOJ-00064E-Fp
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:07:07 -0500
Received: from [2607:f8b0:4864:20::533] (port=37694
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNKOG-000174-CB
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 15:07:07 -0500
Received: by mail-pg1-x533.google.com with SMTP id 75so2673311pgb.4
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 12:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0mhnWk6EJNSUydCfYe82WaoVZolNnravr99D2tQgjEc=;
 b=fL7ONDttlvPEoxyqTFsTl3DNEmtjUJ2KgOH3b1QnHft9vndwZAl9xP7ThmLoKRhb+F
 TcyKsb6ml9J+AeJpD+3IVht59Y5uY30QYkQ5Wx+Vvew7ZD5Fye9mFCGcXZ3XTsH1cY3H
 SEk5w8YHxmyzkkYr0L0pKTc2UK3UCuMZd8Cjs45p7RbsIfmTmaWaNYCs7LXDgknSRTAY
 mLk80kNH0r7e4wuK8NrBmCBpmjaiEUinzWHNDVceH88WZX/6wLEf0ccW8N14ROA1kXaU
 0z+3sLL/Ry/+ADfORilwhm8Uih53el00qM+CmMvMz0vAj5kF4wdO9Fau30xzZduQtPo/
 vyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0mhnWk6EJNSUydCfYe82WaoVZolNnravr99D2tQgjEc=;
 b=ilPtgw5U+D0HHKToJqo8MuIu0na97M+tfJpBbNaM2UCO/ei9pQH+Du0z8rCLX1kVZg
 HrI33tpbtymBvsT2oALutYCuLRzB6ZOa8VEsxNMOONE30WUySNcEn6AclWrWZKr/EqUe
 NErO1a5Qyx0b8HCIdVT6FtQtSLxeN3JC0CxtgpkXu8IDJ3uuJTkO2VJuDX0mjakfZadY
 oyRC1aXbL6cC1siPxM47JdsJubdiCPrjIzk4BNsQ1fNifKxneV/UBDXbkVVVvf4jxmpn
 HlhGgYHjcLYYF9fVL6SuaK2HTh1Qn6BFffe66beE/OOcyg2RLGQbAigP39cxVAbj4Pv9
 y3Dw==
X-Gm-Message-State: AOAM531c2XrXFFTSsOuE5Bgf0CM16a5yrYLCLAozAU3wxtkwOSb3kswO
 zWodKRV3wNt3z/0kY2DMew7b5A==
X-Google-Smtp-Source: ABdhPJxhDYAAkSQkLnDD8H3h9PlsgrrINtq+6pg1ZFZZMUEbujISIbiYLrB/AV+TFjWVD1R9OqB3/g==
X-Received: by 2002:aa7:8888:0:b0:4df:3c7f:8f3e with SMTP id
 z8-20020aa78888000000b004df3c7f8f3emr4216670pfe.36.1645733222859; 
 Thu, 24 Feb 2022 12:07:02 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 h7-20020a056a00170700b004e01663f59bsm312315pfc.117.2022.02.24.12.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:07:02 -0800 (PST)
Message-ID: <ac7b0148-2a2d-eed7-7691-7fa634999501@linaro.org>
Date: Thu, 24 Feb 2022 10:06:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/4] target/ppc: TCG: Migrate tb_offset and decr
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <20220224185817.2207228-2-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224185817.2207228-2-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: aik@ozlabs.ru, danielhb413@gmail.com, npiggin@gmail.com,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 08:58, Fabiano Rosas wrote:
> These two were not migrated so the remote end was starting with the
> decrementer expired.
> 
> I am seeing less frequent crashes with this patch (tested with -smp 4
> and -smp 32). It certainly doesn't fix all issues but it looks like it
> helps.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>   target/ppc/machine.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 1b63146ed1..7ee1984500 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -9,6 +9,7 @@
>   #include "qemu/main-loop.h"
>   #include "kvm_ppc.h"
>   #include "power8-pmu.h"
> +#include "hw/ppc/ppc.h"
>   
>   static void post_load_update_msr(CPUPPCState *env)
>   {
> @@ -666,6 +667,18 @@ static const VMStateDescription vmstate_compat = {
>       }
>   };
>   
> +static const VMStateDescription vmstate_tb_env = {
> +    .name = "cpu/env/tb_env",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_INT64(tb_offset, ppc_tb_t),
> +        VMSTATE_UINT64(decr_next, ppc_tb_t),
> +        VMSTATE_TIMER_PTR(decr_timer, ppc_tb_t),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   const VMStateDescription vmstate_ppc_cpu = {
>       .name = "cpu",
>       .version_id = 5,
> @@ -696,12 +709,16 @@ const VMStateDescription vmstate_ppc_cpu = {
>           /* Backward compatible internal state */
>           VMSTATE_UINTTL(env.hflags_compat_nmsr, PowerPCCPU),
>   
> +        VMSTATE_STRUCT_POINTER_V(env.tb_env, PowerPCCPU, 1,
> +                                 vmstate_tb_env, ppc_tb_t),
> +
>           /* Sanity checking */
>           VMSTATE_UINTTL_TEST(mig_msr_mask, PowerPCCPU, cpu_pre_2_8_migration),
>           VMSTATE_UINT64_TEST(mig_insns_flags, PowerPCCPU, cpu_pre_2_8_migration),
>           VMSTATE_UINT64_TEST(mig_insns_flags2, PowerPCCPU,
>                               cpu_pre_2_8_migration),
>           VMSTATE_UINT32_TEST(mig_nb_BATs, PowerPCCPU, cpu_pre_2_8_migration),
> +
>           VMSTATE_END_OF_LIST()
>       },
>       .subsections = (const VMStateDescription*[]) {

I think the new struct should go into a subsection.

r~

