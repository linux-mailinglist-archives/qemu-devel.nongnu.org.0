Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D0F4CFF94
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:07:03 +0100 (CET)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRD4o-0004Z9-Ck
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:07:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nRCXk-00005Y-F9
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:32:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nRCXi-0002hx-7e
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646656368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xqjkdbMKVPcYlJaHbNGJAvWUBqbtSv+16JJSf42f30Q=;
 b=XyIBYZpzz/6nFhpBYjZuNjIKizFRBkkUqXOFscPZw7PlyCFioteOzlb4B6r29iUkU2jOSL
 zGWNGvvnFefoGBUdEe8DfTXkL3Q90XIYc7dZuNk+RCr4uFy9XsXO6lAxAQiJHwUryA9AFY
 l4JhDgg1ILYU4pEhJx8vNmcHk5h4jbk=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-lMMPFkocPf-MVPYHjvwp6w-1; Mon, 07 Mar 2022 07:32:47 -0500
X-MC-Unique: lMMPFkocPf-MVPYHjvwp6w-1
Received: by mail-yb1-f199.google.com with SMTP id
 h8-20020a25e208000000b00628c0565607so10805458ybe.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 04:32:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xqjkdbMKVPcYlJaHbNGJAvWUBqbtSv+16JJSf42f30Q=;
 b=O8Aaalesq/06e+PTjEinuO8nXFbb97aF94g08vWBKpdNxCUpCIBB79CyNPUdMY2hYL
 OJbDhujSG/Uo8AhhVSEqypEYxVDYrVZcaaL9p3OvVCxeOOvLD4YbXWPeWFQ+xbqcX4rQ
 8eUZXNLgsQopRyiUfaigoeBIQgAjhTC/D985EtEcmTQrXpd7SglM29vWK28X3jhFI2T5
 Kpoc2SxRZwSO2kc+qEkzyLe5R/Ful/khcIaUSmzpe51mdC0NvPKgw/NJ02WhVSxnYT8I
 B8gDTVm6NbpBDOJpg9bn5FTlswyXxr0SrrXni9Gf7fdOO62TGYEsz56S7Hnq3Bd2JcIr
 Kczw==
X-Gm-Message-State: AOAM533CcyB8nxPYV7Op8hqq38JsBy6+2g9ssYp8uXGxZVNKTwRGjx3M
 1urIMEOkoYT8rr5bUUN0elT96htdmMiwgVpxqFnWWyiSxN0gvjJls87U84GslvxMzUfc66EvgmY
 409gUQtFdg2XJm3W53OpRZJ3A/avtwO8=
X-Received: by 2002:a25:d714:0:b0:628:dc7b:cf9 with SMTP id
 o20-20020a25d714000000b00628dc7b0cf9mr7699250ybg.77.1646656366990; 
 Mon, 07 Mar 2022 04:32:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGhaAdzICMTxo1fVV6lun5plEjBr+j3l6AN7ERUwX9fP7acZEJGf1ymIA2seP1CSe7ps20ue3mZQIrwpZrMik=
X-Received: by 2002:a25:d714:0:b0:628:dc7b:cf9 with SMTP id
 o20-20020a25d714000000b00628dc7b0cf9mr7699214ybg.77.1646656366455; Mon, 07
 Mar 2022 04:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
 <20220307074632.238049-13-marcandre.lureau@redhat.com>
 <c80fde18-bb3e-e780-356c-f935e7390e4d@gmail.com>
 <CAMxuvaw_QT4wEGLZRNJEd1m-58JV-8AOc6CHKkMw4i_yrVNgew@mail.gmail.com>
 <28ef9b06-3225-112f-b664-176e67c824d9@gmail.com>
 <CAMxuvaz3+ySgiOxawVT=P7x4ikDcap0o5Ux78_HdewL0XXa5Kg@mail.gmail.com>
 <d7df9ba7-40db-7b2a-63d7-eacf811da4f2@gmail.com>
In-Reply-To: <d7df9ba7-40db-7b2a-63d7-eacf811da4f2@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 7 Mar 2022 16:32:35 +0400
Message-ID: <CAMxuvaxU56M9AvS9XfZWVBNYSORBTqWmZf3yteK8KfVcdh9Ltw@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
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

Hi

On Mon, Mar 7, 2022 at 4:24 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrot=
e:
>
> On 2022/03/07 20:50, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Mon, Mar 7, 2022 at 2:35 PM Akihiko Odaki <akihiko.odaki@gmail.com> =
wrote:
> >>
> >> On 2022/03/07 19:19, Marc-Andr=C3=A9 Lureau wrote:
> >>> Hi Akihiko
> >>>
> >>> On Mon, Mar 7, 2022 at 12:09 PM Akihiko Odaki <akihiko.odaki@gmail.co=
m> wrote:
> >>>>
> >>>> On 2022/03/07 16:46, marcandre.lureau@redhat.com wrote:
> >>>>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>>>>
> >>>>> egl-headless depends on the backing surface to be set before textur=
e are
> >>>>> set and updated. Display it (update=3Dtrue) iff the current scanout=
 kind
> >>>>> is SURFACE.
> >>>>
> >>>> egl-headless does not dynamically call register_displaychangelistene=
r
> >>>> and has console associated (console_select would not affect egl-head=
less
> >>>> itself) so this should not be necessary.
> >>>
> >>> Could you help me understand, what should not be necessary?
> >>
> >> I read the description as it sets the backing surface for egl-headless
> >> when register_displaychangelistener or console_select is called. The
> >> change is not necessary.
> >
> > Without it, gfx_switch is not called to set the new surface. Switching
> > console with VNC would fail (via ctrl+alt+num).
>
> Yes, but that is not because egl-headless requires its dpy_gfx_switch to
> be called. It is because vnc does not receive the surface. The patch
> adds a call of dpy_gfx_switch no matter if the receiver is an OpenGL
> display or not, but an OpenGL display would not need one.

That's why I added the "update" argument to
displaychangelistener_gfx_switch(). "gfx_switch" merely indicates that
the DisplaySurface has changed, not to show it.

> >
> >>
> >>>
> >>>> The remaining problem with egl-headless is that egl-headless renders=
 the
> >>>> image to DisplaySurface, and a non-OpenGL display (namely vnc) has t=
o
> >>>> consume it instead of texture even when con->scanout.kind is
> >>>> SCANOUT_TEXTURE or SCANOUT_DMABUF.
> >>>
> >>> This is already happening, because egl-headless calls dpy_gfx_update(=
).
> >>
> >> It is not called when register_displaychangelistener or console_select
> >> is called by non-OpenGL display consuming the DisplaySurface.
> >
> > When displaychangelistener_display_console() is called with
> > con->scanount.kind =3D=3D SCANOUT_SURFACE, it calls gfx_update(update =
=3D=3D
> > TRUE), and thus calls gfx_update on the whole surface.
> >
>
> con->scanout.kind is SCANOUT_TEXTURE or SCANOUT_DMABUF when egl-headless
> is rendering to surface. It would not call gfx_update in the case.

 GL updates go through egl_scanout_flush (dpy_gl_update callback),
which calls dpy_gfx_update() which is in turned handled by
vnc_dpy_update().

Could you provide a failing test case or a more concrete suggestion on
what to do instead? I am all ears :)

thanks


