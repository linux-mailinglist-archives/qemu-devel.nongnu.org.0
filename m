Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504911004B1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 12:49:48 +0100 (CET)
Received: from localhost ([::1]:32828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWfXP-0003en-Em
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 06:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iWfW3-0003Cb-1E
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 06:48:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iWfW0-0003zC-LU
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 06:48:22 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39663)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iWfVz-0003y8-GO
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 06:48:20 -0500
Received: by mail-wm1-x341.google.com with SMTP id t26so18453707wmi.4
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 03:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=SGO3fKTybnsKIbpCaSCw/GRmpWTdiDYOlCQeDqcyN64=;
 b=kN27ncgcuqKtBDSkEzoU/UPeZE+0wWZbxGZXR0GprZG1vNpw+w/yXL8MYBQXd1CwNd
 ccEqp8oq+fdrWOjKVhIrROUq/BHiXAYn9Z/swGgpw4C9utzaUV6KXUlMRiKFXAlOUBNm
 1POXRuuEdsIzYN8Etum1F43XKhFjBFhP0V3QPl7YY7F3b10ETIc9A/X57B6MFbGilnNF
 0746Fp/jXbHO67H7VDdESNQ5RzJD3Hbs3H+IoIMmpbqPySmg/TI9ueJ4wwf/9BnANPOf
 RYGtGiVVuz2q2Dh8FJP3wHZ66I0dd9zpRQtV6iQrjk6/nMAmCtqn2NGCgbCpR7mVvp+j
 9LTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=SGO3fKTybnsKIbpCaSCw/GRmpWTdiDYOlCQeDqcyN64=;
 b=kzZmfYgiZ/zvTas+SvRszdZ5zeSU+yolrF77oQOEUO/+B8IGVRakMM3V9p2bcr8VWw
 DeUKZLmk9mufAvt9R7mARnN8HICKR3AmWtYE0zvzRoYSmVu/RN/G2/3Wb+03hWYmiSwF
 yK0TcVhTgx5MeVIVnDA6TtgKwNGFxgaTrzcN8AkhJwLhkZw0RzgAnXLziEi5C+8XhE81
 /GnqDEyLbKfvrP0aacTtEb88B5UgaziM/q0vBflN5CvkwB7MRrvnFVHEJPoyznS4qNCt
 Ust0SXyH+iYGrw7WgW92QYY2cx4KbbxqTCea6ADDbsD66oGYgPoA6Yb14sTHB40V9FHh
 mD7A==
X-Gm-Message-State: APjAAAX2ALqrALrGcbZUOOgLxeIuiKxiVHKnKl6VEdjp5Twm/tgJ1x6h
 BcdiFTJ0Ny4iYAecbpBn3r7vIDwxu0o=
X-Google-Smtp-Source: APXvYqyJOyUhQKF/pL0zuRzdejSGCQlil+wNoDLUSZRIIWuIsfS5AztWHQlwP9FFfibXCzvT66uIFA==
X-Received: by 2002:a05:600c:489:: with SMTP id
 d9mr16554762wme.20.1574077697059; 
 Mon, 18 Nov 2019 03:48:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k4sm20973030wmk.26.2019.11.18.03.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 03:48:15 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E0031FF87;
 Mon, 18 Nov 2019 11:48:15 +0000 (GMT)
References: <1574032465-12186-1-git-send-email-tsimpson@quicinc.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [PATCH] Modify tests to work with clang
In-reply-to: <1574032465-12186-1-git-send-email-tsimpson@quicinc.com>
Date: Mon, 18 Nov 2019 11:48:14 +0000
Message-ID: <87o8x9h0ch.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Taylor Simpson <tsimpson@quicinc.com> writes:

> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>

Queued to 4.2/for-rc2, thanks.

> ---
>  tests/tcg/multiarch/float_helpers.c | 2 --
>  tests/tcg/multiarch/linux-test.c    | 6 +++++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/tests/tcg/multiarch/float_helpers.c b/tests/tcg/multiarch/fl=
oat_helpers.c
> index 8ee7903..bc530e5 100644
> --- a/tests/tcg/multiarch/float_helpers.c
> +++ b/tests/tcg/multiarch/float_helpers.c
> @@ -79,11 +79,9 @@ char *fmt_16(uint16_t num)
>
>  #ifndef SNANF
>  /* Signaling NaN macros, if supported.  */
> -# if __GNUC_PREREQ(3, 3)
>  #  define SNANF (__builtin_nansf (""))
>  #  define SNAN (__builtin_nans (""))
>  #  define SNANL (__builtin_nansl (""))
> -# endif
>  #endif
>
>  static float f32_numbers[] =3D {
> diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux=
-test.c
> index 673d7c8..8a7c15c 100644
> --- a/tests/tcg/multiarch/linux-test.c
> +++ b/tests/tcg/multiarch/linux-test.c
> @@ -485,7 +485,11 @@ static void test_signal(void)
>      act.sa_flags =3D SA_SIGINFO;
>      chk_error(sigaction(SIGSEGV, &act, NULL));
>      if (setjmp(jmp_env) =3D=3D 0) {
> -        *(uint8_t *)0 =3D 0;
> +        /*
> +         * clang requires volatile or it will turn this into a
> +         * call to abort() instead of forcing a SIGSEGV.
> +         */
> +        *(volatile uint8_t *)0 =3D 0;
>      }
>
>      act.sa_handler =3D SIG_DFL;


--
Alex Benn=C3=A9e

