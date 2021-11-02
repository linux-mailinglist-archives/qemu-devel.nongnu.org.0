Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A90F84434D4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 18:50:33 +0100 (CET)
Received: from localhost ([::1]:33722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhxvc-0007q4-RP
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 13:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhxte-0005gc-DU
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:48:31 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:41527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhxtb-0004kI-UF
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 13:48:30 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso21131wmf.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 10:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UxNGfqoWjQlRiR+XeV5CVKz1qkMXPZyYdfZBZ5vBqX4=;
 b=VraJXQGNVLa3ZHYVHu2Wbk72+rHMOD+MFGvw0yPVmdtuyxEBy6AjEZ5bOyj5LmVWgO
 c63TZNzGFQcJJMDB4zAY6xJGeyyEsMwY4uM9RMXhbvfKKJuaoVz3ydGj8uPk//VPR88k
 6CEks6QXYcVzzkOwLqPDx28f+BSnOjkTHWHEPi3SWJKHwV4bgOqqG7TQ7Z0ndsDPdAjD
 vB/NkmF/4xigPNMsSgvr6rqRn2oGw8gzcKpZfNj0Brb2bAffZMrTOOuqzuUZzM6W/B7d
 4XEfQfFZC4D+8uZ1Q7iw8xSr9piBIOTqycqXyRaBBEDKC4JNekPZyeBFw+MhQrumma2o
 Bc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UxNGfqoWjQlRiR+XeV5CVKz1qkMXPZyYdfZBZ5vBqX4=;
 b=1KGA0/YuXI2xEo6vv2gssN6/yPOP7kn7lPrfO0YvQ/YC66ZI30rseXxDOX9hsTErXO
 DB/6Sd9nCbAytfC+mbFbP9d+XjmfMJskuMQWmdNdzN+Xwathfsz+tysivGA+YZKVQKnj
 QQc5iB9CIaEHHgQA9j1aAUE2e75eX7nLg/URmRl7onCnn6DgH2S1WW68ii3ygxg4NeBB
 uNneJPt+Gyk6ae2xE8Girnb9HQBmYlWzShxMCfAVSKms4sb6khITfaOX864zmrKJ/eDZ
 O09MgvnwIlPr7p/BuIZUjUGgJZ44KR4t7iYpv9yU17xN6ti3Bs0RCAigywR2FuOv/Tgh
 VtyQ==
X-Gm-Message-State: AOAM530+6RYKjmQFke79ALiZ6D3aZ05fmlIrtGfgmFg0DSa6ch6gYGg8
 dj7A4rASzOmwix6X/CbqSGI=
X-Google-Smtp-Source: ABdhPJxcXRTRLdYoyjLNcctbbJ0MJlMV70PSBIYnnR0e0WU7SPD11b8Qn6sEP4BmapPYPwYewATIxA==
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr8395866wmk.172.1635875306289; 
 Tue, 02 Nov 2021 10:48:26 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k187sm3517210wme.0.2021.11.02.10.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 10:48:25 -0700 (PDT)
Message-ID: <b674cabd-539c-b43d-f6c2-238733b6f800@amsat.org>
Date: Tue, 2 Nov 2021 18:48:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 05/12] tests/qtest: add qtests for npcm7xx sdhci
Content-Language: en-US
To: Hao Wu <wuhaotsh@google.com>, Shengtan Mao <stmao@google.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211102105934.214596-1-richard.henderson@linaro.org>
 <20211102105934.214596-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211102105934.214596-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tyrone Ting <kfting@nuvoton.com>, Chris Rauer <crauer@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 11/2/21 11:59, Richard Henderson wrote:
> From: Shengtan Mao <stmao@google.com>
> 
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Message-Id: <20211008002628.1958285-6-wuhaotsh@google.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/qtest/npcm7xx_sdhci-test.c | 209 +++++++++++++++++++++++++++++++
>  tests/qtest/meson.build          |   1 +
>  2 files changed, 210 insertions(+)
>  create mode 100644 tests/qtest/npcm7xx_sdhci-test.c

> +static void write_sdread(QTestState *qts, const char *msg)
> +{
> +    size_t len = strlen(msg);
> +    char *rmsg = g_malloc(len);
> +
> +    /* write message to sd */
> +    int fd = open(sd_path, O_WRONLY);
> +    int ret;
> +
> +    g_assert(fd > 0);
> +    ret = write(fd, msg, len);
> +    g_assert(ret == len);
> +    ret = close(fd);
> +    g_assert(ret == 0);
> +
> +    /* read message using sdhci */
> +    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
> +    g_assert(ret == len);
> +    g_assert(!strcmp(rmsg, msg));
> +
> +    free(rmsg);
> +}

> +static void sdwrite_read(QTestState *qts, const char *msg)
> +{
> +    size_t len = strlen(msg);
> +    char *rmsg = g_malloc(len);
> +
> +    /* write message using sdhci */
> +    sdhci_write_cmd(qts, NPCM7XX_MMC_BA, msg, len, NPCM7XX_BLK_SIZE);
> +
> +    /* read message from sd */
> +    int fd = open(sd_path, O_RDONLY);
> +    int ret;
> +
> +    g_assert(fd > 0);
> +    ret = read(fd, rmsg, len);
> +    g_assert(ret == len);
> +    ret = close(fd);
> +    g_assert(ret == 0);
> +
> +    g_assert(!strcmp(rmsg, msg));

Looking at this failure on s390x host (big-endian) with Richard:
https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/546307442#L9370

ERROR:../tests/qtest/npcm7xx_sdhci-test.c:104:sdwrite_read: assertion
failed: (!strcmp(rmsg, msg))
ERROR qtest-arm/npcm7xx_sdhci-test - Bail out!
ERROR:../tests/qtest/npcm7xx_sdhci-test.c:104:sdwrite_read: assertion
failed: (!strcmp(rmsg, msg))

it seems you want to use strncmp() or memcmp() here.

> +    free(rmsg);
> +}

