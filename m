Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86334E72EE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 13:21:37 +0100 (CET)
Received: from localhost ([::1]:37844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXiwi-0005hI-Vh
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 08:21:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXipC-0000fq-AL
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:13:50 -0400
Received: from [2607:f8b0:4864:20::112b] (port=34495
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXipA-0006Qs-ST
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 08:13:49 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2db2add4516so81166897b3.1
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 05:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FHiYLAYkFiEthte3EMfiN0475t4/Z8U4buRdRKMckRw=;
 b=MEuXS/yxOsUCXqANZybA9CqlGI11yfIQs438CD05pD8ttQj0ZYauCXCmkYpTqAynmh
 RlG8jnw+6/m3wH5Nuu+2cO6/OjESUX6XgDhjToLbC3miDxwS3oozovWYyG2VTi4IQrrJ
 BnBLYYcHXmGwh3p+qWvYECGOGbGOsHpqqkEfc9zsrw/VT5EgT8VWF/D9AE273iLPQHAV
 Qh3tK9RluipX3Tn1mDPzegzJYBix5Xhch9HhK21w9lDZBJO52UtQtWiOWCgSud4+a4Nw
 dpHZ4GrO8uoTDNdtX1F7mBdDLgcfV1rmWkCH9bFi+PJej4my3F73AlBosWs/NX3QO+B/
 tjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FHiYLAYkFiEthte3EMfiN0475t4/Z8U4buRdRKMckRw=;
 b=5NV3UiRWCxkJ2r9Sg5x6yOrl7+LBRBqjPdWAyr1qJrNok5euc37pSu/OZ3gqCNT8Am
 T866Q4QYCqraz7TnjdzKapAFCXEiJXRtnutcZzU6YnrmonDqGEou6dOjWoAzdKcnqyk7
 3cntI2QhffO/xChgoc8RaD1YDjP/+APyxNM2RWcvtNvovG60Inp5B2RrWEGqCIos7Wfu
 jCcQxbyMJGR23wxXtLJ+cU5b5++474tKw8O2LlK1I6hm3YbTVcNd0NxBlD/AYaDYG2Jz
 CUnz5EV+Ym6SkCAuNV52IuUITl9lI7M7Vin9VeFVgrRslZ9PfJYo8ULeL3KHPvzFfoJN
 zgIA==
X-Gm-Message-State: AOAM531jldDlZhG5THOXsNgoQ04Zm+4sse6WbGdhPNJ0K7kIwoNEgays
 ViAIPygtt04YrGDXkT1iUy/aUDrQkOKgpspIFDEoaQ==
X-Google-Smtp-Source: ABdhPJy2cD/96Br/Rk2ar/oJS0z+0vk+f893FEqbfo/RqVfJGwqgm3cbb3xgrEFbLEoErdqTvik5n0zKSVhaRxRC42U=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr10209090ywf.347.1648210428001; Fri, 25
 Mar 2022 05:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
 <20220320160009.2665152-5-richard.henderson@linaro.org>
In-Reply-To: <20220320160009.2665152-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Mar 2022 12:13:35 +0000
Message-ID: <CAFEAcA9mEy5XpKWKPEP9LzjgTjXFXW2stz36AT63dvf+yKuwdw@mail.gmail.com>
Subject: Re: [PATCH 4/7] linux-user/nios2: Handle special qemu syscall return
 values
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Sun, 20 Mar 2022 at 16:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Honor QEMU_ESIGRETURN and QEMU_ERESTARTSYS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/cpu_loop.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
> index 2ae94f4a95..d12c3c2852 100644
> --- a/linux-user/nios2/cpu_loop.c
> +++ b/linux-user/nios2/cpu_loop.c
> @@ -48,6 +48,14 @@ void cpu_loop(CPUNios2State *env)
>                                   env->regs[7], env->regs[8], env->regs[9],
>                                   0, 0);
>
> +                if (ret == -QEMU_ESIGRETURN) {
> +                    /* rt_sigreturn has set all state. */
> +                    break;
> +                }
> +                if (ret == -QEMU_ERESTARTSYS) {
> +                    env->regs[R_PC] -= 4;
> +                    break;
> +                }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

