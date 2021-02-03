Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3696230DC9E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:25:09 +0100 (CET)
Received: from localhost ([::1]:45422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7J5g-00049K-6P
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7J1T-0000s3-10
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:20:47 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7J1O-0006V8-Cx
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:20:46 -0500
Received: by mail-wm1-x334.google.com with SMTP id i9so5414913wmq.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 06:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=liyH6NBuoqCulVaiWBYsgccmT15TzIRguTAYoec/TvI=;
 b=FovPgCFJR30ewwqiwn4AC3ZMHiYbrD6QfggdhqPO7a+4RQNm+n4a2y/JOwrLeldfmB
 EXC+2b/IWjXOCioipvxhTVqfymKxPvQFwRMJXA/GUmORlK4nuFRKmK9BobyumN/E2YAm
 i8W+cxDbdLhslS7VV+5Wl41h/hSVwKbHa3GXvCwncE6IgyP7U4s3Vx0utugwUfKNvNyF
 EODiGPgYYFrNNAnbybm6Y2ErWFqKCPYCOyaumJn9itIhSTOP1GJPlegS9WIFhvoSKzBP
 64KWBfIvC6ndJGD8JwZ7ZMxYc2lecZlAd0K4DRyAkbYgvsoU6SewgQNR5Ff5hDUB4FSD
 jQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=liyH6NBuoqCulVaiWBYsgccmT15TzIRguTAYoec/TvI=;
 b=jQj+WZx7Z3j5KuyPXpaeuGJ1ZLibeIxoj43PZyPGgTp1e2ZnXTmSUXVuseA9lPAV4h
 x+waBX6NQEjTR6FvbWj9Q0BHK8Nl3Xsfr9AElVZTjQ2DskRnn3iqZNgpGpjWO/AzGj3a
 qTbldooqePBACNi+IVlconLiYcC1jo0ZY2iH/tfnxPMbK/4FRDjOsKuy0tuTw4oJK4BO
 3YEjniTbte+pUKU97pca4BfIaC2GGzE5I6WC8C92byr+7rx1KHayybEKV5PKH4O8TyXt
 jMyyMau5IWtd6UW71s0Ub12mI2AjALLu09T0fM7JRwDR623GZKOvU1AH3PS2yzwpwSlz
 PaEw==
X-Gm-Message-State: AOAM531wPRu4JkWHTznfBtBP93YeNLtpwZ0k8IzSgtY2LpskzV6pXIB3
 BTBhttAjMd6NaFj8slPC/C16Cw==
X-Google-Smtp-Source: ABdhPJxSLqAqgvck65g/pZfBYtS36CkufnGh6NBDr9KPURnF1DZmA2VaHK7Mm8bWtpN2b7qBYdzLeg==
X-Received: by 2002:a1c:545d:: with SMTP id p29mr2979354wmi.54.1612362039669; 
 Wed, 03 Feb 2021 06:20:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm3905444wrp.40.2021.02.03.06.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 06:20:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 744BF1FF7E;
 Wed,  3 Feb 2021 14:20:37 +0000 (GMT)
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-16-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v15 15/23] cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
 pointer in CPUClass
Date: Wed, 03 Feb 2021 13:23:16 +0000
In-reply-to: <20210201100903.17309-16-cfontana@suse.de>
Message-ID: <87im79s05m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> we cannot in principle make the TCG Operations field definitions
> conditional on CONFIG_TCG in code that is included by both common_ss
> and specific_ss modules.
>
> Therefore, what we can do safely to restrict the TCG fields to TCG-only
> builds, is to move all tcg cpu operations into a separate header file,
> which is only included by TCG, target-specific code.
>
> This leaves just a NULL pointer in the cpu.h for the non-TCG builds.
>
> This also tidies up the code in all targets a bit, having all TCG cpu
> operations neatly contained by a dedicated data struct.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
<snip>
>=20=20
> -/**
> - * struct TcgCpuOperations: TCG operations specific to a CPU class
> - */
> -typedef struct TcgCpuOperations {
> -    /**
> -     * @initialize: Initalize TCG state
> -     *
> -     * Called when the first CPU is realized.
> -     */
> -    void (*initialize)(void);
> -    /**
> -     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBl=
ock
> -     *
> -     * This is called when we abandon execution of a TB before
> -     * starting it, and must set all parts of the CPU state which
> -     * the previous TB in the chain may not have updated. This
> -     * will need to do more. If this hook is not implemented then
> -     * the default is to call @set_pc(tb->pc).
> -     */
> -    void (*synchronize_from_tb)(CPUState *cpu,
> -                                const struct TranslationBlock *tb);
> -    /** @cpu_exec_enter: Callback for cpu_exec preparation */
> -    void (*cpu_exec_enter)(CPUState *cpu);
> -    /** @cpu_exec_exit: Callback for cpu_exec cleanup */
> -    void (*cpu_exec_exit)(CPUState *cpu);
> -    /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_e=
xec */
> -    bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
> -    /** @do_interrupt: Callback for interrupt handling. */
> -    void (*do_interrupt)(CPUState *cpu);
> -    /**
> -     * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
> -     *
> -     * For system mode, if the access is valid, call tlb_set_page
> -     * and return true; if the access is invalid, and probe is
> -     * true, return false; otherwise raise an exception and do
> -     * not return.  For user-only mode, always raise an exception
> -     * and do not return.
> -     */
> -    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
> -                     MMUAccessType access_type, int mmu_idx,
> -                     bool probe, uintptr_t retaddr);
> -    /** @debug_excp_handler: Callback for handling debug exceptions */
> -    void (*debug_excp_handler)(CPUState *cpu);
> +/* see accel-cpu.h */
> +struct AccelCPUClass;

