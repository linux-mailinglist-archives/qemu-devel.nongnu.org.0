Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8467483E28
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:33:52 +0100 (CET)
Received: from localhost ([::1]:44072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fGR-0003Cf-St
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:33:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1n4ez6-0000im-KT
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 03:15:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1n4ez3-0006QX-Tf
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 03:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641284152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J95tD+YJaBpMCcYBoG5Iri4tcBEx4v0+5HDRU0odSzU=;
 b=Xm/TAgdmZaYyMypmUrhrWCQhclcoTHolN9HEfoUDBung3dX1XQrOOfQS2ucuU8YgzGjqRw
 lzAA2SCURWwGTWULCtSB3Zux2/HnZfZ1SA4Fqnm1E33nxI19Wmn5hdiIHFGI6fBw1GcKMh
 iy6pYyGhku0CvE17JXIOtGc32LutFvQ=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-y0mAoQyCOGGPHdzQpVfivg-1; Tue, 04 Jan 2022 03:15:51 -0500
X-MC-Unique: y0mAoQyCOGGPHdzQpVfivg-1
Received: by mail-pf1-f199.google.com with SMTP id
 i3-20020a628703000000b004ba462357d6so18067108pfe.23
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 00:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=J95tD+YJaBpMCcYBoG5Iri4tcBEx4v0+5HDRU0odSzU=;
 b=yS3Rp8CC5+4jAAxHbWzccjp6PzhZVAnTQksiLADjM70HLAnx/6rF/Uph2iu+L7R/1S
 kLgfGLzRb1vCPaJRy0weoTi6c7b8m172KzR/WoLOQoMP6X6cEDlSn21qRh0QX4CfgX/2
 iLrnx+++OjfiATShaEHPP4MSOVwK8gR/h/bniF11wX29wvARHtB1Z4rdGh98emSbk3/F
 z0EckW5YEp3Mm1PhOKlWZxNsZ3VkyAwd7Xj1tw8OyD7g6Fa5GHfbHpx8kS9AB+8bG41R
 7GlKqwLmvK9OWaSdXjUsfH4j3ThzLIyNa0SKmW+5C73VeQkE0yZxJJcTuRmHkahFc2Lw
 1R/g==
X-Gm-Message-State: AOAM5332xFHBHfJLKbP4IQhlwphN9rcp83Ba9byrzxT3Gd57w8b44t7U
 Zkjz1/CZSJHm2pXCzu7OyW9g7QCI+Rweg/qYlv2XFLvjFXdaWOI7rIi8ZsCkDl/p+KpM48TQMOF
 Sul4zPXE5wxyKlE53J+DXQIOUowonwK8=
X-Received: by 2002:a17:90a:3f09:: with SMTP id
 l9mr13099507pjc.36.1641284150287; 
 Tue, 04 Jan 2022 00:15:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyDXgGN1f16cQIrjn7f7SZGg3lWKrWxppHPC1oAHtS8aiS93V3hk2twYu3KfvvvW0U8DzgZXrJHdpxadwprJ4=
X-Received: by 2002:a17:90a:3f09:: with SMTP id
 l9mr13099490pjc.36.1641284150050; 
 Tue, 04 Jan 2022 00:15:50 -0800 (PST)
MIME-Version: 1.0
References: <20220104074649.1712440-1-marcandre.lureau@redhat.com>
 <9ace664b-2396-a338-c59f-35cdbdbde3e3@redhat.com>
In-Reply-To: <9ace664b-2396-a338-c59f-35cdbdbde3e3@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 4 Jan 2022 12:15:39 +0400
Message-ID: <CAMxuvayE-jJ5sdfv_a1oR5X+pK3iGAy3w7Ti8LQ5YB7ZSTEvyg@mail.gmail.com>
Subject: Re: [PATCH] docs/sphinx: fix compatibility with sphinx < 1.8
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas

On Tue, Jan 4, 2022 at 12:11 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 04/01/2022 08.46, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > SphinxDirective was added with sphinx 1.8 (2018-09-13).
> >
> > Reported-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   docs/sphinx/fakedbusdoc.py | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/docs/sphinx/fakedbusdoc.py b/docs/sphinx/fakedbusdoc.py
> > index a680b257547f..d2c507904654 100644
> > --- a/docs/sphinx/fakedbusdoc.py
> > +++ b/docs/sphinx/fakedbusdoc.py
> > @@ -7,12 +7,12 @@
> >   # Author: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >   """dbus-doc is a Sphinx extension that provides documentation from D-=
Bus XML."""
> >
> > +from docutils.parsers.rst import Directive
> >   from sphinx.application import Sphinx
> > -from sphinx.util.docutils import SphinxDirective
> >   from typing import Any, Dict
> >
> >
> > -class FakeDBusDocDirective(SphinxDirective):
> > +class FakeDBusDocDirective(Directive):
> >       has_content =3D True
> >       required_arguments =3D 1
>
> Thanks, that fixes my issue, indeed!
>
> Tested-by: Thomas Huth <thuth@redhat.com>
>
> I wonder whether we could turn such sphinx warnings during the configure
> phase into a hard failure so that such bugs would fail in the CI instead =
of
> getting merge without notice...?
>

I don't think there is a way to set the max sphinx version (an
argument such as --max-version=3D1.7.9)

The only way I can think of is to cover building with that version in
the CI, as long as it is supported.

thanks


