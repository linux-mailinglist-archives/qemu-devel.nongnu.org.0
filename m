Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3833E36466A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:50:08 +0200 (CEST)
Received: from localhost ([::1]:42764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVDu-0008TY-3A
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYVCu-00080w-GL
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:49:00 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYVCs-0003Dg-Jk
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:49:00 -0400
Received: by mail-ed1-x529.google.com with SMTP id y3so4773250eds.5
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y0JeETNui92NMIF2iijOMdLXiYfsV4Q6HKumNEUI0tU=;
 b=Hkw18cfkC+2ILTSvtSSW+Tf9SKivk2oZjlS5UTYf6IKvrBrAeO5i90b5O6ZyZo8Qbl
 K2KI/grpe6oCIKB0II3jS+RemprSHTbRu3Ys+iGdOpQyBbknI4o5U3oN6USM5hKbRuv2
 aC7adhZj/tCJrAHyJUm0GdiRg76v89ttQNQkHkB8SwzXTfbezBjW1CyUCd5pnwi6GN8c
 U8vWEkwcePQ++LzHA6TXaR8SdbhKg35ehtDUUqsLI7hvRC7o1a5InlUUfpzvgbkCNs+f
 obsvAJwcUJ5iCXonzNHS8TRxqZnJ9zSOi+u6PYbVznrbzldytzfoIXZR5P1p8Js3d0VQ
 eakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0JeETNui92NMIF2iijOMdLXiYfsV4Q6HKumNEUI0tU=;
 b=m6UFgY5vye9N6spJLq36SQq5h7KttcfQM2vKGsEmT3vwlfJWcRvyFtrxPNf3kRFe55
 anxSciQS0alCTF5B/sGFfWiJ/oUMia24faZdx1vOZ4eXmZtDUwqns5lxmHo6ghMs9S4U
 UDylton/FpD2DGvoiVeLjh/ZVxJibYgzxX+I9PU0KS5vukLr6knZHhsHBDh0jIcXE+rD
 EqfPx9iyrPQTfG8FDbbwC8dj3RTN+VWcpN/RVr3in5vCfHO7BUy09I/I5lwYLvI29pwP
 YKKhXTWKWrpaTvbRSmAMjpGlt4O2T2hlT3+aI16LPbh92jqzOVbLnTnCYXOvSngiWDed
 IDmg==
X-Gm-Message-State: AOAM532lSchXUZLJh3ZezyPkURBiKHsks2coVx0gujh8TDPQqCOSMFyh
 GibiU4eKwGraoz06FVehNIK5gyyfM+fyhtUK3no+/ghuEN8=
X-Google-Smtp-Source: ABdhPJwIhhGwlEe4lcCZ8dUTEzOTtWusdtRQnseFh2arnKakR5+dh8vtxPs/nwXhRbG0o2oHirf34WyMFooL1LzvfOc=
X-Received: by 2002:aa7:d28d:: with SMTP id w13mr25772649edq.251.1618843737124; 
 Mon, 19 Apr 2021 07:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210417194205.17057-1-peter.maydell@linaro.org>
In-Reply-To: <20210417194205.17057-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 15:48:05 +0100
Message-ID: <CAFEAcA9OJBSvRqbDq-KUr-uqvDnCTfS6c1daqAtSBbWBoVRtgg@mail.gmail.com>
Subject: Re: [PULL 0/7] queue of proposed rc4 fixes
To: QEMU Developers <qemu-devel@nongnu.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Apr 2021 at 20:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This pullreq contains fixes for the remaining "not fixed yet" issues
> in the 6.0 Planning page:
>  * Fix compile failures of C++ files with new glib headers
>  * mps3-an547: Use correct Cortex-M55 CPU and don't disable its FPU
>  * accel/tcg: Fix assertion failure executing from non-RAM with -icount
>
> None of these are 100% rc4-worthy on their own, but taken all together
> I think they justify rolling another release candidate.
>
> thanks
> -- PMM
>
> The following changes since commit 8fe9f1f891eff4e37f82622b7480ee748bf4af74:
>
>   Update version for v6.0.0-rc3 release (2021-04-14 22:06:18 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210417
>
> for you to fetch changes up to 277aed998ac2cd3649bf0e13b22f47769519eb61:
>
>   accel/tcg: avoid re-translating one-shot instructions (2021-04-17 18:51:14 +0100)
>
> ----------------------------------------------------------------
> Fixes for rc4:
>  * Fix compile failures of C++ files with new glib headers
>  * mps3-an547: Use correct Cortex-M55 CPU and don't disable its FPU
>  * accel/tcg: Fix assertion failure executing from non-RAM with -icount
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

