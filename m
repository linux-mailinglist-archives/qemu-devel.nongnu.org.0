Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7B8330F19
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:27:21 +0100 (CET)
Received: from localhost ([::1]:46006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJFuq-0001h5-CO
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJFpU-00068X-RD
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:21:49 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJFpQ-0005MB-PG
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:21:48 -0500
Received: by mail-ed1-x533.google.com with SMTP id b13so14743418edx.1
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P2r3Oy3LBZjsBcKYoH4A0UPVkUO2nWlj2wqlHMM7Sko=;
 b=bTjwKdmkCWXuyBugHSCzpzObhZRo1MoazIAIy0pBLzonTAucGpow+0lPgFejG7zhiS
 ueAaI/ya79JyONN2Rk2sEGZVuiSnlsjLPfFuJ4QxcMESI8qZjQG9l5GVqDhqvhzoLNBc
 4nCQyVMcOZ820Frkd3wVU7+e2OfloW+2d7arrRnLRx5kQq5ijobGWr1thYMv4mFkqK6G
 2J2qTvaDTnY1dkJAdYuppwFakGxujsHwSPg2kK43FZ0rloTYZO8WBrrsYCdxtJSPdDqt
 VOroK762MuvJtpISvHVqELTpe7YM+HdXs8roXoTrBzf+0eo7/XL3hXE5m3wz+AczkwXF
 5iEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P2r3Oy3LBZjsBcKYoH4A0UPVkUO2nWlj2wqlHMM7Sko=;
 b=Fh6gfalKCpfrM6oxW7IKKOWlZgka7tD1nC0GUITnsxQnx1RQHvc2noOpDNnJh1314+
 r34OPrW4DvgxvBhNlLllsaRbYjo8Mi+ScGAHd22GSRTMwIhHRClqBNduCydfoLu0ph3E
 J3CfDJVRmfxXS7IedZPfZUmZmZCb7BKHusJPr5rtuF0CLh49QUAWGi/w4/fa276iO9e0
 4689Hut8Wu2Ovl+j8HxuUMukPzsXcUoq+fKI5coB/2a0U2Cx/x7aCC59l667Lv1SvMxF
 fb3ZS7uRbUVct48p887SqhFPFvheD/dALzRgjLoS2Kvyn9HkDS3A4xnNUq5kHqX047i5
 iASA==
X-Gm-Message-State: AOAM532Il7/KpveyLK2c4whh+xk2VdeDW+MLoQAqUhFHmC/TWsHxBYuE
 VTmbgv7XAMeXiZlen5bnxHFFwEHK0PDVKzQLM14=
X-Google-Smtp-Source: ABdhPJx06zfCTEefcAYdpQrI+WyNIvGjcWgpYXUHmJ2mY22qyUqOIRflyLO2LcaHDU3hKtpH95JIk6OhkRmyobGH978=
X-Received: by 2002:a50:fa42:: with SMTP id c2mr22450650edq.159.1615209702106; 
 Mon, 08 Mar 2021 05:21:42 -0800 (PST)
MIME-Version: 1.0
References: <E1lIzWX-0003qN-Me@lizzy.crudebyte.com> <2891210.4AG6acVJ2Y@silver>
 <CAMVc7JXb=eK2FgEx0SV7N-DL65EaMPKHM9rZnHCfu5KTPin48g@mail.gmail.com>
 <134602378.QJW5UkElOJ@silver>
In-Reply-To: <134602378.QJW5UkElOJ@silver>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Mon, 8 Mar 2021 22:21:31 +0900
Message-ID: <CAMVc7JWQ1FwXKgZ9grhMhV6qbS2w9+dx3eqxfJWBj9__kqZB5A@mail.gmail.com>
Subject: Re: [PATCH] ui/gtk: fix NULL pointer dereference
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=888=E6=97=A5(=E6=9C=88) 21:42 Christian Schoenebeck <q=
emu_oss@crudebyte.com>:
>
> Unfortunately Coverity's defects reports are not very verbose. In this ca=
se:
>
> *** CID 1448421:    (FORWARD_NULL)
> /qemu/ui/gtk.c: 570 in gd_switch()
> 564             surface_width(vc->gfx.ds) =3D=3D surface_width(surface) &=
&
> 565             surface_height(vc->gfx.ds) =3D=3D surface_height(surface)=
) {
> 566             resized =3D false;
> 567         }
> 568         vc->gfx.ds =3D surface;
> 569
> >>> CID 1448421:    (FORWARD_NULL)
> >>> Dereferencing null pointer "surface".
> 570         if (surface->format =3D=3D PIXMAN_x8r8g8b8) {
> 571             /*
> 572              * PIXMAN_x8r8g8b8 =3D=3D CAIRO_FORMAT_RGB24
> 573              *
> 574              * No need to convert, use surface directly.  Should be t=
he
> 575              * common case as this is qemu_default_pixelformat(32) to=
o.
>
> So no detailed path is outlined that may lead to the detected situation (=
i.e.
> no call stack or conditions like you would get e.g. with clang's static
> analyzer).

Hmm, Coverity should have decided the surface can somehow be NULL. I
hope it is false-positive...

>
> There are false positives sometimes, but they should be silenced in some =
way.
>
> So as you assume "surface" pointer should never be NULL, why did you remo=
ve
> the return statement in gd_switch() with c821a58ee7 then? Redundancy?
>
> diff --git a/ui/gtk.c b/ui/gtk.c
> index c32ee34edc..3edaf041de 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -567,10 +567,6 @@ static void gd_switch(DisplayChangeListener *dcl,
>      }
>      vc->gfx.ds =3D surface;
>
> -    if (!surface) {
> -        return;
> -    }
> -
>      if (surface->format =3D=3D PIXMAN_x8r8g8b8) {
>          /*
>           * PIXMAN_x8r8g8b8 =3D=3D CAIRO_FORMAT_RGB24
>
> I was reading your change as you wanted to reach the end of the function =
in
> case of surface =3D=3D NULL.
>
> Best regards,
> Christian Schoenebeck
>
>

Redundancy is one reason.

It is also intended to prevent people writing ui/console code from
assuming displays accept NULL as surface. In reality, some other
displays dereferenced surfaces without checking NULL even before this
change. The code checking if the surface is NULL is confusing when
reading the source code. In runtime, pointer dereferences following
the conditional should assert the pointer is not NULL and prevent code
which produces NULL from getting in.

Regards,
Akihiko Odaki

