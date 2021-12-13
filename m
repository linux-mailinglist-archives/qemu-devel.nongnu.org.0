Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA427471FE2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 05:16:42 +0100 (CET)
Received: from localhost ([::1]:47862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwclV-0005mm-J5
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 23:16:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwckL-0004u5-9e
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 23:15:29 -0500
Received: from [2a00:1450:4864:20::42f] (port=44590
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mwckJ-0002cS-6r
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 23:15:29 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t18so24813481wrg.11
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 20:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hQuNNiV36mSAjdx2A+UDnj7IsJtVFFXiaU04Zk+mx+E=;
 b=aAJCn2VYvrJO3L1q1FQFa2YE3Ji4AgEAr++5j5JSEWn4z31W0lNbFNEdugdo8/HQFN
 QwaiLEhrrdopD8g9RUhrZ6q+aGrEWP4nQbOFHkZl1kvJomRkxf2vW/6eEfqNWs7m13va
 B/9wanYfbipg+zo1KecnjKRki2pgIFj9qtsDm7q/sjEs1rR+JNO6qJvA+U+8DWrXAFsS
 X8e0e0JoaAhBqKMwRLSndwRLcrdGWJvE7bq5o0fBUH1QL13y/NAY9GXkwOWKMe1mO0+l
 tL3ApUPbMU66pN8FUalPoIwI2Nu7RfBrTPR6P3mUMEK+oqO3Hxh9DORia78fF27C2vnO
 bumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hQuNNiV36mSAjdx2A+UDnj7IsJtVFFXiaU04Zk+mx+E=;
 b=wHIq3P4DKNY2xMIrFg8cl9DFVNuFzqAq70zhH/PQXdPNTscc/fHSLGGmtpx49p3TUJ
 8VfjCMouoxqa1rc5ClUlBp67h0tlD2ev84DU85XqenzwKUx9xMCneMxY0e6L5IjHBEnL
 VLnVa72kIIEwym1q8sD0P83EZscpQaSr1k6SHHtA29w8mH9w+Z5gCMlYlDhEAz6EAHbI
 zQwtenjrwAsmEH2Gw/8AVSFMj3RO3F3DjckUX+O6R4NDPUtbWhz6sMLxXhTFL7M1s3Sp
 FLeF7HS1hoFKjZ6mh2t2oU/kn1WoWSJriFG/LLCJeOtg7T0sO2D/5szS1kYREtHMYVea
 Y41g==
X-Gm-Message-State: AOAM531i1k/czZZ8VB3cnXKU19Y/E7wDFWGKQ/8LWeaRGQ9X9hyufskU
 R0JRu2EXgypvKuRpGYh1CxtqGI+z7uMtsrVU4aeL0Q==
X-Google-Smtp-Source: ABdhPJzsEO0NbXWE7QXUW9Ts0TN3/8EV4LxFUxaBHg8aNp0CX9LcsDcD85gipYZvAa6eRtBVN7Col3rHPtQcrxKMluI=
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr29797466wrd.346.1639368924975; 
 Sun, 12 Dec 2021 20:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-4-jiangyifei@huawei.com>
In-Reply-To: <20211210100732.1080-4-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 09:45:12 +0530
Message-ID: <CAAhSdy12sRcAarGN0z4HNDYrWPoJ+H6_HjXzc=2+ohdDvzeg5A@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] target/riscv: Implement function
 kvm_arch_init_vcpu
To: Yifei Jiang <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42f;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42f.google.com
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
> Get isa info from kvm while kvm init.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  target/riscv/kvm.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 687dd4b621..ccf3753048 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -38,6 +38,23 @@
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>
> +static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
> +{
> +    uint64_t id = KVM_REG_RISCV | type | idx;
> +
> +    switch (riscv_cpu_mxl(env)) {
> +    case MXL_RV32:
> +        id |= KVM_REG_SIZE_U32;
> +        break;
> +    case MXL_RV64:
> +        id |= KVM_REG_SIZE_U64;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    return id;
> +}
> +
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
>  };
> @@ -79,7 +96,20 @@ void kvm_arch_init_irq_routing(KVMState *s)
>
>  int kvm_arch_init_vcpu(CPUState *cs)
>  {
> -    return 0;
> +    int ret = 0;
> +    target_ulong isa;
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    uint64_t id;
> +
> +    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_REG(isa));
> +    ret = kvm_get_one_reg(cs, id, &isa);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->misa_ext = isa;
> +
> +    return ret;
>  }
>
>  int kvm_arch_msi_data_to_gsi(uint32_t data)
> --
> 2.19.1
>

