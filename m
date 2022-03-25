Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740E24E727A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 12:54:12 +0100 (CET)
Received: from localhost ([::1]:49888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXiWB-0001mW-IV
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 07:54:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXiT6-00063c-0h
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 07:51:00 -0400
Received: from [2607:f8b0:4864:20::112f] (port=38229
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXiT4-0002SZ-Ha
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 07:50:59 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2e592e700acso80282947b3.5
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 04:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1GGBCc/7ieBCKyJ0w2pJy7yP0/AwcBQmfJCbSS6qyH0=;
 b=wxr4hhF050s9EOlMv5+H0HqRYjD4DfsdAp4QQHDPGyQDloq2H9RAqMtQNOHYYTG/kU
 v3yYH4vn7eBYIMdpF8vsDAAW/HDqhHehpMmOyYH85MNO7HWvI769sqmuXq+90fyvqxso
 r56rjAe/gozZ6HzzFAwTkpoc6rb319WN4j4SpdVIptSHoMHOJqUyhbicz7+Snw6gCGWs
 xvId+RnV4Qn/4zVbcJhUslD/Wlx7CbXLEXgaM8YhdsJoqlFWhEoPuIHcQBgHKi4k5ALh
 v0ENr7ZCYc1OEPsp6qWFaKNA3euTZMrN8bPIlg0sjnKrrr+msmEnQBAh96agUAY+K/5l
 kNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1GGBCc/7ieBCKyJ0w2pJy7yP0/AwcBQmfJCbSS6qyH0=;
 b=R0MskIeDTR/kJsFYIQEK92GrrRCyDxWspgIOumx2r9L4iL/TWwoobNTshVvt3z5xkp
 AnKt4iDGexDjra6VUF3M/2M/R1GwxcpgCYT59KYL00D+/ISpn3OprN9JjtbSlGvcpEcN
 dvp0LrA6LjTmx3Nha8oivi0MppJTLqHzLAp6ffskxqCEmcpBLvUeFAhIp7m+BN2je2d9
 2VjMbP0dpFAEY7HqXCQjoo7ykQhRCl/IJeF8Orwun9YgG8gTjguLypctT9a6Zzuj3ZLz
 GI8MZI5cVCG0k8MQsMmzYOxVP+mvNcmJvSlbk3hvP6AlP0jISAoep7vFg7ol6+LZUqAy
 ZpPQ==
X-Gm-Message-State: AOAM530cTTF7+ExJSXNIsCBrb6iN7pSbV5OGgaQURyH/GoNxwN18VFaF
 /k1UnZNSfM1Df+0exLS8o5fe9NgsR7RTAQBH2KyNgQ==
X-Google-Smtp-Source: ABdhPJyJEBvWo6cr8S3lZ5PwSQ3xy51Ld4ZvBueERDecuIfDvctSHQsPFN1UR5nQ+CrDs7oVSJafOs7wMXNxd5nxTPY=
X-Received: by 2002:a81:1151:0:b0:2e5:99ec:9933 with SMTP id
 78-20020a811151000000b002e599ec9933mr10089034ywr.64.1648209057243; Fri, 25
 Mar 2022 04:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
 <20220320160009.2665152-3-richard.henderson@linaro.org>
In-Reply-To: <20220320160009.2665152-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 11:50:43 +0000
Message-ID: <CAFEAcA8Y+P74bY=245Y1HbPObkboqFTqe2imPTdrQvXRcpu1cw@mail.gmail.com>
Subject: Re: [PATCH 2/7] linux-user/nios2: Drop syscall 0 "workaround"
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Sun, 20 Mar 2022 at 16:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There's no documentation for what the problem was.
>
> Fixes: a0a839b65b6 ("nios2: Add usermode binaries emulation")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/cpu_loop.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
> index a3acaa92ca..ac71f4ee47 100644
> --- a/linux-user/nios2/cpu_loop.c
> +++ b/linux-user/nios2/cpu_loop.c
> @@ -48,10 +48,6 @@ void cpu_loop(CPUNios2State *env)
>                                   env->regs[7], env->regs[8], env->regs[9],
>                                   0, 0);
>
> -                if (env->regs[2] == 0) {    /* FIXME: syscall 0 workaround */
> -                    ret = 0;
> -                }
> -
>                  env->regs[2] = abs(ret);
>                  /* Return value is 0..4096 */
>                  env->regs[7] = ret > 0xfffff000u;
> --

syscall 0 on this architecture is __NR_io_setup, incidentally.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

