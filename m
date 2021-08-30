Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3AC3FB0CA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 07:25:52 +0200 (CEST)
Received: from localhost ([::1]:44064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKZnr-0005Tk-TH
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 01:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZmb-00041L-Qo
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:24:33 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:43578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKZmW-000776-Ay
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 01:24:33 -0400
Received: by mail-il1-x136.google.com with SMTP id v16so14720745ilo.10
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 22:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9suaLRMfwZAcV4BywmU6NOEyyn6iq2cxxHcw7xKxLxc=;
 b=bWh/mA2mCdaHIyZHMqXoei/nwnJjzCMxrA0mhDbDSORpbKga1Qp97IYFRzYZ2rgPe0
 HZLtUiXy/P8G6jAa52Z5cRsZ6O4N+5EcA6yojPO0wlyyiDRqvwle6hLXA+o73BlrL2NG
 0kMwKCZqdhzmGIHFvRastU4vxU8ceAA4VV3WJYWrLpY9blBxE2BHQ/lQ9aG2xDbml56W
 4tkEVSK4f2L+tn2qBAa/Mi+Z2/cCda9FFUE86aMhFvKPHtGs6dRluXBfQAGI694toBjz
 Wki5qJXdLLF4OMBnzRTAneCM194fVAG3zB6Y9+rPZGlgQtFO4OYp8ZP9CmE5FvNtA1Ez
 u0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9suaLRMfwZAcV4BywmU6NOEyyn6iq2cxxHcw7xKxLxc=;
 b=Gqg6g7uuK/XtB2nyeU3Mmk0Y39AdIR+MpkqZBSptMlhnhy4laRWgTvtifFtw/mgtE5
 qleUlAFDqmG4tWJXK6wJhcs7TLEAbQJi2nUryjCvuHHi29S231XD6zoT7q4kQ6yqwfqm
 x2ogwj0wChXxsLJQR0eD9LeSv95xplbjBJoKgoeDek5jmlYE7qJSLjPr6RkHDVEv9Uou
 Gxokm7yI7DacmSVTW3HTqpR07fDUyN5cGII8gG5I6ZWiWIgPxazhY2fpfhjT9WaX/7pR
 2grEO1sfgwOSMIP/2aFebPZ8K5DsMh/em+Qs7FnV2RT84dkDtOsMtvmvDIhkujfwRfBk
 3Ofw==
X-Gm-Message-State: AOAM533yPq44hBYg+nJG48QGqo3rB9/DRmBnIyQR/WFoPGjFv9dr/oBy
 rThki0Rckdjs4x1kGazei/Hr+JPH+jPycOsL/es=
X-Google-Smtp-Source: ABdhPJxa/NP3LW84DXXtBtzFOGKwPFIyKabyvtHNaraMcFSW2o8I+2ymHvvvcKP6rHakt8wXIO46yrRELkVO+8vQRrw=
X-Received: by 2002:a05:6e02:1044:: with SMTP id
 p4mr14761095ilj.227.1630301067346; 
 Sun, 29 Aug 2021 22:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
 <20210825165907.34026-14-philipp.tomsich@vrull.eu>
In-Reply-To: <20210825165907.34026-14-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Aug 2021 15:24:00 +1000
Message-ID: <CAKmqyKN_nTzmgPVvT_E+5jY1-qO0ukRwUP-T2-_8t=0k=ocBkw@mail.gmail.com>
Subject: Re: [PATCH v6 13/14] target/riscv: Remove RVB (replaced by Zb[abcs]
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 3:16 AM Philipp Tomsich
<philipp.tomsich@vrull.eu> wrote:
>
> With everything classified as Zb[abcs] and pre-0.93 draft-B
> instructions that are not part of Zb[abcs] removed, we can remove the
> remaining support code for RVB.
>
> Note that RVB has been retired for good and misa.B will neither mean
> 'some' or 'all of' Zb*:
>   https://lists.riscv.org/g/tech-bitmanip/message/532
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Removing RVB moved into a separate commit at the tail-end of the series.
>
>  target/riscv/cpu.c         | 27 ---------------------------
>  target/riscv/cpu.h         |  3 ---
>  target/riscv/insn32.decode |  4 ----
>  3 files changed, 34 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c7bc1f9f44..93bd8f7802 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -127,11 +127,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
>      env->priv_ver = priv_ver;
>  }
>
> -static void set_bext_version(CPURISCVState *env, int bext_ver)
> -{
> -    env->bext_ver = bext_ver;
> -}
> -
>  static void set_vext_version(CPURISCVState *env, int vext_ver)
>  {
>      env->vext_ver = vext_ver;
> @@ -393,7 +388,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      CPURISCVState *env = &cpu->env;
>      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>      int priv_version = PRIV_VERSION_1_11_0;
> -    int bext_version = BEXT_VERSION_0_93_0;
>      int vext_version = VEXT_VERSION_0_07_1;
>      target_ulong target_misa = env->misa;
>      Error *local_err = NULL;
> @@ -418,7 +412,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>      }
>
>      set_priv_version(env, priv_version);
> -    set_bext_version(env, bext_version);
>      set_vext_version(env, vext_version);
>
>      if (cpu->cfg.mmu) {
> @@ -496,24 +489,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          if (cpu->cfg.ext_h) {
>              target_misa |= RVH;
>          }
> -        if (cpu->cfg.ext_b) {
> -            target_misa |= RVB;
> -
> -            if (cpu->cfg.bext_spec) {
> -                if (!g_strcmp0(cpu->cfg.bext_spec, "v0.93")) {
> -                    bext_version = BEXT_VERSION_0_93_0;
> -                } else {
> -                    error_setg(errp,
> -                           "Unsupported bitmanip spec version '%s'",
> -                           cpu->cfg.bext_spec);
> -                    return;
> -                }
> -            } else {
> -                qemu_log("bitmanip version is not specified, "
> -                         "use the default value v0.93\n");
> -            }
> -            set_bext_version(env, bext_version);
> -        }
>          if (cpu->cfg.ext_v) {
>              target_misa |= RVV;
>              if (!is_power_of_2(cpu->cfg.vlen)) {
> @@ -584,7 +559,6 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      /* This is experimental so mark with 'x-' */
> -    DEFINE_PROP_BOOL("x-b", RISCVCPU, cfg.ext_b, false),
>      DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
>      DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
>      DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
> @@ -595,7 +569,6 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> -    DEFINE_PROP_STRING("bext_spec", RISCVCPU, cfg.bext_spec),
>      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7c4cd8ea89..77e8b06106 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -67,7 +67,6 @@
>  #define RVS RV('S')
>  #define RVU RV('U')
>  #define RVH RV('H')
> -#define RVB RV('B')
>
>  /* S extension denotes that Supervisor mode exists, however it is possible
>     to have a core that support S mode but does not have an MMU and there
> @@ -83,7 +82,6 @@ enum {
>  #define PRIV_VERSION_1_10_0 0x00011000
>  #define PRIV_VERSION_1_11_0 0x00011100
>
> -#define BEXT_VERSION_0_93_0 0x00009300
>  #define VEXT_VERSION_0_07_1 0x00000701
>
>  enum {
> @@ -288,7 +286,6 @@ struct RISCVCPU {
>          bool ext_f;
>          bool ext_d;
>          bool ext_c;
> -        bool ext_b;
>          bool ext_s;
>          bool ext_u;
>          bool ext_h;
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index abf794095a..0f6020ccb1 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -711,10 +711,6 @@ rorw       0110000 .......... 101 ..... 0111011 @r
>  # instruction, so we use different handler functions to differentiate.
>  zext_h_64  0000100 00000 ..... 100 ..... 0111011 @r2
>
> -# *** RV32B Standard Extension ***
> -
> -# *** RV64B Standard Extension (in addition to RV32B) ***
> -
>  # *** RV32 Zbc Standard Extension ***
>  clmul      0000101 .......... 001 ..... 0110011 @r
>  clmulh     0000101 .......... 011 ..... 0110011 @r
> --
> 2.25.1
>
>

