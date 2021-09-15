Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8CF40C9D5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:12:38 +0200 (CEST)
Received: from localhost ([::1]:41654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQXWX-0006tQ-G0
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mQXTV-0004fl-1g
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:09:29 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d]:42498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mQXTP-0002pf-Lj
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:09:27 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id z62so3242556vsz.9
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 09:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fm/sy9iM9naqGnP/5sfxV1+QZupq/xphCd5l41V/6CY=;
 b=VpOniOF/cLbZQmITTM8XiJvpJQJLklyd1yukhFj+NbqtPPFtERpHDhtmF1s7GtIxY3
 1YtnV7k699bDnT6RWEjusAn/m0Pwqc4SWy4eDMye3v5fJHqPWyChe2XaZKkyyRkXa+ld
 QDiHXVicmTOdKV5cndNneVl35N+/3eRUlMxll0nIYkLS1tn2aEYuH8hJhdeo4hmNAYE8
 qds43hIC4e2i8Xy/GfFKu9cGhUPHCR//dvM+qeJr5/SSMSNu6ASrt2LUmVnWJhFHn9LL
 DNWRZjK+3R9tGE/pUpGLtBu99rJTBtlwApAL8FWUciiBjl/hVBqsV8QO8FwoYCn/oBlj
 TE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fm/sy9iM9naqGnP/5sfxV1+QZupq/xphCd5l41V/6CY=;
 b=y28RvZ5QI+UkGEDAXlo8zqedh+rTCh8jYHZ5srWNy6ll507KXx+Rdg3fX6t6sCqTQY
 HqkfY9/nfhsuM/rxJvGzH0zqh913Y/FSTcTBjVFetdbYC+mRY0YzIqipYMLzftAYHopN
 jlZq8Cn/jTKgCWTgMxDSRtd6wtHoS0PFrX6HEBrn0p02tPcVev+GMs9UMTx86C9jvATw
 l6bGvzibSqr9nJB/00r903hCB5DBYRvsc2V4J/h5B8YxFFSub1hGr1BvIWz0F0XfNosi
 HHRVIQwkEf0dnQ5teXNnjK9eJGS4YjqVO4YIYAmQP//R45WK7rB+4byxBRD7vT49XqhM
 jvIQ==
X-Gm-Message-State: AOAM533zbcRQapKl8JuGXHuQ0lyJVcdg+0yeGOWWylEkaMqANr/YJCsI
 OizPmTJ9ZMRItmCXWmLsq7gZH9I8fHYYdJRepAlqug==
X-Google-Smtp-Source: ABdhPJyxfFu1R55KLhm/ivbumPC9HJ6X8DEd6oePLUCCwx1wq/On7tLnWyfl48DaY5fb48SfZurxJ+rWv+xojRmt1/Y=
X-Received: by 2002:a67:d589:: with SMTP id m9mr429497vsj.30.1631722160905;
 Wed, 15 Sep 2021 09:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210913220552.604064-1-richard.henderson@linaro.org>
 <20210913220552.604064-2-richard.henderson@linaro.org>
In-Reply-To: <20210913220552.604064-2-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 15 Sep 2021 10:09:10 -0600
Message-ID: <CANCZdfqpoyw-ERz_TyEGFjV0sDjWuatZ0Bw2MbF=zCrUP0rN7g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] include/exec: Move cpu_signal_handler declaration
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000c5f88505cc0aeb45"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c5f88505cc0aeb45
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 4:05 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> There is nothing target specific about this.  The implementation
> is host specific, but the declaration is 100% common.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h | 13 +++++++++++++
>  target/alpha/cpu.h      |  6 ------
>  target/arm/cpu.h        |  7 -------
>  target/avr/cpu.h        |  2 --
>  target/cris/cpu.h       |  8 --------
>  target/hexagon/cpu.h    |  3 ---
>  target/hppa/cpu.h       |  3 ---
>  target/i386/cpu.h       |  7 -------
>  target/m68k/cpu.h       |  8 --------
>  target/microblaze/cpu.h |  7 -------
>  target/mips/cpu.h       |  3 ---
>  target/mips/internal.h  |  2 --
>  target/nios2/cpu.h      |  2 --
>  target/openrisc/cpu.h   |  2 --
>  target/ppc/cpu.h        |  7 -------
>  target/riscv/cpu.h      |  2 --
>  target/rx/cpu.h         |  4 ----
>  target/s390x/cpu.h      |  7 -------
>  target/sh4/cpu.h        |  3 ---
>  target/sparc/cpu.h      |  2 --
>  target/tricore/cpu.h    |  2 --
>  target/xtensa/cpu.h     |  2 --
>  22 files changed, 13 insertions(+), 89 deletions(-)
>

Reviewed-By: Warner Losh <imp@bsdimp.com>

Warner


> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 5d1b6d80fb..9d5987ba04 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -662,6 +662,19 @@ static inline tb_page_addr_t
> get_page_addr_code_hostp(CPUArchState *env,
>      }
>      return addr;
>  }
> +
> +/**
> + * cpu_signal_handler
> + * @signum: host signal number
> + * @pinfo: host siginfo_t
> + * @puc: host ucontext_t
> + *
> + * To be called from the SIGBUS and SIGSEGV signal handler to inform the
> + * virtual cpu of exceptions.  Returns true if the signal was handled by
> + * the virtual CPU.
> + */
> +int cpu_signal_handler(int signum, void *pinfo, void *puc);
> +
>  #else
>  static inline void mmap_lock(void) {}
>  static inline void mmap_unlock(void) {}
> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index 4e993bd15b..ce9ec32199 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -287,7 +287,6 @@ void alpha_cpu_do_unaligned_access(CPUState *cpu,
> vaddr addr,
>                                     int mmu_idx, uintptr_t retaddr);
>
>  #define cpu_list alpha_cpu_list
> -#define cpu_signal_handler cpu_alpha_signal_handler
>
>  typedef CPUAlphaState CPUArchState;
>  typedef AlphaCPU ArchCPU;
> @@ -440,11 +439,6 @@ void alpha_translate_init(void);
>  #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
>
>  void alpha_cpu_list(void);
> -/* you can call this signal handler from your SIGBUS and SIGSEGV
> -   signal handlers to inform the virtual CPU of exceptions. non zero
> -   is returned if the signal was handled by the virtual CPU.  */
> -int cpu_alpha_signal_handler(int host_signum, void *pinfo,
> -                             void *puc);
>  bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          MMUAccessType access_type, int mmu_idx,
>                          bool probe, uintptr_t retaddr);
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index cfd755cff9..6c78957e54 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1121,12 +1121,6 @@ static inline bool is_a64(CPUARMState *env)
>      return env->aarch64;
>  }
>
> -/* you can call this signal handler from your SIGBUS and SIGSEGV
> -   signal handlers to inform the virtual CPU of exceptions. non zero
> -   is returned if the signal was handled by the virtual CPU.  */
> -int cpu_arm_signal_handler(int host_signum, void *pinfo,
> -                           void *puc);
> -
>  /**
>   * pmu_op_start/finish
>   * @env: CPUARMState
> @@ -3015,7 +3009,6 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool
> kvm_sync);
>  #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
>  #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
>
> -#define cpu_signal_handler cpu_arm_signal_handler
>  #define cpu_list arm_cpu_list
>
>  /* ARM has the following "translation regimes" (as the ARM ARM calls
> them):
> diff --git a/target/avr/cpu.h b/target/avr/cpu.h
> index 93e3faa0a9..dceacf3cd7 100644
> --- a/target/avr/cpu.h
> +++ b/target/avr/cpu.h
> @@ -175,7 +175,6 @@ static inline void set_avr_feature(CPUAVRState *env,
> int feature)
>  }
>
>  #define cpu_list avr_cpu_list
> -#define cpu_signal_handler cpu_avr_signal_handler
>  #define cpu_mmu_index avr_cpu_mmu_index
>
>  static inline int avr_cpu_mmu_index(CPUAVRState *env, bool ifetch)
> @@ -187,7 +186,6 @@ void avr_cpu_tcg_init(void);
>
>  void avr_cpu_list(void);
>  int cpu_avr_exec(CPUState *cpu);
> -int cpu_avr_signal_handler(int host_signum, void *pinfo, void *puc);
>  int avr_cpu_memory_rw_debug(CPUState *cs, vaddr address, uint8_t *buf,
>                              int len, bool is_write);
>
> diff --git a/target/cris/cpu.h b/target/cris/cpu.h
> index be021899ae..6603565f83 100644
> --- a/target/cris/cpu.h
> +++ b/target/cris/cpu.h
> @@ -199,12 +199,6 @@ int crisv10_cpu_gdb_read_register(CPUState *cpu,
> GByteArray *buf, int reg);
>  int cris_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int cris_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>
> -/* you can call this signal handler from your SIGBUS and SIGSEGV
> -   signal handlers to inform the virtual CPU of exceptions. non zero
> -   is returned if the signal was handled by the virtual CPU.  */
> -int cpu_cris_signal_handler(int host_signum, void *pinfo,
> -                           void *puc);
> -
>  void cris_initialize_tcg(void);
>  void cris_initialize_crisv10_tcg(void);
>
> @@ -250,8 +244,6 @@ enum {
>  #define CRIS_CPU_TYPE_NAME(name) (name CRIS_CPU_TYPE_SUFFIX)
>  #define CPU_RESOLVING_TYPE TYPE_CRIS_CPU
>
> -#define cpu_signal_handler cpu_cris_signal_handler
> -
>  /* MMU modes definitions */
>  #define MMU_USER_IDX 1
>  static inline int cpu_mmu_index (CPUCRISState *env, bool ifetch)
> diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
> index 2855dd3881..f7d043865b 100644
> --- a/target/hexagon/cpu.h
> +++ b/target/hexagon/cpu.h
> @@ -129,9 +129,6 @@ typedef struct HexagonCPU {
>
>  #include "cpu_bits.h"
>
> -#define cpu_signal_handler cpu_hexagon_signal_handler
> -int cpu_hexagon_signal_handler(int host_signum, void *pinfo, void *puc);
> -
>  static inline void cpu_get_tb_cpu_state(CPUHexagonState *env,
> target_ulong *pc,
>                                          target_ulong *cs_base, uint32_t
> *flags)
>  {
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index 7854675b90..d3cb7a279f 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -319,9 +319,6 @@ static inline void
> cpu_hppa_change_prot_id(CPUHPPAState *env) { }
>  void cpu_hppa_change_prot_id(CPUHPPAState *env);
>  #endif
>
> -#define cpu_signal_handler cpu_hppa_signal_handler
> -
> -int cpu_hppa_signal_handler(int host_signum, void *pinfo, void *puc);
>  hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);
>  int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 7dd664791a..c2954c71ea 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1947,12 +1947,6 @@ void cpu_x86_frstor(CPUX86State *s, target_ulong
> ptr, int data32);
>  void cpu_x86_fxsave(CPUX86State *s, target_ulong ptr);
>  void cpu_x86_fxrstor(CPUX86State *s, target_ulong ptr);
>
> -/* you can call this signal handler from your SIGBUS and SIGSEGV
> -   signal handlers to inform the virtual CPU of exceptions. non zero
> -   is returned if the signal was handled by the virtual CPU.  */
> -int cpu_x86_signal_handler(int host_signum, void *pinfo,
> -                           void *puc);
> -
>  /* cpu.c */
>  void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
>                                uint32_t vendor2, uint32_t vendor3);
> @@ -2020,7 +2014,6 @@ uint64_t cpu_get_tsc(CPUX86State *env);
>  #define TARGET_DEFAULT_CPU_TYPE X86_CPU_TYPE_NAME("qemu32")
>  #endif
>
> -#define cpu_signal_handler cpu_x86_signal_handler
>  #define cpu_list x86_cpu_list
>
>  /* MMU modes definitions */
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 550eb028b6..a3423729ef 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -177,13 +177,6 @@ int m68k_cpu_gdb_write_register(CPUState *cpu,
> uint8_t *buf, int reg);
>
>  void m68k_tcg_init(void);
>  void m68k_cpu_init_gdb(M68kCPU *cpu);
> -/*
> - * you can call this signal handler from your SIGBUS and SIGSEGV
> - * signal handlers to inform the virtual CPU of exceptions. non zero
> - * is returned if the signal was handled by the virtual CPU.
> - */
> -int cpu_m68k_signal_handler(int host_signum, void *pinfo,
> -                           void *puc);
>  uint32_t cpu_m68k_get_ccr(CPUM68KState *env);
>  void cpu_m68k_set_ccr(CPUM68KState *env, uint32_t);
>  void cpu_m68k_set_sr(CPUM68KState *env, uint32_t);
> @@ -563,7 +556,6 @@ enum {
>  #define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_M68K_CPU
>
> -#define cpu_signal_handler cpu_m68k_signal_handler
>  #define cpu_list m68k_cpu_list
>
>  /* MMU modes definitions */
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index 40401c33b7..13ed3cd4dd 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -385,16 +385,9 @@ static inline void mb_cpu_write_msr(CPUMBState *env,
> uint32_t val)
>  }
>
>  void mb_tcg_init(void);
> -/* you can call this signal handler from your SIGBUS and SIGSEGV
> -   signal handlers to inform the virtual CPU of exceptions. non zero
> -   is returned if the signal was handled by the virtual CPU.  */
> -int cpu_mb_signal_handler(int host_signum, void *pinfo,
> -                          void *puc);
>
>  #define CPU_RESOLVING_TYPE TYPE_MICROBLAZE_CPU
>
> -#define cpu_signal_handler cpu_mb_signal_handler
> -
>  /* MMU modes definitions */
>  #define MMU_NOMMU_IDX   0
>  #define MMU_KERNEL_IDX  1
> diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> index 1dfe69c6c0..56b1cbd091 100644
> --- a/target/mips/cpu.h
> +++ b/target/mips/cpu.h
> @@ -1193,7 +1193,6 @@ struct MIPSCPU {
>
>  void mips_cpu_list(void);
>
> -#define cpu_signal_handler cpu_mips_signal_handler
>  #define cpu_list mips_cpu_list
>
>  extern void cpu_wrdsp(uint32_t rs, uint32_t mask_num, CPUMIPSState *env);
> @@ -1277,8 +1276,6 @@ enum {
>   */
>  #define CPU_INTERRUPT_WAKE CPU_INTERRUPT_TGT_INT_0
>
> -int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);
> -
>  #define MIPS_CPU_TYPE_SUFFIX "-" TYPE_MIPS_CPU
>  #define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_MIPS_CPU
> diff --git a/target/mips/internal.h b/target/mips/internal.h
> index eecdd10116..daddb05fd4 100644
> --- a/target/mips/internal.h
> +++ b/target/mips/internal.h
> @@ -156,8 +156,6 @@ extern const VMStateDescription vmstate_mips_cpu;
>
>  #endif /* !CONFIG_USER_ONLY */
>
> -#define cpu_signal_handler cpu_mips_signal_handler
> -
>  static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
>  {
>      return (env->CP0_Status & (1 << CP0St_IE)) &&
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index 2ab82fdc71..88a511209c 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -193,7 +193,6 @@ struct Nios2CPU {
>
>  void nios2_tcg_init(void);
>  void nios2_cpu_do_interrupt(CPUState *cs);
> -int cpu_nios2_signal_handler(int host_signum, void *pinfo, void *puc);
>  void dump_mmu(CPUNios2State *env);
>  void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> @@ -206,7 +205,6 @@ void do_nios2_semihosting(CPUNios2State *env);
>  #define CPU_RESOLVING_TYPE TYPE_NIOS2_CPU
>
>  #define cpu_gen_code cpu_nios2_gen_code
> -#define cpu_signal_handler cpu_nios2_signal_handler
>
>  #define CPU_SAVE_VERSION 1
>
> diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
> index be6df81a81..187a4a114e 100644
> --- a/target/openrisc/cpu.h
> +++ b/target/openrisc/cpu.h
> @@ -320,11 +320,9 @@ void openrisc_translate_init(void);
>  bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                             MMUAccessType access_type, int mmu_idx,
>                             bool probe, uintptr_t retaddr);
> -int cpu_openrisc_signal_handler(int host_signum, void *pinfo, void *puc);
>  int print_insn_or1k(bfd_vma addr, disassemble_info *info);
>
>  #define cpu_list cpu_openrisc_list
> -#define cpu_signal_handler cpu_openrisc_signal_handler
>
>  #ifndef CONFIG_USER_ONLY
>  extern const VMStateDescription vmstate_openrisc_cpu;
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 362e7c4c5c..01d3773bc7 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1278,12 +1278,6 @@ extern const VMStateDescription vmstate_ppc_cpu;
>
>
>  /*****************************************************************************/
>  void ppc_translate_init(void);
> -/*
> - * you can call this signal handler from your SIGBUS and SIGSEGV
> - * signal handlers to inform the virtual CPU of exceptions. non zero
> - * is returned if the signal was handled by the virtual CPU.
> - */
> -int cpu_ppc_signal_handler(int host_signum, void *pinfo, void *puc);
>  bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                        MMUAccessType access_type, int mmu_idx,
>                        bool probe, uintptr_t retaddr);
> @@ -1371,7 +1365,6 @@ int ppc_dcr_write(ppc_dcr_t *dcr_env, int dcrn,
> uint32_t val);
>  #define POWERPC_CPU_TYPE_NAME(model) model POWERPC_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_POWERPC_CPU
>
> -#define cpu_signal_handler cpu_ppc_signal_handler
>  #define cpu_list ppc_cpu_list
>
>  /* MMU modes definitions */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e735e53e26..465142616a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -356,7 +356,6 @@ void riscv_cpu_do_transaction_failed(CPUState *cs,
> hwaddr physaddr,
>  char *riscv_isa_string(RISCVCPU *cpu);
>  void riscv_cpu_list(void);
>
> -#define cpu_signal_handler riscv_cpu_signal_handler
>  #define cpu_list riscv_cpu_list
>  #define cpu_mmu_index riscv_cpu_mmu_index
>
> @@ -372,7 +371,6 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env,
> uint64_t (*fn)(uint32_t),
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
>
>  void riscv_translate_init(void);
> -int riscv_cpu_signal_handler(int host_signum, void *pinfo, void *puc);
>  void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
>                                           uint32_t exception, uintptr_t
> pc);
>
> diff --git a/target/rx/cpu.h b/target/rx/cpu.h
> index faa3606f52..4ac71aec37 100644
> --- a/target/rx/cpu.h
> +++ b/target/rx/cpu.h
> @@ -134,13 +134,9 @@ int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t
> *buf, int reg);
>  hwaddr rx_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>
>  void rx_translate_init(void);
> -int cpu_rx_signal_handler(int host_signum, void *pinfo,
> -                           void *puc);
> -
>  void rx_cpu_list(void);
>  void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte);
>
> -#define cpu_signal_handler cpu_rx_signal_handler
>  #define cpu_list rx_cpu_list
>
>  #include "exec/cpu-all.h"
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index b26ae8fff2..3153d053e9 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -809,13 +809,6 @@ void s390_set_qemu_cpu_model(uint16_t type, uint8_t
> gen, uint8_t ec_ga,
>  #define S390_CPU_TYPE_NAME(name) (name S390_CPU_TYPE_SUFFIX)
>  #define CPU_RESOLVING_TYPE TYPE_S390_CPU
>
> -/* you can call this signal handler from your SIGBUS and SIGSEGV
> -   signal handlers to inform the virtual CPU of exceptions. non zero
> -   is returned if the signal was handled by the virtual CPU.  */
> -int cpu_s390x_signal_handler(int host_signum, void *pinfo, void *puc);
> -#define cpu_signal_handler cpu_s390x_signal_handler
> -
> -
>  /* interrupt.c */
>  #define RA_IGNORED                  0
>  void s390_program_interrupt(CPUS390XState *env, uint32_t code, uintptr_t
> ra);
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index 017a770214..56f7c32df9 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -213,8 +213,6 @@ void superh_cpu_do_unaligned_access(CPUState *cpu,
> vaddr addr,
>                                      int mmu_idx, uintptr_t retaddr);
>
>  void sh4_translate_init(void);
> -int cpu_sh4_signal_handler(int host_signum, void *pinfo,
> -                           void *puc);
>  bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                           MMUAccessType access_type, int mmu_idx,
>                           bool probe, uintptr_t retaddr);
> @@ -250,7 +248,6 @@ void cpu_load_tlb(CPUSH4State * env);
>  #define SUPERH_CPU_TYPE_NAME(model) model SUPERH_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_SUPERH_CPU
>
> -#define cpu_signal_handler cpu_sh4_signal_handler
>  #define cpu_list sh4_cpu_list
>
>  /* MMU modes definitions */
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index ff8ae73002..6b40d02237 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -649,13 +649,11 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env,
> target_ulong addr,
>                                             int mmu_idx);
>  #endif
>  #endif
> -int cpu_sparc_signal_handler(int host_signum, void *pinfo, void *puc);
>
>  #define SPARC_CPU_TYPE_SUFFIX "-" TYPE_SPARC_CPU
>  #define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_SPARC_CPU
>
> -#define cpu_signal_handler cpu_sparc_signal_handler
>  #define cpu_list sparc_cpu_list
>
>  /* MMU modes definitions */
> diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
> index 4b61a2c03f..c461387e71 100644
> --- a/target/tricore/cpu.h
> +++ b/target/tricore/cpu.h
> @@ -362,7 +362,6 @@ void fpu_set_state(CPUTriCoreState *env);
>
>  void tricore_cpu_list(void);
>
> -#define cpu_signal_handler cpu_tricore_signal_handler
>  #define cpu_list tricore_cpu_list
>
>  static inline int cpu_mmu_index(CPUTriCoreState *env, bool ifetch)
> @@ -377,7 +376,6 @@ typedef TriCoreCPU ArchCPU;
>
>  void cpu_state_reset(CPUTriCoreState *s);
>  void tricore_tcg_init(void);
> -int cpu_tricore_signal_handler(int host_signum, void *pinfo, void *puc);
>
>  static inline void cpu_get_tb_cpu_state(CPUTriCoreState *env,
> target_ulong *pc,
>                                          target_ulong *cs_base, uint32_t
> *flags)
> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index cbb720e7cc..646965f379 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -584,7 +584,6 @@ void xtensa_cpu_do_unaligned_access(CPUState *cpu,
> vaddr addr,
>                                      MMUAccessType access_type,
>                                      int mmu_idx, uintptr_t retaddr);
>
> -#define cpu_signal_handler cpu_xtensa_signal_handler
>  #define cpu_list xtensa_cpu_list
>
>  #define XTENSA_CPU_TYPE_SUFFIX "-" TYPE_XTENSA_CPU
> @@ -613,7 +612,6 @@ void check_interrupts(CPUXtensaState *s);
>  void xtensa_irq_init(CPUXtensaState *env);
>  qemu_irq *xtensa_get_extints(CPUXtensaState *env);
>  qemu_irq xtensa_get_runstall(CPUXtensaState *env);
> -int cpu_xtensa_signal_handler(int host_signum, void *pinfo, void *puc);
>  void xtensa_cpu_list(void);
>  void xtensa_sync_window_from_phys(CPUXtensaState *env);
>  void xtensa_sync_phys_from_window(CPUXtensaState *env);
> --
> 2.25.1
>
>

