Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5004958DCD7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 19:10:05 +0200 (CEST)
Received: from localhost ([::1]:39060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSk0-0002ek-42
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 13:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oLSgi-0005sm-5B
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:06:40 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:36411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oLSgg-0002BU-Bt
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:06:39 -0400
Received: by mail-lj1-x230.google.com with SMTP id z20so13634821ljq.3
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 10:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=hXt0r2ySqLYwNrDIDLfCkKIXirAvimFsfgRu0x+1sVs=;
 b=eKjW1PDASQwO7QIoZ7ZCup+jJ09fhY/9u0T9yHVoOvVxty6MOx2vtudtVr5jp9KzdR
 zk3Gpga3w+CJNSC7ohqkVcy9tu0L1NhNRRsh1sxhIEqoKWTsGPn7jZ7ULoViaK/lOrMm
 ZBZR4YCbUfL3LKT++16iygojFlJrmkAKyYmyZD0QKthQT+8d9l8vAMTMk4lfnTrtw7+r
 awdRvmmqbUPp8DkJ60c+UBwnpG9+/y2P9vsbCg04DjveMIZ/mVwTdA+pfWDTqvzT36VN
 VtJBspfBgeVrVyMWGRZJClGIYiPinH2jC/Hu1hei536yUYgPXWEjEY9g0ze3XNC17cRl
 dGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=hXt0r2ySqLYwNrDIDLfCkKIXirAvimFsfgRu0x+1sVs=;
 b=6GJu3MchUqsrbEQFfgWZVAwSxjRIWglJefDOTCSeu0tAlPinDWaThmxgkR/T4CG7Ej
 3HgaUsqNSNPW8S/J+e2sai6PAUcbSXhg7sWZfdMlcbJInyQZ2MmZWCCaNAPoTMkZ2bvc
 lEExhhgSRIa5oC2t/05mUX8FA06QZhlL78CsOUeegdIMtowB7CqThlnfJltsIXAB95Lt
 wMlI28V+PsEC6cwn400ZnANuJeU1iWjnRzcLTfkjup6AQeLN8ym26pYH6BQ6wgBhhdOA
 mS619dA6L4KYHyVXNImejvnfF5Jsn+fD9lh2WO1pn4ldb7fDzwvdN7mkq8PQVJcp2bdl
 KuXw==
X-Gm-Message-State: ACgBeo1DxETTVa4MAaVRmrwOPU5LwXcZL+9K9UkRs85Jf3hSX1xoyKK4
 mGQ70VRXXeb+glsm+5ufSwi8++OMqHGzj1uequU=
X-Google-Smtp-Source: AA6agR5JO2k0x4mXmHCbFGTbdv3vle34SEtDS+SSNcdhMRkfiDzXX7jImiKcKBTxXG1xEjlFp43w5hEvAXyNMv8vJiY=
X-Received: by 2002:a2e:5455:0:b0:25e:4b87:9714 with SMTP id
 y21-20020a2e5455000000b0025e4b879714mr7098827ljd.463.1660064796141; Tue, 09
 Aug 2022 10:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220809164308.1182645-1-bmeng.cn@gmail.com>
In-Reply-To: <20220809164308.1182645-1-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 9 Aug 2022 21:06:24 +0400
Message-ID: <CAJ+F1C+KqH7Egr_9f=w=qn4AXVEgaGsZ0nmpHL08PfHaZJ4wzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] util/main-loop: Fix maximum number of wait objects
 for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007a6dbf05e5d1f427"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
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

--0000000000007a6dbf05e5d1f427
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 9, 2022 at 8:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> The maximum number of wait objects for win32 should be
> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
>
> Fix the logic in qemu_add_wait_object() to avoid adding
> the same HANDLE twice.
>
>
Please make that a separate patch.


> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> Changes in v2:
> - fix the logic in qemu_add_wait_object() to avoid adding
>   the same HANDLE twice
>
>
Still NACK, did you understand my argument about array bounds?

"if (found)" will access the arrays at position i+1 =3D=3D
MAXIMUM_WAIT_OBJECTS. We need the +1 for that logic to work without OOB
access.



