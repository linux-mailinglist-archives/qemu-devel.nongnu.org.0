Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E954A36C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 03:08:34 +0200 (CEST)
Received: from localhost ([::1]:59988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0v2m-0005p5-Ra
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 21:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o0v0Z-0004Ld-4Z
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:06:15 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:38673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o0v0X-0008IO-H6
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:06:14 -0400
Received: by mail-oi1-x22d.google.com with SMTP id w16so9844903oie.5
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 18:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MB+MGmBqdG5ypIyBkxcqeSz7p3hmdEfXnFn+SATujG0=;
 b=YcbhpgJxZR1xsm9aOv7UlmzgH7eRZO0BQnVPFyD6JpQtFS9o6PuhQTFetp5RfOKYAQ
 CuhkBgURGzt5z0hBrPxoVnECgpRnVo4Vl9qaLmJtN3yWrx3FFGsnbq3d9cHa5oaiUNv+
 u77p8eb1PHs8xzCnvsNutgtG+lduu+9CUAM4nh87NCSXLN6rOZrdHHqm+tUzj16wA12i
 Flp3bXIzo5ACA9YYanGrC/eupsyciljkpggEXuPCrSRBRfZLMm9aHTsp7c9b2O9g/TIz
 C/2kB+hAARwvA5a+R40E+bjNbFTK6In1hMwpm5Qo8O+NZf1bMzz+eOl9irJF/3CmdzSX
 Hq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MB+MGmBqdG5ypIyBkxcqeSz7p3hmdEfXnFn+SATujG0=;
 b=R2db3O7OgkVPnCkhmndPt2KzWxUq4JE6tpAajy5l4ZMZH6sJjYHEMWBUoNPLO1Bqoq
 HoLeVPZqbQ5eqZFSiDwm/7um81he1pRCxPhysPyj3WN3TCmLpfepAU56apbkvWxD7P0m
 VeZw1SUPrem9gP0GYDF09QZlBzr2AeSzfXbuaRxAgUFRUYpPtqCznHVH7aenGi7W39aS
 mzzVHn5LGLY2Kzm3Dcm+EeX/2P07G9Wyj8GptTLeYSRinuPgOTIMjl8rTfRd3T6oN/mf
 EjbnI+HLmhHASPVAsO9FukFNX7Up1sn7jOm021OVmohXm3GIkNBqtYRGJzNOkNHLysUd
 EvWQ==
X-Gm-Message-State: AOAM5316qylE8ea8eoDg6VqvnlXEqm8wP+c+V5oFm/mAdvrZGRG9/aYN
 frYE7sxkpXx05Jmy5L4HpMkPSYXi97+jFx7YRf4=
X-Google-Smtp-Source: ABdhPJzzQXI5WF6KYOKw71df6gsOK+P4qC/P7TYbjiHqDlRdAQh6MxsYHpDmeaeJwMO/K2ue9ZK0aB1jmU3up7EdNwE=
X-Received: by 2002:aca:3203:0:b0:32e:b45e:131b with SMTP id
 y3-20020aca3203000000b0032eb45e131bmr836166oiy.210.1655168771926; Mon, 13 Jun
 2022 18:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220608053650.811947-1-richard.henderson@linaro.org>
 <20220608053650.811947-3-richard.henderson@linaro.org>
In-Reply-To: <20220608053650.811947-3-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 13 Jun 2022 18:06:01 -0700
Message-ID: <CAMo8BfKVGD-6TUvea=QRP3MD=hdTw+yJ8zWsb44CGANTQakaVg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] target/xtensa: Use semihosting/syscalls.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 7, 2022 at 10:36 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This separates guest file descriptors from host file descriptors,
> and utilizes shared infrastructure for integration with gdbstub.
> Remove the xtensa custom console handing and rely on the
> generic -semihosting-config handling of chardevs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/cpu.h         |   1 -
>  hw/xtensa/sim.c             |   3 -
>  target/xtensa/xtensa-semi.c | 323 +++++++++++-------------------------
>  3 files changed, 97 insertions(+), 230 deletions(-)
>
> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index ea66895e7f..99ac3efd71 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -612,7 +612,6 @@ void xtensa_translate_init(void);
>  void **xtensa_get_regfile_by_name(const char *name, int entries, int bits);
>  void xtensa_breakpoint_handler(CPUState *cs);
>  void xtensa_register_core(XtensaConfigList *node);
> -void xtensa_sim_open_console(Chardev *chr);
>  void check_interrupts(CPUXtensaState *s);
>  void xtensa_irq_init(CPUXtensaState *env);
>  qemu_irq *xtensa_get_extints(CPUXtensaState *env);
> diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
> index 946c71cb5b..5cca6a170e 100644
> --- a/hw/xtensa/sim.c
> +++ b/hw/xtensa/sim.c
> @@ -87,9 +87,6 @@ XtensaCPU *xtensa_sim_common_init(MachineState *machine)
>          xtensa_create_memory_regions(&sysram, "xtensa.sysram",
>                                       get_system_memory());
>      }
> -    if (serial_hd(0)) {
> -        xtensa_sim_open_console(serial_hd(0));
> -    }

