Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52383522CF
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 00:35:13 +0200 (CEST)
Received: from localhost ([::1]:41950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS5uC-00011B-K6
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 18:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lS5tG-0000VM-Mm
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 18:34:14 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lS5tF-0004Rg-3F
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 18:34:14 -0400
Received: by mail-ed1-x52e.google.com with SMTP id l18so3648572edc.9
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 15:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LOhf5lBHvgQi5mbH0YFe0vXPOWcwO09cXagxqYQSLpM=;
 b=vilqFuO2p3xqIpDNtySXK6xtiiyxdZD1uQ3epedfNXgllv1OxtFcS3ROjjUa5lFqcs
 z+z8iJAGqHIh5t2ExeHwdQ5e8G1IxtTUjtt+dWsNpGiYJpRX2339Drr28vy/FHfowScb
 YjmyMm27AwZi/884r74F3SDcgShQuPhO0/9ugsXU0ZJra5yg+XaO6LokFWLPCniTph1N
 ic+ExF8QgFcz7o5XjVOYWwdySfwmh9Y1gY8Ecat1x6nWKeo1pSkHszFkWpeIPSlA1YIv
 3hKgCtkXV5LWSI6eWflgPiApr9R4b22Rw+Ew3efyj1SXpja/b48qoRkQpojhX7am+ohJ
 LiGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LOhf5lBHvgQi5mbH0YFe0vXPOWcwO09cXagxqYQSLpM=;
 b=jK76rSmoteEsRk3Jr6Qadz0Nn1/EjRfCneVULVFTjtj8nSsQVpE+fiM72Pjn7Xe7nM
 UY8viUepHSrK5L+Mnz95QGHAxQwK/leLa0Gu4BoK9tn3tVUph0LCVASR7ceJTY0mABu8
 LakBn0ktW67BONebVS3lm4I8jZvd6CptspLN8FbKjsX6tFwAMPyate3EPT4ggPyaLr+N
 xOh2fJfb6heLGICgGN6PR89xmox5WK9geN6HD9rEDjjI6MY3lgloZr+0+MTGcSw5w0uP
 cNPhDL8pqswKx7eD+rdbivK2ydotpkBkZPUzBJfsEqt2RSdrLpg6VflNGVJexuD+E2dq
 hevw==
X-Gm-Message-State: AOAM532LSZjTsePV6XPJs5feaztR7OLFg/NTYcqIhJ5q0jJHAE4BzcJ6
 Jy6hgBbJwPSWn0l2wEo9zjZ3FKqYpGk9BwbtVWfrgQ==
X-Google-Smtp-Source: ABdhPJwco0+PIDnbIemKYAU3If5dHJc30Vl6wNK4P3G5pHrY1QgxVvI4ydxf1LLaoXWUI+GMaXEJyb7XjeBxZIv26Jk=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr12304507edt.36.1617316451283; 
 Thu, 01 Apr 2021 15:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210401115532.430961-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210401115532.430961-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Apr 2021 22:33:37 +0000
Message-ID: <CAFEAcA9viD-ryLrgR9MQ=zVQyYA1XMetKO8AhmADxHrxA3wObA@mail.gmail.com>
Subject: Re: [PULL v2 0/9] For 6.0 patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 1 Apr 2021 at 12:55, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 6ee55e1d10c25c2f6bf5ce2084ad2327e17aff=
a5:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.0-202103=
31' into staging (2021-03-31 13:14:18 +0100)
>
> are available in the Git repository at:
>
>   git@gitlab.com:marcandre.lureau/qemu.git tags/for-6.0-pull-request
>
> for you to fetch changes up to d3a0bb7706520928f8493fabaee76532b5b1adb4:
>
>   tests: Add tests for yank with the chardev-change case (2021-04-01 15:2=
7:44 +0400)
>
> ----------------------------------------------------------------
> For 6.0 misc patches under my radar.
>
> V2:
>  - "tests: Add tests for yank with the chardev-change case" updated
>  - drop the readthedoc theme patch


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