This seems unrelated - wasn't AccelCPUClass already introduced. Or is
this just catch up documentation.

>=20=20
> -    /**
> -     * @do_transaction_failed: Callback for handling failed memory trans=
actions
> -     * (ie bus faults or external aborts; not MMU faults)
> -     */
> -    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr =
addr,
> -                                  unsigned size, MMUAccessType access_ty=
pe,
> -                                  int mmu_idx, MemTxAttrs attrs,
> -                                  MemTxResult response, uintptr_t retadd=
r);
> -    /**
> -     * @do_unaligned_access: Callback for unaligned access handling
> -     */
> -    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
> -                                MMUAccessType access_type,
> -                                int mmu_idx, uintptr_t retaddr);
> -    /**
> -     * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by=
 ARM
> -     */
> -    vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int le=
n);
> -
> -    /**
> -     * @debug_check_watchpoint: return true if the architectural
> -     * watchpoint whose address has matched should really fire, used by =
ARM
> -     */
> -    bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
> -
> -} TcgCpuOperations;
> +/* see tcg-cpu-ops.h */
> +struct TCGCPUOps;
>=20=20
>  /**
>   * CPUClass:
> @@ -256,7 +191,14 @@ struct CPUClass {
>      int gdb_num_core_regs;
>      bool gdb_stop_before_watchpoint;
>=20=20
> -    TcgCpuOperations tcg_ops;
> +    /*
> +     * NB: this should be wrapped by CONFIG_TCG, but it is unsafe to do =
it here,
> +     * as this header is included by both ss_specific and ss_common code,
> +     * leading to potential differences in the data structure between mo=
dules.
> +     * We could always keep it last, but it seems safer to just leave th=
is
> +     * pointer NULL for non-TCG.
> +     */
> +    struct TCGCPUOps *tcg_ops;

I suspect the editorial comment is better suited to the commit log
rather than the comments. Maybe a simpler:

  As this header is included by both ss_specific and ss_common code we
  cannot totally eliminate this field for non CONFIG_TCG builds although
  the pointer will be NULL.

and move the justification to the commit comment.

<snip>
>=20=20
> +#ifdef CONFIG_TCG
> +/*
> + * NB: cannot be const, as some elements are changed for specific
> + * arm cpu classes.
> + */

This comment seems wrong. I don't see arm_tcg_ops being changed after
the fact. We have a separate arm_v7m_tcg_ops which we use instead.
Indeed the following seemed to work:

--8<---------------cut here---------------start------------->8---
modified   include/hw/core/cpu.h
@@ -199,7 +199,7 @@ struct CPUClass {
      * We could always keep it last, but it seems safer to just leave this
      * pointer NULL for non-TCG.
      */
-    struct TCGCPUOps *tcg_ops;
+    const struct TCGCPUOps *tcg_ops;
 };
=20
 /*
modified   target/arm/cpu.c
@@ -2248,7 +2248,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
  * NB: cannot be const, as some elements are changed for specific
  * arm cpu classes.
  */
-static struct TCGCPUOps arm_tcg_ops =3D {
+static const struct TCGCPUOps arm_tcg_ops =3D {
     .initialize =3D arm_translate_init,
     .synchronize_from_tb =3D arm_cpu_synchronize_from_tb,
     .cpu_exec_interrupt =3D arm_cpu_exec_interrupt,
--8<---------------cut here---------------end--------------->8---

This does later break MIPS jazz:

p/hw_mips_jazz.c.o -c ../../hw/mips/jazz.c
../../hw/mips/jazz.c: In function =E2=80=98mips_jazz_init=E2=80=99:
../../hw/mips/jazz.c:216:40: error: assignment of member =E2=80=98do_transa=
ction_failed=E2=80=99 in read-only object
     cc->tcg_ops->do_transaction_failed =3D mips_jazz_do_transaction_failed;

which...

<snip>
>=20=20
> +#ifdef CONFIG_TCG
> +#include "hw/core/tcg-cpu-ops.h"
> +/*
> + * NB: cannot be const, as some elements are changed for specific
> + * mips hardware (see hw/mips/jazz.c).
> + */

does have a valid comment. So guess keep it as static and just don't
claim ARM hacks around with it or find a more elegant solution for the
Jazz hack (I'm not sure there is one).

<snip>

These minor trivialities aside:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

