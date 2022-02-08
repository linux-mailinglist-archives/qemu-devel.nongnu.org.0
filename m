Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856724AD811
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:59:54 +0100 (CET)
Received: from localhost ([::1]:40592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPA1-0006FW-CU
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:59:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOYk-0001Ey-Bb
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:21:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOYg-0007Q5-NF
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644319278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ttGwaNQz4ZqEUSEUa/UHTpRxqehuJpz3K9+Xn5O9vmg=;
 b=GlPxVtSKeFXpIrZE9vgNtSZSxNRx1gyZlniOZOpFJn23WEz9+tXOBPTYc2UqHbtZeJG6E0
 2TcFnbYy0V9nqzqUBJY1QcXvLZ5zFTRcc6lii7MJil+8nsEj3cmAv1R+lvng1HrXd/L1l9
 24gc5SzQsvlnZTIhHSfxRTWX0jsRU24=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-rEIFEzFiOsuc5oBECBEdxg-1; Tue, 08 Feb 2022 06:21:16 -0500
X-MC-Unique: rEIFEzFiOsuc5oBECBEdxg-1
Received: by mail-yb1-f197.google.com with SMTP id
 u185-20020a2560c2000000b0060fd98540f7so34847093ybb.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:21:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ttGwaNQz4ZqEUSEUa/UHTpRxqehuJpz3K9+Xn5O9vmg=;
 b=LUcQgVZ5VSV7wtmNhM4wqd4pHjE+WjxKxKPjGcvGx2Xs/XE3ZDTzHmoTvPte29cmFZ
 vpfyNoJqWkygzifpfEnaUBGAKgI0ZZlKOyt5cTAldlbLDJ0vI41klHLN0ZhfgFGDZU1T
 p4Hp0TlJkBK9vEmZijvd/xikbZThu8Iig/3LKPYYJYCpxTyL7PIpLZABNZtWzbFm/S8C
 ShJnDj//A6qok0vvXZ83uCM8x+qrz4Fdzwg7jaDBC+8KyUFjrkh22Y5pU3k8MYaaep3H
 uUW7OlKfSqbx4NvvOTMoI3Ie5kkHuIKIQU2rjK0KR/aUB3GUI0H9uNuIFxqJbp2yb5qH
 g3lg==
X-Gm-Message-State: AOAM531AAWvd7PQobXRizigek47IJJGWBQHE69i2leFpHHb1GJQK13Zv
 trtcTA2E6fE6vLThe6vOA0GML2+xk606ttybXTmyu5Udk1Q5zdS8YckdrLfawcXXH1JXeLlz66o
 LkKwvKu1tzeWgY9EVLiz/8M6m707/zr4=
X-Received: by 2002:a25:4fd7:: with SMTP id d206mr4225956ybb.167.1644319276032; 
 Tue, 08 Feb 2022 03:21:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkdkWZ19nQw+Xav+6p5XPl1Lbs4y6ECdzp1YTEXjPIJbvwpoaoN4vQb4Sv7zd9pGaGRtPlkxluegDAFTsr8VE=
X-Received: by 2002:a25:4fd7:: with SMTP id d206mr4225948ybb.167.1644319275839; 
 Tue, 08 Feb 2022 03:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-25-pbonzini@redhat.com>
 <bc307f02-4d10-5136-dd05-d8257e25a52c@amsat.org>
In-Reply-To: <bc307f02-4d10-5136-dd05-d8257e25a52c@amsat.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 8 Feb 2022 13:21:04 +0200
Message-ID: <CAPMcbCrnK=Z4G2Cvc-3YyFEDQ7mMDtNfXZ83bdOK2JLdUJULoQ@mail.gmail.com>
Subject: Re: [PATCH 24/27] qga/vss-win32: require widl/midl, remove pre-built
 TLB file
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000558aff05d77feacd"
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

--000000000000558aff05d77feacd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Fri, Feb 4, 2022 at 7:20 AM Philippe Mathieu-Daud=C3=A9 via <
qemu-devel@nongnu.org> wrote:

> On 3/2/22 18:33, Paolo Bonzini wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > There are no good reason anymore to keep a pre-built file in the
> repository.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >   meson.build               |   4 ++++
> >   qga/meson.build           |   2 ++
> >   qga/vss-win32/meson.build |   9 +--------
> >   qga/vss-win32/qga-vss.tlb | Bin 1528 -> 0 bytes
> >   4 files changed, 7 insertions(+), 8 deletions(-)
> >   delete mode 100644 qga/vss-win32/qga-vss.tlb
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
>

--000000000000558aff05d77feacd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 4=
, 2022 at 7:20 AM Philippe Mathieu-Daud=C3=A9 via &lt;<a href=3D"mailto:qem=
u-devel@nongnu.org">qemu-devel@nongnu.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 3/2/22 18:33, Paolo Bonzini wro=
te:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; There are no good reason anymore to keep a pre-built file in the repos=
itory.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A04 ++++<br>
&gt;=C2=A0 =C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 ++<br>
&gt;=C2=A0 =C2=A0qga/vss-win32/meson.build |=C2=A0 =C2=A09 +--------<br>
&gt;=C2=A0 =C2=A0qga/vss-win32/qga-vss.tlb | Bin 1528 -&gt; 0 bytes<br>
&gt;=C2=A0 =C2=A04 files changed, 7 insertions(+), 8 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qga/vss-win32/qga-vss.tlb<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
<br>
</blockquote></div>

--000000000000558aff05d77feacd--


