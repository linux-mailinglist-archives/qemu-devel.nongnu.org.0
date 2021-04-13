Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E144135E768
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 22:06:53 +0200 (CEST)
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWPJF-0008Fe-0r
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 16:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWPHn-0007k2-WA
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:05:25 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWPHi-0001WV-G8
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 16:05:23 -0400
Received: by mail-ed1-x530.google.com with SMTP id m3so20869397edv.5
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 13:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=w9WQ94i88rm+4QKHz9Uv10CgwDXtuJgZNEwkeswXDsM=;
 b=xmASkibhkzNrGZKrnOkj+VsKs5uGWY0z+5ApxkQrUFJvg55VbY6R8dYcYC5pCUaDwH
 CePu0p/TipxIzUmi6flry5F8UlIbuOXdcsodLem80nYiJ7Jaco8EbCuvwYltP3CiMeoK
 vJ/+xK+2IMC5fPfcNdpnQraU7dzrFOQmjQHGhH4Rj4wieTm7zGPUeECqk/te1F2f8Kha
 jeCUOHq8oltg1tAjQ8z7NjSOmQdkoYIM0mYqMjMYU1eN8+NAy6Rg00D62US0v9sVoOjO
 xRT9BoYzQ6DN+wBo11y0kMKRKoknSx6OKlLSYZcxPYgrc0oudxMxcODx/Z3xvS9U5sBG
 jYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=w9WQ94i88rm+4QKHz9Uv10CgwDXtuJgZNEwkeswXDsM=;
 b=ame6pmbFBjZbUHxkSv90JJACjmloJBW0FoU4kJCrrIXys8yKven5V0WMCQdnWJIeVA
 e6Of3ja0vfP9FibtmHTkWTi4plOsihMENlCBELsIiKqY5127Q35iLiizjnHIWQEZasEx
 +rRhRLgT7bDPrOJsphaMmXkzDY8o6d8OND0JJA5hcW9ZY1A2V8PGqzdASOTKmp2/3mdp
 5qcoOGBJcT7AdRRcSrRJ3xoybDNpT6ckqRHwLI5IAmAGCxiTIYvWlNW2lN38Wi0akqzR
 +UTQss+ziQvgwFluLyUU7R2titFOj/MyqW2hrw1oB2E1oL2/UzdzRWReU74U16piWsNZ
 z3Cw==
X-Gm-Message-State: AOAM533qTAjUbnUiGRPlYI6dfPC2KlIrm1i7scVDvHZ1p/RUYS98yM0u
 OFk1LDYK4LHyq9jp5o1r6ZaRHwrg7qwZvgRGckLCeuFTOyc=
X-Google-Smtp-Source: ABdhPJyOPsg5TKmoZuhtmA7BQMQa6Tp6tdIjWDXPzX6vTwlm5Q5wodZzK/g+FBS2l4svsVdB+4xBEBr8utHfnGTlLiw=
X-Received: by 2002:a05:6402:c15:: with SMTP id
 co21mr28720721edb.251.1618344316885; 
 Tue, 13 Apr 2021 13:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210413120752.18699-1-peter.maydell@linaro.org>
In-Reply-To: <20210413120752.18699-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Apr 2021 21:04:31 +0100
Message-ID: <CAFEAcA9KVSvLWWTJwA14Lq2+aNoZ2pVBO-FzXGWB367Zy_qFZw@mail.gmail.com>
Subject: Re: [PULL 0/3] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Tue, 13 Apr 2021 at 13:07, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> A few last patches to go in for rc3...
>
> The following changes since commit c1e90def01bdb8fcbdbebd9d1eaa8e4827ece620:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210412' into staging (2021-04-12 12:12:09 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210413
>
> for you to fetch changes up to 2d18b4ca023ca1a3aee18064251d6e6e1084f3eb:
>
>   sphinx: qapidoc: Wrap "If" section body in a paragraph node (2021-04-13 10:14:58 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Fix MPC setting for AN524 SRAM block
>  * sphinx: qapidoc: Wrap "If" section body in a paragraph node
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

