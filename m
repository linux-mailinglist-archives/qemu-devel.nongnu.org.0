Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A88233A55A
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 16:14:46 +0100 (CET)
Received: from localhost ([::1]:43644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLSS5-0006VD-1w
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 11:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLSQT-0005lW-12
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 11:13:05 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:36799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLSQQ-0005qR-Qo
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 11:13:04 -0400
Received: by mail-ej1-x62d.google.com with SMTP id e19so62183144ejt.3
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 08:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=fRgcZDhwyxRtxpYQ0yszBaz2ZXXxS6so04sjVAdOQwg=;
 b=cmume6Kq1+II+lSfuOTXFGYxUA53wMtIEM7x8VBdRaPrAh+Kok+wepmwW062Uxf9Di
 ndnNNV6yCvwGiZJU+ZM8EusrbSn4zNVvNCboifwqmMbh031gZ7m5U4k6nnsgFru0/ewF
 J4o5jL7PlF+y4xj4pWoyUAInqOOiAFpBYSslUuLYBICqrVG/sKZD5uzgPnhD5TmEwgZi
 UBfmcZeGXCyYN+E3Cm99pHTorIgr6t+5sP3fizr/eJoW1CuoY9wNoznfQgElCgnzYsqa
 7BW2iGWgmDstaF4nG6LxyGBTU507WR7AoSGe7As/FY02zzxc3Yl1sFPr8gr48yH3HDmT
 lDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=fRgcZDhwyxRtxpYQ0yszBaz2ZXXxS6so04sjVAdOQwg=;
 b=WTjmzumIeAF4eHp1ka8/5eUgISMFxRHk+b+EJdFWmqBwgdFZbbkZ6KIZw4ogmzZEmC
 cpUtoJ2HI6MInahaOmsYv0ja2YFMuhE2Gm28bsAO1C5LunY6u0cHqX9ejTRHXbbXu+zQ
 HTRpIedJAfKF1KrSP9GXIgyoclPfkj/Xr2eMTgFXwl3p2QG9qjOSy6KboxY2whYwszBF
 WY+Ymzo/bglwyZI2V6Ic10GNKe9VplvN1hoZgkRf2OgvQQXoEP4oKCne1BeqFWhfuHIS
 m+AeQmPCRKk32exoso4h3nI2ijctp6FxNRlfYViKsNIi5quPdk91mdx9b8xUSkwBfiJR
 7kjg==
X-Gm-Message-State: AOAM532COoFhMAgDr0PKPUCMpZANV60n7xaYbyRxHlQUGH17eSmBqoUf
 5yxoqar0N2hholxheBki7sLsy5/YK3C2dG74vGA+0i6U58lB/Q==
X-Google-Smtp-Source: ABdhPJww9qyXf7f31Y6O5H189Gc/f19QQwnwlX41kFDEzJ6dCmvtixZsZzQmWU0ZNO44idXupwt4hI9yAiAs8SXJfM8=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr19364990ejb.56.1615734781101; 
 Sun, 14 Mar 2021 08:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210314131829.8430-1-peter.maydell@linaro.org>
In-Reply-To: <20210314131829.8430-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Mar 2021 15:12:39 +0000
Message-ID: <CAFEAcA83RuEf7Y-kQ4=WtJHcgBSCz9US9tEnrv3k-kL=jiLfZA@mail.gmail.com>
Subject: Re: [PULL v2 00/39] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 14 Mar 2021 at 13:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v2: fix format-string issue in a test case.
>
> -- PMM
>
> The following changes since commit 6f34661b6c97a37a5efc27d31c037ddeda4547e2:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2021-03-11 18:55:27 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210314
>
> for you to fetch changes up to 6500ac13ff8e5c64ca69f5ef5d456028cfda6139:
>
>   hw/display/pxa2xx: Inline template header (2021-03-14 13:14:56 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * versal: Support XRAMs and XRAM controller
>  * smmu: Various minor bug fixes
>  * SVE emulation: fix bugs handling odd vector lengths
>  * allwinner-sun8i-emac: traverse transmit queue using TX_CUR_DESC register value
>  * tests/acceptance: fix orangepi-pc acceptance tests
>  * hw/timer/sse-timer: Propagate eventual error in sse_timer_realize()
>  * hw/arm/virt: KVM: The IPA lower bound is 32
>  * npcm7xx: support MFT module
>  * pl110, pxa2xx_lcd: tidy up template headers
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

