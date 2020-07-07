Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2BE217475
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 18:52:16 +0200 (CEST)
Received: from localhost ([::1]:58826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsqpL-0004cy-G4
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 12:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsqUW-0005QR-NA
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:30:44 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsqUU-0002nk-Kx
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:30:44 -0400
Received: by mail-oi1-x241.google.com with SMTP id w17so34661013oie.6
 for <qemu-devel@nongnu.org>; Tue, 07 Jul 2020 09:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RNfpKk23M0bTzOFvcU7+HeuBwIMbVogaO8o61htyF10=;
 b=HDXRopjiM4RzPhPO88mYUuT+FS8pjDTU2RErSngr5i9hn32ad/mSclRDXarVypDLwt
 f38iVAT0OPct68C6wgsQ+oETfZmOT1I/4wvxKgbvd/1t4AzyyqlJhztJnJYXjT7/HJ2i
 Akupg/28SI7srsa3RzVDin5ojl/+fuWTXizP2c3lbOW6QbTmCDVJw3whCv/ll9+m98eU
 l/ZbtN1x61ZoMP612Yq0kKTb5KIUj5YxkNsmf4xu2O04o9QF893dJOOQqiwQpQNlPwI4
 d5fgUdq4WRhCH44p1rVgDSJyotSjNgdkl6LMCdUXT870DazXfXpuhIt8yxKsqi3Z08mR
 z+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RNfpKk23M0bTzOFvcU7+HeuBwIMbVogaO8o61htyF10=;
 b=d6LZ8hdfftJ+18s2iz4xKsP2frnr1LRZwdeYmHaYF6YiknokZT8ZQW6rHRbQ31OkXf
 L6knERd1iF43fFkiXYwcC9AKqFssaPxE9BhSm2txBL7JPiI4YHqO3KKrNlvCM0WpjNSA
 9SOnwyGJ6PfERkBnGguNj+ERXEMsK+WLfjhk/11scv6C5crR43zyKUGo1KU+LP4tXTvz
 vmf5NK8B4kEGFQPjp4Uf4TozeNAdF1XNgME3zdAQpfT0oQ49a+PLwznPMhxb9p3nSfVq
 RlEVzFTNgdLYe9wzCSM3nkrQ6+LGv6/+uO3OruS7wgOtKLkrlOBompdpS5Y/n2AECvdb
 hRbA==
X-Gm-Message-State: AOAM530kzb+OmxQzYaJvzUI7Zd/TbMV6oytEdsZUcQcwhHzwJLBzzH2Y
 M6CTyz4CWb7m5e66UmJ0and9MrGrbbwYEx4KVfcHFg==
X-Google-Smtp-Source: ABdhPJxgx960yZ0cBqPK2pfkLgskniNKfkstDgA5dY/h2ddPTw6fkxgLmLF78NneQz0ALk1rc2GWVJ9ODY5GmdoCl7o=
X-Received: by 2002:aca:2819:: with SMTP id 25mr3685942oix.48.1594139440565;
 Tue, 07 Jul 2020 09:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200705211016.15241-1-f4bug@amsat.org>
 <20200705211016.15241-3-f4bug@amsat.org>
In-Reply-To: <20200705211016.15241-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jul 2020 17:30:27 +0100
Message-ID: <CAFEAcA-oXwam0QmJaPnUnFLWsv62tKOcoCbqqj5W+Bn=yybLzg@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/lm32/milkymist: Comment to remember some IRQs
 lines are left unwired
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Michael Walle <michael@walle.cc>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 5 Jul 2020 at 22:10, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The 'card is readonly' and 'card inserted' IRQs are not wired.
> Add a comment in case someone know where to wire them.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/lm32/milkymist.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
> index 469e3c4322..117973c967 100644
> --- a/hw/lm32/milkymist.c
> +++ b/hw/lm32/milkymist.c
> @@ -87,6 +87,7 @@ static DeviceState *milkymist_memcard_create(hwaddr bas=
e)
>      dev =3D qdev_new("milkymist-memcard");
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> +    /* FIXME wire 'card is readonly' and 'card inserted' IRQs? */

It's possible that these lines are correctly not wired up
(ie that the hardware does not provide any kind of indication
of the r/o or insertion events). The milkymist mmc device is a
very simple one. AIUI the RTL for the board is on github if
anybody wants to go check.

thanks
-- PMM