--000000000000c5f88505cc0aeb45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 13, 2021 at 4:05 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">There is nothing target specific about this.=C2=A0 The im=
plementation<br>
is host specific, but the declaration is 100% common.<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/exec/exec-all.h | 13 +++++++++++++<br>
=C2=A0target/alpha/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ------<br>
=C2=A0target/arm/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 -------<br>
=C2=A0target/avr/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br>
=C2=A0target/cris/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 --------<br>
=C2=A0target/hexagon/cpu.h=C2=A0 =C2=A0 |=C2=A0 3 ---<br>
=C2=A0target/hppa/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ---<br>
=C2=A0target/i386/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 -------<br>
=C2=A0target/m68k/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 --------<br>
=C2=A0target/microblaze/cpu.h |=C2=A0 7 -------<br>
=C2=A0target/mips/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ---<br>
=C2=A0target/mips/internal.h=C2=A0 |=C2=A0 2 --<br>
=C2=A0target/nios2/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br>
=C2=A0target/openrisc/cpu.h=C2=A0 =C2=A0|=C2=A0 2 --<br>
=C2=A0target/ppc/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 -------<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br>
=C2=A0target/rx/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ----<br>
=C2=A0target/s390x/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 -------<br>
=C2=A0target/sh4/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ---<br>
=C2=A0target/sparc/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br>
=C2=A0target/tricore/cpu.h=C2=A0 =C2=A0 |=C2=A0 2 --<br>
=C2=A0target/xtensa/cpu.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 --<br>
=C2=A022 files changed, 13 insertions(+), 89 deletions(-)<br></blockquote><=
div><br></div><div>Reviewed-By: Warner Losh &lt;<a href=3D"mailto:imp@bsdim=
p.com">imp@bsdimp.com</a>&gt;</div><div><br></div><div>Warner</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h<br>
index 5d1b6d80fb..9d5987ba04 100644<br>
--- a/include/exec/exec-all.h<br>
+++ b/include/exec/exec-all.h<br>
@@ -662,6 +662,19 @@ static inline tb_page_addr_t get_page_addr_code_hostp(=
CPUArchState *env,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return addr;<br>
=C2=A0}<br>
+<br>
+/**<br>
+ * cpu_signal_handler<br>
+ * @signum: host signal number<br>
+ * @pinfo: host siginfo_t<br>
+ * @puc: host ucontext_t<br>
+ *<br>
+ * To be called from the SIGBUS and SIGSEGV signal handler to inform the<b=
r>
+ * virtual cpu of exceptions.=C2=A0 Returns true if the signal was handled=
 by<br>
+ * the virtual CPU.<br>
+ */<br>
+int cpu_signal_handler(int signum, void *pinfo, void *puc);<br>
+<br>
=C2=A0#else<br>
=C2=A0static inline void mmap_lock(void) {}<br>
=C2=A0static inline void mmap_unlock(void) {}<br>
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h<br>
index 4e993bd15b..ce9ec32199 100644<br>
--- a/target/alpha/cpu.h<br>
+++ b/target/alpha/cpu.h<br>
@@ -287,7 +287,6 @@ void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr=
 addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mmu_idx, uintptr_t=
 retaddr);<br>
