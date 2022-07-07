Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DE8569AAC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 08:46:50 +0200 (CEST)
Received: from localhost ([::1]:38618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9LHk-0007fN-PX
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 02:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o9LBf-0006Vn-Iu; Thu, 07 Jul 2022 02:40:31 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o9LBa-0007Ka-BO; Thu, 07 Jul 2022 02:40:31 -0400
Received: by mail-wr1-x430.google.com with SMTP id z12so15267342wrq.7;
 Wed, 06 Jul 2022 23:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uyXwDTBgNxm6yYOiAxFyUFRB8JwP1em8UAAS5GyLauE=;
 b=VlTWuLODYwujTKuOU15lpQPlKkt3hC0gjyNq08hm5GjKKt5CR0SWaxToL2y5xpWH7q
 CHZ8gVMxPhBV9fcs3JaJHn8JqnX3QAk4jpSc4jq0SJTR+V2I9y2O49ER5upmVIIOe/yI
 btLCI8qExOqU2YoUARZWzJGA/YiaiTsYaUyI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uyXwDTBgNxm6yYOiAxFyUFRB8JwP1em8UAAS5GyLauE=;
 b=TgZjdmnSrwkB3wwMU3EzJuU9jNmuDZAciXgMQONcCEjfGifLBpiNlN22RnGumne42/
 RLb1GiP/kmfzVmTnb1yqo/aXVo9OHR/sPUcQCcJy/lC9CVY6NcJSuIoLvRS5N+qhPlhG
 nJBAiTpPzOPhJ+MkvJg5NKJ2FvbEaPeHxvLPwt/x+P+z0hvNdziDpUwKpqOW5x/3iIAD
 X9L6PLJMVFUyz976boVA4F266d6zkM5VHSGBXwTtTFTCnFkPQvS1rmRqHTu0ivP0Kf0b
 7PA57h1pfnHK9Yu8F+I4z6X6+cNYpgVLvsG76/XYATYZAU6dd3Bpi7DUnaqh9SzNnR/0
 Kr6w==
X-Gm-Message-State: AJIora8CKlmGPGnoc1Memndy03cvyfdCNbLwygkq+AWUzFoH8Fw6kCy6
 ES54MOVlPX94CpZKRmodNRJfI4EAtLzEHu0PNH8=
X-Google-Smtp-Source: AGRyM1sDqLvEvpAMPv0rVS9hK8CRFZ5kz3S8t97NR2EEmTFsYnx8DPKRHNBDUbW9GDmC+4H1YPYv1EzfDffWq6I1TqM=
X-Received: by 2002:a05:6000:1446:b0:21d:2245:ab65 with SMTP id
 v6-20020a056000144600b0021d2245ab65mr40704036wrx.315.1657176024463; Wed, 06
 Jul 2022 23:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220706172131.809255-1-clg@kaod.org>
In-Reply-To: <20220706172131.809255-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 7 Jul 2022 06:40:12 +0000
Message-ID: <CACPK8Xen+qaTYE5UAuRXih_VdAhhRUpRR+hRT9PhzPMksf1uYw@mail.gmail.com>
Subject: Re: [PATCH] docs: aspeed: Minor updates
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Wed, 6 Jul 2022 at 17:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Some more controllers have been modeled recently. Reflect that in the
> list of supported devices. New machines were also added.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  docs/system/arm/aspeed.rst | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 445095690c04..6c5b05128ea8 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -31,7 +31,10 @@ AST2600 SoC based machines :
>  - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
>  - ``rainier-bmc``          IBM Rainier POWER10 BMC
>  - ``fuji-bmc``             Facebook Fuji BMC
> +- ``bletchley-bmc``        Facebook Bletchley BMC
>  - ``fby35-bmc``            Facebook fby35 BMC
> +- ``qcom-dc-scm-v1-bmc``   Qualcomm DC-SCM V1 BMC
> +- ``qcom-firework-bmc``    Qualcomm Firework BMC
>
>  Supported devices
>  -----------------
> @@ -40,7 +43,7 @@ Supported devices
>   * Interrupt Controller (VIC)
>   * Timer Controller
>   * RTC Controller
> - * I2C Controller
> + * I2C Controller, including the new register interface of the AST2600
>   * System Control Unit (SCU)
>   * SRAM mapping
>   * X-DMA Controller (basic interface)
> @@ -57,6 +60,10 @@ Supported devices
>   * LPC Peripheral Controller (a subset of subdevices are supported)
>   * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
>   * ADC
> + * Secure Boot Controller (AST2600)
> + * eMMC Boot Controller (dummy)
> + * PECI Controller (minimal)
> + * I3C Controller

I missed these patches. That's good news, it's good to see some more
of the SoC modelled.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
>
>  Missing devices
> @@ -68,12 +75,10 @@ Missing devices
>   * Super I/O Controller
>   * PCI-Express 1 Controller
>   * Graphic Display Controller
> - * PECI Controller
>   * MCTP Controller
>   * Mailbox Controller
>   * Virtual UART
>   * eSPI Controller
> - * I3C Controller
>
>  Boot options
>  ------------
> @@ -154,6 +159,8 @@ Supported devices
>   * LPC Peripheral Controller (a subset of subdevices are supported)
>   * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
>   * ADC
> + * Secure Boot Controller
> + * PECI Controller (minimal)
>
>
>  Missing devices
> @@ -161,7 +168,6 @@ Missing devices
>
>   * PWM and Fan Controller
>   * Slave GPIO Controller
> - * PECI Controller
>   * Mailbox Controller
>   * Virtual UART
>   * eSPI Controller
> --
> 2.35.3
>

