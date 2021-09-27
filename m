Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD1B419604
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:12:20 +0200 (CEST)
Received: from localhost ([::1]:37488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrMh-0001tK-2u
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUrDs-0005oL-Lm
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:03:14 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:43973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUrDr-0007gU-5T
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:03:12 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 c73-20020a1c9a4c000000b0030d040bb895so70061wme.2
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 07:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e79KqByijb1H8rLvqIqlFOX4oAkqkV8I/eBFpk7GgMQ=;
 b=InP6OhmePV6Gk6Zm/173aNwyIEgWLi0MMVKA4rJ70DmYOlcIYpoHVLJ2fZqr8AhpJl
 cl/2VjKBEtlxloQ1W4uCMVBWykN8vAXx+GBZigCaBIBq9LGq6SBRo85GN+X5hx11xxeQ
 VGfCSjYu2KF52AI1Ff0x1U8ijagfnmhwdsMLfDTI6QHqJ710zWTKZP/sZ9bMJL0sfmXW
 l0n6usRJvp8NJkrY0TF5tifFjGCAQ95NLa+7BKwp79q27H/7IBcsO0xUOiIIyqjP8OUL
 YjBB+qsWNas5nzt72el2she9kc5wOFXyEoOOFJj1k4nSpKiOQ/1GM2V3AjpFKnP7vwi2
 LPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e79KqByijb1H8rLvqIqlFOX4oAkqkV8I/eBFpk7GgMQ=;
 b=ehHtgx7kATOwvqWnX5EESKZcCRg5Vu5RNZUnxbinuFN4tXvbcX92AOlO85nStX5pMS
 vU3gnfFtm4RU+gLYn6k7kKzIX0lOGDpJOokQS3pCB+Yxe+VkBdatGZNDNcLoP7Kx3oDL
 k5W2s2G28MZlM4Lv7dkfFnpoH46kTvMxJyY10F7PJIPT7ECaps6vntCyfs31XpzGvL7I
 RzB6f1rkTi48HwxjOA2AahRf4LLVYAEas/VnULWGTbKasL6oOjpuc2JLMJrnTIcneFF/
 EocBUMcDNzeuL4eY3yNrWuO2QHuDTj5SBkElAN7SKkDvESn3LvKEVfoSDG8oibxXBznj
 YBtg==
X-Gm-Message-State: AOAM531gjd4Ch/88eeChedE6s76bKWJFNb3k9/4PQgzCv0fnEDh7t4Mc
 HQYrBoZxNOHnFBmpWq6bxuTHql5x9ytS/40rEWZJSQ==
X-Google-Smtp-Source: ABdhPJwlYdRAIInYJtX3al9Ors1bsLkY0O17GsLPaKohgw7EYZLCz17cz9Blixn25pVx4r/kDEld3n6eP9QObTyayIg=
X-Received: by 2002:a1c:e906:: with SMTP id q6mr4945332wmc.126.1632751385612; 
 Mon, 27 Sep 2021 07:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210927095252.2374148-1-laurent@vivier.eu>
In-Reply-To: <20210927095252.2374148-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 15:02:12 +0100
Message-ID: <CAFEAcA_wQCbGUCX8gEWJzDBpPzPDSahJCRUXJA+M_1uGNk5pSQ@mail.gmail.com>
Subject: Re: [PULL 0/5] Trivial branch for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Sept 2021 at 11:02, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 11a11998460ed84d9a127c025f50f7234e5a483f:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20210921' into staging (2021-09-24 13:21:18 -0400)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request
>
> for you to fetch changes up to 45b09cb12f5440971b321fc255e3930f38366ace:
>
>   multi-process: fix usage information (2021-09-27 10:57:21 +0200)
>
> ----------------------------------------------------------------
> Trivial patches pull request 20210927
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

