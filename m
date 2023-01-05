Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD7C65F688
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:13:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYSv-0006EC-Gb; Thu, 05 Jan 2023 17:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <herve.poussineau@reactos.org>)
 id 1pDYSt-0006Dz-9x
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:11:59 -0500
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <herve.poussineau@reactos.org>)
 id 1pDYSr-0000l1-19
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:11:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Sender:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=450BkO3S2OoS+pIjfuLfzRt/zyAS0FwxmN+oFuHKS54=; b=Vz6cRNlgrtzvm1IYMr3slamaLf
 hSnBrq4kpzEv9ay4DhSjC9SHjSW+1+WAfupHuaVGckITbAesmpKawi8yjZXmZkja2kXkBvYRjZD/q
 GPcNC0fJhHn/tIv/FzpWYkmF71Ue80hlWRuwWwQapIsjiO0k/GqAjVeJLN80m3NiQgKc=;
Received: by iserv.reactos.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_128_GCM:128)
 (Exim 4.94.2) (envelope-from <herve.poussineau@reactos.org>)
 id 1pDYSl-00CtEc-Q2; Thu, 05 Jan 2023 22:11:53 +0000
Message-ID: <029478b7-4c62-1cc9-be81-fc1e299bc9fd@reactos.org>
Date: Thu, 5 Jan 2023 23:11:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] hw/dma/rc4030: Move RC4030 declarations to its own
 'rc4030.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20230105131038.49549-1-philmd@linaro.org>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
In-Reply-To: <20230105131038.49549-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:1c17:5ae1::1;
 envelope-from=herve.poussineau@reactos.org; helo=iserv.reactos.org
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Le 05/01/2023 à 14:10, Philippe Mathieu-Daudé a écrit :
> RC4030 declarations are not MIPS specific, no need to
> have them in all MIPS boards.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20230105130710.49264-1-philmd@linaro.org>
>            "hw/pci-host/bonito: Housekeeping"
> ---
>   hw/dma/rc4030.c         |  2 +-
>   hw/mips/jazz.c          |  1 +
>   include/hw/dma/rc4030.h | 21 +++++++++++++++++++++
>   include/hw/mips/mips.h  |  9 ---------
>   4 files changed, 23 insertions(+), 10 deletions(-)
>   create mode 100644 include/hw/dma/rc4030.h

Acked-by: Hervé Poussineau <hpoussin@reactos.org>

> 
> diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
> index aa1d323a36..6dbf6652ab 100644
> --- a/hw/dma/rc4030.c
> +++ b/hw/dma/rc4030.c
> @@ -25,7 +25,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/units.h"
>   #include "hw/irq.h"
> -#include "hw/mips/mips.h"
> +#include "hw/dma/rc4030.h"
>   #include "hw/sysbus.h"
>   #include "migration/vmstate.h"
>   #include "qapi/error.h"
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index 6aefe9a61b..03882b5275 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -29,6 +29,7 @@
>   #include "hw/mips/cpudevs.h"
>   #include "hw/intc/i8259.h"
>   #include "hw/dma/i8257.h"
> +#include "hw/dma/rc4030.h"
>   #include "hw/char/serial.h"
>   #include "hw/char/parallel.h"
>   #include "hw/isa/isa.h"
> diff --git a/include/hw/dma/rc4030.h b/include/hw/dma/rc4030.h
> new file mode 100644
> index 0000000000..e58f94576e
> --- /dev/null
> +++ b/include/hw/dma/rc4030.h
> @@ -0,0 +1,21 @@
> +/*
> + * QEMU JAZZ RC4030 chipset
> + *
> + * Copyright (c) 2007-2013 Hervé Poussineau
> + *
> + * SPDX-License-Identifier: MIT
> + */
> +
> +#ifndef HW_DMA_RC4030_H
> +#define HW_DMA_RC4030_H
> +
> +#include "exec/memory.h"
> +
> +/* rc4030.c */
> +typedef struct rc4030DMAState *rc4030_dma;
> +void rc4030_dma_read(void *dma, uint8_t *buf, int len);
> +void rc4030_dma_write(void *dma, uint8_t *buf, int len);
> +
> +DeviceState *rc4030_init(rc4030_dma **dmas, IOMMUMemoryRegion **dma_mr);
> +
> +#endif
> diff --git a/include/hw/mips/mips.h b/include/hw/mips/mips.h
> index 4d2db99952..34dd583500 100644
> --- a/include/hw/mips/mips.h
> +++ b/include/hw/mips/mips.h
> @@ -7,13 +7,4 @@
>   /* Kernels can be configured with 64KB pages */
>   #define INITRD_PAGE_SIZE (64 * KiB)
>   
> -#include "exec/memory.h"
> -
> -/* rc4030.c */
> -typedef struct rc4030DMAState *rc4030_dma;
> -void rc4030_dma_read(void *dma, uint8_t *buf, int len);
> -void rc4030_dma_write(void *dma, uint8_t *buf, int len);
> -
> -DeviceState *rc4030_init(rc4030_dma **dmas, IOMMUMemoryRegion **dma_mr);
> -
>   #endif


