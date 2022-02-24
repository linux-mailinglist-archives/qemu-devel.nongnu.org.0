Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986254C35CB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:24:05 +0100 (CET)
Received: from localhost ([::1]:58292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJie-000470-FJ
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:24:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNJXb-0001Qw-3G
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:12:39 -0500
Received: from [2607:f8b0:4864:20::1134] (port=38396
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNJXX-0000Na-RY
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:12:37 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2d79394434dso8991947b3.5
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G/hORnB3gI+HDBpIbw3pl/jxbqTQDGj2b5oG9SH5qEE=;
 b=gOwS0qbGKnFhh5OkJZ7TkTF++nCX4FJ4A8xRjLZZyyc248fnsRo+5nrj/mdVEbFx+2
 NciP3Is/lEwGPdGszO2BXyXjkpiB2LkAZeTLHE9REDqE2MLJD1NujzFxsYlKne0D/jtM
 /BfcrfVECBNOyvXrqXnCnCfB7cQ/oa85WlolwhluxLPwwVb3IwMaoi0He9rnSuWJlruY
 XSmZnvSQbXuyJhkASSj5NFiutzAD5RuPsGXS1kTOKQN8ojevaxd7MEbMBzxUxC/UB5Vc
 ffzKP8XLXbVKgua/XaeMIRzlJuNW9fsnyx/ec6Moh4WZNye0KQVG7uv5n7+4ZvbvukAP
 gY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G/hORnB3gI+HDBpIbw3pl/jxbqTQDGj2b5oG9SH5qEE=;
 b=xuk64i8WZjBBWJRhG8eywJ5Ty3khZrVANAFZJmdW/EteA5iItaM6HwETxyjZ1DRO6B
 8F5qRkjU9k/rS91Kolku26Jq5s1Vp917gWOS152F8Oy1uNTgwYXAC+k1QREqIdmO260D
 DSOmmoXkl/T0HhLnZug4+wUMthIHLyYNWN0PU+VtK1Y+DliL6bKW9T/aXOD+yRa++5Og
 utROy2fgRmBm68fJtxxLHA9jxEYcs0suQ7kAKFylLpJXfT8yVJFn+aoWSVih3BodsZ57
 H1IGbGq1eNBGe5Gl4HF3rqAtXcrHJkusCQNvmBJfyElBuNkuq7+m9TzgsroWquIUXQ0e
 RTbQ==
X-Gm-Message-State: AOAM532He+LHGiff24BmF6G8tljvBGWl7q+HZ/a4graGX8LOufXjRLvz
 12WezPXScK+JflnOi6MjPzzWp0BiVd22unfD/+BGZw==
X-Google-Smtp-Source: ABdhPJxtkQ1VdF37xi42HZPKlr70MqaRZl4Y8bNMRhvRGUTZTKy6hNzKymZeL+26eZR18psVoUp+xjiHkME8MxzI1Oc=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr3961209ywh.329.1645729954670; Thu, 24
 Feb 2022 11:12:34 -0800 (PST)
MIME-Version: 1.0
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220224183701.608720-6-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 19:12:23 +0000
Message-ID: <CAFEAcA9FDt0Y6W4zBLG3ciGe8M7TERimzD_4gX-y7pAv2G+=ag@mail.gmail.com>
Subject: Re: [PATCH 05/12] compiler.h: drop __printf__ macro MinGW/glib
 workaround
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 at 18:38, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> This workaround was added in commit 95df51a4 ("w32: Always use standard
> instead of native format strings"), as it claimed glib was using
> __printf__ attribute. This is surprising, since glib has always used
> G_GNUC_PRINTF which, as the name implies, uses __gnu_printf__ when
> possible.

This was not always true: before this commit from 2018
https://github.com/GNOME/glib/commit/98a0ab929d8c59ee27e5f470f11d077bb6a567=
49
G_GNUC_PRINTF used always used __printf__.
I think that change only landed in glib 2.58, so since our current
minimum glib version is 2.56 we need to retain this workaround.

> Apparently, the workaound is no longer relevant though, I don't see
> the warnings.

You're probably building with a newer glib, and possibly also
a newer mingw.

I've cc'd Stefan Weil who might know whether we can drop this
workaround as far as the mingw part is concerned.

> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 2704c314dcac..eb29b72c14d7 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -73,14 +73,6 @@
>  #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)) -=
 \
>                                     sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
>
> -#if !defined(__clang__) && defined(_WIN32)
> -/*
> - * Map __printf__ to __gnu_printf__ because we want standard format stri=
ngs even
> - * when MinGW or GLib include files use __printf__.
> - */
> -# define __printf__ __gnu_printf__
> -#endif
> -
>  #ifndef __has_warning
>  #define __has_warning(x) 0 /* compatibility with non-clang compilers */
>  #endif
> --
> 2.35.1.273.ge6ebfd0e8cbb

thanks
-- PMM

