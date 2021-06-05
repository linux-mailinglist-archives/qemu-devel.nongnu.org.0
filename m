Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0361339CAB1
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:14:01 +0200 (CEST)
Received: from localhost ([::1]:44290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpbk8-0008P7-1R
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbj1-0006iC-Js; Sat, 05 Jun 2021 15:12:51 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:58291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbiz-0006Jx-Ol; Sat, 05 Jun 2021 15:12:51 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MxDck-1lRD9Q0q4G-00xbhr; Sat, 05 Jun 2021 21:12:44 +0200
Subject: Re: [PATCH] misc: Correct relative include path
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210516205034.694788-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5fbf8202-ecc3-43ef-4ad9-7fc15abdac82@vivier.eu>
Date: Sat, 5 Jun 2021 21:12:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210516205034.694788-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:L6nX/YxSopb7ZUN49nmRfwbeFsXKMCSnhm+opPXW1BkrgWKuiva
 syOW+TlvS86tVLlR8ER19llcsvpAZZ7mpBvUIBWsomUGtml1xd86aZtSFEAmg/96GVcNdAy
 3UgldQcpRL3jbCrjTA1E9VPkOG09WsiIudANEsFW0SDEm1VIoF8OFHNxr/MrDXAWEv9HZK0
 HqgyyB49U7Fx68Mmo3ukw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PZDUueEhESE=:3S2VHZVqPAGmEQlJA5OApm
 eSyG8I9ViXhsw5OWN9ZZo/py0QkJW3GxqZHeqxc6SlBORajr8D4RVwiGUGLYM+1K+4JBzPzYu
 EgAbMpAnuNUhfFv+7rlAOdMcP8EfsnKOBA8BVqQeW09N/K+gv+TioFk7d03hesCgtJZVB9awY
 F3BAP2+vsIvngFfIhl1Oao5VZnntArRiR5FXi4oTOXz8xoHJ92meAwPur3EblH4+gC+s+L0+2
 mWr3BvhBt8sgxV3epKqDwCpK2x02we3TiQbhEP4IFxnXd7yh/ZfPeBw6Cx+kRRPk8CC8uG3y8
 3lUgFhgvOZrcGhOriZLQdBZxGW0mkB0hpRFLgFciwHJaqzdwLXOjva1xhzqvSp/Je1/8t7lSt
 woGFp1HhHaNM/CcO33VSRjZTCOhdSpl0w1gVo0JQYLQfsFcc2QJlY4up+hnzD8in6zbRlrx0Z
 jyhAhkjLWBnXIXccS4tX8LKlx8Ywt41grlwLNsTLE3awARjYHc2qX5tZsZLll0UC/MxJCAgZ3
 ViripPC8bEAXSYrsp8taaY=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/05/2021 à 22:50, Philippe Mathieu-Daudé a écrit :
> Headers should be included from the 'include/' directory,
> not from the root directory.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i386/acpi-common.h     | 6 +++---
>  include/monitor/monitor.h | 2 +-
>  hw/gpio/aspeed_gpio.c     | 2 +-
>  hw/intc/ppc-uic.c         | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
> index b12cd73ea5d..a68825acf50 100644
> --- a/hw/i386/acpi-common.h
> +++ b/hw/i386/acpi-common.h
> @@ -1,9 +1,9 @@
>  #ifndef HW_I386_ACPI_COMMON_H
>  #define HW_I386_ACPI_COMMON_H
> -#include "include/hw/acpi/acpi_dev_interface.h"
>  
> -#include "include/hw/acpi/bios-linker-loader.h"
> -#include "include/hw/i386/x86.h"
> +#include "hw/acpi/acpi_dev_interface.h"
> +#include "hw/acpi/bios-linker-loader.h"
> +#include "hw/i386/x86.h"
>  
>  /* Default IOAPIC ID */
>  #define ACPI_BUILD_IOAPIC_ID 0x0
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index af3887bb71d..1211d6e6d69 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -4,7 +4,7 @@
>  #include "block/block.h"
>  #include "qapi/qapi-types-misc.h"
>  #include "qemu/readline.h"
> -#include "include/exec/hwaddr.h"
> +#include "exec/hwaddr.h"
>  
>  typedef struct MonitorHMP MonitorHMP;
>  typedef struct MonitorOptions MonitorOptions;
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 985a259e05b..db7ef88ee56 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -10,7 +10,7 @@
>  #include "qemu/host-utils.h"
>  #include "qemu/log.h"
>  #include "hw/gpio/aspeed_gpio.h"
> -#include "include/hw/misc/aspeed_scu.h"
> +#include "hw/misc/aspeed_scu.h"
>  #include "qapi/error.h"
>  #include "qapi/visitor.h"
>  #include "hw/irq.h"
> diff --git a/hw/intc/ppc-uic.c b/hw/intc/ppc-uic.c
> index 7171de7b355..60013f2dde3 100644
> --- a/hw/intc/ppc-uic.c
> +++ b/hw/intc/ppc-uic.c
> @@ -23,7 +23,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "include/hw/intc/ppc-uic.h"
> +#include "hw/intc/ppc-uic.h"
>  #include "hw/irq.h"
>  #include "cpu.h"
>  #include "hw/ppc/ppc.h"
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

