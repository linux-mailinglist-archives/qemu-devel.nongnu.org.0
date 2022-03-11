Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3E54D58AD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 04:06:16 +0100 (CET)
Received: from localhost ([::1]:42956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSVbb-00050z-1N
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 22:06:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nSVZb-0004As-AY
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 22:04:11 -0500
Received: from [2607:f8b0:4864:20::62a] (port=46042
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nSVZY-0004fR-KY
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 22:04:10 -0500
Received: by mail-pl1-x62a.google.com with SMTP id q13so6577250plk.12
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 19:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+LdDvuQm+YZ02RdNEKuUar7qoJIxQ71EMyNp8eQEF18=;
 b=Iyj4s07eP0cqItdihMzuYBK/pEQIbAwVfthmAxaxZhtmjhmw1Go3mP9riG4l2CalEe
 g9crgtqIWeIjnHSlzXgWUa2rjeKOvL5x8KFGiyzWImmIA04jSKy7AIrw/Lxbnaj57tTq
 S4u5yZ7Tf9VXb59EnAlSoLIGHL6Wv5C1pDyWn+rt2lZBqJGRv0C1O/hGzVc9qiwfWTdp
 QfnEzgvnWZEawcAVRpVKeyYS2qvw7+QqOfT7f6OoUDouokqTo1lgNqh+NeHUdA0WUTjy
 7kMWWMu8qRXZruV3kk2L0W0emcJogwMCuhaIiN9jKn9DQ5LpX2Kf57v5xO/woKU+DCmW
 EO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+LdDvuQm+YZ02RdNEKuUar7qoJIxQ71EMyNp8eQEF18=;
 b=axYIsOaLrSJMFNc6Pb3XgjcWqILvkptea6Rto/KUK3wsfkq0i/NZFLefL/bp80RfSn
 sqJTV6yB+duukm4wMR5fOxT4MjfGr4rpOM5vipWpDsNTiSRClf/t5iE17SqiLZ8mLjH6
 hFkgUfBsqBEZYXYNXuaEt/km0Uu0i9aEAGt+q147YQTCiy2imieb7hA/2lIoQQwNqbhr
 zQ6YSfs5qY34sz/F4rRH5iBexrH5+R5OeVgD8ncyGs4ylPgSjaaYBhXgYahQ0T+5wvY7
 hmf/+bwj8Os0thgw7iGQvh+oE8CQdm02/Qu/r4R2cvPxQ84VsxojYIi2OFvUlLKzWz6b
 3xOQ==
X-Gm-Message-State: AOAM531Gphj5alBZp6Engqt90F9HyJzcey4ocHMPx6eiCP7vclCfSlKg
 ujzr0Jt4SQpCgWT/EPwh+E9m4g==
X-Google-Smtp-Source: ABdhPJzTNcCwWwH+XUzGTBSfYhqHMn0q9coHENvE1EOvkr3cD+AII+fSqdMqfXdymnJBLklOaeR3tw==
X-Received: by 2002:a17:902:a3c3:b0:151:ec83:d88 with SMTP id
 q3-20020a170902a3c300b00151ec830d88mr8633941plb.9.1646967845826; 
 Thu, 10 Mar 2022 19:04:05 -0800 (PST)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 l62-20020a633e41000000b0037fee1843dbsm6753559pga.25.2022.03.10.19.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 19:04:05 -0800 (PST)
Message-ID: <da299466-6028-283f-13fd-21569b1f4a11@ozlabs.ru>
Date: Fri, 11 Mar 2022 14:03:56 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:98.0) Gecko/20100101
 Thunderbird/98.0
Subject: Re: [PATCH v3 1/4] target/ppc: Fix masked PVR matching
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
References: <20220307065527.156132-1-npiggin@gmail.com>
 <20220307065527.156132-2-npiggin@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220307065527.156132-2-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/7/22 17:55, Nicholas Piggin wrote:
> The pvr_match for a CPU class is not supposed to just match for any
> CPU in the family, but rather whether this particular CPU class is the
> best match in the family.
> 
> Prior to this fix, e.g., a POWER9 DD2.3 KVM host matches to the
> power9_v1.0 class (because that's first in the list). After the patch,
> it matches the power9_v2.0 class.


So if we get now another revision of p10, this just won't work at all 
instead of matching DD1. Not that we have a reasonable chance of this 
happening though...




> Fixes: 03ae4133ab8 ("target-ppc: Add pvr_match() callback")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   target/ppc/cpu_init.c | 51 ++++++++++++++++++++++++++++---------------
>   1 file changed, 34 insertions(+), 17 deletions(-)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 073fd10168..83ca741bea 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -5910,13 +5910,14 @@ static void init_proc_POWER7(CPUPPCState *env)
>   
>   static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr)
>   {
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER7P_BASE) {
> -        return true;
> -    }
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER7_BASE) {
> -        return true;
> +    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +
> +    if (base != pcc_base) {
> +        return false;
>       }
> -    return false;
> +
> +    return true;
>   }
>   
>   static bool cpu_has_work_POWER7(CPUState *cs)
> @@ -6070,16 +6071,14 @@ static void init_proc_POWER8(CPUPPCState *env)
>   
>   static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr)
>   {
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER8NVL_BASE) {
> -        return true;
> -    }
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER8E_BASE) {
> -        return true;
> -    }
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER8_BASE) {
> -        return true;
> +    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;

(after looking at failing 
"QTEST_QEMU_BINARY=~/pbuild/qemu-localhost-ppc64/qemu-system-ppc64 
~/pbuild/qemu-localhost-ppc64/tests/qtest/pnv-xscom-test")

So this breaks using different family masks for the same machine type,
like, 0x004[BCD]xxxx for pnv_machine_power8_class_init()'s 
POWERPC_CPU_TYPE_NAME("power8_v2.0").

So I'd keep P7/P8 where they are today and create a new machine type for 
every family mask (higher 16 bits of PVR). Thanks,



> +
> +    if (base != pcc_base) {
> +        return false;
>       }
> -    return false;
> +
> +    return true;
>   }
>   
>   static bool cpu_has_work_POWER8(CPUState *cs)
> @@ -6277,9 +6276,18 @@ static void init_proc_POWER9(CPUPPCState *env)
>   
>   static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr)
>   {
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER9_BASE) {
> +    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +
> +    if (base != pcc_base) {
> +        return false;
> +    }
> +
> +    if ((pvr & 0x0f00) == (pcc->pvr & 0x0f00)) {
> +        /* Major DD version matches to power9_v1.0 and power9_v2.0 */
>           return true;
>       }
> +
>       return false;
>   }
>   
> @@ -6489,9 +6497,18 @@ static void init_proc_POWER10(CPUPPCState *env)
>   
>   static bool ppc_pvr_match_power10(PowerPCCPUClass *pcc, uint32_t pvr)
>   {
> -    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER10_BASE) {
> +    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
> +
> +    if (base != pcc_base) {
> +        return false;
> +    }
> +
> +    if ((pvr & 0x0f00) == (pcc->pvr & 0x0f00)) {
> +        /* Major DD version matches to power10_v1.0 and power10_v2.0 */
>           return true;
>       }
> +
>       return false;
>   }
>   

