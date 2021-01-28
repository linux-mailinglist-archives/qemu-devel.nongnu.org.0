Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF3B307759
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:46:04 +0100 (CET)
Received: from localhost ([::1]:35396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57cY-0000sY-Vh
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57aN-0008O1-O5
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:43:52 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:39721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57aG-00058L-Vu
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:43:46 -0500
Received: by mail-ed1-x52d.google.com with SMTP id b21so6650067edy.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 05:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r7rNPgL1Ipu5c9ziAcfsbd0SJejsrIOuX3XIPzLBs+k=;
 b=CN/2gl0vnv1W/ulWUI46Z+5w1rK8RznnK3v9SnHybhaC93viD/bSFaJKmyuuB5TIHx
 xZe5BnbRL616Pj0vwhksosiJ1P+d+n4P6GK+aHWHWTfx9Evt+/rLkiwZ7mrizUzKDwhn
 +hPFQGbFWNrFxtHKrCPx2aadYeCKe6UBNu95XkMn8ATTtHDKVOUO0T921oq5l0pKZrdK
 boNLdOiCYZRKW5e7Jq+SMkRxYFhC7Y4VL8lGrQ5PKQ+zpmUj42N/oov03VdyuCKeg86N
 pKFhxzStnRI7NbeqEDOnTfKT7maHi6Y11p13oKmVW1k/ApNT+URjwO3LB7H4AMTCGL6V
 yoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r7rNPgL1Ipu5c9ziAcfsbd0SJejsrIOuX3XIPzLBs+k=;
 b=dBDiv7UYJ08gjiY307rdzHZPYxUyCjwoRfkQQr7n5yR5BANyllWT89iYOcG/K6v2Pc
 0UVmrwd8XN2hQqxv8PBuaidJcDjiBoEuhhx2dfBW0cBHhYl7aSOXmcUg+YpwGORZScfq
 jcY/OY7iRsQbJsl6WVjHCLxg6Po3p6Mq0l+9sk4Nygam8E/B45O7wO8vS2HHwEX1POQN
 a4ZYZtr8V0wQJ7tcm3JraJ7G4FC2PQc0PjXJPepvjahaH/+tU1f0g7ByFzGIu9X0p4Ea
 kyHr9F0uUpyB+1Fhf2TQRRer/iQmjAq0rdS5G8TPyPThs01tWO9HzbXy5wT5WWWYo+Pj
 hFpA==
X-Gm-Message-State: AOAM531SOctsWjdvp8zalWLmFSEVJKiyxPpv4Cgb60+L+w50pSpxUHf7
 OywedGeEPq8GjVTgjpdIMvB94VQh1CI0X+qRbZq4LA==
X-Google-Smtp-Source: ABdhPJwa9bdHeDo6Bz+8ClMqkSCkwuTDug3WX70J3d+XC96EZLmLSbh3gVV6XOXipTiVzSRQZwiQc6JguOPASdgx3uc=
X-Received: by 2002:a05:6402:b2f:: with SMTP id
 bo15mr14552012edb.146.1611841417952; 
 Thu, 28 Jan 2021 05:43:37 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:43:26 +0000
Message-ID: <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> When the block is disabled, all registers are reset with the
> exception of the ECSPI_CONREG. It is initialized to zero
> when the instance is created.
>
> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>      chapter 21.7.3: Control Register (ECSPIx_CONREG)

> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
> index 8fb3c9b..c952a3d 100644
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -231,12 +231,23 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>  static void imx_spi_reset(DeviceState *dev)
>  {
>      IMXSPIState *s =3D IMX_SPI(dev);
> +    int i;
>
>      DPRINTF("\n");
>
> -    memset(s->regs, 0, sizeof(s->regs));
> -
> -    s->regs[ECSPI_STATREG] =3D 0x00000003;
> +    for (i =3D 0; i < ARRAY_SIZE(s->regs); i++) {
> +        switch (i) {
> +        case ECSPI_CONREG:
> +            /* CONREG is not updated on reset */
> +            break;
> +        case ECSPI_STATREG:
> +            s->regs[i] =3D 0x00000003;
> +            break;
> +        default:
> +            s->regs[i] =3D 0;
> +            break;
> +        }
> +    }

This retains the CONREG register value for both:
 * 'soft' reset caused by write to device register to disable
   the block
   -- this is corrcet as per the datasheet quote
 * 'power on' reset via TYPE_DEVICE's reset method
   -- but in this case we should reset CONREG, because the Device
   reset method is like a complete device powercycle and should
   return the device state to what it was when QEMU was first
   started.

thanks
-- PMM

