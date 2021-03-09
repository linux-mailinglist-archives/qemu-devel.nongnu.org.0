Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8CB333107
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:39:21 +0100 (CET)
Received: from localhost ([::1]:44566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJk4W-0000zT-6l
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJk21-0006HK-FF; Tue, 09 Mar 2021 16:36:45 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:47139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJk1z-0006IF-K2; Tue, 09 Mar 2021 16:36:45 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MyK5K-1lgeAn2mPU-00ygr3; Tue, 09 Mar 2021 22:36:33 +0100
Subject: Re: [PATCH v2 2/3] hw/lm32/Kconfig: Rename CONFIG_LM32 ->
 CONFIG_LM32_DEVICES
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20210221225626.2589247-1-f4bug@amsat.org>
 <20210221225626.2589247-3-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <76efeacc-487b-7321-9ff8-71d435a19d90@vivier.eu>
Date: Tue, 9 Mar 2021 22:36:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210221225626.2589247-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YhLowKCfDqyQuMYW3LPYkX5bGXzg2rO4a7xADkYLhBLpt/tn4F0
 mK96M3XzxJt5Oqhb/+cstee9ZPLPS0gfnEagqEsAstcwIZIdrWgUGp2pTh87aKxWhQ3hzIT
 ZDKIp1Sw39jLXq0M+2s1tn+59YaARUg8nBdmiBiXDWIn+5EFUtXA4frqp7Aw0Gvko6KPOhs
 SsKQ7YTDOROfWs5yaEhiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t+yt8DqDHtU=:+s9YwQxsQUdj67vJl5B1He
 puNYTvdCN8q4wiOxFf7JnzjEqyQQCPJP9S08XWG2ItVOUNt+0XMpEFITJJ6L8bOJoR+D+a6NH
 FcIK/LfivnUzpoCKCGj+gQFaHppxUPzUh3Tq+0KvSEOjnQFR2VM2jGQtQnTGQRu7X32Q3AnE0
 ymWJc26MPOE04vqqJB3J5Y8RqlFGe7ORMGMA6IKTW7lPYP1HkRHZyKsC9BZMbhTvPDj3uZLfx
 avlTTbS4/bWnpLxx0iCscBpPrqOYIxFrEBD2+KjnIjFyAe9PmnlzHF3KASWqo392dCODavSBW
 n6rhTMiuTyUg/D2eOjlRT70VxYfT4v2TIo5BWWeNnmSfoTW4JDyUtkUDmlQdkE7itdri9E16K
 myERsxegM7rVORYoDPjIIdjga/YSH+52JFarfEE6Y2Ga/XjjQjKlDZzWg4438
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/02/2021 à 23:56, Philippe Mathieu-Daudé a écrit :
> We want to be able to use the 'LM32' config for architecture
> specific features. As CONFIG_LM32 is only used to select
> peripherals, rename it CONFIG_LM32_DEVICES.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/char/meson.build  | 4 ++--
>  hw/intc/meson.build  | 2 +-
>  hw/lm32/Kconfig      | 4 ++--
>  hw/timer/meson.build | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/char/meson.build b/hw/char/meson.build
> index 196ac91fa29..b95e8958514 100644
> --- a/hw/char/meson.build
> +++ b/hw/char/meson.build
> @@ -8,8 +8,8 @@
>  softmmu_ss.add(when: 'CONFIG_IPACK', if_true: files('ipoctal232.c'))
>  softmmu_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('parallel-isa.c'))
>  softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugcon.c'))
> -softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_juart.c'))
> -softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_uart.c'))
> +softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_juart.c'))
> +softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_uart.c'))
>  softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-uart.c'))
>  softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_uart.c'))
>  softmmu_ss.add(when: 'CONFIG_PARALLEL', if_true: files('parallel.c'))
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 53cba115690..b2c4c085af9 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -14,7 +14,7 @@
>  softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
>  softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
>  softmmu_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'))
> -softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_pic.c'))
> +softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_pic.c'))
>  softmmu_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
>  softmmu_ss.add(when: 'CONFIG_PL190', if_true: files('pl190.c'))
>  softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_intc.c'))
> diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
> index 20c36edc402..518c84ed508 100644
> --- a/hw/lm32/Kconfig
> +++ b/hw/lm32/Kconfig
> @@ -1,4 +1,4 @@
> -config LM32
> +config LM32_DEVICES
>      bool
>      select PTIMER
>  
> @@ -14,5 +14,5 @@ config MILKYMIST
>  
>  config LM32_EVR
>      bool
> -    select LM32
> +    select LM32_DEVICES
>      select PFLASH_CFI02
> diff --git a/hw/timer/meson.build b/hw/timer/meson.build
> index be343f68fed..52723f34c42 100644
> --- a/hw/timer/meson.build
> +++ b/hw/timer/meson.build
> @@ -19,7 +19,7 @@
>  softmmu_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', 'i8254.c'))
>  softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
>  softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpt.c'))
> -softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_timer.c'))
> +softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_timer.c'))
>  softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-sysctl.c'))
>  softmmu_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'))
>  softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-timer.c'))
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


