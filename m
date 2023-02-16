Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F97699B15
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:17:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShso-0006SH-Q9; Thu, 16 Feb 2023 12:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShsn-0006Qn-2j
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:17:21 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShsl-0000fI-AT
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:17:20 -0500
Received: by mail-pl1-x633.google.com with SMTP id m2so2734810plg.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3iEYACqyF4jOdNUIXlWr4ULQGZwH5CUXnxeNhJYe00A=;
 b=MslhL/JCqqF3VJJ0sFO9cjLBucLBGnaktW0xdAdcWAlNRUsRzEqKyI0fAe/kp+ZTVW
 FeLjb+y2DcslnWTGM6peKEGlvQx2eHLxI+0SkR11uVyc4uXw1xHSmJ+ydHlV9578X0pH
 iFx0DxJF43yIAh+qoAq7rjn4j0foeFR73nGc2OAeDQ7LK8kJnbO9l19VgGgz5GlC73J4
 YlkwHCJw1vZqH+h9hw2A4jfHehu59LNC2CzALwBlhI3rGskI0kVIrDskWjtNNRmREg4R
 rb8nEQGR216CsLw22uCuXoBxAJw+LHHL1RSteOGXYOrnJsNPjg0U+MIiepVmny2A9wax
 4yTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3iEYACqyF4jOdNUIXlWr4ULQGZwH5CUXnxeNhJYe00A=;
 b=VpUi759B1olxizyNqyouaXEKUlDqvr7vvh9v7F2sAjJmjdhwZJllE4kYELNM2vrbHx
 GriKdTETe00ZU7ZjBKktiY4K5Tf++e1ZljThX7MzNvlBacS8h1PF7ZXNcF7D+3pdUE21
 rFKobITLZIUTu6gRjrkyZ9dizhpfMbd1eOJRsFLCdXhmzlCM3Q8oMUjDIqd+Wk2K80kD
 lMVUBIbMaimZTj69Pf2ghRJD1wYeNa9uKnNaPgTo4rCVe5xeHj70b8uxrAKp1ypaRiId
 2/JZhoXLHJOx6G2pzf1Lt9rdaLSSO1b6jWnjWTuD8+rB0ieNMsERZUwOk75P58QBeZrE
 lLPQ==
X-Gm-Message-State: AO0yUKVQp0VATITCLOdWFWmTwok7SfJi5w10Yv31Mqv3Ae9XxgsZhPEO
 B40MMDAWmapN27/tjyV5F0Kois0h+YuLQvoMSUH+qQ==
X-Google-Smtp-Source: AK7set+HxVZs/tsy6wJQ74oHPovgXVnL4Z100uMXuLrCjH06Sb7DtVjFiJkw2dKcURV4imT8RTa7cQD+D5KwDeMu2ms=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr806157pjb.92.1676567837823; Thu, 16 Feb
 2023 09:17:17 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2302141541100.2025117@ubuntu-linux-20-04-desktop>
 <CAFEAcA96Mb5KAdPQrncqh9SM2iRc7aE2f4deoiF_2vChdMF0rw@mail.gmail.com>
 <878rgx3gwj.fsf@suse.de>
In-Reply-To: <878rgx3gwj.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 17:17:06 +0000
Message-ID: <CAFEAcA_xkShSjBj=L614S0mm_5FDWokr8-dxR_oBWHn8=9P65A@mail.gmail.com>
Subject: Re: [PULL v2 0/10] xenpvh
To: Fabiano Rosas <farosas@suse.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
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

On Thu, 16 Feb 2023 at 12:59, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 14 Feb 2023 at 23:43, Stefano Stabellini <sstabellini@kernel.or=
g> wrote:
> >>
> >> The following changes since commit 6a50f64ca01d0a7b97f14f069762bfd8816=
0f31e:
> >>
> >>   Merge tag 'pull-request-2023-02-14' of https://gitlab.com/thuth/qemu=
 into staging (2023-02-14 14:46:10 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://gitlab.com/sstabellini/qemu xenpvh2
> >>
> >> for you to fetch changes up to 86b01d58ca2840bea6e4e7260aad450a660fbd4=
6:
> >>
> >>   meson.build: enable xenpv machine build for ARM (2023-02-14 15:39:25=
 -0800)
> >>
> >> ----------------------------------------------------------------
> >
> > Fails to compile for some configs, eg:
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/3775820949
> > https://gitlab.com/qemu-project/qemu/-/jobs/3775820984
> >
> > In file included from ../target/arm/machine.c:6:
> > ../target/arm/internals.h:1141:21: error: field =E2=80=98f=E2=80=99 has=
 incomplete type
> > 1141 | CPUTLBEntryFull f;
> >
> >
> > This job fails in 'make check':
> > https://gitlab.com/qemu-project/qemu/-/jobs/3775821028
> >
> > qemu-system-aarch64: The -accel and "-machine accel=3D" options are inc=
ompatible
>
> Here the issue is that we have:
>
> mc->default_machine_opts =3D "accel=3Dxen";
>
> which conflicts with -accel qtest added by the tests.

I'm inclined to say that machines should not specify an
accelerator type. Leave that to the user, and produce an
error if it's not one that will work. (Note that 'qtest'
must work, because it's part of 'make check' testing that
every board can be created.)

thanks
-- PMM

