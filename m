Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D18531163
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 16:47:22 +0200 (CEST)
Received: from localhost ([::1]:43370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9L7-0005YZ-6U
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 10:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt9Gd-0002wO-9B
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:42:43 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:39855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt9Gb-0004q3-GB
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:42:42 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id i187so23556693ybg.6
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YiRb+fGlgZc6cGlzEb+eSUJ1KHmUNE2xKzuTpao1dCY=;
 b=Bjbfz324VszbmsoXmFRI0u2S+IsojGT12KaYyZGBEUDk/LjMoSp1zOyIzdkbhFxaL4
 VziEzvEA7s78m5Hpb99qcWMF7DLc0W+7xc5Y+g3LKn+OEXTjdz6AX7NmxGUZfnTy2/ci
 1tsxNAzBN1CG3dOFZGLKSaRrWDSxVxA9ikIfErmqXO/nOJuPSGhFCcXbDo/LdimOiltS
 IPUFBnKtx7qVwRCyo8Przxh51DLvQx11iMAeRwgfGSr0RAu0+qyejwSTOe5SnVW/IxaR
 VpJwmh87U+93uARLTkGmPtZ3PQREmuWmK0Vo+9JG67ey1dcSSUfKYGCU3PRcyC6N5jQ3
 3CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YiRb+fGlgZc6cGlzEb+eSUJ1KHmUNE2xKzuTpao1dCY=;
 b=wLgK0IlbVsrGXKtK1PVdLbWyFrUBmKqx+yrz0jHZKQTPU40M0lYv9ag0E9up39GUeX
 zs1hk5RxmomB0thwjpD6WWRGkNePOM6yVSxIbJjYCN41hMwhCACuTPyklloLmFLuC2Ez
 +ZG75p8FiVSx1GMc5lxD8h3rrDke/6V4amaz+cI2Ip1XsBaW4xKlO+jU8j+8LpDpQDf1
 /8oEYPALzw758LMHCptZD10TcHN/7IxUHX6FkQ5DOU5UrGOXz4SjiLky4/Mci9wviV15
 hCNdvPkINy7zu42c437V5yLyP2JuW5YDSiVZDil8MVc2KIJ3mQuHffE9V0gibeJZHBLE
 YkBg==
X-Gm-Message-State: AOAM532gQB0l+vzvjTXF45zYFphG5gmp9geTmjL1u1GSw2V+WyNZdv8R
 ZYw1dHwEphQk8n49YtpGxjznEoPkgl2ZmhoIwbf4RcoQUU8=
X-Google-Smtp-Source: ABdhPJx9Zny8kl8Vv8SsO6JxjYEtlPrcD+GnnUzikLyjq87RgoJM0IBWNSj1B+wk+Rc7xMf+LO4mCc6CsCv5o9PKVgA=
X-Received: by 2002:a25:2e06:0:b0:64d:b6a5:261a with SMTP id
 u6-20020a252e06000000b0064db6a5261amr21090188ybu.140.1653316960440; Mon, 23
 May 2022 07:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220505095015.2714666-1-peter.maydell@linaro.org>
In-Reply-To: <20220505095015.2714666-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 15:42:29 +0100
Message-ID: <CAFEAcA9khsVoAi9TB=wFNB-pkEiGXfghvpBr6WKQd5zyCNLTGA@mail.gmail.com>
Subject: Re: [PATCH v2] Fix 'writeable' typos
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

Ping for qemu-trivial? Or I can take it through the arm queue
if you prefer.

thanks
-- PMM

On Thu, 5 May 2022 at 10:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> We have about 30 instances of the typo/variant spelling 'writeable',
> and over 500 of the more common 'writable'.  Standardize on the
> latter.
>
> Change produced with:
>
>   sed -i -e 's/\([Ww][Rr][Ii][Tt]\)[Ee]\([Aa][Bb][Ll][Ee]\)/\1\2/g' $(git grep -il writeable)
>
> and then hand-undoing the instance in linux-headers/linux/kvm.h.
>
> Most of these changes are in comments or documentation; the
> exceptions are:
>  * a local variable in accel/hvf/hvf-accel-ops.c
>  * a local variable in accel/kvm/kvm-all.c
>  * the PMCR_WRITABLE_MASK macro in target/arm/internals.h
>  * the EPT_VIOLATION_GPA_WRITABLE macro in target/i386/hvf/vmcs.h
>    (which is never used anywhere)
>  * the AR_TYPE_WRITABLE_MASK macro in target/i386/hvf/vmx.h
>    (which is never used anywhere)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2:
>  * commit regenerated with new rune to be case-insensitive; now
>    includes fixes for 'WRITEABLE' and 'Writeable'

