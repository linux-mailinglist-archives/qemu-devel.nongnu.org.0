Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7229E320DB7
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:51:23 +0100 (CET)
Received: from localhost ([::1]:58188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDvhK-0000LP-HE
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDvfs-0007MX-47
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:49:52 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDvfo-0003Wv-SH
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:49:51 -0500
Received: by mail-ej1-x62e.google.com with SMTP id g5so26033866ejt.2
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 12:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nYApXIseD6Sx0sZQ8+wG4lWWqK3yOVOitlFEEmUx94w=;
 b=mZg1iyQ/vCmYnj9e0gEEzP3MoZ+ouYnc5lZ/pH6Mnx5nU+4Z/6nBlJApHXrqruMrLy
 1j7DBoXMZHUJM0GTafZMIwGDdZY8qRHd/5PZOoOCi8H2v9bLpzOv7vlh+4aSF+l2dkSY
 /+c+m1sGhEaAGrsQFPRBlHFskobkcvTO2k7g3Di55t7tE6LYbv9t6qsNSEKoPYh9E0mG
 VKfjdNv9XgA6SixuryCZz9M9lQWX8p0cX+cBHzRsBg3vSTwyhNcz9DtJMIS+gM0HLFbo
 H/26AsV1V09ZPwiJziRpzqP6blJb+bO3wxC9oy8EHShK2zSgyQ2XJYhrDgiPvMfWxJ7u
 lpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nYApXIseD6Sx0sZQ8+wG4lWWqK3yOVOitlFEEmUx94w=;
 b=OU51VZzlrEnd2Tqvm4Rw76rGruc0CSAdbpOgbyZLzlsJDO39vU/GtCVTsbC8cbS6D5
 bYR1uOk0rEceBgmd5rparZ+l1HQCaFflQXoXd7cenq5KyR45zPj5S5G7o9TEjyEvSp0Z
 XZhCWS7M0DYqC5S5v3b4l8hiufxHZ4SEqNR4L1eh8lfYfqfJiwG+8FbsPEMfTdjNlgJA
 i6DffrgbcUF8W8dTASQ6Zv/iTpGs6bDk7h/Wtu9cso9xXBtx6SV4OuyC4N19gswKBNI8
 6U54hzPWcEqGEBuZm7HerE613xT6170J4OAv6XceiStPynF/4IjfqIhbR05TemSv53WG
 vX9Q==
X-Gm-Message-State: AOAM530V0ejBOjwwDRlPvCPQia6NhT6C2hyfaKDECnSQVp/DaBgEoyiA
 2T4DC8QVNvYT6h2YmMiDMwjKOySGeEpWvkc4lCvtZg==
X-Google-Smtp-Source: ABdhPJwbIG4T5C8fLJrxdc7Ab7XvDd9XlsxlZLB1fU4DkDGxDtrKxWV/O9Mli7V6JVmb+PitL9k5RlibAJSkzLvb8iA=
X-Received: by 2002:a17:906:3556:: with SMTP id
 s22mr17241527eja.85.1613940587424; 
 Sun, 21 Feb 2021 12:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20210221200249.2536247-1-f4bug@amsat.org>
 <20210221200249.2536247-9-f4bug@amsat.org>
In-Reply-To: <20210221200249.2536247-9-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 20:49:36 +0000
Message-ID: <CAFEAcA8UQW01zELwVo9vifKm6k+qp-nT5Xw3NHi-hrEH03eKUQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] hw/sh4: Remove now unused CONFIG_SH4 from Kconfig
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Qemu-block <qemu-block@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 20:03, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> As replaced the generic CONFIG_SH4 by more fine-grained
> selectors, we can remove this now unused config variable.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sh4/Kconfig | 5 -----
>  1 file changed, 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

