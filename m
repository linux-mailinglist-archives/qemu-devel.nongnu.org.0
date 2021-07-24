Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2943D4705
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 12:06:29 +0200 (CEST)
Received: from localhost ([::1]:43100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7EY8-0005Nv-II
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 06:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7EWX-0004di-Fo
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 06:04:49 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:34705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7EWV-0005ra-Qx
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 06:04:49 -0400
Received: by mail-ed1-x535.google.com with SMTP id da26so4846348edb.1
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 03:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4/1Hyane8qXFNRzjFm6hUP4cJb1MUz3gpzXk44qV1NE=;
 b=Yfdx02dHtQilHGymaxDx92U90xu6dzp2oIFKs+HU63s+c4iefEpeQDcz0nCCuN0amF
 gP37xkA67l4xJQrVqxvQKs2zvgbUQACGcTwNNSXUX05Z6NZ3mt+oMHkdKh57izb+pDvP
 BoEzN0THS3Ske1cDgB/HmAfOXpiv0LyFnZqqcRNr/dxZJTYPUio7ZPc8AXCZ9BgpwXf+
 Z37f5Y1eVKIZHQEa/x0zQhneqQrIKY//+z0fG7f2+mOWI0pj9e3NBk6nCVXZ6ad38u7L
 d9YX4kgERcSD7jq7iPCh1EOgpgdBrmwve3kC1WUhYLFjilQbtknKx6stdbesmB+PzBTd
 sKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4/1Hyane8qXFNRzjFm6hUP4cJb1MUz3gpzXk44qV1NE=;
 b=LZzloS2iIbaFo9cHOX5KE1ZbTwx3Mvc7ggJ0PBQcd/a05kQg4jrErLowtgoDjC2esT
 kK5A4sbxQ0zG+mJ4ydJ05GD9H2D3iHbWQSOz7oFMHN9ct6ljOsS1ZG2GQLfVyDSFNoTu
 508fphGR/SOnNugAh2DrHsMQ111ox0+QIM6SWDicvn7koTjxKSXygZEJzbdPnqzLJF/0
 uIiGJn8juLaCX+yGX3RZHwfwNZNMSisqcTEgj2b4p6TW7A9UdMWb+ByQ9OWWrUKDi+SA
 uFoWQjtiA98iNzQnG9+Uo1mYRsJ2onYgz6WOgo41Jkk1/mgL/IlHRf145m3+37zb7cBm
 VVwQ==
X-Gm-Message-State: AOAM532LKWvJDmMt3JEutPLCeOMHG+odNUpH3yRQSd2wC6YwL3bFJ+HW
 h0ysJbpv4hnORLfYvLGLTfFOpUbxTb+nAIUeELqWOA==
X-Google-Smtp-Source: ABdhPJxgjUuJY9NqvVJ9dWwq/sC7Tzl6XSKI6sQb6Ily3Xsr9rmaELmIdMHokg6ZIpxFwrKs/y3ZBTULdMQQALQK4Yo=
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr1132842eds.251.1627121084543; 
 Sat, 24 Jul 2021 03:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210723170354.18975-1-alex.bennee@linaro.org>
 <e66f26d0-f2d6-c10a-8da3-de7d03d13391@redhat.com>
In-Reply-To: <e66f26d0-f2d6-c10a-8da3-de7d03d13391@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 24 Jul 2021 11:04:03 +0100
Message-ID: <CAFEAcA9zijOBP++1HsUTiOpE6gt1fnUpYEzHXuDrMWsUxvPz+g@mail.gmail.com>
Subject: Re: [PULL for 6.1-rc1 00/28] doc, metadata, plugin and testing updates
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Jul 2021 at 18:44, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 7/23/21 7:03 PM, Alex Benn=C3=A9e wrote:
> > I realised I'm on holiday next week so I thought I'd better send this n=
ow.
> >
> > The following changes since commit a146af86c8247f41b641783428b95ee71eb0=
e43f:
> >
> >   Merge remote-tracking branch 'remotes/kraxel/tags/vga-20210723-pull-r=
equest' into staging (2021-07-23 12:16:12 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/stsquad/qemu.git tags/pull-for-6.1-rc1-230721-1
> >
> > for you to fetch changes up to 0a9487d80af9ed6fa14d2696bc34a920b32e53e5=
:
> >
> >   gitlab-ci: Extract OpenSBI job rules to reusable section (2021-07-23 =
17:22:16 +0100)
> >
> > ----------------------------------------------------------------
> > Doc, metadata, plugin and testing updates for 6.1-rc1:
> >
> >   - git ignore some file editor detritus
> >   - add overview on device emulation terminology
> >   - remove needless if leg in configure custom devices logic
> >   - numerous gitdm/mailmap updates
> >   - fix plugin_exit race for linux-user
> >   - fix a few bugs in cache modelling plugin
> >   - fix plugin calculation of physical address
> >   - handle pure assembler/linker tcg tests outside of docker
> >   - add tricore build to gitlab
> >   - remove superfluous MacOSX task
> >   - generalise the OpenBSI gitlab rules
> >
> > ----------------------------------------------------------------
>
>
> > Philippe Mathieu-Daud=C3=A9 (1):
> >       gitlab-ci: Extract OpenSBI job rules to reusable section
>
> Oops this isn't to latest version of this patch :/
>
> https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg06130.html

Given Alex is on holiday, should I apply this pullreq anyway and
then you could send a patch to fix up the differences afterwards,
or should we drop the pullreq (and maybe this stuff doesn't
go in for rc1)?

-- PMM

