Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 577A53DA078
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 11:42:43 +0200 (CEST)
Received: from localhost ([::1]:52600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m92Ys-000361-Aa
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 05:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m92XA-0001WG-Ds
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:40:56 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:34566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m92X7-0001H6-N3
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:40:56 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1156F1FF86;
 Thu, 29 Jul 2021 09:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627551651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h7DgrgJWjD6NJyTfXFvfBl8hr77hdShrdm2Vo9q9gWM=;
 b=J2Y4PQKxJkJ+8wforghLo/r8KumO85jQBcQZ5d1ij26ZEq9Z6nQJdQBgFNtXWPYnDp1BNz
 6RSM+M5Odl2wh+G6a/L4Jd1n2sObCfA96dz83CeDCDK7plB0GZTQS7Fvu3SnQfn4wrYTso
 yDjEIlBfis86u8YqBGlGS9scqV88fVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627551651;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h7DgrgJWjD6NJyTfXFvfBl8hr77hdShrdm2Vo9q9gWM=;
 b=Y0T1X3n4DdxAITJ5CBUX7s2HZr9nlgUkO48jDrxRQBxySTL9/9XKn+/LeogwHmz0yXRiRN
 QFEx970IGJ0M0+CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92B441348A;
 Thu, 29 Jul 2021 09:40:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FEzHHqJ3AmFfPwAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 29 Jul 2021 09:40:50 +0000
Subject: Re: modular tcg
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
 <4b5c010f-1365-e746-c269-9b9e48771f7b@suse.de>
 <6a3940a4-ca70-343b-5724-0f8f59d6fde4@suse.de>
 <20210723124858.rh63jh2esxahib4e@sirius.home.kraxel.org>
 <20210729091407.n7bdlyw5rsievdch@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d04c1456-e2fb-2b0d-e011-bcdafbacc9ba@suse.de>
Date: Thu, 29 Jul 2021 11:40:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210729091407.n7bdlyw5rsievdch@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 11:14 AM, Gerd Hoffmann wrote:
>   Hi,
> 
>>> So we need more work to make this actually work right.
>>
>> Yes.  I want have all of tcg in the tcg accel module, not only parts of
>> it, but that needs some more refactoring.  I'll go start looking at this
>> once I managed to wade through my vacation backlog.
> 
> So, changed the meson.build files to build tcg modular
> (https://git.kraxel.org/cgit/qemu/log/?h=sirius/modules-tcg-meson),
> then checked what unresolved symbols we have:
> 
> # -*- symbols -*-
>      18 tlb_flush
>       8 tb_flush
>       6 update_fp_status
>       6 cpu_restore_state
>       4 x86_register_ferr_irq
>       4 update_mxcsr_status
>       4 update_mxcsr_from_sse_status
>       4 tlb_flush_page
>       4 curr_cflags
>       3 cpu_cc_compute_all
>       2 tlb_reset_dirty
>       2 tlb_plugin_lookup
>       2 tcg_flush_softmmu_tlb
>       2 tcg_exec_unrealizefn
>       2 tcg_exec_realizefn
>       2 tb_invalidate_phys_range
>       2 tb_invalidate_phys_page_range
>       2 tb_check_watchpoint
>       2 cpu_x86_update_dr7
>       2 cpu_set_ignne
> # -*- files -*-
>      22 softmmu/physmem.c        tlb_flush tlb_flush_page curr_cflags tlb_reset_dirty tb_invalidate_phys_range tb_check_watchpoint cpu_restore_state
>      10 target/i386/helper.c     tlb_flush cpu_restore_state
>      15 cpu.c                    cpu_cc_compute_all tlb_flush tcg_flush_softmmu_tlb tcg_exec_unrealizefn tcg_exec_realizefn tb_invalidate_phys_page_range tb_flush
>       9 target/i386/cpu.h        update_fp_status cpu_cc_compute_all update_mxcsr_status
>       8 target/i386/machine.c    update_mxcsr_status update_fp_status tlb_flush cpu_x86_update_dr7
>       2 target/i386/gdbstub.c    update_mxcsr_from_sse_status
>       2 target/i386/cpu-dump.c   update_mxcsr_from_sse_status
>       2 plugins/loader.c         tb_flush
>       2 plugins/core.c           tb_flush
>       2 plugins/api.c            tlb_plugin_lookup
>       2 i386/pc_q35.c            x86_register_ferr_irq
>       2 i386/pc_piix.c           x86_register_ferr_irq
>       2 i386/pc.c                cpu_set_ignne
>       4 gdbstub.c                update_mxcsr_from_sse_status tb_flush
>       2 core/cpu-common.c        tcg_flush_softmmu_tlb
>       2 accel/tcg/cpu-exec-common.c cpu_restore_state
> 
> It's basically two groups:
> 
>  * Arch-specific (functions taking CPUX86State as argument), most of the
>    unresolved symbols in target/i386/ and i386/ directories go into this
>    category.

Yes, and we need to think about all targets, not just i386.

>  * Common (functions taking CPUState as argument).  Everything else.
> 
> The common functions could be added TCGCPUOps to allow them being called via

TCGCCPUOps are target-specific in their implementation, so I guess it's the arch specific part that could be TCGCPUOps (maybe, would need deep thinking).

> CPUClass->tcg_ops->$name instead of a direct symbol reference.  Not sure this
> is a good idea though.  Experimental patch covering tcg_exec_realizefn +
> tcg_exec_unrealizefn below.
> 
> No idea yet how to handle arch-specific bits best.  Seems there is no existing
> infrastructure to untangle target-specific code and tcg, so this probably needs
> something new.

We need target-specific modules. They could at the beginning absorb also the non-target specific parts in my view.
So you have a big tcg-arm module, a tcg-i386 module etc.

I think I sketched already the idea in the Makefile I shared before?


> 
> Noticed softmmu/physmem.c has lots of CONFIG_TCG #ifdefs, splitting this into
> softmmu/physmem-{common,tcg}.c is probably a good idea.
> 
> Comments?
> 
> take care,
>   Gerd
> 
> From c0e3f4cbe6aa6889d344beb4cac300b160253f00 Mon Sep 17 00:00:00 2001
> From: Gerd Hoffmann <kraxel@redhat.com>
> Date: Thu, 29 Jul 2021 09:14:56 +0200
> Subject: [PATCH] tcg: add tcg_exec_{realizefn,unrealizefn} to TCGCPUOps
> 
> ---
>  include/hw/core/tcg-cpu-ops.h |  7 +++++++
>  cpu.c                         | 23 +++++++++++------------
>  target/alpha/cpu.c            |  1 +
>  target/arm/cpu.c              |  1 +
>  target/arm/cpu_tcg.c          |  1 +
>  target/avr/cpu.c              |  1 +
>  target/cris/cpu.c             |  1 +
>  target/hexagon/cpu.c          |  1 +
>  target/hppa/cpu.c             |  1 +
>  target/i386/tcg/tcg-cpu.c     |  1 +
>  target/m68k/cpu.c             |  1 +
>  target/microblaze/cpu.c       |  1 +
>  target/mips/cpu.c             |  1 +
>  target/nios2/cpu.c            |  1 +
>  target/openrisc/cpu.c         |  1 +
>  target/ppc/cpu_init.c         |  1 +
>  target/riscv/cpu.c            |  1 +
>  target/rx/cpu.c               |  1 +
>  target/s390x/cpu.c            |  1 +
>  target/sh4/cpu.c              |  1 +
>  target/sparc/cpu.c            |  1 +
>  target/tricore/cpu.c          |  1 +
>  target/xtensa/cpu.c           |  1 +
>  23 files changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index eab27d0c0309..1f33953a4efc 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -107,6 +107,13 @@ struct TCGCPUOps {
>  #endif /* CONFIG_SOFTMMU */
>  #endif /* NEED_CPU_H */
>  
> +    void (*exec_realizefn)(CPUState *cpu, Error **errp);
> +    void (*exec_unrealizefn)(CPUState *cpu);
>  };
>  
> +#define TCG_CPU_OPS_COMMON \
> +    .exec_realizefn = tcg_exec_realizefn, \
> +    .exec_unrealizefn = tcg_exec_unrealizefn
> +
> +
>  #endif /* TCG_CPU_OPS_H */
> diff --git a/cpu.c b/cpu.c
> index e1799a15bcf5..982463ce7418 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -40,6 +40,10 @@
>  #include "hw/core/accel-cpu.h"
>  #include "trace/trace-root.h"
>  
> +#ifdef CONFIG_TCG
> +#include "hw/core/tcg-cpu-ops.h"
> +#endif /* CONFIG_TCG */
> +
>  uintptr_t qemu_host_page_size;
>  intptr_t qemu_host_page_mask;
>  
> @@ -129,20 +133,17 @@ const VMStateDescription vmstate_cpu_common = {
>  
>  void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>  {
> -#ifndef CONFIG_USER_ONLY
>      CPUClass *cc = CPU_GET_CLASS(cpu);
> -#endif
>  
>      cpu_list_add(cpu);
>      if (!accel_cpu_realizefn(cpu, errp)) {
>          return;
>      }
> -#ifdef CONFIG_TCG
> +
>      /* NB: errp parameter is unused currently */
> -    if (tcg_enabled()) {
> -        tcg_exec_realizefn(cpu, errp);
> +    if (cc->tcg_ops) {
> +        cc->tcg_ops->exec_realizefn(cpu, errp);
>      }
> -#endif /* CONFIG_TCG */
>  
>  #ifdef CONFIG_USER_ONLY
>      assert(qdev_get_vmsd(DEVICE(cpu)) == NULL ||
> @@ -159,9 +160,9 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>  
>  void cpu_exec_unrealizefn(CPUState *cpu)
>  {
> -#ifndef CONFIG_USER_ONLY
>      CPUClass *cc = CPU_GET_CLASS(cpu);
>  
> +#ifndef CONFIG_USER_ONLY
>      if (cc->sysemu_ops->legacy_vmsd != NULL) {
>          vmstate_unregister(NULL, cc->sysemu_ops->legacy_vmsd, cpu);
>      }
> @@ -169,12 +170,10 @@ void cpu_exec_unrealizefn(CPUState *cpu)
>          vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
>      }
>  #endif
> -#ifdef CONFIG_TCG
> -    /* NB: errp parameter is unused currently */
> -    if (tcg_enabled()) {
> -        tcg_exec_unrealizefn(cpu);
> +
> +    if (cc->tcg_ops) {
> +        cc->tcg_ops->exec_unrealizefn(cpu);
>      }
> -#endif /* CONFIG_TCG */
>  
>      cpu_list_remove(cpu);
>  }
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 4871ad0c0a6a..715fb97d6707 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -226,6 +226,7 @@ static const struct TCGCPUOps alpha_tcg_ops = {
>      .do_transaction_failed = alpha_cpu_do_transaction_failed,
>      .do_unaligned_access = alpha_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void alpha_cpu_class_init(ObjectClass *oc, void *data)
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2866dd765882..7f051bd24e0b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1996,6 +1996,7 @@ static const struct TCGCPUOps arm_tcg_ops = {
>      .debug_check_watchpoint = arm_debug_check_watchpoint,
>      .debug_check_breakpoint = arm_debug_check_breakpoint,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  #endif /* CONFIG_TCG */
>  
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index ed444bf436a4..0f8657ede860 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -913,6 +913,7 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
>      .debug_check_watchpoint = arm_debug_check_watchpoint,
>      .debug_check_breakpoint = arm_debug_check_breakpoint,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  #endif /* CONFIG_TCG */
>  
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index ea14175ca557..8b3261ef832c 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -201,6 +201,7 @@ static const struct TCGCPUOps avr_tcg_ops = {
>  #ifndef CONFIG_USER_ONLY
>      .do_interrupt = avr_cpu_do_interrupt,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void avr_cpu_class_init(ObjectClass *oc, void *data)
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index 70932b1f8c7d..32ca1051f050 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -221,6 +221,7 @@ static const struct TCGCPUOps crisv32_tcg_ops = {
>  #ifndef CONFIG_USER_ONLY
>      .do_interrupt = cris_cpu_do_interrupt,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void crisv8_cpu_class_init(ObjectClass *oc, void *data)
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index 3338365c16ec..86c001b67484 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -273,6 +273,7 @@ static const struct TCGCPUOps hexagon_tcg_ops = {
>      .initialize = hexagon_translate_init,
>      .synchronize_from_tb = hexagon_cpu_synchronize_from_tb,
>      .tlb_fill = hexagon_tlb_fill,
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void hexagon_cpu_class_init(ObjectClass *c, void *data)
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 2eace4ee1240..5163118e986d 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -151,6 +151,7 @@ static const struct TCGCPUOps hppa_tcg_ops = {
>      .do_interrupt = hppa_cpu_do_interrupt,
>      .do_unaligned_access = hppa_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void hppa_cpu_class_init(ObjectClass *oc, void *data)
> diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
> index 93a79a574154..bf7d91fed6da 100644
> --- a/target/i386/tcg/tcg-cpu.c
> +++ b/target/i386/tcg/tcg-cpu.c
> @@ -79,6 +79,7 @@ static const struct TCGCPUOps x86_tcg_ops = {
>      .debug_excp_handler = breakpoint_handler,
>      .debug_check_breakpoint = x86_debug_check_breakpoint,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void tcg_cpu_init_ops(AccelCPUClass *accel_cpu, CPUClass *cc)
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 72de6e972627..df06c07907d6 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -522,6 +522,7 @@ static const struct TCGCPUOps m68k_tcg_ops = {
>      .do_interrupt = m68k_cpu_do_interrupt,
>      .do_transaction_failed = m68k_cpu_transaction_failed,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void m68k_cpu_class_init(ObjectClass *c, void *data)
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 72d8f2a0daa6..0e781264ef7b 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -373,6 +373,7 @@ static const struct TCGCPUOps mb_tcg_ops = {
>      .do_transaction_failed = mb_cpu_transaction_failed,
>      .do_unaligned_access = mb_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void mb_cpu_class_init(ObjectClass *oc, void *data)
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index d426918291a9..3216a33d0047 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -548,6 +548,7 @@ static const struct TCGCPUOps mips_tcg_ops = {
>      .do_unaligned_access = mips_cpu_do_unaligned_access,
>      .io_recompile_replay_branch = mips_io_recompile_replay_branch,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  #endif /* CONFIG_TCG */
>  
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 5e37defef805..55e21e8cd414 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -226,6 +226,7 @@ static const struct TCGCPUOps nios2_tcg_ops = {
>      .do_interrupt = nios2_cpu_do_interrupt,
>      .do_unaligned_access = nios2_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void nios2_cpu_class_init(ObjectClass *oc, void *data)
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index bd34e429ecbf..0d9e1aa58a8f 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -192,6 +192,7 @@ static const struct TCGCPUOps openrisc_tcg_ops = {
>  #ifndef CONFIG_USER_ONLY
>      .do_interrupt = openrisc_cpu_do_interrupt,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 505a0ed6ac09..3f8bf2e3fcbf 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -9021,6 +9021,7 @@ static const struct TCGCPUOps ppc_tcg_ops = {
>    .cpu_exec_exit = ppc_cpu_exec_exit,
>    .do_unaligned_access = ppc_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  #endif /* CONFIG_TCG */
>  
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 991a6bb7604f..6a129b4fe211 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -650,6 +650,7 @@ static const struct TCGCPUOps riscv_tcg_ops = {
>      .do_transaction_failed = riscv_cpu_do_transaction_failed,
>      .do_unaligned_access = riscv_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void riscv_cpu_class_init(ObjectClass *c, void *data)
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index 96cc96e514fe..7a1ebc694f22 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -192,6 +192,7 @@ static const struct TCGCPUOps rx_tcg_ops = {
>  #ifndef CONFIG_USER_ONLY
>      .do_interrupt = rx_cpu_do_interrupt,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void rx_cpu_class_init(ObjectClass *klass, void *data)
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 7b7b05f1d3a0..8dfcde1590c0 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -274,6 +274,7 @@ static const struct TCGCPUOps s390_tcg_ops = {
>      .debug_excp_handler = s390x_cpu_debug_excp_handler,
>      .do_unaligned_access = s390x_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  #endif /* CONFIG_TCG */
>  
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index 832692294211..0b4e03913656 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -244,6 +244,7 @@ static const struct TCGCPUOps superh_tcg_ops = {
>      .do_unaligned_access = superh_cpu_do_unaligned_access,
>      .io_recompile_replay_branch = superh_io_recompile_replay_branch,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void superh_cpu_class_init(ObjectClass *oc, void *data)
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index da6b30ec747a..2b2d2946223b 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -871,6 +871,7 @@ static const struct TCGCPUOps sparc_tcg_ops = {
>      .do_transaction_failed = sparc_cpu_do_transaction_failed,
>      .do_unaligned_access = sparc_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  #endif /* CONFIG_TCG */
>  
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index b95682b7f04d..daeaecca26e0 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -154,6 +154,7 @@ static const struct TCGCPUOps tricore_tcg_ops = {
>      .initialize = tricore_tcg_init,
>      .synchronize_from_tb = tricore_cpu_synchronize_from_tb,
>      .tlb_fill = tricore_cpu_tlb_fill,
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void tricore_cpu_class_init(ObjectClass *c, void *data)
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index 58ec3a086224..d7d1b967040b 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -201,6 +201,7 @@ static const struct TCGCPUOps xtensa_tcg_ops = {
>      .do_transaction_failed = xtensa_cpu_do_transaction_failed,
>      .do_unaligned_access = xtensa_cpu_do_unaligned_access,
>  #endif /* !CONFIG_USER_ONLY */
> +    TCG_CPU_OPS_COMMON,
>  };
>  
>  static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
> 


