Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2BA58DCF2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 19:17:13 +0200 (CEST)
Received: from localhost ([::1]:53680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSqt-0004eV-KM
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 13:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oLSho-0006wE-HT; Tue, 09 Aug 2022 13:07:49 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:34622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oLShm-0002Hx-Ro; Tue, 09 Aug 2022 13:07:48 -0400
Received: by mail-lf1-x12a.google.com with SMTP id o2so10534272lfb.1;
 Tue, 09 Aug 2022 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=F/rN6N0fSNmOHOndJ9HBCo4CL26vbiKYoQNkGnNKFYY=;
 b=R9Xdj+vK6kI/GETZ029OilwQ9yFfTn9w+8XC0EWyicajwWO3gaaOgGJqos5FQkoNHY
 mcTl8mmG+FZ6jIkI1sFCcMprE0+E2u8PrhHJdINXuS5FUCuCUdz/aYbSCwSSIj/XflAm
 b4SE86X/A8Ay8bxE3AyL+XlPhV8lM6ZBb5JaeW8sCpg6sihyQ7V1tHZXRvauSlYZNWjt
 shR4FptwuzQDwyEtVd3ARaWEqF8NaJQ1fdDl+IHpHeV0THU5t+JwH0q2TeCh3v6EXq/n
 UoOpN4UxHogYSL3hrQif5oNaskOP4Qxdu9hHIT88bhf/5HJdKXYf7gyq4DszyyG0Knjp
 1Y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=F/rN6N0fSNmOHOndJ9HBCo4CL26vbiKYoQNkGnNKFYY=;
 b=fMPOGEIOyvUeWZfSlbJRW7+7nkudIyeILAirIloo6E+DtVRzXIwdzB8ooAaWUie2bs
 UMK2X3AAGCbeuJrW4GIQdejI0cw+1eeHyXGRxZqVvxg2XR3Cmmei4NHKixob4nEhoBHT
 gpfJxsptTBBQqKlQ/HoYjXqCLmtDEX1r7KNhEhOBlB62SO9tUIY1JA1eMjyycS0lD96T
 R5aV21+C4n2BzEXCYaStkObEvrTO7BR2/hoZrDgeTO2ICnicwPB5hWH/Uuj5UsFq5JN5
 XbsjiZ96BEv51zsgrLo5b38aqDFDC4SD/12u/VpNJfGszRSziF+pKCxEy9NH88gJf1ST
 P3aQ==
X-Gm-Message-State: ACgBeo1pDTyqcx04bcsp4GDWzC/dTereioQs46BB1c/81OW6BIrmBDGi
 Ok7HMnDhaH7Ga6dcpgcE4k2P159J9BpVE2DN58A=
X-Google-Smtp-Source: AA6agR66NZ7rDfyjmbpQ7yYcB/46Okb8EufurFg+WZz8akGLFEDuQNzGnHFeYNgnT0cCkTUGLl1katothjMXdq/rlyY=
X-Received: by 2002:ac2:4f03:0:b0:48b:2179:5249 with SMTP id
 k3-20020ac24f03000000b0048b21795249mr9595552lfr.356.1660064864845; Tue, 09
 Aug 2022 10:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220809164308.1182645-1-bmeng.cn@gmail.com>
 <20220809164308.1182645-2-bmeng.cn@gmail.com>
In-Reply-To: <20220809164308.1182645-2-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 9 Aug 2022 21:07:33 +0400
Message-ID: <CAJ+F1C+ZRPEdWZ8w8aRJxKpzuY6xW5yxDcthxNBMgF72hv_aZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] util/aio-win32: Correct the event array size in
 aio_poll()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000092c40305e5d1f891"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12a.google.com
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

--00000000000092c40305e5d1f891
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 9, 2022 at 8:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> WaitForMultipleObjects() can only wait for MAXIMUM_WAIT_OBJECTS
> object handles. Correct the event array size in aio_poll() and
> add a assert() to ensure it does not cause out of bound access.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
> Changes in v2:
> - change 'count' to unsigned
>
>  util/aio-win32.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/util/aio-win32.c b/util/aio-win32.c
> index 44003d645e..80cfe012ad 100644
> --- a/util/aio-win32.c
> +++ b/util/aio-win32.c
> @@ -326,9 +326,9 @@ void aio_dispatch(AioContext *ctx)
>  bool aio_poll(AioContext *ctx, bool blocking)
>  {
>      AioHandler *node;
> -    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
> +    HANDLE events[MAXIMUM_WAIT_OBJECTS];
>      bool progress, have_select_revents, first;
> -    int count;
> +    unsigned count;
>      int timeout;
>
>      /*
> @@ -369,6 +369,7 @@ bool aio_poll(AioContext *ctx, bool blocking)
>      QLIST_FOREACH_RCU(node, &ctx->aio_handlers, node) {
>          if (!node->deleted && node->io_notify
>              && aio_node_check(ctx, node->is_external)) {
> +            assert(count < MAXIMUM_WAIT_OBJECTS);
>              events[count++] =3D event_notifier_get_handle(node->e);
>          }
>      }
> --
> 2.34.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000092c40305e5d1f891
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 9, 2022 at 8:43 PM Bin Me=
ng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin Me=
ng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.meng=
@windriver.com</a>&gt;<br>
<br>
WaitForMultipleObjects() can only wait for MAXIMUM_WAIT_OBJECTS<br>
object handles. Correct the event array size in aio_poll() and<br>
add a assert() to ensure it does not cause out of bound access.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
Reviewed-by: Stefan Weil &lt;<a href=3D"mailto:sw@weilnetz.de" target=3D"_b=
lank">sw@weilnetz.de</a>&gt;<br></blockquote><div><br></div><div>lgtm</div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br></div><div>=C2=A0<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
Changes in v2:<br>
- change &#39;count&#39; to unsigned<br>
<br>
=C2=A0util/aio-win32.c | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/util/aio-win32.c b/util/aio-win32.c<br>
index 44003d645e..80cfe012ad 100644<br>
--- a/util/aio-win32.c<br>
+++ b/util/aio-win32.c<br>
@@ -326,9 +326,9 @@ void aio_dispatch(AioContext *ctx)<br>
=C2=A0bool aio_poll(AioContext *ctx, bool blocking)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0AioHandler *node;<br>
-=C2=A0 =C2=A0 HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];<br>
+=C2=A0 =C2=A0 HANDLE events[MAXIMUM_WAIT_OBJECTS];<br>
=C2=A0 =C2=A0 =C2=A0bool progress, have_select_revents, first;<br>
-=C2=A0 =C2=A0 int count;<br>
+=C2=A0 =C2=A0 unsigned count;<br>
=C2=A0 =C2=A0 =C2=A0int timeout;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
@@ -369,6 +369,7 @@ bool aio_poll(AioContext *ctx, bool blocking)<br>
=C2=A0 =C2=A0 =C2=A0QLIST_FOREACH_RCU(node, &amp;ctx-&gt;aio_handlers, node=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!node-&gt;deleted &amp;&amp; node-&gt=
;io_notify<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; aio_node_check(c=
tx, node-&gt;is_external)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(count &lt; MAXIMUM_WAIT_O=
BJECTS);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0events[count++] =3D event_n=
otifier_get_handle(node-&gt;e);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000092c40305e5d1f891--