Do I understand correctly that the sim machine will no longer
support the -serial option with this change?

>      return cpu;
>  }
>
> diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
> index 5375f106fc..7ef4be353e 100644
> --- a/target/xtensa/xtensa-semi.c
> +++ b/target/xtensa/xtensa-semi.c
> @@ -27,8 +27,10 @@
>
>  #include "qemu/osdep.h"
>  #include "cpu.h"
> -#include "chardev/char-fe.h"
> +#include "exec/gdbstub.h"
>  #include "semihosting/semihost.h"
> +#include "semihosting/syscalls.h"

This does not build on top of the current master, is there a branch where
it's buildable?

...

> -    switch (host_errno) {
> -    case 0:         return 0;
> -    case EPERM:     return TARGET_EPERM;
> -    case ENOENT:    return TARGET_ENOENT;
> -    case ESRCH:     return TARGET_ESRCH;
> -    case EINTR:     return TARGET_EINTR;
> -    case EIO:       return TARGET_EIO;
> -    case ENXIO:     return TARGET_ENXIO;
> -    case E2BIG:     return TARGET_E2BIG;
> -    case ENOEXEC:   return TARGET_ENOEXEC;
> -    case EBADF:     return TARGET_EBADF;
> -    case ECHILD:    return TARGET_ECHILD;
> -    case EAGAIN:    return TARGET_EAGAIN;
> -    case ENOMEM:    return TARGET_ENOMEM;
> -    case EACCES:    return TARGET_EACCES;
> -    case EFAULT:    return TARGET_EFAULT;
> -#ifdef ENOTBLK
> -    case ENOTBLK:   return TARGET_ENOTBLK;
> -#endif

AFAIR there were reports that qemu doesn't build on some
systems because they were missing ENOTBLK and other
error codes that were made conditional here.

...

> +#define E(N) case E##N: err = TARGET_E##N; break
...
> +    E(PERM);
> +    E(NOENT);
> +    E(SRCH);
> +    E(INTR);
> +    E(IO);
> +    E(NXIO);
> +    E(2BIG);
> +    E(NOEXEC);
> +    E(BADF);
> +    E(CHILD);
> +    E(AGAIN);
> +    E(NOMEM);
> +    E(ACCES);
> +    E(FAULT);
> +    E(NOTBLK);
> +    E(BUSY);
> +    E(EXIST);
> +    E(XDEV);
> +    E(NODEV);
> +    E(NOTDIR);
> +    E(ISDIR);
> +    E(INVAL);
> +    E(NFILE);
> +    E(MFILE);
> +    E(NOTTY);
> +    E(TXTBSY);
> +    E(FBIG);
> +    E(NOSPC);
> +    E(SPIPE);
> +    E(ROFS);
> +    E(MLINK);
> +    E(PIPE);
> +    E(DOM);
> +    E(RANGE);
> +    E(NOSYS);
> +    E(LOOP);

I'm not sure mangling error code names is a good idea.

-- 
Thanks.
-- Max

