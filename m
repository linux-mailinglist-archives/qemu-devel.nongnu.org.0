Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA5058D948
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 15:18:49 +0200 (CEST)
Received: from localhost ([::1]:53772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLP8B-0002vk-QM
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 09:18:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oLP4n-0001Id-35
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 09:15:17 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:45639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oLP4l-00069f-ER
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 09:15:16 -0400
Received: by mail-lf1-x135.google.com with SMTP id a9so16901527lfm.12
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 06:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=KS8CPPNvnE7AcoqEhDzUugOt/1MaqcfbDpqQDtB6wYU=;
 b=a+jQasRET2OENoqSJ/BdGSWBIkKBCiDXSG0g6V7Q0il430Ak8QArQlrtTOF3XjjdbN
 7WxmFPxlxyv/82HJIqpzequn38iyp9Ps8Junkf3vIQbQt2GeznaxZWXqJok5BesKydGU
 6hiLdhOrzAaWjIG0s0uzILM8U+4LaugGFc9eGWzut9CZnI5zWebCnJJCQTk/RTqbtp1q
 Qrx8Dtn/gtpCbO6lgJ71mLN1gqPzCSNuMQdrnlFrJ53Zslnd75nvjJ81S0ruveIH7lIJ
 P8kUupeiSNd7RhfMtBkmT1LPDTSD7rp34WhBgmUkFjykaEJ3HlGEZftcXy0WzrQErsp+
 p4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=KS8CPPNvnE7AcoqEhDzUugOt/1MaqcfbDpqQDtB6wYU=;
 b=jaHzL1FH62KPXrmTr+yXP5y6D9JnCQmL0G9CT4ZNV67NTLf5hFS/1LrJHBFqWinbd7
 TwrsAwNOooPoloa3H4Wgoe89ZX/CoodrqqS+dgKADrmcCPZcGGUx36QzpRxhytc7BpjA
 H5IJ4ohxWZaj8K2yELM3hy5LpZ01Axo2v9tkAUBcPOzlHJ9+BmuMDF8Yife1hb+btIuM
 eBocGlzirNzz6yugyvRvjSfFw6rigviwIg6vYo9khQaLBr0f6ikVgH+vAizBc4E+5wlv
 1a5O4wqjiV0Lzq9RS2uC0uz2Q6NUICtUHeKGiy7JK02Vq3jUbX1/Z7Zrqwn4A1LGEF/y
 WV0A==
X-Gm-Message-State: ACgBeo3WGNCa1j1rmjHx6qU0FrzvdVvNG9fRuYvxXyqMn/tu3IbNhBfC
 D76gS2L3FVT32reuwl5bCzqtcM3sCsuFuI1Oyy4=
X-Google-Smtp-Source: AA6agR4kFpBOKa44Mso09thzGqS0g0tw/AF9mguDdzqjAI4TNNSqlZgQUakvwJdI4Zt8BoE9A3BO53aDIdmvzZfvH9s=
X-Received: by 2002:a05:6512:2306:b0:48b:2905:21a8 with SMTP id
 o6-20020a056512230600b0048b290521a8mr8820609lfu.167.1660050913047; Tue, 09
 Aug 2022 06:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220805145617.952881-1-bmeng.cn@gmail.com>
In-Reply-To: <20220805145617.952881-1-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 9 Aug 2022 17:15:01 +0400
Message-ID: <CAJ+F1CK5Di14cxc8t67bw9hyCoqWKz62m6j-m4OMqh31trrW=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] util/main-loop: Fix maximum number of wait objects
 for win32
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fb397505e5ceb836"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x135.google.com
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

--000000000000fb397505e5ceb836
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Aug 5, 2022 at 6:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> The maximum number of wait objects for win32 should be
> MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>

Nack,

if wait_objects.num reaches MAXIMUM_WAIT_OBJECTS,

then qemu_del_wait_object() will iterate up to it, and then the branch "if
(found)" will access the arrays at position i+1 =3D=3D MAXIMUM_WAIT_OBJECTS=
.

Note that the add functions should probably learn to avoid adding the same
HANDLE twice, otherwise del is a bit broken.

---
>
>  util/main-loop.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/util/main-loop.c b/util/main-loop.c
> index f00a25451b..f15d8e7d12 100644
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
>  static WaitObjects wait_objects =3D {0};
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000fb397505e5ceb836
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, Aug 5, 2022 at 6:57 PM Bin Meng &lt;<a href=3D"ma=
ilto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div>From: Bin Meng &lt;<a href=
=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.meng@windriver.com=
</a>&gt;<br>
<br>
The maximum number of wait objects for win32 should be<br>
MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.<br>
<br></div>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br></blockquote></div><div clas=
s=3D"gmail_quote"><div><br></div><div>Nack,</div><div><br></div><div>if wai=
t_objects.num reaches MAXIMUM_WAIT_OBJECTS,</div><div><br></div><div>then q=
emu_del_wait_object() will iterate up to it, and then the branch &quot;if (=
found)&quot; will access the arrays at position i+1 =3D=3D MAXIMUM_WAIT_OBJ=
ECTS.</div><div><br></div><div>Note that the add functions should probably =
learn to avoid adding the same HANDLE twice, otherwise del is a bit broken.=
<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
<br>
=C2=A0util/main-loop.c | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/util/main-loop.c b/util/main-loop.c<br>
index f00a25451b..f15d8e7d12 100644<br>
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
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000fb397505e5ceb836--

