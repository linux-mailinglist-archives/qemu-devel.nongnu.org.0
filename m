Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E5F488895
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:51:59 +0100 (CET)
Received: from localhost ([::1]:39606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Urm-0001gm-9X
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:51:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTs-0005Ys-Q9
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:16 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55750
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTo-0006LG-N2
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:16 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B6A5D62E7B;
 Sun,  9 Jan 2022 17:26:46 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720406; bh=TBrN3jTaLSZWdK2Dv7WDOqLic2YN0o1RbacF7zDrWTA=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=cdHynLdpR+zuloTMebuQPCLBKIn7AowFR6eb77OqSv/LvFSgpEd/BWy2s+JmcFpvG
 5fPm3umRlUlZdhWVw2fPhROi0wt7IK+nMQDld2afEOl+uHJFS4fFD4+IJMBdrUL+Nw
 3M9uYNdiDSBfHiYD4hdjxSOCvmd6cAxdkpVSi5xE=
Message-ID: <ce7313c6-0376-2f43-21bf-dc8a864baa18@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [RFC PATCH v4 03/30] target/loongarch: Add basic vmstate
 description of CPU.
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-4-yangxiaojuan@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220108091419.2027710-4-yangxiaojuan@loongson.cn>
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
> This patch introduce vmstate_loongarch_cpu
Again, pointless commit message.
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
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
Use consistent casing; "machine state" or "Machine State".
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
"Remaining CSRs"
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
"debug registers"
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

