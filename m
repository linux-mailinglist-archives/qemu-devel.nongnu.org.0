Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438132D4066
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:57:41 +0100 (CET)
Received: from localhost ([::1]:40206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmxAC-0006we-5V
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmx8D-0006E0-IH
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:55:38 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kmx85-000535-5U
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 05:55:34 -0500
Received: by mail-wm1-x343.google.com with SMTP id x22so1042707wmc.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 02:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=j0XnacA6KBrQ1+o7ISdjeduatgwVBIyuZE9icr897oQ=;
 b=QaCxf4kl4ojjVzRqonUCFY7ROiwVfXnsVhcFYgHJM4i8DIVtBNLx+joHLCoZtCBrjR
 Zr3J+3WZwmBxG4Ev42KI4GEVZOSifDsCLQll8ZuZAXFnuFBXjTHT3yj8fAk8EevFcFzQ
 HlCiSj/+3p48RI3SQrNo3bVtn6R9Uz9SRAw5xbkdASWaYhnBfUkAPrt5Z1EbyrJqxic8
 ss5XoLYB3xNkEl3T2TOyVazn4VuGqIq0cXV3zPKwRQ2ICrEsSZG0tY17NO90eOVka8UW
 tR5Lt4nchVpjgF6ipXUeRY5FLZY/1W3VtsqVr76fh1myiYyUcK1d9I49c9CHYqmPnhm8
 geng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=j0XnacA6KBrQ1+o7ISdjeduatgwVBIyuZE9icr897oQ=;
 b=Yw+gmhRaJdno09WCcuuxrkNZnpCHgXi2t0rN0A07rD3BudutIyuXIdgjixEapKsnWd
 e6COMF9KAmRZsCKCXA5PAnV0M7mksKal0ErgZ48j3TUPWPnf1loPMYNXT3THx7qTlRIx
 mn18kQOwokh7DIvIXz/ch636v5/iX5WNyd/aocjAwMa53da/u9/7VJLC9xiMDV8MOk0z
 kMPJH5jcLVmun3MhLZkNOYMWOC7WYt47l+9kHPTmENlDWbXrzFhJ6c2w7H5J2U/+5Bbq
 Uv79oP7Wiz/MxE8Xu6c9cVloluZFkJPFrgzB09i7JdWjAS3X5Yx2d6U3Yd4Z/na1Piwm
 6I0g==
X-Gm-Message-State: AOAM531ZM75KjqA7TnLhF26y5OZqayz83zGhM42zYnBm+HzTl/NhDq/j
 BOkieerVxUicqhvYWYHDlyziVw==
X-Google-Smtp-Source: ABdhPJzT6PgZbiv+M3dCHLqfGw+aI0Z/0E8AHe2wJU9px64zhN2HzKUnKHl+hSGQ5z7nPxBXrsg09w==
X-Received: by 2002:a1c:9e0e:: with SMTP id h14mr2072646wme.63.1607511327526; 
 Wed, 09 Dec 2020 02:55:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j2sm2764085wrt.35.2020.12.09.02.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 02:55:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA1031FF7E;
 Wed,  9 Dec 2020 10:55:24 +0000 (GMT)
References: <20201208194839.31305-1-cfontana@suse.de>
 <20201208194839.31305-19-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v9 18/32] cpu: Move synchronize_from_tb() to tcg_ops
