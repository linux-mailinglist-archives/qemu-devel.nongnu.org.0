Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659B43B7031
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 11:40:51 +0200 (CEST)
Received: from localhost ([::1]:57466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyAEb-0006Aw-LG
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 05:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyADM-0005JZ-65
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:39:32 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyADK-0001zC-IW
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:39:31 -0400
Received: by mail-ej1-x631.google.com with SMTP id l24so5973301ejq.11
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2m1cm4DNjdxFK97J07+kJqGsdUAHFeoMZD6p9ec3dTs=;
 b=DgsI38+KTWaigw4Q4tYn+iz7ZMMmc+e8Mz7IWnRyEqwzI1ZaTsMYCDOyKGvBmj8bHh
 FyHfo7K1plkgSx7hXcqUbS0eg65gZPI/VvBIWDXO/WcFhwah+wUmWwf2h33K2fe1yP6Q
 AiSsE36DFxrww2oC7gpgE/Ev2NWugr4uZqrtyvbBCfsK8wH6HjeWU2uNpkwA1HHgz3FT
 BcKfCHCgspub+cM6JH6NltoVkbUkMzwAlF/lQmnHwAlnudD85uw91Y7xG8G9ue9A6M18
 E1eHuAKK6Z1sEA5s7KjRPZ0JhQ5cwzBudtQB8fYW8FKPv3yj3AFUsHBZdP1UeoIkZ2/b
 p3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2m1cm4DNjdxFK97J07+kJqGsdUAHFeoMZD6p9ec3dTs=;
 b=q+NgJiGNMfyS92pxJC87Zpntk8XPv8P2caYb3xf4Q8F7iEM5Znjof9QKLBXHl+QqNE
 kn0wLgwnykr6qdzvnxT7M2mP7UK+ZunFCkVhPckaxAXpx7P4RGgcmYGDyo0pzknzX3Da
 /cIegutGWjzn23n1gGPqs42vHunbOkaehwgrZdwIkVaZ+eoegRRi1khOMkx/FxH1d0ve
 ofY5tOOKv16NaqmekniWfMbiiCkQO5eOPjZHGGLQKaGmeuFKgFNq5OO56ddL2G69hsU6
 WEorg5LL0Xo1DPUuVShbx1KSYooVzJgYwTIcGTBPS8GMN/njwoHIfACDf9VazryXtDU+
 HJWg==
X-Gm-Message-State: AOAM5323Xjd5S/JS9NCZcFsouxEJjpD83mUvFjBLpcp7ZzHUQB+QhCPE
 VccpYfplxqfFInhgsYfrAC3XnZrip2GM3GW6V5mXow==
X-Google-Smtp-Source: ABdhPJwLVelBNDqeZRe4FWYQ7Upvh1ty3HtU8x0P3wuLuo36vBnloNnJW/FrYjR6pZqapK9zEkH3Lgg1cMLvsraNYq8=
X-Received: by 2002:a17:907:98eb:: with SMTP id
 ke11mr29411177ejc.85.1624959568867; 
 Tue, 29 Jun 2021 02:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
 <CAFEAcA_vxA12WMi6qdV2_wNiNAKZ4j6-FTKnwfphT7nGznJoYw@mail.gmail.com>
 <12d4c7de-1346-2aee-75f5-4db729b7f1c7@linaro.org>
In-Reply-To: <12d4c7de-1346-2aee-75f5-4db729b7f1c7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 10:38:51 +0100
Message-ID: <CAFEAcA_BOGSuFBuW_YczvbT1eFRhq9eL4K7f8EaSwjvPfEXmbQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] target/arm: Check NaN mode before silencing NaN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joe Komlodi <joe.komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Jun 2021 at 16:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/28/21 7:54 AM, Peter Maydell wrote:
> > Richard, Alex: what is the assertion trying to achieve ? It doesn't
> > seem entirely obvious to me that because we're in default-NaN mode
> > (which is a property of the *output* of FPU insns) that we should
> > blow up on calling float*_silence_nan() (which is typically an action
> > performed on the *input* of FPU insns).
>
> This was in response to e9e5534ff30.
>
> My assumption in adding the assert is that it was probably a configuration error.  If you
> disagree, I suppose we can revert it, as it's not critical.
>
> > If we do want to keep the assertion, somebody should audit the
> > other frontends that use float*_silence_nan() (i386, m68k, s390x)
> > to see if they also need updating.
>
> Easily done.  None of them ever set default_nan mode.

Hmm, I guess this was just Arm, then, and the current code
is silencing the NaN and then ignoring that result in favour
of the default NaN, which is a bit unnecessary. Plus, we have
this patch now thanks to Joe and we don't have the hypothetical
"drop the assert" patch :-)

Applied to target-arm.next, thanks.

-- PMM

