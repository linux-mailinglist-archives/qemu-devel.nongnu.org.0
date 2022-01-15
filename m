Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E758348F6F4
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 14:06:00 +0100 (CET)
Received: from localhost ([::1]:43920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8ikq-0001mI-18
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 08:06:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8iXn-0004hZ-Ag
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 07:52:32 -0500
Received: from [2001:41c9:1:41f::167] (port=48710
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8iXk-0000ef-CY
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 07:52:31 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8iX6-0005rt-EY; Sat, 15 Jan 2022 12:51:52 +0000
Message-ID: <f1742996-1739-c8d5-6a86-023261853c49@ilande.co.uk>
Date: Sat, 15 Jan 2022 12:52:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-4-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220108091419.2027710-4-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v4 03/30] target/loongarch: Add basic vmstate
 description of CPU.
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, philmd@redhat.com,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/01/2022 09:13, Xiaojuan Yang wrote:

> This patch introduce vmstate_loongarch_cpu
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/loongarch/cpu.c       |  3 ++
>   target/loongarch/internals.h |  4 ++
>   target/loongarch/machine.c   | 84 ++++++++++++++++++++++++++++++++++++
>   target/loongarch/meson.build |  6 +++
>   4 files changed, 97 insertions(+)
>   create mode 100644 target/loongarch/machine.c
> 
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index ed03ec2986..6e3dc5e6fa 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -320,6 +320,9 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
>       cc->has_work = loongarch_cpu_has_work;
>       cc->dump_state = loongarch_cpu_dump_state;
>       cc->set_pc = loongarch_cpu_set_pc;
> +#ifndef CONFIG_USER_ONLY
> +    dc->vmsd = &vmstate_loongarch_cpu;
> +#endif

Do we need CONFIG_USER_ONLY guards around dc->vmsd? I'd expect this to simply be 
ignored in linux-user mode. Again it's a bit hard to see the full context without 
having the complete series available in git somewhere.

>       cc->disas_set_info = loongarch_cpu_disas_set_info;
>   #ifdef CONFIG_TCG
>       cc->tcg_ops = &loongarch_tcg_ops;
> diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
> index 774a87ec80..c8e6f7012c 100644
> --- a/target/loongarch/internals.h
> +++ b/target/loongarch/internals.h
> @@ -25,4 +25,8 @@ const char *loongarch_exception_name(int32_t exception);
>   
>   void restore_fp_status(CPULoongArchState *env);
>   
> +#ifndef CONFIG_USER_ONLY
> +extern const VMStateDescription vmstate_loongarch_cpu;
> +#endif
> +
>   #endif
> diff --git a/target/loongarch/machine.c b/target/loongarch/machine.c
> new file mode 100644
> index 0000000000..b9effe6db2
> --- /dev/null
> +++ b/target/loongarch/machine.c
> @@ -0,0 +1,84 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU LoongArch machine State
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "migration/cpu.h"
> +
> +/* LoongArch CPU state */
> +
> +const VMStateDescription vmstate_loongarch_cpu = {
> +    .name = "cpu",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +
> +        VMSTATE_UINTTL_ARRAY(env.gpr, LoongArchCPU, 32),
> +        VMSTATE_UINTTL(env.pc, LoongArchCPU),
> +        VMSTATE_UINT64_ARRAY(env.fpr, LoongArchCPU, 32),
> +        VMSTATE_UINT32(env.fcsr0, LoongArchCPU),
> +
> +        /* Remaining CSR registers */
> +        VMSTATE_UINT64(env.CSR_CRMD, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_PRMD, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_EUEN, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_MISC, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_ECFG, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_ESTAT, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_ERA, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_BADV, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_BADI, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_EENTRY, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TLBIDX, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TLBEHI, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TLBELO0, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TLBELO1, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_ASID, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_PGDL, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_PGDH, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_PGD, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_PWCL, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_PWCH, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_STLBPS, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_RVACFG, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_CPUID, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_PRCFG1, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_PRCFG2, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_PRCFG3, LoongArchCPU),
> +        VMSTATE_UINT64_ARRAY(env.CSR_SAVE, LoongArchCPU, 16),
> +        VMSTATE_UINT64(env.CSR_TID, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TCFG, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TVAL, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_CNTC, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TICLR, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_LLBCTL, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_IMPCTL1, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_IMPCTL2, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TLBRENTRY, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TLBRBADV, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TLBRERA, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TLBRSAVE, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TLBRELO0, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TLBRELO1, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TLBREHI, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_TLBRPRMD, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_MERRCTL, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_MERRINFO1, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_MERRINFO2, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_MERRENTRY, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_MERRERA, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_MERRSAVE, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_CTAG, LoongArchCPU),
> +        VMSTATE_UINT64_ARRAY(env.CSR_DMW, LoongArchCPU, 4),
> +        /* debug */
> +        VMSTATE_UINT64(env.CSR_DBG, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_DERA, LoongArchCPU),
> +        VMSTATE_UINT64(env.CSR_DSAVE, LoongArchCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
> index bcb076e55f..103f36ee15 100644
> --- a/target/loongarch/meson.build
> +++ b/target/loongarch/meson.build
> @@ -14,6 +14,12 @@ loongarch_tcg_ss.add(files(
>   ))
>   loongarch_tcg_ss.add(zlib)
>   
> +loongarch_softmmu_ss = ss.source_set()
> +loongarch_softmmu_ss.add(files(
> +  'machine.c',
> +))
> +
>   loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
>   
>   target_arch += {'loongarch': loongarch_ss}
> +target_softmmu_arch += {'loongarch': loongarch_softmmu_ss}


ATB,

Mark.

