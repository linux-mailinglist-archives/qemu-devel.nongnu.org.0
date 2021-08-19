Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8713F133A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 08:20:41 +0200 (CEST)
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGbPt-0004Au-05
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 02:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbOZ-00024O-9x
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 02:19:19 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:45848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbOW-0006EE-Ok
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 02:19:19 -0400
Received: by mail-io1-xd34.google.com with SMTP id e186so6202561iof.12
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 23:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zcc2tEAuuG5WGi7JEB/JaPUoew3eiEtgAPWqDB5rZyU=;
 b=CZoDdZaBQSByKL/20+iQGWI2lCfGvoTKHYyK6PvVLtZwyFm79qlDb7//lzB+tSPVCi
 Zwr7+sCijYs/bi/RzpaUFEDWAW0Rg1J7ffvPIOwj5KBnp4ecFqluWTtbe1vtPUoURTJI
 H0wlf+kg+H9/YDhf/Ab/qXWZUIyqCAL09RRJmBpp86OcyiDZzyCIRICTwn1ZtJlwoqsX
 89bCzzff3efMZDS3EO3L3BUza1VGpiNkbWMoD1hZzXdIawC/0CLsLYTZJUz5qqPksFHh
 Y2XBIaFbLHTtgwtqasGug3EvGsbKSxLyvGXY05kaAY1zEMnFRqMgduRJ0p4wQLjIjoMk
 CUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zcc2tEAuuG5WGi7JEB/JaPUoew3eiEtgAPWqDB5rZyU=;
 b=BF7U0ZP879/1mWghCFpCUQYFgyCf5oJpl3Nos2+YKDyFqcQQ/Lu/7Sprvu+wzJPuUh
 8GyYi2xkVv81on6EwBf+J+znhYJM9zKdrwKLcmQu7wTFT3SFgxPvC7CcZXgZm4Nzl4iu
 tnrcXwwYkD9XmUf08WmGbvVJLLuL3qkhFeoFj8x9VzR5FtJhIfxwQ0egxbT6HKs8wymr
 gizcvC6F9srhw4f8WAcz/iT8ohR9+n06b8uDMsDsXk2cZ8HWrwiVAO8PIhuWn/6gYwJk
 tzmvvRePZIpmIkPAH9Ghi9D6+w14f/3uotXK4K8vx4PVcHQl3nHG7H1yyQyEEgSPJGFQ
 0Pug==
X-Gm-Message-State: AOAM532u/YBX06RLXFuER8GMfjeGvlZiDdyUHrMN0IeqUP0rLggq5v9T
 bRL5tRkVJPnJ/CM3tvQ98maa/q9m/INhkUdx2sA=
X-Google-Smtp-Source: ABdhPJxLbJdCq7DgosmnWEuIL2QA3jeeIGoDpljNiSdzWgel6uCk8gLe9ksRdD1ON8aQf/49beTrcbnS6ig6MPc7PiQ=
X-Received: by 2002:a5d:8e19:: with SMTP id e25mr10412755iod.175.1629353955689; 
 Wed, 18 Aug 2021 23:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-59-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-59-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Aug 2021 16:18:49 +1000
