Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABE49EB25
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 20:36:24 +0100 (CET)
Received: from localhost ([::1]:39022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDAZD-0000xu-2O
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 14:36:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDAVi-0007O6-4W
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:32:46 -0500
Received: from [2a00:1450:4864:20::330] (port=42955
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDAVd-0001QZ-3E
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:32:45 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso2539423wmf.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 11:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UKlzbzgY6/cYBsqdSescFb1mbhl6KYnMxFxsd27ftb0=;
 b=lkDGWRRCHhJfhCVBshIMyknN8NUs4el/ptR8J0ZKAa0hZrwnWUDjro7A4laiDttZ9n
 1FL86+fHDTveCacHfrjZEdSAwR2+PasiIULDzi2nzZSCxQP1SoYjqmckGtGHQ1K4chn4
 s2jHB3igf3FaWwsPYM1RQ+X07EVh1E5qo0xGl9zzEERIo6fGwaf8yorCfawtXhg3K5Ip
 fn0ie5yRX43JbSgCciXcJfToh3nO6dG5r/ezgXmKMV1gOYeFCQNhvfHqiTCzeuvcwBC1
 7+7A15JWXQn9i32aMJv6aOt65wFpqWymoJpDuo/rjXf0zEecGCYEM4CNmUvlj7Go7bPZ
 R3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UKlzbzgY6/cYBsqdSescFb1mbhl6KYnMxFxsd27ftb0=;
 b=u+0dABT8a98vaHzrb5F2MrNsugCk6/c2aEV7NMxPqj54WU5T1YD8pWim+2A+OfU90w
 oUSytCeFUQTE/f13W4s00q4hYWc1n8dmFNvFVSL+NL8MkF0Z1FSAl5Ri0/Tl400qFh/z
 69tbPAhUDmAeBOwPq+9mgBfJfKWi9ycYhu24Elk/C1PC1xDbcdWKXs+hHoM7tT19Hp1W
 WgEgpY3ikRIMC1DJQE6aoi8R6rr7hMG99ogKxIxzO6ShSj85z6eikWQxgSxiMP9KODX0
 Az46wnrWet1M3TmuqqrhypwRY9hJ5MEmzx6umIFQBpmAzeKT3TIwnkgpicftIBjFFccG
 YSyw==
X-Gm-Message-State: AOAM530UYlI8Y9XHP6RE9/qzbaV7Esi5pDZQT3XCP0dIC/UYfH4M26cg
 Dhubk6ETSemC+v4OaXaOrySeKZTWtiFgKUFxbIV09A==
X-Google-Smtp-Source: ABdhPJxTFNBgSp0n4bhxSfZFZrZcyp3//LRoeXXsdtpU5n2KKVx2QwVXHci17oZH1m3GN8pd9hQswTwQRduKQfCnB44=
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr13437190wmq.126.1643311956779; 
 Thu, 27 Jan 2022 11:32:36 -0800 (PST)
MIME-Version: 1.0
References: <MW4PR21MB1940E8BB52F4053C943B1FCD9E219@MW4PR21MB1940.namprd21.prod.outlook.com>
In-Reply-To: <MW4PR21MB1940E8BB52F4053C943B1FCD9E219@MW4PR21MB1940.namprd21.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 19:32:25 +0000
Message-ID: <CAFEAcA9WU4u1GuxLPU3HW1bar-KM+jUGXPxLp70weUv22kvjNA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove myself (for raspi).
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 17:51, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e4b3a4bcdf..3baa83dfc9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -818,7 +818,6 @@ F: docs/system/arm/palm.rst
>
>  Raspberry Pi
>  M: Peter Maydell <peter.maydell@linaro.org>
> -R: Andrew Baumann <Andrew.Baumann@microsoft.com>
>  R: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>  L: qemu-arm@nongnu.org
>  S: Odd Fixes

Thanks for all your past work on QEMU!

Applied to target-arm.next, thanks.

-- PMM

