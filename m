Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD91410CFA
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 21:02:26 +0200 (CEST)
Received: from localhost ([::1]:43124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS253-0008At-GM
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 15:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mS22g-0006Vx-CZ
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:59:58 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:37710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mS22e-0003X9-Td
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:59:58 -0400
Received: by mail-io1-xd35.google.com with SMTP id s20so10598217ioa.4
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=sender:from:mime-version:subject:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=kIzEUtBBaj6Bv0O8hkSXGLcyInCLJ/yGC/Nx6VRC33o=;
 b=PplvdBUS/DExaFy2TKZLpup0wrmO5vzJNroJ+OQDXwzPy//ax39i9xhM7FYROPuhVJ
 7dQX+xgfTBWoOtB0fgWjcxjq2aK56k1QmsMovrxL9Sx9SA5xyM9GRN8R48aXcdfFyLX0
 SZr6pnr2c4/sip4MX5C2vsuTppFHXvRkupsp7nz2OBQpozXmO7Awr7p5EwLZfkzxVL53
 wTeTypLogbt0owFg17tIxzm6/5MEFikmZ+MxdmwI6UYH6TGKELvwTF8SwZQ5XlmLjQdx
 ZQsuOChkHHnzsomlGnN3B6iNzZnYlX+6ujkL8Hw7g4m2xq3XN+RHeBAqtsbT1h2AE3vm
 /nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:mime-version:subject:in-reply-to
 :date:cc:content-transfer-encoding:message-id:references:to;
 bh=kIzEUtBBaj6Bv0O8hkSXGLcyInCLJ/yGC/Nx6VRC33o=;
 b=nfJzoWsX8BfbWx1ihrV9rcYrI/sXz6y4ef2zi9xM0eaRdNzBS5GO5yClVllSPUWAtQ
 EvDCpC00g7Pi+WYZqpbiYBVceRLaIiAxxxlQGDdjDOWwOshsdxTZZ1cqYMd9zDJhpqdp
 I3XdcYTnSAHn3tfq5RmTYD7f5Sp2anY4rsxnZLBK3sltsXkCZP3eCrPdK/cwJBfwkLWK
 avDr9enXWdUvJP6Q9Hj41LymL1BJGPTl3uoLPDGgGSrmBSdf+23y6LCyD8OdmsXQUswX
 smmAR2W6mjT228yRKkgX3DxcNJkvjmhQ1BZa3DDc1HCeSkHD/W7vmIvdISq1bsi++5R6
 3nKA==
X-Gm-Message-State: AOAM531k5zW5wViGFEFMFX9YrCVZoWRFXODNpMrH5/AfOw9Z+qyw+2dd
 5ojEHnAMnjJy1Vfu1XDl5E11XA==
X-Google-Smtp-Source: ABdhPJzWMaz4fe8kzf2uj014TyDhmUDrtUhpdqwKAyy4JQ/6fxoVT1odukYH+7iI1ek5opO3GMUgpw==
X-Received: by 2002:a5d:8588:: with SMTP id f8mr16063411ioj.46.1632077995849; 
 Sun, 19 Sep 2021 11:59:55 -0700 (PDT)
Received: from macbook.nflx.bsdimp.com
 (50-253-99-174-static.hfc.comcastbusiness.net. [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id g14sm8100297ila.28.2021.09.19.11.59.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:59:55 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
X-Google-Original-From: Warner Losh <bsdimp@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 18/41] linux-user/signal: Drop HOST_SIGNAL_PLACEHOLDER
In-Reply-To: <20210918184527.408540-19-richard.henderson@linaro.org>
Date: Sun, 19 Sep 2021 12:59:54 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <6E349CE1-9C18-408B-9158-FD276D9A5202@gmail.com>
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-19-richard.henderson@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Sep 18, 2021, at 12:45 PM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> Now that all of the linux-user hosts have been converted
> to host-signal.h, drop the compatibility code.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> include/exec/exec-all.h | 12 ------------
> linux-user/signal.c     | 13 -------------
> 2 files changed, 25 deletions(-)

Reviewed by: Warner Losh <imp@bsdimp.com>

> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 5f94d799aa..5dd663c153 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -685,18 +685,6 @@ MMUAccessType adjust_signal_pc(uintptr_t *pc, =
bool is_write);
> bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
>                                  uintptr_t host_pc, abi_ptr =
guest_addr);
>=20
> -/**
> - * cpu_signal_handler
> - * @signum: host signal number
> - * @pinfo: host siginfo_t
> - * @puc: host ucontext_t
> - *
> - * To be called from the SIGBUS and SIGSEGV signal handler to inform =
the
> - * virtual cpu of exceptions.  Returns true if the signal was handled =
by
> - * the virtual CPU.
> - */
> -int cpu_signal_handler(int signum, void *pinfo, void *puc);
> -
> #else
> static inline void mmap_lock(void) {}
> static inline void mmap_unlock(void) {}
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 6f953f10d4..e6531fdfa0 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -773,16 +773,6 @@ static void host_signal_handler(int host_sig, =
siginfo_t *info, void *puc)
>     ucontext_t *uc =3D puc;
>     struct emulated_sigtable *k;
>     int guest_sig;
> -
> -#ifdef HOST_SIGNAL_PLACEHOLDER
> -    /* the CPU emulator uses some host signals to detect exceptions,
> -       we forward to it some signals */
> -    if ((host_sig =3D=3D SIGSEGV || host_sig =3D=3D SIGBUS)
> -        && info->si_code > 0) {
> -        if (cpu_signal_handler(host_sig, info, puc))
> -            return;
> -    }
> -#else
>     uintptr_t pc =3D 0;
>     bool sync_sig =3D false;
>=20
> @@ -842,7 +832,6 @@ static void host_signal_handler(int host_sig, =
siginfo_t *info, void *puc)
>=20
>         sync_sig =3D true;
>     }
> -#endif
>=20
>     /* get target signal number */
>     guest_sig =3D host_to_target_signal(host_sig);
> @@ -857,7 +846,6 @@ static void host_signal_handler(int host_sig, =
siginfo_t *info, void *puc)
>     k->pending =3D guest_sig;
>     ts->signal_pending =3D 1;
>=20
> -#ifndef HOST_SIGNAL_PLACEHOLDER
>     /*
>      * For synchronous signals, unwind the cpu state to the faulting
>      * insn and then exit back to the main loop so that the signal
> @@ -867,7 +855,6 @@ static void host_signal_handler(int host_sig, =
siginfo_t *info, void *puc)
>         cpu->exception_index =3D EXCP_INTERRUPT;
>         cpu_loop_exit_restore(cpu, pc);
>     }
> -#endif
>=20
>     rewind_if_in_safe_syscall(puc);
>=20
> --=20
> 2.25.1
>=20
>=20


