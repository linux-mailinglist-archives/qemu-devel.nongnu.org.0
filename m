Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D2C48888C
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:43:04 +0100 (CET)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Uj9-0006SG-V9
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:43:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTp-0005O6-BJ
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:13 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55748
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTm-0006LH-CN
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:13 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3E1DC62E7A;
 Sun,  9 Jan 2022 17:26:46 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720406; bh=MRAmGdDv1WnCoF4fCoLza1jKSeAjqoXNAAdNn7hKM5k=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=Y3eAqyIFVo79RlSrgau9hbMKJspXpj1oSwYQfTODr9WxNB8keoiR5HnSbTpKIExVn
 +ggxAyD5KGG6V483uqZcp3BhUZmbAUbEB7uSe3u6g4RbQrB0/CiuVgD0hoeDo0Rdai
 t0xpUfkNRUPcOqLZ9QUe015tH99K6xQtvPYSTMGE=
Message-ID: <95c827fc-ccaa-94d5-b263-ee325922cdaa@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [RFC PATCH v4 02/30] target/loongarch: Add CSR registers
 definition
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-3-yangxiaojuan@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220108091419.2027710-3-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 philmd@redhat.com, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/8/22 17:13, Xiaojuan Yang wrote:
> 1.Define All the CSR registers and its field.
> 2.Set some default csr values.
Unnecessary explanation; the code addition itself should be obvious 
enough as to its intention.
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/cpu-csr.h | 236 +++++++++++++++++++++++++++++++++++++
>   target/loongarch/cpu.c     |  35 ++++++
>   target/loongarch/cpu.h     |  57 +++++++++
>   3 files changed, 328 insertions(+)
>   create mode 100644 target/loongarch/cpu-csr.h
>
> diff --git a/target/loongarch/cpu-csr.h b/target/loongarch/cpu-csr.h
> new file mode 100644
> index 0000000000..7a57b7ea36
> --- /dev/null
> +++ b/target/loongarch/cpu-csr.h
> @@ -0,0 +1,236 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU LoongArch CPU CSR registers
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef LOONGARCH_CPU_CSR_H
> +#define LOONGARCH_CPU_CSR_H
> +
> +/* Base on: kernal: arch/loongarch/include/asm/loongarch.h */
"Based on kernel definitions: ..."
> +
> +/* Basic CSR register */
> +#define LOONGARCH_CSR_CRMD           0x0 /* Current mode info */
Do we really need all these ad-hoc translated names when people could 
easily be pointed to the manuals? This way translation errors can be 
avoided, such as...
> +FIELD(CSR_CRMD, PLV, 0, 2)
> +FIELD(CSR_CRMD, IE, 2, 1)
> +FIELD(CSR_CRMD, DA, 3, 1)
> +FIELD(CSR_CRMD, PG, 4, 1)
> +FIELD(CSR_CRMD, DATF, 5, 2)
> +FIELD(CSR_CRMD, DATM, 7, 2)
> +FIELD(CSR_CRMD, WE, 9, 1)
> +
> +#define LOONGARCH_CSR_PRMD           0x1 /* Prev-exception mode info */
> +FIELD(CSR_PRMD, PPLV, 0, 2)
> +FIELD(CSR_PRMD, PIE, 2, 1)
> +FIELD(CSR_PRMD, PWE, 3, 1)
> +
> +#define LOONGARCH_CSR_EUEN           0x2 /* Extended unit enable */
> +FIELD(CSR_EUEN, FPE, 0, 1)
> +FIELD(CSR_EUEN, SXE, 1, 1)
> +FIELD(CSR_EUEN, ASXE, 2, 1)
> +FIELD(CSR_EUEN, BTE, 3, 1)
> +
> +#define LOONGARCH_CSR_MISC           0x3 /* Misc config */
> +
> +#define LOONGARCH_CSR_ECFG           0x4 /* Exception config */
> +FIELD(CSR_ECFG, LIE, 0, 13)
> +FIELD(CSR_ECFG, VS, 16, 3)
> +
> +#define LOONGARCH_CSR_ESTAT          0x5 /* Exception status */
> +FIELD(CSR_ESTAT, IS, 0, 13)
> +FIELD(CSR_ESTAT, ECODE, 16, 6)
> +FIELD(CSR_ESTAT, ESUBCODE, 22, 9)
> +
> +#define  EXCCODE_EXTERNAL_INT   64   /* plus external interrupt number */
what's "plus external interrupt"?
> +#define  EXCCODE_INT                 0
> +#define  EXCCODE_PIL                 1
> +#define  EXCCODE_PIS                 2
> +#define  EXCCODE_PIF                 3
> +#define  EXCCODE_PME                 4
> +#define  EXCCODE_PNR                 5
> +#define  EXCCODE_PNX                 6
> +#define  EXCCODE_PPI                 7
> +#define  EXCCODE_ADEF                8 /* Have different expsubcode */
"different exception subcodes"
> +#define  EXCCODE_ADEM                8 /* Have different expsubcode */
> +#define  EXCCODE_ALE                 9
> +#define  EXCCODE_BCE                 10
> +#define  EXCCODE_SYS                 11
> +#define  EXCCODE_BRK                 12
> +#define  EXCCODE_INE                 13
> +#define  EXCCODE_IPE                 14
> +#define  EXCCODE_FPD                 15
> +#define  EXCCODE_SXD                 16
> +#define  EXCCODE_ASXD                17
> +#define  EXCCODE_FPE                 18 /* Have different expsubcode */
> +#define  EXCCODE_VFPE                18
> +#define  EXCCODE_WPEF                19 /* Have different expsubcode */
> +#define  EXCCODE_WPEM                19
> +#define  EXCCODE_BTD                 20
> +#define  EXCCODE_BTE                 21
> +#define  EXCCODE_DBP                 26 /* Reserved decode used for debug */
"decode"? also "used for debugging"?
> +
> +#define LOONGARCH_CSR_ERA            0x6 /* Exception return address */
> +
> +#define LOONGARCH_CSR_BADV           0x7 /* Bad virtual address */
> +
> +#define LOONGARCH_CSR_BADI           0x8 /* Bad instruction */
> +
> +#define LOONGARCH_CSR_EENTRY         0xc /* Exception enter base address */
"exception entrypoint"?
> +
> +/* TLB related CSR register */
"CSR register" is duplication; "R" is already "register". Also "CSRs"...
> +#define LOONGARCH_CSR_TLBIDX         0x10 /* TLB Index, EHINV, PageSize, NP */
> +FIELD(CSR_TLBIDX, INDEX, 0, 12)
> +FIELD(CSR_TLBIDX, PS, 24, 6)
> +FIELD(CSR_TLBIDX, NE, 31, 1)
> +
> +#define LOONGARCH_CSR_TLBEHI         0x11 /* TLB EntryHi without ASID */
I cannot find the "without ASID" part in the Chinese manual...
> +FIELD(CSR_TLBEHI, VPPN, 13, 35)
> +
> +#define LOONGARCH_CSR_TLBELO0        0x12 /* TLB EntryLo0 */
> +#define LOONGARCH_CSR_TLBELO1        0x13 /* TLB EntryLo1 */
> +FIELD(TLBENTRY, V, 0, 1)
> +FIELD(TLBENTRY, D, 1, 1)
> +FIELD(TLBENTRY, PLV, 2, 2)
> +FIELD(TLBENTRY, MAT, 4, 2)
> +FIELD(TLBENTRY, G, 6, 1)
> +FIELD(TLBENTRY, PPN, 12, 36)
> +FIELD(TLBENTRY, NR, 61, 1)
> +FIELD(TLBENTRY, NX, 62, 1)
> +FIELD(TLBENTRY, RPLV, 63, 1)
> +
> +#define LOONGARCH_CSR_ASID           0x18 /* Address space identifier */
> +FIELD(CSR_ASID, ASID, 0, 10)
> +FIELD(CSR_ASID, ASIDBITS, 16, 8)
> +
> +/* Page table base address when badv[47] = 0 */
> +#define LOONGARCH_CSR_PGDL           0x19
> +/* Page table base address when badv[47] = 1 */
> +#define LOONGARCH_CSR_PGDH           0x1a
> +
> +#define LOONGARCH_CSR_PGD            0x1b /* Page table base */
> +
> +/* Page walk controller's low addr */
> +#define LOONGARCH_CSR_PWCL           0x1c
> +FIELD(CSR_PWCL, PTBASE, 0, 5)
> +FIELD(CSR_PWCL, PTWIDTH, 5, 5)
> +FIELD(CSR_PWCL, DIR1_BASE, 10, 5)
> +FIELD(CSR_PWCL, DIR1_WIDTH, 15, 5)
> +FIELD(CSR_PWCL, DIR2_BASE, 20, 5)
> +FIELD(CSR_PWCL, DIR2_WIDTH, 25, 5)
> +FIELD(CSR_PWCL, PTEWIDTH, 30, 2)
> +
> +/* Page walk controller's high addr */
> +#define LOONGARCH_CSR_PWCH           0x1d
> +FIELD(CSR_PWCH, DIR3_BASE, 0, 6)
> +FIELD(CSR_PWCH, DIR3_WIDTH, 6, 6)
> +FIELD(CSR_PWCH, DIR4_BASE, 12, 6)
> +FIELD(CSR_PWCH, DIR4_WIDTH, 18, 6)
> +
> +#define LOONGARCH_CSR_STLBPS         0x1e /*Stlb page size*/
Spaces around the comment text...
> +FIELD(CSR_STLBPS, PS, 0, 5)
> +
> +#define LOONGARCH_CSR_RVACFG         0x1f /* Reduced virtual address config */
> +FIELD(CSR_RVACFG, RBITS, 0, 4)
> +
> +/* Config CSR registers */
> +#define LOONGARCH_CSR_CPUID          0x20 /* CPU core id */
> +
> +#define LOONGARCH_CSR_PRCFG1         0x21 /* Config1 */
> +FIELD(CSR_PRCFG1, SAVE_NUM, 0, 4)
> +FIELD(CSR_PRCFG1, TIMER_BITS, 4, 8)
> +FIELD(CSR_PRCFG1, VSMAX, 12, 3)
> +
> +#define LOONGARCH_CSR_PRCFG2         0x22 /* Config2 */
> +
> +#define LOONGARCH_CSR_PRCFG3         0x23 /* Config3 */
> +FIELD(CSR_PRCFG3, TLB_TYPE, 0, 4)
> +FIELD(CSR_PRCFG3, MTLB_ENTRY, 4, 8)
> +FIELD(CSR_PRCFG3, STLB_WAYS, 12, 8)
> +FIELD(CSR_PRCFG3, STLB_SETS, 20, 8)
> +
> +/*
> + * Save registers count can read from PRCFG1.SAVE_NUM
> + * The Min count is 1. Max count is 15.
> + */
> +#define LOONGARCH_CSR_SAVE(N)        (0x30 + N)
> +
> +/* Timer registers */
> +#define LOONGARCH_CSR_TID            0x40 /* Timer ID */
> +
> +#define LOONGARCH_CSR_TCFG           0x41 /* Timer config */
> +FIELD(CSR_TCFG, EN, 0, 1)
> +FIELD(CSR_TCFG, PERIODIC, 1, 1)
> +FIELD(CSR_TCFG, INIT_VAL, 2, 46)
> +
> +#define LOONGARCH_CSR_TVAL           0x42 /* Timer ticks remain */
> +
> +#define LOONGARCH_CSR_CNTC           0x43 /* Timer offset */
> +
> +#define LOONGARCH_CSR_TICLR          0x44 /* Timer interrupt clear */
> +
> +/* LLBCTL register */
> +#define LOONGARCH_CSR_LLBCTL         0x60 /* LLBit control */
> +FIELD(CSR_LLBCTL, ROLLB, 0, 1)
> +FIELD(CSR_LLBCTL, WCLLB, 1, 1)
> +FIELD(CSR_LLBCTL, KLO, 2, 1)
> +
> +/* Implement dependent */
> +#define LOONGARCH_CSR_IMPCTL1        0x80 /* LoongArch config1 */
> +
> +#define LOONGARCH_CSR_IMPCTL2        0x81 /* LoongArch config2*/
Space after "control"...
> +
> +/* TLB Refill registers */
> +#define LOONGARCH_CSR_TLBRENTRY      0x88 /* TLB refill exception address */
> +#define LOONGARCH_CSR_TLBRBADV       0x89 /* TLB refill badvaddr */
Proper casing, this seems to just be "BADV" according to the manual.
> +#define LOONGARCH_CSR_TLBRERA        0x8a /* TLB refill ERA */
> +#define LOONGARCH_CSR_TLBRSAVE       0x8b /* KScratch for TLB refill */
> +FIELD(CSR_TLBRERA, ISTLBR, 0, 1)
> +FIELD(CSR_TLBRERA, PC, 2, 62)
> +#define LOONGARCH_CSR_TLBRELO0       0x8c /* TLB refill entrylo0 */
> +#define LOONGARCH_CSR_TLBRELO1       0x8d /* TLB refill entrylo1 */
> +#define LOONGARCH_CSR_TLBREHI        0x8e /* TLB refill entryhi */
> +FIELD(CSR_TLBREHI, PS, 0, 6)
> +FIELD(CSR_TLBREHI, VPPN, 13, 35)
> +#define LOONGARCH_CSR_TLBRPRMD       0x8f /* TLB refill mode info */
> +FIELD(CSR_TLBRPRMD, PPLV, 0, 2)
> +FIELD(CSR_TLBRPRMD, PIE, 2, 1)
> +FIELD(CSR_TLBRPRMD, PWE, 4, 1)
> +
> +/* Machine Error registers */
> +#define LOONGARCH_CSR_MERRCTL        0x90 /* ERRCTL */
> +FIELD(CSR_MERRCTL, ISMERR, 0, 1)
> +#define LOONGARCH_CSR_MERRINFO1      0x91
> +#define LOONGARCH_CSR_MERRINFO2      0x92
> +#define LOONGARCH_CSR_MERRENTRY      0x93 /* MError exception base */
> +#define LOONGARCH_CSR_MERRERA        0x94 /* MError exception PC */
> +#define LOONGARCH_CSR_MERRSAVE       0x95 /* KScratch for error exception */
> +
> +#define LOONGARCH_CSR_CTAG           0x98 /* TagLo + TagHi */
This "TagLo + TagHi" is not present in the manual either.
> +
> +/* Direct map windows */
> +#define LOONGARCH_CSR_DMW(N)         (0x180 + N) /* direct map win MEM & IF */
> +FIELD(CSR_DMW, PLV0, 0, 1)
> +FIELD(CSR_DMW, PLV1, 1, 1)
> +FIELD(CSR_DMW, PLV2, 2, 1)
> +FIELD(CSR_DMW, PLV3, 3, 1)
> +FIELD(CSR_DMW, MAT, 4, 2)
> +FIELD(CSR_DMW, VSEG, 60, 4)
> +
> +#define dmw_va2pa(va) \
> +    (va & MAKE_64BIT_MASK(0, TARGET_VIRT_ADDR_SPACE_BITS))
> +
> +/* Debug registers */
> +#define LOONGARCH_CSR_DBG            0x500 /* debug config */
> +FIELD(CSR_DBG, DST, 0, 1)
> +FIELD(CSR_DBG, DREV, 1, 7)
> +FIELD(CSR_DBG, DEI, 8, 1)
> +FIELD(CSR_DBG, DCL, 9, 1)
> +FIELD(CSR_DBG, DFW, 10, 1)
> +FIELD(CSR_DBG, DMW, 11, 1)
> +FIELD(CSR_DBG, ECODE, 16, 6)
> +
> +#define LOONGARCH_CSR_DERA           0x501 /* Debug era */
> +#define LOONGARCH_CSR_DSAVE          0x502 /* Debug save */
> +
> +#endif /* LOONGARCH_CPU_CSR_H */
As pointed out in the numerous comments above, there are so many errors 
and inconsistencies in the comments, that it's probably better to just 
remove all of them. People working with this low level piece of software 
are expected to be familiar with the manuals, so the comments really 
don't serve any purpose if all they did were explaining the abbreviations.
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 883c6c623f..ed03ec2986 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -156,6 +156,8 @@ static void loongarch_3a5000_initfn(Object *obj)
>       data = FIELD_DP32(data, CPUCFG20, L3IU_WAYS, 0xf00f);
>       data = FIELD_DP32(data, CPUCFG20, L3IU_SETS, 0x60);
>       env->cpucfg[20] = data;
> +
> +    env->CSR_ASID = FIELD_DP64(0, CSR_ASID, ASIDBITS, 0xa);
>   }
>   
>   static void loongarch_cpu_list_entry(gpointer data, gpointer user_data)
> @@ -179,12 +181,45 @@ static void loongarch_cpu_reset(DeviceState *dev)
>       LoongArchCPU *cpu = LOONGARCH_CPU(cs);
>       LoongArchCPUClass *lacc = LOONGARCH_CPU_GET_CLASS(cpu);
>       CPULoongArchState *env = &cpu->env;
> +    int n;
>   
>       lacc->parent_reset(dev);
>   
>       env->fcsr0_mask = FCSR0_M1 | FCSR0_M2 | FCSR0_M3;
>       env->fcsr0 = 0x0;
>   
> +    /* Set csr registers value after reset */
> +    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PLV, 0);
> +    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, IE, 0);
> +    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, DA, 1);
> +    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PG, 0);
> +    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, DATF, 1);
> +    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, DATM, 1);
> +
> +    env->CSR_EUEN = FIELD_DP64(env->CSR_EUEN, CSR_EUEN, FPE, 0);
> +    env->CSR_EUEN = FIELD_DP64(env->CSR_EUEN, CSR_EUEN, SXE, 0);
> +    env->CSR_EUEN = FIELD_DP64(env->CSR_EUEN, CSR_EUEN, ASXE, 0);
> +    env->CSR_EUEN = FIELD_DP64(env->CSR_EUEN, CSR_EUEN, BTE, 0);
> +
> +    env->CSR_MISC = 0;
> +
> +    env->CSR_ECFG = FIELD_DP64(env->CSR_ECFG, CSR_ECFG, VS, 0);
> +    env->CSR_ECFG = FIELD_DP64(env->CSR_ECFG, CSR_ECFG, LIE, 0);
> +
> +    env->CSR_ESTAT = env->CSR_ESTAT & (~MAKE_64BIT_MASK(0, 2));
> +    env->CSR_RVACFG = FIELD_DP64(env->CSR_RVACFG, CSR_RVACFG, RBITS, 0);
> +    env->CSR_TCFG = FIELD_DP64(env->CSR_TCFG, CSR_TCFG, EN, 0);
> +    env->CSR_LLBCTL = FIELD_DP64(env->CSR_LLBCTL, CSR_LLBCTL, KLO, 0);
> +    env->CSR_TLBRERA = FIELD_DP64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR, 0);
> +    env->CSR_MERRCTL = FIELD_DP64(env->CSR_MERRCTL, CSR_MERRCTL, ISMERR, 0);
> +
> +    for (n = 0; n < 4; n++) {
> +        env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV0, 0);
> +        env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV1, 0);
> +        env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV2, 0);
> +        env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV3, 0);
> +    }
> +
>       restore_fp_status(env);
>       cs->exception_index = EXCP_NONE;
>   }
> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index b036cdee5f..cf7fc46f72 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -11,6 +11,7 @@
>   #include "exec/cpu-defs.h"
>   #include "fpu/softfloat-types.h"
>   #include "hw/registerfields.h"
> +#include "cpu-csr.h"
>   
>   #define TCG_GUEST_DEFAULT_MO (0)
>   
> @@ -170,6 +171,62 @@ struct CPULoongArchState {
>       uint64_t llval;
>   
>       uint64_t badaddr;
> +
> +    /* LoongArch CSR registers */
> +    uint64_t CSR_CRMD;
> +    uint64_t CSR_PRMD;
> +    uint64_t CSR_EUEN;
> +    uint64_t CSR_MISC;
> +    uint64_t CSR_ECFG;
> +    uint64_t CSR_ESTAT;
> +    uint64_t CSR_ERA;
> +    uint64_t CSR_BADV;
> +    uint64_t CSR_BADI;
> +    uint64_t CSR_EENTRY;
> +    uint64_t CSR_TLBIDX;
> +    uint64_t CSR_TLBEHI;
> +    uint64_t CSR_TLBELO0;
> +    uint64_t CSR_TLBELO1;
> +    uint64_t CSR_ASID;
> +    uint64_t CSR_PGDL;
> +    uint64_t CSR_PGDH;
> +    uint64_t CSR_PGD;
> +    uint64_t CSR_PWCL;
> +    uint64_t CSR_PWCH;
> +    uint64_t CSR_STLBPS;
> +    uint64_t CSR_RVACFG;
> +    uint64_t CSR_CPUID;
> +    uint64_t CSR_PRCFG1;
> +    uint64_t CSR_PRCFG2;
> +    uint64_t CSR_PRCFG3;
> +    uint64_t CSR_SAVE[16];
> +    uint64_t CSR_TID;
> +    uint64_t CSR_TCFG;
> +    uint64_t CSR_TVAL;
> +    uint64_t CSR_CNTC;
> +    uint64_t CSR_TICLR;
> +    uint64_t CSR_LLBCTL;
> +    uint64_t CSR_IMPCTL1;
> +    uint64_t CSR_IMPCTL2;
> +    uint64_t CSR_TLBRENTRY;
> +    uint64_t CSR_TLBRBADV;
> +    uint64_t CSR_TLBRERA;
> +    uint64_t CSR_TLBRSAVE;
> +    uint64_t CSR_TLBRELO0;
> +    uint64_t CSR_TLBRELO1;
> +    uint64_t CSR_TLBREHI;
> +    uint64_t CSR_TLBRPRMD;
> +    uint64_t CSR_MERRCTL;
> +    uint64_t CSR_MERRINFO1;
> +    uint64_t CSR_MERRINFO2;
> +    uint64_t CSR_MERRENTRY;
> +    uint64_t CSR_MERRERA;
> +    uint64_t CSR_MERRSAVE;
> +    uint64_t CSR_CTAG;
> +    uint64_t CSR_DMW[4];
> +    uint64_t CSR_DBG;
> +    uint64_t CSR_DERA;
> +    uint64_t CSR_DSAVE;
Field names should be lower-case snake_case form, as is the case for 
overwhelming majority of target CPUState definitions I checked (except 
MIPS, which you might be basing your code on). For sake of consistency, 
please change all of them to snake_case.
>   };
>   
>   /**

