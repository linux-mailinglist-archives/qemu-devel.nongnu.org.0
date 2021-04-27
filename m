Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C9936C1E6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:41:12 +0200 (CEST)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKDQ-00036n-1V
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbKBO-0001rg-FB
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:39:06 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:39740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbKBJ-0001Pw-Hx
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:39:06 -0400
Received: by mail-ed1-x529.google.com with SMTP id g14so9477590edy.6
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 02:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BYG1qizbeqBNYv12CSgZVkDlBFgKN/kaa4esTB+OyoQ=;
 b=br9XcAjY9vZ3lG/lDh9FIbroCOgHWELK1bbdli+9P8YvbACYI8WQqOLiFwQJ4ftECS
 QuXssKIn0lM0qFSRKwAMxCI3+RYbouCgWzoBb71DyF+YxZfoK+3wtnCpTIQJY8X8dBtP
 ziqkuv2ztBx1eHfW/6ttry5dXAORdXKmwFgQPBDzI3zm7NTescxVRDckoZQ/teEiStlo
 DYGekNLa9mYOXHrLsouejQPftkjlqFpzlybu9rigr5JNzKQm++4/pvcXHRtPnHIazmkA
 EI/oD3L1eOHmIWh+DLY6/iq33WVofRcqwUFYJ+TqqxaH9TFFvVvEal7Z9poG7cQ0h4s5
 JvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BYG1qizbeqBNYv12CSgZVkDlBFgKN/kaa4esTB+OyoQ=;
 b=X1inFLqkxI8HUXojaE3a9QNKow4m8cAPTMDfaf+w5en3fJ37nfT4ZNfU759Af37slC
 aD6nCEhpcAwiO5pzUXkUtDBIviCvJIUM4L54QEtxKBRrgWKGnRkmeS+mZs9wCCfZk09h
 l/Fizhdp5x+xdO+DKmfye++CytKrz6nIXKRjjlQJSVsan5HrjILlrVPis2KFgt4ooGQ6
 xphGbaJzqQU0fhfhqO3+D5sdE5Jphw4clcy1JxG1cUeKd1VqCnSvvZk6fqVmEyEwuGd3
 N8cTDzGh1rEhYLdDjX7vEyRp8grnlKn2oP+DksoqpiYL/Bh8YGnixtt1wTuCj2cMv6kU
 Ipww==
X-Gm-Message-State: AOAM533SfPEMAjIyVq2x4cYGLxxMgHeYCl7o6R9MOg6wDaQtpOjsMyKW
 kQZUb7qAQAKbu1scPzctHBJYs9SPr3BxKWOJBxbAYg==
X-Google-Smtp-Source: ABdhPJyPO9xZSVpdgEBmKU15oiRf4iuUi7ds6aG2oIvo7Ip1a28Hcb8K1hVoHpU2WO1GsyS1dIXH7stmluDuYpsMmc8=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr3233495edu.100.1619516339568; 
 Tue, 27 Apr 2021 02:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <37df1b1872f15086dd1d066e53dc1eedaf114051.1617281290.git.haibo.xu@linaro.org>
 <20210427092423.q3ktw4kkd5xhapad@gator.home>
In-Reply-To: <20210427092423.q3ktw4kkd5xhapad@gator.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 10:38:00 +0100
Message-ID: <CAFEAcA9+VpFp70rwZ5rWEQX9TxPH558jCiSU6Z=qPnUfieSukA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 5/6] target/arm/cpu: Enable 'el2' to work with
 host/max cpu
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Apr 2021 at 10:24, Andrew Jones <drjones@redhat.com> wrote:
> I feel like there are way too many ways to track this feature now. If I
> didn't lose count we have
>
>  1) cpu->has_el2
>  2) cpu->env & ARM_FEATURE_EL2
>  3) (for mach-virt) vms->virt
>  4) possibly (and probably should) some ID register bits
>
> I realize the first three are already in use for TCG, but I'm guessing
> we'll want to clean those up. What's the plan going forward? I presume
> it'll be (4), but maybe something like (1) and/or (3) will stick around
> for convenience. I'm pretty sure we want to avoid (2).

For new features added we want to use ID register bits. However,
a lot of older pre-existing features are keyed off ARM_FEATURE_FOO
flag bits. Trying to convert an ARM_FEATURE flag to use ID registers
isn't necessarily 100% trivial (for instance, the ARM_FEATURE flag
is always checkable regardless of AArch64 vs AArch32, but the ID
register checks often need to be split up into separate ones checking
the AArch32 or the AArch64 ID register value). So we aren't really
doing conversion of existing flags. (I did a few which were easy
because there were only a handful of checks of them.) As a side note,
some features really can't be checked in ID registers, like
ARM_FEATURE_V8_1M, so env->features is not going to go away completely.

The only use of cpu->has_foo should be for the QOM property -- the
arm_cpu_realizefn() should look at it and then either clear the
ARM_FEATURE flag or update the ID register bits depending on
which one the feature is using.

vms->virt is for the board code (and controls more things than
just whether the CPU itself has EL2).

thanks
-- PMM

