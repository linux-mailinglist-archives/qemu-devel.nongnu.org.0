Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B124AD7F4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:54:21 +0100 (CET)
Received: from localhost ([::1]:33324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHP4d-0000ry-Dm
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:54:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOaf-0003RW-U9
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:23:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOad-0007h1-TC
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:23:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644319399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jeM1FAkVwCzZnkk8jU6dtVUgvze66BoE1QpnLhBKDcY=;
 b=LDu79chl5dGbE/UFJIUgKgkrk0EXg2lLcaedOWF9AWsVjqgzvnutYYLq2doQTs809w8y3m
 bu+N/hMIopPN42QtDBcEPtdZunGxonDSeI0UYG+1tIuvGFm5D6wssSyUvFYJQo/X2GBVNt
 0zIsgXTjrt6pXITL8Aqvip/IiSPxVxo=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-nejIZ8rzNUK4znFNq__wDQ-1; Tue, 08 Feb 2022 06:23:17 -0500
X-MC-Unique: nejIZ8rzNUK4znFNq__wDQ-1
Received: by mail-yb1-f200.google.com with SMTP id
 x1-20020a25a001000000b0061c64ee0196so25266119ybh.9
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jeM1FAkVwCzZnkk8jU6dtVUgvze66BoE1QpnLhBKDcY=;
 b=uedru0kghpjaxZiHvp0xDcrM7l8yFtCQaYQcma1+dEdFXQXtahDkmgiGYkQMKOPCti
 AA7ak3Hz3IjDd3ipU00KcMpbYengvZau5tWfPIejoySYBoQZxtAG0sI680AMWr1JxQVM
 MA7Uek09OTw/SuZaxrZ3/ZmgMDdX5y/p+U355CSk0upTkquOv0qvPKV3o7kjHHqhsn+1
 9VDDLYYldbFRzmZftYC6knrCjMqVA/z9KUy9SKX2eYcxg38fe9i/zFXtjBf5/qZp6vSg
 8E+CZVr1WvBnsJQkS+CXBYjxIHOTx0+WqjZYUAHqMkRa1tk1mcgBFYR1GfeN1dQR22Yw
 Cmaw==
X-Gm-Message-State: AOAM533AX9lqUjShXTsi3wcDHPdIwdN+XiATxAM+n6cnQ/IGPHuq3z/Z
 C/ElCFnNu+Ga/8xWEN/bVFdqI8e9kWEOPygD/OBPV2w/oY3vLx9TNyBG5WMalbqc+wHkrqtp3V/
 gafbONQ9gXaSQVVbTMm1y43p1HyeRTlQ=
X-Received: by 2002:a81:b148:: with SMTP id p69mr4327008ywh.402.1644319397259; 
 Tue, 08 Feb 2022 03:23:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjk0JkyysNTkJz01gCYk9X7GfaNHB3eLgUIGPlCZs9RJQA43O/E3L3SVuVnGDu+Q09cOeU1mdiYu2NOdLgV60=
X-Received: by 2002:a81:b148:: with SMTP id p69mr4326937ywh.402.1644319395870; 
 Tue, 08 Feb 2022 03:23:15 -0800 (PST)
MIME-Version: 1.0
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-26-pbonzini@redhat.com>
 <6358e5ce-9f4a-740b-2051-c4f8078d13fe@amsat.org>
In-Reply-To: <6358e5ce-9f4a-740b-2051-c4f8078d13fe@amsat.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 8 Feb 2022 13:23:04 +0200
Message-ID: <CAPMcbCoMRBTeiOJEkthUa5ZVbszgDqrdUNdBQJHAE+8YMsjjYA@mail.gmail.com>
Subject: Re: [PATCH 25/27] meson: require dynamic linking for VSS support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007d12c005d77ff15b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007d12c005d77ff15b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Fri, Feb 4, 2022 at 7:23 AM Philippe Mathieu-Daud=C3=A9 via <
qemu-devel@nongnu.org> wrote:

> On 3/2/22 18:33, Paolo Bonzini wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The glib_dynamic detection does not work because the dependency is
> > overridden in the main meson.build.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > [Rewritten commit message, added requirement in qga/meson.build - Paolo=
]
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >   qga/meson.build           | 2 ++
> >   qga/vss-win32/meson.build | 4 ++--
> >   2 files changed, 4 insertions(+), 2 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
>

--0000000000007d12c005d77ff15b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 4=
, 2022 at 7:23 AM Philippe Mathieu-Daud=C3=A9 via &lt;<a href=3D"mailto:qem=
u-devel@nongnu.org">qemu-devel@nongnu.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 3/2/22 18:33, Paolo Bonzini wro=
te:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; The glib_dynamic detection does not work because the dependency is<br>
&gt; overridden in the main meson.build.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; [Rewritten commit message, added requirement in qga/meson.build - Paol=
o]<br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
2 ++<br>
&gt;=C2=A0 =C2=A0qga/vss-win32/meson.build | 4 ++--<br>
&gt;=C2=A0 =C2=A02 files changed, 4 insertions(+), 2 deletions(-)<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
<br>
</blockquote></div>

--0000000000007d12c005d77ff15b--


