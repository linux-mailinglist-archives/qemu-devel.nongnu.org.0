Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F320B5B1949
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 11:52:04 +0200 (CEST)
Received: from localhost ([::1]:53124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWECa-0002Ta-4l
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 05:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWE6r-00051z-8P; Thu, 08 Sep 2022 05:46:09 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:42969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oWE6p-0004rS-6J; Thu, 08 Sep 2022 05:46:08 -0400
Received: by mail-lf1-x135.google.com with SMTP id m15so7113569lfl.9;
 Thu, 08 Sep 2022 02:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=H2Zd6vqebvLqPUZbl3UdxSrtAGa9MmlIpaTEE2CylM0=;
 b=cPML+462G4QHD3iZYrVnVy6bDWmDfD3T1jFqNaNbzW+n7vooX6h4DIUNa2iAUC3VOn
 dTxrIFR+aturBIpn5CLaFhGDrXiIa2tJac/R2xOWlvUWz9sPMizc4M+Oj263ER8ZCwuk
 E4fPZj3qrnABdvKu92f8ieU+uwubjZWVP21oBMdcTRqCgsAuTTgX5QJnZXozZ5ZVNSeL
 OJtpZa3Sy+5IgZ9Ic+x+6C9qn7XEoDE9gxrdf7dDEsM3ohU3B3Ga8GpKAkp6KzsyInP+
 cYTT1Ybqkkj6Y8RlUJ3FFZ+U0KbMCM7rwBt/gkOLQPZbpN68+/gGywfZr3hRwVfcX3Cv
 WBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=H2Zd6vqebvLqPUZbl3UdxSrtAGa9MmlIpaTEE2CylM0=;
 b=ofQTzKhLS11iuYKczGs/FuFyQz6Ng+TMDMSOBjT8nxmbgNjALXh1fm2Oai7HXLbFMk
 JNyZQTWsLyQnWjC3QR6sNMYWSBQg8YaROlhEoXAyoF8L3L3KJwh+jzAkLR0NHjYwD94S
 McVOOcltc1LFdSe8aMA1cMo+OTTmmSYhMs7FFL+OkFb+N15jhRm7W+qaSnVoXIPKIjNe
 MyN76ZTAIsu0mcbkra66RYmSy1guAauvDL2qUneUbX7UiRS78ZEzcVh4l4sYo2gAeE01
 y9M1MYNrbkWq387eXvhR3iTLH3nnNlITrn9YYpYip7N3bYDtOA9jE3rAHxpoNjr1Xlss
 ePjg==
X-Gm-Message-State: ACgBeo1HJHjiRZtZShl6oxkTOreIQ70dF6JkRIGkdG+r84eMnaj4es+k
 GELJ1/bJXCU4whrpWOridsDd8pe74Xd/LoCg1lM=
X-Google-Smtp-Source: AA6agR4WiIwWFMI7OFwnjM3aqKuj1V4e3tCXXv/nEGGlxgmU3FsyuJFndC09mMKSXAZ6OiBL0cXFr2Mk+KltXfO6tEo=
X-Received: by 2002:a05:6512:201b:b0:497:a29d:25c1 with SMTP id
 a27-20020a056512201b00b00497a29d25c1mr2601183lfb.276.1662630365202; Thu, 08
 Sep 2022 02:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220906194755.98090-1-arwed.meyer@gmx.de>
 <20220906194755.98090-3-arwed.meyer@gmx.de>
In-Reply-To: <20220906194755.98090-3-arwed.meyer@gmx.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Sep 2022 13:45:53 +0400
Message-ID: <CAJ+F1CK0yOFbYRC1NY_3ZT_HYh+_kdPNBV=f1m85dXQJMnuXhQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] chardev: src buffer const for write functions
To: Arwed Meyer <arwed.meyer@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Content-Type: multipart/alternative; boundary="0000000000004f8cce05e8274cbd"
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

--0000000000004f8cce05e8274cbd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi


On Wed, Sep 7, 2022 at 2:05 AM Arwed Meyer <arwed.meyer@gmx.de> wrote:

