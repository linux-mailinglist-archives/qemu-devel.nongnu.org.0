Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C492C03B2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 11:53:05 +0100 (CET)
Received: from localhost ([::1]:43052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh9Sx-0002rI-4z
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 05:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kh9Rt-0002Im-Bu
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:51:57 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kh9Rr-0000dH-R6
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 05:51:57 -0500
Received: by mail-ej1-x62e.google.com with SMTP id f23so22654932ejk.2
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 02:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7c5smF5ygigAWtci09fXgHOmo5sEKFj9RYcH9d7XejA=;
 b=jLSPgsttSG4Vqfi6nebDDNNkdmdQdivphlmgLKOG3P7/m482v7t+NlRNhcdA11oKH0
 1qYwHuAMFiDS//22ri7VLMt5dYpQXsKjkVIw2244e4BDnMaZgbWkGCN3k4ReQcJkel2L
 WQl/kVanxRyPoNTnaInvp4V0KcD+702dhv6gatQ8kJADiWA4gb/Yb6Voaht3wSKC4rhE
 +K8j+mfj8NB7ALfSUFcX4MHcF5eulWkprN66hWNHiYFF/exi3AY92fVNmU3cb9ehi7e+
 vZoYsCGmFyEMcCRA++nT51hbK0QIfCpGR2Xdkb/9AoTavNuSifSItwT+BBWwUZsG8p3V
 M7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7c5smF5ygigAWtci09fXgHOmo5sEKFj9RYcH9d7XejA=;
 b=CMJ0WKI49E1V3+Z4DOTi1Q5BKq46gerKdNjIY+77lfk/Omh5B6o6bIhU9rE+qRMJ/4
 iAiwHSVeLGjagJV08i07xg+8TWJ85VndscWkUZRnNjjbJNnM/0LZvUsgZVw9+QYHyxyY
 H0czirEyRMAICVfnc8PgSKlrTNTjz59O1uUDbgEpcSseN/mMQUsA9ZB2/GOQtlrYjyrT
 ZzmLTKpHNDs9Ukm1NvJVvd0Ks9B5JE+96J8/arnjyZqBx71bCeOiDkMwaTaDrJn3rWjN
 dvs+w4pPEdFG9HpwMEKqrI2jdAr9O4uTBXSUrhQHxINfrBFmwy7kPvNwJ8dQxm13OywG
 62qA==
X-Gm-Message-State: AOAM530fqof3lAddaRaaG00X+NvH4w+S1mEbzUxrW+eX3SGTtpyCzIHU
 T2O9Zyadj+clyUr1ezD5jpBNvYKrHXdSzRf+yRXznw==
X-Google-Smtp-Source: ABdhPJyz1ITB19O+wXQM3nHFCw2It7nGLgs0r1W3Lq57B+tj+p/CkchONjmwz6e5Ps9dfNYz1BzK02DyLNdVbSsttzI=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr32334614ejd.382.1606128714314; 
 Mon, 23 Nov 2020 02:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20201120154545.2504625-1-f4bug@amsat.org>
In-Reply-To: <20201120154545.2504625-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2020 10:51:42 +0000
Message-ID: <CAFEAcA8bjTvVY7R3hKhJvRiPVrUVh90Z8suROKVdZiR-GVEU+A@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 0/6] MAINTAINERS: Fix docs/system/arm/ entries
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Nov 2020 at 15:46, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Correctly docs/system/arm/ rst files in MAINTAINERS.
>
> Philippe Mathieu-Daud=C3=A9 (6):
>   MAINTAINERS: Cover system/arm/cpu-features.rst with ARM TCG CPUs
>   MAINTAINERS: Cover system/arm/aspeed.rst with ASPEED BMC machines
>   MAINTAINERS: Cover system/arm/nuvoton.rst with Nuvoton NPCM7xx
>   MAINTAINERS: Fix system/arm/orangepi.rst path
>   MAINTAINERS: Cover system/arm/sbsa.rst with SBSA-REF machine
>   MAINTAINERS: Cover system/arm/sx1.rst with OMAP machines



Applied to target-arm.next, thanks.

-- PMM