<br>
=C2=A0#define cpu_list alpha_cpu_list<br>
-#define cpu_signal_handler cpu_alpha_signal_handler<br>
<br>
=C2=A0typedef CPUAlphaState CPUArchState;<br>
=C2=A0typedef AlphaCPU ArchCPU;<br>
@@ -440,11 +439,6 @@ void alpha_translate_init(void);<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU<br>
<br>
=C2=A0void alpha_cpu_list(void);<br>
-/* you can call this signal handler from your SIGBUS and SIGSEGV<br>
-=C2=A0 =C2=A0signal handlers to inform the virtual CPU of exceptions. non =
zero<br>
-=C2=A0 =C2=A0is returned if the signal was handled by the virtual CPU.=C2=
=A0 */<br>
-int cpu_alpha_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *puc);<br>
=C2=A0bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bool probe, uintptr_t retaddr);<br>
diff --git a/target/arm/cpu.h b/target/arm/cpu.h<br>
index cfd755cff9..6c78957e54 100644<br>
--- a/target/arm/cpu.h<br>
+++ b/target/arm/cpu.h<br>
@@ -1121,12 +1121,6 @@ static inline bool is_a64(CPUARMState *env)<br>
=C2=A0 =C2=A0 =C2=A0return env-&gt;aarch64;<br>
=C2=A0}<br>
<br>
-/* you can call this signal handler from your SIGBUS and SIGSEGV<br>
-=C2=A0 =C2=A0signal handlers to inform the virtual CPU of exceptions. non =
zero<br>
-=C2=A0 =C2=A0is returned if the signal was handled by the virtual CPU.=C2=
=A0 */<br>
-int cpu_arm_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *puc);<br>
-<br>
=C2=A0/**<br>
=C2=A0 * pmu_op_start/finish<br>
=C2=A0 * @env: CPUARMState<br>
@@ -3015,7 +3009,6 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_syn=
c);<br>
=C2=A0#define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_ARM_CPU<br>
<br>
-#define cpu_signal_handler cpu_arm_signal_handler<br>
=C2=A0#define cpu_list arm_cpu_list<br>
<br>
=C2=A0/* ARM has the following &quot;translation regimes&quot; (as the ARM =
ARM calls them):<br>
diff --git a/target/avr/cpu.h b/target/avr/cpu.h<br>
index 93e3faa0a9..dceacf3cd7 100644<br>
--- a/target/avr/cpu.h<br>
+++ b/target/avr/cpu.h<br>
@@ -175,7 +175,6 @@ static inline void set_avr_feature(CPUAVRState *env, in=
t feature)<br>
=C2=A0}<br>
<br>
=C2=A0#define cpu_list avr_cpu_list<br>
-#define cpu_signal_handler cpu_avr_signal_handler<br>
=C2=A0#define cpu_mmu_index avr_cpu_mmu_index<br>
<br>
=C2=A0static inline int avr_cpu_mmu_index(CPUAVRState *env, bool ifetch)<br=
>
@@ -187,7 +186,6 @@ void avr_cpu_tcg_init(void);<br>
<br>
=C2=A0void avr_cpu_list(void);<br>
=C2=A0int cpu_avr_exec(CPUState *cpu);<br>
-int cpu_avr_signal_handler(int host_signum, void *pinfo, void *puc);<br>
=C2=A0int avr_cpu_memory_rw_debug(CPUState *cs, vaddr address, uint8_t *buf=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int len, bool is_write);<br>
<br>
diff --git a/target/cris/cpu.h b/target/cris/cpu.h<br>
index be021899ae..6603565f83 100644<br>
--- a/target/cris/cpu.h<br>
+++ b/target/cris/cpu.h<br>
@@ -199,12 +199,6 @@ int crisv10_cpu_gdb_read_register(CPUState *cpu, GByte=
Array *buf, int reg);<br>
=C2=A0int cris_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int re=
g);<br>
=C2=A0int cris_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)=
;<br>
<br>
-/* you can call this signal handler from your SIGBUS and SIGSEGV<br>
-=C2=A0 =C2=A0signal handlers to inform the virtual CPU of exceptions. non =
zero<br>
-=C2=A0 =C2=A0is returned if the signal was handled by the virtual CPU.=C2=
=A0 */<br>
-int cpu_cris_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *puc);<br>
-<br>
=C2=A0void cris_initialize_tcg(void);<br>
=C2=A0void cris_initialize_crisv10_tcg(void);<br>
<br>
@@ -250,8 +244,6 @@ enum {<br>
=C2=A0#define CRIS_CPU_TYPE_NAME(name) (name CRIS_CPU_TYPE_SUFFIX)<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_CRIS_CPU<br>
<br>
-#define cpu_signal_handler cpu_cris_signal_handler<br>
-<br>
=C2=A0/* MMU modes definitions */<br>
=C2=A0#define MMU_USER_IDX 1<br>
=C2=A0static inline int cpu_mmu_index (CPUCRISState *env, bool ifetch)<br>
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h<br>
index 2855dd3881..f7d043865b 100644<br>
--- a/target/hexagon/cpu.h<br>
+++ b/target/hexagon/cpu.h<br>
@@ -129,9 +129,6 @@ typedef struct HexagonCPU {<br>
<br>
=C2=A0#include &quot;cpu_bits.h&quot;<br>
<br>
-#define cpu_signal_handler cpu_hexagon_signal_handler<br>
-int cpu_hexagon_signal_handler(int host_signum, void *pinfo, void *puc);<b=
r>
-<br>
=C2=A0static inline void cpu_get_tb_cpu_state(CPUHexagonState *env, target_=
ulong *pc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ta=
rget_ulong *cs_base, uint32_t *flags)<br>
=C2=A0{<br>
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h<br>
index 7854675b90..d3cb7a279f 100644<br>
--- a/target/hppa/cpu.h<br>
+++ b/target/hppa/cpu.h<br>
@@ -319,9 +319,6 @@ static inline void cpu_hppa_change_prot_id(CPUHPPAState=
 *env) { }<br>
=C2=A0void cpu_hppa_change_prot_id(CPUHPPAState *env);<br>
=C2=A0#endif<br>
<br>
-#define cpu_signal_handler cpu_hppa_signal_handler<br>
-<br>
-int cpu_hppa_signal_handler(int host_signum, void *pinfo, void *puc);<br>
=C2=A0hwaddr hppa_cpu_get_phys_page_debug(CPUState *cs, vaddr addr);<br>
=C2=A0int hppa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int re=
g);<br>
=C2=A0int hppa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)=
;<br>
diff --git a/target/i386/cpu.h b/target/i386/cpu.h<br>
index 7dd664791a..c2954c71ea 100644<br>
--- a/target/i386/cpu.h<br>
+++ b/target/i386/cpu.h<br>
@@ -1947,12 +1947,6 @@ void cpu_x86_frstor(CPUX86State *s, target_ulong ptr=
, int data32);<br>
=C2=A0void cpu_x86_fxsave(CPUX86State *s, target_ulong ptr);<br>
=C2=A0void cpu_x86_fxrstor(CPUX86State *s, target_ulong ptr);<br>
<br>
-/* you can call this signal handler from your SIGBUS and SIGSEGV<br>
-=C2=A0 =C2=A0signal handlers to inform the virtual CPU of exceptions. non =
zero<br>
-=C2=A0 =C2=A0is returned if the signal was handled by the virtual CPU.=C2=
=A0 */<br>
-int cpu_x86_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *puc);<br>
-<br>
=C2=A0/* cpu.c */<br>
=C2=A0void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t vendor2, uint32_t vendor3);<=
br>
@@ -2020,7 +2014,6 @@ uint64_t cpu_get_tsc(CPUX86State *env);<br>
=C2=A0#define TARGET_DEFAULT_CPU_TYPE X86_CPU_TYPE_NAME(&quot;qemu32&quot;)=
<br>
=C2=A0#endif<br>
<br>
-#define cpu_signal_handler cpu_x86_signal_handler<br>
=C2=A0#define cpu_list x86_cpu_list<br>
<br>
=C2=A0/* MMU modes definitions */<br>
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h<br>
index 550eb028b6..a3423729ef 100644<br>
--- a/target/m68k/cpu.h<br>
+++ b/target/m68k/cpu.h<br>
@@ -177,13 +177,6 @@ int m68k_cpu_gdb_write_register(CPUState *cpu, uint8_t=
 *buf, int reg);<br>
