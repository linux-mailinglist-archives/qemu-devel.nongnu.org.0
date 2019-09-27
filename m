Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C846C0611
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 15:12:17 +0200 (CEST)
Received: from localhost ([::1]:50082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDq2h-0001hQ-3M
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 09:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iDpoP-0007dp-LL
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 08:57:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iDpoO-0002Ky-93
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 08:57:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44402)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iDpoO-0002Kn-0H; Fri, 27 Sep 2019 08:57:28 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5CB323082B45;
 Fri, 27 Sep 2019 10:31:32 +0000 (UTC)
Received: from [10.36.116.169] (ovpn-116-169.ams2.redhat.com [10.36.116.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E51B60BF3;
 Fri, 27 Sep 2019 10:31:31 +0000 (UTC)
Subject: Re: [PATCH v3 03/18] target/s390x: Remove ilen parameter from
 tcg_s390_program_interrupt
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190926162615.31168-1-richard.henderson@linaro.org>
 <20190926162615.31168-4-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <b73d9f18-93fe-60de-8dac-cddebf21c166@redhat.com>
Date: Fri, 27 Sep 2019 12:31:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926162615.31168-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 27 Sep 2019 10:31:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.09.19 18:26, Richard Henderson wrote:
> Since we begin the operation with an unwind, we have the proper
> value of ilen immediately available.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg_s390x.h   | 4 ++--
>  target/s390x/excp_helper.c | 8 ++++----
>  target/s390x/interrupt.c   | 2 +-
>  target/s390x/tcg-stub.c    | 4 ++--
>  4 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/target/s390x/tcg_s390x.h b/target/s390x/tcg_s390x.h
> index 2813f9d48e..2f54ccb027 100644
> --- a/target/s390x/tcg_s390x.h
> +++ b/target/s390x/tcg_s390x.h
> @@ -14,8 +14,8 @@
>  #define TCG_S390X_H
>  
>  void tcg_s390_tod_updated(CPUState *cs, run_on_cpu_data opaque);
> -void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env, uint32_t code,
> -                                              int ilen, uintptr_t ra);
> +void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
> +                                              uint32_t code, uintptr_t ra);
>  void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc,
>                                             uintptr_t ra);
>  void QEMU_NORETURN tcg_s390_vector_exception(CPUS390XState *env, uint32_t vxc,
> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
> index 892f659d5a..681a9c59e1 100644
> --- a/target/s390x/excp_helper.c
> +++ b/target/s390x/excp_helper.c
> @@ -34,15 +34,15 @@
>  #include "hw/boards.h"
>  #endif
>  
> -void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env, uint32_t code,
> -                                              int ilen, uintptr_t ra)
> +void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
> +                                              uint32_t code, uintptr_t ra)
>  {
>      CPUState *cs = env_cpu(env);
>  
>      cpu_restore_state(cs, ra, true);
>      qemu_log_mask(CPU_LOG_INT, "program interrupt at %#" PRIx64 "\n",
>                    env->psw.addr);
> -    trigger_pgm_exception(env, code, ilen);
> +    trigger_pgm_exception(env, code, ILEN_UNWIND);
>      cpu_loop_exit(cs);
>  }
>  
> @@ -60,7 +60,7 @@ void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc,
>      if (env->cregs[0] & CR0_AFP) {
>          env->fpc = deposit32(env->fpc, 8, 8, dxc);
>      }
> -    tcg_s390_program_interrupt(env, PGM_DATA, ILEN_AUTO, ra);
> +    tcg_s390_program_interrupt(env, PGM_DATA, ra);
>  }
>  
>  void QEMU_NORETURN tcg_s390_vector_exception(CPUS390XState *env, uint32_t vxc,
> diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
> index 30a9fb8852..b798e2ecbe 100644
> --- a/target/s390x/interrupt.c
> +++ b/target/s390x/interrupt.c
> @@ -40,7 +40,7 @@ void s390_program_interrupt(CPUS390XState *env, uint32_t code, int ilen,
>      if (kvm_enabled()) {
>          kvm_s390_program_interrupt(env_archcpu(env), code);
>      } else if (tcg_enabled()) {
> -        tcg_s390_program_interrupt(env, code, ilen, ra);
> +        tcg_s390_program_interrupt(env, code, ra);
>      } else {
>          g_assert_not_reached();
>      }
> diff --git a/target/s390x/tcg-stub.c b/target/s390x/tcg-stub.c
> index 32adb7276a..d22c898802 100644
> --- a/target/s390x/tcg-stub.c
> +++ b/target/s390x/tcg-stub.c
> @@ -18,8 +18,8 @@
>  void tcg_s390_tod_updated(CPUState *cs, run_on_cpu_data opaque)
>  {
>  }
> -void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env, uint32_t code,
> -                                              int ilen, uintptr_t ra)
> +void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
> +                                              uint32_t code, uintptr_t ra)
>  {
>      g_assert_not_reached();
>  }
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 

Thanks,

David / dhildenb

