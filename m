Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A62D8EE5
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 17:57:14 +0100 (CET)
Received: from localhost ([::1]:46724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koUgL-0004Qr-BY
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 11:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koUeg-0003j4-Tm; Sun, 13 Dec 2020 11:55:30 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:42457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koUee-0002eD-AF; Sun, 13 Dec 2020 11:55:30 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MXXdn-1kc6QQ1tB1-00Yw9L; Sun, 13 Dec 2020 17:55:13 +0100
Subject: Re: [PATCH] ads7846: moves from the hw/display folder to the hw/input
 folder.
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201115123503.1110665-1-ganqixin@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <bd2cc606-14a3-3f07-92e6-e7b95f4fbfdf@vivier.eu>
Date: Sun, 13 Dec 2020 17:55:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201115123503.1110665-1-ganqixin@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ku1sO2b4kLfxHeNUYOTLr1CpkFE0selCiDSa603ScqNu8d6udEF
 1CMuJOZHtoIzwDKwRimkB4Ez41/K+AXxMpsabp4fcYOnuilqJBKYqfaT89eV7w+wNTkcybv
 b+pIRO/NmoAIdD5bR4/fl1xyNtP30ScJQGvdeaKdFlW6Do2p/rUW9nyD6y2skEUpRMP90mm
 14Ics/nTrPIuWeDPNbquA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Wk8pD2D8kBA=:A07q/ZUOQTIFgSuZOpMFCm
 tMKUxzyJ7a3hQrzQNIz1YDjRtt0kg5mzI2RLIPSv2SLpHv55cH3cXxgAe/oiJORqP94BL5C2W
 C5wWeyb54/Uh8wDQQZIfF3C0MFmTK3Iw96EIRZwRdjWABDrwokCMKJx9x2jMPlF4jJANB4HTv
 KaebUoL56hpgSG7WkIxsM7nvMSoRqoUAPQ+tOxovpNdkzrGTpL/WbLWl14D9nU9mdncMsUWpQ
 uyMKTfZf6B63FarTpMsiMo5aQj2c0HuzpeQNWUB3XB7XRqCGfFCfUW/FDRM6Hx5y5XrqZF85H
 bHMzFtLKDBaMlpM08Hw+S+Me3spnRyurk+svQManD02Z52q0iN//9rwAHf9YE6lr8jaxcCrfX
 eV943cm2fdOxm30eIz7mnDoB6Bu9gC1wO/3IxnQvEFO8Am6Q1QgrTnhr+Auyu0X5iH7VoZAIQ
 NsURw6xeIg==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, quintela@redhat.com, kuhn.chenqun@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/11/2020 à 13:35, Gan Qixin a écrit :
> ads7846 is a touch-screen controller that is an input device rather
> than a display device, so move it to the hw/input folder.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
>  hw/arm/Kconfig                  | 2 +-
>  hw/display/Kconfig              | 3 ---
>  hw/display/meson.build          | 1 -
>  hw/input/Kconfig                | 3 +++
>  hw/{display => input}/ads7846.c | 0
>  hw/input/meson.build            | 1 +
>  6 files changed, 5 insertions(+), 5 deletions(-)
>  rename hw/{display => input}/ads7846.c (100%)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index fdf4464b94..75a771bc2d 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -155,7 +155,7 @@ config TOSA
>  
>  config SPITZ
>      bool
> -    select ADS7846 # display
> +    select ADS7846 # touch-screen controller
>      select MAX111X # A/D converter
>      select WM8750  # audio codec
>      select MAX7310 # GPIO expander
> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> index 15d59e10dc..ca46b5830e 100644
> --- a/hw/display/Kconfig
> +++ b/hw/display/Kconfig
> @@ -9,9 +9,6 @@ config EDID
>  config FW_CFG_DMA
>      bool
>  
> -config ADS7846
> -    bool
> -
>  config VGA_CIRRUS
>      bool
>      default y if PCI_DEVICES
> diff --git a/hw/display/meson.build b/hw/display/meson.build
> index dad3bd2b41..9d79e3951d 100644
> --- a/hw/display/meson.build
> +++ b/hw/display/meson.build
> @@ -6,7 +6,6 @@ softmmu_ss.add(when: 'CONFIG_EDID', if_true: files('edid-generate.c', 'edid-regi
>  softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('ramfb.c'))
>  softmmu_ss.add(when: 'CONFIG_FW_CFG_DMA', if_true: files('ramfb-standalone.c'))
>  
> -softmmu_ss.add(when: 'CONFIG_ADS7846', if_true: files('ads7846.c'))
>  softmmu_ss.add(when: 'CONFIG_VGA_CIRRUS', if_true: files('cirrus_vga.c'))
>  softmmu_ss.add(when: ['CONFIG_VGA_CIRRUS', 'CONFIG_VGA_ISA'], if_true: files('cirrus_vga_isa.c'))
>  softmmu_ss.add(when: 'CONFIG_G364FB', if_true: files('g364fb.c'))
> diff --git a/hw/input/Kconfig b/hw/input/Kconfig
> index 64f14daabf..55865bb386 100644
> --- a/hw/input/Kconfig
> +++ b/hw/input/Kconfig
> @@ -1,6 +1,9 @@
>  config ADB
>      bool
>  
> +config ADS7846
> +    bool
> +
>  config LM832X
>      bool
>      depends on I2C
> diff --git a/hw/display/ads7846.c b/hw/input/ads7846.c
> similarity index 100%
> rename from hw/display/ads7846.c
> rename to hw/input/ads7846.c
> diff --git a/hw/input/meson.build b/hw/input/meson.build
> index e7285b15ae..0042c3f0dc 100644
> --- a/hw/input/meson.build
> +++ b/hw/input/meson.build
> @@ -1,5 +1,6 @@
>  softmmu_ss.add(files('hid.c'))
>  softmmu_ss.add(when: 'CONFIG_ADB', if_true: files('adb.c', 'adb-mouse.c', 'adb-kbd.c'))
> +softmmu_ss.add(when: 'CONFIG_ADS7846', if_true: files('ads7846.c'))
>  softmmu_ss.add(when: 'CONFIG_LM832X', if_true: files('lm832x.c'))
>  softmmu_ss.add(when: 'CONFIG_PCKBD', if_true: files('pckbd.c'))
>  softmmu_ss.add(when: 'CONFIG_PL050', if_true: files('pl050.c'))
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


