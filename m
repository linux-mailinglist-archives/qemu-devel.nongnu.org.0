Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A746759079F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 22:59:06 +0200 (CEST)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMFGj-00010c-6Q
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 16:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMFEV-0007nn-Ey
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 16:56:47 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <furquan@rivosinc.com>)
 id 1oMFET-0007ec-JD
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 16:56:47 -0400
Received: by mail-pf1-x431.google.com with SMTP id k14so15454487pfh.0
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 13:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=4kQ8SClVRPi6gG4NE9lmhAaoU1UWuHouWCJez7bhymU=;
 b=ubO0m69GjwZPxBoNl7IEdbzw6jp7ng1kEotzRDJsTNS4Xti+yCHx2ndD5mAqXwt2iC
 qTaINMtw4Mf412M17/PuOfNqUQUVdcLPm7la9HoD3Zy7yy03IVVc7Z8izYh5Rj/R46gN
 Mrg8copB32+Eb6ERKVunnMWAzhSe5a1hC1zfuxK5JyanUeCgh6GrpzNpszoXHBputEfW
 x1ocZU3HjLZvWe3LGHI2SpZNgvLIftMbRJvLxtxWNEoFDc1G6COqnJ+1r43QupFfpo2q
 fTVQB9nmDaBUPv8wXyQuhd6uMbkpJA2xj5CXx+lOENR+rH/j8t97snYKPROUYN36yxUI
 qKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=4kQ8SClVRPi6gG4NE9lmhAaoU1UWuHouWCJez7bhymU=;
 b=6KwpzV4L9NHf9663VPbk1+ObyHXK1E5MBGeqY0nIkUGRN/aQ4+NkooVOAa/IPBaGOl
 kLTmKFnj9FOZoqC/FDzBrKc8fPDcsvBxAZ6Fi3fdaL59f8yDy9Up2L1REyNpP+977E+w
 ftJ6P4105UWifbHlkY2rgSKeSMxVyuYOd3sBS3y2pPBdEp1yh/7fft1liczXO3mNPd2x
 oQ5irEAngPLOCvfPF1ttOpNGjCJxQjiLIhCwaXbmS6rBpCAL4WNXi4RKcMcV9QuWKaP+
 cxE3HBxvClsTaHcahzPBeOdNT3k4N3FExq8bcVtdKcOGqzE3GhvwRUWiM6uODizXn0A1
 9fEQ==
X-Gm-Message-State: ACgBeo3hYETZCRNvOiZxCOtsmU0RHmu0mA0QMvHA0xeGW5uIZT08mRmJ
 +0uXOp5hRn3b9SS4OYq7D4dqBYu7Fer90xVHur7V1g==
X-Google-Smtp-Source: AA6agR6LA7IzVyqwmxyoQW8cTd3AtUOYijDKg9KS779FKuG92dJY887Q7w7qSRtJe+iQX+ZaipTJpu2A17rSLtTTGB8=
X-Received: by 2002:a63:4004:0:b0:41b:64ff:7fe2 with SMTP id
 n4-20020a634004000000b0041b64ff7fe2mr617025pga.172.1660251403739; Thu, 11 Aug
 2022 13:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
In-Reply-To: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
From: Furquan Shaikh <furquan@rivosinc.com>
Date: Thu, 11 Aug 2022 13:56:33 -0700
Message-ID: <CA+tJHD6ka-Nh8H6aMBzTsPBb26XA4M5Jki5E=YRXkOxwpkXiuw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=furquan@rivosinc.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry for the top-posting. I noticed that the patch appears really
weird in patchwork [1] where part of the diff is above the PATCH
section. It looks fine in the archives[2] though.

[1] https://patchwork.ozlabs.org/project/qemu-devel/patch/CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com/
[2] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01905.html

