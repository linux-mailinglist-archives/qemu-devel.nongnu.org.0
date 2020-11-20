Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8F52BB0F5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:53:41 +0100 (CET)
Received: from localhost ([::1]:42998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9fI-0004jf-Qz
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9ad-0000rR-Ci
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:48:51 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:41778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9aZ-0002nR-Gp
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:48:49 -0500
Received: by mail-ej1-x629.google.com with SMTP id gj5so13778584ejb.8
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Odi3BoS2qTZsg8YLZLhOiqoD3J/LWyFvB/MSV4PWi+g=;
 b=eG1/P3j8wU7Z+sjgERs9wsKeCEGq339W0FJGaqLMpa5Usvad4p7pk+ATDDNWDEYNgv
 HnRsFFJV1zDzfno/oNIVpVNFY2W8pNJOkul6h0oMGdPuxP7kjTOpPm6xDVA4a6K+vMJH
 xxtu+uJmuXhC/zMMJ2BCvFJWODke5sDTZcLK5arvhwGjkR9bfvuaNgkcC9kfkUCsA3x/
 xOpdHNWtYLAbT7OpQTGtn+65Fy6NYPFI71nDzUeUl/Nlo6hSNpYzFYIWv+SXh3wHi3JS
 znVBDfyIafTFE2Q+fNbBwRg/kNzw70m1gvGQlEf5mb6DcpZBc1lgtIValvpZnROLQZjK
 DTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Odi3BoS2qTZsg8YLZLhOiqoD3J/LWyFvB/MSV4PWi+g=;
 b=akaVRk2+PcvUmcfEf48stA9x4AiZyGAkeDgzc5I8Mqul1XZwZwYCPFB34GfFa42Tql
 W7b11qUHLtFaZCsT9pEZVmfOb/44I0fVs85FyZPhuU/FmYMqZnEOD7eb0gR6neq9izPq
 iTk06O5XYe/vvD3abPZC4kBz864n+5hZTSkg4Gg8eFX2KKrdQn8p1UcLHMcN/ofepcDM
 qj0Giwr/M9xaDfN0/0xT65xzZwl+OnxFXnLNpr0BQAXyeChOunlElp9JczLx+y/BJtE/
 AohLERiH1qLaAyk8F7jYq3LuKIlqiT0VGBnDYta3UlhMoA7cq4UwQKbB7DBWveWpNICK
 8IAA==
X-Gm-Message-State: AOAM530Ru7tS81R6mc5ftbQmcCpnvlEMs0C5KXkBw5t9/JvbZEdzB/Iw
 2UqoGISezGEbs+xp7VHGYeIszimShgYdGu4Elvy7MA==
X-Google-Smtp-Source: ABdhPJwZnZSxMYOUdu2XcyJV0NnWT6rwjDPYA58p2/mCBXe7FyGFsF+txvzrdVVZn3s8Lhkvt1VsN6g2+HPYs6/dZQ4=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr35242879ejr.56.1605890925956; 
 Fri, 20 Nov 2020 08:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20201120152140.2493197-1-f4bug@amsat.org>
 <20201120152140.2493197-3-f4bug@amsat.org>
In-Reply-To: <20201120152140.2493197-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 16:48:34 +0000
Message-ID: <CAFEAcA85nhCv6DH-Kf0CqfaN5rYrhzE=TY54MNEqn5ko3wkDNQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 2/4] docs/system/arm: Document the various raspi
 boards
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Nov 2020 at 15:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Document the following Raspberry Pi models:
>
>  - raspi0               Raspberry Pi Zero (revision 1.2)
>  - raspi1ap             Raspberry Pi A+ (revision 1.1)
>  - raspi2b              Raspberry Pi 2B (revision 1.1)
>  - raspi3ap             Raspberry Pi 3A+ (revision 1.0)
>  - raspi3b              Raspberry Pi 3B (revision 1.2)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  docs/system/arm/raspi.rst  | 44 ++++++++++++++++++++++++++++++++++++++
>  docs/system/target-arm.rst |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 docs/system/arm/raspi.rst
>
> diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
> new file mode 100644
> index 00000000000..b19284e4481
> --- /dev/null
> +++ b/docs/system/arm/raspi.rst
> @@ -0,0 +1,44 @@
> +Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``=
, ``raspi3b``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +
> +QEMU provides models the following Raspberry Pi boards:

"models of"

> +
> +``raspi0`` and ``raspi1ap``
> +  ARM1176JZF-S core, 512 MiB of RAM
> +``raspi2b``
> +  Cortex-A7 (4 cores), 1 GiB of RAM
> +``raspi3ap``
> +  Cortex-A53 (4 cores), 512 MiB of RAM
> +``raspi3b``
> +  Cortex-A53 (4 cores), 1 GiB of RAM
> +
> +
> +Implemented devices
> +-------------------
> +
> + * ARM1176JZF-S, Cortex-A7 or Cortex-A53 CPU
> + * Interrupt controller
> + * DMA controller
> + * Clock and reset controller (CPRMAN)
> + * System Timer
> + * GPIO controller
> + * Serial ports (BCM2835 AUX - 16550 based - and PL011)
> + * Random Number Generator (RNG)
> + * Frame Buffer
> + * USB host (USBH)
> + * GPIO controller
> + * SD/MMC host controller
> + * SoC thermal sensor
> + * USB2 host controller (DWC2 and MPHI)
> + * MailBox controller (MBOX)
> + * VideoCore firmware (property)
> +
> +
> +Missing devices
> +---------------
> +
> + * Peripheral SPI controller (SPI)
> + * Analog to Digital Converter (ADC)
> + * Pulse Width Modulation (PWM)
> + * Security features

"Security features" is a bit vague; could we be more precise?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

