Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B036B72ED
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 10:43:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbei2-0003xk-TS; Mon, 13 Mar 2023 05:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pbei0-0003xN-KJ
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:43:12 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pbehy-0007ha-Ok
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 05:43:12 -0400
Received: by mail-lf1-x136.google.com with SMTP id r27so14841686lfe.10
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678700587;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MlvW9roVhtWAuzR84ie3kfbvbxBlKbvRcbCAmGbkb5s=;
 b=JTVLajanzUjCUuhF7smJxmADkRt+m1OdvcAt5QJXVDdoA96dc1kp7zud1We8bJDO46
 hxguAuCdnRHnX9f76RvC3yeMG0YEM5tyf3ulPWbBAQwb1jnWhFvP0q3NPphX5SYG7SFc
 Fq19LeghEfs9Clt6Yu0I/8JU+6DW1SfUjQMlROCEeFIteK3H7iu33X0FzHQxs527HBQf
 ymQphGVbfJEZ9VKLSdGqif0Z7F/OkcuytP/la81iGq3kIYqEdTaZPktd+6JUnIujp0p0
 zkw4zGrpXXo7LsCyKs+BzHWVT2gG0XNuyhfjeIqm+4ZZJWFGtp7UOIJ5QdtaVFsh21/D
 DC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678700587;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MlvW9roVhtWAuzR84ie3kfbvbxBlKbvRcbCAmGbkb5s=;
 b=NaWxB9IxJjEZKb3Widyah85fsjQBXWvzDgM+horp6c8jsT4ZDPUoCUF+GiGmNxlccM
 JzHHfRbAbWJHTJjyKCqb40uNlx7OIVpDHBkIGKcAkZ8TpTIpd+hrNOufpmQAy+fD3zze
 YjjFOB1TF+6vIFdwARGgcUOcvMIrCzNHp3VAIkGSktreaYS7Y3Itrob/aVnn9T32aGN+
 3R2vCCtdWlEn68C4VxV2nUfugu8AV5oWbBPew01T0OY1oRERJT8OFVNfrHDQ7Y3IVTo3
 6VAiR3AJbTBQjjl1I43zANEjZ4UJ8LXKlO4pQQOHBwtqxhjBhvTlEMayTbHyMOiXdj9S
 mARg==
X-Gm-Message-State: AO0yUKURYqAref0ZPakGEQg93rdv281VoSLcqJAjSOzN6yhEobe454CI
 odjN+25eULmf4EUDKiGhda/HWAPUityUsXYMOkw=
X-Google-Smtp-Source: AK7set9E/D2O1IM4fxMptTICzkuYM0RlIWmxEgYgCgP3PpgRvyHRXoJ5fYGwQch9tKUgTkSFYqRRyf3bS78u75Ag5Yk=
X-Received: by 2002:ac2:4884:0:b0:4db:4604:6328 with SMTP id
 x4-20020ac24884000000b004db46046328mr10122194lfc.11.1678700587113; Mon, 13
 Mar 2023 02:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
 <20230307115637.2464377-16-marcandre.lureau@redhat.com>
 <ZAsANUeVUbLehjPQ@redhat.com>
In-Reply-To: <ZAsANUeVUbLehjPQ@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 13 Mar 2023 13:42:55 +0400
Message-ID: <CAJ+F1CKK4wwixaFQFbGDAzhthazP3yAXRsyp2XcfPi+U9ASsOw@mail.gmail.com>
Subject: Re: [PATCH v2 15/18] ui/sdl: try to instantiate the matching opengl
 renderer
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
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

Hi

On Fri, Mar 10, 2023 at 2:03=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Tue, Mar 07, 2023 at 03:56:34PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > User can still bypass the QEMU choice with SDL_RENDER_DRIVER environmen=
t
> > variable. (for some reason, specifying a driver disables batching and
> > breaks rendering, so enable it explicitly)
>
> What problem is this change actually fixing ?  Can you explain here.

Simply that -display sdl,gl=3Des didn't actually use OpenGL ES without this=
.

Using OpenGL ES allows to use ANGLE, which works generally better than
Windows/OEM OpenGL.

>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  ui/sdl2.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/ui/sdl2.c b/ui/sdl2.c
> > index 592eca3e1c..e83ea53628 100644
> > --- a/ui/sdl2.c
> > +++ b/ui/sdl2.c
> > @@ -99,7 +99,18 @@ void sdl2_window_create(struct sdl2_console *scon)
> >                                           surface_width(scon->surface),
> >                                           surface_height(scon->surface)=
,
> >                                           flags);
> > +    if (scon->opengl) {
> > +        const char *driver =3D "opengl";
> > +
> > +        if (scon->opts->gl =3D=3D DISPLAYGL_MODE_ES) {
> > +            driver =3D "opengles2";
> > +        }
> > +
> > +        SDL_SetHint(SDL_HINT_RENDER_DRIVER, driver);
> > +        SDL_SetHint(SDL_HINT_RENDER_BATCHING, "1");
> > +    }
> >      scon->real_renderer =3D SDL_CreateRenderer(scon->real_window, -1, =
0);
> > +
> >      if (scon->opengl) {
> >          scon->winctx =3D SDL_GL_CreateContext(scon->real_window);
> >      }
> > --
> > 2.39.2
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>
>


--=20
Marc-Andr=C3=A9 Lureau