Date: Wed, 09 Dec 2020 10:50:29 +0000
In-reply-to: <20201208194839.31305-19-cfontana@suse.de>
Message-ID: <87im9bdzab.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> From: Eduardo Habkost <ehabkost@redhat.com>
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> [claudio: wrapped in CONFIG_TCG]
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  accel/tcg/cpu-exec.c          |  4 ++--
>  include/hw/core/cpu.h         |  8 --------
>  include/hw/core/tcg-cpu-ops.h | 14 +++++++++++---
>  target/arm/cpu.c              |  2 +-
>  target/avr/cpu.c              |  2 +-
>  target/hppa/cpu.c             |  2 +-
>  target/i386/tcg-cpu.c         |  2 +-
>  target/microblaze/cpu.c       |  2 +-
>  target/mips/cpu.c             |  2 +-
>  target/riscv/cpu.c            |  2 +-
>  target/rx/cpu.c               |  2 +-
>  target/sh4/cpu.c              |  2 +-
>  target/sparc/cpu.c            |  2 +-
>  target/tricore/cpu.c          |  2 +-
>  14 files changed, 24 insertions(+), 24 deletions(-)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 436dfbf155..776415d47e 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -192,8 +192,8 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *=
cpu, TranslationBlock *itb)
>                                 TARGET_FMT_lx "] %s\n",
>                                 last_tb->tc.ptr, last_tb->pc,
>                                 lookup_symbol(last_tb->pc));
> -        if (cc->synchronize_from_tb) {
> -            cc->synchronize_from_tb(cpu, last_tb);
> +        if (cc->tcg_ops.synchronize_from_tb) {
> +            cc->tcg_ops.synchronize_from_tb(cpu, last_tb);
>          } else {
>              assert(cc->set_pc);
>              cc->set_pc(cpu, last_tb->pc);
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index ea648d52ad..83007d262c 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -110,13 +110,6 @@ struct TranslationBlock;
>   *       If the target behaviour here is anything other than "set
>   *       the PC register to the value passed in" then the target must
>   *       also implement the synchronize_from_tb hook.
> - * @synchronize_from_tb: Callback for synchronizing state from a TCG
> - *       #TranslationBlock. This is called when we abandon execution
> - *       of a TB before starting it, and must set all parts of the CPU
> - *       state which the previous TB in the chain may not have updated.
> - *       This always includes at least the program counter; some targets
> - *       will need to do more. If this hook is not implemented then the
> - *       default is to call @set_pc(tb->pc).
>   * @tlb_fill: Callback for handling a softmmu tlb miss or user-only
>   *       address fault.  For system mode, if the access is valid, call
>   *       tlb_set_page and return true; if the access is invalid, and
> @@ -193,7 +186,6 @@ struct CPUClass {
>      void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
>                                 Error **errp);
>      void (*set_pc)(CPUState *cpu, vaddr value);
> -    void (*synchronize_from_tb)(CPUState *cpu, struct TranslationBlock *=
tb);
>      bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
>                       MMUAccessType access_type, int mmu_idx,
>                       bool probe, uintptr_t retaddr);
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 4475ef0996..109291ac52 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -10,9 +10,6 @@
>  #ifndef TCG_CPU_OPS_H
>  #define TCG_CPU_OPS_H
>=20=20
> -/**
> - * struct TcgCpuOperations: TCG operations specific to a CPU class
> - */
>  typedef struct TcgCpuOperations {
>      /**
>       * @initialize: Initalize TCG state
> @@ -20,6 +17,17 @@ typedef struct TcgCpuOperations {
>       * Called when the first CPU is realized.
>       */
>      void (*initialize)(void);
> +    /**
> +     * @synchronize_from_tb: Synchronize state from a TCG #TranslationBl=
ock
> +     *
> +     * This is called when we abandon execution of a TB before
> +     * starting it, and must set all parts of the CPU state which
> +     * the previous TB in the chain may not have updated. This
> +     * will need to do more. If this hook is not implemented then
> +     * the default is to call
> +     * @set_pc(tb->pc).
> +     */

We could clean-up the comment here to better fit the javadoc style API
documentation format, i.e.:

    /**
     * synchronize_from_tb: Synchronize current TCG execution state
     * @cpu: current cpu
     * @tb: about to be executed #TranslationBlock
     *
     * This is called when we abandon execution of a TB before
     * starting it, and must set all parts of the CPU state which
     * the previous TB in the chain may not have updated. This
     * will need to do more. If this hook is not implemented then
     * the default is to call @set_pc(tb->pc).
     */

<snip>

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

