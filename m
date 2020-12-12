Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D162D89A8
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 20:20:44 +0100 (CET)
Received: from localhost ([::1]:50360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koARe-0006vR-UW
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 14:20:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1koA5s-0003FD-SW; Sat, 12 Dec 2020 13:58:12 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:38635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1koA5n-0000Dy-NA; Sat, 12 Dec 2020 13:58:09 -0500
Received: by mail-ej1-x643.google.com with SMTP id 6so2362998ejz.5;
 Sat, 12 Dec 2020 10:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aqJp4gKfamwnwqe8EMieEJaV+n0fzH9AmnYkNTme3fQ=;
 b=TC+B4GNRTpn/r+SvL+bvNGYRqF3e8Vj1nDNqdPPO4ItwyM9NESVl6FUy+NYJbvv6op
 hOB08xCYyw0iQP0A8lF2jmnF9pqVq+GqWhzpAJoYg9ISZu1z9cxQCw5zD7hSBPmXvfpi
 tEg3reKaZg4RwHzdNRXuZebgzfDbWmpxhQxXqFPRsjd8yi4+drOgBBry/98/eAWGaKJw
 8zmHMVfoiMIEURI/0g8m9ib9djl4YfB93MOBvy2NN9o0d9TWELP0HbyX4GyUhh3vDcDA
 J+Z6Wdh8eynJ5jj4PW8EXBfNdMTqNoD/wg1EpmTfGv5zaEgohAt8iGwbx8oG8sfGZe/6
 WI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aqJp4gKfamwnwqe8EMieEJaV+n0fzH9AmnYkNTme3fQ=;
 b=GpU1RWRBn0MdkdsQgXamnynxPacoUp+axVb7VZBxYw2OgNofPw+zCpegNu6JcWKTyI
 OmRkOPhknr3o73QLu/xz9GebzOOOWHSWbyrPOcOGyqbFl1bDqbWQreMLJCFp9QsgBgFm
 wcg/usF6SlHmPEMDKLHsKmWvITy87rdCvqYDuZM6fvUw/xfQgZs2N68gbQ6VJIk9xc6l
 xDJasnDPTHXuRnyL6ejIVyCmKL4ArRvqHiOgKcLQz1sIDq+lkwJez2C5lGZ8FjkZdqIT
 gZzU6lTmgLh+5OsJRQDgfiYUqA+A6VtIfgN9yA6A6IqePaR3QREps6Xn8cqxMlOLk/7V
 rfTg==
X-Gm-Message-State: AOAM532OfrDtsKKc2+/2zeUeEMhgYmiw20NGdx7FXC3nvOxqRY3VaMKl
 1x+ng7EH+JOu2lWUsP6d677IKgprD8+GSGaR9GA73y4r2a0=
X-Google-Smtp-Source: ABdhPJwRYgIUgihzry5rDxdOpf6xvg2ddglMC+Ji3KvWM3mWc1/FcIcg0uP8pe4SFDAao5orqB2pkFnuroGhvbtV1rg=
X-Received: by 2002:a05:6402:1155:: with SMTP id
 g21mr17219102edw.53.1607781202707; 
 Sat, 12 Dec 2020 05:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-12-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-12-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 12 Dec 2020 17:53:10 +0400
Message-ID: <CAJ+F1CL=m4bLdCaKHYuVNTzBdGZnK-_q5pGNoV8N37-H51u+Dw@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] compiler: remove GNUC check
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000076cb0505b644bb52"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x643.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--00000000000076cb0505b644bb52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 6:14 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 6212295e52..5e6cf2c8e8 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -64,14 +64,10 @@
>      (offsetof(container, field) + sizeof_field(container, field))
>
>  /* Convert from a base type to a parent type, with compile time
> checking.  */
> -#ifdef __GNUC__
>  #define DO_UPCAST(type, field, dev) ( __extension__ ( { \
>      char __attribute__((unused)) offset_must_be_zero[ \
>          -offsetof(type, field)]; \
>      container_of(dev, type, field);}))
> -#else
> -#define DO_UPCAST(type, field, dev) container_of(dev, type, field)
> -#endif
>
>  #define typeof_field(type, field) typeof(((type *)0)->field)
>  #define type_check(t1,t2) ((t1*)0 - (t2*)0)
> @@ -102,7 +98,7 @@
>  #if defined(__clang__)
>  /* clang doesn't support gnu_printf, so use printf. */
>  # define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> -#elif defined(__GNUC__)
> +#else
>  /* Use gnu_printf (qemu uses standard format strings). */
>  # define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
>  # if defined(_WIN32)
> @@ -112,8 +108,6 @@
>   */
>  #  define __printf__ __gnu_printf__
>  # endif
> -#else
> -#define GCC_FMT_ATTR(n, m)
>  #endif
>
>  #ifndef __has_warning
> --
> 2.29.0
>
>
>
Peter, Paolo, anyone to give a review?
thanks


--=20
Marc-Andr=C3=A9 Lureau

--00000000000076cb0505b644bb52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 10, 2020 at 6:14 PM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
QEMU requires Clang or GCC, that define and support __GNUC__ extensions.<br=
>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qemu/compiler.h | 8 +-------<br>
=C2=A01 file changed, 1 insertion(+), 7 deletions(-)<br>
<br>
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h<br>
index 6212295e52..5e6cf2c8e8 100644<br>
--- a/include/qemu/compiler.h<br>
+++ b/include/qemu/compiler.h<br>
@@ -64,14 +64,10 @@<br>
=C2=A0 =C2=A0 =C2=A0(offsetof(container, field) + sizeof_field(container, f=
ield))<br>
<br>
=C2=A0/* Convert from a base type to a parent type, with compile time check=
ing.=C2=A0 */<br>
-#ifdef __GNUC__<br>
=C2=A0#define DO_UPCAST(type, field, dev) ( __extension__ ( { \<br>
=C2=A0 =C2=A0 =C2=A0char __attribute__((unused)) offset_must_be_zero[ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-offsetof(type, field)]; \<br>
=C2=A0 =C2=A0 =C2=A0container_of(dev, type, field);}))<br>
-#else<br>
-#define DO_UPCAST(type, field, dev) container_of(dev, type, field)<br>
-#endif<br>
<br>
=C2=A0#define typeof_field(type, field) typeof(((type *)0)-&gt;field)<br>
=C2=A0#define type_check(t1,t2) ((t1*)0 - (t2*)0)<br>
@@ -102,7 +98,7 @@<br>
=C2=A0#if defined(__clang__)<br>
=C2=A0/* clang doesn&#39;t support gnu_printf, so use printf. */<br>
=C2=A0# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))<br>
-#elif defined(__GNUC__)<br>
+#else<br>
=C2=A0/* Use gnu_printf (qemu uses standard format strings). */<br>
=C2=A0# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))=
<br>
=C2=A0# if defined(_WIN32)<br>
@@ -112,8 +108,6 @@<br>
=C2=A0 */<br>
=C2=A0#=C2=A0 define __printf__ __gnu_printf__<br>
=C2=A0# endif<br>
-#else<br>
-#define GCC_FMT_ATTR(n, m)<br>
=C2=A0#endif<br>
<br>
=C2=A0#ifndef __has_warning<br>
-- <br>
2.29.0<br>
<br>
<br></blockquote><div><br></div><div>Peter, Paolo, anyone to give a review?=
</div><div>thanks<br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000076cb0505b644bb52--

