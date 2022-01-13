Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A0948DCF3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:32:20 +0100 (CET)
Received: from localhost ([::1]:53490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83xT-0008Og-Uh
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:32:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83hE-0007S5-LT
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:15:34 -0500
Received: from [2a00:1450:4864:20::333] (port=34357
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n83hA-00080u-Mn
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:15:31 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so2750348wmb.1
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cmvfI3H7ws6/Q5S8VYjoybp9hAME/OMuObGV6EYAU28=;
 b=PMV5rY1FKUjKvJ8SBSKg4N1HJ2weJPexY4rhM2XQ7gGRzRyPZ947z0AS61JqPaSec9
 5ma3OtxFILoYrIt3f7qSPVsAacpqbX66oFqxAo4dvP3GYr1+va6ZBMQbkyRbfEM1yCS9
 MJ/snX0lHUI0cPaVZINSgsdHquo+sIYDXTBhvlCpEAtsv9oOdOzgjqg9J8Kg96o05o7m
 AOobZ4wkCoFpIADxuXS6kGdTrWJ736ff5SCj+2fxMd43qEnWOfQ+abznpiFPKW3YC7gZ
 mAYUSan1/vEXS1hmrTYwO/eMiSLPevmfJXUPLcLlWG6vQ3C/OB5UGWqWsZz13lHAgQrA
 u76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cmvfI3H7ws6/Q5S8VYjoybp9hAME/OMuObGV6EYAU28=;
 b=dDd71PmwQf/oB1+g/HNKnSLiu/Qgiw8dayZ7xqB/E3FjGdSyG6DMb65AlvKa56SouZ
 zo0wS+Flx9YJnjkZHkVS9wRdiaH7cTpOl6+xMQvQeWXIL+oG6U8Fjvtz5A9nwgJtLNtk
 Xf4PycZh32Qhf6rfIXkSl24bZAgjfwZ25Rn8NuynCnoq033rKnYAqsWxyXjj43DsIOJJ
 Tpcw1kn8kxRZDVAI2bWqZ6daD2IzsfjCgdmakVNhtipPk3zl+ZFLAIzmjr9EptmF+yVy
 o4sNSdGEtvhCUKayauJIiOMZTElzMNtjiRjC8g1QyXCamnOhv9QR79g9XZlLLhejvNqQ
 aTkQ==
X-Gm-Message-State: AOAM532rWQe1ravVZ0yPG0qSoGsFZBUnwyYy1DQT2FL7zz4pMoigvIR5
 jbGnZzOn84URWRu4tW+MpAvgtLDX88AKKhbB4LHjPA==
X-Google-Smtp-Source: ABdhPJwRO/BVNoBQR/XbnlXLOT8r12ZmROo3mPrO5nEc4YMxVg4Pf0WRqIqKa1+eOxgFxb6eCdUvVBdmp8ZWDSxNGl0=
X-Received: by 2002:a05:600c:1991:: with SMTP id
 t17mr11932135wmq.21.1642094127393; 
 Thu, 13 Jan 2022 09:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-7-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-7-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 17:15:16 +0000
Message-ID: <CAFEAcA8rsxYLs-VjJF+efK=PEQrEh3mn3pTfEyVXz014CmHfqQ@mail.gmail.com>
Subject: Re: [PATCH 06/30] bsd-user/arm/target_arch_cpu.h: Correct code pointer
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:26, Warner Losh <imp@bsdimp.com> wrote:
>
> The code has moved in FreeBSD since the emulator was started, update the
> comment to reflect that change. Remove now-redundant comment saying the
> same thing (but incorrectly).
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
> index 05b19ce6119..905f13aa1b9 100644
> --- a/bsd-user/arm/target_arch_cpu.h
> +++ b/bsd-user/arm/target_arch_cpu.h
> @@ -73,7 +73,7 @@ static inline void target_cpu_loop(CPUARMState *env)
>                      int32_t syscall_nr = n;
>                      int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
>
> -                    /* See arm/arm/trap.c cpu_fetch_syscall_args() */
> +                    /* See arm/arm/syscall.c cpu_fetch_syscall_args() */
>                      if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
>                          syscall_nr = env->regs[0];
>                          arg1 = env->regs[1];

Commit message says we're updating one comment and deleting a
second one; code only does an update, no delete ?

-- PMM

