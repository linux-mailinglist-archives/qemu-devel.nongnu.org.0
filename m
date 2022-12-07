Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F3A645E31
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 16:57:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2wmI-0008Rm-VW; Wed, 07 Dec 2022 10:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p2wmG-0008QW-Ns
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:56:08 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p2wmD-0000yY-CW
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:56:08 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3c21d6e2f3aso190342567b3.10
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 07:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IjY2hxIwoGm3ylw9ZIfcF1p1ReAmjeFmHZ6Wr5Pcio=;
 b=Mh8gK58lSvBWSryK0iRz0pPVA+Me6XiWTBEzc1WZarHIFjXEHGpCHLLY30aqSr4iJV
 pR+/iXH9WJPITVZX7aMiS8okYkbM0ErvtkvgOPvVhry7XebfBHWBgQFcbHRNXrWBJCPD
 OYO9Bp10Y5djgrrdzlBzD0U3EPS400Xxcqxc4fA4UHPSrq09qveKDC5Ik+SNvF7NxZ+0
 nTp1CeIa2vl+nkCziCUdK8t+OhFrL/eOLeFIvvJ0xHLv56zfY05jeqMxrnThuTOvBUND
 D0xy24UUnbsG9bbBanJbqAQl6pY0VU8UkpjAHOfeD3uj3MGa1v+hSLxI478EXIhCzw1N
 xvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9IjY2hxIwoGm3ylw9ZIfcF1p1ReAmjeFmHZ6Wr5Pcio=;
 b=lyd07XDLXHCHzehqqSrfYYGVYSPBCPke3BLdA2+qC5s2CxN2rn5KZle5mguHfyAjnL
 AJK9ginu5fDkGGRUZ+tcUAjNhXTeRN2duzkHY1FUi6ABjTMYbkbWGIN3eLPqNkt98k81
 qFi/WHp6aCx9BswhtG7bEgPXBXCfsCphlyjy5KO+6nYPCpGQgsltsOqRTXKePVf9kaZm
 j8pDUBkDN7Yd2XYSRqnGpkHlxHZl2UTYd5hcbxoInOAF/8s0dFzugFaIqqCEkw/5NHEZ
 QUInq5etukRoAg6rtpEFgI7ydle8+0eVezHVT+IT0sfGyUttnl8WRy88OwOAoZPpIU2u
 dFlg==
X-Gm-Message-State: ANoB5pnaCE7pSZp4uHzS0jLrFSubE8asZnx2yXRkkKd5eZjhm3aHeZao
 i1ciUD+ToTIda5Z4r+0GigGHeWigqXn2e7sMYi4=
X-Google-Smtp-Source: AA0mqf7HuF5cKQlSs3oDuuiN4FNgLHrQ696A81GW0xK/+yjrDbtoQZPuUtUPYPM4+pMqNrMU2ivWsfsykeDgy1xwqHE=
X-Received: by 2002:a0d:cc4a:0:b0:3bc:183c:f1eb with SMTP id
 o71-20020a0dcc4a000000b003bc183cf1ebmr54455493ywd.156.1670428563712; Wed, 07
 Dec 2022 07:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
 <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
 <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
In-Reply-To: <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 7 Dec 2022 10:55:52 -0500
Message-ID: <CAJSP0QXKf5X0FijR64_0JWUBcnpNm-Jk58bfCk=966dZmj7NOw@mail.gmail.com>
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
To: eric.auger@redhat.com
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com, 
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org, 
 peter.maydell@linaro.org, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, 7 Dec 2022 at 09:34, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Stefan,
>
> On 12/7/22 15:09, Stefan Hajnoczi wrote:
> > On Wed, 7 Dec 2022 at 08:31, Eric Auger <eric.auger@redhat.com> wrote:
> >> On 12/7/22 14:24, Eric Auger wrote:
> >>> Initialize r0-3 to avoid compilation errors when
> >>> -Werror=3Dmaybe-uninitialized is used
> >>>
> >>> ../target/i386/ops_sse.h: In function =E2=80=98helper_vpermdq_ymm=E2=
=80=99:
> >>> ../target/i386/ops_sse.h:2495:13: error: =E2=80=98r3=E2=80=99 may be =
used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >>>  2495 |     d->Q(3) =3D r3;
> >>>       |     ~~~~~~~~^~~~
> >>> ../target/i386/ops_sse.h:2494:13: error: =E2=80=98r2=E2=80=99 may be =
used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >>>  2494 |     d->Q(2) =3D r2;
> >>>       |     ~~~~~~~~^~~~
> >>> ../target/i386/ops_sse.h:2493:13: error: =E2=80=98r1=E2=80=99 may be =
used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >>>  2493 |     d->Q(1) =3D r1;
> >>>       |     ~~~~~~~~^~~~
> >>> ../target/i386/ops_sse.h:2492:13: error: =E2=80=98r0=E2=80=99 may be =
used uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >>>  2492 |     d->Q(0) =3D r0;
> >>>       |     ~~~~~~~~^~~~
> >>>
> >>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
> >>>
> >>> ---
> >>>
> >>> Am I the only one getting this? Or anything wrong in my setup.
> >> With Stefan's correct address. Forgive me for the noise.
> > When is -Wmaybe-uninitialized used? QEMU's build system doesn't set
> > it. Unless it's automatically set by meson this must be a manual
> > --extra-cflags=3D option you set.
>
> I am using this configure cmd line:
>
> ./configure --prefix=3D/usr --sysconfdir=3D/etc --libexecdir=3D/usr/lib/q=
emu
> --target-list=3Dx86_64-softmmu --docdir=3D/usr/share/doc/qemu --enable-kv=
m
> --extra-cflags=3D-O --enable-trace-backends=3Dlog --python=3D/usr/bin/pyt=
hon3
> --extra-cflags=3D-Wall --extra-cflags=3D-Wundef
> --extra-cflags=3D-Wwrite-strings --extra-cflags=3D-Wmissing-prototypes
> --extra-cflags=3D-fno-strict-aliasing --extra-cflags=3D-fno-common
> --extra-cflags=3D-Werror=3Dtype-limits
> >
> > If you added it manually then let's fix this in 8.0 since it's not
> > tested/supported and very few people will see this issue.

Did you create the ./configure command-line manually? Do you think
other people will hit this?

Stefan

