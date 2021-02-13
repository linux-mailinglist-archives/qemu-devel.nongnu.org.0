Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE5C31AE5E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 23:48:34 +0100 (CET)
Received: from localhost ([::1]:47248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB3iM-0005ck-2O
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 17:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB3gr-0004l8-Gi; Sat, 13 Feb 2021 17:47:01 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:42423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lB3gp-0007Xa-3r; Sat, 13 Feb 2021 17:47:01 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MScHp-1lHuMs4Akz-00Szu2; Sat, 13 Feb 2021 23:46:52 +0100
Subject: Re: [PATCH] Fix SPDX-License-Identifier typos
To: Ryan Finnie <ryan@finnie.org>, qemu-devel@nongnu.org
References: <20210201200147.211914-1-ryan@finnie.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8e908a1f-5ee9-58cb-33af-39522d31c7c0@vivier.eu>
Date: Sat, 13 Feb 2021 23:46:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201200147.211914-1-ryan@finnie.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LBjnOHPjmzQ+OajQ8/evunutx/SpCzuHnLgWJ7lk9b61SZ2vFNQ
 HKh/IF/yKbp9CVkbefjwNyDn0KGYTF9M5Iotv3QS9W5dVpQl0kk7H1kv282nxSI7UmLmwQh
 KLgqYPETXjXICcDEqqW5e41Sj9eR6CAnn4OBhEZ7A/6Ar5qkpD2AQeW88Hp+dNqv2uv6VK6
 dfpFIS9mmLGs+kWXMwRjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5OFGI38RFGQ=:mbKGTaATNv1V9k0StQ4Ysh
 d65cDqg+ebgHcR5CCZeC+aHWFVHZ3xSukO8vVVoD/WG2e60DHUwl54sSnpynFWxf00tD1skQY
 alKRyHMrQZIjunxt36o3VeMMToUPVUUlRx4tNCfFdWYIf6vYxFVwm8q2xrJuhSYYVS8OLlc4N
 nfkW6YcHhnUJok48iZbGdglJPdgqnEdEBJh6Hr57oRSTXEEwEdHdq554/OtVZzvtaBLLWTeEt
 5CW2ufJ09KFXWYO3zlzp5k4HaHSpWDC/Jeg233+bRBP4hv3DSicX4obRq7FW9B6co/JABaQYx
 tmITR1qVQxaZvEVl4Tj8Js1wnNIuHtRLzmAFHrPci66Wn5Shieqhpi9BwUQuOG5YwFozQs4KH
 XGJrEKk4kibLdCtkKfvGvD3aq1Sopsvc8rUw1ZLQIBLjjv6FARcdSWa6Og4QvIYi+8fhis6ij
 rECYypoAZw==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/02/2021 à 21:01, Ryan Finnie a écrit :
> Several SPDX headers contain "SPDX-License-Identifer" (note the
> missing "i" before "er"); fix these typos.
> 
> Signed-off-by: Ryan Finnie <ryan@finnie.org>
> Cc: qemu-trivial@nongnu.org
> ---
>  hw/misc/aspeed_xdma.c         | 2 +-
>  hw/misc/sbsa_ec.c             | 2 +-
>  hw/sd/aspeed_sdhci.c          | 2 +-
>  include/hw/misc/aspeed_xdma.h | 2 +-
>  include/hw/sd/aspeed_sdhci.h  | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/misc/aspeed_xdma.c b/hw/misc/aspeed_xdma.c
> index dca5585a75..533d237e3c 100644
> --- a/hw/misc/aspeed_xdma.c
> +++ b/hw/misc/aspeed_xdma.c
> @@ -3,7 +3,7 @@
>   * Eddie James <eajames@linux.ibm.com>
>   *
>   * Copyright (C) 2019 IBM Corp
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>   */
>  
>  #include "qemu/osdep.h"
> diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
> index 9a7d7f914a..83020fe9ac 100644
> --- a/hw/misc/sbsa_ec.c
> +++ b/hw/misc/sbsa_ec.c
> @@ -7,7 +7,7 @@
>   * Copyright (c) 2020 Nuvia Inc
>   * Written by Graeme Gregory <graeme@nuviainc.com>
>   *
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>   */
>  
>  #include "qemu/osdep.h"
> diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
> index 4f24b7d2f9..3299844de6 100644
> --- a/hw/sd/aspeed_sdhci.c
> +++ b/hw/sd/aspeed_sdhci.c
> @@ -3,7 +3,7 @@
>   * Eddie James <eajames@linux.ibm.com>
>   *
>   * Copyright (C) 2019 IBM Corp
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>   */
>  
>  #include "qemu/osdep.h"
> diff --git a/include/hw/misc/aspeed_xdma.h b/include/hw/misc/aspeed_xdma.h
> index 9869ef4728..a2dea96984 100644
> --- a/include/hw/misc/aspeed_xdma.h
> +++ b/include/hw/misc/aspeed_xdma.h
> @@ -3,7 +3,7 @@
>   * Eddie James <eajames@linux.ibm.com>
>   *
>   * Copyright (C) 2019 IBM Corp.
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>   */
>  
>  #ifndef ASPEED_XDMA_H
> diff --git a/include/hw/sd/aspeed_sdhci.h b/include/hw/sd/aspeed_sdhci.h
> index b093d1b861..057bc5f3d1 100644
> --- a/include/hw/sd/aspeed_sdhci.h
> +++ b/include/hw/sd/aspeed_sdhci.h
> @@ -3,7 +3,7 @@
>   * Eddie James <eajames@linux.ibm.com>
>   *
>   * Copyright (C) 2019 IBM Corp
> - * SPDX-License-Identifer: GPL-2.0-or-later
> + * SPDX-License-Identifier: GPL-2.0-or-later
>   */
>  
>  #ifndef ASPEED_SDHCI_H
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


