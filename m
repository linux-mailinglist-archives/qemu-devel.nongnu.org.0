Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C413D59A4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:37:43 +0200 (CEST)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7zra-00053a-4p
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7zqm-0004Lo-Jw
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:36:52 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7zqj-000452-Qq
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:36:52 -0400
Received: by mail-ej1-x62f.google.com with SMTP id nd39so16215082ejc.5
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hwqNQnnkQ6VvQhnQ5/Xd0dlUGvaWLK8p8LzL/bSXvr4=;
 b=wj2dC6L6xNNdtHKvfdfoR3NPTXC1GF5wmPwhNIZ9XvEHBao60yy0ebAwZ2aYGTQDFl
 o19COMPDKYP2DkRPqIJSXoJGzPjwrAhidGBQY7q4LhE0UOSkTZW9yjjErZuRtJt4c2uc
 4Oc0pQDgPOnC6t0rD8BNtiG3SB+jAMBz2+Ua2OQwdHqgNgooz7jveIB3gdW+NUtYBMrZ
 TwavlIE469FI88hCjcTnTmyCAK367a4N4iJhnIcCD41TrUgEydonCDJh9xmAhz1IzS3I
 y7+yYX1CqZjFoKhk3mmfg9DwJUmt5vPqnGxaXOxd8c3ThCur05aPstl4NrkLYIhiCe0v
 0MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hwqNQnnkQ6VvQhnQ5/Xd0dlUGvaWLK8p8LzL/bSXvr4=;
 b=sKPWxM4bdPY8LzTtjtGUK8qRQfBFBOihDG1Ocgnwv/mQaF5hjLapP5FUoLm+37Ae/n
 M7g+7wYkXvF8vm/KceVO7f7RFml+mmDkUDJgVYRq47bxL737PwDaNj4NWpk7fiwvyTO4
 X6tvOSCIQyQmZ6siSKHqOSQGRA6T/Y6jLrcFW/KsCut/WK+mah+QBOKDA//J3l4bM4jx
 NUFT4KSci/3VnZSbpSApyab644BCAXj3Hb14y+6kkup1dzz9elfAyW5LM6Esd2536RBd
 D03o6vIsfreSnvF+OChN1ETA1vtXTJa4WO3c05547wjYZGCVI6ltFbdGokNJ9OQpBcAb
 SmQQ==
X-Gm-Message-State: AOAM530PVPR2DDV3VAKb7oVXMDOlPfGIS0kilHp4kB2pulclPCImEy6J
 wL6ZsaHgzrQ8a9PgUmglW4pTdRIDsydob9yF8npOvQ==
X-Google-Smtp-Source: ABdhPJy/bNFRWpdTcf2gMsjYkF9S8Ege/6v1cQEj6EdYjsaHKT+z/B9h3FIEiJPOJ7RLO4mn6eylBVW/pqOjdHy6xdE=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr17229635ejd.250.1627303007846; 
 Mon, 26 Jul 2021 05:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210723170354.18975-1-alex.bennee@linaro.org>
 <e66f26d0-f2d6-c10a-8da3-de7d03d13391@redhat.com>
 <CAFEAcA9zijOBP++1HsUTiOpE6gt1fnUpYEzHXuDrMWsUxvPz+g@mail.gmail.com>
 <YP52ODpqY/1nfNmA@redhat.com>
In-Reply-To: <YP52ODpqY/1nfNmA@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 13:36:05 +0100
Message-ID: <CAFEAcA-cgfHbYHChThgrT_C4iw8N=+C=VyyKAGzRwKoPvo6gjA@mail.gmail.com>
Subject: Re: [PULL for 6.1-rc1 00/28] doc, metadata, plugin and testing updates
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 at 09:45, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Sat, Jul 24, 2021 at 11:04:03AM +0100, Peter Maydell wrote:
> > On Fri, 23 Jul 2021 at 18:44, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
> > >
> > > On 7/23/21 7:03 PM, Alex Benn=C3=A9e wrote:
> > > > I realised I'm on holiday next week so I thought I'd better send th=
is now.
> > > >
> > > > The following changes since commit a146af86c8247f41b641783428b95ee7=
1eb0e43f:
> > > >
> > > >   Merge remote-tracking branch 'remotes/kraxel/tags/vga-20210723-pu=
ll-request' into staging (2021-07-23 12:16:12 +0100)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://github.com/stsquad/qemu.git tags/pull-for-6.1-rc1-230721-=
1
> > > >
> > > > for you to fetch changes up to 0a9487d80af9ed6fa14d2696bc34a920b32e=
53e5:
> > > >
> > > >   gitlab-ci: Extract OpenSBI job rules to reusable section (2021-07=
-23 17:22:16 +0100)
> > > >
> > > > ----------------------------------------------------------------
> > > > Doc, metadata, plugin and testing updates for 6.1-rc1:
> > > >
> > > >   - git ignore some file editor detritus
> > > >   - add overview on device emulation terminology
> > > >   - remove needless if leg in configure custom devices logic
> > > >   - numerous gitdm/mailmap updates
> > > >   - fix plugin_exit race for linux-user
> > > >   - fix a few bugs in cache modelling plugin
> > > >   - fix plugin calculation of physical address
> > > >   - handle pure assembler/linker tcg tests outside of docker
> > > >   - add tricore build to gitlab
> > > >   - remove superfluous MacOSX task
> > > >   - generalise the OpenBSI gitlab rules
> > > >
> > > > ----------------------------------------------------------------
> > >
> > >
> > > > Philippe Mathieu-Daud=C3=A9 (1):
> > > >       gitlab-ci: Extract OpenSBI job rules to reusable section
> > >
> > > Oops this isn't to latest version of this patch :/
> > >
> > > https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg06130.html
> >
> > Given Alex is on holiday, should I apply this pullreq anyway and
> > then you could send a patch to fix up the differences afterwards,
> > or should we drop the pullreq (and maybe this stuff doesn't
> > go in for rc1)?
>
> I think it is fine to apply the pullreq anyway.

OK, I have done so.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

