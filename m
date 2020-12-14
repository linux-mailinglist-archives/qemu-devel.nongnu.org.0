Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02F72D965B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:34:27 +0100 (CET)
Received: from localhost ([::1]:53828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolBS-00047g-UH
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kol9K-0002Uz-Jp
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:32:16 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kol9H-0002Ar-TD
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:32:14 -0500
Received: by mail-wr1-x443.google.com with SMTP id 91so15913338wrj.7
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 02:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3e2JHCFdlYDOIRdsFvYZ34g1UztHfKnWz1g4Y5c5M1E=;
 b=yWbx86wIUUQ8VSjLUWXswqccFLxPyRTerUJBNrp3lesuLQJUrfxIF2LJDxYS9/+X2u
 stjNdQKiPD+ycOFzgZAmfG+ssfp9iCN1BrJoZcwclonZQf5S/kwxsc6SgA8dVppFvpiX
 rBx30FFJUQVioAsiTGMN5EV5FNZNS1+kP8C+4mNWs69YINZ9UcWqFa/pR0+7aMfVUVFO
 A2hb3mtW1l9pTzl7R/esfVPcxUvIvRTeUCRUNXSC0qV1q6N555O0PMsVsf34HLnowkoN
 rTRSnkX3lxqvY7hbE33UYNoeLlPszw7B0r/DuyQu1z2ZmH4u39yb0P3vXBSGUrikCLVF
 DcIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3e2JHCFdlYDOIRdsFvYZ34g1UztHfKnWz1g4Y5c5M1E=;
 b=YnjOW8Ckj7p30NRm6Js+Fpa5XUE7Avgv4jsJfqW3FRQ3UqHP2lxOFWJdAHmvoTQ9ZC
 CS7PgbHZ3XlaAObCV5euuMziKHVGMZBc56pNMqRO+5AT4+EwlhgY8AK3Nlnx4McdcAjj
 KfRpt8Ufd4rOKz9THmstixiQRQij0nrJtHI4YEsIuB8DxVLF/UNDZfjYLddZ8X45DUu8
 aanjCH62/mY34rvcCZ6dbC8LfUjkjlmy6K5ek9+FQfyulGBAKUKlIAvFnLvJjkSHsls3
 TIukzF3Pg1sP+kMCzZzxh9aZUiiuldx6mKwxbLWHwLgXTNMKA58cj3lyNcaz8Xn/Db7s
 efcg==
X-Gm-Message-State: AOAM5305xQm6D2cXGhP/RqGIznYvZfhTWbXj/ZQ8F3wvrAuSLKtUxBsb
 fgd+d/NOIEo0whwGSrXMr/wM6A==
X-Google-Smtp-Source: ABdhPJyYvl947eKRqfJS+tn57Oq2j972QwC6Tn8e1lXrn8dfCzGMQ0HVbsfgvRaK1jn9/kwkI4iIQg==
X-Received: by 2002:a5d:6ccc:: with SMTP id c12mr28524417wrc.4.1607941929027; 
 Mon, 14 Dec 2020 02:32:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n9sm13073722wrq.41.2020.12.14.02.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 02:32:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E9AA01FF7E;
 Mon, 14 Dec 2020 10:32:06 +0000 (GMT)
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
 <1607937538-69471-2-git-send-email-bmeng.cn@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 1/3] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
Date: Mon, 14 Dec 2020 10:26:50 +0000
In-reply-to: <1607937538-69471-2-git-send-email-bmeng.cn@gmail.com>
Message-ID: <87blewvftl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bin Meng <bmeng.cn@gmail.com> writes:

> From: Bin Meng <bin.meng@windriver.com>
>
> U-Boot expects PMU_MISC0 register bit 7 is set (see init_bandgap()
> in arch/arm/mach-imx/mx6/soc.c) during boot. This bit indicates the
> bandgap has stabilized.
>
> With this change, the latest upstream U-Boot (v2021.01-rc3) for imx6
> sabrelite board (mx6qsabrelite_defconfig), with a slight change made
> by switching CONFIG_OF_SEPARATE to CONFIG_OF_EMBED, boots to U-Boot
> shell on QEMU with the following command:
>
> $ qemu-system-arm -M sabrelite -m 1G -kernel u-boot -display none \
>     -serial null -serial stdio
>
> Boot log below:
>
>   U-Boot 2021.01-rc3 (Dec 12 2020 - 17:40:02 +0800)
>
>   CPU:   Freescale i.MX?? rev1.0 at 792 MHz
>   Reset cause: POR
>   Model: Freescale i.MX6 Quad SABRE Lite Board
>   Board: SABRE Lite
>   I2C:   ready
>   DRAM:  1 GiB
>   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0x5c scl.gp=3D0x55
>   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
>   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0x6d scl.gp=3D0x6c
>   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
>   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0xcb scl.gp=3D0x5
>   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
>   MMC:   FSL_SDHC: 0, FSL_SDHC: 1
>   Loading Environment from MMC... *** Warning - No block device, using de=
fault environment
>
>   In:    serial
>   Out:   serial
>   Err:   serial
>   Net:   Board Net Initialization Failed
>   No ethernet found.
>   starting USB...
>   Bus usb@2184000: usb dr_mode not found
>   USB EHCI 1.00
>   Bus usb@2184200: USB EHCI 1.00
>   scanning bus usb@2184000 for devices... 1 USB Device(s) found
>   scanning bus usb@2184200 for devices... 1 USB Device(s) found
>          scanning usb for storage devices... 0 Storage Device(s) found
>          scanning usb for ethernet devices... 0 Ethernet Device(s) found
>   Hit any key to stop autoboot:  0
>   =3D>
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/misc/imx6_ccm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
> index cb74042..7e031b6 100644
> --- a/hw/misc/imx6_ccm.c
> +++ b/hw/misc/imx6_ccm.c
> @@ -450,7 +450,7 @@ static void imx6_ccm_reset(DeviceState *dev)
>      s->analog[PMU_REG_3P0] =3D 0x00000F74;
>      s->analog[PMU_REG_2P5] =3D 0x00005071;
>      s->analog[PMU_REG_CORE] =3D 0x00402010;
> -    s->analog[PMU_MISC0] =3D 0x04000000;
> +    s->analog[PMU_MISC0] =3D 0x04000080;

Are the registers different on the imx6ul machine or should a similar
change be made to imx6ul_ccm_reset?

Also what is the write behaviour of this bit? If it is RAO/WI then
analog_mask needs fixing so a write to the register doesn't reset the
state.

>      s->analog[PMU_MISC1] =3D 0x00000000;
>      s->analog[PMU_MISC2] =3D 0x00272727;


--=20
Alex Benn=C3=A9e

