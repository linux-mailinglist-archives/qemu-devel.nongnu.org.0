Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238EB5351DE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 18:11:16 +0200 (CEST)
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuG4w-0002R7-S5
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 12:11:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuFvS-0005vB-I1
 for qemu-devel@nongnu.org; Thu, 26 May 2022 12:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuFvP-0002oi-2U
 for qemu-devel@nongnu.org; Thu, 26 May 2022 12:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653580881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LbFtqV0q0YSidernfoQQRwxyBmz/7YLNOFw2dppAHCk=;
 b=FeN6rdDFahoQ0vNLbl2HW31hejIuamyXbZ+cUMxn4tToBiThRBuU3Pieh00dUBYavhm0Cw
 bcP7DRMGC7mqJh5tuy17pcQv5F494agJxbFE5J3bWUUu3nnxHXebTxARK4XYv1ZRMPja6W
 7GBCpc2pfEwB2tFPnOQvpwr/r7rJO+E=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-i9e7Qx3DOEmGjIBTVnve7A-1; Thu, 26 May 2022 12:01:21 -0400
X-MC-Unique: i9e7Qx3DOEmGjIBTVnve7A-1
Received: by mail-vs1-f71.google.com with SMTP id
 y10-20020a67c98a000000b00337a82081beso300815vsk.14
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 09:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbFtqV0q0YSidernfoQQRwxyBmz/7YLNOFw2dppAHCk=;
 b=idcCgtUZ42fL25SJa6lTgyz+g8YOTUOKA1rQQC7qwGs9l/UO4O7aCux8voo1IYeO7c
 HrJzI0TUfolrGBlEBe9IHUONAn9xooqIR2bZT8DnqvfpWYlfWcdZteGZIZHL6Rm0kJRD
 mVfzl3f+wnxS43Vr3z6XjLxrz7sVCmgFLkOPyM3jkOhjF1llzNfT1oZrp6ETvoTHGu1y
 /9hq8kk+A7B/R4Z2Lz04AoF8e09YOmmiy65OouzsTBAkj1ee3v0OmQg8FsoSdP0M3YYu
 w3UlpU6jGIAmRa3Z5d31VvQ6hXr7OarHP9I2KH4QX+ZcLoTxHBcYel6LuurECj6TBkwv
 3ZEA==
X-Gm-Message-State: AOAM530xONuBKsZ2b8XnVJMT5p9BKElh6qUfkK/s0d0xycnF85DqpEA1
 tMjjKbV2e3SHe39FiyLwCA7Y/e4ktLfk6xq4Q4cgj2bivcWMluqAmwkwkqr41Mop0j1aiRKFemd
 j8Kxw3T8AcoLxH7q+6GD5GDV/4S6fYP4=
X-Received: by 2002:a1f:ac07:0:b0:356:de8a:4a48 with SMTP id
 v7-20020a1fac07000000b00356de8a4a48mr14894939vke.24.1653580879534; 
 Thu, 26 May 2022 09:01:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1ZhFAaWmYENxMrTAyLmz2Vqfj1vnpQ+Gc31dB2PDU4jS1sz6JPMYtYsqPQd34SRFqZ41DDkb0r7G1USHuV3I=
X-Received: by 2002:a1f:ac07:0:b0:356:de8a:4a48 with SMTP id
 v7-20020a1fac07000000b00356de8a4a48mr14894881vke.24.1653580879058; Thu, 26
 May 2022 09:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
 <20220302205230.2122390-8-peter.maydell@linaro.org>
