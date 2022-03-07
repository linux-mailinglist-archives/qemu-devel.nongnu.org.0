Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F684CFD30
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:40:41 +0100 (CET)
Received: from localhost ([::1]:48716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBjE-00039x-NU
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:40:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nRAT7-00077x-SE
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:19:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nRAT6-0005LE-3k
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646648394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UdqlJIQZWTPSPAQkFZKmUuEAz9DfQIJ1RJ58xtykh90=;
 b=AbtyIwDROgdj82woZUCAFu2Zb9V/QmJ5JN7t6XW+eVTu0Co0wYBGy/Cb7Ey97zwRhtQvjL
 uRMN2iJB8xbwhSmSTI4P0EPTj01A9B6QJTdLA9UajaUBiSdZ+vTOTGB2n8334+QHH9RY/W
 /0zMmqKRuFZVh2QawG/V19tjfFXCz0U=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-5OmN1GfFN1S25X26nReU0A-1; Mon, 07 Mar 2022 05:19:52 -0500
X-MC-Unique: 5OmN1GfFN1S25X26nReU0A-1
Received: by mail-yb1-f199.google.com with SMTP id
 p69-20020a257448000000b006295d07115bso693840ybc.14
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UdqlJIQZWTPSPAQkFZKmUuEAz9DfQIJ1RJ58xtykh90=;
 b=aa29WsskkDy26z5kZKOjGkUn7NLk/MGuq+01usGxpcb+kdeHa3wOxwyRA+wJojN6bi
 pu+5KC9pV9fRUXOIVOqBHGzXP2N+Gu6TZzOQZp3mqEO8kr+W0xT/WujV7Nc7PXFF+B1J
 wGa+/zE5eX867tGppl6qmlxVlEImQHOq8dA6b4CxdStpi/zc6Ns5HCaUiJBUtsk1hEx2
 gGWhwC7OWvssmApIYN4EKVUS7BiF8sqFFtBw25MKx32zFvf0U16iKxQLRRfia59P5J12
 gpxFw40jVWE8wSR7Ufdkb9c56o3zsBSp5tZZOmlH8JXezL+yLupnpqJxixxf3nE4Tjks
 kcgg==
X-Gm-Message-State: AOAM531yF6L8LYYmpPuMGQVDsDrpt4jDqSQ8zu19wfahJxRxi3vcLiKW
 WdKBeKCISxzwus1cr09UU+NEs3rQSVFjyJ0PrdW6EhuXEmxU02+IdPrEM30DZn0SIHyWV7Rnf8w
 ZFFt7JP6JXmZe7BnrFACg+sdC9sMGAEQ=
X-Received: by 2002:a25:af92:0:b0:628:b791:281b with SMTP id
 g18-20020a25af92000000b00628b791281bmr7218811ybh.87.1646648392271; 
 Mon, 07 Mar 2022 02:19:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxWj9Bxif4jUhH1jrzXzZD9eDKvzbgHcR0CmPkfnBQMJqdyFs8twxtuPaowhea6lSWbRNmrAO5K6H1LeK5InQ=
X-Received: by 2002:a25:af92:0:b0:628:b791:281b with SMTP id
 g18-20020a25af92000000b00628b791281bmr7218804ybh.87.1646648392102; Mon, 07
 Mar 2022 02:19:52 -0800 (PST)
MIME-Version: 1.0
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
 <20220307074632.238049-13-marcandre.lureau@redhat.com>
 <c80fde18-bb3e-e780-356c-f935e7390e4d@gmail.com>
In-Reply-To: <c80fde18-bb3e-e780-356c-f935e7390e4d@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 7 Mar 2022 14:19:41 +0400
Message-ID: <CAMxuvaw_QT4wEGLZRNJEd1m-58JV-8AOc6CHKkMw4i_yrVNgew@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Akihiko

On Mon, Mar 7, 2022 at 12:09 PM Akihiko Odaki <akihiko.odaki@gmail.com> wro=
te:
>
> On 2022/03/07 16:46, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > egl-headless depends on the backing surface to be set before texture ar=
e
> > set and updated. Display it (update=3Dtrue) iff the current scanout kin=
d
> > is SURFACE.
>
> egl-headless does not dynamically call register_displaychangelistener
> and has console associated (console_select would not affect egl-headless
> itself) so this should not be necessary.

Could you help me understand, what should not be necessary?

> The remaining problem with egl-headless is that egl-headless renders the
> image to DisplaySurface, and a non-OpenGL display (namely vnc) has to
> consume it instead of texture even when con->scanout.kind is
> SCANOUT_TEXTURE or SCANOUT_DMABUF.

This is already happening, because egl-headless calls dpy_gfx_update().

thanks

> Regards,
> Akihiko Odaki
>
> >
> > Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   ui/console.c | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/ui/console.c b/ui/console.c
> > index 5bfecea4549e..16a0b0909ba2 100644
> > --- a/ui/console.c
> > +++ b/ui/console.c
> > @@ -1112,6 +1112,10 @@ static void displaychangelistener_display_consol=
e(DisplayChangeListener *dcl,
> >           return;
> >       }
> >
> > +    dpy_gfx_create_texture(con, con->surface);
> > +    displaychangelistener_gfx_switch(dcl, con->surface,
> > +                                     con->scanout.kind =3D=3D SCANOUT_=
SURFACE);
> > +
> >       if (con->scanout.kind =3D=3D SCANOUT_DMABUF &&
> >           displaychangelistener_has_dmabuf(dcl)) {
> >           dcl->ops->dpy_gl_scanout_dmabuf(dcl, con->scanout.dmabuf);
> > @@ -1126,9 +1130,6 @@ static void displaychangelistener_display_console=
(DisplayChangeListener *dcl,
> >                                            con->scanout.texture.y,
> >                                            con->scanout.texture.width,
> >                                            con->scanout.texture.height)=
;
> > -    } else if (con->scanout.kind =3D=3D SCANOUT_SURFACE) {
> > -        dpy_gfx_create_texture(con, con->surface);
> > -        displaychangelistener_gfx_switch(dcl, con->surface, TRUE);
> >       }
> >   }
> >
>


