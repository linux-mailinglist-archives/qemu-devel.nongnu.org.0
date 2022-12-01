Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701B863EFFC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 12:56:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0iAA-0007fP-Rj; Thu, 01 Dec 2022 06:55:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0iA8-0007eU-44
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 06:55:32 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0iA3-0006MF-1a
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 06:55:31 -0500
Received: by mail-pl1-x62c.google.com with SMTP id b21so1411797plc.9
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 03:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LKrUTnLnwJSult3Ncd1PzInTpGmNei4vgWYYKW6U+Nk=;
 b=Kxk0j80bsBfNsjQ0+qtkw4MwctlTRI+ahTwZbMp7dXWT5RRkaEcCmZacjqajNGAhz7
 fB/vfYxDUZQ7LyD+x3K7TrNS7rAFxAE38GygTd1bHQk1plYLKnoQ3IjkR8tHtJ55ID7V
 Xa1nc8em4+060kBsTdBWBtIRYWbTkVCa6Tz21IjKwcdmvYnsWspfGTewQmJeka8GE5Du
 4NkXKhAb8U/fkjv+TO2O4A9z0d7pYCf76t4XynAxVv+VnvJfMH2516uQbjXynKFaiz8o
 eb4oKfVvCxBbU6BguFsNpdrpKTX/cv9xBAAgXnlHlMUPLGRfbosfGrPZQUYGNFtgXyn8
 KNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LKrUTnLnwJSult3Ncd1PzInTpGmNei4vgWYYKW6U+Nk=;
 b=sy0wtZ5btN2xPZJVP1Nqey9Ck0pkPvwkOIpPI5+w//P3TsHHn1L7VyXjliXmXhio9L
 fh9KPhLWn6RekK0EftOIXoXzPelEfAa5ye30vS5n/WiO4/TBR7ZrVj+1bZE/qG8FsG9q
 erP2bParOlZuz1AzwTRDkHhEk5JOswu17JQmHfjECUcPMjtSoJSk4FUdh2UoGWL8/vKx
 Z6y8Khir/rOz/3as3EQ4XyVHTyuFL0+4XI3m2bfr85mBJRoXJF67HkmD5XBL9ct/ZoKL
 SyPPsOi2qlxxt5g4zurE4WhWHpyFUaeHrk9cGc/0jhKhXv+l9bVzcUtWa5uC1LAVZf+Q
 lOlA==
X-Gm-Message-State: ANoB5pnhEzVgSi4Wjb81rHvhlvy89Y/LW+eTr47Hq5aavEe3AhgUjRXW
 kUtR5qjXt8eoJFGbn0X78e8ewTt/HafgiorAEpWHAw==
X-Google-Smtp-Source: AA0mqf6Y3U4IbYvJ5DQ2ycW5CHifAxpl8oQMrKP6GDajWAk1nGFelwiTUCKx74WgvHj5iYGShdcyyvmmJ7oE1jQ95gk=
X-Received: by 2002:a17:902:70c5:b0:189:b0a3:cf4a with SMTP id
 l5-20020a17090270c500b00189b0a3cf4amr4269541plt.60.1669895725617; Thu, 01 Dec
 2022 03:55:25 -0800 (PST)
MIME-Version: 1.0
References: <20221130111559.52150-1-thuth@redhat.com>
In-Reply-To: <20221130111559.52150-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Dec 2022 11:55:14 +0000
Message-ID: <CAFEAcA-hneP0SLUTW=_maTztra9gYnKgPeXevDcVu3jZZnDObA@mail.gmail.com>
Subject: Re: [PATCH for-8.0] hw/misc: Move some arm-related files from
 specific_ss into softmmu_ss
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 30 Nov 2022 at 11:16, Thomas Huth <thuth@redhat.com> wrote:
>
> By removing #include "kvm-consts.h" from arm-powerctl.h (seems not to
> be required there) and adjusting the header includes in some files, we
> can move them from specific_ss into softmmu_ss, so that they only need
> to be compiled once and not for qemu-system-arm and qemu-system-aarch64
> individually.

> --- a/target/arm/arm-powerctl.h
> +++ b/target/arm/arm-powerctl.h
> @@ -11,8 +11,6 @@
>  #ifndef QEMU_ARM_POWERCTL_H
>  #define QEMU_ARM_POWERCTL_H
>
> -#include "kvm-consts.h"
> -
>  #define QEMU_ARM_POWERCTL_RET_SUCCESS QEMU_PSCI_RET_SUCCESS
>  #define QEMU_ARM_POWERCTL_INVALID_PARAM QEMU_PSCI_RET_INVALID_PARAMS
>  #define QEMU_ARM_POWERCTL_ALREADY_ON QEMU_PSCI_RET_ALREADY_ON

kvm-consts.h is where QEMU_PSCI_RET_SUCCESS etc are defined.
So while the #include isn't strictly needed for compilation to work
because arm-powerctl.h only creates the #define and doesn't use it,
it does mean that any source file that uses the QEMU_ARM_POWERCTL_*
now needs to include kvm-consts.h somehow itself. (Usually this is
going to happen implicitly via target/arm/cpu.h, I think.)

I guess this is worth living with for the benefit of not
compiling things twice. It could probably be untangled a little
by e.g. moving the PSCI constants into their own header rather
than defining them in kvm-consts.h, but I'm not sure if it's
worth the effort right now.

> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 95268eddc0..9ca6bf1d17 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -84,8 +84,8 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
>  ))
>  softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
>  softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
> -specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
> -specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
> +softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
> +softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
>  specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-crl.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
>    'xlnx-versal-xramc.c',
> @@ -126,8 +126,8 @@ softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
>
>  specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
>
> -specific_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))
> -specific_ss.add(when: 'CONFIG_IOTKIT_SYSCTL', if_true: files('iotkit-sysctl.c'))
> +softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))

This file could now be listed in the
"softmmu_ss.add(when: 'CONFIG_IMX', if_true: files(...)" list earlier in
the file.

> +softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSCTL', if_true: files('iotkit-sysctl.c'))

This line could be moved up to next to the other CONFIG_IOTKIT_* lines.

>  specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))

thanks
-- PMM

