Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A363C409655
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:50:14 +0200 (CEST)
Received: from localhost ([::1]:49160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnHg-0000P8-JX
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPnFe-00064a-98
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:48:10 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPnFc-0006mL-FB
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:48:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 r128-20020a1c4486000000b003065f0bc631so2533226wma.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HsyH6CU7tFVLgWvOW7NzSKMYYlRCmNH/QAS/SjsYyzo=;
 b=c6XZEs+qNs1i/scLTE10BAkKhENoLSq/pSJyeok5z4UODU/USpxv5UZOe1/LJMtL7a
 g/VPJWGZp4YwKtDEtq2IlBFSH0RRKckijELKfjNZwszvp4d6pf8WXleNecYnS7l2j/Ky
 E4a4OALoVb3z9kuAMxucEZ/2v2Gd08afqZdK8khydm4kbNtFaehSJ5x6DdTWi59uxUNQ
 KNBT2/cGKnXi2koBQy79PcXUZcX8oZg7WMOP5iZg/LLKprqytGlvOgpasewqWWdM9Yrd
 hhg11r1AnyV7ARUM+dQFCl1SJS+zcs7izluXklDg/hFRSZafoAyW0nIvCwVLCD7wlyPY
 swwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HsyH6CU7tFVLgWvOW7NzSKMYYlRCmNH/QAS/SjsYyzo=;
 b=UZFXOZaNHA9aHgeOE3qQBhsjEcK1fMyKc+bUgjUeN+PkrCqlu+joOdc5fKxlNfAUes
 9v6I3IRrldfzy3vPbhXY83JBaAGfZMbfLnSc8MieZm5rDC7eg8Vm2W+O+PqpWYlqhb/A
 8lV5lHc949W/aobdzpjCQYYpQkCw495XGJ7LG60qmxwrxMm/Cs0glUKZGYbjlOS8Ci1f
 78arEVkHEvw6v74MZvhinqh5rYu01tm8hhmjx0tvLPUJO36CnfE+l9DTSsisCadXlU5q
 3oV6Pyxir3uzIdTzV6t0ReOX68MpxKtvCriTHZFPZ0DBC7jTazGzeSxY8qu7qpCaaX0w
 iOZw==
X-Gm-Message-State: AOAM530YH8apPLrDadC0uCuzZWo9kiR2NzCtH0f5Oh4yD+ZmBsGlFyHf
 y2aFvozZnnxPS2hQY9B07L32RA3BG2lgpX437LJ0RQ==
X-Google-Smtp-Source: ABdhPJyFBtuQdejJtT5xpn4pZprlK4bNIIXiItL/nTdHEpFmtZA5EC46Ka30tteP+CPkiRbDii2PsY8fITYE3q0AIAk=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr5010887wmm.133.1631544482728; 
 Mon, 13 Sep 2021 07:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210907232555.3268967-1-wuhaotsh@google.com>
 <20210907232555.3268967-5-wuhaotsh@google.com>
In-Reply-To: <20210907232555.3268967-5-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 15:47:11 +0100
Message-ID: <CAFEAcA-GmHdCMXU=UAg8_TAnco1TMZgtfo_3kYgqwpJKRALaTQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] tests/qtest: add qtests for npcm7xx sdhci
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>, Patrick Venture <venture@google.com>,
 Bin Meng <bin.meng@windriver.com>, Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Chris Rauer <crauer@google.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Sept 2021 at 00:26, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  tests/qtest/meson.build          |   1 +
>  tests/qtest/npcm7xx_sdhci-test.c | 201 +++++++++++++++++++++++++++++++
>  2 files changed, 202 insertions(+)
>  create mode 100644 tests/qtest/npcm7xx_sdhci-test.c
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 757bb8499a..ef9c904779 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -157,6 +157,7 @@ qtests_npcm7xx = \
>     'npcm7xx_gpio-test',
>     'npcm7xx_pwm-test',
>     'npcm7xx_rng-test',
> +   'npcm7xx_sdhci-test',
>     'npcm7xx_smbus-test',
>     'npcm7xx_timer-test',
>     'npcm7xx_watchdog_timer-test'] + \
> diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
> new file mode 100644
> index 0000000000..5c4e78fda4
> --- /dev/null
> +++ b/tests/qtest/npcm7xx_sdhci-test.c
> @@ -0,0 +1,201 @@
> +/*
> + * QTests for NPCM7xx SD-3.0 / MMC-4.51 Host Controller
> + *
> + * Copyright (c) 2021 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sd/npcm7xx_sdhci.h"
> +
> +#include "libqos/libqtest.h"
> +#include "libqtest-single.h"
> +#include "libqos/sdhci-cmd.h"
> +
> +#define NPCM7XX_MMC_BA 0xF0842000
> +#define NPCM7XX_BLK_SIZE 512
> +#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
> +
> +char *sd_path;

should be "static".

> +
> +static QTestState *setup_sd_card(void)
> +{
> +    QTestState *qts = qtest_initf(
> +        "-machine quanta-gbs-bmc "
> +        "-device sd-card,drive=drive0 "
> +        "-drive id=drive0,if=none,file=%s,format=raw,auto-read-only=off",
> +        sd_path);
> +
> +    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_SWRST, SDHC_RESET_ALL);
> +    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_CLKCON,
> +                 SDHC_CLOCK_SDCLK_EN | SDHC_CLOCK_INT_STABLE |
> +                     SDHC_CLOCK_INT_EN);

inconsistent indent


> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_APP_CMD);
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x41200000, 0, (41 << 8));
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_ALL_SEND_CID);
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_SEND_RELATIVE_ADDR);
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x45670000, 0,
> +                   SDHC_SELECT_DESELECT_CARD);
> +
> +    return qts;
> +}
> +
> +static void write_sdread(QTestState *qts, const char *msg)
> +{
> +    size_t len = strlen(msg);
> +    char *rmsg = g_malloc(len);
> +
> +    /* write message to sd */
> +    int fd = open(sd_path, O_WRONLY);
> +    int ret = write(fd, msg, len);
> +    close(fd);

You should check the return value from open() and close()
(same again in code below)

> +    g_assert(ret == len);
> +
> +    /* read message using sdhci */
> +    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
> +    g_assert(ret == len);
> +    g_assert(!strcmp(rmsg, msg));
> +
> +    free(rmsg);
> +}

> +static void drive_create(void)
> +{
> +    int fd, ret;
> +    sd_path = g_strdup("/tmp/qtest.XXXXXX");

Please use a template string that gives an indication of
which test created the file. This helps subsequent debugging
of "where did this junk in my tmp directory come from?".

> +
> +    /* Create a temporary raw image */
> +    fd = mkstemp(sd_path);
> +    g_assert_cmpint(fd, >=, 0);
> +    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
> +    g_assert_cmpint(ret, ==, 0);
> +    g_message("%s", sd_path);
> +    close(fd);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    drive_create();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("npcm7xx_sdhci/reset", test_reset);
> +    qtest_add_func("npcm7xx_sdhci/write_sd", test_write_sd);
> +    qtest_add_func("npcm7xx_sdhci/read_sd", test_read_sd);
> +
> +    int ret = g_test_run();
> +    drive_destroy();
> +    return ret;
> +}

thanks
-- PMM

