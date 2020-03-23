Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB8C18F8CA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 16:39:23 +0100 (CET)
Received: from localhost ([::1]:35762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGPAg-0007Aa-D2
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 11:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54948)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jGP9v-0006gR-GU
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 11:38:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jGP9l-0002uH-2o
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 11:38:35 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40368)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jGP9k-0002t7-Kp
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 11:38:25 -0400
Received: by mail-ot1-x343.google.com with SMTP id e19so13804679otj.7
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 08:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9QVyaxtBTYWM+/6lVK1qrMTjSMuHp6KUwzRhisbYsqU=;
 b=MR2KOLwJdEXGlwemTRezdwDpEa0uUzCfTvuw3VcbR11k9AO/+HR8pIpu+hGHb5G+lh
 OwwJB+QTYUybbhYW5wD02Tw2nelRHcC0jbZ0bPwH9XEH6PyIWKtqCqe9pvYzPCCgkGPk
 /KoMwcdHnfihEivP6UH8OFJHdKchYvwCTuXNlhiJ+9zXfqFWOVxIjV/1POWFXZcAodvC
 YLL+RPYNX9zQt6QVVz4CZloTh5e8wcGWpWskDaDDQPN+bf5SS4XSsfw8BVXJgH28i/Ye
 esDkJ8l7fs26j/enetLpXasDLtHPMigb3lxFyDcb1VdWh3ive3Sc/r8jgFUy799+Munk
 tlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9QVyaxtBTYWM+/6lVK1qrMTjSMuHp6KUwzRhisbYsqU=;
 b=CKGlI6vZ4lBpy9Hi6rjvLNY0ay+FjtqIlQISQrmKsuDfJ7EomSzAua1Fye6D1eUbDJ
 ZCNY5M2FfIhFlJcon44MCowIKewApA8eWRls94PPeHW3bl2dT8QUaXhB4cBp67FTEV31
 Zz0XGSe8QmHf1GvwUV/BXeWhy+wt5z9WO1EurNaNl+Xl6Lj1vEqSHJGsFa0d3/0SdzwZ
 odmDDGkDToZiDkRnoDLxQDa3+SbIM0uMdRWr35ZVZb+JXEY3X4uwzagkxHj5PkwmamO2
 FxpBAY04ENl5Hyjgmw4zBjc0ml7VstWrlMzBJha17aveYOwq4JyHNoGAJyJsh7f+G1a9
 zchg==
X-Gm-Message-State: ANhLgQ2BYaZ33fjJhktp9EwCQ++A9CgOz1AJla0CXK9+faq90HQ7o3tl
 PqjMfqC+nao4b3N/GkXsCYG54WIijauR9eoTWYh/VGja5sk=
X-Google-Smtp-Source: ADFU+vvSgPal30i7Njf7xFBJb0nOTCHt/vXf7vQeUaCyfVi6+teZ0wAB3end5JTgLybEw6oR+UAIPVp37q9v8CG9AN4=
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr18504726otm.91.1584977903034; 
 Mon, 23 Mar 2020 08:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200323114116.163609-1-laurent@vivier.eu>
In-Reply-To: <20200323114116.163609-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2020 15:38:11 +0000
Message-ID: <CAFEAcA_iGxN+o=fknj=+y1iEynWy7QLs1+uG0RubzEbVxAqi3Q@mail.gmail.com>
Subject: Re: [PATCH] linux-user,
 configure: improve syscall_nr.h dependencies checking
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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

On Mon, 23 Mar 2020 at 11:42, Laurent Vivier <laurent@vivier.eu> wrote:
>
> This is mostly a fix for in-tree build.
>
> It removes errors on .d directories:
>
>   grep: ./.gitlab-ci.d: Is a directory
>   grep: ./scripts/qemu-guest-agent/fsfreeze-hook.d: Is a directory
>
> and improves performance by only checking <ARCH>-linux-user directories.
>
> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---

Applied to master to fix the build errors for in-tree builds.

thanks
-- PMM

