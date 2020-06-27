Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E613920C35E
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jun 2020 19:52:20 +0200 (CEST)
Received: from localhost ([::1]:51752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpEzz-0006dr-BX
	for lists+qemu-devel@lfdr.de; Sat, 27 Jun 2020 13:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1jpEz7-0006D6-7b
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 13:51:25 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:44302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1jpEz5-00049z-IP
 for qemu-devel@nongnu.org; Sat, 27 Jun 2020 13:51:24 -0400
Received: by mail-ej1-x644.google.com with SMTP id ga4so12271833ejb.11
 for <qemu-devel@nongnu.org>; Sat, 27 Jun 2020 10:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cft8K29IvIwysL2T6qzqpuXqnzz5p4Sk28aawTUjDtQ=;
 b=gvJK1rh/N2AMQzKVcfq2IhZDn1YT9JnxdW/egAlASphtngY6oG3r2bNjgnP2ZQbN1O
 0LzuNueqFHsbjSWuTERDq79q/C5DunnDtIFTou2J2E1grjowjGhfgczz5pg+eiXD1K0g
 d7hEqz8k6uAjvc+G0Pd3BipaNwwZmTy4buXB2g7Tv2WcpykMc231bib1pV+VZYYBc/a0
 Uu9WPxGnVmJijNCYcSBKvDxPgV9ptPAqsMvWyXMPZn0irROBMURmURDa2kZLCvwsUBtF
 /Shh4UUzXaMJdeDoxWTsszjKAoddj70SWXK89Ec5RqKnjf2TUJEBzpAefuDdt+lHXg2f
 qctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cft8K29IvIwysL2T6qzqpuXqnzz5p4Sk28aawTUjDtQ=;
 b=kVf4IdbaZPoiHMU66bDyWsIrif2cRt+ZRtob8BkcyQsu4gs4ALR395qDwP9XIlMccB
 VIZjC80Us3p6jS7MM45zN67KifB5uLqBYkfrDbS+0TjxiK9vlzOYtGavz81vg0Tk3jlr
 2vLBI/TsdZ+ECfmzCaLriGwwjV4bidHMQZaZk9acaJPTzqpm22RI6OKc0XSHZUC1zhuz
 n/YS2qwpP09LPXQskGJEJw0PGrUOUK+9SSTmGxnvlSliUT39osLnxDn33LhFe2iuxrZv
 YCeDMbRAASTRHe+XkZ0yICVxXBcKtl777mDIpdQhxMv1UJY4W45VvW+QOj/ZpSY1zZey
 S4nw==
X-Gm-Message-State: AOAM530vejnl70tc11irj+VfPhP3PwRhCzkPP7kyfbpnc7j6RhdcPpyo
 zcSBSohk4Myfcuj5DZrXGosT/e1ayCOBpS3dbd0=
X-Google-Smtp-Source: ABdhPJxHwM8sepKayotb6PChMJR3vWA3Io2TkB2wSXwM8vvNgG8vXimfX/UZhqNoTXWbQzDvbLwLV0hKTqoZIRKtI14=
X-Received: by 2002:a17:906:46d0:: with SMTP id
 k16mr7349366ejs.76.1593280281506; 
 Sat, 27 Jun 2020 10:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <1592995531-32600-1-git-send-email-chenhc@lemote.com>
 <1592995531-32600-2-git-send-email-chenhc@lemote.com>
In-Reply-To: <1592995531-32600-2-git-send-email-chenhc@lemote.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Sat, 27 Jun 2020 19:51:10 +0200
Message-ID: <CAL1e-=givB0ZSBa4w32WpjAveOC+WVcsUEpzM-VU_2dmop3H=A@mail.gmail.com>
Subject: Re: [PATCH V6 1/4] hw/mips: Implement the kvm_type() hook in
 MachineClass
To: Huacai Chen <zltjiangshi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=aleksandar.m.mail@gmail.com; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 24, 2020 at 12:44 PM Huacai Chen <zltjiangshi@gmail.com> wrote:
>
> MIPS has two types of KVM: TE & VZ, and TE is the default type. Now we
> can't create a VZ guest in QEMU because it lacks the kvm_type() hook in
> MachineClass. This patch add the the kvm_type() hook to support both of
> the two types.
>
> Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---

Applied to MIPS queue, with some minor changes.

>  target/mips/kvm.c      | 20 ++++++++++++++++++++
>  target/mips/kvm_mips.h | 11 +++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/target/mips/kvm.c b/target/mips/kvm.c
> index 96cfa10..373f582 100644
> --- a/target/mips/kvm.c
> +++ b/target/mips/kvm.c
> @@ -21,10 +21,12 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/timer.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/kvm_int.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/cpus.h"
>  #include "kvm_mips.h"
>  #include "exec/memattrs.h"
> +#include "hw/boards.h"
>
>  #define DEBUG_KVM 0
>
> @@ -1270,3 +1272,21 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
>  {
>      abort();
>  }
> +
> +int mips_kvm_type(MachineState *machine, const char *vm_type)
> +{
> +    int r;
> +    KVMState *s = KVM_STATE(machine->accelerator);
> +
> +    r = kvm_check_extension(s, KVM_CAP_MIPS_VZ);
> +    if (r > 0) {
> +        return KVM_VM_MIPS_VZ;
> +    }
> +
> +    r = kvm_check_extension(s, KVM_CAP_MIPS_TE);
> +    if (r > 0) {
> +        return KVM_VM_MIPS_TE;
> +    }
> +
> +    return -1;
> +}
> diff --git a/target/mips/kvm_mips.h b/target/mips/kvm_mips.h
> index 1e40147..171d53d 100644
> --- a/target/mips/kvm_mips.h
> +++ b/target/mips/kvm_mips.h
> @@ -12,6 +12,8 @@
>  #ifndef KVM_MIPS_H
>  #define KVM_MIPS_H
>
> +#include "cpu.h"
> +
>  /**
>   * kvm_mips_reset_vcpu:
>   * @cpu: MIPSCPU
> @@ -23,4 +25,13 @@ void kvm_mips_reset_vcpu(MIPSCPU *cpu);
>  int kvm_mips_set_interrupt(MIPSCPU *cpu, int irq, int level);
>  int kvm_mips_set_ipi_interrupt(MIPSCPU *cpu, int irq, int level);
>
> +#ifdef CONFIG_KVM
> +int mips_kvm_type(MachineState *machine, const char *vm_type);
> +#else
> +static inline int mips_kvm_type(MachineState *machine, const char *vm_type)
> +{
> +    return 0;
> +}
> +#endif
> +
>  #endif /* KVM_MIPS_H */
> --
> 2.7.0
>
>

