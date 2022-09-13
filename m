Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01E25B6B3C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 11:58:24 +0200 (CEST)
Received: from localhost ([::1]:33980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY2gR-00034c-TM
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 05:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oY2aM-00072x-W0
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:52:10 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:39673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oY2aK-00086B-Tm
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 05:52:06 -0400
Received: by mail-lj1-x236.google.com with SMTP id bn9so13686397ljb.6
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 02:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=g2f3X6fo77METaWztrnr+4+XZ+dMZ1kluh6RyL7TYu0=;
 b=DS2OJzYYL3DMsb3NyqRjLeS/xDiKFRKKyb4vA85TvprsfSzkZZcAzZZrAW5J0ygUAQ
 wyAAxFX+PNCwPhZysDWzhEXutudeXWIcR7iFaNQsEj3p3vTdGSut+6DZgvjN9/K5siR+
 yLuepoWBzOV3FsVXP/QWTK0ChH7ao8HcK5FM6pBrXcGBR9WkRMXY4ANXGZGNJRlev2zG
 JTmK7UFV7SgUPJWsrPdjEtToVOiBTLlW7tDdAVHsKt4mXBZjXiRWjayAVqyQiKbhZ19Z
 Zodj5lX9sLXSDj+COjvyqB+TtlH2Gaw2auQtenPpmPMY17kcTBmfCppA6MvJC19mQ4yI
 H5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=g2f3X6fo77METaWztrnr+4+XZ+dMZ1kluh6RyL7TYu0=;
 b=r8DqTvnwr998vRzaclqJYc3Fe6r+5iB05iy8EJuV0fLots4F7jsGTWcWVMQi4j4tyL
 Lopk5RwtlWcscxw1c0SEdkLyu63Wxf7E05N+cyfIXX2ufFzCmVQOVo9sbcC2/jPedkeU
 ub5irKFjuyPXNDDdw+K1nvrRGcgDuQ2MTaVsJXyLIFm58JQUTSDLKTNHTAHDSRqTkT1X
 yzuojSK1jomzYqwggQEy5h5wGHwCXvkIs/q2BkuySQ7ZNDaD0CyVnTOxHuFgSCKdg2mW
 3wJAJtTZ3h4YpE9oqm3vOE6CEf4Qj2Wlhq7RSxT9HLTFRuDBllQ3Ff2AkrPNyQ1kAQ9P
 Oy/g==
X-Gm-Message-State: ACgBeo3v8/7tLULDzjNHzGpvRgeHrw2pdRUy2EyBD38JSz2mNJ6iZSye
 W2mnuWZjOPwKWYW43HTPc+VRY0voIbkXO3fjr6Y=
X-Google-Smtp-Source: AA6agR6xhynkz8Uih27DOm+RnNhP39Qx7dXavorra15cRuhMNA996gfLjOn4MvNcJRLWaZQnRKYl7E1WSPR0Q9QouoY=
X-Received: by 2002:a2e:a789:0:b0:267:917b:401b with SMTP id
 c9-20020a2ea789000000b00267917b401bmr9468239ljf.452.1663062722334; Tue, 13
 Sep 2022 02:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
In-Reply-To: <20220824085231.1630804-1-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 13 Sep 2022 13:51:50 +0400
Message-ID: <CAJ+F1CKjLyV4HJKQ7fWXgzHq6t9yFMA+s6Afwk-tv1Nq806V2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] util/main-loop: Fix maximum number of wait objects
 for win32
To: Bin Meng <bmeng.cn@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000cdd4ea05e88bf6e6"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x236.google.com
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

--000000000000cdd4ea05e88bf6e6
Content-Type: text/plain; charset="UTF-8"

Hi

On Wed, Aug 24, 2022 at 12:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> The maximum number of wait objects for win32 should be
> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v3:
> - move the check of adding the same HANDLE twice to a separete patch
>
> Changes in v2:
> - fix the logic in qemu_add_wait_object() to avoid adding
>   the same HANDLE twice
>
>  util/main-loop.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/util/main-loop.c b/util/main-loop.c
> index f00a25451b..cb018dc33c 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, void
> *opaque)
>  /* Wait objects support */
>  typedef struct WaitObjects {
>      int num;
> -    int revents[MAXIMUM_WAIT_OBJECTS + 1];
> -    HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];
> -    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];
> -    void *opaque[MAXIMUM_WAIT_OBJECTS + 1];
> +    int revents[MAXIMUM_WAIT_OBJECTS];
> +    HANDLE events[MAXIMUM_WAIT_OBJECTS];
> +    WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];
> +    void *opaque[MAXIMUM_WAIT_OBJECTS];
>  } WaitObjects;
>
>  static WaitObjects wait_objects = {0};
> @@ -395,6 +395,9 @@ void qemu_del_wait_object(HANDLE handle,
> WaitObjectFunc *func, void *opaque)
>          if (w->events[i] == handle) {
>              found = 1;
>          }
> +        if (i == MAXIMUM_WAIT_OBJECTS - 1) {
> +            break;
> +        }
>

