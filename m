Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3183F6FBFD0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 09:02:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwHLm-0004Wa-Pj; Tue, 09 May 2023 03:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pwHLY-0004Tc-14
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:01:22 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pwHLU-0005LV-AW
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:01:14 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f24ceae142so2674605e87.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 00:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683615669; x=1686207669;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qxZQiJsdIjLsJJxwjIAvAx7UVp4TL/C7+6lbUkKZ3uM=;
 b=bGvnCYt0mglBwrtTYT/XqLjxTt1fGsRyiHGOWjXan2/qnSaJlQcono8lcZsnH5/J3H
 exIM4QTO+SjNUao5m1sqzpB6noDP55bD9J8KlCTwCLrJ0oL2+7z2Sk7lWGebw37ROIJO
 YpYxHqXx7G0O6EeQnc5WkNVQJTeFqczNcG3SYuDeo72hWDx3BZQdH+9xpaIRIKlISOVe
 2aVq8Stzwv/gumaLl40FOctHK0TkLk9PrF2V9ZNinKbvV2mvkmCBRACWgOPjtlfvmXkq
 CTbbE1pJcvufcHwEmdZOP9tivvsoltKuDgG/QdDpCEW+pfo04KbgWAexB+kR7VGLGpQ3
 Rq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683615669; x=1686207669;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qxZQiJsdIjLsJJxwjIAvAx7UVp4TL/C7+6lbUkKZ3uM=;
 b=i1flLQw1YVV8BDjGMu3uCXtkxnb6CwzlhWJ/bARNfqZ/tYZy1C5nttmHBU2rcIDh1M
 UiegTFuyhctqZeayuu4onbUGhTCYzJQkOvCl+q1F92v+ktPqmtZ1Upu/gU4OFbnJC75r
 /tDgEhmVDyYbyOoFHlL1qlY7UfVGcp68Lc0OTjO3ZlTbbbVihT95+PnoQ6i3k2Fh4hD6
 6X43GXhikDkBGpAAhrz55yaykx1lULKTVfgleb/mCAXIC9b/sy+ViqljiGloSb28gMQW
 Ey2bvqx6MhXGVdNJI59lEgbmbGq4aG8/MI5BvyKQ+E4XkYcOuBrlNfVifuw95DpduLRP
 N6Wg==
X-Gm-Message-State: AC+VfDyhY50ceDc/DzXMn3sQjbmziI5HgkZC5Oc/WDKBxY+e+cn3IlgM
 gKgAl8BKlphTsdrW9+oBcCURar1jPMLbqseGZlMrHiNgvyggDw==
X-Google-Smtp-Source: ACHHUZ5kIIVukJVnXTWYiUaybD3QKA6MmhufVeKPeUI9VRpPcBervoUuM1hNd3svVsohD7fCAp9zfUZBI55dEWVpA5Q=
X-Received: by 2002:ac2:547c:0:b0:4f2:5aae:937 with SMTP id
 e28-20020ac2547c000000b004f25aae0937mr319299lfn.64.1683615669413; Tue, 09 May
 2023 00:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAJSP0QUccstoX1EBBB=snA+g7xTc4Wr4Hf+-x-k9dbbd2iahnA@mail.gmail.com>
In-Reply-To: <CAJSP0QUccstoX1EBBB=snA+g7xTc4Wr4Hf+-x-k9dbbd2iahnA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 9 May 2023 11:00:57 +0400
Message-ID: <CAJ+F1CJXaE+1O_93QuAiZ8Zddhc9hRp2X3Umc1whSqrPDXxEyg@mail.gmail.com>
Subject: Re: Your clang TSA patches
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e9ec6405fb3d5135"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000e9ec6405fb3d5135
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan

On Mon, May 8, 2023 at 6:54=E2=80=AFPM Stefan Hajnoczi <stefanha@gmail.com>=
 wrote:

> Hi Marc-Andr=C3=A9,
> clang's Thread Safety Analysis is being used more in the QEMU block
> layer and a few limitations have been hit:
> 1. Mutexes that are struct fields are not supported (only global mutexes
> work).
> 2. Analysis does not extend across function pointers. See
> GRAPH_RDLOCK_PTR for a workaround that is currently used.
>
> (There was a third limitation that I don't remember. Maybe Kevin
> remembers.)
>
> I heard you had clang or LLVM patches in that past that improve TSA.
> Did your patches address these things? Any idea how hard it is to fix
> these limitations?
>


I don't remember much about that work, I didn't spend that much time on it,
and it was 5y ago already!

My WIP branch is still available:
https://github.com/elmarco/clang/commits/qemu-ta

it seems I was trying to modify clang to support TSA annotations on typedef
and function pointers, and warn on unmatching. I have no idea if this is
still relevant. I remember dropping the effort at that time because of lack
of interest or help in both projects.

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e9ec6405fb3d5135
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Stefan<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 8, 2023 at 6:54=
=E2=80=AFPM Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com">stefa=
nha@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi Marc-Andr=C3=A9,<br>
clang&#39;s Thread Safety Analysis is being used more in the QEMU block<br>
layer and a few limitations have been hit:<br>
1. Mutexes that are struct fields are not supported (only global mutexes wo=
rk).<br>
2. Analysis does not extend across function pointers. See<br>
GRAPH_RDLOCK_PTR for a workaround that is currently used.<br>
<br>
(There was a third limitation that I don&#39;t remember. Maybe Kevin rememb=
ers.)<br>
<br>
I heard you had clang or LLVM patches in that past that improve TSA.<br>
Did your patches address these things? Any idea how hard it is to fix<br>
these limitations?<br></blockquote><div><br></div><div><br></div><div>I don=
&#39;t remember much about that work, I didn&#39;t spend that much time on =
it, and it was 5y ago already! <br></div></div><div><br></div><div>My WIP b=
ranch is still available: <a href=3D"https://github.com/elmarco/clang/commi=
ts/qemu-ta">https://github.com/elmarco/clang/commits/qemu-ta</a></div><div>=
<br></div><div>it seems I was trying to modify clang to support TSA annotat=
ions on typedef and function pointers, and warn on unmatching. I have no id=
ea if this is still relevant. I remember dropping the effort at that time b=
ecause of lack of interest or help in both projects.<br></div><br><span cla=
ss=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail=
_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e9ec6405fb3d5135--

