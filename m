Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 038F6187135
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 18:34:14 +0100 (CET)
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDtcz-00036a-1B
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 13:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34588)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jDrmF-0000sn-RS
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:35:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jDrmE-00083j-Tb
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:35:39 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36809)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jDrmE-00081I-P0
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:35:38 -0400
Received: by mail-ot1-x342.google.com with SMTP id 39so2858821otu.3
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ulsEnALMcD0ysXus3/RMO287XVA+9Ung44pDMgmtgDg=;
 b=l6Ctfqzk+z+2b3c0vADY3E6pku9HwyyhnJTLghmdbaxJDvAaORncdR2/xGJgMkfwD2
 rLUdz/H33Y5u64N2ukppY9n5680rcV1jnzzgOEeL+yJRZ9lSJQjKqxfN+b4qE0kvoQNX
 SgO2zPpsxTSr9MfPyRryH9QGxBxiprs2ZIRm+Eby5/PY/ng01/mWLj5Ciz8jz66b1oEF
 2aZE/byUddo6k94LIsfwwbzfGD9nl0+V5aHHW+MqN18PruPk37Fu3mwWKtASl7fKulvA
 ZoAR92Rr9hryCaUl2P7FB+4KoU/PSNfxTunalUuw5irQKVltELfFRGtzP4KBo6ZVJn1T
 juhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ulsEnALMcD0ysXus3/RMO287XVA+9Ung44pDMgmtgDg=;
 b=XGz3FXf92NkqZYcjwMawRGVm8NqJCqBs9faj7jxl6iM/hLQKs4GRylEjsUb0e0E9O+
 8OX20cM/2ZW1AkrVIVpgSnYTdCtQTyWQwoftQMV3De2sOppOazmP1EGtANPg3XtzNFEE
 RU+O6sH8kPylclgpnkpqvCZUJaxheIuYTg0zWJZf5d6l1H+x5QASjsIpfcYO1bPNMsXL
 vIdkpncr4zuq7PE6pX+XXYM3Kn6M8FwlU5uYyAudApYHS+rPWB39uhjV9sGuG00IAMSI
 HO/GzlcLOf2OONCgoaUJvAQoFMQgOyS+IcZrzGxRyC1k+5Ivf7wFRAIbHmTmRd7ulZ2s
 LxTg==
X-Gm-Message-State: ANhLgQ3aZ4WljElPpFukiokfxvykboOlt5Bw7Hofqr2yqNB3rfawd81G
 RB/GsxQKwhjX7TKCNNhE4ZbSYKw7GCOynMgYUKAK2A==
X-Google-Smtp-Source: ADFU+vszBB52Gut7K3HLexl/RKBGmdTJfthMNKdK8LSqddArO2yPkKu6dfMijV2B87DTQGuxN3A2WCZytuPTAFcL6Cc=
X-Received: by 2002:a9d:1920:: with SMTP id j32mr21824947ota.221.1584372937456; 
 Mon, 16 Mar 2020 08:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200313160215.28155-1-linux@roeck-us.net>
In-Reply-To: <20200313160215.28155-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2020 15:35:26 +0000
Message-ID: <CAFEAcA-rJCGZC+0G8L=Qbp602SF_=t58bP6v5adQCsDXjtetOg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/pxa2xx: Do not wire up OHCI for PXA255
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Mar 2020 at 16:02, Guenter Roeck <linux@roeck-us.net> wrote:
>
> PXA255 does not support a USB OHCI controller, so don't wire it up.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/pxa2xx.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
> index 56a36202d7..336c9bad4a 100644
> --- a/hw/arm/pxa2xx.c
> +++ b/hw/arm/pxa2xx.c
> @@ -2290,9 +2290,6 @@ PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
>          s->ssp[i] = (SSIBus *)qdev_get_child_bus(dev, "ssi");
>      }
>
> -    sysbus_create_simple("sysbus-ohci", 0x4c000000,
> -                         qdev_get_gpio_in(s->pic, PXA2XX_PIC_USBH1));
> -
>      s->pcmcia[0] = pxa2xx_pcmcia_init(address_space, 0x20000000);
>      s->pcmcia[1] = pxa2xx_pcmcia_init(address_space, 0x30000000);
>

How did you notice this bug? Was it just reading the code?

thanks
-- PMM

