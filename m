Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5402E30C76B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:23:45 +0100 (CET)
Received: from localhost ([::1]:60014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zOx-00041N-TU
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yrZ-0004vG-Pm
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:49:14 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6yrY-0000rl-58
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:49:13 -0500
Received: by mail-ed1-x52f.google.com with SMTP id q2so8952136edi.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 08:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dMdFc/ZPdE6IqyYDyHhRVdQb90fMPhMj3kfL4wEIXo8=;
 b=m1Wa2JzgMevYoUfm1XRh5Lj7jwmLq5O4VwihKeCxy5QNCQlQvsHl4FknwI3dzIF3WE
 b58amwJvno133AhPytzcXV61NnYuPE0H+1XE74VqvBqU94dnqcBfRe1n/r72K52Yk3gI
 C3rhExEtBeHHPhsqU/8xbBgl1jstRy1bjr8ciII4K0Yw3U8cLGsbW+jMCteCL0VsO4Oq
 qH0MS5Kqa0T3pITQDoPV81xQII8jotf2kcqLWwcQaAz8FiW7EdUShhOTbYdFBqyNOHVQ
 +nYIl1cdiHsgD8vlZBfubi3YlS1Sd2HDG/VyqmcyOASPjy5wNhIj5b2siNFh3h9R7eL0
 6tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dMdFc/ZPdE6IqyYDyHhRVdQb90fMPhMj3kfL4wEIXo8=;
 b=ZU/qk7NF9p6dfmZEGUxIP9QaHKUw0U93/9roGUdgAVXEFF01FJlD3R5NPzi/MXF3kn
 a+2kIYJKaTMmtjgplrN/DxsH48KiTl5F1OLA15m2b2EybU6Qgv7o0cXOuT8sXuwCd+ul
 5rVUGDa4VpS39vUfc7VmaMt2EvXnZglFAn6ga1r9nv2wo6psf3uaKPOwqXo8wgmkdAjj
 XEpV/IB1nSMPYc7XmqcZOYHYMrFEn/aYhxNLaplwucKL+uzJB+9RUG7M4PLiIKIGG6l9
 SqpxOCIs8H8iZQltptmSZ5AWFA3LBF+yiZHxpLtIeJzU3sCH8xIQNU6V4HLmluLk2iHO
 1FaA==
X-Gm-Message-State: AOAM530pDlKo+3KTYr67jmFTNX0Hd2DURk8xdOpQ0urHbRp0PgLVT1+2
 mzS7wLnraB18lLpGy8yhALF6LcgXBkKPejXbCmTXdA==
X-Google-Smtp-Source: ABdhPJwsht8wONKy/fWUGSVGpq82mq9Ktd60LKQxT1vGl/tbz0TQfeM9pUkbc9zo4cfd3Jn1MKLBdkF3kG/An+pWXe8=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr16606763edc.146.1612284550470; 
 Tue, 02 Feb 2021 08:49:10 -0800 (PST)
MIME-Version: 1.0
References: <20210131184449.382425-1-f4bug@amsat.org>
In-Reply-To: <20210131184449.382425-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 16:48:59 +0000
Message-ID: <CAFEAcA-z3CfCCbvR=MMTcvB9A=Eig5uFLewvu=fYUkLhAcB5-w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] hw/arm: Misc trivial fixes/cleanups
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 31 Jan 2021 at 18:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Trivial bugfixes and cleanup patches noticed while rebasing
> my "Support disabling TCG on ARM (part 2)" series.
>
> Since v2:
> - removed incorrect patches added in v2 =3D)
> - more fixes for Versal board (CAN, RTC)
>
> Since v1:
> - added patches to remove 64-bit specific features on 32-bit build.
>
> Philippe Mathieu-Daud=C3=A9 (6):
>   hw/arm/stm32f405_soc: Add missing dependency on OR_IRQ
>   hw/arm/exynos4210: Add missing dependency on OR_IRQ
>   hw/arm/xlnx-versal: Versal SoC requires ZDMA
>   hw/arm/xlnx-versal: Versal SoC requires ZynqMP peripherals
>   hw/net/can: ZynqMP CAN device requires PTIMER
>   hw/arm: Display CPU type in machine description



Applied to target-arm.next, thanks.

-- PMM

