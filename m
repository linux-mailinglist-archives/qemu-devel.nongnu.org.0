Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B37B58659C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 09:25:57 +0200 (CEST)
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIPoJ-0001ti-LH
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 03:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIPhv-0006UT-SG
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:19:20 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:33444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oIPhu-000756-92
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:19:19 -0400
Received: by mail-lf1-x12e.google.com with SMTP id e15so5887762lfs.0
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 00:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pydFCMdJNFvTGhKm7qB7/+GrJc/+WT2/HQEZ+m7Z1rs=;
 b=gklLlzHL7+mJsrX3DIMxIgWfD7s7xbUCakkWNLRNC6waHl2XXOVxqbnuIVnjUXESXL
 APbq4l1w9ATruDeIQP4yBFznM4r7kuGUfkj5ncTLkX7iWIm/F75xIbKM7/n0w2LZ+dZ5
 lnWEX4SlRRoZ73aFQqbrfsPdie7ZluIFXd7GBjIee6Sr+Kd2RbC27g5HGbCALehhz/ch
 exOwwOfqckcVUL+nvOn2uOtJLLeIxC9VXRYgqkJ2r3CqXO4xVt3vz6PkR8YAM4CLoetI
 Ormhj3iZfRB9jRSI8IpTUeGXyuVtLeRCsjry9vqyOdjXK1+h3mwBS0tJSvGxEocXW6iH
 g0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pydFCMdJNFvTGhKm7qB7/+GrJc/+WT2/HQEZ+m7Z1rs=;
 b=xfoTliZQKFyabRxjzVsgxbrjIj3/cX5zt6R1eP2f7sdcTlYGHMdOke2/Yznghjtw4L
 YRqZRgXR///kZMIvrppF0oiqZ3yzdzrjMiLVrIur3q+igaXOwVurowkhZgJ0cp4/+FXr
 gpjkGLyYSD9/2/Q4bcis/0+JJI08wJOc3xOa6Mi1fVp3YWXIMkFXitWnjzkt+kyxXKiJ
 PVoiORccDA3Jk/oON37apm43k08yu1ZV9TCmmd8b/BG6tsATw/HE1a/OFWf9LxvTciV8
 KZGa1bPbSdffGiETgFZEJLZxdQ4modjeeChNkzQwjxwlA4869SbF2IxlB+jLd0BWNPFQ
 cxIw==
X-Gm-Message-State: AJIora93NJYG6b40TTI10++j4g82SwHD/dp8zK8iAtrJmVDCLIoDOnIz
 ISBvQawamdKRnL0s9FSypCWg+7v5pqVgCLuylKo=
X-Google-Smtp-Source: AGRyM1srarmZUfCPvo5vdJBJOCW/YZiKu6XnFvmESITicO10fTIyHWk2RYKyZQdLcvRrqSazkniX0tTr6pu+9WaLENI=
X-Received: by 2002:a05:6512:3f19:b0:48a:874f:534 with SMTP id
 y25-20020a0565123f1900b0048a874f0534mr5058902lfa.446.1659338355991; Mon, 01
 Aug 2022 00:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220730145036.865854-1-bmeng.cn@gmail.com>
 <20220730145036.865854-4-bmeng.cn@gmail.com>
In-Reply-To: <20220730145036.865854-4-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 1 Aug 2022 11:19:04 +0400
Message-ID: <CAJ+F1CK7_tme4Fqjropmiw3pARTR8g-HTPOWTgPtCqaRPN2Pcw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] chardev/char-socket: Update AF_UNIX for Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004568fc05e528d1f9"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
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

--0000000000004568fc05e528d1f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sat, Jul 30, 2022 at 6:54 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bin.meng@windriver.com>
>
> Now that AF_UNIX has come to Windows, update the existing logic in
> qemu_chr_compute_filename() and qmp_chardev_open_socket() for Windows.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - drop #include <afunix.h> as it is now already included in osdep.h
>
>  chardev/char-socket.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index dc4e218eeb..14a56b7b13 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -557,7 +557,7 @@ static char *qemu_chr_compute_filename(SocketChardev
> *s)
>      const char *left =3D "", *right =3D "";
>
>      switch (ss->ss_family) {
> -#ifndef _WIN32
> +#ifdef CONFIG_AF_UNIX
>      case AF_UNIX:
>          return g_strdup_printf("unix:%s%s",
>                                 ((struct sockaddr_un *)(ss))->sun_path,
> @@ -1372,10 +1372,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
>      }
>
>      qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_RECONNECTABLE);
> +#ifndef _WIN32
>      /* TODO SOCKET_ADDRESS_FD where fd has AF_UNIX */
>      if (addr->type =3D=3D SOCKET_ADDRESS_TYPE_UNIX) {
>          qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
>      }
> +#endif
>
>
With the fallback for afunix.h header on windows, we can enable various
code paths with AF_UNIX, without condition.



--=20
Marc-Andr=C3=A9 Lureau

--0000000000004568fc05e528d1f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 30, 2022 at 6:54 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Bin=
 Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" target=3D"_blank">bin.m=
eng@windriver.com</a>&gt;<br>
<br>
Now that AF_UNIX has come to Windows, update the existing logic in<br>
qemu_chr_compute_filename() and qmp_chardev_open_socket() for Windows.<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver.com" targe=
t=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
<br>
(no changes since v2)<br>
<br>
Changes in v2:<br>
- drop #include &lt;afunix.h&gt; as it is now already included in osdep.h<b=
r>
<br>
=C2=A0chardev/char-socket.c | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
index dc4e218eeb..14a56b7b13 100644<br>
--- a/chardev/char-socket.c<br>
+++ b/chardev/char-socket.c<br>
@@ -557,7 +557,7 @@ static char *qemu_chr_compute_filename(SocketChardev *s=
)<br>
=C2=A0 =C2=A0 =C2=A0const char *left =3D &quot;&quot;, *right =3D &quot;&qu=
ot;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (ss-&gt;ss_family) {<br>
-#ifndef _WIN32<br>
+#ifdef CONFIG_AF_UNIX<br>
=C2=A0 =C2=A0 =C2=A0case AF_UNIX:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return g_strdup_printf(&quot;unix:%s%s&qu=
ot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((struct sockaddr_un *)(ss))-&gt;sun=
_path,<br>
@@ -1372,10 +1372,12 @@ static void qmp_chardev_open_socket(Chardev *chr,<b=
r>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_RECONNECTAB=
LE);<br>
+#ifndef _WIN32<br>
=C2=A0 =C2=A0 =C2=A0/* TODO SOCKET_ADDRESS_FD where fd has AF_UNIX */<br>
=C2=A0 =C2=A0 =C2=A0if (addr-&gt;type =3D=3D SOCKET_ADDRESS_TYPE_UNIX) {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_chr_set_feature(chr, QEMU_CHAR_FEATU=
RE_FD_PASS);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+#endif<br>
<br></blockquote><div><br></div><div>With the fallback for afunix.h header =
on windows, we can enable various code paths with AF_UNIX, without conditio=
n.</div><br></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000004568fc05e528d1f9--

