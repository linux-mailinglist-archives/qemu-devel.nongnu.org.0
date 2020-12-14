Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B03B2D93C7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 09:06:44 +0100 (CET)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koisU-0001Co-SE
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 03:06:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1koirE-0000aX-U2; Mon, 14 Dec 2020 03:05:24 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1koirC-0000SO-B7; Mon, 14 Dec 2020 03:05:24 -0500
Received: by mail-ej1-x644.google.com with SMTP id x16so21243528ejj.7;
 Mon, 14 Dec 2020 00:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TiB2F/QWVAlfD2IsKZXhLFiZ75QHq0FFdQ/Lizli0g0=;
 b=F315ig/6/Gu7lB+D3/eCEGRGZzsyMTap3fAtk2tQ6P6Vkm6DEJK15FNnVvp+jcjujD
 liTiZGjVI7uNM6WbG2ZYdCjObA9P6KKY9/b0f59rKrPIkStxpyIh/NncDp242+VgBmvd
 /KJlqgHxBNhrr4y/RVZyDMBjYn2aU3JMZa0J7xmyhVvBe9crJTCIjg39wsbnTFBgl89J
 nWn7w83o/TFQhoXB313BkvWEgzVRDFgSWDBGg83JL/JbTKtsOexswDFm/K2wTqOyRCCv
 MqIzh6tZuacUZEokI5s1Wwx9/4kNP8vr4/csavrGM9gm61kIO19ZHdpjQXH9ueNQNxXN
 /lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TiB2F/QWVAlfD2IsKZXhLFiZ75QHq0FFdQ/Lizli0g0=;
 b=F6Ku3WZAGrg2kb/M7JlB48iq93TIHZodfv5hkCeVXK5TnHh0Vcs5yS/PQPRmdLqQFx
 LpDuV1DIOPRfUiyz9pLQqNzvDc6b21bUc33pgDUo1HQL2AzM8ZPJjBPxNrFbNZ+mX9O6
 h3H1Q2UBBtcnPCGpQ39LCN38n76IKM244ZOHEa0B7i0T9fTWGePiYmq+NTn1MRHOMsZA
 y5mHE2xl2VE7dQF1g+9yfu6/0lNCnhmnQTUdwOunDTYOXSTt3jQrJNhF/UxWNfxQseGq
 iWBmLBCVOVMwx+PnkkBXcLMdOnGPIriVUO95jRv9YSOUUE7zANsuGarjLnQdY2OwJxYr
 9+ag==
X-Gm-Message-State: AOAM530VaI203zv6FbjXmKhRPfDupQTieUhi9SocaJOCOJ9tBOw2xLwd
 jaWpPFDzGYt6BZx9lKmBkcEVcpTRf0/dg3rmFf05KbxJVwM=
X-Google-Smtp-Source: ABdhPJznfNt7s53g5IQ7FIyvHkE8ul5p+FofIGYKbfcP6yJUlWHy0cPXR1+relJpFBG9qlDzAUw/X9v5sYr7YLru7eo=
X-Received: by 2002:a17:906:9452:: with SMTP id
 z18mr12709453ejx.389.1607933118217; 
 Mon, 14 Dec 2020 00:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-14-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-14-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 14 Dec 2020 12:05:05 +0400
