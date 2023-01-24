Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044CC67993B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 14:25:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKJHv-0004Sl-7b; Tue, 24 Jan 2023 08:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKJHs-0004RY-Iq
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 08:24:32 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKJHq-0006IK-4M
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 08:24:32 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so12841812wmb.0
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 05:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6JnF7rKYo8Dtt6tK5CM56Rc7pqTYb5px+8L52G3rLPY=;
 b=iuBG/ok/v5/ow+ih+YjAye9Ygc+h9RisvWtkTK+tFTFbkQ9C4KxRPhOvsNIwe8S08y
 8Z6e5w0/nV05fbNclIZTeWNy6bb1vG2iSsXLMEX+m03UdM2rn8mGXVA/ctq9xgqdLjLV
 RuC/RjSElgXLPUMlyc6MrmFQXL0WlcSfDKan8laUt8t2ttL6DJ/q6kG4kXJ+4coM/Kl4
 FVvkYKcDanbLArwDyu7N+gdc5yyWJPK2mqQjacrqXAOuf7nSELQ7cAAOgKEwS4AuteFL
 nwxixCcXFURm6uWsAGeHs1MKwHn1LlsuinOmnh9hO656ny9I3ww2h8NTTbMNepQuKU/r
 yrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6JnF7rKYo8Dtt6tK5CM56Rc7pqTYb5px+8L52G3rLPY=;
 b=wZblCh79UOcTX96fymX3Qolztp6kodD4hoAXpdZ9rawah9wEfZ6fUmM/xTVscZxPzL
 5ZKLlnK4VeH9kCvVI5BwVLSaxESOsK+1jVMdZGHtBCaJCAKDKF+QW97fN6MpZ2Zdfo0B
 ycS6F8+lXqSwnee5bT6ML19GeXkwYInApT65J1ad2ez7tK6Ju79s0hDZe7IXE7cFsSrk
 Zzje6YnUIEtAY95dolJVvucO6jpOf+LIbKaziGHErKWkA9+iOKjTFjoJE3QQ6jAuOFm/
 vrCHYBOHf+QCWcWJcnItPkBlkFw5eBy/bTGpAVgxXVXZ/4m+pAd184uX4zX3rJSHq1W3
 tF8w==
X-Gm-Message-State: AFqh2kpB7btLl5xQJr9tNjQDgdlUvjKjE5FLdebRtiaAO8hJur9SQ3uB
 2JWifyoDXsx2CcFTxgNW2Mdc2BLK26h/BHdJnTDZQczeU2rVzg==
X-Google-Smtp-Source: AMrXdXssQ6+9QAiocLWY7Yuq9PM04LwCC04fq1R26kls36dpcBUv/CMcK16dkw+/qQemeXKTMoqkoQjjnI1/GXZ2kis=
X-Received: by 2002:a05:600c:2e42:b0:3da:f648:9ea7 with SMTP id
 q2-20020a05600c2e4200b003daf6489ea7mr1710403wmf.27.1674566668051; Tue, 24 Jan
 2023 05:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-6-alexghiti@rivosinc.com>
 <20230123135126.koxdvloakhwk2gcy@orel>
In-Reply-To: <20230123135126.koxdvloakhwk2gcy@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 24 Jan 2023 14:24:17 +0100
Message-ID: <CAHVXubhNP1O-v_wpweV99q5L8WHKcoZa_=zDEXGwVTMLPOZn3w@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] riscv: Introduce satp mode hw capabilities
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 23, 2023 at 2:51 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Jan 23, 2023 at 10:03:24AM +0100, Alexandre Ghiti wrote:
> > Currently, the max satp mode is set with the only constraint that it must be
> > implemented in qemu, i.e. set in valid_vm_1_10_[32|64].
> >
> > But we actually need to add another level of constraint: what the hw is
> > actually capable of, because currently, a linux booting on a sifive-u54
> > boots in sv57 mode which is incompatible with the cpu's sv39 max
> > capability.
> >
> > So add a new bitmap to RISCVSATPMap which contains this capability and
> > initialize it in every XXX_cpu_init.
> >
> > Finally, we have the following chain of constraints:
> >
> > Qemu capability > HW capability > User choice > Software capability
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  target/riscv/cpu.c | 78 +++++++++++++++++++++++++++++++---------------
> >  target/riscv/cpu.h |  8 +++--
> >  2 files changed, 59 insertions(+), 27 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index e409e6ab64..19a37fee2b 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -292,24 +292,39 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
> >      g_assert_not_reached();
> >  }
> >
> > -/* Sets the satp mode to the max supported */
> > -static void set_satp_mode_default(RISCVCPU *cpu, bool is_32_bit)
> > +static void set_satp_mode_max_supported(RISCVCPU *cpu,
> > +                                        const char *satp_mode_str,
> > +                                        bool is_32_bit)
>
> I'd drop 'is_32_bit' and get it from 'cpu', which would "clean up" all the
> callsites by getting rid of all the true/false stuff.