>  util/main-loop.c | 43 +++++++++++++++++++++++++++++++------------
>  1 file changed, 31 insertions(+), 12 deletions(-)
>
> diff --git a/util/main-loop.c b/util/main-loop.c
> index f00a25451b..66b2ae2800 100644
> --- a/util/main-loop.c
> +++ b/util/main-loop.c
> @@ -363,37 +363,56 @@ void qemu_del_polling_cb(PollingFunc *func, void
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
>  static WaitObjects wait_objects =3D {0};
>
>  int qemu_add_wait_object(HANDLE handle, WaitObjectFunc *func, void
> *opaque)
>  {
> +    int i;
> +    bool found =3D false;
>      WaitObjects *w =3D &wait_objects;
> +
>      if (w->num >=3D MAXIMUM_WAIT_OBJECTS) {
>          return -1;
>      }
> -    w->events[w->num] =3D handle;
> -    w->func[w->num] =3D func;
> -    w->opaque[w->num] =3D opaque;
> -    w->revents[w->num] =3D 0;
> -    w->num++;
> +
> +    for (i =3D 0; i < w->num; i++) {
> +        /* if the same handle is added twice, newer overwrites older */
> +        if (w->events[i] =3D=3D handle) {
> +            found =3D true;
> +            break;
> +        }
> +    }
> +
> +    w->events[i] =3D handle;
> +    w->func[i] =3D func;
> +    w->opaque[i] =3D opaque;
> +    w->revents[i] =3D 0;
> +
> +    if (!found) {
> +        w->num++;
> +    }
> +
>      return 0;
>  }
>
>  void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void
> *opaque)
>  {
> -    int i, found;
> +    int i;
> +    bool found =3D false;
>      WaitObjects *w =3D &wait_objects;
>
> -    found =3D 0;
>      for (i =3D 0; i < w->num; i++) {
>          if (w->events[i] =3D=3D handle) {
> -            found =3D 1;
> +            found =3D true;
> +        }
> +        if (i =3D=3D MAXIMUM_WAIT_OBJECTS - 1) {
> +            break;
>          }
>          if (found) {
>              w->events[i] =3D w->events[i + 1];
> --
> 2.34.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007a6dbf05e5d1f427
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 9, 2022 at 8:43 PM Bin =
Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin =
Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.me=
ng@windriver.com</a>&gt;<br>
<br>
The maximum number of wait objects for win32 should be<br>
MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.<br>
<br>
Fix the logic in qemu_add_wait_object() to avoid adding<br>
the same HANDLE twice.<br>
<br></blockquote><div><br></div><div>Please make that a separate patch.</di=
v><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
- fix the logic in qemu_add_wait_object() to avoid adding<br>
=C2=A0 the same HANDLE twice<br>
<br></blockquote><div><br></div><div>Still NACK, did you understand my argu=
ment about array bounds?</div><div><br></div><div><span class=3D"gmail-im">=
 &quot;if (found)&quot; will access the arrays at position i+1 =3D=3D MAXIM=
UM_WAIT_OBJECTS. We need the +1 for that logic to work without OOB access.<=
br></span></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
=C2=A0util/main-loop.c | 43 +++++++++++++++++++++++++++++++------------<br>
=C2=A01 file changed, 31 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/util/main-loop.c b/util/main-loop.c<br>
index f00a25451b..66b2ae2800 100644<br>
--- a/util/main-loop.c<br>
+++ b/util/main-loop.c<br>
@@ -363,37 +363,56 @@ void qemu_del_polling_cb(PollingFunc *func, void *opa=
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
<br>
=C2=A0int qemu_add_wait_object(HANDLE handle, WaitObjectFunc *func, void *o=
paque)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 bool found =3D false;<br>
=C2=A0 =C2=A0 =C2=A0WaitObjects *w =3D &amp;wait_objects;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (w-&gt;num &gt;=3D MAXIMUM_WAIT_OBJECTS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 w-&gt;events[w-&gt;num] =3D handle;<br>
-=C2=A0 =C2=A0 w-&gt;func[w-&gt;num] =3D func;<br>
-=C2=A0 =C2=A0 w-&gt;opaque[w-&gt;num] =3D opaque;<br>
-=C2=A0 =C2=A0 w-&gt;revents[w-&gt;num] =3D 0;<br>
-=C2=A0 =C2=A0 w-&gt;num++;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; w-&gt;num; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if the same handle is added twice, newer ov=
erwrites older */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (w-&gt;events[i] =3D=3D handle) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 w-&gt;events[i] =3D handle;<br>
+=C2=A0 =C2=A0 w-&gt;func[i] =3D func;<br>
+=C2=A0 =C2=A0 w-&gt;opaque[i] =3D opaque;<br>
+=C2=A0 =C2=A0 w-&gt;revents[i] =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 if (!found) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 w-&gt;num++;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *=
opaque)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int i, found;<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 bool found =3D false;<br>
=C2=A0 =C2=A0 =C2=A0WaitObjects *w =3D &amp;wait_objects;<br>
<br>
-=C2=A0 =C2=A0 found =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; w-&gt;num; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (w-&gt;events[i] =3D=3D handle) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D MAXIMUM_WAIT_OBJECTS - 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (found) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w-&gt;events[i] =3D w-&gt;e=
vents[i + 1];<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007a6dbf05e5d1f427--