Message-ID: <CAJ+F1C+_CE5uaQ7QMkaca498WFcRWSb+zez2zwi_BqUMCTK2zA@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] compiler.h: remove QEMU_GNUC_PREREQ
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000005583ba05b6681a42"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x644.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:ARM" <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005583ba05b6681a42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 10, 2020 at 6:07 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> When needed, the G_GNUC_CHECK_VERSION() glib macro can be used instead.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h    | 11 -----------
>  scripts/cocci-macro-file.h |  1 -
>  2 files changed, 12 deletions(-)
>
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 5e6cf2c8e8..1b9e58e82b 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -11,17 +11,6 @@
>  #define QEMU_STATIC_ANALYSIS 1
>  #endif
>
>
> -/*----------------------------------------------------------------------=
------
> -| The macro QEMU_GNUC_PREREQ tests for minimum version of the GNU C
> compiler.
> -| The code is a copy of SOFTFLOAT_GNUC_PREREQ, see softfloat-macros.h.
>
> -*-----------------------------------------------------------------------=
-----*/
> -#if defined(__GNUC__) && defined(__GNUC_MINOR__)
> -# define QEMU_GNUC_PREREQ(maj, min) \
> -         ((__GNUC__ << 16) + __GNUC_MINOR__ >=3D ((maj) << 16) + (min))
> -#else
> -# define QEMU_GNUC_PREREQ(maj, min) 0
> -#endif
> -
>  #define QEMU_NORETURN __attribute__ ((__noreturn__))
>
>  #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
> diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
> index c6bbc05ba3..20eea6b708 100644
> --- a/scripts/cocci-macro-file.h
> +++ b/scripts/cocci-macro-file.h
> @@ -19,7 +19,6 @@
>   */
>
>  /* From qemu/compiler.h */
> -#define QEMU_GNUC_PREREQ(maj, min) 1
>  #define QEMU_NORETURN __attribute__ ((__noreturn__))
>  #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
>  #define QEMU_SENTINEL __attribute__((sentinel))
>

ping, thanks

--=20
Marc-Andr=C3=A9 Lureau

--0000000000005583ba05b6681a42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 10, 2020 at 6:07 PM &lt=
;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.=
com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
When needed, the G_GNUC_CHECK_VERSION() glib macro can be used instead.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qemu/compiler.h=C2=A0 =C2=A0 | 11 -----------<br>
=C2=A0scripts/cocci-macro-file.h |=C2=A0 1 -<br>
=C2=A02 files changed, 12 deletions(-)<br>
<br>
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h<br>
index 5e6cf2c8e8..1b9e58e82b 100644<br>
--- a/include/qemu/compiler.h<br>
+++ b/include/qemu/compiler.h<br>
@@ -11,17 +11,6 @@<br>
=C2=A0#define QEMU_STATIC_ANALYSIS 1<br>
=C2=A0#endif<br>
<br>
-/*------------------------------------------------------------------------=
----<br>
-| The macro QEMU_GNUC_PREREQ tests for minimum version of the GNU C compil=
er.<br>
-| The code is a copy of SOFTFLOAT_GNUC_PREREQ, see softfloat-macros.h.<br>
-*-------------------------------------------------------------------------=
---*/<br>
-#if defined(__GNUC__) &amp;&amp; defined(__GNUC_MINOR__)<br>
-# define QEMU_GNUC_PREREQ(maj, min) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((__GNUC__ &lt;&lt; 16) + __GNUC_MINOR__=
 &gt;=3D ((maj) &lt;&lt; 16) + (min))<br>
-#else<br>
-# define QEMU_GNUC_PREREQ(maj, min) 0<br>
-#endif<br>
-<br>
=C2=A0#define QEMU_NORETURN __attribute__ ((__noreturn__))<br>
<br>
=C2=A0#define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))<b=
r>
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h<br>
index c6bbc05ba3..20eea6b708 100644<br>
--- a/scripts/cocci-macro-file.h<br>
+++ b/scripts/cocci-macro-file.h<br>
@@ -19,7 +19,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0/* From qemu/compiler.h */<br>
-#define QEMU_GNUC_PREREQ(maj, min) 1<br>
=C2=A0#define QEMU_NORETURN __attribute__ ((__noreturn__))<br>
=C2=A0#define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))<b=
r>
=C2=A0#define QEMU_SENTINEL __attribute__((sentinel))<br></blockquote><div>=
<br></div><div>ping, thanks <br></div></div><br>-- <br><div dir=3D"ltr" cla=
ss=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000005583ba05b6681a42--

