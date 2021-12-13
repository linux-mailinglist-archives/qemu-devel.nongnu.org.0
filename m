Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8766E471FE7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 05:18:53 +0100 (CET)
Received: from localhost ([::1]:52568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwcnc-0000Vs-MV
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 23:18:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwcm7-0007W3-TI
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 23:17:19 -0500
Received: from [2a00:1450:4864:20::433] (port=43540
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwcm5-0003iZ-M5
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 23:17:19 -0500
Received: by mail-wr1-x433.google.com with SMTP id v11so24839867wrw.10
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 20:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BRcF4DfHIqBKfleTCwMXo7Eh2GKC1UVAwKmaROY7m7I=;
 b=gOf7znJnRp/h5O2fztIccS4KoXxriuRkiThU1N8MYSoL9PI/1oviF7q4UD265sEyMF
 eugDNLz6uXb28nQoKehYeaJgFE1nZred9DCYhsRDsUxKEEzrWWKirIOy6i3ZFOvvcSTz
 xkKZBAHuG0KAqSZy5jeNdvKwGF0HKouNX0TsDhiWTVTTRu5sVpAflcn/UOBMLJK4kXK8
 dguTLYt8sJeRsL2YCjkdhu3mrq595sYy7OGbxxuOJqM2MVMkap24c24az0daCH1Zl1UH
 UBR43OX312zJxpttPOJQYDo6OBCyLsZBJS/lXVPwoiaNukfnK2lzBDG7dmsLkE4QDGRF
 8mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRcF4DfHIqBKfleTCwMXo7Eh2GKC1UVAwKmaROY7m7I=;
 b=vR0usEenue5GJZGYKpveo3KXy45VVUKQR+9sNT/O92pKFv/IDcQ54dFEFd6hxiBHYK
 RXY3zB66lui9iFbtHXgnVskzV4bgH2pD7fqiRJ5VoLS5kLOC+pD7Z8af0UtqZFTWB/j7
 4yfuKQkUW0dkJGyVrJftQrXPOq4rhVHU/UdcmiHxMIj1EqZ+Px0v736NMEK7T749VZQ4
 /VYejvNzUsPg+kQ+LrXVmIsYhuYzDkZAgMkeHe5SgZgER/rDdHiHTSG9+PdgsUku2fKM
 ps4NXs3lTO9nPPMzbfpAXVID9oEUF7yHR1Sm11V2Hhxy9IqeRE+09eMmB3ETKUK6RNBM
 3fzg==
X-Gm-Message-State: AOAM530yv/gryvI80INcJ1e76vjBtYUpFZUu+qb1KHScONlFxhVhKvah
 hgf6dRNQNhhaVJHhzFVcA+vvwc0NRvMSWDjZXlR1FA==
X-Google-Smtp-Source: ABdhPJyrMlvAv+QC/NETimV1IGnrw4Sk4dxEyHVlUAtgjj2DIO55ZQ8nzuSGmUQRXlrveO21jWlOGUWxsL2jF/JGfVY=
X-Received: by 2002:adf:d082:: with SMTP id y2mr29944773wrh.214.1639369036422; 
 Sun, 12 Dec 2021 20:17:16 -0800 (PST)
MIME-Version: 1.0
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-6-jiangyifei@huawei.com>
In-Reply-To: <20211210100732.1080-6-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 09:47:04 +0530
Message-ID: <CAAhSdy04riukdShAHxT4i0gvV5-Zt6fXLzCGS-aPZCcpxBq43g@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] target/riscv: Implement kvm_arch_put_registers
To: Yifei Jiang <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::433;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x433.google.com
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

On Fri, Dec 10, 2021 at 3:37 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Put GPR CSR and FP registers to kvm by KVM_SET_ONE_REG ioctl
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  target/riscv/kvm.c | 104 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 103 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 6d4df0ef6d..e695b91dc7 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -73,6 +73,14 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
>          } \
>      } while(0)
>
> +#define KVM_RISCV_SET_CSR(cs, env, csr, reg) \
> +    do { \
> +        int ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
> +        if (ret) { \
> +            return ret; \
> +        } \
> +    } while(0)
> +
>  static int kvm_riscv_get_regs_core(CPUState *cs)
>  {
>      int ret = 0;
> @@ -98,6 +106,31 @@ static int kvm_riscv_get_regs_core(CPUState *cs)
>      return ret;
>  }
>
> +static int kvm_riscv_put_regs_core(CPUState *cs)
> +{
> +    int ret = 0;
> +    int i;
> +    target_ulong reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    reg = env->pc;
> +    ret = kvm_set_one_reg(cs, RISCV_CORE_REG(env, regs.pc), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    for (i = 1; i < 32; i++) {
> +        uint64_t id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CORE, i);
> +        reg = env->gpr[i];
> +        ret = kvm_set_one_reg(cs, id, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
>  static int kvm_riscv_get_regs_csr(CPUState *cs)
>  {
>      int ret = 0;
> @@ -115,6 +148,24 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
>      return ret;
>  }
>
> +static int kvm_riscv_put_regs_csr(CPUState *cs)
> +{
> +    int ret = 0;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
> +    KVM_RISCV_SET_CSR(cs, env, sie, env->mie);
> +    KVM_RISCV_SET_CSR(cs, env, stvec, env->stvec);
> +    KVM_RISCV_SET_CSR(cs, env, sscratch, env->sscratch);
> +    KVM_RISCV_SET_CSR(cs, env, sepc, env->sepc);
> +    KVM_RISCV_SET_CSR(cs, env, scause, env->scause);
> +    KVM_RISCV_SET_CSR(cs, env, stval, env->stval);
> +    KVM_RISCV_SET_CSR(cs, env, sip, env->mip);
> +    KVM_RISCV_SET_CSR(cs, env, satp, env->satp);
> +
> +    return ret;
> +}
> +
>  static int kvm_riscv_get_regs_fp(CPUState *cs)
>  {
>      int ret = 0;
> @@ -148,6 +199,40 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
>      return ret;
>  }
>
> +static int kvm_riscv_put_regs_fp(CPUState *cs)
> +{
> +    int ret = 0;
> +    int i;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    if (riscv_has_ext(env, RVD)) {
> +        uint64_t reg;
> +        for (i = 0; i < 32; i++) {
> +            reg = env->fpr[i];
> +            ret = kvm_set_one_reg(cs, RISCV_FP_D_REG(env, i), &reg);
> +            if (ret) {
> +                return ret;
> +            }
> +        }
> +        return ret;
> +    }
> +
> +    if (riscv_has_ext(env, RVF)) {
> +        uint32_t reg;
> +        for (i = 0; i < 32; i++) {
> +            reg = env->fpr[i];
> +            ret = kvm_set_one_reg(cs, RISCV_FP_F_REG(env, i), &reg);
> +            if (ret) {
> +                return ret;
> +            }
> +        }
> +        return ret;
> +    }
> +
> +    return ret;
> +}
> +
> +
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
>  };
> @@ -176,7 +261,24 @@ int kvm_arch_get_registers(CPUState *cs)
>
>  int kvm_arch_put_registers(CPUState *cs, int level)
>  {
> -    return 0;
> +    int ret = 0;
> +
> +    ret = kvm_riscv_put_regs_core(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ret = kvm_riscv_put_regs_csr(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ret = kvm_riscv_put_regs_fp(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return ret;
>  }
>
>  int kvm_arch_release_virq_post(int virq)
> --
> 2.19.1
>

