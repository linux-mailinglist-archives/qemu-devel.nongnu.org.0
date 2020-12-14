Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8452D9688
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:45:35 +0100 (CET)
Received: from localhost ([::1]:40972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolME-0002SM-8o
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:45:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kolKN-0001KE-W6; Mon, 14 Dec 2020 05:43:41 -0500
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:40399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kolKL-0003oh-P2; Mon, 14 Dec 2020 05:43:39 -0500
Received: by mail-yb1-xb42.google.com with SMTP id t13so14991642ybq.7;
 Mon, 14 Dec 2020 02:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7idFYr6PlxmY4YBaWE+xFS8CtCOdmeghf3me2M7RHYM=;
 b=jW6Pme0vql1xSnXuLq+gnYy5HC78OuZjNcffcPCNkrzs6W1lx6yBpBmX3UD02rnrG3
 vLVuvt8/0MNJdVMmLtPHYF8GwsjTPBhaUlDW3+MYk9pTRRHhhhot4AoajOms/29IOqKN
 +dzSlE9go3YXS9+102sz50UL/vgo0ymShG7hNXOaZGLR/l/qBZ2Vo/xcEgrhJVKzwQSr
 ONKoety1aY13Yto3beXxaGeE5Bso//K/wkh+NajRBAzfZR+RYnOX1YShdLQITtFChe2v
 c7x5yIehoP/IwAJEipJYy96wp31GaZX2R8pGl7gemabw2xdwUe8VI4jDN09hGGw7oi8L
 oGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7idFYr6PlxmY4YBaWE+xFS8CtCOdmeghf3me2M7RHYM=;
 b=jPnn+dEBZszCFqNjdghN4Ib0Z4YXSOAfUp9ShXCkfoKuwyZiBteUseCPUXdLBkqqVb
 dYAgyVu3/n0+3L6SVxWcVK10y9oC/5SLq6H2iezpKECBRtgBqbxmIzlcOg0gZj+eAlBk
 p2mVfBaWRSof4Jtt+lvETZfhBE0ecs2gbRvpL6PZQMAVG1lGyZpAjC0CvIBJlNP9kwjR
 bafgrdH+UYNx24n5Mj5vdnd+6L6RJLz5j35RW4usMZIClcY6jokL9NYYPkpnD0kfbEA/
 bHO5+7ODs6CLk30ey/dvs7rsj8iTfvZMkKkhEhS74y2TTqOXn5Ikvi4jVOh3w9DActv/
 uL3w==
X-Gm-Message-State: AOAM533gxrpyMJbim2Fr6K1u/njsBkjl5Imf2OtHMHx3DFQZWJR80yv/
 x86gYokr1WEcrI0thCIilKFVXgO17GJOkCcjMjY=
X-Google-Smtp-Source: ABdhPJw7AAw/Z58dkG72Vx9pwng7tEm+X+m/24DOZerKueLn3H9sXBRhU6GYqMmskOPI8UlaFfIm66dXFAcEtpLAMKE=
X-Received: by 2002:a25:be87:: with SMTP id i7mr34446935ybk.332.1607942615834; 
 Mon, 14 Dec 2020 02:43:35 -0800 (PST)
MIME-Version: 1.0
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
 <1607937538-69471-2-git-send-email-bmeng.cn@gmail.com>
 <87blewvftl.fsf@linaro.org>
In-Reply-To: <87blewvftl.fsf@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Dec 2020 18:43:24 +0800
Message-ID: <CAEUhbmVJbdi_STsy=SGxYapLdd9oZq5i0abhjzKLzyjYA9Yxbw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:32 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > U-Boot expects PMU_MISC0 register bit 7 is set (see init_bandgap()
> > in arch/arm/mach-imx/mx6/soc.c) during boot. This bit indicates the
> > bandgap has stabilized.
> >
> > With this change, the latest upstream U-Boot (v2021.01-rc3) for imx6
> > sabrelite board (mx6qsabrelite_defconfig), with a slight change made
> > by switching CONFIG_OF_SEPARATE to CONFIG_OF_EMBED, boots to U-Boot
> > shell on QEMU with the following command:
> >
> > $ qemu-system-arm -M sabrelite -m 1G -kernel u-boot -display none \
> >     -serial null -serial stdio
> >
> > Boot log below:
> >
> >   U-Boot 2021.01-rc3 (Dec 12 2020 - 17:40:02 +0800)
> >
> >   CPU:   Freescale i.MX?? rev1.0 at 792 MHz
> >   Reset cause: POR
> >   Model: Freescale i.MX6 Quad SABRE Lite Board
> >   Board: SABRE Lite
> >   I2C:   ready
> >   DRAM:  1 GiB
> >   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0x5c scl.gp=3D0x55
> >   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
> >   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0x6d scl.gp=3D0x6c
> >   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
> >   force_idle_bus: sda=3D0 scl=3D0 sda.gp=3D0xcb scl.gp=3D0x5
> >   force_idle_bus: failed to clear bus, sda=3D0 scl=3D0
> >   MMC:   FSL_SDHC: 0, FSL_SDHC: 1
> >   Loading Environment from MMC... *** Warning - No block device, using =
default environment
> >
> >   In:    serial
> >   Out:   serial
> >   Err:   serial
> >   Net:   Board Net Initialization Failed
> >   No ethernet found.
> >   starting USB...
> >   Bus usb@2184000: usb dr_mode not found
> >   USB EHCI 1.00
> >   Bus usb@2184200: USB EHCI 1.00
> >   scanning bus usb@2184000 for devices... 1 USB Device(s) found
> >   scanning bus usb@2184200 for devices... 1 USB Device(s) found
> >          scanning usb for storage devices... 0 Storage Device(s) found
> >          scanning usb for ethernet devices... 0 Ethernet Device(s) foun=
d
> >   Hit any key to stop autoboot:  0
> >   =3D>
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/misc/imx6_ccm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
> > index cb74042..7e031b6 100644
> > --- a/hw/misc/imx6_ccm.c
> > +++ b/hw/misc/imx6_ccm.c
> > @@ -450,7 +450,7 @@ static void imx6_ccm_reset(DeviceState *dev)
> >      s->analog[PMU_REG_3P0] =3D 0x00000F74;
> >      s->analog[PMU_REG_2P5] =3D 0x00005071;
> >      s->analog[PMU_REG_CORE] =3D 0x00402010;
> > -    s->analog[PMU_MISC0] =3D 0x04000000;
> > +    s->analog[PMU_MISC0] =3D 0x04000080;
>
> Are the registers different on the imx6ul machine or should a similar
> change be made to imx6ul_ccm_reset?

I am not sure. I did not try the mcimx6ul-evk machine. I only looked
at the i.MX6 DQ reference manual, and current user in QEMU of this
imx6_ccm is only the sabrelite machine.

>
> Also what is the write behaviour of this bit? If it is RAO/WI then
> analog_mask needs fixing so a write to the register doesn't reset the
> state.
>
> >      s->analog[PMU_MISC1] =3D 0x00000000;
> >      s->analog[PMU_MISC2] =3D 0x00272727;
>

There is no analog_mask in the imx6_ccm codes. It exists in the
imx6ul_ccm however.

The i.MX6 DQ reference manual says this bit is RW, and does not
document the behavior of write. AFAICT this bit is only concerned by
the bootloader.

Regards,
Bin

