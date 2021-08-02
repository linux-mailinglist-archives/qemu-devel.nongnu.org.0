Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFDF3DDF98
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 20:51:12 +0200 (CEST)
Received: from localhost ([::1]:44316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAd1s-0007Sw-1q
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 14:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mAd0k-00061v-1H
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:50:02 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:47052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mAd0g-00074r-Ke
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:50:01 -0400
Received: by mail-ej1-x634.google.com with SMTP id gs8so32371822ejc.13
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 11:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EbSEC9Zybruei3mB0w2HC9KiDFn+lfj9sgbpStKpZG8=;
 b=g84bv1fqqLlTcDh+WyAp7V3BasuhxLbhhIo7bG1w+kkYOsmbUyGlTDLsNCmhGIoyKa
 Ycy5bwYJS5Z1Gr577VGECbpNcHLLraKf5sOM91FkecuvXUnyZJXcjmAZ4w8Utyxfl1ao
 r7YsT33+Win1PM95qFg7M8U1w70OroYZSbeC4dxV4Kl/KWbOjXQBs1LUyvp/6slJARsF
 ZmJtSQQ0w5saQSiEFKAj6vNg3BG/5yuI9nIZrzUotMPh1xdNgQ/V1yH+xiNM+GTAryph
 020spx9U4n6mDYgg/50fzV5m1E4iiguiZ3auTQnMdIsdisVuebnndmXs1jF85tbP+H5l
 Z+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EbSEC9Zybruei3mB0w2HC9KiDFn+lfj9sgbpStKpZG8=;
 b=GWCZsOtFRJCE+QHH/R4/NdxTkKdP5L6QH900jG1PM9Qx9OWtI779HPg2wTnlcu8b8S
 wmVpPcbXqlTWKQcA8SC1BMpvrbeQ/fZgz/IB5pIP87bwKNCrwohkQZXXXwoRmya8lp+1
 CrCDr6dEwB7CmkByZBn0mpjGiVMdwQorRxCKDPdrtp15m0tX0VnuUzntiFsvEJLB5y9p
 5EcFg3wkDxyuHaC1650pRDXeNjtDDFggU1GJBMuITA2uiAzuqX0NG/HmHPWIoBJ04/1k
 bnxT4iWFJROIMk7fHs8LpivAWbjWAxDtGB894KwCEnG0NSnNcX5pOHvykCiP0I+5c1rk
 SrTw==
X-Gm-Message-State: AOAM530zUyINKQsznLUFzHK1p0lD7l5qHCLCUe+90Qh98wJ1NxJYZim5
 BYK+m7/+TSgEWzKNc6u/xbWBIzx7BR4Y98n+Fp4rB8ZGZAk=
X-Google-Smtp-Source: ABdhPJx6HqrIjWM4zen76sT9bNzFGQRC7AILORaTq1MEE398Ul5xvEZVcmvqlkMNMIzgA+Ya2mNH7Y9xoPH8wFVp5GQ=
X-Received: by 2002:a17:906:70a:: with SMTP id
 y10mr16514595ejb.381.1627930195806; 
 Mon, 02 Aug 2021 11:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 2 Aug 2021 22:49:43 +0400
Message-ID: <CAJ+F1CLJS3rmqYgJWLz5dOK8Ko0-5s-nr30E5xn3vUyzRZL=Ng@mail.gmail.com>
Subject: Re: [PATCH 0/4] chardev fixes
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000000a4e3a05c8980976"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000a4e3a05c8980976
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Jul 23, 2021 at 2:29 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Hi,
>
> Two small fixes related to fd handling for "serial" and "file" backend an=
d
> some
> API comments and minor improvement.
>
> Marc-Andr=C3=A9 Lureau (4):
>   chardev: fix qemu_chr_open_fd() being called with fd=3D-1
>   chardev: fix qemu_chr_open_fd() with fd_in=3D=3Dfd_out
>

I think I could queue those 2 patches for 6.1 as fixes. Daniel, care to
review?
thanks

  chardev: remove needless class method
>   chardev: add some comments about the class methods
>
>  include/chardev/char.h | 34 +++++++++++++++++++++++++++++++++-
>  chardev/char-fd.c      | 31 +++++++++++++++++++++++--------
>  chardev/char-mux.c     |  6 ++----
>  3 files changed, 58 insertions(+), 13 deletions(-)
>
> --
> 2.32.0.264.g75ae10bc75
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000a4e3a05c8980976
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jul 23, 2021 at 2:29 PM &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ma=
rc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" tar=
get=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Hi,<br>
<br>
Two small fixes related to fd handling for &quot;serial&quot; and &quot;fil=
e&quot; backend and some<br>
API comments and minor improvement.<br>
<br>
Marc-Andr=C3=A9 Lureau (4):<br>
=C2=A0 chardev: fix qemu_chr_open_fd() being called with fd=3D-1<br>
=C2=A0 chardev: fix qemu_chr_open_fd() with fd_in=3D=3Dfd_out<br></blockquo=
te><div><br></div><div>I think I could queue those 2 patches for 6.1 as fix=
es. Daniel, care to review?</div><div>thanks</div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
=C2=A0 chardev: remove needless class method<br>
=C2=A0 chardev: add some comments about the class methods<br>
<br>
=C2=A0include/chardev/char.h | 34 +++++++++++++++++++++++++++++++++-<br>
=C2=A0chardev/char-fd.c=C2=A0 =C2=A0 =C2=A0 | 31 +++++++++++++++++++++++---=
-----<br>
=C2=A0chardev/char-mux.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++----<br>
=C2=A03 files changed, 58 insertions(+), 13 deletions(-)<br>
<br>
-- <br>
2.32.0.264.g75ae10bc75<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000a4e3a05c8980976--

