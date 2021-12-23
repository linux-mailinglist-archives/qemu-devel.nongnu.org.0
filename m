Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC12847DEF7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 07:14:57 +0100 (CET)
Received: from localhost ([::1]:39212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0HNQ-0006Pl-PC
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 01:14:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n0HFO-0001b0-6Q
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 01:06:40 -0500
Received: from [2a00:1450:4864:20::330] (port=45893
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n0HFL-0003SU-DB
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 01:06:37 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so2656799wme.4
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 22:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lIDWMXVYjagUikqY8QLUz6S+mofwYNJD/geltT+qmeA=;
 b=f8c9RZdF2MGLPY8z8x2QdEW7TeIwEYNq3QLxPYytxiNiaV6glUR0LkW4OpAgQB7ggQ
 Hp5KebmyG3B915AROpjEGGIUhTtoTViPLWKhWyjAVdO7qkC7gScltGCbwQW8USJsrTUl
 sJNqP2j7Je9KObcATN/LcACCDfLRQgzM959YVG8FLwVEAq2RfjcoEvCPc+ptBZYpb3f/
 BalSxzbXxmNRYDAzpvKMaJ6ApNicyMsnNG2irAF0RXSYjaDFqKSuANAsH49KxydHZqMJ
 ydW2f1RwwjLVr6AHozwGrn6tlcwJioZcUdmBF5rT2twhjqbtE4J9/3oLMdoMw6eNrWbH
 5NbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lIDWMXVYjagUikqY8QLUz6S+mofwYNJD/geltT+qmeA=;
 b=zr19ONh/fjBry9kr4qllACPxI3ROEefDlWIzhzmgIEitxnOGUSvBJJAcZhMOr6ZPPi
 NRH7/MbIt0zyZxnmyuTG3P7p/0l2Dh5mycMupkPjFw24hunG8xvdYFc+S2ajvx/gr8XZ
 U2BXYl11Iw7oZ1rFpjGtFCvf4C+T6O1Yjg30/k6ek4RgNgNYg+inta++N23i1iuDUd4f
 7gz0EynCquVZrzcUl88KeS1kQj1Bo/BsqkYAv/rxRb9BlLhxFqhIys1ay9M3z+TbCE4K
 xSUnhI0dRmlxn4utUy/12Ybmh+exaboOpj7t43dfsnepJTfG0fqn5uzoTOi6+17B16fI
 1Lkw==
X-Gm-Message-State: AOAM532+44qwf1n3RZw7eRzTLobzhb4YDyCpCCQNCJ/U3SlqD4z7mo7F
 Zxx8z8MLnFEFzHVfmMnPKd+UNsE7Se1NrlJW9HWIstKPy9k=
X-Google-Smtp-Source: ABdhPJy8287dzKlpQv4wyG7RfB3z4+sRrSFiyj3eP1TRgOS/u7nt+xVe+PhV2vV4g/fhUdPcNHArgJKqAEsgTB3mpwA=
X-Received: by 2002:a05:600c:1da5:: with SMTP id
 p37mr643254wms.59.1640239593920; 
 Wed, 22 Dec 2021 22:06:33 -0800 (PST)
MIME-Version: 1.0
References: <20211220130919.413-1-jiangyifei@huawei.com>
 <20211220130919.413-11-jiangyifei@huawei.com>
In-Reply-To: <20211220130919.413-11-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Dec 2021 11:36:22 +0530
Message-ID: <CAAhSdy3Sod2=M5jhbevbyq9=OzQR5-MNL9bqMMkKUatA3MMJew@mail.gmail.com>
Subject: Re: [PATCH v3 10/12] target/riscv: Add kvm_riscv_get/put_regs_timer
To: Yifei Jiang <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::330;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x330.google.com
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
> Add kvm_riscv_get/put_regs_timer to synchronize virtual time context
> from KVM.
>
> To set register of RISCV_TIMER_REG(state) will occur a error from KVM
> on kvm_timer_state == 0. It's better to adapt in KVM, but it doesn't matter
> that adaping in QEMU.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  target/riscv/cpu.h |  7 +++++
>  target/riscv/kvm.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 79 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e7dba35acb..c892a2c8b7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -259,6 +259,13 @@ struct CPURISCVState {
>
>      hwaddr kernel_addr;
>      hwaddr fdt_addr;
> +
> +    /* kvm timer */
> +    bool kvm_timer_dirty;
> +    uint64_t kvm_timer_time;
> +    uint64_t kvm_timer_compare;
> +    uint64_t kvm_timer_state;
> +    uint64_t kvm_timer_frequency;
>  };
>
>  OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 4d08669c81..3c20ec5ad3 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -41,6 +41,7 @@
>  #include "sbi_ecall_interface.h"
>  #include "chardev/char-fe.h"
>  #include "semihosting/console.h"
> +#include "migration/migration.h"
>
>  static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
>  {
> @@ -65,6 +66,9 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
>  #define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CSR, \
>                   KVM_REG_RISCV_CSR_REG(name))
>
> +#define RISCV_TIMER_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_TIMER, \
> +                 KVM_REG_RISCV_TIMER_REG(name))
> +
>  #define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_F, idx)
>
>  #define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_D, idx)
> @@ -85,6 +89,22 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
>          } \
>      } while(0)
>
> +#define KVM_RISCV_GET_TIMER(cs, env, name, reg) \
> +    do { \
> +        int ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, name), &reg); \
> +        if (ret) { \
> +            abort(); \
> +        } \
> +    } while(0)
> +
> +#define KVM_RISCV_SET_TIMER(cs, env, name, reg) \
> +    do { \
> +        int ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, time), &reg); \
> +        if (ret) { \
> +            abort(); \
> +        } \
> +    } while (0)
> +
>  static int kvm_riscv_get_regs_core(CPUState *cs)
>  {
>      int ret = 0;
> @@ -236,6 +256,58 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
>      return ret;
>  }
>
> +static void kvm_riscv_get_regs_timer(CPUState *cs)
> +{
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    if (env->kvm_timer_dirty) {
> +        return;
> +    }
> +
> +    KVM_RISCV_GET_TIMER(cs, env, time, env->kvm_timer_time);
> +    KVM_RISCV_GET_TIMER(cs, env, compare, env->kvm_timer_compare);
> +    KVM_RISCV_GET_TIMER(cs, env, state, env->kvm_timer_state);
> +    KVM_RISCV_GET_TIMER(cs, env, frequency, env->kvm_timer_frequency);
> +
> +    env->kvm_timer_dirty = true;
> +}
> +
> +static void kvm_riscv_put_regs_timer(CPUState *cs)
> +{
> +    uint64_t reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    if (!env->kvm_timer_dirty) {
> +        return;
> +    }
> +
> +    KVM_RISCV_SET_TIMER(cs, env, time, env->kvm_timer_time);
> +    KVM_RISCV_SET_TIMER(cs, env, compare, env->kvm_timer_compare);
> +
> +    /*
> +     * To set register of RISCV_TIMER_REG(state) will occur a error from KVM
> +     * on env->kvm_timer_state == 0, It's better to adapt in KVM, but it
> +     * doesn't matter that adaping in QEMU now.
> +     * TODO If KVM changes, adapt here.
> +     */
> +    if (env->kvm_timer_state) {
> +        KVM_RISCV_SET_TIMER(cs, env, state, env->kvm_timer_state);
> +    }
> +
> +    /*
> +     * For now, migration will not work between Hosts with different timer
> +     * frequency. Therefore, we should check whether they are the same here
> +     * during the migration.
> +     */
> +    if (migration_is_running(migrate_get_current()->state)) {
> +        KVM_RISCV_GET_TIMER(cs, env, frequency, reg);
> +        if (reg != env->kvm_timer_frequency) {
> +            error_report("Dst Hosts timer frequency != Src Hosts");
> +        }
> +    }
> +
> +    env->kvm_timer_dirty = false;
> +}
>
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
> --
> 2.19.1
>

