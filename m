Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D30454BCF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:17:34 +0100 (CET)
Received: from localhost ([::1]:53884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOYv-0003OS-Q2
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:17:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOK4-0004dX-LC
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:02:12 -0500
Received: from [2607:f8b0:4864:20::936] (port=44763
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnOK0-00046V-42
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:02:12 -0500
Received: by mail-ua1-x936.google.com with SMTP id p2so7317021uad.11
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p9yIDRF9rbO10PuQ5VYoT1iXoZj9bPitU1MofL3OP4Q=;
 b=ootuzPqXRchH4eSrbWtayeIY1woex+nVuwTTlMSSYZzf/x3TsN44TqfHI9kdmmYPBA
 8sb3dsWNs1W8NT4qgygUBYE4Ih5oCaNKaLXdbvJP6IO6OH9ZjZMzfDqWEBdh+nBVgkXo
 F7JorfuNjBmS/Y5qz5UKUY9yQy/Qf6uuRDJ7KG4CAl06bQgMuPujCWXG42HHxKlMa7Lc
 BW2/c1+NIDTG0oudrX4dZrOHDHQnni3h61xvViRy6UIQNjhtkIMTGHLZeR5NkcoPIBUy
 DCZ/XZV3exbCvqNLVBq7ZzHKNGe48P9EN6rcKcfZreJkGPORfXsgki4y7gpkqy8uQIvf
 yy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p9yIDRF9rbO10PuQ5VYoT1iXoZj9bPitU1MofL3OP4Q=;
 b=NJ1Vue97eeJOFKQH6WGgAt9+91H2ABHRReS82g9BrqkjIwEEPNuVfjtd4IgEsvcKM+
 MN9N2q+/GtHZtqqd8MFLkVgkA32uM9d840yXIgTQpTHcia5y0m8jAhmzC0KbUkKvLW6A
 Zp2BmPkE/Z99+ymWc/OTih0Fz2OUlPxUV3ReHUtHUEbo603HpUIRSbGpI8QnyhzZD8QX
 x+kFh0qBjT169m0qtzyykBXhBa7q8NvQVqAK/gDVafBj4KWp+fhQe5NwsZ37/EB2rffy
 jMkHDvHL24tpAptSZh8TcmfwOGKTvZ6uPTTzA9BPRjBnXBF25If90+YMd7inlPOWCj8o
 KOFw==
X-Gm-Message-State: AOAM531o15CAMlfw/nRJ5BnxMOFNNYq6UeIGskkpkwvUlDsNqRNB90YZ
 qyHST+EyZIgIrXm4AQgOM3OzEY0QGNsXs2L3r9Ybsg==
X-Google-Smtp-Source: ABdhPJw1VkVDplEjx9HuWVSxziCD8jasrJRQWbHNFnGSte+5gCu1E9LurNzmGFt8c61HXxdXc5sTniMmhHB/po8xeh4=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr70777152vsh.30.1637168526703; 
 Wed, 17 Nov 2021 09:02:06 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-11-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-11-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 10:01:56 -0700
Message-ID: <CANCZdfr8UFRFQTWqfA0J9iEFU6SXs7zoavdR_GQk4BPwDrXbWw@mail.gmail.com>
Subject: Re: [PATCH v5 10/17] linux-user: Rename TARGET_QEMU_ESIGRETURN to
 QEMU_ESIGRETURN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000078d20005d0ff0049"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000078d20005d0ff0049
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> This value is fully internal to qemu, and so is not a TARGET define.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/generic/target_errno_defs.h |  2 +-
>  linux-user/aarch64/cpu_loop.c          |  2 +-
>  linux-user/aarch64/signal.c            |  4 ++--
>  linux-user/alpha/cpu_loop.c            |  2 +-
>  linux-user/alpha/signal.c              |  8 ++++----
>  linux-user/arm/cpu_loop.c              |  2 +-
>  linux-user/arm/signal.c                |  8 ++++----
>  linux-user/cris/cpu_loop.c             |  2 +-
>  linux-user/cris/signal.c               |  4 ++--
>  linux-user/hexagon/cpu_loop.c          |  2 +-
>  linux-user/hexagon/signal.c            |  2 +-
>  linux-user/hppa/cpu_loop.c             |  2 +-
>  linux-user/hppa/signal.c               |  4 ++--
>  linux-user/i386/cpu_loop.c             |  6 +++---
>  linux-user/i386/signal.c               |  8 ++++----
>  linux-user/m68k/cpu_loop.c             |  2 +-
>  linux-user/m68k/signal.c               |  8 ++++----
>  linux-user/microblaze/cpu_loop.c       |  2 +-
>  linux-user/microblaze/signal.c         |  4 ++--
>  linux-user/mips/cpu_loop.c             |  2 +-
>  linux-user/mips/signal.c               |  8 ++++----
>  linux-user/openrisc/cpu_loop.c         |  2 +-
>  linux-user/ppc/cpu_loop.c              |  2 +-
>  linux-user/ppc/signal.c                | 10 +++++-----
>  linux-user/riscv/cpu_loop.c            |  2 +-
>  linux-user/riscv/signal.c              |  2 +-
>  linux-user/s390x/cpu_loop.c            |  2 +-
>  linux-user/s390x/signal.c              |  8 ++++----
>  linux-user/sh4/cpu_loop.c              |  2 +-
>  linux-user/sh4/signal.c                |  8 ++++----
>  linux-user/sparc/cpu_loop.c            |  2 +-
>  linux-user/sparc/signal.c              |  8 ++++----
>  linux-user/syscall.c                   |  2 +-
>  linux-user/xtensa/cpu_loop.c           |  2 +-
>  linux-user/xtensa/signal.c             |  4 ++--
>  35 files changed, 70 insertions(+), 70 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/linux-user/generic/target_errno_defs.h
> b/linux-user/generic/target_errno_defs.h
> index 58a06a10d6..bb37d88be9 100644
> --- a/linux-user/generic/target_errno_defs.h
> +++ b/linux-user/generic/target_errno_defs.h
> @@ -162,6 +162,6 @@
>   * ERESTART_NOINTR (which is kernel internal) to guarantee that we won't
>   * clash with a valid guest errno now or in the future.
>   */
> -#define TARGET_QEMU_ESIGRETURN 513     /* Return from signal */
> +#define QEMU_ESIGRETURN 513     /* Return from signal */
>
>  #endif
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
> index 775ba43913..98b53962cd 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -101,7 +101,7 @@ void cpu_loop(CPUARMState *env)
>                               0, 0);
>              if (ret == -QEMU_ERESTARTSYS) {
>                  env->pc -= 4;
> -            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> +            } else if (ret != -QEMU_ESIGRETURN) {
>                  env->xregs[0] = ret;
>              }
>              break;
> diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
> index 29c52db3f1..df9e39a4ba 100644
> --- a/linux-user/aarch64/signal.c
> +++ b/linux-user/aarch64/signal.c
> @@ -556,12 +556,12 @@ long do_rt_sigreturn(CPUARMState *env)
>      target_restore_altstack(&frame->uc.tuc_stack, env);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>   badframe:
>      unlock_user_struct(frame, frame_addr, 0);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  long do_sigreturn(CPUARMState *env)
> diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
> index ce9b251ce3..37c33f0ccd 100644
> --- a/linux-user/alpha/cpu_loop.c
> +++ b/linux-user/alpha/cpu_loop.c
> @@ -102,7 +102,7 @@ void cpu_loop(CPUAlphaState *env)
>                      env->pc -= 4;
>                      break;
>                  }
> -                if (sysret == -TARGET_QEMU_ESIGRETURN) {
> +                if (sysret == -QEMU_ESIGRETURN) {
>                      break;
>                  }
>                  /* Syscall writes 0 to V0 to bypass error check, similar
> diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
> index bbe3dd175a..4ec42994d4 100644
> --- a/linux-user/alpha/signal.c
> +++ b/linux-user/alpha/signal.c
> @@ -225,11 +225,11 @@ long do_sigreturn(CPUAlphaState *env)
>
>      restore_sigcontext(env, sc);
>      unlock_user_struct(sc, sc_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  long do_rt_sigreturn(CPUAlphaState *env)
> @@ -249,13 +249,13 @@ long do_rt_sigreturn(CPUAlphaState *env)
>      target_restore_altstack(&frame->uc.tuc_stack, env);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>
>  badframe:
>      unlock_user_struct(frame, frame_addr, 0);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  void setup_sigtramp(abi_ulong sigtramp_page)
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index 1fcf19750e..f153ab503a 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -409,7 +409,7 @@ void cpu_loop(CPUARMState *env)
>                                       0, 0);
>                      if (ret == -QEMU_ERESTARTSYS) {
>                          env->regs[15] -= env->thumb ? 2 : 4;
> -                    } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> +                    } else if (ret != -QEMU_ESIGRETURN) {
>                          env->regs[0] = ret;
>                      }
>                  }
> diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
> index df9f8e8eb2..cf99fd7b8a 100644
> --- a/linux-user/arm/signal.c
> +++ b/linux-user/arm/signal.c
> @@ -511,12 +511,12 @@ long do_sigreturn(CPUARMState *env)
>      }
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      unlock_user_struct(frame, frame_addr, 0);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  long do_rt_sigreturn(CPUARMState *env)
> @@ -546,12 +546,12 @@ long do_rt_sigreturn(CPUARMState *env)
>      }
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      unlock_user_struct(frame, frame_addr, 0);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  /*
> diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
> index f3e5b13f89..5213aebf55 100644
> --- a/linux-user/cris/cpu_loop.c
> +++ b/linux-user/cris/cpu_loop.c
> @@ -52,7 +52,7 @@ void cpu_loop(CPUCRISState *env)
>                               0, 0);
>              if (ret == -QEMU_ERESTARTSYS) {
>                  env->pc -= 2;
> -            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> +            } else if (ret != -QEMU_ESIGRETURN) {
>                  env->regs[10] = ret;
>              }
>              break;
> diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
> index 7f6aca934e..4f532b2903 100644
> --- a/linux-user/cris/signal.c
> +++ b/linux-user/cris/signal.c
> @@ -177,10 +177,10 @@ long do_sigreturn(CPUCRISState *env)
>
>      restore_sigcontext(&frame->sc, env);
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  badframe:
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  long do_rt_sigreturn(CPUCRISState *env)
> diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
> index 1cacbf42f1..b84e25bf71 100644
> --- a/linux-user/hexagon/cpu_loop.c
> +++ b/linux-user/hexagon/cpu_loop.c
> @@ -56,7 +56,7 @@ void cpu_loop(CPUHexagonState *env)
>                               0, 0);
>              if (ret == -QEMU_ERESTARTSYS) {
>                  env->gpr[HEX_REG_PC] -= 4;
> -            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> +            } else if (ret != -QEMU_ESIGRETURN) {
>                  env->gpr[0] = ret;
>              }
>              break;
> diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
> index 74e61739a0..ad4e3822d5 100644
> --- a/linux-user/hexagon/signal.c
> +++ b/linux-user/hexagon/signal.c
> @@ -268,7 +268,7 @@ long do_rt_sigreturn(CPUHexagonState *env)
>      target_restore_altstack(&frame->uc.uc_stack, env);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      unlock_user_struct(frame, frame_addr, 0);
> diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
> index 5315224d12..a47a63176b 100644
> --- a/linux-user/hppa/cpu_loop.c
> +++ b/linux-user/hppa/cpu_loop.c
> @@ -134,7 +134,7 @@ void cpu_loop(CPUHPPAState *env)
>                  env->iaoq_b = env->gr[31] + 4;
>                  break;
>              case -QEMU_ERESTARTSYS:
> -            case -TARGET_QEMU_ESIGRETURN:
> +            case -QEMU_ESIGRETURN:
>                  break;
>              }
>              break;
> diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
> index c2fbc26ebb..962f551c04 100644
> --- a/linux-user/hppa/signal.c
> +++ b/linux-user/hppa/signal.c
> @@ -191,9 +191,9 @@ long do_rt_sigreturn(CPUArchState *env)
>      target_restore_altstack(&frame->uc.tuc_stack, env);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>   badframe:
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
> diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
> index fbd9a353e5..9aaae93e2f 100644
> --- a/linux-user/i386/cpu_loop.c
> +++ b/linux-user/i386/cpu_loop.c
> @@ -181,7 +181,7 @@ static void emulate_vsyscall(CPUX86State *env)
>                       env->regs[R_EDX], env->regs[10], env->regs[8],
>                       env->regs[9], 0, 0);
>      g_assert(ret != -QEMU_ERESTARTSYS);
> -    g_assert(ret != -TARGET_QEMU_ESIGRETURN);
> +    g_assert(ret != -QEMU_ESIGRETURN);
>      if (ret == -TARGET_EFAULT) {
>          goto sigsegv;
>      }
> @@ -225,7 +225,7 @@ void cpu_loop(CPUX86State *env)
>                               0, 0);
>              if (ret == -QEMU_ERESTARTSYS) {
>                  env->eip -= 2;
> -            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> +            } else if (ret != -QEMU_ESIGRETURN) {
>                  env->regs[R_EAX] = ret;
>              }
>              break;
> @@ -243,7 +243,7 @@ void cpu_loop(CPUX86State *env)
>                               0, 0);
>              if (ret == -QEMU_ERESTARTSYS) {
>                  env->eip -= 2;
> -            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> +            } else if (ret != -QEMU_ESIGRETURN) {
>                  env->regs[R_EAX] = ret;
>              }
>              break;
> diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
> index 433efa3d69..4372621a4d 100644
> --- a/linux-user/i386/signal.c
> +++ b/linux-user/i386/signal.c
> @@ -559,12 +559,12 @@ long do_sigreturn(CPUX86State *env)
>      if (restore_sigcontext(env, &frame->sc))
>          goto badframe;
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      unlock_user_struct(frame, frame_addr, 0);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>  #endif
>
> @@ -588,12 +588,12 @@ long do_rt_sigreturn(CPUX86State *env)
>      target_restore_altstack(&frame->uc.tuc_stack, env);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      unlock_user_struct(frame, frame_addr, 0);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  #ifndef TARGET_X86_64
> diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
> index b03c21a3dc..3181594414 100644
> --- a/linux-user/m68k/cpu_loop.c
> +++ b/linux-user/m68k/cpu_loop.c
> @@ -82,7 +82,7 @@ void cpu_loop(CPUM68KState *env)
>                                   0, 0);
>                  if (ret == -QEMU_ERESTARTSYS) {
>                      env->pc -= 2;
> -                } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> +                } else if (ret != -QEMU_ESIGRETURN) {
>                      env->dregs[0] = ret;
>                  }
>              }
> diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c
> index ec33482e14..5f35354487 100644
> --- a/linux-user/m68k/signal.c
> +++ b/linux-user/m68k/signal.c
> @@ -353,11 +353,11 @@ long do_sigreturn(CPUM68KState *env)
>      restore_sigcontext(env, &frame->sc);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  long do_rt_sigreturn(CPUM68KState *env)
> @@ -381,12 +381,12 @@ long do_rt_sigreturn(CPUM68KState *env)
>      target_restore_altstack(&frame->uc.tuc_stack, env);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      unlock_user_struct(frame, frame_addr, 0);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  void setup_sigtramp(abi_ulong sigtramp_page)
> diff --git a/linux-user/microblaze/cpu_loop.c
> b/linux-user/microblaze/cpu_loop.c
> index 6e368f986e..ff1fb26c8b 100644
> --- a/linux-user/microblaze/cpu_loop.c
> +++ b/linux-user/microblaze/cpu_loop.c
> @@ -56,7 +56,7 @@ void cpu_loop(CPUMBState *env)
>              if (ret == -QEMU_ERESTARTSYS) {
>                  /* Wind back to before the syscall. */
>                  env->pc -= 4;
> -            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> +            } else if (ret != -QEMU_ESIGRETURN) {
>                  env->regs[3] = ret;
>              }
>              /* All syscall exits result in guest r14 being equal to the
> diff --git a/linux-user/microblaze/signal.c
> b/linux-user/microblaze/signal.c
> index 8ebb6a1b7d..5188d74025 100644
> --- a/linux-user/microblaze/signal.c
> +++ b/linux-user/microblaze/signal.c
> @@ -207,12 +207,12 @@ long do_rt_sigreturn(CPUMBState *env)
>      target_restore_altstack(&frame->uc.tuc_stack, env);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>   badframe:
>      unlock_user_struct(frame, frame_addr, 0);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  void setup_sigtramp(abi_ulong sigtramp_page)
> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index 64f308c6ad..32f9fc1c1c 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -145,7 +145,7 @@ done_syscall:
>                  env->active_tc.PC -= 4;
>                  break;
>              }
> -            if (ret == -TARGET_QEMU_ESIGRETURN) {
> +            if (ret == -QEMU_ESIGRETURN) {
>                  /* Returning from a successful sigreturn syscall.
>                     Avoid clobbering register state.  */
>                  break;
> diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
> index 8f79e405ec..58a9d7a8a3 100644
> --- a/linux-user/mips/signal.c
> +++ b/linux-user/mips/signal.c
> @@ -281,11 +281,11 @@ long do_sigreturn(CPUMIPSState *regs)
>      /* I am not sure this is right, but it seems to work
>      * maybe a problem with nested signals ? */
>      regs->CP0_EPC = 0;
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>  # endif /* O32 */
>
> @@ -371,11 +371,11 @@ long do_rt_sigreturn(CPUMIPSState *env)
>      /* I am not sure this is right, but it seems to work
>      * maybe a problem with nested signals ? */
>      env->CP0_EPC = 0;
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  void setup_sigtramp(abi_ulong sigtramp_page)
> diff --git a/linux-user/openrisc/cpu_loop.c
> b/linux-user/openrisc/cpu_loop.c
> index 3147ab2b62..592901a68b 100644
> --- a/linux-user/openrisc/cpu_loop.c
> +++ b/linux-user/openrisc/cpu_loop.c
> @@ -50,7 +50,7 @@ void cpu_loop(CPUOpenRISCState *env)
>                               cpu_get_gpr(env, 8), 0, 0);
>              if (ret == -QEMU_ERESTARTSYS) {
>                  env->pc -= 4;
> -            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> +            } else if (ret != -QEMU_ESIGRETURN) {
>                  cpu_set_gpr(env, 11, ret);
>              }
>              break;
> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
> index 5348641e9e..30c82f2354 100644
> --- a/linux-user/ppc/cpu_loop.c
> +++ b/linux-user/ppc/cpu_loop.c
> @@ -432,7 +432,7 @@ void cpu_loop(CPUPPCState *env)
>                  env->nip -= 4;
>                  break;
>              }
> -            if (ret == (target_ulong)(-TARGET_QEMU_ESIGRETURN)) {
> +            if (ret == (target_ulong)(-QEMU_ESIGRETURN)) {
>                  /* Returning from a successful sigreturn syscall.
>                     Avoid corrupting register state.  */
>                  break;
> diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
> index 90a0369632..176c9d8503 100644
> --- a/linux-user/ppc/signal.c
> +++ b/linux-user/ppc/signal.c
> @@ -591,13 +591,13 @@ long do_sigreturn(CPUPPCState *env)
>
>      unlock_user_struct(sr, sr_addr, 1);
>      unlock_user_struct(sc, sc_addr, 1);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  sigsegv:
>      unlock_user_struct(sr, sr_addr, 1);
>      unlock_user_struct(sc, sc_addr, 1);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>  #endif /* !defined(TARGET_PPC64) */
>
> @@ -646,12 +646,12 @@ long do_rt_sigreturn(CPUPPCState *env)
>      target_restore_altstack(&rt_sf->uc.tuc_stack, env);
>
>      unlock_user_struct(rt_sf, rt_sf_addr, 1);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  sigsegv:
>      unlock_user_struct(rt_sf, rt_sf_addr, 1);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  /* This syscall implements {get,set,swap}context for userland.  */
> @@ -704,7 +704,7 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong
> uold_ctx,
>              /* We cannot return to a partially updated context.  */
>              force_sig(TARGET_SIGSEGV);
>          }
> -        return -TARGET_QEMU_ESIGRETURN;
> +        return -QEMU_ESIGRETURN;
>      }
>
>      return 0;
> diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
> index 20f8c48b1d..0cd8985cb8 100644
> --- a/linux-user/riscv/cpu_loop.c
> +++ b/linux-user/riscv/cpu_loop.c
> @@ -71,7 +71,7 @@ void cpu_loop(CPURISCVState *env)
>              }
>              if (ret == -QEMU_ERESTARTSYS) {
>                  env->pc -= 4;
> -            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> +            } else if (ret != -QEMU_ESIGRETURN) {
>                  env->gpr[xA0] = ret;
>              }
>              if (cs->singlestep_enabled) {
> diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
> index a0f9542ce3..296e39fbf0 100644
> --- a/linux-user/riscv/signal.c
> +++ b/linux-user/riscv/signal.c
> @@ -188,7 +188,7 @@ long do_rt_sigreturn(CPURISCVState *env)
>      target_restore_altstack(&frame->uc.uc_stack, env);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      unlock_user_struct(frame, frame_addr, 0);
> diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
> index 043582ca7c..ad0c3cd263 100644
> --- a/linux-user/s390x/cpu_loop.c
> +++ b/linux-user/s390x/cpu_loop.c
> @@ -85,7 +85,7 @@ void cpu_loop(CPUS390XState *env)
>                               env->regs[6], env->regs[7], 0, 0);
>              if (ret == -QEMU_ERESTARTSYS) {
>                  env->psw.addr -= env->int_svc_ilen;
> -            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> +            } else if (ret != -QEMU_ESIGRETURN) {
>                  env->regs[2] = ret;
>              }
>              break;
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index 676b948147..f47713e04a 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -359,7 +359,7 @@ long do_sigreturn(CPUS390XState *env)
>      trace_user_do_sigreturn(env, frame_addr);
>      if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
>          force_sig(TARGET_SIGSEGV);
> -        return -TARGET_QEMU_ESIGRETURN;
> +        return -QEMU_ESIGRETURN;
>      }
>
>      /* Make sure that we're initializing all of target_set. */
> @@ -373,7 +373,7 @@ long do_sigreturn(CPUS390XState *env)
>      restore_sigregs_ext(env, &frame->sregs_ext);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  long do_rt_sigreturn(CPUS390XState *env)
> @@ -385,7 +385,7 @@ long do_rt_sigreturn(CPUS390XState *env)
>      trace_user_do_rt_sigreturn(env, frame_addr);
>      if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
>          force_sig(TARGET_SIGSEGV);
> -        return -TARGET_QEMU_ESIGRETURN;
> +        return -QEMU_ESIGRETURN;
>      }
>      target_to_host_sigset(&set, &frame->uc.tuc_sigmask);
>
> @@ -397,7 +397,7 @@ long do_rt_sigreturn(CPUS390XState *env)
>      target_restore_altstack(&frame->uc.tuc_stack, env);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  void setup_sigtramp(abi_ulong sigtramp_page)
> diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
> index 6c4ebfa969..3290f6445c 100644
> --- a/linux-user/sh4/cpu_loop.c
> +++ b/linux-user/sh4/cpu_loop.c
> @@ -52,7 +52,7 @@ void cpu_loop(CPUSH4State *env)
>                               0, 0);
>              if (ret == -QEMU_ERESTARTSYS) {
>                  env->pc -= 2;
> -            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> +            } else if (ret != -QEMU_ESIGRETURN) {
>                  env->gregs[0] = ret;
>              }
>              break;
> diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c
> index faa869fb19..f6a18bc6b5 100644
> --- a/linux-user/sh4/signal.c
> +++ b/linux-user/sh4/signal.c
> @@ -286,12 +286,12 @@ long do_sigreturn(CPUSH4State *regs)
>      restore_sigcontext(regs, &frame->sc);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      unlock_user_struct(frame, frame_addr, 0);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  long do_rt_sigreturn(CPUSH4State *regs)
> @@ -313,12 +313,12 @@ long do_rt_sigreturn(CPUSH4State *regs)
>      target_restore_altstack(&frame->uc.tuc_stack, regs);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      unlock_user_struct(frame, frame_addr, 0);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  void setup_sigtramp(abi_ulong sigtramp_page)
> diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
> index 529337c5e0..8765ab6020 100644
> --- a/linux-user/sparc/cpu_loop.c
> +++ b/linux-user/sparc/cpu_loop.c
> @@ -181,7 +181,7 @@ void cpu_loop (CPUSPARCState *env)
>                                env->regwptr[2], env->regwptr[3],
>                                env->regwptr[4], env->regwptr[5],
>                                0, 0);
> -            if (ret == -QEMU_ERESTARTSYS || ret ==
> -TARGET_QEMU_ESIGRETURN) {
> +            if (ret == -QEMU_ERESTARTSYS || ret == -QEMU_ESIGRETURN) {
>                  break;
>              }
>              if ((abi_ulong)ret >= (abi_ulong)(-515)) {
> diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
> index 23e1e761de..b501750fe0 100644
> --- a/linux-user/sparc/signal.c
> +++ b/linux-user/sparc/signal.c
> @@ -431,12 +431,12 @@ long do_sigreturn(CPUSPARCState *env)
>      set_sigmask(&host_set);
>
>      unlock_user_struct(sf, sf_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>   segv_and_exit:
>      unlock_user_struct(sf, sf_addr, 0);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  #else
>      return -TARGET_ENOSYS;
>  #endif
> @@ -495,12 +495,12 @@ long do_rt_sigreturn(CPUSPARCState *env)
>      env->npc = tnpc;
>
>      unlock_user_struct(sf, sf_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>   segv_and_exit:
>      unlock_user_struct(sf, sf_addr, 0);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  #if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 3c0e341e45..1ef6abb776 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -548,7 +548,7 @@ const char *target_strerror(int err)
>      if (err == QEMU_ERESTARTSYS) {
>          return "To be restarted";
>      }
> -    if (err == TARGET_QEMU_ESIGRETURN) {
> +    if (err == QEMU_ESIGRETURN) {
>          return "Successful exit from sigreturn";
>      }
>
> diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
> index 29cc6f3830..6bc6d6dee6 100644
> --- a/linux-user/xtensa/cpu_loop.c
> +++ b/linux-user/xtensa/cpu_loop.c
> @@ -188,7 +188,7 @@ void cpu_loop(CPUXtensaState *env)
>                      env->pc -= 3;
>                      break;
>
> -                case -TARGET_QEMU_ESIGRETURN:
> +                case -QEMU_ESIGRETURN:
>                      break;
>                  }
>                  break;
> diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
> index 81572a5fc7..06d91a37ec 100644
> --- a/linux-user/xtensa/signal.c
> +++ b/linux-user/xtensa/signal.c
> @@ -263,12 +263,12 @@ long do_rt_sigreturn(CPUXtensaState *env)
>      target_restore_altstack(&frame->uc.tuc_stack, env);
>
>      unlock_user_struct(frame, frame_addr, 0);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>
>  badframe:
>      unlock_user_struct(frame, frame_addr, 0);
>      force_sig(TARGET_SIGSEGV);
> -    return -TARGET_QEMU_ESIGRETURN;
> +    return -QEMU_ESIGRETURN;
>  }
>
>  void setup_sigtramp(abi_ulong sigtramp_page)
> --
> 2.25.1
>
>

--00000000000078d20005d0ff0049
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:04 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">This value is fully internal to qemu, and so is not a TAR=
GET define.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/generic/target_errno_defs.h |=C2=A0 2 +-<br>
=C2=A0linux-user/aarch64/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0linux-user/aarch64/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 4 ++--<br>
=C2=A0linux-user/alpha/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-<br>
=C2=A0linux-user/alpha/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0linux-user/arm/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A0linux-user/arm/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0linux-user/cris/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/cris/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0linux-user/hexagon/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0linux-user/hexagon/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-<br>
=C2=A0linux-user/hppa/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/hppa/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0linux-user/i386/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 6 +++---<br>
=C2=A0linux-user/i386/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 8 ++++----<br>
=C2=A0linux-user/m68k/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/m68k/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 8 ++++----<br>
=C2=A0linux-user/microblaze/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 =
+-<br>
=C2=A0linux-user/microblaze/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 ++--<br>
=C2=A0linux-user/mips/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/mips/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 8 ++++----<br>
=C2=A0linux-user/openrisc/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
=C2=A0linux-user/ppc/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A0linux-user/ppc/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 10 +++++-----<br>
=C2=A0linux-user/riscv/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-<br>
=C2=A0linux-user/riscv/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A0linux-user/s390x/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-<br>
=C2=A0linux-user/s390x/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0linux-user/sh4/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A0linux-user/sh4/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0linux-user/sparc/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 2 +-<br>
=C2=A0linux-user/sparc/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0linux-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/xtensa/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 2 +-<br>
=C2=A0linux-user/xtensa/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 4 ++--<br>
=C2=A035 files changed, 70 insertions(+), 70 deletions(-)<br></blockquote><=
div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdim=
p.com">imp@bsdimp.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
diff --git a/linux-user/generic/target_errno_defs.h b/linux-user/generic/ta=
rget_errno_defs.h<br>
index 58a06a10d6..bb37d88be9 100644<br>
--- a/linux-user/generic/target_errno_defs.h<br>
+++ b/linux-user/generic/target_errno_defs.h<br>
@@ -162,6 +162,6 @@<br>
=C2=A0 * ERESTART_NOINTR (which is kernel internal) to guarantee that we wo=
n&#39;t<br>
=C2=A0 * clash with a valid guest errno now or in the future.<br>
=C2=A0 */<br>
-#define TARGET_QEMU_ESIGRETURN 513=C2=A0 =C2=A0 =C2=A0/* Return from signa=
l */<br>
+#define QEMU_ESIGRETURN 513=C2=A0 =C2=A0 =C2=A0/* Return from signal */<br=
>
<br>
=C2=A0#endif<br>
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c<=
br>
index 775ba43913..98b53962cd 100644<br>
--- a/linux-user/aarch64/cpu_loop.c<br>
+++ b/linux-user/aarch64/cpu_loop.c<br>
@@ -101,7 +101,7 @@ void cpu_loop(CPUARMState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -QEMU_ERESTA=
RTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc -=
=3D 4;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -TARGET_QEMU=
_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -QEMU_ESIGRE=
TURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;xregs=
[0] =3D ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c<br>
index 29c52db3f1..df9e39a4ba 100644<br>
--- a/linux-user/aarch64/signal.c<br>
+++ b/linux-user/aarch64/signal.c<br>
@@ -556,12 +556,12 @@ long do_rt_sigreturn(CPUARMState *env)<br>
=C2=A0 =C2=A0 =C2=A0target_restore_altstack(&amp;frame-&gt;uc.tuc_stack, en=
v);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0 badframe:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0long do_sigreturn(CPUARMState *env)<br>
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c<br>
index ce9b251ce3..37c33f0ccd 100644<br>
--- a/linux-user/alpha/cpu_loop.c<br>
+++ b/linux-user/alpha/cpu_loop.c<br>
@@ -102,7 +102,7 @@ void cpu_loop(CPUAlphaState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0env-&gt;pc -=3D 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sysret =3D=3D =
-TARGET_QEMU_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sysret =3D=3D =
-QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Syscall wr=
ites 0 to V0 to bypass error check, similar<br>
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c<br>
index bbe3dd175a..4ec42994d4 100644<br>
--- a/linux-user/alpha/signal.c<br>
+++ b/linux-user/alpha/signal.c<br>
@@ -225,11 +225,11 @@ long do_sigreturn(CPUAlphaState *env)<br>
<br>
=C2=A0 =C2=A0 =C2=A0restore_sigcontext(env, sc);<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(sc, sc_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0long do_rt_sigreturn(CPUAlphaState *env)<br>
@@ -249,13 +249,13 @@ long do_rt_sigreturn(CPUAlphaState *env)<br>
=C2=A0 =C2=A0 =C2=A0target_restore_altstack(&amp;frame-&gt;uc.tuc_stack, en=
v);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0void setup_sigtramp(abi_ulong sigtramp_page)<br>
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c<br>
index 1fcf19750e..f153ab503a 100644<br>
--- a/linux-user/arm/cpu_loop.c<br>
+++ b/linux-user/arm/cpu_loop.c<br>
@@ -409,7 +409,7 @@ void cpu_loop(CPUARMState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (ret =3D=3D -QEMU_ERESTARTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0env-&gt;regs[15] -=3D env-&gt;thumb ? 2 : 4;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } el=
se if (ret !=3D -TARGET_QEMU_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } el=
se if (ret !=3D -QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0env-&gt;regs[0] =3D ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c<br>
index df9f8e8eb2..cf99fd7b8a 100644<br>
--- a/linux-user/arm/signal.c<br>
+++ b/linux-user/arm/signal.c<br>
@@ -511,12 +511,12 @@ long do_sigreturn(CPUARMState *env)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0long do_rt_sigreturn(CPUARMState *env)<br>
@@ -546,12 +546,12 @@ long do_rt_sigreturn(CPUARMState *env)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c<br>
index f3e5b13f89..5213aebf55 100644<br>
--- a/linux-user/cris/cpu_loop.c<br>
+++ b/linux-user/cris/cpu_loop.c<br>
@@ -52,7 +52,7 @@ void cpu_loop(CPUCRISState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -QEMU_ERESTA=
RTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc -=
=3D 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -TARGET_QEMU=
_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -QEMU_ESIGRE=
TURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;regs[=
10] =3D ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c<br>
index 7f6aca934e..4f532b2903 100644<br>
--- a/linux-user/cris/signal.c<br>
+++ b/linux-user/cris/signal.c<br>
@@ -177,10 +177,10 @@ long do_sigreturn(CPUCRISState *env)<br>
<br>
=C2=A0 =C2=A0 =C2=A0restore_sigcontext(&amp;frame-&gt;sc, env);<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0long do_rt_sigreturn(CPUCRISState *env)<br>
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c<=
br>
index 1cacbf42f1..b84e25bf71 100644<br>
--- a/linux-user/hexagon/cpu_loop.c<br>
+++ b/linux-user/hexagon/cpu_loop.c<br>
@@ -56,7 +56,7 @@ void cpu_loop(CPUHexagonState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -QEMU_ERESTA=
RTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;gpr[H=
EX_REG_PC] -=3D 4;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -TARGET_QEMU=
_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -QEMU_ESIGRE=
TURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;gpr[0=
] =3D ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c<br>
index 74e61739a0..ad4e3822d5 100644<br>
--- a/linux-user/hexagon/signal.c<br>
+++ b/linux-user/hexagon/signal.c<br>
@@ -268,7 +268,7 @@ long do_rt_sigreturn(CPUHexagonState *env)<br>
=C2=A0 =C2=A0 =C2=A0target_restore_altstack(&amp;frame-&gt;uc.uc_stack, env=
);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c<br>
index 5315224d12..a47a63176b 100644<br>
--- a/linux-user/hppa/cpu_loop.c<br>
+++ b/linux-user/hppa/cpu_loop.c<br>
@@ -134,7 +134,7 @@ void cpu_loop(CPUHPPAState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;iaoq_=
b =3D env-&gt;gr[31] + 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case -QEMU_ERESTARTSYS:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case -TARGET_QEMU_ESIGRETURN:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case -QEMU_ESIGRETURN:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c<br>
index c2fbc26ebb..962f551c04 100644<br>
--- a/linux-user/hppa/signal.c<br>
+++ b/linux-user/hppa/signal.c<br>
@@ -191,9 +191,9 @@ long do_rt_sigreturn(CPUArchState *env)<br>
=C2=A0 =C2=A0 =C2=A0target_restore_altstack(&amp;frame-&gt;uc.tuc_stack, en=
v);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0 badframe:<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c<br>
index fbd9a353e5..9aaae93e2f 100644<br>
--- a/linux-user/i386/cpu_loop.c<br>
+++ b/linux-user/i386/cpu_loop.c<br>
@@ -181,7 +181,7 @@ static void emulate_vsyscall(CPUX86State *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 env-&gt;regs[R_EDX], env-&gt;regs[10], env-&gt;regs[8],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 env-&gt;regs[9], 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(ret !=3D -QEMU_ERESTARTSYS);<br>
-=C2=A0 =C2=A0 g_assert(ret !=3D -TARGET_QEMU_ESIGRETURN);<br>
+=C2=A0 =C2=A0 g_assert(ret !=3D -QEMU_ESIGRETURN);<br>
=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -TARGET_EFAULT) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto sigsegv;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -225,7 +225,7 @@ void cpu_loop(CPUX86State *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -QEMU_ERESTA=
RTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;eip -=
=3D 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -TARGET_QEMU=
_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -QEMU_ESIGRE=
TURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;regs[=
R_EAX] =3D ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -243,7 +243,7 @@ void cpu_loop(CPUX86State *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -QEMU_ERESTA=
RTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;eip -=
=3D 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -TARGET_QEMU=
_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -QEMU_ESIGRE=
TURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;regs[=
R_EAX] =3D ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c<br>
index 433efa3d69..4372621a4d 100644<br>
--- a/linux-user/i386/signal.c<br>
+++ b/linux-user/i386/signal.c<br>
@@ -559,12 +559,12 @@ long do_sigreturn(CPUX86State *env)<br>
=C2=A0 =C2=A0 =C2=A0if (restore_sigcontext(env, &amp;frame-&gt;sc))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto badframe;<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
@@ -588,12 +588,12 @@ long do_rt_sigreturn(CPUX86State *env)<br>
=C2=A0 =C2=A0 =C2=A0target_restore_altstack(&amp;frame-&gt;uc.tuc_stack, en=
v);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0#ifndef TARGET_X86_64<br>
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c<br>
index b03c21a3dc..3181594414 100644<br>
--- a/linux-user/m68k/cpu_loop.c<br>
+++ b/linux-user/m68k/cpu_loop.c<br>
@@ -82,7 +82,7 @@ void cpu_loop(CPUM68KState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=
=3D -QEMU_ERESTARTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0env-&gt;pc -=3D 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=
=3D -TARGET_QEMU_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=
=3D -QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0env-&gt;dregs[0] =3D ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/linux-user/m68k/signal.c b/linux-user/m68k/signal.c<br>
index ec33482e14..5f35354487 100644<br>
--- a/linux-user/m68k/signal.c<br>
+++ b/linux-user/m68k/signal.c<br>
@@ -353,11 +353,11 @@ long do_sigreturn(CPUM68KState *env)<br>
=C2=A0 =C2=A0 =C2=A0restore_sigcontext(env, &amp;frame-&gt;sc);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0long do_rt_sigreturn(CPUM68KState *env)<br>
@@ -381,12 +381,12 @@ long do_rt_sigreturn(CPUM68KState *env)<br>
=C2=A0 =C2=A0 =C2=A0target_restore_altstack(&amp;frame-&gt;uc.tuc_stack, en=
v);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0void setup_sigtramp(abi_ulong sigtramp_page)<br>
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_l=
oop.c<br>
index 6e368f986e..ff1fb26c8b 100644<br>
--- a/linux-user/microblaze/cpu_loop.c<br>
+++ b/linux-user/microblaze/cpu_loop.c<br>
@@ -56,7 +56,7 @@ void cpu_loop(CPUMBState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -QEMU_ERESTA=
RTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Wind back =
to before the syscall. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc -=
=3D 4;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -TARGET_QEMU=
_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -QEMU_ESIGRE=
TURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;regs[=
3] =3D ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* All syscall exits result=
 in guest r14 being equal to the<br>
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.=
c<br>
index 8ebb6a1b7d..5188d74025 100644<br>
--- a/linux-user/microblaze/signal.c<br>
+++ b/linux-user/microblaze/signal.c<br>
@@ -207,12 +207,12 @@ long do_rt_sigreturn(CPUMBState *env)<br>
=C2=A0 =C2=A0 =C2=A0target_restore_altstack(&amp;frame-&gt;uc.tuc_stack, en=
v);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0 badframe:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0void setup_sigtramp(abi_ulong sigtramp_page)<br>
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c<br>
index 64f308c6ad..32f9fc1c1c 100644<br>
--- a/linux-user/mips/cpu_loop.c<br>
+++ b/linux-user/mips/cpu_loop.c<br>
@@ -145,7 +145,7 @@ done_syscall:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;activ=
e_tc.PC -=3D 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_QEMU_ESIG=
RETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ESIGRETURN)=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Returning =
from a successful sigreturn syscall.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Avoid=
 clobbering register state.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c<br>
index 8f79e405ec..58a9d7a8a3 100644<br>
--- a/linux-user/mips/signal.c<br>
+++ b/linux-user/mips/signal.c<br>
@@ -281,11 +281,11 @@ long do_sigreturn(CPUMIPSState *regs)<br>
=C2=A0 =C2=A0 =C2=A0/* I am not sure this is right, but it seems to work<br=
>
=C2=A0 =C2=A0 =C2=A0* maybe a problem with nested signals ? */<br>
=C2=A0 =C2=A0 =C2=A0regs-&gt;CP0_EPC =3D 0;<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
=C2=A0# endif /* O32 */<br>
<br>
@@ -371,11 +371,11 @@ long do_rt_sigreturn(CPUMIPSState *env)<br>
=C2=A0 =C2=A0 =C2=A0/* I am not sure this is right, but it seems to work<br=
>
=C2=A0 =C2=A0 =C2=A0* maybe a problem with nested signals ? */<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;CP0_EPC =3D 0;<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0void setup_sigtramp(abi_ulong sigtramp_page)<br>
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.=
c<br>
index 3147ab2b62..592901a68b 100644<br>
--- a/linux-user/openrisc/cpu_loop.c<br>
+++ b/linux-user/openrisc/cpu_loop.c<br>
@@ -50,7 +50,7 @@ void cpu_loop(CPUOpenRISCState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_get_gpr(env, 8), 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -QEMU_ERESTA=
RTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc -=
=3D 4;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -TARGET_QEMU=
_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -QEMU_ESIGRE=
TURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_set_gpr(e=
nv, 11, ret);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c<br>
index 5348641e9e..30c82f2354 100644<br>
--- a/linux-user/ppc/cpu_loop.c<br>
+++ b/linux-user/ppc/cpu_loop.c<br>
@@ -432,7 +432,7 @@ void cpu_loop(CPUPPCState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;nip -=
=3D 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D (target_ulong)(-T=
ARGET_QEMU_ESIGRETURN)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D (target_ulong)(-Q=
EMU_ESIGRETURN)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Returning =
from a successful sigreturn syscall.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Avoid=
 corrupting register state.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c<br>
index 90a0369632..176c9d8503 100644<br>
--- a/linux-user/ppc/signal.c<br>
+++ b/linux-user/ppc/signal.c<br>
@@ -591,13 +591,13 @@ long do_sigreturn(CPUPPCState *env)<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(sr, sr_addr, 1);<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(sc, sc_addr, 1);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0sigsegv:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(sr, sr_addr, 1);<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(sc, sc_addr, 1);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
=C2=A0#endif /* !defined(TARGET_PPC64) */<br>
<br>
@@ -646,12 +646,12 @@ long do_rt_sigreturn(CPUPPCState *env)<br>
=C2=A0 =C2=A0 =C2=A0target_restore_altstack(&amp;rt_sf-&gt;uc.tuc_stack, en=
v);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(rt_sf, rt_sf_addr, 1);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0sigsegv:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(rt_sf, rt_sf_addr, 1);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0/* This syscall implements {get,set,swap}context for userland.=C2=A0 =
*/<br>
@@ -704,7 +704,7 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong uo=
ld_ctx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We cannot return to a pa=
rtially updated context.=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c<br>
index 20f8c48b1d..0cd8985cb8 100644<br>
--- a/linux-user/riscv/cpu_loop.c<br>
+++ b/linux-user/riscv/cpu_loop.c<br>
@@ -71,7 +71,7 @@ void cpu_loop(CPURISCVState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -QEMU_ERESTA=
RTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc -=
=3D 4;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -TARGET_QEMU=
_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -QEMU_ESIGRE=
TURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;gpr[x=
A0] =3D ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cs-&gt;singlestep_enabl=
ed) {<br>
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c<br>
index a0f9542ce3..296e39fbf0 100644<br>
--- a/linux-user/riscv/signal.c<br>
+++ b/linux-user/riscv/signal.c<br>
@@ -188,7 +188,7 @@ long do_rt_sigreturn(CPURISCVState *env)<br>
=C2=A0 =C2=A0 =C2=A0target_restore_altstack(&amp;frame-&gt;uc.uc_stack, env=
);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c<br>
index 043582ca7c..ad0c3cd263 100644<br>
--- a/linux-user/s390x/cpu_loop.c<br>
+++ b/linux-user/s390x/cpu_loop.c<br>
@@ -85,7 +85,7 @@ void cpu_loop(CPUS390XState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;regs[6], env-&gt;regs[7], 0, 0);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -QEMU_ERESTA=
RTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;psw.a=
ddr -=3D env-&gt;int_svc_ilen;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -TARGET_QEMU=
_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -QEMU_ESIGRE=
TURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;regs[=
2] =3D ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c<br>
index 676b948147..f47713e04a 100644<br>
--- a/linux-user/s390x/signal.c<br>
+++ b/linux-user/s390x/signal.c<br>
@@ -359,7 +359,7 @@ long do_sigreturn(CPUS390XState *env)<br>
=C2=A0 =C2=A0 =C2=A0trace_user_do_sigreturn(env, frame_addr);<br>
=C2=A0 =C2=A0 =C2=A0if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1=
)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Make sure that we&#39;re initializing all of target_=
set. */<br>
@@ -373,7 +373,7 @@ long do_sigreturn(CPUS390XState *env)<br>
=C2=A0 =C2=A0 =C2=A0restore_sigregs_ext(env, &amp;frame-&gt;sregs_ext);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0long do_rt_sigreturn(CPUS390XState *env)<br>
@@ -385,7 +385,7 @@ long do_rt_sigreturn(CPUS390XState *env)<br>
=C2=A0 =C2=A0 =C2=A0trace_user_do_rt_sigreturn(env, frame_addr);<br>
=C2=A0 =C2=A0 =C2=A0if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1=
)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0target_to_host_sigset(&amp;set, &amp;frame-&gt;uc.tuc_s=
igmask);<br>
<br>
@@ -397,7 +397,7 @@ long do_rt_sigreturn(CPUS390XState *env)<br>
=C2=A0 =C2=A0 =C2=A0target_restore_altstack(&amp;frame-&gt;uc.tuc_stack, en=
v);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0void setup_sigtramp(abi_ulong sigtramp_page)<br>
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c<br>
index 6c4ebfa969..3290f6445c 100644<br>
--- a/linux-user/sh4/cpu_loop.c<br>
+++ b/linux-user/sh4/cpu_loop.c<br>
@@ -52,7 +52,7 @@ void cpu_loop(CPUSH4State *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -QEMU_ERESTA=
RTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc -=
=3D 2;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -TARGET_QEMU=
_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ret !=3D -QEMU_ESIGRE=
TURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;gregs=
[0] =3D ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/linux-user/sh4/signal.c b/linux-user/sh4/signal.c<br>
index faa869fb19..f6a18bc6b5 100644<br>
--- a/linux-user/sh4/signal.c<br>
+++ b/linux-user/sh4/signal.c<br>
@@ -286,12 +286,12 @@ long do_sigreturn(CPUSH4State *regs)<br>
=C2=A0 =C2=A0 =C2=A0restore_sigcontext(regs, &amp;frame-&gt;sc);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0long do_rt_sigreturn(CPUSH4State *regs)<br>
@@ -313,12 +313,12 @@ long do_rt_sigreturn(CPUSH4State *regs)<br>
=C2=A0 =C2=A0 =C2=A0target_restore_altstack(&amp;frame-&gt;uc.tuc_stack, re=
gs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0void setup_sigtramp(abi_ulong sigtramp_page)<br>
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c<br>
index 529337c5e0..8765ab6020 100644<br>
--- a/linux-user/sparc/cpu_loop.c<br>
+++ b/linux-user/sparc/cpu_loop.c<br>
@@ -181,7 +181,7 @@ void cpu_loop (CPUSPARCState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;regwptr[2], env-&gt;regwptr[3=
],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;regwptr[4], env-&gt;regwptr[5=
],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
 || ret =3D=3D -TARGET_QEMU_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
 || ret =3D=3D -QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((abi_ulong)ret &gt;=3D =
(abi_ulong)(-515)) {<br>
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c<br>
index 23e1e761de..b501750fe0 100644<br>
--- a/linux-user/sparc/signal.c<br>
+++ b/linux-user/sparc/signal.c<br>
@@ -431,12 +431,12 @@ long do_sigreturn(CPUSPARCState *env)<br>
=C2=A0 =C2=A0 =C2=A0set_sigmask(&amp;host_set);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(sf, sf_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0 segv_and_exit:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(sf, sf_addr, 0);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0#else<br>
=C2=A0 =C2=A0 =C2=A0return -TARGET_ENOSYS;<br>
=C2=A0#endif<br>
@@ -495,12 +495,12 @@ long do_rt_sigreturn(CPUSPARCState *env)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;npc =3D tnpc;<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(sf, sf_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0 segv_and_exit:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(sf, sf_addr, 0);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0#if defined(TARGET_SPARC64) &amp;&amp; !defined(TARGET_ABI32)<br>
diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
index 3c0e341e45..1ef6abb776 100644<br>
--- a/linux-user/syscall.c<br>
+++ b/linux-user/syscall.c<br>
@@ -548,7 +548,7 @@ const char *target_strerror(int err)<br>
=C2=A0 =C2=A0 =C2=A0if (err =3D=3D QEMU_ERESTARTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;To be restarted&quot;;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (err =3D=3D TARGET_QEMU_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 if (err =3D=3D QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;Successful exit from sigretu=
rn&quot;;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c<br=
>
index 29cc6f3830..6bc6d6dee6 100644<br>
--- a/linux-user/xtensa/cpu_loop.c<br>
+++ b/linux-user/xtensa/cpu_loop.c<br>
@@ -188,7 +188,7 @@ void cpu_loop(CPUXtensaState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0env-&gt;pc -=3D 3;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case -TARGET_QEMU_=
ESIGRETURN:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case -QEMU_ESIGRET=
URN:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c<br>
index 81572a5fc7..06d91a37ec 100644<br>
--- a/linux-user/xtensa/signal.c<br>
+++ b/linux-user/xtensa/signal.c<br>
@@ -263,12 +263,12 @@ long do_rt_sigreturn(CPUXtensaState *env)<br>
=C2=A0 =C2=A0 =C2=A0target_restore_altstack(&amp;frame-&gt;uc.tuc_stack, en=
v);<br>
<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
<br>
=C2=A0badframe:<br>
=C2=A0 =C2=A0 =C2=A0unlock_user_struct(frame, frame_addr, 0);<br>
=C2=A0 =C2=A0 =C2=A0force_sig(TARGET_SIGSEGV);<br>
-=C2=A0 =C2=A0 return -TARGET_QEMU_ESIGRETURN;<br>
+=C2=A0 =C2=A0 return -QEMU_ESIGRETURN;<br>
=C2=A0}<br>
<br>
=C2=A0void setup_sigtramp(abi_ulong sigtramp_page)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000078d20005d0ff0049--

