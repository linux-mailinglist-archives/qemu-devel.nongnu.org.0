Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A5318714F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 18:39:00 +0100 (CET)
Received: from localhost ([::1]:44504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDthb-0004H8-3u
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 13:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40151)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jDrq8-0002je-97
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:39:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jDrq7-000338-7T
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:39:40 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33193)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jDrq7-00031s-2j
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:39:39 -0400
Received: by mail-ot1-x343.google.com with SMTP id x26so1248514otk.0
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 08:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QY+2OTb9MtqR8dUS65wKid5CTkKHyVlGBNUsDgaEhho=;
 b=mQyc7ztP/hyXeViBYmkn0Bq8YywvRqacuV7dFmrekRLjD1YoWVHelUsamUdNOwbWJu
 libKIWV9wJFflpOcVxEGjuY0GgLlvWKjS+Hbohvq9veacQ3gFa2TkzGKklbDmADThxpL
 GB1g+Ug0YI0n/WdfixNVcnmPwBQYHLkw6n1B44y5l1xF78YbgDEu+gU+hJyZXa0DiNTL
 aA+2Mnl7x9p6ElyK0kNtPbyOIbtUX0wBgj6umXxSfkdZzo5zuBdvd9WgPY9hNJmdlAnz
 8Zhn4KHdG5NZ+bycf4IbBoeF+qCSL5XovMZ+MG6vwhSpofV7lPnewdTMLLtISK5iMm1/
 UbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QY+2OTb9MtqR8dUS65wKid5CTkKHyVlGBNUsDgaEhho=;
 b=Ud02n9phcK3dc2CfrUrgHsT8cPwwpTE1Sz5OtXZNTetHfcTpec9OE4SbaoEj1sU9zg
 YmkWQ9l4g8TWiH293Np47znni6O8ADjCLZEda9IokcPSqSJWxYiP8BWse7XIDRJcRXX4
 yDoOZuKu3n5W2fwy7dtJextsqlCVhwv/Be+eQDCHtejriG3l+wjtFcxLrYW2WEUfY57U
 k//W95lfg2GmYkdtMWI1L7esuTFGNjTtzRNXdfZSQSbcNeNkHuYyJ8gvJml7uI5LeiJi
 xMYPvB6+FKOgGlYUJo8pOHE0oO/3JDdSOvAhEt9aZO2vYlWQr13JUQefsNTXCmhHd0U/
 w5tQ==
X-Gm-Message-State: ANhLgQ3V0rGXhMLZT8hwYwEtWLpoARDqqkBGGJ6KlM23FGA9XhFhgwuP
 Q5IsTXqENTomKQ+Itogoiwk5HY+pwDCg0EJX1qJr6A==
X-Google-Smtp-Source: ADFU+vtBhJb8IIcessTKIRqdr4NAhDnfCkrgpiP/NxD8BpYZcB1yu1e69JsmaS0vuRM+9JkvkRHnXN48pk+5hd8VHuI=
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr14088916otm.91.1584373178312; 
 Mon, 16 Mar 2020 08:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200313161506.8834-1-linux@roeck-us.net>
In-Reply-To: <20200313161506.8834-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2020 15:39:27 +0000
Message-ID: <CAFEAcA-63OJfcnjE0V4W5a0R2tq_t0oRL7dre_WY_We0Jz9KoA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/fsl-imx7: Instantiate apbh_dma and ocotp as
 unimplemented devices
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Mar 2020 at 16:15, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Instantiating apbh_dma and ocotp as unimplemented devices prevents crashes
> when booting Linux.
>
> apbh_dma:
>
> [   14.046518] Unhandled fault: external abort on non-linefetch (0x808) at 0xd0852008
> [   14.047287] pgd = (ptrval)
> [   14.047607] [d0852008] *pgd=8b028811, *pte=33000653, *ppte=33000453
> [   14.050074] Internal error: : 808 [#1] SMP ARM
> ...
> [   14.077029] [<c0856530>] (stmp_clear_poll_bit) from [<c0856580>] (stmp_reset_block+0x10/0xb8)
> [   14.077642] [<c0856580>] (stmp_reset_block) from [<c1a9655c>] (mxs_dma_probe+0x1f4/0x370)
> [   14.078158] [<c1a9655c>] (mxs_dma_probe) from [<c0b6a7e8>] (platform_drv_probe+0x48/0x98)
> [   14.078641] [<c0b6a7e8>] (platform_drv_probe) from [<c0b685c4>] (really_probe+0x228/0x2d0)
>
> ocotp:
>
> [   71.286109] Unhandled fault: external abort on non-linefetch (0x008) at 0xd0ff0000
> [   71.287891] pgd = (ptrval)
> [   71.288449] [d0ff0000] *pgd=8b497811, *pte=30350653, *ppte=30350453
> [   71.291389] Internal error: : 8 [#1] SMP ARM
> [   71.292302] Modules linked in:
> [   71.293583] CPU: 0 PID: 112 Comm: kworker/0:3 Not tainted 5.0.0-10153-g065b6c4c913d-dirty #2
> [   71.294148] Hardware name: Freescale i.MX7 Dual (Device Tree)
> [   71.296728] Workqueue: events deferred_probe_work_func
> [   71.297740] PC is at imx_ocotp_read+0x68/0x180
> [   71.298154] LR is at mark_held_locks+0x48/0x74
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/fsl-imx7.c         | 11 +++++++++++
>  include/hw/arm/fsl-imx7.h |  6 ++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
> index 119b281a50..a17136f83c 100644
> --- a/hw/arm/fsl-imx7.c
> +++ b/hw/arm/fsl-imx7.c
> @@ -459,6 +459,17 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
>       */
>      create_unimplemented_device("sdma", FSL_IMX7_SDMA_ADDR, FSL_IMX7_SDMA_SIZE);
>
> +    /*
> +     * OCOTP
> +     */
> +    create_unimplemented_device("octop", FSL_IMX7_OCOTP_ADDR,
> +                                FSL_IMX7_OCOTP_SIZE);

"octop" or "ocotp" ?


thanks
-- PMM

