Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164832F1FD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:58:09 +0100 (CET)
Received: from localhost ([::1]:47480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEiG-000843-26
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:58:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIE30-0006Vb-1l
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:30 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIE2p-0007PU-Q7
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id d11so2891675wrj.7
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rTTXeh1kqP08osFNRYl6vvTlehZc0RHxMbh3b9wjywQ=;
 b=rfVml4IC+M4Ss9fkN6u7LOOoIuPS7dmZ9hGfQOZh/Bis0NMst/MdOjoCHdSuaoW8vM
 bGqoqagQRT43lTjRUI+QAI7BHj0VB05qJPbNeqmJVvhI+ukp1+UUj33bbQWl6UfFr8fs
 cmdHjJ41XZF7phbEjrdJXafR8o1r/2i3GMpQ20PEYRDBxvyvlJyLYaRSm61ToV+u9lHI
 vn5fNz2WGrLqbM+vEHDbr7JGS238F20f+KY0WYC1byraR2xrIrxrKKKLTtsaVYwjNmWX
 gtJ36aFw56on9edLF0Y1lABhHJrjkhxkw3WMHlOLucUR7EbltPi9LOQZ3Ks5RGpLoZbA
 hYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rTTXeh1kqP08osFNRYl6vvTlehZc0RHxMbh3b9wjywQ=;
 b=DMK2+kNf9SNJIPDZ6pROxEzmxoY41ERCn6mb2clBtSfmqXuD62xprGmjWurucz2NYs
 RsRP/dPK40gaEwFNasJSSdUg9IqEO1IhGKuvZObkc44fw98uWcJYbeMvSd+rroBPUxTf
 28Ynt+jNX2k+Xh99GFu76lWRVRsIgvl2bDC8M/BFlcgv6Zg5Cw7DR7/38NattwmEKEgi
 ighg7WUqP6G+3nWBTScUj9+uJR/01kSvv0QmIk1yBFfZKljJcooE5e3ON1uSI7LSyAIr
 7NMCY856Vfqtsy7FTHg94sSvcZQnsJM7fpNwtb9oOmGD8m0qBS99NV3Mcy9DjMju+8Z4
 645g==
X-Gm-Message-State: AOAM532m0MOmdAUTxtoVFGBwRce69h+SGpbrx09K6WK6+IBJog2cISTp
 h1Silxv9NPYSRHI7Ne6LPeBjCA==
X-Google-Smtp-Source: ABdhPJwqfIU86c96/HQZA3h1CcJIaDRdcIbjsWr04oD15YBUOYFMRDc7dQ2/ilRa/cJDxMz/1OKueg==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr10727552wrw.170.1614964518021; 
 Fri, 05 Mar 2021 09:15:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j11sm5360936wrm.13.2021.03.05.09.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA9651FF7E;
 Fri,  5 Mar 2021 17:15:15 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-28-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 27/27] accel/tcg: Precompute curr_cflags into
 cpu->tcg_cflags
Date: Fri, 05 Mar 2021 17:12:21 +0000
In-reply-to: <20210302175741.1079851-28-richard.henderson@linaro.org>
Message-ID: <87o8fxed3w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The primary motivation is to remove a dozen insns along
> the fast-path in tb_lookup.  As a byproduct, this allows
> us to completely remove parallel_cpus.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/tcg-accel-ops.h       |  1 +
>  include/exec/exec-all.h         |  7 +------
>  include/hw/core/cpu.h           |  2 ++
>  accel/tcg/cpu-exec.c            |  3 ---
>  accel/tcg/tcg-accel-ops-mttcg.c |  3 +--
>  accel/tcg/tcg-accel-ops-rr.c    |  2 +-
>  accel/tcg/tcg-accel-ops.c       |  8 ++++++++
>  accel/tcg/translate-all.c       |  4 ----
>  linux-user/main.c               |  1 +
>  linux-user/sh4/signal.c         |  8 +++++---
>  linux-user/syscall.c            | 18 ++++++++++--------
>  11 files changed, 30 insertions(+), 27 deletions(-)
>
> diff --git a/accel/tcg/tcg-accel-ops.h b/accel/tcg/tcg-accel-ops.h
> index 48130006de..6a5fcef889 100644
> --- a/accel/tcg/tcg-accel-ops.h
> +++ b/accel/tcg/tcg-accel-ops.h
> @@ -17,5 +17,6 @@
>  void tcg_cpus_destroy(CPUState *cpu);
>  int tcg_cpus_exec(CPUState *cpu);
>  void tcg_handle_interrupt(CPUState *cpu, int mask);
> +void tcg_cpu_init_cflags(CPUState *cpu, bool parallel);
>=20=20
>  #endif /* TCG_CPUS_H */
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 75f8c3981a..310f474540 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -510,8 +510,6 @@ struct TranslationBlock {
>      uintptr_t jmp_dest[2];
>  };
>=20=20
> -extern bool parallel_cpus;
> -
>  /* Hide the qatomic_read to make code a little easier on the eyes */
>  static inline uint32_t tb_cflags(const TranslationBlock *tb)
>  {
> @@ -521,10 +519,7 @@ static inline uint32_t tb_cflags(const TranslationBl=
ock *tb)
>  /* current cflags for hashing/comparison */
>  static inline uint32_t curr_cflags(CPUState *cpu)
>  {
> -    uint32_t cflags =3D deposit32(0, CF_CLUSTER_SHIFT, 8, cpu->cluster_i=
ndex);
> -    cflags |=3D parallel_cpus ? CF_PARALLEL : 0;
> -    cflags |=3D icount_enabled() ? CF_USE_ICOUNT : 0;
> -    return cflags;
> +    return cpu->tcg_cflags;
>  }
>=20=20
>  /* TranslationBlock invalidate API */
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index c005d3dc2d..c68bc3ba8a 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -282,6 +282,7 @@ struct qemu_work_item;
>   *   to a cluster this will be UNASSIGNED_CLUSTER_INDEX; otherwise it wi=
ll
>   *   be the same as the cluster-id property of the CPU object's TYPE_CPU=
_CLUSTER
>   *   QOM parent.
> + * @tcg_cflags: Pre-computed cflags for this cpu.
>   * @nr_cores: Number of cores within this CPU package.
>   * @nr_threads: Number of threads within this CPU.
>   * @running: #true if CPU is currently running (lockless).
> @@ -412,6 +413,7 @@ struct CPUState {
>      /* TODO Move common fields from CPUArchState here. */
>      int cpu_index;
>      int cluster_index;
> +    uint32_t tcg_cflags;
>      uint32_t halted;
>      uint32_t can_do_io;
>      int32_t exception_index;
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 931da96c2b..bdfa036ac8 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -267,8 +267,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
>              mmap_unlock();
>          }
>=20=20
> -        /* Since we got here, we know that parallel_cpus must be true.  =
*/
> -        parallel_cpus =3D false;
>          cpu_exec_enter(cpu);
>          /* execute the generated code */
>          trace_exec_tb(tb, pc);
> @@ -296,7 +294,6 @@ void cpu_exec_step_atomic(CPUState *cpu)
>       * the execution.
>       */
>      g_assert(cpu_in_exclusive_context(cpu));
> -    parallel_cpus =3D true;
>      cpu->running =3D false;
>      end_exclusive();

I don't see where we generate non-parallel aware code. Do we not care
about it anymore? Anyway just an observation:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