> Make source buffers const for char be write functions.
> This allows using buffers returned by fifo as buf parameter and source
> buffer
> should not be changed by write functions anyway.
>
> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  chardev/char.c          | 4 ++--
>  include/chardev/char.h  | 4 ++--
>  include/sysemu/replay.h | 2 +-
>  replay/replay-char.c    | 2 +-
>  stubs/replay-tools.c    | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index 0169d8dde4..b005df3ccf 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -193,7 +193,7 @@ int qemu_chr_be_can_write(Chardev *s)
>      return be->chr_can_read(be->opaque);
>  }
>
> -void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, int len)
> +void qemu_chr_be_write_impl(Chardev *s, const uint8_t *buf, int len)
>  {
>      CharBackend *be =3D s->be;
>
> @@ -202,7 +202,7 @@ void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf,
> int len)
>      }
>  }
>
> -void qemu_chr_be_write(Chardev *s, uint8_t *buf, int len)
> +void qemu_chr_be_write(Chardev *s, const uint8_t *buf, int len)
>  {
>      if (qemu_chr_replay(s)) {
>          if (replay_mode =3D=3D REPLAY_MODE_PLAY) {
> diff --git a/include/chardev/char.h b/include/chardev/char.h
> index a319b5fdff..44cd82e405 100644
> --- a/include/chardev/char.h
> +++ b/include/chardev/char.h
> @@ -186,7 +186,7 @@ int qemu_chr_be_can_write(Chardev *s);
>   * the caller should call @qemu_chr_be_can_write to determine how much
> data
>   * the front end can currently accept.
>   */
> -void qemu_chr_be_write(Chardev *s, uint8_t *buf, int len);
> +void qemu_chr_be_write(Chardev *s, const uint8_t *buf, int len);
>
>  /**
>   * qemu_chr_be_write_impl:
> @@ -195,7 +195,7 @@ void qemu_chr_be_write(Chardev *s, uint8_t *buf, int
> len);
>   *
>   * Implementation of back end writing. Used by replay module.
>   */
> -void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, int len);
> +void qemu_chr_be_write_impl(Chardev *s, const uint8_t *buf, int len);
>
>  /**
>   * qemu_chr_be_update_read_handlers:
> diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
> index 73dee9ccdf..7ec0882b50 100644
> --- a/include/sysemu/replay.h
> +++ b/include/sysemu/replay.h
> @@ -198,7 +198,7 @@ uint64_t blkreplay_next_id(void);
>  /*! Registers char driver to save it's events */
>  void replay_register_char_driver(struct Chardev *chr);
>  /*! Saves write to char device event to the log */
> -void replay_chr_be_write(struct Chardev *s, uint8_t *buf, int len);
> +void replay_chr_be_write(struct Chardev *s, const uint8_t *buf, int len)=
;
>  /*! Writes char write return value to the replay log. */
>  void replay_char_write_event_save(int res, int offset);
>  /*! Reads char write return value from the replay log. */
> diff --git a/replay/replay-char.c b/replay/replay-char.c
> index d2025948cf..a31aded032 100644
> --- a/replay/replay-char.c
> +++ b/replay/replay-char.c
> @@ -48,7 +48,7 @@ void replay_register_char_driver(Chardev *chr)
>      char_drivers[drivers_count++] =3D chr;
>  }
>
> -void replay_chr_be_write(Chardev *s, uint8_t *buf, int len)
> +void replay_chr_be_write(Chardev *s, const uint8_t *buf, int len)
>  {
>      CharEvent *event =3D g_new0(CharEvent, 1);
>
> diff --git a/stubs/replay-tools.c b/stubs/replay-tools.c
> index f2e72bb225..3e8ca3212d 100644
> --- a/stubs/replay-tools.c
> +++ b/stubs/replay-tools.c
> @@ -53,7 +53,7 @@ void replay_register_char_driver(struct Chardev *chr)
>  {
>  }
>
> -void replay_chr_be_write(struct Chardev *s, uint8_t *buf, int len)
> +void replay_chr_be_write(struct Chardev *s, const uint8_t *buf, int len)
>  {
>      abort();
>  }
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000004f8cce05e8274cbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 7, 2022 at 2:05 AM Arwe=
d Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de" target=3D"_blank">arwed.m=
eyer@gmx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Make source buffers const for char be write functions.<br>
This allows using buffers returned by fifo as buf parameter and source buff=
er<br>
should not be changed by write functions anyway.<br>
<br>
Signed-off-by: Arwed Meyer &lt;<a href=3D"mailto:arwed.meyer@gmx.de" target=
=3D"_blank">arwed.meyer@gmx.de</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</div><div=
> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0include/chardev/char.h=C2=A0 | 4 ++--<br>
=C2=A0include/sysemu/replay.h | 2 +-<br>
=C2=A0replay/replay-char.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0stubs/replay-tools.c=C2=A0 =C2=A0 | 2 +-<br>
=C2=A05 files changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index 0169d8dde4..b005df3ccf 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -193,7 +193,7 @@ int qemu_chr_be_can_write(Chardev *s)<br>
=C2=A0 =C2=A0 =C2=A0return be-&gt;chr_can_read(be-&gt;opaque);<br>
=C2=A0}<br>
<br>
-void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, int len)<br>
+void qemu_chr_be_write_impl(Chardev *s, const uint8_t *buf, int len)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CharBackend *be =3D s-&gt;be;<br>
<br>
@@ -202,7 +202,7 @@ void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, i=
nt len)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-void qemu_chr_be_write(Chardev *s, uint8_t *buf, int len)<br>
+void qemu_chr_be_write(Chardev *s, const uint8_t *buf, int len)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (qemu_chr_replay(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (replay_mode =3D=3D REPLAY_MODE_PLAY) =
{<br>
diff --git a/include/chardev/char.h b/include/chardev/char.h<br>
index a319b5fdff..44cd82e405 100644<br>
--- a/include/chardev/char.h<br>
+++ b/include/chardev/char.h<br>
@@ -186,7 +186,7 @@ int qemu_chr_be_can_write(Chardev *s);<br>
=C2=A0 * the caller should call @qemu_chr_be_can_write to determine how muc=
h data<br>
=C2=A0 * the front end can currently accept.<br>
=C2=A0 */<br>
-void qemu_chr_be_write(Chardev *s, uint8_t *buf, int len);<br>
+void qemu_chr_be_write(Chardev *s, const uint8_t *buf, int len);<br>
<br>
=C2=A0/**<br>
=C2=A0 * qemu_chr_be_write_impl:<br>
@@ -195,7 +195,7 @@ void qemu_chr_be_write(Chardev *s, uint8_t *buf, int le=
n);<br>
=C2=A0 *<br>
=C2=A0 * Implementation of back end writing. Used by replay module.<br>
=C2=A0 */<br>
-void qemu_chr_be_write_impl(Chardev *s, uint8_t *buf, int len);<br>
+void qemu_chr_be_write_impl(Chardev *s, const uint8_t *buf, int len);<br>
<br>
=C2=A0/**<br>
=C2=A0 * qemu_chr_be_update_read_handlers:<br>
diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h<br>
index 73dee9ccdf..7ec0882b50 100644<br>
--- a/include/sysemu/replay.h<br>
+++ b/include/sysemu/replay.h<br>
@@ -198,7 +198,7 @@ uint64_t blkreplay_next_id(void);<br>
=C2=A0/*! Registers char driver to save it&#39;s events */<br>
=C2=A0void replay_register_char_driver(struct Chardev *chr);<br>
=C2=A0/*! Saves write to char device event to the log */<br>
-void replay_chr_be_write(struct Chardev *s, uint8_t *buf, int len);<br>
+void replay_chr_be_write(struct Chardev *s, const uint8_t *buf, int len);<=
br>
=C2=A0/*! Writes char write return value to the replay log. */<br>
=C2=A0void replay_char_write_event_save(int res, int offset);<br>
=C2=A0/*! Reads char write return value from the replay log. */<br>
diff --git a/replay/replay-char.c b/replay/replay-char.c<br>
index d2025948cf..a31aded032 100644<br>
--- a/replay/replay-char.c<br>
+++ b/replay/replay-char.c<br>
@@ -48,7 +48,7 @@ void replay_register_char_driver(Chardev *chr)<br>
=C2=A0 =C2=A0 =C2=A0char_drivers[drivers_count++] =3D chr;<br>
=C2=A0}<br>
<br>
-void replay_chr_be_write(Chardev *s, uint8_t *buf, int len)<br>
+void replay_chr_be_write(Chardev *s, const uint8_t *buf, int len)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CharEvent *event =3D g_new0(CharEvent, 1);<br>
<br>
diff --git a/stubs/replay-tools.c b/stubs/replay-tools.c<br>
index f2e72bb225..3e8ca3212d 100644<br>
--- a/stubs/replay-tools.c<br>
+++ b/stubs/replay-tools.c<br>
@@ -53,7 +53,7 @@ void replay_register_char_driver(struct Chardev *chr)<br>
=C2=A0{<br>
=C2=A0}<br>
<br>
-void replay_chr_be_write(struct Chardev *s, uint8_t *buf, int len)<br>
+void replay_chr_be_write(struct Chardev *s, const uint8_t *buf, int len)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0abort();<br>
=C2=A0}<br>
--<br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--0000000000004f8cce05e8274cbd--

