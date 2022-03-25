Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369FA4E7272
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 12:52:55 +0100 (CET)
Received: from localhost ([::1]:45948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXiUw-0007Yp-AJ
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 07:52:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXiRk-000533-PI
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 07:49:37 -0400
Received: from [2607:f8b0:4864:20::112a] (port=34341
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXiRi-00022G-Gx
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 07:49:36 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2db2add4516so80472857b3.1
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 04:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JulGiui1x/0exczxVjQWvbdE7gM6rbwLRw6pGUj6cOA=;
 b=PoykwVtEAGlUa9KrYBxiccWloHIGevZ0jbVBdROLsd3EsTLszeCWTw21zCkZzgJ3K7
 V67zqb0z+lx/AW6342r5z1XZNiTqMDhq7+lG4mhHpEiPa4NHcxIv5eHT68F+bUGc66W9
 vF7IZXp38lorytitXtvFza8R8fEjlw/m2V+/20GD14j4OzYbav8HqkN2Q89e+UXgGpft
 vWOSlrO0YSdn2QSRNkB6R+qBWHmAE+qVh2n98hxFUTbnG0PrZBu7E5vGAG5bKbCwoPx/
 UFdmU/LBTO08q3eJoyON2JZMAPQk/7UHBUCHkitUldkg0zpJYzuzFgTpS1+xqBG5xI7H
 1xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JulGiui1x/0exczxVjQWvbdE7gM6rbwLRw6pGUj6cOA=;
 b=Jk5/Y4GoLlkiw1LxkhO2w1/C7Jc7P1eDfAnVspSjawmcrC+8A/MF7gOlwBOyAB759p
 1AECZPCdVToy808k1bg3ka859Ae2SJwy0NX+6th/eUqZgbv9DL1n9X5ylFIgcWkXJwwM
 j8Om2h6o62+33I+MIV/0H4loDuqjEYAz+SC0lEfF5BFqugeo/QJRyw+NEkbR63IrOY+t
 EPLIb29xyPMPT+NcM99CTZqFCvV/s9p9gq7859/z+t8Iab0tzu7E6qu2Jp0VgT/W78TG
 5xKbt2jxU747cT4D3E0y/G3UlET91b+bRgkEMdb1bY1UKFiYhchZBxvel5VjCcI5Mv4n
 hP6g==
X-Gm-Message-State: AOAM533b2uqi70QV+VB8csy7o8rcMKICNPKzwxZ2Qh1jHhVKbi65CiUA
 xsnvv9CKBVeLTHW67HETG3H/YJGPCLMtUmgNNMXFmA==
X-Google-Smtp-Source: ABdhPJyiTRhtYjVu8J4TrkPRcWwTzfOIWpc9HKQZDVNShRPtea5iYYYOPvy3BZgqyRvCzJaZmPVVtb3tLNGe8Q0BHII=
X-Received: by 2002:a81:ac15:0:b0:2e6:d7e3:c4ba with SMTP id
 k21-20020a81ac15000000b002e6d7e3c4bamr5773597ywh.10.1648208973555; Fri, 25
 Mar 2022 04:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
 <20220320160009.2665152-2-richard.henderson@linaro.org>
In-Reply-To: <20220320160009.2665152-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 11:49:20 +0000
Message-ID: <CAFEAcA_h7pQsaYJ9m_6L0PYD0wYsUa959Kg-SsAR93d+SzXkrQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] linux-user/nios2: Fix clone child return
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Mar 2022 at 16:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The child side of clone needs to set the secondary
> syscall return value, r7, to indicate syscall success.
>
> Advance the pc before do_syscall, so that the new thread
> does not re-execute the clone syscall.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/target_cpu.h | 1 +
>  linux-user/nios2/cpu_loop.c   | 4 +---
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/linux-user/nios2/target_cpu.h b/linux-user/nios2/target_cpu.h
> index 2d2008f002..830b4c0741 100644
> --- a/linux-user/nios2/target_cpu.h
> +++ b/linux-user/nios2/target_cpu.h
> @@ -27,6 +27,7 @@ static inline void cpu_clone_regs_child(CPUNios2State *env, target_ulong newsp,
>          env->regs[R_SP] = newsp;
>      }
>      env->regs[R_RET0] = 0;
> +    env->regs[7] = 0;
>  }
>
>  static inline void cpu_clone_regs_parent(CPUNios2State *env, unsigned flags)
> diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
> index 1e93ef34e6..a3acaa92ca 100644
> --- a/linux-user/nios2/cpu_loop.c
> +++ b/linux-user/nios2/cpu_loop.c
> @@ -42,8 +42,7 @@ void cpu_loop(CPUNios2State *env)
>          case EXCP_TRAP:
>              switch (env->error_code) {
>              case 0:
> -                qemu_log_mask(CPU_LOG_INT, "\nSyscall\n");
> -

Are you deliberately dropping this logging? If so, at least
mention it in the commit message, but it doesn't really seem
related to the rest of the patch...

> +                env->regs[R_PC] += 4;
>                  ret = do_syscall(env, env->regs[2],
>                                   env->regs[4], env->regs[5], env->regs[6],
>                                   env->regs[7], env->regs[8], env->regs[9],
> @@ -56,7 +55,6 @@ void cpu_loop(CPUNios2State *env)
>                  env->regs[2] = abs(ret);
>                  /* Return value is 0..4096 */
>                  env->regs[7] = ret > 0xfffff000u;
> -                env->regs[R_PC] += 4;
>                  break;

It feels a bit odd to be advancing the PC in the cpu-loop, because
on the real hardware you get this for free because 'trap' sets
ea to PC+4 and you just return to ea. But it works, I guess.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(The nios2 "use r2 and r7 for syscall return information" API
seems like an unnecessary use of the architectural weirdness
budget on their part, but whatever.)

thanks
-- PMM

