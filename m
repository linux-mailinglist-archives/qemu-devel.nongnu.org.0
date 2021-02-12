Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1A331A0EF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:54:27 +0100 (CET)
Received: from localhost ([::1]:48854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZpy-0002aD-AR
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:54:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAZno-0001xA-Dv
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:52:12 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAZnm-0007D7-Cd
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:52:12 -0500
Received: by mail-ej1-x62e.google.com with SMTP id y9so16023132ejp.10
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 06:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=qbP3yM0YcO4nZFTX7Qs/Q7+TlKZBoEjilcf3Xsl+S2s=;
 b=KhmBIVuNJ5B8eFtgQrPzdUIl8gp1ykocEfsml59cVOn4KvKquGbLQ9UZIFmn8qN14j
 XrjfRVZi0fFDb64H+78L67JYBFCf5A5E65i6usS5D/qNdjgrOLk3qVfPq9VSj00dXyPB
 H9gPrwqiDBykdiuQ+fD8hvZTBRgZ+LkOTw3bbPuZNDjeL5paxqIQuJIvfxqKFdRGlvLo
 +9j4SR1yAz6Z0ier7bXcZ/rC7lIKrW4zRtsvt2mCcdqc4OiLFBBrI34RJs5rdxihbsaP
 qprIxxG3Gb0BXfdyuV0IeYZa37AqXCtNEEmIIfIBZyBZKShS/E5SwV376lo0qeggqJUX
 20ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=qbP3yM0YcO4nZFTX7Qs/Q7+TlKZBoEjilcf3Xsl+S2s=;
 b=fHXxv8reonm7L+SHCMV1JK28Jm+5YBcV/dBNXL87YUilrPr7MxOGzmPtuhXKjBW0QF
 ugatGuX/BQtrkuqyb10CoL6K1ErBqAjKTL2/62DUIlzjGC46bSKmTwhjCTGgjukkfW6N
 J2+aYCfBFohYrKCw+QVp2JSVLguKeYlfHF4XrzhYWrR27Vq2wpHN7svMh4pTf6kQyBqk
 uBWtKA1TPBxUT/t8JKQD6gE/bgwX8wgipyd+xbEpbDZcG4Dmxmj0jssnyC3lFlHfc/7t
 z7YV6OySF8rlZ+eauXw8Nz3hEIifXT5UPocKuaUz8X7Horr4VuMO/atXF7EIKV43cC4c
 b9zQ==
X-Gm-Message-State: AOAM530NrV/UPBIn1rxJBQVtdi6/bFa0WPGCdOo/STgmkomjfAQT47f2
 LICl5tWmqrmxGrRh8oLjDmGCedSAIkfbbggNohDEluJIGXTUKg==
X-Google-Smtp-Source: ABdhPJw7DxAgpr2nnHUgna5HGGpE0HNS0/rkG6/53y+OSsATTLCeuAHsQS/3SpNrvo7bdDk0C+aJcMkEKZPIYpegC7Y=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr3523127ejd.250.1613141528287; 
 Fri, 12 Feb 2021 06:52:08 -0800 (PST)
MIME-Version: 1.0
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-21-peter.maydell@linaro.org>
In-Reply-To: <20210205170019.25319-21-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Feb 2021 14:51:57 +0000
Message-ID: <CAFEAcA-JdkHbobhVy6sPVs+juDS=dHrA4=WmSrD0KxkayM361Q@mail.gmail.com>
Subject: Re: [PATCH 20/24] hw/arm/mps2-tz: Add new mps3-an524 board
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 17:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Add support for the mps3-an524 board; this is an SSE-200 based FPGA
> image, like the existing mps2-an521.  It has a usefully larger amount
> of RAM, and a PL031 RTC, as well as some more minor differences.
>
> In real hardware this image runs on a newer generation of the FPGA
> board, the MPS3 rather than the older MPS2.  Architecturally the two
> boards are similar, so we implement the MPS3 boards in the mps2-tz.c
> file as variations of the existing MPS2 boards.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> +static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
> +
> +    mc->desc = "ARM MPS3 with AN524 FPGA image for dual Cortex-M33";
> +    mc->default_cpus = 2;
> +    mc->min_cpus = mc->default_cpus;
> +    mc->max_cpus = mc->default_cpus;
> +    mmc->fpga_type = FPGA_AN524;
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
> +    mmc->scc_id = 0x41045240;
> +    mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
> +    mmc->oscclk = an524_oscclk;
> +    mmc->len_oscclk = ARRAY_SIZE(an524_oscclk);
> +    mmc->numirq = 95;
> +    mmc->raminfo = an524_raminfo;
> +    mmc->armsse_type = TYPE_SSE200;
> +    mps2tz_set_default_ram_info(mmc);
> +}

Oops, this is missing a couple of initialisations for
the FPGAIO config:

--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -1016,6 +1016,8 @@ static void mps3tz_an524_class_init(ObjectClass
*oc, void *data)
     mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
     mmc->oscclk = an524_oscclk;
     mmc->len_oscclk = ARRAY_SIZE(an524_oscclk);
+    mmc->fpgaio_num_leds = 10;
+    mmc->fpgaio_has_switches = true;
     mmc->numirq = 95;
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;

thanks
-- PMM