hmm


>          if (found) {
>              w->events[i] = w->events[i + 1];
>              w->func[i] = w->func[i + 1];
>

The way deletion works is by moving the i+1 element (which is always zeroed
for i == MAXIMUM_WAIT_OBJECTS) to i.

After your patch, for i == MAXIMUM_WAIT_OBJECTS, we no longer clear the
last value, and instead rely simply on updated w->num:

    if (found) {
        w->num--;
    }

 So your patch looks ok to me, but I prefer the current code.

Paolo, what do you say?

--000000000000cdd4ea05e88bf6e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 24, 2022 at 12:52 PM Bi=
n Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bi=
n Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.=
meng@windriver.com</a>&gt;<br>
<br>
The maximum number of wait objects for win32 should be<br>
MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
Changes in v3:<br>
- move the check of adding the same HANDLE twice to a separete patch<br>
<br>
Changes in v2:<br>
- fix the logic in qemu_add_wait_object() to avoid adding<br>
=C2=A0 the same HANDLE twice<br>
<br>
=C2=A0util/main-loop.c | 11 +++++++----<br>
=C2=A01 file changed, 7 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/util/main-loop.c b/util/main-loop.c<br>
index f00a25451b..cb018dc33c 100644<br>
--- a/util/main-loop.c<br>
+++ b/util/main-loop.c<br>
@@ -363,10 +363,10 @@ void qemu_del_polling_cb(PollingFunc *func, void *opa=
que)<br>
=C2=A0/* Wait objects support */<br>
=C2=A0typedef struct WaitObjects {<br>
=C2=A0 =C2=A0 =C2=A0int num;<br>
-=C2=A0 =C2=A0 int revents[MAXIMUM_WAIT_OBJECTS + 1];<br>
-=C2=A0 =C2=A0 HANDLE events[MAXIMUM_WAIT_OBJECTS + 1];<br>
-=C2=A0 =C2=A0 WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS + 1];<br>
-=C2=A0 =C2=A0 void *opaque[MAXIMUM_WAIT_OBJECTS + 1];<br>
+=C2=A0 =C2=A0 int revents[MAXIMUM_WAIT_OBJECTS];<br>
+=C2=A0 =C2=A0 HANDLE events[MAXIMUM_WAIT_OBJECTS];<br>
+=C2=A0 =C2=A0 WaitObjectFunc *func[MAXIMUM_WAIT_OBJECTS];<br>
+=C2=A0 =C2=A0 void *opaque[MAXIMUM_WAIT_OBJECTS];<br>
=C2=A0} WaitObjects;<br>
<br>
=C2=A0static WaitObjects wait_objects =3D {0};<br>
@@ -395,6 +395,9 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectFunc=
 *func, void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (w-&gt;events[i] =3D=3D handle) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D MAXIMUM_WAIT_OBJECTS - 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><div><br></div>hmm</div><div=
 class=3D"gmail_quote">=C2=A0<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (found) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w-&gt;events[i] =3D w-&gt;e=
vents[i + 1];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w-&gt;func[i] =3D w-&gt;fun=
c[i + 1];<br></blockquote><div><br></div><div><div>The way deletion works i=
s by moving the i+1 element (which is always zeroed for i =3D=3D MAXIMUM_WA=
IT_OBJECTS) to i.<br></div><div><br></div><div>After your patch, for i =3D=
=3D MAXIMUM_WAIT_OBJECTS, we no longer clear the last value, and instead re=
ly simply on updated w-&gt;num:<br></div><div><br></div><div>=C2=A0 =C2=A0 =
if (found) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 w-&gt;num--;<br>=C2=A0 =C2=A0 }=
</div><div><br></div>=C2=A0So your patch looks ok to me, but I prefer the c=
urrent code.</div><div><br></div><div>Paolo, what do you say?<br></div></di=
v></div>

--000000000000cdd4ea05e88bf6e6--

