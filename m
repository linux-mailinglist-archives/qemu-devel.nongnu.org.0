Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0F1444871
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 19:40:37 +0100 (CET)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miLBc-0006Pc-27
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 14:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1miL2d-00068M-42; Wed, 03 Nov 2021 14:31:19 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:44385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1miL2a-0004o9-AD; Wed, 03 Nov 2021 14:31:18 -0400
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MKbTo-1n3Ak60OnE-00Kvdx; Wed, 03 Nov 2021 19:31:02 +0100
Message-ID: <11d82a15-0f09-c7c0-eccc-b8a60936cee5@vivier.eu>
Date: Wed, 3 Nov 2021 19:31:01 +0100
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
X-Provags-ID: V03:K1:yixGwkZ1TZYQKoKmhK+es6ACq3/tMwG/TwbHni63VqzYi/p6UHa
 bS66TmVqw5bBZPhUsrf7ma3J1+rDVwBbca/XyRbV2xjb8uNLiLW6a06nGigSVQYvbM5H0Ku
 nx3ZxtlyOTGwJrb093541QvbisMWJhiUfj1QATkKG5QtvBmE6DBmZtegytZ1mqX6KTcxq1y
 3JDbPDPtTSwUQvxLFGjoA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wvtKIC194TE=:z7BVPidyax87pcO9hju/CP
 vbqD7gOLkdLe3Bw2D7gX4UxXcwPrE3gU173kbYB4XyWRKJT5+sWuWMbcG2zRwiDVLwDurndD6
 numiYxWKDSlOXCnGJS0jv3PPaw9LWOFdC2+Kycralgy0ClD1qbthPmN3cLLAmcF5GYe/0RupR
 h5AYEVXpFzES6bge90qbWP6YbVq+00rNnprVORtP+gAQLV690aIpyx+8wCZwbfMIV9A83gpjk
 XRlHrqqMcVaLFbBX2NdR9GGD9lKq9rD9DL814d23Y1tXtVbQWsrwfoKIxy9lL7A7hhNncstmV
 99ozrKZmLerK0mVgTrXxPc7AGiwnwh1LhDnCAwe+0KeV8POJxTStnqgzPh5hdbXoQRyMo7vSS
 iIFIjOCITF4xIMcPFQxBfetkDJtMX4ER5ryIeKtuUfkGZ5jL7y4yjSlhVV1A/GMvuBXQJUwMx
 K/UDrVvuwZow3obwpbjP5jtY9uYviHEJghfgmKy0VFAdXJAcVuuC433+WOoSEFc2Ol9CyLdpG
 p2YiDzOGF0UluCyMdmHDdClVuIvuI5rJlKnHZS+A0OweO+rv7JN0t/4qtE91FtnJZ+AF5DhOk
 Ip87i0SlKAXF+6gJhJJ2j7woB0BUmRoYJmwsp6PI0d2GQ3InI+UoO/n7XlOqUvddE2S9nHeeZ
 e5woDE+s8MATeeJWrwA/pXH31H6Uxh8AJgtC2BdjrhON6vkdWPk0ElmSU5bptebg6vQ8=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.528,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
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

Applied to my trivial-patches branch.

Thanks,
Laurent


