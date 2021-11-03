Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63680444239
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 14:16:38 +0100 (CET)
Received: from localhost ([::1]:37956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miG85-0001b6-2I
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 09:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1miG6h-0008Cr-AB
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 09:15:12 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:57831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1miG6e-0001W3-P1
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 09:15:11 -0400
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MK3eI-1n2fZT1jJ8-00LS4J; Wed, 03 Nov 2021 14:15:01 +0100
Message-ID: <a153867f-29ca-6b59-b95f-46b059bb0db4@vivier.eu>
Date: Wed, 3 Nov 2021 14:14:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] hw/m68k: Fix typo in SPDX tag
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211103105311.3399293-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211103105311.3399293-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ISEpPRbFsJzGvtg9y3PfpdU55Hs/TWun90apQMesb6mbwlA9vem
 1SmewT2lYwV/PHflENOXIuDK5pf9e+WR+C5zS2B5Di+OmqYLogSC4BizsYxEAwAXagzqnEU
 qkRB4Cuj683hzVgzocD3/I5MV1Z+roEcOSfYwmpFXbPymlpJ6IZ/HY564SaVOMwG3lH6Lfm
 CqE7ORg1i1tLMT7WdbKwQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y11puMQxVuk=:sdRUVnS6OFyis20neDKApj
 jy4d1e1thZQs/bSZ4o+MxWkWcJRnKUFXSagroL5G9k8HmqYahkUo2EAsnT3nLncdHMb8ZNdKN
 qDLF1hQdCDf/ThfMu4Ba6asH+SSQcUPuSix/FYHrevcbJi36T1x4+zSMbzcRqcr8VxITyDVre
 8Ek8V5Zq9xYXY3z7M5QoX/QgGb6LXf1aiObV0/TS41WCBPXNEC+RsytY8Koxad84Tyv7ZBX0T
 ll4SPI1jEYUAQBG9ErcIybLfn4e3fqa2PkBcWMP3PYdjni8QzMQFjYvmAthrUqB0AdNX6lOrN
 lD3PX5EfbTv6t3qhyrfw32EKIR6KQjtOaxeaCGGx+n5y9WbYk2iQgvWziqirAAhz27QtQda85
 9+dn8qf8t/KU5LtetYo3+kRQx5zf6mcmxqYMw0yN1zsfZ8guydBCMr/CLFtN2bJY9tb2GUIKO
 nxUVHjcbh41TvnQ70kiHRNaWh7MLPZ5vNo4qdV8gsHmk7BLtQJSwx0vB8Ep3EJuAeT/cRvk2p
 PGswXZeJnF3UF9j0eAOGKttuQLArFKs8P4oaULDYDFMFUfd3ZVMzFrb5SDzTt/PqV1Vw6mTYx
 nSxLERFqBvs0wv2pVeF2aoDcNCQsZqjd/2GG4FPE8DggZealbzffbju/FeMuhZwGnu6viad0Z
 9JduHcvzEECRTN0gi6w+2cVOHYJRtu1u9naql0yYFknezWgKhkHmuzaYSoSWHblfcSIs=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.528,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/11/2021 à 11:53, Philippe Mathieu-Daudé a écrit :
> Fix 'Identifer' -> 'Identifier' typo.
> 
> Cc: Laurent Vivier <laurent@vivier.eu>
> Fixes: 8c6df16ff60 ("hw/char: add goldfish-tty")
> Fixes: 87855593903 ("hw/intc: add goldfish-pic")
> Fixes: 2fde99ee312 ("m68k: add an interrupt controller")
> Fixes: 0791bc02b8f ("m68k: add a system controller")
> Fixes: e1cecdca559 ("m68k: add Virtual M68k Machine")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/char/goldfish_tty.h | 2 +-
>   include/hw/intc/goldfish_pic.h | 2 +-
>   include/hw/intc/m68k_irqc.h    | 2 +-
>   include/hw/misc/virt_ctrl.h    | 2 +-
>   hw/char/goldfish_tty.c         | 2 +-
>   hw/intc/goldfish_pic.c         | 2 +-
>   hw/intc/m68k_irqc.c            | 2 +-
>   hw/m68k/virt.c                 | 2 +-
>   hw/misc/virt_ctrl.c            | 2 +-
>   9 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/include/hw/char/goldfish_tty.h b/include/hw/char/goldfish_tty.h
> index b9dd67362a6..7503d2fa1e1 100644
> --- a/include/hw/char/goldfish_tty.h
> +++ b/include/hw/char/goldfish_tty.h
> @@ -1,5 +1,5 @@
>   /*
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>    *
>    * Goldfish TTY
>    *
> diff --git a/include/hw/intc/goldfish_pic.h b/include/hw/intc/goldfish_pic.h
> index ad13ab37fc3..e9d552f7968 100644
> --- a/include/hw/intc/goldfish_pic.h
> +++ b/include/hw/intc/goldfish_pic.h
> @@ -1,5 +1,5 @@
>   /*
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>    *
>    * Goldfish PIC
>    *
> diff --git a/include/hw/intc/m68k_irqc.h b/include/hw/intc/m68k_irqc.h
> index dbcfcfc2e00..ef91f218122 100644
> --- a/include/hw/intc/m68k_irqc.h
> +++ b/include/hw/intc/m68k_irqc.h
> @@ -1,5 +1,5 @@
>   /*
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>    *
>    * QEMU Motorola 680x0 IRQ Controller
>    *
> diff --git a/include/hw/misc/virt_ctrl.h b/include/hw/misc/virt_ctrl.h
> index edfadc46950..25a237e5187 100644
> --- a/include/hw/misc/virt_ctrl.h
> +++ b/include/hw/misc/virt_ctrl.h
> @@ -1,5 +1,5 @@
>   /*
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>    *
>    * Virt system Controller
>    */
> diff --git a/hw/char/goldfish_tty.c b/hw/char/goldfish_tty.c
> index 8365a187614..20b77885c18 100644
> --- a/hw/char/goldfish_tty.c
> +++ b/hw/char/goldfish_tty.c
> @@ -1,5 +1,5 @@
>   /*
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>    *
>    * Goldfish TTY
>    *
> diff --git a/hw/intc/goldfish_pic.c b/hw/intc/goldfish_pic.c
> index e3b43a69f16..dfd53275f69 100644
> --- a/hw/intc/goldfish_pic.c
> +++ b/hw/intc/goldfish_pic.c
> @@ -1,5 +1,5 @@
>   /*
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>    *
>    * Goldfish PIC
>    *
> diff --git a/hw/intc/m68k_irqc.c b/hw/intc/m68k_irqc.c
> index 2133d2a698a..0c515e4ecb7 100644
> --- a/hw/intc/m68k_irqc.c
> +++ b/hw/intc/m68k_irqc.c
> @@ -1,5 +1,5 @@
>   /*
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>    *
>    * QEMU Motorola 680x0 IRQ Controller
>    *
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index 4e8bce5aa6f..edc58fbddae 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -1,5 +1,5 @@
>   /*
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>    *
>    * QEMU Vitual M68K Machine
>    *
> diff --git a/hw/misc/virt_ctrl.c b/hw/misc/virt_ctrl.c
> index 3552d7a09ab..e75d1e7e17b 100644
> --- a/hw/misc/virt_ctrl.c
> +++ b/hw/misc/virt_ctrl.c
> @@ -1,5 +1,5 @@
>   /*
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>    *
>    * Virt system Controller
>    */
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