On Thu, Aug 11, 2022 at 1:41 PM Furquan Shaikh <furquan@rivosinc.com> wrote:
>
> Unlike ARM, RISC-V does not define a separate breakpoint type for
> semihosting. Instead, it is entirely ABI. Thus, we need an option
> to allow users to configure what the ebreak behavior should be for
> different privilege levels - M, S, U, VS, VU. As per the RISC-V
> privilege specification[1], ebreak traps into the execution
> environment. However, RISC-V debug specification[2] provides
> ebreak{m,s,u,vs,vu} configuration bits to allow ebreak behavior to
> be configured to trap into debug mode instead. This change adds
> settable properties for RISC-V CPUs - `ebreakm`, `ebreaks`, `ebreaku`,
> `ebreakvs` and `ebreakvu` to allow user to configure whether qemu
> should treat ebreak as semihosting traps or trap according to the
> privilege specification.
>
> [1] https://github.com/riscv/riscv-isa-manual/releases/download/draft-20220723-10eea63/riscv-privileged.pdf
> [2] https://github.com/riscv/riscv-debug-spec/blob/release/riscv-debug-release.pdf
>
> Signed-off-by: Furquan Shaikh <furquan@rivosinc.com>
> ---
>  target/riscv/cpu.c        |  8 ++++++++
>  target/riscv/cpu.h        |  7 +++++++
>  target/riscv/cpu_helper.c | 26 +++++++++++++++++++++++++-
>  3 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac6f82ebd0..082194652b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -953,6 +953,14 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("short-isa-string", RISCVCPU,
> cfg.short_isa_string, false),
>
>      DEFINE_PROP_BOOL("rvv_ta_all_1s", RISCVCPU, cfg.rvv_ta_all_1s, false),
> +
> +    /* Debug spec */
> +    DEFINE_PROP_BOOL("ebreakm", RISCVCPU, cfg.ebreakm, true),
> +    DEFINE_PROP_BOOL("ebreaks", RISCVCPU, cfg.ebreaks, false),
> +    DEFINE_PROP_BOOL("ebreaku", RISCVCPU, cfg.ebreaku, false),
> +    DEFINE_PROP_BOOL("ebreakvs", RISCVCPU, cfg.ebreakvs, false),
> +    DEFINE_PROP_BOOL("ebreakvu", RISCVCPU, cfg.ebreakvu, false),
> +
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5c7acc055a..eee8e487a6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -454,6 +454,13 @@ struct RISCVCPUConfig {
>      bool epmp;
>      bool aia;
>      bool debug;
> +
> +    /* Debug spec */
> +    bool ebreakm;
> +    bool ebreaks;
> +    bool ebreaku;
> +    bool ebreakvs;
> +    bool ebreakvu;
>      uint64_t resetvec;
>
>      bool short_isa_string;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 59b3680b1b..be09abbe27 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1314,6 +1314,30 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr
> address, int size,
>
>      return true;
>  }
> +
> +static bool semihosting_enabled(RISCVCPU *cpu)
> +{
> +    CPURISCVState *env = &cpu->env;
> +
> +    switch (env->priv) {
> +    case PRV_M:
> +        return cpu->cfg.ebreakm;
> +    case PRV_S:
> +        if (riscv_cpu_virt_enabled(env)) {
> +            return cpu->cfg.ebreakvs;
> +        } else {
> +            return cpu->cfg.ebreaks;
> +        }
> +    case PRV_U:
> +        if (riscv_cpu_virt_enabled(env)) {
> +            return cpu->cfg.ebreakvu;
> +        } else {
> +            return cpu->cfg.ebreaku;
> +        }
> +    }
> +
> +    return false;
> +}
>  #endif /* !CONFIG_USER_ONLY */
>
>  /*
> @@ -1342,7 +1366,7 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>      target_ulong mtval2 = 0;
>
>      if  (cause == RISCV_EXCP_SEMIHOST) {
> -        if (env->priv >= PRV_S) {
> +        if (semihosting_enabled(cpu)) {
>              do_common_semihosting(cs);
>              env->pc += 4;
>              return;
> --
> 2.34.1