Indeed, better this way

> Also, why take the string instead of the VM_1_10_SV* define?

No particular reason, but I changed it to VM_1_10_SV*, thanks

>
> >  {
> > -    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> > -        cpu->cfg.satp_mode.map |=
> > -                        (1 << satp_mode_from_str(is_32_bit ? "sv32" : "sv57"));
> > -    } else {
> > -        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
> > +    uint8_t satp_mode = satp_mode_from_str(satp_mode_str);
> > +    const bool *valid_vm = is_32_bit ? valid_vm_1_10_32 : valid_vm_1_10_64;
> > +
> > +    for (int i = 0; i <= satp_mode; ++i) {
> > +        if (valid_vm[i]) {
> > +            cpu->cfg.satp_mode.supported |= (1 << i);
> > +        }
> >      }
> >  }
> >
> > +/* Sets the satp mode to the max supported */
> > +static void set_satp_mode_default(RISCVCPU *cpu)
> > +{
> > +    uint8_t satp_mode = satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
> > +
> > +    cpu->cfg.satp_mode.map |= (1 << satp_mode);
>
> Let's do 'cpu->cfg.satp_mode.map = cpu->cfg.satp_mode.supported' to make
> sure 'map' has all supported bits set for property probing.

Indeed now the map is fully set.

>
> > +}
> > +
> >  static void riscv_any_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> >  #if defined(TARGET_RISCV32)
> >      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> > +    set_satp_mode_max_supported(cpu, "sv32", true);
> >  #elif defined(TARGET_RISCV64)
> >      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> > +    set_satp_mode_max_supported(cpu, "sv57", false);
> >  #endif
> >      set_priv_version(env, PRIV_VERSION_1_12_0);
> >      register_cpu_props(obj);
> > @@ -319,18 +334,24 @@ static void riscv_any_cpu_init(Object *obj)
> >  static void rv64_base_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> >      /* We set this in the realise function */
> >      set_misa(env, MXL_RV64, 0);
> >      register_cpu_props(obj);
> >      /* Set latest version of privileged specification */
> >      set_priv_version(env, PRIV_VERSION_1_12_0);
> > +    set_satp_mode_max_supported(cpu, "sv57", false);
> >  }
> >
> >  static void rv64_sifive_u_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> >      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> > +    set_satp_mode_max_supported(cpu, "sv39", false);
> >  }
> >
> >  static void rv64_sifive_e_cpu_init(Object *obj)
> > @@ -341,6 +362,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
> >      set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >      cpu->cfg.mmu = false;
> > +    set_satp_mode_max_supported(cpu, "mbare", false);
> >  }
> >
> >  static void rv128_base_cpu_init(Object *obj)
> > @@ -352,11 +374,13 @@ static void rv128_base_cpu_init(Object *obj)
> >          exit(EXIT_FAILURE);
> >      }
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> >      /* We set this in the realise function */
> >      set_misa(env, MXL_RV128, 0);
> >      register_cpu_props(obj);
> >      /* Set latest version of privileged specification */
> >      set_priv_version(env, PRIV_VERSION_1_12_0);
> > +    set_satp_mode_max_supported(cpu, "sv57", false);
> >  }
> >  #else
> >  static void rv32_base_cpu_init(Object *obj)
> > @@ -367,13 +391,17 @@ static void rv32_base_cpu_init(Object *obj)
> >      register_cpu_props(obj);
> >      /* Set latest version of privileged specification */
> >      set_priv_version(env, PRIV_VERSION_1_12_0);
> > +    set_satp_mode_max_supported(cpu, "sv32", true);
> >  }
> >
> >  static void rv32_sifive_u_cpu_init(Object *obj)
> >  {
> >      CPURISCVState *env = &RISCV_CPU(obj)->env;
> > +    RISCVCPU *cpu = RISCV_CPU(obj);
> > +
> >      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> > +    set_satp_mode_max_supported(cpu, "sv32", true);
> >  }
> >
> >  static void rv32_sifive_e_cpu_init(Object *obj)
> > @@ -384,6 +412,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
> >      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >      cpu->cfg.mmu = false;
> > +    set_satp_mode_max_supported(cpu, "mbare", true);
> >  }
> >
> >  static void rv32_ibex_cpu_init(Object *obj)
> > @@ -394,6 +423,7 @@ static void rv32_ibex_cpu_init(Object *obj)
> >      set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_11_0);
> >      cpu->cfg.mmu = false;
> > +    set_satp_mode_max_supported(cpu, "mbare", true);
> >      cpu->cfg.epmp = true;
> >  }
> >
> > @@ -405,6 +435,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
> >      set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >      cpu->cfg.mmu = false;
> > +    set_satp_mode_max_supported(cpu, "mbare", true);
> >  }
> >  #endif
> >
> > @@ -696,7 +727,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
> >  static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> >  {
> >      bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> > -    const bool *valid_vm = rv32 ? valid_vm_1_10_32 : valid_vm_1_10_64;
> > +    uint8_t satp_mode_map_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> > +    uint8_t satp_mode_supported_max =
> > +                        satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
> >
> >      if (cpu->cfg.satp_mode.map == 0) {
> >          /*
> > @@ -704,7 +737,7 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> >           * satp mode.
> >           */
> >          if (cpu->cfg.satp_mode.init == 0) {
> > -            set_satp_mode_default(cpu, rv32);
> > +            set_satp_mode_default(cpu);
> >          } else {
> >              /*
> >               * Find the lowest level that was disabled and then enable the
> > @@ -714,9 +747,9 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> >              for (int i = 1; i < 16; ++i) {
> >                  if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
> >                      (cpu->cfg.satp_mode.init & (1 << i)) &&
> > -                    valid_vm[i]) {
> > +                    (cpu->cfg.satp_mode.supported & (1 << i))) {
> >                      for (int j = i - 1; j >= 0; --j) {
> > -                        if (valid_vm[j]) {
> > +                        if (cpu->cfg.satp_mode.supported & (1 << j)) {
> >                              cpu->cfg.satp_mode.map |= (1 << j);
> >                              break;
> >                          }
> > @@ -727,13 +760,12 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> >          }
> >      }
> >
> > -    /* Make sure the configuration asked is supported by qemu */
> > -    for (int i = 0; i < 16; ++i) {
> > -        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> > -            error_setg(errp, "satp_mode %s is not valid",
> > -                       satp_mode_str(i, rv32));
> > -            return;
> > -        }
> > +    /* Make sure the user asked for a supported configuration (HW and qemu) */
> > +    if (satp_mode_map_max > satp_mode_supported_max) {
> > +        error_setg(errp, "satp_mode %s is higher than hw max capability %s",
> > +                   satp_mode_str(satp_mode_map_max, rv32),
> > +                   satp_mode_str(satp_mode_supported_max, rv32));
> > +        return;
> >      }
> >
> >      /*
> > @@ -741,17 +773,13 @@ static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
> >       * the specification.
> >       */
> >      if (!rv32) {
> > -        uint8_t satp_mode_max;
> > -
> > -        satp_mode_max = satp_mode_max_from_map(cpu->cfg.satp_mode.map);
> > -
> > -        for (int i = satp_mode_max - 1; i >= 0; --i) {
> > +        for (int i = satp_mode_map_max - 1; i >= 0; --i) {
> >              if (!(cpu->cfg.satp_mode.map & (1 << i)) &&
> >                  (cpu->cfg.satp_mode.init & (1 << i)) &&
> > -                valid_vm[i]) {
> > +                (cpu->cfg.satp_mode.supported & (1 << i))) {
> >                  error_setg(errp, "cannot disable %s satp mode if %s "
> >                             "is enabled", satp_mode_str(i, false),
> > -                           satp_mode_str(satp_mode_max, false));
> > +                           satp_mode_str(satp_mode_map_max, false));
> >                  return;
> >              }
> >          }
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index e37177db5c..b591122099 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -416,13 +416,17 @@ struct RISCVCPUClass {
> >
> >  /*
> >   * map is a 16-bit bitmap: the most significant set bit in map is the maximum
> > - * satp mode that is supported.
> > + * satp mode that is supported. It may be chosen by the user and must respect
> > + * what qemu implements (valid_1_10_32/64) and what the hw is capable of
> > + * (supported bitmap below).
> >   *
> >   * init is a 16-bit bitmap used to make sure the user selected a correct
> >   * configuration as per the specification.
> > + *
> > + * supported is a 16-bit bitmap used to reflect the hw capabilities.
> >   */
> >  typedef struct {
> > -    uint16_t map, init;
> > +    uint16_t map, init, supported;
> >  } RISCVSATPMap;
> >
> >  struct RISCVCPUConfig {
> > --
> > 2.37.2
> >
>
> Thanks,
> drew