<br>
=C2=A0void m68k_tcg_init(void);<br>
=C2=A0void m68k_cpu_init_gdb(M68kCPU *cpu);<br>
-/*<br>
- * you can call this signal handler from your SIGBUS and SIGSEGV<br>
- * signal handlers to inform the virtual CPU of exceptions. non zero<br>
- * is returned if the signal was handled by the virtual CPU.<br>
- */<br>
-int cpu_m68k_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *puc);<br>
=C2=A0uint32_t cpu_m68k_get_ccr(CPUM68KState *env);<br>
=C2=A0void cpu_m68k_set_ccr(CPUM68KState *env, uint32_t);<br>
=C2=A0void cpu_m68k_set_sr(CPUM68KState *env, uint32_t);<br>
@@ -563,7 +556,6 @@ enum {<br>
=C2=A0#define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_M68K_CPU<br>
<br>
-#define cpu_signal_handler cpu_m68k_signal_handler<br>
=C2=A0#define cpu_list m68k_cpu_list<br>
<br>
=C2=A0/* MMU modes definitions */<br>
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h<br>
index 40401c33b7..13ed3cd4dd 100644<br>
--- a/target/microblaze/cpu.h<br>
+++ b/target/microblaze/cpu.h<br>
@@ -385,16 +385,9 @@ static inline void mb_cpu_write_msr(CPUMBState *env, u=
int32_t val)<br>
=C2=A0}<br>
<br>
=C2=A0void mb_tcg_init(void);<br>
-/* you can call this signal handler from your SIGBUS and SIGSEGV<br>
-=C2=A0 =C2=A0signal handlers to inform the virtual CPU of exceptions. non =
zero<br>
-=C2=A0 =C2=A0is returned if the signal was handled by the virtual CPU.=C2=
=A0 */<br>
-int cpu_mb_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 void *puc);<br>
<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_MICROBLAZE_CPU<br>
<br>
-#define cpu_signal_handler cpu_mb_signal_handler<br>
-<br>
=C2=A0/* MMU modes definitions */<br>
=C2=A0#define MMU_NOMMU_IDX=C2=A0 =C2=A00<br>
=C2=A0#define MMU_KERNEL_IDX=C2=A0 1<br>
diff --git a/target/mips/cpu.h b/target/mips/cpu.h<br>
index 1dfe69c6c0..56b1cbd091 100644<br>
--- a/target/mips/cpu.h<br>
+++ b/target/mips/cpu.h<br>
@@ -1193,7 +1193,6 @@ struct MIPSCPU {<br>
<br>
=C2=A0void mips_cpu_list(void);<br>
<br>
-#define cpu_signal_handler cpu_mips_signal_handler<br>
=C2=A0#define cpu_list mips_cpu_list<br>
<br>
=C2=A0extern void cpu_wrdsp(uint32_t rs, uint32_t mask_num, CPUMIPSState *e=
nv);<br>
@@ -1277,8 +1276,6 @@ enum {<br>
=C2=A0 */<br>
=C2=A0#define CPU_INTERRUPT_WAKE CPU_INTERRUPT_TGT_INT_0<br>
<br>
-int cpu_mips_signal_handler(int host_signum, void *pinfo, void *puc);<br>
-<br>
=C2=A0#define MIPS_CPU_TYPE_SUFFIX &quot;-&quot; TYPE_MIPS_CPU<br>
=C2=A0#define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_MIPS_CPU<br>
diff --git a/target/mips/internal.h b/target/mips/internal.h<br>
index eecdd10116..daddb05fd4 100644<br>
--- a/target/mips/internal.h<br>
+++ b/target/mips/internal.h<br>
@@ -156,8 +156,6 @@ extern const VMStateDescription vmstate_mips_cpu;<br>
<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
<br>
-#define cpu_signal_handler cpu_mips_signal_handler<br>
-<br>
=C2=A0static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return (env-&gt;CP0_Status &amp; (1 &lt;&lt; CP0St_IE))=
 &amp;&amp;<br>
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h<br>
index 2ab82fdc71..88a511209c 100644<br>
--- a/target/nios2/cpu.h<br>
+++ b/target/nios2/cpu.h<br>
@@ -193,7 +193,6 @@ struct Nios2CPU {<br>
<br>
=C2=A0void nios2_tcg_init(void);<br>
=C2=A0void nios2_cpu_do_interrupt(CPUState *cs);<br>
-int cpu_nios2_signal_handler(int host_signum, void *pinfo, void *puc);<br>
=C2=A0void dump_mmu(CPUNios2State *env);<br>
=C2=A0void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);<br>
=C2=A0hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
@@ -206,7 +205,6 @@ void do_nios2_semihosting(CPUNios2State *env);<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_NIOS2_CPU<br>
<br>
=C2=A0#define cpu_gen_code cpu_nios2_gen_code<br>
-#define cpu_signal_handler cpu_nios2_signal_handler<br>
<br>
=C2=A0#define CPU_SAVE_VERSION 1<br>
<br>
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h<br>
index be6df81a81..187a4a114e 100644<br>
--- a/target/openrisc/cpu.h<br>
+++ b/target/openrisc/cpu.h<br>
@@ -320,11 +320,9 @@ void openrisc_translate_init(void);<br>
=C2=A0bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bool probe, uintptr_t retaddr);<br>
-int cpu_openrisc_signal_handler(int host_signum, void *pinfo, void *puc);<=
br>
=C2=A0int print_insn_or1k(bfd_vma addr, disassemble_info *info);<br>
<br>
=C2=A0#define cpu_list cpu_openrisc_list<br>
-#define cpu_signal_handler cpu_openrisc_signal_handler<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
=C2=A0extern const VMStateDescription vmstate_openrisc_cpu;<br>
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h<br>
index 362e7c4c5c..01d3773bc7 100644<br>
--- a/target/ppc/cpu.h<br>
+++ b/target/ppc/cpu.h<br>
@@ -1278,12 +1278,6 @@ extern const VMStateDescription vmstate_ppc_cpu;<br>
<br>
=C2=A0/********************************************************************=
*********/<br>
=C2=A0void ppc_translate_init(void);<br>
-/*<br>
- * you can call this signal handler from your SIGBUS and SIGSEGV<br>
- * signal handlers to inform the virtual CPU of exceptions. non zero<br>
- * is returned if the signal was handled by the virtual CPU.<br>
- */<br>
-int cpu_ppc_signal_handler(int host_signum, void *pinfo, void *puc);<br>
=C2=A0bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bool probe, uintptr_t retaddr);<br>
@@ -1371,7 +1365,6 @@ int ppc_dcr_write(ppc_dcr_t *dcr_env, int dcrn, uint3=
2_t val);<br>
=C2=A0#define POWERPC_CPU_TYPE_NAME(model) model POWERPC_CPU_TYPE_SUFFIX<br=
>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_POWERPC_CPU<br>
<br>
-#define cpu_signal_handler cpu_ppc_signal_handler<br>
=C2=A0#define cpu_list ppc_cpu_list<br>
<br>
=C2=A0/* MMU modes definitions */<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index e735e53e26..465142616a 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -356,7 +356,6 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwad=
dr physaddr,<br>
=C2=A0char *riscv_isa_string(RISCVCPU *cpu);<br>
=C2=A0void riscv_cpu_list(void);<br>
<br>
-#define cpu_signal_handler riscv_cpu_signal_handler<br>
=C2=A0#define cpu_list riscv_cpu_list<br>
=C2=A0#define cpu_mmu_index riscv_cpu_mmu_index<br>
<br>
@@ -372,7 +371,6 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64=
_t (*fn)(uint32_t),<br>
=C2=A0void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);<br=
>
<br>
=C2=A0void riscv_translate_init(void);<br>
-int riscv_cpu_signal_handler(int host_signum, void *pinfo, void *puc);<br>
=C2=A0void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
int32_t exception, uintptr_t pc);<br>
<br>
diff --git a/target/rx/cpu.h b/target/rx/cpu.h<br>
index faa3606f52..4ac71aec37 100644<br>
--- a/target/rx/cpu.h<br>
+++ b/target/rx/cpu.h<br>
@@ -134,13 +134,9 @@ int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *=
buf, int reg);<br>
=C2=A0hwaddr rx_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
<br>
=C2=A0void rx_translate_init(void);<br>
-int cpu_rx_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *puc);<br>
-<br>
=C2=A0void rx_cpu_list(void);<br>
=C2=A0void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte);<br>
<br>
-#define cpu_signal_handler cpu_rx_signal_handler<br>
=C2=A0#define cpu_list rx_cpu_list<br>
<br>
=C2=A0#include &quot;exec/cpu-all.h&quot;<br>
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h<br>
index b26ae8fff2..3153d053e9 100644<br>
--- a/target/s390x/cpu.h<br>
+++ b/target/s390x/cpu.h<br>
@@ -809,13 +809,6 @@ void s390_set_qemu_cpu_model(uint16_t type, uint8_t ge=
n, uint8_t ec_ga,<br>
=C2=A0#define S390_CPU_TYPE_NAME(name) (name S390_CPU_TYPE_SUFFIX)<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_S390_CPU<br>
<br>
-/* you can call this signal handler from your SIGBUS and SIGSEGV<br>
-=C2=A0 =C2=A0signal handlers to inform the virtual CPU of exceptions. non =
zero<br>
-=C2=A0 =C2=A0is returned if the signal was handled by the virtual CPU.=C2=
=A0 */<br>
-int cpu_s390x_signal_handler(int host_signum, void *pinfo, void *puc);<br>
-#define cpu_signal_handler cpu_s390x_signal_handler<br>
-<br>
-<br>
=C2=A0/* interrupt.c */<br>
=C2=A0#define RA_IGNORED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 0<br>
=C2=A0void s390_program_interrupt(CPUS390XState *env, uint32_t code, uintpt=
r_t ra);<br>
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h<br>
index 017a770214..56f7c32df9 100644<br>
--- a/target/sh4/cpu.h<br>
+++ b/target/sh4/cpu.h<br>
@@ -213,8 +213,6 @@ void superh_cpu_do_unaligned_access(CPUState *cpu, vadd=
r addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_idx, uin=
tptr_t retaddr);<br>
<br>
=C2=A0void sh4_translate_init(void);<br>
-int cpu_sh4_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *puc);<br>
=C2=A0bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bool probe, uintptr_t retaddr);<br>
@@ -250,7 +248,6 @@ void cpu_load_tlb(CPUSH4State * env);<br>
=C2=A0#define SUPERH_CPU_TYPE_NAME(model) model SUPERH_CPU_TYPE_SUFFIX<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_SUPERH_CPU<br>
<br>
-#define cpu_signal_handler cpu_sh4_signal_handler<br>
=C2=A0#define cpu_list sh4_cpu_list<br>
<br>
=C2=A0/* MMU modes definitions */<br>
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h<br>
index ff8ae73002..6b40d02237 100644<br>
--- a/target/sparc/cpu.h<br>
+++ b/target/sparc/cpu.h<br>
@@ -649,13 +649,11 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, =
target_ulong addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int mmu_idx);<br>
=C2=A0#endif<br>
=C2=A0#endif<br>
-int cpu_sparc_signal_handler(int host_signum, void *pinfo, void *puc);<br>
<br>
=C2=A0#define SPARC_CPU_TYPE_SUFFIX &quot;-&quot; TYPE_SPARC_CPU<br>
=C2=A0#define SPARC_CPU_TYPE_NAME(model) model SPARC_CPU_TYPE_SUFFIX<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_SPARC_CPU<br>
<br>
-#define cpu_signal_handler cpu_sparc_signal_handler<br>
=C2=A0#define cpu_list sparc_cpu_list<br>
<br>
=C2=A0/* MMU modes definitions */<br>
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h<br>
index 4b61a2c03f..c461387e71 100644<br>
--- a/target/tricore/cpu.h<br>
+++ b/target/tricore/cpu.h<br>
@@ -362,7 +362,6 @@ void fpu_set_state(CPUTriCoreState *env);<br>
<br>
=C2=A0void tricore_cpu_list(void);<br>
<br>
-#define cpu_signal_handler cpu_tricore_signal_handler<br>
=C2=A0#define cpu_list tricore_cpu_list<br>
<br>
=C2=A0static inline int cpu_mmu_index(CPUTriCoreState *env, bool ifetch)<br=
>
@@ -377,7 +376,6 @@ typedef TriCoreCPU ArchCPU;<br>
<br>
=C2=A0void cpu_state_reset(CPUTriCoreState *s);<br>
=C2=A0void tricore_tcg_init(void);<br>
-int cpu_tricore_signal_handler(int host_signum, void *pinfo, void *puc);<b=
r>
<br>
=C2=A0static inline void cpu_get_tb_cpu_state(CPUTriCoreState *env, target_=
ulong *pc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ta=
rget_ulong *cs_base, uint32_t *flags)<br>
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h<br>
index cbb720e7cc..646965f379 100644<br>
--- a/target/xtensa/cpu.h<br>
+++ b/target/xtensa/cpu.h<br>
@@ -584,7 +584,6 @@ void xtensa_cpu_do_unaligned_access(CPUState *cpu, vadd=
r addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType ac=
cess_type,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_idx, uin=
tptr_t retaddr);<br>
<br>
-#define cpu_signal_handler cpu_xtensa_signal_handler<br>
=C2=A0#define cpu_list xtensa_cpu_list<br>
<br>
=C2=A0#define XTENSA_CPU_TYPE_SUFFIX &quot;-&quot; TYPE_XTENSA_CPU<br>
@@ -613,7 +612,6 @@ void check_interrupts(CPUXtensaState *s);<br>
=C2=A0void xtensa_irq_init(CPUXtensaState *env);<br>
=C2=A0qemu_irq *xtensa_get_extints(CPUXtensaState *env);<br>
=C2=A0qemu_irq xtensa_get_runstall(CPUXtensaState *env);<br>
-int cpu_xtensa_signal_handler(int host_signum, void *pinfo, void *puc);<br=
>
=C2=A0void xtensa_cpu_list(void);<br>
=C2=A0void xtensa_sync_window_from_phys(CPUXtensaState *env);<br>
=C2=A0void xtensa_sync_phys_from_window(CPUXtensaState *env);<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000c5f88505cc0aeb45--

