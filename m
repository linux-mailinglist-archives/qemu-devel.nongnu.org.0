Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2883330FF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:37:29 +0100 (CET)
Received: from localhost ([::1]:37106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJk2h-0006Gz-T5
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJk1F-0004cf-RA; Tue, 09 Mar 2021 16:35:57 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:41401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJk1A-0005pt-UB; Tue, 09 Mar 2021 16:35:57 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M1YpJ-1lL6er0x4d-0038Bc; Tue, 09 Mar 2021 22:35:42 +0100
Subject: Re: [PATCH v2 1/3] hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for
 lm32-evr/uclinux boards
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20210221225626.2589247-1-f4bug@amsat.org>
 <20210221225626.2589247-2-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ef3976ce-cd13-ca67-75bc-c94c68e0bde4@vivier.eu>
Date: Tue, 9 Mar 2021 22:35:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210221225626.2589247-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PYr/gHHlEJYH/k3m8o7hOHpbReUs/eDXZG53+N8lp2hOLuETUsj
 ocD1D/VBRHslZm8YTX0rtCoU1aCl9igJQh19SxbP3fzZb6FdFvkGA48i331GKM4jf5Z+PJB
 vPZdeSVdiZUGgWswEBAm4PrtLT+bSJJ8sg5tWQe5eAMWmVKt530PPtfjy8kc79wi7nX5dQ+
 dPFKuomJhcytYvCz+9sMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nglk3tpvD60=:IIv7jrXZOWrkVJIdHDnZIr
 bLo66OUAntNrGB2JKSLEWRTGGSmGepzGfbQMyEq9Q4pI0JqPDQAjLBTeTWTiTKuSy8aGHiSZc
 vmfjS1LRZEDc+a3TUnIlgkS0Zz0hEAXeWu3maSvnKHYW5BWXsGweZZc/jD06ITVqXpIGxputL
 Va5MWftMKLPBtms0yfyV51XEoFy3o6/L/csHkwCX+9pRVaJoeG6Kpf2ZyEgZlcYIvmwIWwzhL
 AC28PwjEguZvEmngWSuw336eCUaU0M0xUVQj5kdOmZCvKdn6fb9j8wj2S63ycg5lI1ZTpvSuR
 7YHVbkLu67V0iDaxSjOtpaY8UV0KUIpJCeAXtpD5ge11KD/kuUV8iio9PG1a/KylMr9DUtdwZ
 VB1uIRB1Z4X7RiTmSwHHsQHSGHjR3AuY/e9CJzwklUQydgTSghcQszPp5JzhI
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/02/2021 à 23:56, Philippe Mathieu-Daudé a écrit :
> We want to be able to use the 'LM32' config for architecture
> specific features. Introduce CONFIG_LM32_EVR to select the
> lm32-evr / lm32-uclinux boards.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  default-configs/devices/lm32-softmmu.mak | 2 +-
>  hw/lm32/Kconfig                          | 6 +++++-
>  hw/lm32/meson.build                      | 2 +-
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/default-configs/devices/lm32-softmmu.mak b/default-configs/devices/lm32-softmmu.mak
> index 115b3e34c98..1bce3f6e8b6 100644
> --- a/default-configs/devices/lm32-softmmu.mak
> +++ b/default-configs/devices/lm32-softmmu.mak
> @@ -8,5 +8,5 @@ CONFIG_SEMIHOSTING=y
>  
>  # Boards:
>  #
> -CONFIG_LM32=y
> +CONFIG_LM32_EVR=y
>  CONFIG_MILKYMIST=y
> diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
> index ed2e3060b04..20c36edc402 100644
> --- a/hw/lm32/Kconfig
> +++ b/hw/lm32/Kconfig
> @@ -1,7 +1,6 @@
>  config LM32
>      bool
>      select PTIMER
> -    select PFLASH_CFI02
>  
>  config MILKYMIST
>      bool
> @@ -12,3 +11,8 @@ config MILKYMIST
>      select FRAMEBUFFER
>      select SD
>      select USB_OHCI
> +
> +config LM32_EVR
> +    bool
> +    select LM32
> +    select PFLASH_CFI02
> diff --git a/hw/lm32/meson.build b/hw/lm32/meson.build
> index 8caf0a727ff..42d6f8db3d9 100644
> --- a/hw/lm32/meson.build
> +++ b/hw/lm32/meson.build
> @@ -1,6 +1,6 @@
>  lm32_ss = ss.source_set()
>  # LM32 boards
> -lm32_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_boards.c'))
> +lm32_ss.add(when: 'CONFIG_LM32_EVR', if_true: files('lm32_boards.c'))
>  lm32_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist.c'))
>  
>  hw_arch += {'lm32': lm32_ss}
> 

Applied to my trivial-patches branch.

Thanks,
Laurent