Message-ID: <CAKmqyKPLL7JN0QWZV39Ju2iVgjyXY2fYg+5xq58Q-i-pVXTNew@mail.gmail.com>
Subject: Re: [PATCH v3 58/66] include/exec: Move cpu_signal_handler declaration
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19, 2021 at 6:14 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is nothing target specific about this.  The implementation
> is host specific, but the declaration is 100% common.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 5d1b6d80fb..9d5987ba04 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -662,6 +662,19 @@ static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
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
> index d9099ea188..dfa34f93b4 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -287,7 +287,6 @@ void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
>                                     uintptr_t retaddr) QEMU_NORETURN;
>
>  #define cpu_list alpha_cpu_list
> -#define cpu_signal_handler cpu_alpha_signal_handler
>
>  typedef CPUAlphaState CPUArchState;
>  typedef AlphaCPU ArchCPU;
> @@ -442,11 +441,6 @@ void alpha_translate_init(void);
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
> index 9f0a5f84d5..48f0cc490e 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1117,12 +1117,6 @@ static inline bool is_a64(CPUARMState *env)
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
> @@ -3002,7 +2996,6 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
>  #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
>  #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
>
> -#define cpu_signal_handler cpu_arm_signal_handler
>  #define cpu_list arm_cpu_list
>
>  /* ARM has the following "translation regimes" (as the ARM ARM calls them):
> diff --git a/target/avr/cpu.h b/target/avr/cpu.h
> index 93e3faa0a9..dceacf3cd7 100644
> --- a/target/avr/cpu.h
> +++ b/target/avr/cpu.h
> @@ -175,7 +175,6 @@ static inline void set_avr_feature(CPUAVRState *env, int feature)
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
> index d3b6492909..c87987e95c 100644
> --- a/target/cris/cpu.h
> +++ b/target/cris/cpu.h
> @@ -199,12 +199,6 @@ int crisv10_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
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
> index bde538fd5c..f90c187888 100644
> --- a/target/hexagon/cpu.h
> +++ b/target/hexagon/cpu.h
> @@ -129,9 +129,6 @@ typedef struct HexagonCPU {
>
>  #include "cpu_bits.h"
>
> -#define cpu_signal_handler cpu_hexagon_signal_handler
> -int cpu_hexagon_signal_handler(int host_signum, void *pinfo, void *puc);
> -
>  static inline void cpu_get_tb_cpu_state(CPUHexagonState *env, target_ulong *pc,
>                                          target_ulong *cs_base, uint32_t *flags)
>  {
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index 332ca5de62..1a0907ec0f 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -322,9 +322,6 @@ static inline void cpu_hppa_change_prot_id(CPUHPPAState *env) { }
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
> index 6c50d3ab4f..7045e46af4 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1940,12 +1940,6 @@ void cpu_x86_frstor(CPUX86State *s, target_ulong ptr, int data32);
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
> @@ -2011,7 +2005,6 @@ uint64_t cpu_get_tsc(CPUX86State *env);
>  #define TARGET_DEFAULT_CPU_TYPE X86_CPU_TYPE_NAME("qemu32")
>  #endif
>
> -#define cpu_signal_handler cpu_x86_signal_handler
>  #define cpu_list x86_cpu_list
>
>  /* MMU modes definitions */
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 997d588911..da7b6b2fab 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -175,13 +175,6 @@ int m68k_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
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
> @@ -561,7 +554,6 @@ enum {
>  #define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_M68K_CPU
>
> -#define cpu_signal_handler cpu_m68k_signal_handler
>  #define cpu_list m68k_cpu_list
>
>  /* MMU modes definitions */
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index 620c3742e1..bda697494b 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -383,16 +383,9 @@ static inline void mb_cpu_write_msr(CPUMBState *env, uint32_t val)
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
> index 27227b1e88..a80587338a 100644
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
> index 82cbaeb4f8..456a0cb1a7 100644
> --- a/target/openrisc/cpu.h
> +++ b/target/openrisc/cpu.h
> @@ -322,11 +322,9 @@ void openrisc_translate_init(void);
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
> index 93d308ac8f..8e39f03bd0 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1278,12 +1278,6 @@ extern const VMStateDescription vmstate_ppc_cpu;
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
> @@ -1362,7 +1356,6 @@ int ppc_dcr_write(ppc_dcr_t *dcr_env, int dcrn, uint32_t val);
>  #define POWERPC_CPU_TYPE_NAME(model) model POWERPC_CPU_TYPE_SUFFIX
>  #define CPU_RESOLVING_TYPE TYPE_POWERPC_CPU
>
> -#define cpu_signal_handler cpu_ppc_signal_handler
>  #define cpu_list ppc_cpu_list
>
>  /* MMU modes definitions */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a5b0047bfd..4b1141e0d1 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -357,7 +357,6 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>  char *riscv_isa_string(RISCVCPU *cpu);
>  void riscv_cpu_list(void);
>
> -#define cpu_signal_handler riscv_cpu_signal_handler
>  #define cpu_list riscv_cpu_list
>  #define cpu_mmu_index riscv_cpu_mmu_index
>
> @@ -372,7 +371,6 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
>
>  void riscv_translate_init(void);
> -int riscv_cpu_signal_handler(int host_signum, void *pinfo, void *puc);
>  void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
>                                           uint32_t exception, uintptr_t pc);
>
> diff --git a/target/rx/cpu.h b/target/rx/cpu.h
> index 0b4b998c7b..56f99826ea 100644
> --- a/target/rx/cpu.h
> +++ b/target/rx/cpu.h
> @@ -132,13 +132,9 @@ int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
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
> @@ -809,13 +809,6 @@ void s390_set_qemu_cpu_model(uint16_t type, uint8_t gen, uint8_t ec_ga,
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
>  void s390_program_interrupt(CPUS390XState *env, uint32_t code, uintptr_t ra);
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index 5f2dc551e3..d7ac67e0d3 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -216,8 +216,6 @@ void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
>                                      uintptr_t retaddr) QEMU_NORETURN;
>
>  void sh4_translate_init(void);
> -int cpu_sh4_signal_handler(int host_signum, void *pinfo,
> -                           void *puc);
>  bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                           MMUAccessType access_type, int mmu_idx,
>                           bool probe, uintptr_t retaddr);
> @@ -251,7 +249,6 @@ void cpu_load_tlb(CPUSH4State * env);
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
> @@ -649,13 +649,11 @@ hwaddr cpu_get_phys_page_nofault(CPUSPARCState *env, target_ulong addr,
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
>  static inline void cpu_get_tb_cpu_state(CPUTriCoreState *env, target_ulong *pc,
>                                          target_ulong *cs_base, uint32_t *flags)
> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index aa9c77d719..029a331f7e 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -582,7 +582,6 @@ void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
>                                      MMUAccessType access_type, int mmu_idx,
>                                      uintptr_t retaddr) QEMU_NORETURN;
>
> -#define cpu_signal_handler cpu_xtensa_signal_handler
>  #define cpu_list xtensa_cpu_list
>
>  #define XTENSA_CPU_TYPE_SUFFIX "-" TYPE_XTENSA_CPU
> @@ -611,7 +610,6 @@ void check_interrupts(CPUXtensaState *s);
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

