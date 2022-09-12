Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5985B571E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 11:23:48 +0200 (CEST)
Received: from localhost ([::1]:34588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXffP-0003F3-9I
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 05:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oXfbs-0007xM-1B
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 05:20:08 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:43788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oXfbp-0006NZ-Sl
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 05:20:07 -0400
Received: by mail-lf1-x12c.google.com with SMTP id o2so11626990lfc.10
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=JjWRtBAoTITRK+kxX0QnzhlbAHsiUkh/Q26adT+xWcY=;
 b=RJxIf2UPBDqVkEnVbKnGlfpvoSl7aktBw/F5gV06BHgpqUyZ55yNrjTfwLysxwxyhG
 0piw0lOF4H6n15C4DHex+n7YX3bUNs4Wg17IFpnv1BCgbUKwSNlhFXpv8+pmM+DxY5WE
 5Qh5LvOcmEZP4zhJaAWINiu6uqNHnT4QzJKvXIp+EgUZ/dFw6Y5xE3cuNyDrasHmuByJ
 Z9/CqfXLwI1ZUMPDm4/zGaiUeo8mDNpTGmZWovgQKiEcU+H89+Et6CK+sX/cN0jYW5jQ
 mpp6JYFgNkcnslr5sKGAJ2oDHPWqutGPFR+oBPnIyjBlc1eqYPkQiYURwWsFBjL6itXg
 6BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=JjWRtBAoTITRK+kxX0QnzhlbAHsiUkh/Q26adT+xWcY=;
 b=N4zfzHVhklM9UHoRZSS00HIWZTLJDaZkdoLVwPMdtqgU4ERoDsX7l4UuZhv+9i+Vf/
 9e4tjsbdiShB0mXXZoJ9fjPuWCt+6wqaQ/SQucauvD9JkKPKTg2gGzH4LDon4DjBxtaj
 xi5hbgUhJSdncvx94//D3e4FeXfHH1Teohmz3bZXw6UV8KUS6L0e6kOeBlxW3XJqb/8j
 HOydCrPBLZ1iFFn9bBbXncMPrQ+yM5hSO1tZlUuOJhlULI7pE5SXoGFjosIGu6Vwx/5S
 5aLn40aTHaoKuVlXhGIzFk9qowEsW7x2bfFasiqdTsgcx5JHvV8JD8oiBJiPVI9Bqmlo
 x5aw==
X-Gm-Message-State: ACgBeo2rgrbHEfVsy9nmfoV0LTpP4YYKSrjToGsmoaObqQMop9EtP1Q6
 I3ka6durw+BntMR6utKB5syhROJlQYZd/77rCtE=
X-Google-Smtp-Source: AA6agR5sQ3thPI1c7ff55vKiGUD0T2G/8aTHyhm52ouaLgYtcY3rBOwGmjJm2cMthx0H6h9uOjYuZ9KNj3lmh2cSNUA=
X-Received: by 2002:a05:6512:3d18:b0:498:fafb:229f with SMTP id
 d24-20020a0565123d1800b00498fafb229fmr5543411lfv.356.1662974403798; Mon, 12
 Sep 2022 02:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220829154058.524413-1-antonio.caggiano@collabora.com>
 <CAJ+F1C+zNq7uVn02BLWVvL6E+3gRL4PbqhUMP9rqYr73cCJ2xQ@mail.gmail.com>
 <efeafcb1-a9e1-28dc-cd92-516c22f96f8d@collabora.com>
In-Reply-To: <efeafcb1-a9e1-28dc-cd92-516c22f96f8d@collabora.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Sep 2022 13:19:52 +0400
Message-ID: <CAJ+F1CLNuNgs+pWYykSSXonU9JWEA65pgyTOVyQ7+dS8s_rngw@mail.gmail.com>
Subject: Re: [PATCH 0/5] virtio-gpu: Blob resources
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: qemu-devel@nongnu.org, gert.wollny@collabora.com, 
 dmitry.osipenko@collabora.com
Content-Type: multipart/alternative; boundary="0000000000009bed0805e87766c6"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009bed0805e87766c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Sep 12, 2022 at 12:58 PM Antonio Caggiano <
antonio.caggiano@collabora.com> wrote:

> Hi Marc-Andr=C3=A9,
>
> On 30/08/2022 13:07, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Mon, Aug 29, 2022 at 7:46 PM Antonio Caggiano
> > <antonio.caggiano@collabora.com <mailto:antonio.caggiano@collabora.com>=
>
>
> > wrote:
> >
> >     Add shared memory and support blob resource creation, mapping and
> >     unmapping through virglrenderer new stable APIs[0] when available.
> >
> >     [0]
> >
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/891 <
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/891>
> >
> >
> > This is merged, and will be part of 0.10
> > (
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/milestones/9#tab-iss=
ues
> <
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/milestones/9#tab-iss=
ues>),
> hopefully soon to be released.
> >
> > The series looks ok to me, except for the few comments I left. Could yo=
u
> > please update the documentation too?
>
> Which documentation are you referring to?
>

Oh indeed, we really lack documentation about graphics! not your fault  ..
could you at least give some hints in the commit message how to enable /
test this feature?

thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000009bed0805e87766c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 12, 2022 at 12:58 PM An=
tonio Caggiano &lt;<a href=3D"mailto:antonio.caggiano@collabora.com">antoni=
o.caggiano@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi Marc-Andr=C3=A9,<br>
<br>
On 30/08/2022 13:07, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Mon, Aug 29, 2022 at 7:46 PM Antonio Caggiano <br>
&gt; &lt;<a href=3D"mailto:antonio.caggiano@collabora.com" target=3D"_blank=
">antonio.caggiano@collabora.com</a> &lt;mailto:<a href=3D"mailto:antonio.c=
aggiano@collabora.com" target=3D"_blank">antonio.caggiano@collabora.com</a>=
&gt;&gt; <br>
&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Add shared memory and support blob resource creatio=
n, mapping and<br>
&gt;=C2=A0 =C2=A0 =C2=A0unmapping through virglrenderer new stable APIs[0] =
when available.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[0]<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.freedesktop.org/virgl/vir=
glrenderer/-/merge_requests/891" rel=3D"noreferrer" target=3D"_blank">https=
://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/891</a> &lt;=
<a href=3D"https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_reque=
sts/891" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.or=
g/virgl/virglrenderer/-/merge_requests/891</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; This is merged, and will be part of 0.10 <br>
&gt; (<a href=3D"https://gitlab.freedesktop.org/virgl/virglrenderer/-/miles=
tones/9#tab-issues" rel=3D"noreferrer" target=3D"_blank">https://gitlab.fre=
edesktop.org/virgl/virglrenderer/-/milestones/9#tab-issues</a> &lt;<a href=
=3D"https://gitlab.freedesktop.org/virgl/virglrenderer/-/milestones/9#tab-i=
ssues" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/=
virgl/virglrenderer/-/milestones/9#tab-issues</a>&gt;), hopefully soon to b=
e released.<br>
&gt; <br>
&gt; The series looks ok to me, except for the few comments I left. Could y=
ou <br>
&gt; please update the documentation too?<br>
<br>
Which documentation are you referring to?<br></blockquote><div><br></div><d=
iv>Oh indeed, we really lack documentation about graphics! not your fault=
=C2=A0 .. could you at least give some hints in the commit message how to e=
nable / test this feature?</div></div><div class=3D"gmail_quote"><br></div>=
<div class=3D"gmail_quote">thanks<br clear=3D"all"></div><br>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009bed0805e87766c6--

