Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF4B2B804A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:22:58 +0100 (CET)
Received: from localhost ([::1]:46862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPIP-0004T9-1H
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kfPH1-0003wj-Su; Wed, 18 Nov 2020 10:21:31 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kfPH0-000260-8a; Wed, 18 Nov 2020 10:21:31 -0500
Received: by mail-ed1-x530.google.com with SMTP id l5so2368840edq.11;
 Wed, 18 Nov 2020 07:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WXrRSMQIneiHYVCqFxLGF/Dh731rkNCmc22ZMY1JKO4=;
 b=nExK8n5+zY0dIAJ91Tb0SUptqMvtvguq5+lA18v1PC/aQKR2H0fMp7JVKgjk3OZ2C5
 Pi1scmaYw3eFZkQopmFoFb0RRVrxQ6eSwCdWPZ6/omgKQ0XjkiuSinJoEzqe6hVqXGqq
 2EJR78ppYI/S2wNe5hwXpY7OE9j8O6BomGyqf0eu4NN9wJ6Tgo98w7v0NjCrxQokzJuT
 CDBWA3yZHtWqcbrbUJsjTiRVJDhn0y7YBQHe9ZlKkTY1BD1mIYrto1wekmbxJM2uo6ZP
 bA93ABgLJR2oGZVQ2InBD3MgCZvncnRAU2Q7EIncvE/wiMOP6XvZ3j4Ayy6NjsS0TKun
 ba6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WXrRSMQIneiHYVCqFxLGF/Dh731rkNCmc22ZMY1JKO4=;
 b=mhtpZfvvmW4ZosqiAsPCzF9SIbqL1ZoV0dadLYXPY5+Ly77BL7Pjk96RrqgInvfv0g
 fmpDN5e+Sugu9KBkoew7BpJbv9AucbsHx8rnrTDfyZERH/3Dghyb6GEnldyuhNdRg/Mx
 8MIBlwL5ns3kgEPC0T/sp282JEa0JRXn7FO4fTcrYxbxGZQOfvohq9xzQx0l2loHz5oO
 cL+iMP9+TGX2ysH3Ac8++tqQP2qo9zbEE1cm5VrEChs70w8en0JKpFSwU/mtBO7znw+v
 vIq4nbiptQg7acbM64C0ei2l4+sqXSlXm5EvQuaEvuYP1YLDPH1GCX0UpCzfAb3M+mXG
 i2Ww==
X-Gm-Message-State: AOAM5317aujzi4Fb/YIuwd8EIzWdScbvhjqVKjtZm0loQJoSGIWtL4Dr
 Jp87+OY26/PKL/C5OnOkyouivyXrYeh30nTiQzw=
X-Google-Smtp-Source: ABdhPJxlhOJ5f4YVzs+K/ddGOxspiH4Atgc5qE4ODX6XwIaWhq2A2kbP2FAIFpeIveZ9QzajHKgoyjVKWPGaJUpAtIo=
X-Received: by 2002:a50:9fe6:: with SMTP id c93mr25674945edf.30.1605712887707; 
 Wed, 18 Nov 2020 07:21:27 -0800 (PST)
MIME-Version: 1.0
References: <20201118091644.199527-1-stefanha@redhat.com>
In-Reply-To: <20201118091644.199527-1-stefanha@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 18 Nov 2020 19:21:15 +0400
Message-ID: <CAJ+F1CK3Ap38E8343j1keFoX4UEPXR7FgALf7LRvwMSpKywefQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] vhost-user: avoid g_return_val_if() in
 get/set_config()
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000487d3405b4632a28"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x530.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Coiby Xu <Coiby.Xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000487d3405b4632a28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Nov 18, 2020 at 1:17 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:

> Markus Armbruster pointed out that g_return_val_if() is meant for
> programming
> errors. It must not be used for input validation since it can be compiled
> out.
> Use explicit if statements instead.
>
> This patch series converts vhost-user device backends that use
> g_return_val_if() in get/set_config().
>
> Stefan Hajnoczi (4):
>   contrib/vhost-user-blk: avoid g_return_val_if() input validation
>   contrib/vhost-user-gpu: avoid g_return_val_if() input validation
>   contrib/vhost-user-input: avoid g_return_val_if() input validation
>   block/export: avoid g_return_val_if() input validation
>
>
The condition is the same for all the patches, checking the message config
payload is large enough. Afaict, the value is set by the client, so it
could be a runtime error, and thus explicit checking is required.

Nevertheless, one nice thing about g_return* macros, is that it provides an
error message when the condition fails, which helps. Could you replace it?

(fwiw, I think g_return* macros are so convenient, I would simply make
G_DISABLE_CHECKS forbidden and call it a day)


--=20
Marc-Andr=C3=A9 Lureau

--000000000000487d3405b4632a28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 18, 2020 at 1:17 PM Ste=
fan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Markus Armbruster pointed out that g_return_val_if() is meant for programmi=
ng<br>
errors. It must not be used for input validation since it can be compiled o=
ut.<br>
Use explicit if statements instead.<br>
<br>
This patch series converts vhost-user device backends that use<br>
g_return_val_if() in get/set_config().<br>
<br>
Stefan Hajnoczi (4):<br>
=C2=A0 contrib/vhost-user-blk: avoid g_return_val_if() input validation<br>
=C2=A0 contrib/vhost-user-gpu: avoid g_return_val_if() input validation<br>
=C2=A0 contrib/vhost-user-input: avoid g_return_val_if() input validation<b=
r>
=C2=A0 block/export: avoid g_return_val_if() input validation<br>
<br></blockquote><div><br></div><div>The condition is the same for all the =
patches, checking the message config payload is large enough. Afaict, the v=
alue is set by the client, so it could be a runtime error, and thus explici=
t checking is required.</div><div><br></div><div>Nevertheless, one nice thi=
ng about g_return* macros, is that it provides an error message when the co=
ndition fails, which helps. Could you replace it?</div><div><br></div><div>=
(fwiw, I think g_return* macros are so convenient, I would simply make G_DI=
SABLE_CHECKS forbidden and call it a day)<br></div></div><br clear=3D"all">=
<br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lurea=
u<br></div></div>

--000000000000487d3405b4632a28--

