Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3F9633F8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 12:10:14 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkn4f-0004JH-UF
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 06:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53762)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hkn1j-00011x-2N
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 06:07:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hkn1h-0004Iw-JG
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 06:07:11 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:54750)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hkn1h-0004H7-A0
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 06:07:09 -0400
Received: by mail-wm1-x341.google.com with SMTP id p74so2427114wme.4
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 03:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=ftFrjXP/CQ8lLuDQ7G6q4l6WNp4fq9K5v5mmG75Q/eg=;
 b=wfqJ/TTwnyWFL2zZXQlUYi7yM5o43jeCmTXvHqw0I15mjF5vVFC8bNvZeIHjr3ROt/
 dLD/iV3r7bxQy/Iz94fnS9/g3TwDLhzUoRvD9mwwFmYSn1K8M3mUgO9sZ9zNryJMNZOG
 7f3NJdtxGTSgMupBdmnF53AgI+N//elHhS2tXjySgXZujAF3Jc5wNsP6+FE7UWCb4P8N
 H774gd3iQ2vVyR0Fb8jO6oefRtP1HPQGmq+aRtXNhSaa8163avKSvPD+pt6RVhmGeNFr
 iWg26J77h+vCzmavnPtVlbPlykRhJXsTlrfxxYMfullhZQNDhVOJD7cL0a617ndLz7Ms
 TWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=ftFrjXP/CQ8lLuDQ7G6q4l6WNp4fq9K5v5mmG75Q/eg=;
 b=XhTv+rfSmqGTopOfFuf82ix4WLw10BgIjIBh1gHZQlQ8w9t5M8XIkkFBdQ2jPlBL6P
 HHR/NJO+GU1HepIfem33fvMqCT5QR1nVtqn/5mUaIsFwxfJ8kevXsCJbcAZIdJAAOBh6
 rWNerQOItSERJp63pw5s637RdvivcESwYJjqdUhndmw7LAVm22wwkx03SuSqF/lOJD5+
 HqTQZDVP0Pi2iEyTBrXNXOb5n4F+1zsnP6N/4O8+MQL6ggWlorr29SNcVx0BCPbmOkyp
 J4OFmwbl9c8HA3z23ug5Cn4hOEqCualO0+/iqtqcDV/i0/gNKODjEEaD3iSzyCSKEg9L
 UF1Q==
X-Gm-Message-State: APjAAAV/kvwmbRIoECNkrytf+msLi+ZKbOpaXwNJi9mta1T1TEoKccHh
 ZJjRAwhilAgEnJoIi7lftSMhQQ==
X-Google-Smtp-Source: APXvYqzYtsN109nBg+VyOE+7kq5/tYmyEjV3r11W6eZWgmAthKy3A21bgz+zWBtRiD5XUpcIM+pd9A==
X-Received: by 2002:a7b:cc97:: with SMTP id p23mr22182562wma.120.1562666823982; 
 Tue, 09 Jul 2019 03:07:03 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id v15sm17513821wru.61.2019.07.09.03.07.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 03:07:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 06A711FF87;
 Tue,  9 Jul 2019 11:07:03 +0100 (BST)
References: <20190709092049.13771-1-richard.henderson@linaro.org>
 <20190709092049.13771-3-richard.henderson@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
