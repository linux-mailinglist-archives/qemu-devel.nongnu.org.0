Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F92F5E1C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:55:24 +0100 (CET)
Received: from localhost ([::1]:34418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzzLf-0008NL-Br
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzzKq-0007sF-DY
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:54:32 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:42862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzzKo-0003G9-OX
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:54:32 -0500
Received: by mail-ed1-x536.google.com with SMTP id g24so5028722edw.9
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eManHjjHA7c511733DkW9Qufm/eOJvqXRAiFrI8bfek=;
 b=N+mSfFyU3L0Wezwq/0b9zT8R3jzCwTxD114fGpgIHhNVAhqbshOju2DQvlHqh4GaSt
 b0gBwo58J5IwLcTJbgLo2YI9cb4Se/I2+Cp37+FvQLaqlVt/Jtw/0ZvoYqiM8C4rexeb
 HEo188Yx/agfowcKMFHfw2jp3Hu1Pya5FJ3PaQ0Kb0qNs9xmsPfYBTmt49xZlL6gNghN
 jx0DR/DoVFQmLF6nKv1f/ysYWpYMmlP4XQHbeu+aTY2LnZXS74mPJqppLaG+Z/ms8NZ2
 vnpp6+4ybr3io6HTDtUx7VIO5YxM1/yWRkhZ6ZPg/8duP/fHNtBILrxt4Cnw//drAdII
 6yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eManHjjHA7c511733DkW9Qufm/eOJvqXRAiFrI8bfek=;
 b=PNsmSmtsnYlPeDTKVdABmw8JiAgXDGbUG08F3ZvBTwJ5P2VnxbG3DPsCnZ3JkeGHgS
 68DaQAlEhMYIqdswYJ5NTmsfdkYqfb78OP07DHuJTlk3P0+h8SEZvRsMAv/PshQw1ldv
 5/85FJ/u9x+KZ8uJB6sUykK5arhkTJYOOeczyXuMx6nocZQ9avtEYdKkPpibQJjqoHOs
 807swLfGNMNay2+QaerUI7nhutwTUJBx/y9gMPkVqsLuCs6t73MzenD+4pAOMK6rt9pr
 aIpVFgfaRADMaSm65RSY+RRpFiQPe9plFiyTlP6gbTVXEJsfvoenL+U/Yj9XdPN6xY5U
 ZZTQ==
X-Gm-Message-State: AOAM533KjK+AsEWytKUaY9syWpoTRc2e/UfQsF8VJCr7b+OX89f96E2R
 EqOiGu0CUaFbPmVfZDjH1myjS7xo1N2LY0gWRVPcPg==
X-Google-Smtp-Source: ABdhPJy98295lvhsdq+M5UkPqxeLX7m7tY/vIisMO0RYKDIXZ4BGQ6t8ox5Uc5fRuYLb6L6Xa466CNcqJ+zUppxONCY=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr5226653eds.146.1610618069275; 
 Thu, 14 Jan 2021 01:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20210113161128.3156-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210113161128.3156-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jan 2021 09:54:18 +0000
Message-ID: <CAFEAcA-AukSy27_bzpA-fgAikXO5HXV6Z1An8fgNA9ft=ewFUg@mail.gmail.com>
Subject: Re: [PULL 0/7] qemu-macppc queue 20210113
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Jan 2021 at 16:11, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit f8e1d8852e393b3fd524fb005e38590063d99bc0:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210112-1' into staging (2021-01-12 21:23:25 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-macppc-20210113
>
> for you to fetch changes up to 7b3180f9110e1cee00e9acb36cb4d16bd7efabee:
>
>   macio: don't set user_creatable to false (2021-01-13 12:21:21 +0000)
>
> ----------------------------------------------------------------
> qemu-macppc updates
>
> ----------------------------------------------------------------
> Mark Cave-Ayland (7):
>       mac_oldworld: remove duplicate bus check for PPC_INPUT(env)
>       mac_oldworld: move initialisation of grackle before heathrow
>       macio: move heathrow PIC inside macio-oldworld device
>       mac_newworld: delay wiring of PCI IRQs in New World machine
>       macio: move OpenPIC inside macio-newworld device
>       macio: wire macio GPIOs to OpenPIC using sysbus IRQs
>       macio: don't set user_creatable to false


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

