Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ECF2D557E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 09:32:17 +0100 (CET)
Received: from localhost ([::1]:47426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knHN2-0007Nq-9F
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 03:32:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1knHKZ-0006qU-Tf; Thu, 10 Dec 2020 03:29:43 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:45408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1knHKY-0006Ti-B8; Thu, 10 Dec 2020 03:29:43 -0500
Received: by mail-ej1-x641.google.com with SMTP id qw4so6085514ejb.12;
 Thu, 10 Dec 2020 00:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ANmmXfT7nWxlI1V/AiIa/hQzBZWe0tKmBvGaZWeR9Y4=;
 b=EAU8RAZWo/4v7mKj7l/JTP3G+p6BYjE3c6WezWqVhgyx4ghpaoOGXLon4Zs/r7DuMd
 W3FVoLbFgwdzjl2RVLywfa1fb8s3AZeFMD/EcOJHu74G9WZHKRm72a+ppl82Rxkee0Bl
 XrpjnKapGSdTt364o/UVSeLWQ/7Xy4d7Zbrk4CnGftbso3alIxNcxVlumYUKezo2DybK
 j9sNBEt1feD9xStj88A5RHDBwj5uF2Zs43DRALAyaZ//X8Ut+8M4R+swfdlpYwFRDhA1
 +VvTSZK22Z7tmbtLmpR8QMcmJJW5cizytn/wzSr1StjA5CFRQMujoTgrZ6zUGP+R7iv0
 RoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ANmmXfT7nWxlI1V/AiIa/hQzBZWe0tKmBvGaZWeR9Y4=;
 b=lv5sve5t/8f7ZFZz+QtH3Q972yFZrks+NAT43RgELgulte+T6iUxLB+otrSSIsMvSX
 WiI2SaEfEwc+bqmQOm9oeEqVZWnaaWe0A5pcVt7rZRXaOOhRCiA5mE2/ieNmxI0iR4eO
 zLsRvyhoZMs35gJmkmlMcsN70us76Tv+Nuhb49mhm/4h+b5YKaQqyy1JdXCMNAdr3k2v
 lhbM+XAZaocogJ7O/gTiDHMIT6BrExd3UmEDLeiB1IlF7h9qS5vCjv/5KXbAP51por+C
 Elc33D+p45sq93/bPkBsZeDRVN/ZpJuM/ZAqpgmvxlB/VeRONOCk/dXVsVk9h9T9gypl
 Il1g==
X-Gm-Message-State: AOAM531pH8jWNlHyRiZRDHvtkt+0E9fYpfYFRLcQazVuXqSNmTBh1mGJ
 9qsqH0RsYFqtHHtiOq3hRE1sN13g6lVLu+Rjj9E=
X-Google-Smtp-Source: ABdhPJzOrvRA1mi3ULKWroWC5SamYF8f1bx7WOP8GBkdjfRFQXnh/oDd8L93+4zApzN9Zpru9dr+B3GUhjTLGPtPbTA=
X-Received: by 2002:a17:906:30d2:: with SMTP id
 b18mr5383065ejb.109.1607588980241; 
 Thu, 10 Dec 2020 00:29:40 -0800 (PST)
MIME-Version: 1.0
References: <20201202152611.677753-1-stefanha@redhat.com>
 <20201203134117.2fdqiiapcjnlwj66@steredhat>
In-Reply-To: <20201203134117.2fdqiiapcjnlwj66@steredhat>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 10 Dec 2020 12:29:28 +0400
Message-ID: <CAJ+F1CKm2TALspCX1VK3dM=9zdkz8u4yu-rsuH8oHC0vC8rKsQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] vhost-user: avoid g_return_val_if() in
 get/set_config()
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001cba6e05b617fa1d"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x641.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001cba6e05b617fa1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, Dec 3, 2020 at 5:41 PM Stefano Garzarella <sgarzare@redhat.com>
wrote:

> On Wed, Dec 02, 2020 at 03:26:07PM +0000, Stefan Hajnoczi wrote:
> >v2:
> > * Print errors [Marc-Andr=C3=A9]
> >
> >Markus Armbruster pointed out that g_return_val_if() is meant for
> programming
> >errors. It must not be used for input validation since it can be compile=
d
> out.
> >Use explicit if statements instead.
> >
> >This patch series converts vhost-user device backends that use
> >g_return_val_if() in get/set_config().
> >
> >Stefan Hajnoczi (4):
> >  contrib/vhost-user-blk: avoid g_return_val_if() input validation
> >  contrib/vhost-user-gpu: avoid g_return_val_if() input validation
> >  contrib/vhost-user-input: avoid g_return_val_if() input validation
> >  block/export: avoid g_return_val_if() input validation
> >
> > block/export/vhost-user-blk-server.c    | 6 +++++-
> > contrib/vhost-user-blk/vhost-user-blk.c | 6 +++++-
> > contrib/vhost-user-gpu/vhost-user-gpu.c | 6 +++++-
> > contrib/vhost-user-input/main.c         | 6 +++++-
> > 4 files changed, 20 insertions(+), 4 deletions(-)
> >
> >--
> >2.28.0
> >
>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>
>
You didn't collect the v2 patch series, with the received reviewed-by. Not
a big deal here, but please be more careful.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001cba6e05b617fa1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Michael,<br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 3, 2020 at 5:4=
1 PM Stefano Garzarella &lt;<a href=3D"mailto:sgarzare@redhat.com">sgarzare=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, Dec 02, 2020 at 03:26:07PM +0000, Stefan Hajnoczi wrote:=
<br>
&gt;v2:<br>
&gt; * Print errors [Marc-Andr=C3=A9]<br>
&gt;<br>
&gt;Markus Armbruster pointed out that g_return_val_if() is meant for progr=
amming<br>
&gt;errors. It must not be used for input validation since it can be compil=
ed out.<br>
&gt;Use explicit if statements instead.<br>
&gt;<br>
&gt;This patch series converts vhost-user device backends that use<br>
&gt;g_return_val_if() in get/set_config().<br>
&gt;<br>
&gt;Stefan Hajnoczi (4):<br>
&gt;=C2=A0 contrib/vhost-user-blk: avoid g_return_val_if() input validation=
<br>
&gt;=C2=A0 contrib/vhost-user-gpu: avoid g_return_val_if() input validation=
<br>
&gt;=C2=A0 contrib/vhost-user-input: avoid g_return_val_if() input validati=
on<br>
&gt;=C2=A0 block/export: avoid g_return_val_if() input validation<br>
&gt;<br>
&gt; block/export/vhost-user-blk-server.c=C2=A0 =C2=A0 | 6 +++++-<br>
&gt; contrib/vhost-user-blk/vhost-user-blk.c | 6 +++++-<br>
&gt; contrib/vhost-user-gpu/vhost-user-gpu.c | 6 +++++-<br>
&gt; contrib/vhost-user-input/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +=
++++-<br>
&gt; 4 files changed, 20 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt;-- <br>
&gt;2.28.0<br>
&gt;<br>
<br>
Reviewed-by: Stefano Garzarella &lt;<a href=3D"mailto:sgarzare@redhat.com" =
target=3D"_blank">sgarzare@redhat.com</a>&gt;<br>
<br>
</blockquote></div><div><br></div><div>You didn&#39;t collect the v2 patch =
series, with the received reviewed-by. Not a big deal here, but please be m=
ore careful.<br></div><div><br></div><div>thanks</div><div><br></div>-- <br=
><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div=
></div>

--0000000000001cba6e05b617fa1d--