In-Reply-To: <20220302205230.2122390-8-peter.maydell@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 26 May 2022 12:01:09 -0400
Message-ID: <CAFn=p-Z+L_mgGSCx6X0Y=-Zy+n+0evx8coGa6voDrrcwuTxvbw@mail.gmail.com>
Subject: Re: [PULL 07/26] tests/qtest: add qtests for npcm7xx sdhci
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Shengtan Mao <stmao@google.com>, 
 Hao Wu <wuhaotsh@google.com>, Chris Rauer <crauer@google.com>, 
 Patrick Venture <venture@google.com>, Kamil Rytarowski <kamil@netbsd.org>, 
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Wed, Mar 2, 2022 at 4:03 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> Message-id: 20220225174451.192304-1-wuhaotsh@google.com
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/qtest/npcm7xx_sdhci-test.c | 215 +++++++++++++++++++++++++++++++
>  tests/qtest/meson.build          |   1 +
>  2 files changed, 216 insertions(+)
>  create mode 100644 tests/qtest/npcm7xx_sdhci-test.c
>
> diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
> new file mode 100644
> index 00000000000..c1f496fb29b
> --- /dev/null
> +++ b/tests/qtest/npcm7xx_sdhci-test.c
> @@ -0,0 +1,215 @@
> +/*
> + * QTests for NPCM7xx SD-3.0 / MMC-4.51 Host Controller
> + *
> + * Copyright (c) 2022 Google LLC
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
> +#define NPCM7XX_REG_SIZE 0x100
> +#define NPCM7XX_MMC_BA 0xF0842000
> +#define NPCM7XX_BLK_SIZE 512
> +#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
> +
> +char *sd_path;
> +
> +static QTestState *setup_sd_card(void)
> +{
> +    QTestState *qts = qtest_initf(
> +        "-machine kudo-bmc "
> +        "-device sd-card,drive=drive0 "
> +        "-drive id=drive0,if=none,file=%s,format=raw,auto-read-only=off",
> +        sd_path);
> +
> +    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_SWRST, SDHC_RESET_ALL);
> +    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_CLKCON,
> +                 SDHC_CLOCK_SDCLK_EN | SDHC_CLOCK_INT_STABLE |
> +                     SDHC_CLOCK_INT_EN);
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
> +    int fd, ret;
> +    size_t len = strlen(msg);
> +    char *rmsg = g_malloc(len);
> +
> +    /* write message to sd */
> +    fd = open(sd_path, O_WRONLY);
> +    g_assert(fd >= 0);
> +    ret = write(fd, msg, len);
> +    close(fd);
> +    g_assert(ret == len);
> +
> +    /* read message using sdhci */
> +    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
> +    g_assert(ret == len);
> +    g_assert(!memcmp(rmsg, msg, len));
> +
> +    g_free(rmsg);
> +}
> +
> +/* Check MMC can read values from sd */
> +static void test_read_sd(void)
> +{
> +    QTestState *qts = setup_sd_card();
> +
> +    write_sdread(qts, "hello world");
> +    write_sdread(qts, "goodbye");
> +
> +    qtest_quit(qts);
> +}
> +
> +static void sdwrite_read(QTestState *qts, const char *msg)
> +{
> +    int fd, ret;
> +    size_t len = strlen(msg);
> +    char *rmsg = g_malloc(len);
> +
> +    /* write message using sdhci */
> +    sdhci_write_cmd(qts, NPCM7XX_MMC_BA, msg, len, NPCM7XX_BLK_SIZE);
> +
> +    /* read message from sd */
> +    fd = open(sd_path, O_RDONLY);
> +    g_assert(fd >= 0);
> +    ret = read(fd, rmsg, len);
> +    close(fd);
> +    g_assert(ret == len);
> +
> +    g_assert(!memcmp(rmsg, msg, len));
> +
> +    g_free(rmsg);
> +}
> +
> +/* Check MMC can write values to sd */
> +static void test_write_sd(void)
> +{
> +    QTestState *qts = setup_sd_card();
> +
> +    sdwrite_read(qts, "hello world");
> +    sdwrite_read(qts, "goodbye");
> +
> +    qtest_quit(qts);
> +}
> +
> +/* Check SDHCI has correct default values. */
> +static void test_reset(void)
> +{
> +    QTestState *qts = qtest_init("-machine kudo-bmc");
> +    uint64_t addr = NPCM7XX_MMC_BA;
> +    uint64_t end_addr = addr + NPCM7XX_REG_SIZE;
> +    uint16_t prstvals_resets[] = {NPCM7XX_PRSTVALS_0_RESET,
> +                                  NPCM7XX_PRSTVALS_1_RESET,
> +                                  0,
> +                                  NPCM7XX_PRSTVALS_3_RESET,
> +                                  0,
> +                                  0};
> +    int i;
> +    uint32_t mask;
> +
> +    while (addr < end_addr) {
> +        switch (addr - NPCM7XX_MMC_BA) {
> +        case SDHC_PRNSTS:
> +            /*
> +             * ignores bits 20 to 24: they are changed when reading registers
> +             */
> +            mask = 0x1f00000;
> +            g_assert_cmphex(qtest_readl(qts, addr) | mask, ==,
> +                            NPCM7XX_PRSNTS_RESET | mask);
> +            addr += 4;
> +            break;
> +        case SDHC_BLKGAP:
> +            g_assert_cmphex(qtest_readb(qts, addr), ==, NPCM7XX_BLKGAP_RESET);
> +            addr += 1;
> +            break;
> +        case SDHC_CAPAB:
> +            g_assert_cmphex(qtest_readq(qts, addr), ==, NPCM7XX_CAPAB_RESET);
> +            addr += 8;
> +            break;
> +        case SDHC_MAXCURR:
> +            g_assert_cmphex(qtest_readq(qts, addr), ==, NPCM7XX_MAXCURR_RESET);
> +            addr += 8;
> +            break;
> +        case SDHC_HCVER:
> +            g_assert_cmphex(qtest_readw(qts, addr), ==, NPCM7XX_HCVER_RESET);
> +            addr += 2;
> +            break;
> +        case NPCM7XX_PRSTVALS:
> +            for (i = 0; i < NPCM7XX_PRSTVALS_SIZE; ++i) {
> +                g_assert_cmphex(qtest_readw(qts, addr + 2 * i), ==,
> +                                prstvals_resets[i]);
> +            }
> +            addr += NPCM7XX_PRSTVALS_SIZE * 2;
> +            break;
> +        default:
> +            g_assert_cmphex(qtest_readb(qts, addr), ==, 0);
> +            addr += 1;
> +        }
> +    }
> +
> +    qtest_quit(qts);
> +}
> +
> +static void drive_destroy(void)
> +{
> +    unlink(sd_path);
> +    g_free(sd_path);
> +}
> +
> +static void drive_create(void)
> +{
> +    int fd, ret;
> +    GError *error = NULL;
> +
> +    /* Create a temporary raw image */
> +    fd = g_file_open_tmp("sdhci_XXXXXX", &sd_path, &error);
> +    if (fd == -1) {
> +        fprintf(stderr, "unable to create sdhci file: %s\n", error->message);
> +        g_error_free(error);
> +    }
> +    g_assert(sd_path != NULL);
> +
> +    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
> +    g_assert_cmpint(ret, ==, 0);

This assertion is failing under the netbsd vm test;

"make vm-build-netbsd" produces the following output:

241/572 ERROR:../src/tests/qtest/npcm7xx_sdhci-test.c:195:drive_create:
assertion failed (ret == 0): (-1 == 0) ERROR
241/572 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_sdhci-test
           ERROR           0.02s   killed by signal 6 SIGABRT

I've found it to fail on both my intel laptop and AMD 5950x desktop,
Fedora 34/35. I'm using default/automagic configure flags for my
build.

I haven't debugged any further, but noticed when trying to run the
entire test battery to test some build system changes.
(openbsd and freebsd VMs seem to work just fine, does ftruncate on a
tmpfs behave differently on netbsd?)

--js


