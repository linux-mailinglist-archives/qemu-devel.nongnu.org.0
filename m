Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F28F47DEF2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 07:12:36 +0100 (CET)
Received: from localhost ([::1]:36882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0HL9-0004i0-On
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 01:12:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n0HEQ-00013W-8h
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 01:05:38 -0500
Received: from [2a00:1450:4864:20::32e] (port=35584
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n0HEO-0003BV-Ka
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 01:05:37 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg2-20020a05600c3c8200b0034565c2be15so5075245wmb.0
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 22:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1XgeblNjyLRR0VJexdQ72YWUWRRoaoPGkJJML+2iIio=;
 b=2oS8G8wzk9dq8rZDZ5ZSer7XJ2oqA3CcpCnFYWtJMevQoz4ZztBfdqkuaMvYn5QGcP
 J2Bg9HPbWGzhtWmJUHZnsm3s3c7p9DSD7nELjVhb6qaNsTZxR0uzDYAxhzEXupovu6Gn
 mi0FjQQmiRhUd6LJMRn9HyRspMc3TXedNQpnGjr1GCtz8V8LmZzWmRIcFpOLIL4ZF7YW
 +7qxtnDKULC7pdiHSPMO3z99Ey5eJYSTeuDs5X+AIpc0TK6ILuGw2XvaqXS4QTQi1BLL
 vV7VmKlUtFkk6X7/0rp/2Rzmm+4naTO6UL8nAsZwbCkMy7j+iSyrBskPwP6ulWZa1Sjo
 kpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1XgeblNjyLRR0VJexdQ72YWUWRRoaoPGkJJML+2iIio=;
 b=wmZ18EJb1Uav9REl9tLCq0sbasUvDGOc0kS0WeW95lFBeDebOJAz4/k2u+5/PnweWH
 mYrv3Lo0/rJVGjt2aXn4ThXX4fIemBHbstojTEX1qoIOPSfKeEXcycBtLL5AAN92EL1p
 c0ckJINUyelP9Zw7HnvJgNvC7Rpv0hTQWVB9MGkYQktL4Vxonfye72SzDolnEIRxzQcQ
 00WlAnRy9UhQ4bvwT4J0FSpGQpusUKH+U54wtukbwjSZJNwkPaW8ji0R+jmj7mE0Rxzs
 WV7f3ZfC2R7kFlzEaaDJ+BFlZNm93rQIEp6phyUJFNvJEqrsExiIPTnKSWSULPbMpFNL
 X0aQ==
X-Gm-Message-State: AOAM532Ukxm5qEhLK1xdlfCwrs13iCyDoUtljWJtqiPmkkDGRXbgj5ab
 Jb66ARt1JsD5wSjI1IohJpq27gKmeJa7hb1QoTBOQA==
X-Google-Smtp-Source: ABdhPJyqcT8DUVax4HxTlJfCZ8O3g/CTsOX2tmncos53JiwJ4I7hLYtfwBD3A1vas8TtRWuZsnZA/e2ydv2coAFrwhs=
X-Received: by 2002:a7b:c0c1:: with SMTP id s1mr617063wmh.176.1640239535261;
 Wed, 22 Dec 2021 22:05:35 -0800 (PST)
MIME-Version: 1.0
References: <20211220130919.413-1-jiangyifei@huawei.com>
 <20211220130919.413-8-jiangyifei@huawei.com>
In-Reply-To: <20211220130919.413-8-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Dec 2021 11:35:23 +0530
Message-ID: <CAAhSdy1rsRKwwLu2n58U0Wk8FVG17c3md-gDVAipgEC1P=srSQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] target/riscv: Support setting external interrupt
 by KVM
To: Yifei Jiang <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32e;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

On Mon, Dec 20, 2021 at 6:39 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> When KVM is enabled, set the S-mode external interrupt through
> kvm_riscv_set_irq function.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  target/riscv/cpu.c       |  6 +++++-
>  target/riscv/kvm-stub.c  |  5 +++++
>  target/riscv/kvm.c       | 17 +++++++++++++++++
>  target/riscv/kvm_riscv.h |  1 +
>  4 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1c944872a3..3fc3a9c45b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -603,7 +603,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
>      case IRQ_S_EXT:
>      case IRQ_VS_EXT:
>      case IRQ_M_EXT:
> -        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
> +        if (kvm_enabled()) {
> +            kvm_riscv_set_irq(cpu, irq, level);
> +        } else {
> +            riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
> +        }
>          break;
>      default:
>          g_assert_not_reached();
> diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm-stub.c
> index 39b96fe3f4..4e8fc31a21 100644
> --- a/target/riscv/kvm-stub.c
> +++ b/target/riscv/kvm-stub.c
> @@ -23,3 +23,8 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>  {
>      abort();
>  }
> +
> +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
> +{
> +    abort();
> +}
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index db6d8a5b6e..0027f11f45 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -383,6 +383,23 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
>      env->satp = 0;
>  }
>
> +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
> +{
> +    int ret;
> +    unsigned virq = level ? KVM_INTERRUPT_SET : KVM_INTERRUPT_UNSET;
> +
> +    if (irq != IRQ_S_EXT) {
> +        perror("kvm riscv set irq != IRQ_S_EXT\n");
> +        abort();
> +    }
> +
> +    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_INTERRUPT, &virq);
> +    if (ret < 0) {
> +        perror("Set irq failed");
> +        abort();
> +    }
> +}
> +
>  bool kvm_arch_cpu_check_are_resettable(void)
>  {
>      return true;
> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
> index f38c82bf59..ed281bdce0 100644
> --- a/target/riscv/kvm_riscv.h
> +++ b/target/riscv/kvm_riscv.h
> @@ -20,5 +20,6 @@
>  #define QEMU_KVM_RISCV_H
>
>  void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
> +void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
>
>  #endif
> --
> 2.19.1
>

