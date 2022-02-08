Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0514AD82A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 13:09:45 +0100 (CET)
Received: from localhost ([::1]:49462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHPJY-0004kV-39
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 07:09:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOZT-0002Dy-Rc
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:22:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nHOZR-0007bK-KP
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644319325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4VPszrEwkecWwYGILyOblxO+nW724B7yliy1mRFbr8A=;
 b=B7nnwgSk17CDnxeRm6ciRLC0jdsw/y+W6PW+itYWJNZJTvz+MEBDntE0zLdJ6/g5nT1On6
 69MHE59+8bn18psEZb9KxHmqRhtIEmsJktn9Exvg2dWeSBNI4DSp/nvZ1tjpKEOHGiCevn
 wA2m1dAwzmfSQXoYjnuPTqCV2TklI/4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-CN8ldCzQPjS_ZaHk7kDnlg-1; Tue, 08 Feb 2022 06:22:03 -0500
X-MC-Unique: CN8ldCzQPjS_ZaHk7kDnlg-1
Received: by mail-yb1-f197.google.com with SMTP id
 f18-20020a5b0d52000000b0061dc514a6f2so9983039ybr.22
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:22:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4VPszrEwkecWwYGILyOblxO+nW724B7yliy1mRFbr8A=;
 b=Yvc9aLxTdz/u3gZuOV0y2mU+QkTeGyG3j/OMInlI1K32tO+cM9z+9eCfeZ8rBdxUMd
 GQYwh0iyEI79uTeiDnqDPosz0Tpl2NuGQXRXTDLucnonnfhss0dyxIixnGLNrByAHggg
 hGO9/I2GP5CKXcDDjp7CYKCUnp22ER+QvJDrPaFCoNLeaWK4AU0yb9J/LeqI1HdtJZqn
 +gJ58MQhvSMcmJITaz0Rrj30TDyiYd3O6qZ35/DazBjLyt9kSdUPLL8m/rDBWlheGKqd
 SsRDxFOMaSKEo60JL2u529HpH2drTkA8xGX1VLVbFZfQz/Nhzak3uRSdyXtJppL6ljOY
 htbg==
X-Gm-Message-State: AOAM532X8IqacIfVLxgr2NoexNNnh/FLYJAj5QebYR20gMlVUlna1res
 Z59wnQwX9MhBODIV7nrDHUZucSDMLaPimPmsqju8M4zZTNnl+GnFaEyg+PYoKGPcUUa4lhlBAtA
 I7o+46d6VHg39lHywl782q7I6Uj5LM5g=
X-Received: by 2002:a25:3b57:: with SMTP id i84mr3955065yba.565.1644319323098; 
 Tue, 08 Feb 2022 03:22:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyplk7QPAIElKAR3e669ptk9tgKvPt6qwobi+LwaArQba4Mtp8f5pNl5Mkd4dXLUL+juPhekQ9bWm5zgs0fYc=
X-Received: by 2002:a25:3b57:: with SMTP id i84mr3955057yba.565.1644319322948; 
 Tue, 08 Feb 2022 03:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-22-pbonzini@redhat.com>
 <23c4d174-f18e-2932-1c25-6698285b53bf@amsat.org>
In-Reply-To: <23c4d174-f18e-2932-1c25-6698285b53bf@amsat.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 8 Feb 2022 13:21:51 +0200
Message-ID: <CAPMcbCqzA2A8+8Tm4qesTX0Bq17UL+WNrefMaqXwJEP7jatjSw@mail.gmail.com>
Subject: Re: [PATCH 21/27] qga/vss: use standard windows headers location
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000024585c05d77fed69"
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

--00000000000024585c05d77fed69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Fri, Feb 4, 2022 at 7:18 AM Philippe Mathieu-Daud=C3=A9 via <
qemu-devel@nongnu.org> wrote:

> On 3/2/22 18:33, Paolo Bonzini wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Stop using special paths with outdated headers from an old SDK.
> >
> > Instead, use standard include paths.
> >
> > You can still build against the old SDK by running configure with
> > --extra-cxxflags=3D"-isystem `/path/to/inc/win2003/"
>
> Superfluous back quote.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> > (this also allows to build against MinGW headers, which are currently
> > broken as in 9.0)
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >   qga/vss-win32/install.cpp   | 2 +-
> >   qga/vss-win32/provider.cpp  | 4 ++--
> >   qga/vss-win32/requester.cpp | 4 ++--
> >   qga/vss-win32/vss-common.h  | 6 +-----
> >   4 files changed, 6 insertions(+), 10 deletions(-)
>
>

--00000000000024585c05d77fed69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 4=
, 2022 at 7:18 AM Philippe Mathieu-Daud=C3=A9 via &lt;<a href=3D"mailto:qem=
u-devel@nongnu.org">qemu-devel@nongnu.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 3/2/22 18:33, Paolo Bonzini wro=
te:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Stop using special paths with outdated headers from an old SDK.<br>
&gt; <br>
&gt; Instead, use standard include paths.<br>
&gt; <br>
&gt; You can still build against the old SDK by running configure with<br>
&gt; --extra-cxxflags=3D&quot;-isystem `/path/to/inc/win2003/&quot;<br>
<br>
Superfluous back quote.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
<br>
&gt; (this also allows to build against MinGW headers, which are currently<=
br>
&gt; broken as in 9.0)<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0qga/vss-win32/install.cpp=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0qga/vss-win32/provider.cpp=C2=A0 | 4 ++--<br>
&gt;=C2=A0 =C2=A0qga/vss-win32/requester.cpp | 4 ++--<br>
&gt;=C2=A0 =C2=A0qga/vss-win32/vss-common.h=C2=A0 | 6 +-----<br>
&gt;=C2=A0 =C2=A04 files changed, 6 insertions(+), 10 deletions(-)<br>
<br>
</blockquote></div>

--00000000000024585c05d77fed69--


