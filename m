Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D54A48887A
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:33:51 +0100 (CET)
Received: from localhost ([::1]:53770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6UaE-0004iC-A1
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:33:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTa-0004Xh-3I
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:26:58 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55704
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTY-0006KK-4c
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:26:57 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E42E262E72;
 Sun,  9 Jan 2022 17:26:42 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720403; bh=ETpLno/e3TOf6H6BVQFfkkFxy+h6Af4aSUwGqxn/NcU=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=AYfphhLuBNjam/RkpsQ3XYXXXlVbNuqFIcyqoc6BUM1G9x6Ixs0KzD+hNO17DPf2Z
 W+UZaXOFQwEChxhP0ZfPS47r/fan9msKTh2TjC5cc+nBGz8HWagPFOOiJ+ZJw2x9d1
 FRRfTFrHUiphWIbqubzIuv9OPhYs1CcCPe1PKM0Q=
Message-ID: <e7e5bbae-d922-bcce-30c5-9fc12d42bbf4@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [PATCH v14 20/26] linux-user: Add LoongArch elf support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-21-gaosong@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220106094200.1801206-21-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/6/22 17:41, Song Gao wrote:
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/elfload.c                | 53 +++++++++++++++++++++++++++++
>   linux-user/loongarch64/target_elf.h | 12 +++++++
>   2 files changed, 65 insertions(+)
>   create mode 100644 linux-user/loongarch64/target_elf.h
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 767f54c76d..2ee83778f2 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -914,6 +914,59 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
>   
>   #endif
>   
> +#ifdef TARGET_LOONGARCH64
> +
> +#define ELF_START_MMAP 0x80000000
> +
> +#define ELF_CLASS   ELFCLASS64
> +#define ELF_ARCH    EM_LOONGARCH
> +
> +#define elf_check_arch(x) ((x) == EM_LOONGARCH)
> +static inline void init_thread(struct target_pt_regs *regs,
> +                               struct image_info *infop)
> +{
> +    regs->csr.crmd = 2 << 3;
This is just "1 << 4" and means to set the CSR.CRMD.PG bit, indicating 
that page translation is enabled; it's better to explain this somehow. 
(In writing this comment I realized you might be saying "0b10 << 3" 
instead, because the only valid combinations for the DA and PG bits are 
0b01 and 0b10; so "0b10 << 3" is also okay and maybe clearer.)
> +    regs->csr.era = infop->entry;
> +    regs->regs[3] = infop->start_stack;
> +}
> +
> +/* See linux kernel: arch/loongarch/include/asm/elf.h.  */
> +#define ELF_NREG 45
> +typedef target_elf_greg_t target_elf_gregset_t[ELF_NREG];
> +
> +enum {
> +    TARGET_EF_R0 = 0,
> +    TARGET_EF_CSR_ERA = TARGET_EF_R0 + 32,
> +    TARGET_EF_CSR_BADV = TARGET_EF_R0 + 33,
> +};
> +
> +static void elf_core_copy_regs(target_elf_gregset_t *regs,
> +                               const CPULoongArchState *env)
> +{
> +    int i;
> +
> +    (*regs)[TARGET_EF_R0] = 0;
> +
> +    for (i = 1; i < ARRAY_SIZE(env->gpr); i++) {
> +        (*regs)[TARGET_EF_R0 + i] = tswapreg(env->gpr[i]);
> +    }
> +
> +    (*regs)[TARGET_EF_CSR_ERA] = tswapreg(env->pc);
> +    (*regs)[TARGET_EF_CSR_BADV] = tswapreg(env->badaddr);
> +}
> +
> +#define USE_ELF_CORE_DUMP
> +#define ELF_EXEC_PAGESIZE        4096
> +
> +#define ELF_HWCAP get_elf_hwcap()
> +
> +static uint32_t get_elf_hwcap(void)
> +{
> +    return 0;
> +}
> +
> +#endif /* TARGET_LOONGARCH64 */
> +
>   #ifdef TARGET_MIPS
>   
>   #define ELF_START_MMAP 0x80000000
> diff --git a/linux-user/loongarch64/target_elf.h b/linux-user/loongarch64/target_elf.h
> new file mode 100644
> index 0000000000..3c690bbf5b
> --- /dev/null
> +++ b/linux-user/loongarch64/target_elf.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef LOONGARCH_TARGET_ELF_H
> +#define LOONGARCH_TARGET_ELF_H
> +static inline const char *cpu_get_model(uint32_t eflags)
> +{
> +    return "Loongson-3A5000";
> +}
> +#endif

