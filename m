Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF52B3737B5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:39:44 +0200 (CEST)
Received: from localhost ([::1]:37968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leE0N-0006vH-QB
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leDw6-0004Ct-V1
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:35:19 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leDw3-0004Ce-QQ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:35:18 -0400
Received: by mail-ej1-x62e.google.com with SMTP id m12so1825713eja.2
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Yshk7DVhpKbkaLFM4NR9ugITQYR39Zr3yvNoO6mZUw=;
 b=AVkFQPZb7uihXoomSk0xR1o3r4R7FLyHdDxlh3JUDB5w/Gutvv8muOiCkOyhygiGP7
 Zc5ZuT5enqJl74gFxZCw/fOllYYE7vbCLugGYNjCb7en6GEdcbngSxMsUm4s+p0VCkQ3
 gtT6Z0j5VwPRVvu/acoK5pnBI16a6/M8JIqKi9lKots2kRwjzkQaiIs9rDDa4PgO65b0
 NtmKwXwpw1z0JraQIX1+daybASHNbHPDjkZlsoj3UYM+MmsRTz0XNPRO/lVzyrpJcIeO
 E9qG/IGVkMxb6SuEwv89utiqcVQgTQW5bStBsKXDBdsazlT/gyVGrPlU3p8u644oUZ+O
 8Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Yshk7DVhpKbkaLFM4NR9ugITQYR39Zr3yvNoO6mZUw=;
 b=hvE92YwARn4SJ5FRgxRzPL9ax3ZiCSViqa9ZO8k96GhLWb//cSJLzcPyX4rf2nf0tQ
 38nXI8uu5x1dbOkHG12zF6iI+obnK/B48hCdpMvoVD7wjlJIHuOm4FDkFgkkppxSFxfA
 6J0mtNpcIc1cINJtbEu1ZBwrr9S0h2F45Sb6EltwbYQYNWEY8oAPwIqw/inb1IERS8lW
 FUjrrWVO71jcH1NuZOMZLl0uhEpwfmE/xXGzm18xBQ+8+YDD4S/5i0260Q02Vn260f+q
 dvnXbGAvzsvC4NnjeKR/O596hpMVTIWXbXLd81OJG6D7OqSqEIX4X/lpbS4wX/FniLLA
 X90A==
X-Gm-Message-State: AOAM533nzWoX6kehCJf52XfdLd6ty4493dkh/KWqyeX8wORLMKOD4A3j
 FH2Yd5CMGZWGT4gZFqGqfUHtuX06NHi8FDevRL4=
X-Google-Smtp-Source: ABdhPJw7ylO6L3vUE9fgjwv9FPfOeF8tlu5LcL6f853u1SvDEYXU0w5PDVVW3nivq3QJrzyzlJ3Kc2NOrA4hOLFmP88=
X-Received: by 2002:a17:907:1b1e:: with SMTP id
 mp30mr26741603ejc.532.1620207312457; 
 Wed, 05 May 2021 02:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210505045824.33880-1-liq3ea@163.com>
 <CAJ+F1CLym=c1hBXeC9-_bVR5RBKhS8fVwbianjnJAUBVz+_foQ@mail.gmail.com>
 <CAKXe6SLyzGUDG6Tex2QnCMk4CWbEWVZd66Q_=iBwDoqf5=R-Jw@mail.gmail.com>
In-Reply-To: <CAKXe6SLyzGUDG6Tex2QnCMk4CWbEWVZd66Q_=iBwDoqf5=R-Jw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 5 May 2021 13:35:00 +0400
Message-ID: <CAJ+F1CKgZzKzCurGSyQ7s2ZOADgX7BbWgvDVV=ejgthdA3K+pQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] vhost-user-gpu: fix several security issues
To: Li Qiang <liq3ea@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000052550c05c191e952"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Li Qiang <liq3ea@163.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000052550c05c191e952
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 5, 2021 at 1:28 PM Li Qiang <liq3ea@gmail.com> wrote:

> Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> =E4=BA=8E2021=E5=B9=
=B45=E6=9C=885=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=885:10=E5=86=99=
=E9=81=93=EF=BC=9A
> >
> > Hi
> >
> > On Wed, May 5, 2021 at 9:21 AM Li Qiang <liq3ea@163.com> wrote:
> >>
> >> These security issue is low severity and is similar with the
> >> virtio-vga/virtio-gpu device. All of them can be triggered by
> >> the guest user.
> >>
> >> Li Qiang (7):
> >>   vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_info
> >>   vhost-user-gpu: fix resource leak in 'vg_resource_create_2d'
> >>   vhost-user-gpu: fix memory leak in vg_resource_attach_backing
> >>   vhost-user-gpu: fix memory link while calling 'vg_resource_unref'
> >>   vhost-user-gpu: fix memory leak in 'virgl_cmd_resource_unref'
> >>   vhost-user-gpu: fix memory leak in 'virgl_resource_attach_backing'
> >>   vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset'
> >>
> >>  contrib/vhost-user-gpu/vhost-user-gpu.c |  7 +++++++
> >>  contrib/vhost-user-gpu/virgl.c          | 17 ++++++++++++++++-
> >>  2 files changed, 23 insertions(+), 1 deletion(-)
> >>
> >> --
> >
> >
> > The whole series looks good to me, and applies fixes that were done
> earlier in virtio-gpu.
>
> Do you mean you have merged this series?
> Should I tweak something such as "adding the original fix in
> virtio-gpu"/"better mapping iov cleanup"?
>
>
No I didn't. I was waiting for the answers to Prasad questions, and
eventually v2.

Then either Gerd or me can queue this imho.

--=20
Marc-Andr=C3=A9 Lureau

--00000000000052550c05c191e952
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 5, 2021 at 1:28 PM Li Q=
iang &lt;<a href=3D"mailto:liq3ea@gmail.com">liq3ea@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Marc-Andr=C3=
=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_bla=
nk">marcandre.lureau@gmail.com</a>&gt; =E4=BA=8E2021=E5=B9=B45=E6=9C=885=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=885:10=E5=86=99=E9=81=93=EF=BC=9A<=
br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Wed, May 5, 2021 at 9:21 AM Li Qiang &lt;<a href=3D"mailto:liq3ea@1=
63.com" target=3D"_blank">liq3ea@163.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; These security issue is low severity and is similar with the<br>
&gt;&gt; virtio-vga/virtio-gpu device. All of them can be triggered by<br>
&gt;&gt; the guest user.<br>
&gt;&gt;<br>
&gt;&gt; Li Qiang (7):<br>
&gt;&gt;=C2=A0 =C2=A0vhost-user-gpu: fix memory disclosure in virgl_cmd_get=
_capset_info<br>
&gt;&gt;=C2=A0 =C2=A0vhost-user-gpu: fix resource leak in &#39;vg_resource_=
create_2d&#39;<br>
&gt;&gt;=C2=A0 =C2=A0vhost-user-gpu: fix memory leak in vg_resource_attach_=
backing<br>
&gt;&gt;=C2=A0 =C2=A0vhost-user-gpu: fix memory link while calling &#39;vg_=
resource_unref&#39;<br>
&gt;&gt;=C2=A0 =C2=A0vhost-user-gpu: fix memory leak in &#39;virgl_cmd_reso=
urce_unref&#39;<br>
&gt;&gt;=C2=A0 =C2=A0vhost-user-gpu: fix memory leak in &#39;virgl_resource=
_attach_backing&#39;<br>
&gt;&gt;=C2=A0 =C2=A0vhost-user-gpu: fix OOB write in &#39;virgl_cmd_get_ca=
pset&#39;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 contrib/vhost-user-gpu/vhost-user-gpu.c |=C2=A0 7 +++++++<br=
>
&gt;&gt;=C2=A0 contrib/vhost-user-gpu/virgl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 17 ++++++++++++++++-<br>
&gt;&gt;=C2=A0 2 files changed, 23 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;<br>
&gt;<br>
&gt; The whole series looks good to me, and applies fixes that were done ea=
rlier in virtio-gpu.<br>
<br>
Do you mean you have merged this series?<br>
Should I tweak something such as &quot;adding the original fix in<br>
virtio-gpu&quot;/&quot;better mapping iov cleanup&quot;?<br><br></blockquot=
e><div><br></div><div>No I didn&#39;t. I was waiting for the answers to Pra=
sad questions, and eventually v2.</div><div><br></div><div>Then either Gerd=
 or me can queue this imho.<br></div><div>=C2=A0</div></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000052550c05c191e952--

