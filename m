Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2B23736D1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:12:32 +0200 (CEST)
Received: from localhost ([::1]:49252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDa3-0003mj-OL
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leDYD-0002EF-Uh
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:10:37 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1leDYB-000629-Pr
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:10:37 -0400
Received: by mail-ej1-x630.google.com with SMTP id a4so1708290ejk.1
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XCF/lQ7QdynCB1AZMWTr1Fbomw8TP3Ar1rFtMtoA058=;
 b=EFf+eQtRsj2XXDu5Syeuu6MpTQKsqgLYHGLEltyEhnwsWgqhc7+kj0EgawLWqBrXja
 CuO0V4wkDvtYioZctWk2+SLh+YUIVzYz+XwDXz3H9mAA6bumcUkbl/M4gehED4erhYlP
 NRdrxd0fvEJdoKFD5xI/nQt/SJMyfWOrvW4kfvoGXGePzall1LG9b7gjTunY7tmKPAQ3
 q098j1OUU2JXQGDxlyAIPPO8lTUKyp9/ZMt5R2ThRGsguByfKgK1PVNYYMcgONpXNqh9
 evu3HP5cYzLN2KM1UVTtusm0Ibww41CGl0pvf/MhNR+gXdN/5uTFC6ro3fBEH2VsxntN
 XXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XCF/lQ7QdynCB1AZMWTr1Fbomw8TP3Ar1rFtMtoA058=;
 b=Sr/ek2zCj5YnkJRjfiMxqBwLhD0WRgB5shmnEka0S3CGeA0X9XcxhWkxWCrQ3ViITB
 yh5vyc0Lc5qj5i5Xi9gb05DRHf2+/4EKe3rjlPo6ZCA8ZeUIaNCOFOz+lfC/6B5etZwi
 GF7T2HaAAIT0CVLt5B1W704Za6oxtbP2xskC+igUB0H+SkoxMsPmR9prDiAS0/WOoHB1
 4AuLiA+gP2RMvcVi5F92Gt+WaZ3k/33T19TIswrFKFn3BLOskRYLGKDW3/kFRME8Ayd4
 05hPu+IC96TyC0kerBOW8tNk2jGbuxZ/7eyMjB/o1erYr8WzJ0iVWuRpUn6iDnMasHZg
 9Lxg==
X-Gm-Message-State: AOAM530Bl8/chctSvgLuroRntkKT6GvMs62lDvFnmTU7elYfnXNbuwWY
 aM/hCRmAMIHGBdnuCZhbJLe/1+189y2SWOtFvbg=
X-Google-Smtp-Source: ABdhPJyMqB+vsgRAWg+MzvsNXRoy4HZrKbIheF1ii0DyQwSm+80lOmYpgieZpfJoaOJ6XDtu7bQ4qN5xT15k1Ff/rW4=
X-Received: by 2002:a17:906:46d0:: with SMTP id
 k16mr26619223ejs.105.1620205834118; 
 Wed, 05 May 2021 02:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210505045824.33880-1-liq3ea@163.com>
In-Reply-To: <20210505045824.33880-1-liq3ea@163.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 5 May 2021 13:10:22 +0400
Message-ID: <CAJ+F1CLym=c1hBXeC9-_bVR5RBKhS8fVwbianjnJAUBVz+_foQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] vhost-user-gpu: fix several security issues
To: Li Qiang <liq3ea@163.com>
Content-Type: multipart/alternative; boundary="00000000000034a9ac05c191912b"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x630.google.com
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
Cc: Li Qiang <liq3ea@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000034a9ac05c191912b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 5, 2021 at 9:21 AM Li Qiang <liq3ea@163.com> wrote:

> These security issue is low severity and is similar with the
> virtio-vga/virtio-gpu device. All of them can be triggered by
> the guest user.
>
> Li Qiang (7):
>   vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_info
>   vhost-user-gpu: fix resource leak in 'vg_resource_create_2d'
>   vhost-user-gpu: fix memory leak in vg_resource_attach_backing
>   vhost-user-gpu: fix memory link while calling 'vg_resource_unref'
>   vhost-user-gpu: fix memory leak in 'virgl_cmd_resource_unref'
>   vhost-user-gpu: fix memory leak in 'virgl_resource_attach_backing'
>   vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset'
>
>  contrib/vhost-user-gpu/vhost-user-gpu.c |  7 +++++++
>  contrib/vhost-user-gpu/virgl.c          | 17 ++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
>
> --
>

The whole series looks good to me, and applies fixes that were done earlier
in virtio-gpu.

Thanks


--=20
Marc-Andr=C3=A9 Lureau

--00000000000034a9ac05c191912b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 5, 2021 at 9:21 AM Li Q=
iang &lt;<a href=3D"mailto:liq3ea@163.com">liq3ea@163.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">These security iss=
ue is low severity and is similar with the<br>
virtio-vga/virtio-gpu device. All of them can be triggered by<br>
the guest user.<br>
<br>
Li Qiang (7):<br>
=C2=A0 vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_info<b=
r>
=C2=A0 vhost-user-gpu: fix resource leak in &#39;vg_resource_create_2d&#39;=
<br>
=C2=A0 vhost-user-gpu: fix memory leak in vg_resource_attach_backing<br>
=C2=A0 vhost-user-gpu: fix memory link while calling &#39;vg_resource_unref=
&#39;<br>
=C2=A0 vhost-user-gpu: fix memory leak in &#39;virgl_cmd_resource_unref&#39=
;<br>
=C2=A0 vhost-user-gpu: fix memory leak in &#39;virgl_resource_attach_backin=
g&#39;<br>
=C2=A0 vhost-user-gpu: fix OOB write in &#39;virgl_cmd_get_capset&#39;<br>
<br>
=C2=A0contrib/vhost-user-gpu/vhost-user-gpu.c |=C2=A0 7 +++++++<br>
=C2=A0contrib/vhost-user-gpu/virgl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17=
 ++++++++++++++++-<br>
=C2=A02 files changed, 23 insertions(+), 1 deletion(-)<br>
<br>
-- <br></blockquote><div><br></div><div>The whole series looks good to me, =
and applies fixes that were done earlier in virtio-gpu.<br></div><div><br><=
/div><div>Thanks<br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"lt=
r" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000034a9ac05c191912b--

