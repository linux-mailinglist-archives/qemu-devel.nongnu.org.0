Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78633A6B5C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 18:13:04 +0200 (CEST)
Received: from localhost ([::1]:34788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lspCx-0001c8-V9
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 12:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsp5L-0006gz-17
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:05:11 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsp5F-0006sw-1R
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 12:05:10 -0400
Received: by mail-ed1-x530.google.com with SMTP id w21so47149363edv.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jxeFDMQiVcsCBOr6A9O81BcfJKxBuhtCtHoi9NFQOmA=;
 b=wA5Z2lWu0j+u+on9jukyDVclDozasgnFICuux3RgEHMujn2g8d03TARv9WDBwVeFmI
 i5+zJN8cs/2LOVaZ+E1DqLrr0bDK2qv3YF3yuMSFHK2AdqVPZgCM8ruJjcJi5oa8djsP
 t26humGIng6mBnXYGE9S2UFjOkVVyBN+7rPymWNjxotdA9q39+66NLwHhT7E3J3hHg9Y
 8eEWPNocYlqOETOnjY+R5omP5DWIORFAjDpx7OnED8xaBcL7JJwAZsPsu+yy+WcPQi/V
 yupbMFZl2CormJJJ0LwbZQAphk8SbfKJ9+RsM0XUJfSVtIEzo65fQjbowGUbWSKJnC9q
 DoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jxeFDMQiVcsCBOr6A9O81BcfJKxBuhtCtHoi9NFQOmA=;
 b=M1NeqjBDtfhiGH6xItFfJXsFO1jiipL6LqHzJsX364503Oyu80nPRxBJDQCz2CWKJi
 /ezQR1PXCIcnVo8OiiyJD7ybXsSN66SBtpy716T9UQAtX+rj3UhvNTULdD0rt3ocnVPV
 5tqrkJbk0lnvfIaFDHQFgGRMdqk0sSl4jMQKSgT6yLB83ngncJPoujcjhYWETRzDFVqh
 rtPlZb9Io0iUzx+T+bHnCZIH8I1deDuNC8lrzVnr+cojRpXdMAl6T33kMDv9tjBru+9d
 80oBZ/NTa6AfQnebOz7JF4xycHW44AedQPgvuU4f56BN+mBwR3osMStZJZ3wfSR49Y5P
 9fVA==
X-Gm-Message-State: AOAM530Eo3QGivAPwjHst8hM1r7Y6/zMOciihwajIaMSUwyUDopdeFj8
 UiU+d1O5Kfpaa/UdaHOsROS7vOt58AMbe/YIuIU+kg==
X-Google-Smtp-Source: ABdhPJy5HagwoYsD4rvsbQ9i2cmtjhcIfKT5q4x61uSL89Jk5y5a+jCsWVwsep/vzHkUYeDvtlFTHo/wsqFcJXp6sYo=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr17907200edv.204.1623686703233; 
 Mon, 14 Jun 2021 09:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-2-erdnaxe@crans.org>
In-Reply-To: <20210608161028.4159582-2-erdnaxe@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 17:04:28 +0100
Message-ID: <CAFEAcA_YkqObpY6E8QiL-_+bLn_3xigv=djtRCdPDNvF4VT4kw@mail.gmail.com>
Subject: Re: [PATCH 1/2] stm32f100: Add the stm32f100 SoC
To: Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Jun 2021 at 17:10, Alexandre Iooss <erdnaxe@crans.org> wrote:
>
> This SoC is similar to stm32f205 SoC.
> This will be used by the STM32VLDISCOVERY to create a machine.
>
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
> ---
>  MAINTAINERS                    |   6 ++
>  hw/arm/Kconfig                 |   6 ++
>  hw/arm/meson.build             |   1 +
>  hw/arm/stm32f100_soc.c         | 182 +++++++++++++++++++++++++++++++++
>  include/hw/arm/stm32f100_soc.h |  58 +++++++++++
>  5 files changed, 253 insertions(+)
>  create mode 100644 hw/arm/stm32f100_soc.c
>  create mode 100644 include/hw/arm/stm32f100_soc.h

> +    /* Init ARMv7m */
> +    armv7m = DEVICE(&s->armv7m);
> +    qdev_prop_set_uint32(armv7m, "num-irq", 96);

Is this definitely right? The STM32F00 datasheet I found
thinks it only has 61 external interrupts.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linar.org>

thanks
-- PMM