In-reply-to: <20190709092049.13771-3-richard.henderson@linaro.org>
Date: Tue, 09 Jul 2019 11:07:02 +0100
Message-ID: <87zhlned2x.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-devel] [PATCH 2/5] tcg: Introduce set/clear_helper_retaddr
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> At present we have a potential error in that helper_retaddr contains
> data for handle_cpu_signal, but we have not ensured that those stores
> will be scheduled properly before the operation that may fault.
>
> It might be that these races are not in practice observable, due to
> our use of -fno-strict-aliasing, but better safe than sorry.
>
> Adjust all of the setters of helper_retaddr.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h                   | 20 +++++++++++
>  include/exec/cpu_ldst_useronly_template.h | 12 +++----
>  accel/tcg/user-exec.c                     | 11 +++---
>  target/arm/helper-a64.c                   |  8 ++---
>  target/arm/sve_helper.c                   | 43 +++++++++++------------
>  5 files changed, 57 insertions(+), 37 deletions(-)
>
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index a08b11bd2c..9de8c93303 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -89,6 +89,26 @@ typedef target_ulong abi_ptr;
>
>  extern __thread uintptr_t helper_retaddr;
>
> +static inline void set_helper_retaddr(uintptr_t ra)
> +{
> +    helper_retaddr =3D ra;
> +    /*
> +     * Ensure that this write is visible to the SIGSEGV handler that
> +     * may be invoked due to a subsequent invalid memory operation.
> +     */
> +    signal_barrier();
> +}
> +
> +static inline void clear_helper_retaddr(void)
> +{
> +    /*
> +     * Ensure that previous memory operations have succeeded before
> +     * removing the data visible to the signal handler.
> +     */
> +    signal_barrier();
> +    helper_retaddr =3D 0;
> +}
> +
>  /* In user-only mode we provide only the _code and _data accessors. */
>
>  #define MEMSUFFIX _data
> diff --git a/include/exec/cpu_ldst_useronly_template.h b/include/exec/cpu=
_ldst_useronly_template.h
> index bc45e2b8d4..e65733f7e2 100644
> --- a/include/exec/cpu_ldst_useronly_template.h
> +++ b/include/exec/cpu_ldst_useronly_template.h
> @@ -78,9 +78,9 @@ glue(glue(glue(cpu_ld, USUFFIX), MEMSUFFIX), _ra)(CPUAr=
chState *env,
>                                                    uintptr_t retaddr)
>  {
>      RES_TYPE ret;
> -    helper_retaddr =3D retaddr;
> +    set_helper_retaddr(retaddr);
>      ret =3D glue(glue(cpu_ld, USUFFIX), MEMSUFFIX)(env, ptr);
> -    helper_retaddr =3D 0;
> +    clear_helper_retaddr();
>      return ret;
>  }
>
> @@ -102,9 +102,9 @@ glue(glue(glue(cpu_lds, SUFFIX), MEMSUFFIX), _ra)(CPU=
ArchState *env,
>                                                    uintptr_t retaddr)
>  {
>      int ret;
> -    helper_retaddr =3D retaddr;
> +    set_helper_retaddr(retaddr);
>      ret =3D glue(glue(cpu_lds, SUFFIX), MEMSUFFIX)(env, ptr);
> -    helper_retaddr =3D 0;
> +    clear_helper_retaddr();
>      return ret;
>  }
>  #endif
> @@ -128,9 +128,9 @@ glue(glue(glue(cpu_st, SUFFIX), MEMSUFFIX), _ra)(CPUA=
rchState *env,
>                                                    RES_TYPE v,
>                                                    uintptr_t retaddr)
>  {
> -    helper_retaddr =3D retaddr;
> +    set_helper_retaddr(retaddr);
>      glue(glue(cpu_st, SUFFIX), MEMSUFFIX)(env, ptr, v);
> -    helper_retaddr =3D 0;
> +    clear_helper_retaddr();
>  }
>  #endif
>
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index cb5f4b19c5..4384b59a4d 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -134,7 +134,7 @@ static inline int handle_cpu_signal(uintptr_t pc, sig=
info_t *info,
>               * currently executing TB was modified and must be exited
>               * immediately.  Clear helper_retaddr for next execution.
>               */
> -            helper_retaddr =3D 0;
> +            clear_helper_retaddr();
>              cpu_exit_tb_from_sighandler(cpu, old_set);
>              /* NORETURN */
>
> @@ -152,7 +152,7 @@ static inline int handle_cpu_signal(uintptr_t pc, sig=
info_t *info,
>       * an exception.  Undo signal and retaddr state prior to longjmp.
>       */
>      sigprocmask(SIG_SETMASK, old_set, NULL);
> -    helper_retaddr =3D 0;
> +    clear_helper_retaddr();
>
>      cc =3D CPU_GET_CLASS(cpu);
>      access_type =3D is_write ? MMU_DATA_STORE : MMU_DATA_LOAD;
> @@ -682,14 +682,15 @@ static void *atomic_mmu_lookup(CPUArchState *env, t=
arget_ulong addr,
>      if (unlikely(addr & (size - 1))) {
>          cpu_loop_exit_atomic(env_cpu(env), retaddr);
>      }
> -    helper_retaddr =3D retaddr;
> -    return g2h(addr);
> +    void *ret =3D g2h(addr);
> +    set_helper_retaddr(retaddr);
> +    return ret;
>  }
>
>  /* Macro to call the above, with local variables from the use context.  =
*/
>  #define ATOMIC_MMU_DECLS do {} while (0)
>  #define ATOMIC_MMU_LOOKUP  atomic_mmu_lookup(env, addr, DATA_SIZE, GETPC=
())
> -#define ATOMIC_MMU_CLEANUP do { helper_retaddr =3D 0; } while (0)
> +#define ATOMIC_MMU_CLEANUP do { clear_helper_retaddr(); } while (0)
>
>  #define ATOMIC_NAME(X)   HELPER(glue(glue(atomic_ ## X, SUFFIX), END))
>  #define EXTRA_ARGS
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index 44e45a8037..060699b901 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -554,7 +554,7 @@ uint64_t HELPER(paired_cmpxchg64_le)(CPUARMState *env=
, uint64_t addr,
>      /* ??? Enforce alignment.  */
>      uint64_t *haddr =3D g2h(addr);
>
> -    helper_retaddr =3D ra;
> +    set_helper_retaddr(ra);
>      o0 =3D ldq_le_p(haddr + 0);
>      o1 =3D ldq_le_p(haddr + 1);
>      oldv =3D int128_make128(o0, o1);
> @@ -564,7 +564,7 @@ uint64_t HELPER(paired_cmpxchg64_le)(CPUARMState *env=
, uint64_t addr,
>          stq_le_p(haddr + 0, int128_getlo(newv));
>          stq_le_p(haddr + 1, int128_gethi(newv));
>      }
> -    helper_retaddr =3D 0;
> +    clear_helper_retaddr();
>  #else
>      int mem_idx =3D cpu_mmu_index(env, false);
>      TCGMemOpIdx oi0 =3D make_memop_idx(MO_LEQ | MO_ALIGN_16, mem_idx);
> @@ -624,7 +624,7 @@ uint64_t HELPER(paired_cmpxchg64_be)(CPUARMState *env=
, uint64_t addr,
>      /* ??? Enforce alignment.  */
>      uint64_t *haddr =3D g2h(addr);
>
> -    helper_retaddr =3D ra;
> +    set_helper_retaddr(ra);
>      o1 =3D ldq_be_p(haddr + 0);
>      o0 =3D ldq_be_p(haddr + 1);
>      oldv =3D int128_make128(o0, o1);
> @@ -634,7 +634,7 @@ uint64_t HELPER(paired_cmpxchg64_be)(CPUARMState *env=
, uint64_t addr,
>          stq_be_p(haddr + 0, int128_gethi(newv));
>          stq_be_p(haddr + 1, int128_getlo(newv));
>      }
> -    helper_retaddr =3D 0;
> +    clear_helper_retaddr();
>  #else
>      int mem_idx =3D cpu_mmu_index(env, false);
>      TCGMemOpIdx oi0 =3D make_memop_idx(MO_BEQ | MO_ALIGN_16, mem_idx);
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index fd434c66ea..fc0c1755d2 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -4125,12 +4125,11 @@ static intptr_t max_for_page(target_ulong base, i=
ntptr_t mem_off,
>      return MIN(split, mem_max - mem_off) + mem_off;
>  }
>
> -static inline void set_helper_retaddr(uintptr_t ra)
> -{
> -#ifdef CONFIG_USER_ONLY
> -    helper_retaddr =3D ra;
> +#ifndef CONFIG_USER_ONLY
> +/* These are normally defined only for CONFIG_USER_ONLY in <exec/cpu_lds=
t.h> */
> +static inline void set_helper_retaddr(uintptr_t ra) { }
> +static inline void clear_helper_retaddr(void) { }

Why aren't these stubs in the #else leg of cpu_ldst.h?

With that:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--
Alex Benn=C3=A9e

