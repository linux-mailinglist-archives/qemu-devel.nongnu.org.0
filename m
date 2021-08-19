Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076953F1332
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 08:17:51 +0200 (CEST)
Received: from localhost ([::1]:51244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGbN8-0007PA-4e
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 02:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbLY-0006hc-Aa
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 02:16:12 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:45819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbLW-0003hr-8k
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 02:16:12 -0400
Received: by mail-io1-xd2f.google.com with SMTP id e186so6194850iof.12
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 23:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qNlWzCplYVP7mP6Dd8mUFyxtUExhgdSfM/5bYxM7i+Q=;
 b=eLS6bsZBh2puYoSrJHtar+ZYohIWWe3R5svEoy5yNhyxDKkGm6Mvuz+lyFwIC+07YB
 xbu+MCgsvhJw5uXLCGLRA9yKTbKDibW0+4MRhCNn8a/3eXIbJCE2/IIQb64+4NqSMg9g
 LvMVHVII9bJfsLxd56MTZD2OPX0JMFkwmkyVGEQNSwEwB6hOUiVCTQA69GRtn+t9Qtuz
 HuHRQWXn8MHcyKoZDOmJMwEjdMzccQtSXGO9CFHfRKpBMO57WHK+fKLZ/kRDfWM0uCIJ
 +WFQRO/awkXP1rSHXRgGJ5JailI2fD1811Y92p0xFxjjyeUn2Eg7aCOtS7aHVn+fHLfc
 LOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qNlWzCplYVP7mP6Dd8mUFyxtUExhgdSfM/5bYxM7i+Q=;
 b=gKNJn2Om4YaDmgOrzApXOVg03KmUhLOzMJAlzd7YQ24zu1olQn2iqQovEsX/1twHkB
 PlWL0xEmH7R3bA2v5FIJYG+NHoEJHCqSIPMhTuVBGfADU72ViBcAzGz29pbFHv1LENhp
 ONl5CRThzFOqi/ZX7siTsC3O7CAtCgsyOZjOAuOLW898zADBgD0pjhsxH+YoMzZxqITC
 t5IGqawgwN1cWihTUzVIRknGrm5Dos9nyLh6xU/+0T9BijD7edEjugkilSgk3MUFewtX
 YcGUDWS0QC92lJww1Ek/J2IsI/ojSGZ94p2HZIPyQ2oGYAzrdtKTy3uA6K1OJIVM65qD
 5lYQ==
X-Gm-Message-State: AOAM531+O+WOdwNUGdUx/trZHITeNAi0qpZkfvWCOhAMhiLk5Bo5s9O8
 ooOs67uu2BwE/zqx/SHAPDjiFEBEuvZ9x6f4giM=
X-Google-Smtp-Source: ABdhPJws/uakHFNfbkrUidxVey5mo2g0Qf970HWtPtjfz1JeEHqIfQEbq3jIOAkAQ4P61kCW4Z0afmcnySBnPt9bvi8=
X-Received: by 2002:a6b:490d:: with SMTP id u13mr10385239iob.176.1629353768986; 
 Wed, 18 Aug 2021 23:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-3-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-3-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Aug 2021 16:15:42 +1000
Message-ID: <CAKmqyKNEVf84gV1ryrSVDaMuGZZCXTNq6pGszDuQkQ3y9o74SQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/66] hw/core: Make do_unaligned_access noreturn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19, 2021 at 5:23 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While we may have had some thought of allowing system-mode
> to return from this hook, we have no guests that require this.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/core/tcg-cpu-ops.h  | 3 ++-
>  target/alpha/cpu.h             | 4 ++--
>  target/arm/internals.h         | 2 +-
>  target/microblaze/cpu.h        | 2 +-
>  target/mips/tcg/tcg-internal.h | 4 ++--
>  target/nios2/cpu.h             | 4 ++--
>  target/ppc/internal.h          | 4 ++--
>  target/riscv/cpu.h             | 2 +-
>  target/s390x/s390x-internal.h  | 4 ++--
>  target/sh4/cpu.h               | 4 ++--
>  target/xtensa/cpu.h            | 4 ++--
>  target/hppa/cpu.c              | 7 ++++---
>  12 files changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.=
h
> index eab27d0c03..ee0795def4 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -72,10 +72,11 @@ struct TCGCPUOps {
>                                    MemTxResult response, uintptr_t retadd=
r);
>      /**
>       * @do_unaligned_access: Callback for unaligned access handling
> +     * The callback must exit via raising an exception.
>       */
>      void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
>                                  MMUAccessType access_type,
> -                                int mmu_idx, uintptr_t retaddr);
> +                                int mmu_idx, uintptr_t retaddr) QEMU_NOR=
ETURN;
>
>      /**
>       * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by=
 ARM
> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index 82df108967..6eb3fcc63e 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -283,8 +283,8 @@ hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, v=
addr addr);
>  int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;
>  int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                   MMUAccessType access_type,
> -                                   int mmu_idx, uintptr_t retaddr);
> +                                   MMUAccessType access_type, int mmu_id=
x,
> +                                   uintptr_t retaddr) QEMU_NORETURN;
>
>  #define cpu_list alpha_cpu_list
>  #define cpu_signal_handler cpu_alpha_signal_handler
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index cd2ea8a388..8a77929793 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -594,7 +594,7 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env=
, ARMMMUIdx mmu_idx);
>  /* Raise a data fault alignment exception for the specified virtual addr=
ess */
>  void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>                                   MMUAccessType access_type,
> -                                 int mmu_idx, uintptr_t retaddr);
> +                                 int mmu_idx, uintptr_t retaddr) QEMU_NO=
RETURN;
>
>  /* arm_cpu_do_transaction_failed: handle a memory system error response
>   * (eg "no device/memory present at address") by raising an external abo=
rt
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index e4bba8a755..620c3742e1 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -359,7 +359,7 @@ void mb_cpu_do_interrupt(CPUState *cs);
>  bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
>  void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>                                  MMUAccessType access_type,
> -                                int mmu_idx, uintptr_t retaddr);
> +                                int mmu_idx, uintptr_t retaddr) QEMU_NOR=
ETURN;
>  void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
>                                          MemTxAttrs *attrs);
> diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-interna=
l.h
> index 81b14eb219..7ac1e578d1 100644
> --- a/target/mips/tcg/tcg-internal.h
> +++ b/target/mips/tcg/tcg-internal.h
> @@ -24,8 +24,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int=
 size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool probe, uintptr_t retaddr);
>  void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                  MMUAccessType access_type,
> -                                  int mmu_idx, uintptr_t retaddr);
> +                                  MMUAccessType access_type, int mmu_idx=
,
> +                                  uintptr_t retaddr) QEMU_NORETURN;
>
>  const char *mips_exception_name(int32_t exception);
>
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 2ab82fdc71..27227b1e88 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -198,8 +198,8 @@ void dump_mmu(CPUNios2State *env);
>  void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                   MMUAccessType access_type,
> -                                   int mmu_idx, uintptr_t retaddr);
> +                                   MMUAccessType access_type, int mmu_id=
x,
> +                                   uintptr_t retaddr) QEMU_NORETURN;
>
>  void do_nios2_semihosting(CPUNios2State *env);
>
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index f1fd3c8d04..d2163bf5a2 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -213,8 +213,8 @@ void helper_compute_fprf_float128(CPUPPCState *env, f=
loat128 arg);
>
>  /* Raise a data fault alignment exception for the specified virtual addr=
ess */
>  void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                 MMUAccessType access_type,
> -                                 int mmu_idx, uintptr_t retaddr);
> +                                 MMUAccessType access_type, int mmu_idx,
> +                                 uintptr_t retaddr) QEMU_NORETURN;
>
>  /* translate.c */
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index bf1c899c00..a5b0047bfd 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -345,7 +345,7 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifet=
ch);
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                      MMUAccessType access_type, int mmu_i=
dx,
> -                                    uintptr_t retaddr);
> +                                    uintptr_t retaddr) QEMU_NORETURN;
>  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          MMUAccessType access_type, int mmu_idx,
>                          bool probe, uintptr_t retaddr);
> diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.=
h
> index 5506f185e8..96133ac2b6 100644
> --- a/target/s390x/s390x-internal.h
> +++ b/target/s390x/s390x-internal.h
> @@ -274,8 +274,8 @@ bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, i=
nt size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool probe, uintptr_t retaddr);
>  void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                   MMUAccessType access_type,
> -                                   int mmu_idx, uintptr_t retaddr);
> +                                   MMUAccessType access_type, int mmu_id=
x,
> +                                   uintptr_t retaddr) QEMU_NORETURN;
>
>
>  /* fpu_helper.c */
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index 01c4344082..a9191951f8 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -211,8 +211,8 @@ hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, =
vaddr addr);
>  int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg=
);
>  int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                    MMUAccessType access_type,
> -                                    int mmu_idx, uintptr_t retaddr);
> +                                    MMUAccessType access_type, int mmu_i=
dx,
> +                                    uintptr_t retaddr) QEMU_NORETURN;
>
>  void sh4_translate_init(void);
>  int cpu_sh4_signal_handler(int host_signum, void *pinfo,
> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index 2345cb59c7..aa9c77d719 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -579,8 +579,8 @@ void xtensa_count_regs(const XtensaConfig *config,
>  int xtensa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg=
);
>  int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                    MMUAccessType access_type,
> -                                    int mmu_idx, uintptr_t retaddr);
> +                                    MMUAccessType access_type, int mmu_i=
dx,
> +                                    uintptr_t retaddr) QEMU_NORETURN;
>
>  #define cpu_signal_handler cpu_xtensa_signal_handler
>  #define cpu_list xtensa_cpu_list
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 2eace4ee12..c2c56e7635 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -72,9 +72,10 @@ static void hppa_cpu_disas_set_info(CPUState *cs, disa=
ssemble_info *info)
>  }
>
>  #ifndef CONFIG_USER_ONLY
> -static void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                         MMUAccessType access_type,
> -                                         int mmu_idx, uintptr_t retaddr)
> +static void QEMU_NORETURN
> +hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> +                             MMUAccessType access_type, int mmu_idx,
> +                             uintptr_t retaddr)
>  {
>      HPPACPU *cpu =3D HPPA_CPU(cs);
>      CPUHPPAState *env =3D &cpu->env;
> --
> 2.25.1
>
>

