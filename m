Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A218D51BDA0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 13:01:56 +0200 (CEST)
Received: from localhost ([::1]:54926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZF5-0000xR-DT
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 07:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nmYqa-0000FK-4k
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:36:36 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:41807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nmYqY-0007Ni-AL
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:36:35 -0400
Received: by mail-lj1-x234.google.com with SMTP id m23so5024925ljb.8
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LB8xwLgA33HT1YCqT01YKpv31M8hmxYaUswcXMxL5vQ=;
 b=Xj4EY7G9Otn4aEKfa9due1VKMvYcmdhvO09EZa1b07d7vKFxQJeElAP6ydSLww1yDo
 3Stz1jPsZlJWzDUps2tkXcYLlIJkCFXJJ8h2IBiq3NNsedfTFZUKpMjckw1dOUdn1aCS
 pg2BhgWYC4CIGGhISzj3wDYt3wGm0JUa5HfkJ3u5ZVFW9/CqHx+/FLhqFMnAe/B1qCHC
 9u3kZiIXku8euyrAKbT52+leBK4EIGjwSZsf6t8m0XXUkYGh0dobIx/5Qquhd3HVR0ec
 wZyzwfjaIRNizdrSWrW3IKUA4CuSAAiJoAE0kk3Nnk3+doKWq3CHm4883c2pYyL2b6Vo
 biEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LB8xwLgA33HT1YCqT01YKpv31M8hmxYaUswcXMxL5vQ=;
 b=dQXfV5mTS0J3ynmoQVERB/5cKHd+lESm8ssrofUpt6pswoI7DMWx7R7mYaWu4sxRYw
 6TetOdw3fogPnd3njA0xs0zjFJSys25GatOOdFLAto796hokH0uKDzVZsNRMyvjitxho
 TGkdyyYjUMy0qTKvIxpmjTCVzYvVw1O6F2UnFtiZy4uC3Nt3dVZf7fuvHhQGqLZYgP6D
 JPt/c2VA7xm6CrFoVVhIoGa5XDtUVNXCi2eP9cnQwoEmzC936WVPUxavz82q7+MteWaH
 uRuFLvBCGiNcv8HlYgdRzXtgAW8oRjfREWEnXGd5mqMalsacb60/+kUk4WKF3QEpEP1B
 SOqw==
X-Gm-Message-State: AOAM5316f5E/gWJZUDJiHG9LojQAgTXZ/Pj6jPtb+Mt6BdHNR3kcZGD5
 7rIyFAjl+xrLI4hMxcmYJKU/F05ojKSrW+JEA6j7xw==
X-Google-Smtp-Source: ABdhPJxEZZNRSRpsufdUTCfxP2LdPUmE8qgIEFyG4O0uTanYZ8ot1UqTUKekP0wl/txgYgpoF0vCrW11V1App/4yYjs=
X-Received: by 2002:a2e:8902:0:b0:24f:1446:3101 with SMTP id
 d2-20020a2e8902000000b0024f14463101mr15630291lji.266.1651746991978; Thu, 05
 May 2022 03:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220429033409.258707-1-apatel@ventanamicro.com>
 <20220429033409.258707-3-apatel@ventanamicro.com>
 <CAKmqyKMFVanzOMKPuo_i7hWZEJOmReBpp+wgqv3e2ExV2Jb-7g@mail.gmail.com>
In-Reply-To: <CAKmqyKMFVanzOMKPuo_i7hWZEJOmReBpp+wgqv3e2ExV2Jb-7g@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 5 May 2022 16:06:20 +0530
Message-ID: <CAK9=C2UBXfEoCEe1Nexa+v51ZxY7qd3xpJDd5x77L6FM8T2Qag@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/riscv: Fix hstatus.GVA bit setting for traps
 taken from HS-mode
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=apatel@ventanamicro.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 5, 2022 at 3:21 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Apr 29, 2022 at 1:38 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > Currently, QEMU does not set hstatus.GVA bit for traps taken from
> > HS-mode into HS-mode which breaks the Xvisor nested MMU test suite
> > on QEMU. This was working previously.
> >
> > This patch updates riscv_cpu_do_interrupt() to fix the above issue.
> >
> > Fixes: 86d0c457396b ("target/riscv: Fixup setting GVA")
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  target/riscv/cpu_helper.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index e1aa4f2097..d83579accf 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -1434,7 +1434,6 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> >                  /* Trap into HS mode */
> >                  env->hstatus = set_field(env->hstatus, HSTATUS_SPV, false);
> >                  htval = env->guest_phys_fault_addr;
> > -                write_gva = false;
>
> This doesn't seem right.
>
> "Field GVA (Guest Virtual Address) is written by the implementation
> whenever a trap is taken
> into HS-mode. For any trap (breakpoint, address misaligned, access
> fault, page fault, or guest-
> page fault) that writes a guest virtual address to stval, GVA is set
> to 1. For any other trap into
> HS-mode, GVA is set to 0"
>
> So if we are trapping from HS to HS, the address in stval should not
> be a guest virtual address, at least in general.

That's not correct. The HLV/HSV instructions executed by hypervisor
(HS-mode) take guest virtual address. These instructions can trap
from HS-mode to HS-mode.

>
> We probably aren't correctly setting GVA if MPRV is set though, as
> then the page faults should be guest addresses. That's probably the
> issue you are seeing.

The Xvisor nested MMU test-suit is broken on QEMU because it
uses HLV/HSV instructions in HS-mode.

Regards,
Anup

>
> Alistair
>
> >              }
> >              env->hstatus = set_field(env->hstatus, HSTATUS_GVA, write_gva);
> >          }
> > --
> > 2.34.1
> >
> >

