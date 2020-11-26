Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61812C5386
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:04:58 +0100 (CET)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiG1C-0007Od-0g
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiFxQ-00059o-4Y
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:01:04 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:37579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiFxM-0008RO-K3
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:01:03 -0500
Received: by mail-ed1-x541.google.com with SMTP id cq7so2015489edb.4
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a/enZHhVR+dTx0ztu181+DzjJ7VndJDspYB3rk1nKLU=;
 b=U2tHMPOVofH59E5iQ3PNwZARg9/Cm8+Skc99hFSQhCKQZiJZDwVkqWcDjY5vD1I8yL
 V1MEe1s4R6hjjAkw7cTUpxm8YIiu7iRvtiHPrxRVA+rZm4JJxbqKkNUNxrA/P+uIh+uS
 AKYGLkXC1FAdDbpEkVmBLeCF3NiVq4txV7MtD+m71NgCj5xkUmXVsih285TJD0ccm2bN
 doM3tFBGIaqg+L7KU+ENtD6RNNrVKY6kpmyIG0/MdxpYZTDcRwtGbkOJhFS6Pni6EGgO
 8yoyNxYxCytRsVM6t9+UtwuLy0UdXQQOkpN6RnWvr6Ei97GUfNLECxS2NAE+LkWPTJUl
 mZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a/enZHhVR+dTx0ztu181+DzjJ7VndJDspYB3rk1nKLU=;
 b=oQD+cV/Hmv+qd7jFTs3p+gJRgkRoMb7LfVWfMixak12ywLp/RIuermqruHH82cCcpB
 TOy3/gq25IfblbEzLbQl+YK8qd5/idoAbJUD+UldKpHmtH3bkVpYpOi+VkE2Lrsp6THt
 NvampbGdsL1/HkHaW2pUN4iUuk56yguq7JZw7DAaTnf8QGH2RM0wVmgSkX6LfDMLHzvD
 hZurtubrnXS3FUSePcVbjBjpsn7mCZG88DZzG7M+syJnSrgy2a+W7kNuQsvLdljHND43
 9B/pdQj6xCYPLjOgp6y6EpVyyu0gG4ZuBy5N0C48pVbmE1Zb3BzljsyTpTTQ0XzJ+595
 Z8OQ==
X-Gm-Message-State: AOAM5305IEFPJMlYM+fWEEUgahCnJWg9eXiFOW7XpvNcab+n0M4RVk+M
 GWOgZ+YBEA6RJd4i+povNBDO60owUUzc1Qcdt+GJhQ==
X-Google-Smtp-Source: ABdhPJxZJf7N5R6mJeUrBqVaazzKREkc9hDKfTNgwHnNmaQ579Y2H1QNrPVkvbVwTp/QFJgHJTTD/BWXF+1qP1/GGYQ=
X-Received: by 2002:aa7:df82:: with SMTP id b2mr2090196edy.251.1606392056135; 
 Thu, 26 Nov 2020 04:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-9-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-9-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 12:00:45 +0000
Message-ID: <CAFEAcA9yKr1krZ24cmq6GSa6QbUpZwyWU2hXb8CfNz71ycQyBA@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] compiler.h: explicit case for Clang printf
 attribute
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 11:30, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Since commit efc6c07 ("configure: Add a test for the minimum compiler
> version"), QEMU explicitely depends on GCC >=3D 4.8, we could thus drop
> earlier version checks. Except clang advertizes itself as GCC 4.2.1.
>
> Since clang doesn't support gnu_printf, make that case explicitely and
> drop GCC version check.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index ae3e0df34c..108bfdb391 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -90,18 +90,16 @@
>  #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)) -=
 \
>                                     sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
>
> -#if defined __GNUC__
> -# if !G_GNUC_CHECK_VERSION(4, 4)
> -   /* gcc versions before 4.4.x don't support gnu_printf, so use printf.=
 */
> -#  define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> -# else
> -   /* Use gnu_printf when supported (qemu uses standard format strings).=
 */
> -#  define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> -#  if defined(_WIN32)
> -    /* Map __printf__ to __gnu_printf__ because we want standard format =
strings
> -     * even when MinGW or GLib include files use __printf__. */
> -#   define __printf__ __gnu_printf__
> -#  endif
> +#if defined(__clang__)
> +  /* clang doesn't support gnu_printf, so use printf. */
> +# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> +#elif defined(__GNUC__)
> +   /* Use gnu_printf (qemu uses standard format strings). */
> +# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
> +# if defined(_WIN32)
> +   /* Map __printf__ to __gnu_printf__ because we want standard format s=
trings
> +    * even when MinGW or GLib include files use __printf__. */
> +#  define __printf__ __gnu_printf__
>  # endif

checkpatch probably warns about the block comment style so you might
as well fix it while touching that line, but otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

