Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0C569DE80
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 12:11:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQXi-0000zA-BN; Tue, 21 Feb 2023 06:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUQXe-0000y9-5Q
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:10:39 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUQXc-0007lE-Am
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 06:10:37 -0500
Received: by mail-pl1-x62b.google.com with SMTP id s5so4529811plg.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 03:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IaITuLlLP4iQbpzD1uVqt45fNyxN/g/+1suQIXu7MHA=;
 b=AiViNmNr1Ji4aXgprVkJJEbEG0w7IT7AVz1l6Pt5WqtRo29+SkimPf4l2XpCzAoHjz
 RWg3FmvXFPGWUIQuavOnamFisLedAd1up4dHvHutTHDD7JIOAiN98SqaccxbROqDj2Tm
 OZCdfVVTdIK3J3zxatrCQgoS1YZ8HeSk0G/7d7k/OPuWmmJWOGvEbuJwEv00gbwD+ABA
 ExwLVjlK1nC+biWU6SfP6fZbf31JxXogJx2DzR03mOs1lbatveMI2dxWlCJCuTcORNdN
 yHM3vq2VZ1t1OcHJdcWvex36uK8JcbfiI1Wc/vnE3mtli45IHbYzao4DHL91IuhtllT9
 Ic0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IaITuLlLP4iQbpzD1uVqt45fNyxN/g/+1suQIXu7MHA=;
 b=EJSqss0Y6HUmU50XPV4PsA21I47xlfnBjUDYn/6RvKrwiA5RI5VyxKAatUx5PwZgcr
 hsZA5QSpCVEwTn6bvR8ZGBDnSDD0MkvWhmA/z3f/aJ95BUfGjF1y/cJCg26EqSakt1+K
 kl6hmSVzFTVsxg0d3w3fntiHnclT7NJhnj7dYbdHtalG6zYz1JN8ZWeKK1E4C9E+s50C
 2CevQd6/gR2Pf7lh0Fmr2LvgS0h9na9lKR1d8PUEgs7Jtgxo4ycSJ9egpttjTFNszRQK
 ZhrNCp1kKOIXe7GJquKnLY59Fz/ZlLYLSIXAd5VTlWw3C6UVAa6Qh43H1AhdQaGLOwhu
 PSOg==
X-Gm-Message-State: AO0yUKU3Gyzndotnhwg3MuCw1YnjweWuiGOVGQV4mlXvCsd85ScY54fv
 SEz85e/QbxiFwM1w27sKQXpGp6SE8RWuUHOo3ACvgw==
X-Google-Smtp-Source: AK7set8vcI2QeaDW5V5YlJIV1rME21uWoEQTjA4st6eL4PuHqXdxpz38rlDUDmnbRXNhztWB6Z+B1zs2WN3gMM6Eo/M=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1641695pjb.92.1676977834393; Tue, 21
 Feb 2023 03:10:34 -0800 (PST)
MIME-Version: 1.0
References: <20230217150829.283583-1-kwolf@redhat.com>
 <CAFEAcA-6hq=70fQvWXEU4D0_9g6p4rrSxiXZ2-+yZa3fgb9jxg@mail.gmail.com>
 <0624a2c5-aee8-4466-939f-76e602331e2f@linaro.org>
In-Reply-To: <0624a2c5-aee8-4466-939f-76e602331e2f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 11:10:23 +0000
Message-ID: <CAFEAcA-Kc+958rsvA8qFqXWoo50OxmtKOXf2TE3X8mr91wZy0A@mail.gmail.com>
Subject: Re: [PULL 00/22] Block layer patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 20 Feb 2023 at 19:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 20/2/23 18:01, Peter Maydell wrote:
> > On Fri, 17 Feb 2023 at 15:08, Kevin Wolf <kwolf@redhat.com> wrote:
> >>
> >> The following changes since commit 6dffbe36af79e26a4d23f94a9a1c1201de9=
9c261:
> >>
> >>    Merge tag 'migration-20230215-pull-request' of https://gitlab.com/j=
uan.quintela/qemu into staging (2023-02-16 13:09:51 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://repo.or.cz/qemu/kevin.git tags/for-upstream
> >>
> >> for you to fetch changes up to a4d5224c2cb650b5a401d626d3f36e42e6987aa=
7:
> >>
> >>    hbitmap: fix hbitmap_status() return value for first dirty bit case=
 (2023-02-17 14:34:24 +0100)
> >>
> >> ----------------------------------------------------------------
> >> Block layer patches
> >>
> >> - configure: Enable -Wthread-safety if present
> >> - no_co_wrapper to fix bdrv_open*() calls from coroutine context
> >> - curl fixes, including enablement of newer libcurl versions
> >> - MAINTAINERS: drop Vladimir from parallels block driver
> >> - hbitmap: fix hbitmap_status() return value for first dirty bit case
> >> - file-posix: Fix assertion failure in write_zeroes after moving
> >>    bdrv_getlength() to co_wrapper
> >>
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> Applied as commit 2d89cb1fe5 ;)

Whoops, yes, wrong canned-email. Try this one:


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

