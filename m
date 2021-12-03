Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218D746715A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 06:10:45 +0100 (CET)
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt0qK-0007Hw-8b
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 00:10:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt0ok-0006Gj-V4
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 00:09:06 -0500
Received: from [2a00:1450:4864:20::32d] (port=33574
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt0oj-00015W-6q
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 00:09:06 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso3818380wmh.0
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 21:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MvpxU/zQgmVYk8jRqwwlAfgA2DGPBBA6ycytwfg8N1I=;
 b=yUaFY+XkamNidvrqtpCeifrVdN5izEHR53kkFATjIn8mX9uNlLYIkwoH1ukHrO/DFJ
 Nuzvr7x0gY0E6rUerCR5IOJUhKAkjGIOE+jYBChcegUho+mIPH4BQKzafxc2f6QE3w1q
 fYEX1lyCFc8V0PkJW4Fh5iloNMZ8qROSBnDydKI67QNL1TBGvYqx2uKubj7Fm2O+YsBH
 efpCcs0/NPGB/KmEehAAwLKHYub1m0PQ3EvWwXFqSkKtKpsyMf0az868t9IErCPjmNwa
 cIcnV/zHwsPI0ruxF+51c26pZTyFJnCUjyZPUlNeyyz3cTLrkzaJQzeWGuEoVN4Sds7V
 tCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MvpxU/zQgmVYk8jRqwwlAfgA2DGPBBA6ycytwfg8N1I=;
 b=fwYqW3XwStqh1poTAU3kPtbiUz6Nd9c55FO5fT+gHmZs4+f6HtQKReWzCI3/MQpnl/
 OXdeoLaeqq9DD8Esomz0GQ8nGRGcjhNihlQEEDJmyIy+WelNKl4tskvo/2OjZzibdUTq
 WaMBtfjRdXI/Vl3mXd5018AKL40DvWrLHy/TKxnKmRlMoMylqEUPh+zFI3ntCEN7GoU/
 s68dnxUX2jEg2EPiqdNm9xxf4fxTr4ty1CQXliaLYaRr4RSsCqvsEVv025YxJnzpmQnj
 EazJ8mI+Pb4ZICsttQLtrNn85KzUTPtb2X+TLXqLUR0EVqiP5f7rRCSeCC8dRosROmfx
 MldQ==
X-Gm-Message-State: AOAM531pn2ds6QMmrz9qxAKYdKXddGSv+4F6zxlpwq2ZB4k9+KrpAoS+
 Fncsy0XQLjO7ts07h5gFeRZnMNyNgesymjmJx7iZew==
X-Google-Smtp-Source: ABdhPJx0KrVLLCYNaSL9ehBnr/VTigADR+Z3z+3pOLuXixW2HUYdUfDlqoy+DAox+u3hvsnJ95XJ+Xys9loPA6x63Pg=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr12506581wmi.61.1638508143606; 
 Thu, 02 Dec 2021 21:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-3-jiangyifei@huawei.com>
In-Reply-To: <20211120074644.729-3-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 10:38:51 +0530
Message-ID: <CAAhSdy27SRFxGU-vs-1SXZ8bw6-G+73XThHJkP66MB+zY4TrQg@mail.gmail.com>
Subject: Re: [PATCH v1 02/12] target/riscv: Add target/riscv/kvm.c to place
 the public kvm interface
To: Yifei Jiang <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32d;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32d.google.com
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
> Add target/riscv/kvm.c to place kvm_arch_* function needed by
> kvm/kvm-all.c. Meanwhile, add kvm support in meson.build file.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  meson.build              |   2 +
>  target/riscv/kvm.c       | 133 +++++++++++++++++++++++++++++++++++++++
>  target/riscv/meson.build |   1 +
>  3 files changed, 136 insertions(+)
>  create mode 100644 target/riscv/kvm.c
>
> diff --git a/meson.build b/meson.build
> index 96de1a6ef9..ae35e76ea4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -77,6 +77,8 @@ elif cpu in ['ppc', 'ppc64']
>    kvm_targets = ['ppc-softmmu', 'ppc64-softmmu']
>  elif cpu in ['mips', 'mips64']
>    kvm_targets = ['mips-softmmu', 'mipsel-softmmu', 'mips64-softmmu', 'mips64el-softmmu']
> +elif cpu in ['riscv']
> +  kvm_targets = ['riscv32-softmmu', 'riscv64-softmmu']
>  else
>    kvm_targets = []
>  endif
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> new file mode 100644
> index 0000000000..687dd4b621
> --- /dev/null
> +++ b/target/riscv/kvm.c
> @@ -0,0 +1,133 @@
> +/*
> + * RISC-V implementation of KVM hooks
> + *
> + * Copyright (c) 2020 Huawei Technologies Co., Ltd
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include <sys/ioctl.h>
> +
> +#include <linux/kvm.h>
> +
> +#include "qemu-common.h"
> +#include "qemu/timer.h"
> +#include "qemu/error-report.h"
> +#include "qemu/main-loop.h"
> +#include "sysemu/sysemu.h"
> +#include "sysemu/kvm.h"
> +#include "sysemu/kvm_int.h"
> +#include "cpu.h"
> +#include "trace.h"
> +#include "hw/pci/pci.h"
> +#include "exec/memattrs.h"
> +#include "exec/address-spaces.h"
> +#include "hw/boards.h"
> +#include "hw/irq.h"
> +#include "qemu/log.h"
> +#include "hw/loader.h"
> +
> +const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
> +    KVM_CAP_LAST_INFO
> +};
> +
> +int kvm_arch_get_registers(CPUState *cs)
> +{
> +    return 0;
> +}
> +
> +int kvm_arch_put_registers(CPUState *cs, int level)
> +{
> +    return 0;
> +}
> +
> +int kvm_arch_release_virq_post(int virq)
> +{
> +    return 0;
> +}
> +
> +int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
> +                             uint64_t address, uint32_t data, PCIDevice *dev)
> +{
> +    return 0;
> +}
> +
> +int kvm_arch_destroy_vcpu(CPUState *cs)
> +{
> +    return 0;
> +}
> +
> +unsigned long kvm_arch_vcpu_id(CPUState *cpu)
> +{
> +    return cpu->cpu_index;
> +}
> +
> +void kvm_arch_init_irq_routing(KVMState *s)
> +{
> +}
> +
> +int kvm_arch_init_vcpu(CPUState *cs)
> +{
> +    return 0;
> +}
> +
> +int kvm_arch_msi_data_to_gsi(uint32_t data)
> +{
> +    abort();
> +}
> +
> +int kvm_arch_add_msi_route_post(struct kvm_irq_routing_entry *route,
> +                                int vector, PCIDevice *dev)
> +{
> +    return 0;
> +}
> +
> +int kvm_arch_init(MachineState *ms, KVMState *s)
> +{
> +    return 0;
> +}
> +
> +int kvm_arch_irqchip_create(KVMState *s)
> +{
> +    return 0;
> +}
> +
> +int kvm_arch_process_async_events(CPUState *cs)
> +{
> +    return 0;
> +}
> +
> +void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
> +{
> +}
> +
> +MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
> +{
> +    return MEMTXATTRS_UNSPECIFIED;
> +}
> +
> +bool kvm_arch_stop_on_emulation_error(CPUState *cs)
> +{
> +    return true;
> +}
> +
> +int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
> +{
> +    return 0;
> +}
> +
> +bool kvm_arch_cpu_check_are_resettable(void)
> +{
> +    return true;
> +}
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index d5e0bc93ea..2faf08a941 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -19,6 +19,7 @@ riscv_ss.add(files(
>    'bitmanip_helper.c',
>    'translate.c',
>  ))
> +riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
>
>  riscv_softmmu_ss = ss.source_set()
>  riscv_softmmu_ss.add(files(
> --
> 2.19.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

