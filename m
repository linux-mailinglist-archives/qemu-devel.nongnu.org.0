Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714C9467155
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 06:09:08 +0100 (CET)
Received: from localhost ([::1]:51786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt0ol-0005lO-2M
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 00:09:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt0nf-0004yX-CG
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 00:07:59 -0500
Received: from [2a00:1450:4864:20::32a] (port=36448
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt0nc-0000zQ-7W
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 00:07:59 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso3934765wml.1
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 21:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1HzcrWAvGmTUX+Hm36O7mgiWvuIVCo+PL1FfOvYl0mA=;
 b=EwnvRrBzkJNKw/xZ/2L4eEYBkffrQKav8TNXTRoBBzxrWX1sMuNJmhgnikb2XWF6jD
 JugFWug/S/3qez2LN2+VlWDeP39awr9ioprv/ki40m4JZZm8OlqUbigSedR7VlNKOoJp
 kkw4iVLGs/OIEMCID6r1hmEcxRY9X6sppkjpU71CKpe7+3xBmG3stD2siN/ASd+vdC5h
 hKRBoEMm7UpvdzKGY4Da/XIQLqB+bzZGVu4lUIPGNz8rjCGT5+XcpLDyOJangr67LddX
 KfYKCWHC/aiqI2G87T6rbG8Gpx75BUcAvpqNSbjybDl2+DGaXxCcDNmwyn+WGy47FQHO
 C1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1HzcrWAvGmTUX+Hm36O7mgiWvuIVCo+PL1FfOvYl0mA=;
 b=32Eu+oCCAebmVwFBiSd+XB8xI6visrKxxzYRoCfgRqWHJFC4y4g2CmooetdW0RaNcU
 m+37Ag/ZkDfRHvpNH37Dd9ANPk22A9FbhsTuTNy/bg3YtQHi+ojk2mZ7friIgXJV1lZH
 Iepd4/KkMVu4OPCWizhrNkP/pkySzsk0zWETRSmIWy/4XSrFjj/QS/g5BD4bBUUhTCkG
 kppCNAat4juq64E3W2JyDBpko2qTLpEDT2AWBA0PI0HWU5PtrzekeiWLaI4IGfFIbLPY
 3c+2kD2/zKauo2eYJUwKw5DOqAxmwuI4EQw+AT6Q9AW6sRkahg7k2WDCaihAj4i5d/X2
 zrNA==
X-Gm-Message-State: AOAM530C3e04K/hMM0CsnfD0bWDKihDQD/n2hc2jwydt9f9iR6OUvUll
 sTun6coVqE5CuGwdi2K1qfJM6m8vEin4XVHJ0aUzaQ==
X-Google-Smtp-Source: ABdhPJx/MYygLA1gO5zaf8vUfV+T1NqnKCxZSNk7TN7ZEb36ELOsMqUqfuDw+gBoZyYd5WzHTO4AAjO+RzWZRydTGTg=
X-Received: by 2002:a7b:c256:: with SMTP id b22mr12040192wmj.176.1638508073956; 
 Thu, 02 Dec 2021 21:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-2-jiangyifei@huawei.com>
In-Reply-To: <20211120074644.729-2-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 10:37:42 +0530
Message-ID: <CAAhSdy3kHbFX7bBCOn-m9BNtc_iHc-E+uE-GrPBWRj81DtAShQ@mail.gmail.com>
Subject: Re: [PATCH v1 01/12] update-linux-headers: Add asm-riscv/kvm.h
To: Yifei Jiang <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32a;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Mingwang Li <limingwang@huawei.com>, KVM General <kvm@vger.kernel.org>,
 libvir-list@redhat.com, Anup Patel <anup.patel@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, wanbo13@huawei.com,
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org,
 wanghaibin.wang@huawei.com, Alistair Francis <Alistair.Francis@wdc.com>,
 fanliang@huawei.com, "Wubin \(H\)" <wu.wubin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 20, 2021 at 1:17 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Add asm-riscv/kvm.h for RISC-V KVM, and update linux/kvm.h
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  linux-headers/asm-riscv/kvm.h | 128 ++++++++++++++++++++++++++++++++++
>  linux-headers/linux/kvm.h     |   8 +++
>  2 files changed, 136 insertions(+)
>  create mode 100644 linux-headers/asm-riscv/kvm.h
>
> diff --git a/linux-headers/asm-riscv/kvm.h b/linux-headers/asm-riscv/kvm.h
> new file mode 100644
> index 0000000000..f808ad1ce5
> --- /dev/null
> +++ b/linux-headers/asm-riscv/kvm.h
> @@ -0,0 +1,128 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2019 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *     Anup Patel <anup.patel@wdc.com>
> + */
> +
> +#ifndef __LINUX_KVM_RISCV_H
> +#define __LINUX_KVM_RISCV_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/types.h>
> +#include <asm/ptrace.h>
> +
> +#define __KVM_HAVE_READONLY_MEM
> +
> +#define KVM_COALESCED_MMIO_PAGE_OFFSET 1
> +
> +#define KVM_INTERRUPT_SET      -1U
> +#define KVM_INTERRUPT_UNSET    -2U
> +
> +/* for KVM_GET_REGS and KVM_SET_REGS */
> +struct kvm_regs {
> +};
> +
> +/* for KVM_GET_FPU and KVM_SET_FPU */
> +struct kvm_fpu {
> +};
> +
> +/* KVM Debug exit structure */
> +struct kvm_debug_exit_arch {
> +};
> +
> +/* for KVM_SET_GUEST_DEBUG */
> +struct kvm_guest_debug_arch {
> +};
> +
> +/* definition of registers in kvm_run */
> +struct kvm_sync_regs {
> +};
> +
> +/* for KVM_GET_SREGS and KVM_SET_SREGS */
> +struct kvm_sregs {
> +};
> +
> +/* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_config {
> +       unsigned long isa;
> +};
> +
> +/* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_core {
> +       struct user_regs_struct regs;
> +       unsigned long mode;
> +};
> +
> +/* Possible privilege modes for kvm_riscv_core */
> +#define KVM_RISCV_MODE_S       1
> +#define KVM_RISCV_MODE_U       0
> +
> +/* CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_csr {
> +       unsigned long sstatus;
> +       unsigned long sie;
> +       unsigned long stvec;
> +       unsigned long sscratch;
> +       unsigned long sepc;
> +       unsigned long scause;
> +       unsigned long stval;
> +       unsigned long sip;
> +       unsigned long satp;
> +       unsigned long scounteren;
> +};
> +
> +/* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_timer {
> +       __u64 frequency;
> +       __u64 time;
> +       __u64 compare;
> +       __u64 state;
> +};
> +
> +/* Possible states for kvm_riscv_timer */
> +#define KVM_RISCV_TIMER_STATE_OFF      0
> +#define KVM_RISCV_TIMER_STATE_ON       1
> +
> +#define KVM_REG_SIZE(id)               \
> +       (1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
> +
> +/* If you need to interpret the index values, here is the key: */
> +#define KVM_REG_RISCV_TYPE_MASK                0x00000000FF000000
> +#define KVM_REG_RISCV_TYPE_SHIFT       24
> +
> +/* Config registers are mapped as type 1 */
> +#define KVM_REG_RISCV_CONFIG           (0x01 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_CONFIG_REG(name) \
> +       (offsetof(struct kvm_riscv_config, name) / sizeof(unsigned long))
> +
> +/* Core registers are mapped as type 2 */
> +#define KVM_REG_RISCV_CORE             (0x02 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_CORE_REG(name)   \
> +               (offsetof(struct kvm_riscv_core, name) / sizeof(unsigned long))
> +
> +/* Control and status registers are mapped as type 3 */
> +#define KVM_REG_RISCV_CSR              (0x03 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_CSR_REG(name)    \
> +               (offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
> +
> +/* Timer registers are mapped as type 4 */
> +#define KVM_REG_RISCV_TIMER            (0x04 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_TIMER_REG(name)  \
> +               (offsetof(struct kvm_riscv_timer, name) / sizeof(__u64))
> +
> +/* F extension registers are mapped as type 5 */
> +#define KVM_REG_RISCV_FP_F             (0x05 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_FP_F_REG(name)   \
> +               (offsetof(struct __riscv_f_ext_state, name) / sizeof(__u32))
> +
> +/* D extension registers are mapped as type 6 */
> +#define KVM_REG_RISCV_FP_D             (0x06 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_FP_D_REG(name)   \
> +               (offsetof(struct __riscv_d_ext_state, name) / sizeof(__u64))
> +
> +#endif
> +
> +#endif /* __LINUX_KVM_RISCV_H */
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index bcaf66cc4d..5e290c3c3e 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -269,6 +269,7 @@ struct kvm_xen_exit {
>  #define KVM_EXIT_AP_RESET_HOLD    32
>  #define KVM_EXIT_X86_BUS_LOCK     33
>  #define KVM_EXIT_XEN              34
> +#define KVM_EXIT_RISCV_SBI        35
>
>  /* For KVM_EXIT_INTERNAL_ERROR */
>  /* Emulate instruction failed. */
> @@ -469,6 +470,13 @@ struct kvm_run {
>                 } msr;
>                 /* KVM_EXIT_XEN */
>                 struct kvm_xen_exit xen;
> +               /* KVM_EXIT_RISCV_SBI */
> +               struct {
> +                       unsigned long extension_id;
> +                       unsigned long function_id;
> +                       unsigned long args[6];
> +                       unsigned long ret[2];
> +               } riscv_sbi;
>                 /* Fix the size of the union. */
>                 char padding[256];
>         };
> --
> 2.19.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

