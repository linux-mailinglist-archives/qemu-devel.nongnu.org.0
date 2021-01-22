Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DCF2FFFD9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:12:32 +0100 (CET)
Received: from localhost ([::1]:45056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tQd-0002VL-HK
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2tO7-0001eF-84
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:09:55 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2tO0-0007Jv-Gk
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:09:54 -0500
Received: by mail-ed1-x533.google.com with SMTP id b21so5879460edy.6
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 02:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pz2BAK6BIJ0piLML6OEwXDhTyZhnyFCBijcWaayNwTw=;
 b=GDqPPUaGRBwC+bua0rI+yw+HOo+xic4uGmAJlkVX/61KhXdLo1GNnCARcLFqIrCItV
 2huGAxPDXyfoIvHLtIH2gKv4UHIqs30Qg0u7sUSVWf0+rzxyNDSqOhu3Rpl9gCnVcxM3
 wkCnXMv9KPERY8Y2JUra3/Kbyyj3kqCwt+enj9fUEGHgtB5sudI03fqYX/uduHxr8aKx
 s054lDY0Fro6e/pJEkssf/mXV7vCVBn4Y0NtTRH4kaL6eGGtTztOtCkaeKaWixdTOWZZ
 L6RdaabxerBfsF9k0CN/CEZSFzHKSOVJlnuErer+XFQNDnmoMUnDTvwMbGt2pyYRWmL3
 WIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pz2BAK6BIJ0piLML6OEwXDhTyZhnyFCBijcWaayNwTw=;
 b=XuRDAh6G12L2jcVu9n/QvfVt3r7bAQpMVxsEwl1HYUaBoJGuPaNZLo1MLoUBK8IP/x
 B3e3vU6wptS/3RMjcOrviHXKOjsRQ59MBWh7P1CC6R8EVBvjOhWSVw9Y3Iy6xYvS7+z5
 cvmaC+KKfQvUxNooSbX5ry7oEwQi/ZJqxi90qUoDXUmOpBsD5Nw6zldCl7yqD44sF9YA
 WM1ltaO+BAm+lYwH5tx5NSq2YBGvH/m6i8CuhedMg96WKb4SqfNudhhR6MPzti8JionH
 ah2WTCDSs8MsStTnN9t+aZthtvHWpRe3YfFbxuQtegO8syJfoaMODwePHl5Eguah5DF4
 0Ugw==
X-Gm-Message-State: AOAM532Dur9pxsiOTZUtQXFv7j+YyYiAcr2QuRS1tw777WPtBKTwPHiH
 cCqahim3lQtIhBWVr4q6o6mrKKTeppnAtd4X2PlZ8A==
X-Google-Smtp-Source: ABdhPJxpjfHR17ILoevjDgRJ1AiTR8swHg37RDickJzXv/pvr0MF9khbRwQpt+u0CC/p8eToTvXLs6btvDzNXnQ1LRw=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr2531893edv.100.1611310186544; 
 Fri, 22 Jan 2021 02:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20210120092748.14789-1-maxim.uvarov@linaro.org>
 <20210120092748.14789-4-maxim.uvarov@linaro.org>
 <20210122082926.nakttrh53zzt6d2x@kamzik.brq.redhat.com>
In-Reply-To: <20210122082926.nakttrh53zzt6d2x@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 10:09:35 +0000
Message-ID: <CAFEAcA9Oa7BXPhzK4BytsQiByP-MWEnm6OsdBhc6w9+5y4BnFQ@mail.gmail.com>
Subject: Re: [PATCHv8 3/3] arm-virt: add secure pl061 for reset/power down
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 08:29, Andrew Jones <drjones@redhat.com> wrote:
>
> On Wed, Jan 20, 2021 at 12:27:48PM +0300, Maxim Uvarov wrote:
> > Add secure pl061 for reset/power down machine from
> > the secure world (Arm Trusted Firmware). Connect it
> > with gpio-pwr driver.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  hw/arm/Kconfig        |  1 +
> >  hw/arm/virt.c         | 47 +++++++++++++++++++++++++++++++++++++++++++
> >  include/hw/arm/virt.h |  2 ++
> >  3 files changed, 50 insertions(+)
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 0a242e4c5d..13cc42dcc8 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -17,6 +17,7 @@ config ARM_VIRT
> >      select PL011 # UART
> >      select PL031 # RTC
> >      select PL061 # GPIO
> > +    select GPIO_PWR
> >      select PLATFORM_BUS
> >      select SMBIOS
> >      select VIRTIO_MMIO
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index c427ce5f81..060a5f492e 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -153,6 +153,7 @@ static const MemMapEntry base_memmap[] = {
> >      [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
> >      [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
> >      [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
> > +    [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
> >      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
> >      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
> >      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> > @@ -841,6 +842,43 @@ static void create_gpio_keys(const VirtMachineState *vms,
> >                             "gpios", phandle, 3, 0);
> >  }
> >
> > +#define SECURE_GPIO_POWEROFF 0
> > +#define SECURE_GPIO_REBOOT   1
> > +
> > +static void create_gpio_pwr(const VirtMachineState *vms,
>
> This function is specific to the secure view. I think it should have
> "secure" in its name.
>
> > +                            DeviceState *pl061_dev,
> > +                            uint32_t phandle)
> > +{
> > +    DeviceState *gpio_pwr_dev;
> > +
> > +    /* gpio-pwr */
> > +    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
>
> Should this device be in secure memory?

It's not in any memory at all -- -1 as the address argument
to sysbus_create_simple() means "no MMIO regions to map". The
only way it's connected to the rest of the system is via  the
secure-only PL061, so the NS world can't get at it.

(sysbus_create_simple("device", -1, NULL) is equivalent to:
 dev = qdev_new("device");
 sysbus_realize_and_unref(SYSBUS_DEVICE(dev), &error_fatal);
)

thanks
-- PMM

