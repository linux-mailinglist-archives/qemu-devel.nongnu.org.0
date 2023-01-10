Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF4D664E90
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 23:14:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFMrh-0007q8-6B; Tue, 10 Jan 2023 17:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFMre-0007mu-1W; Tue, 10 Jan 2023 17:13:02 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFMrc-0006RK-Dr; Tue, 10 Jan 2023 17:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ms7SAkjLilbGRsM+g6SJPeHs1VifZ7Gduco1e6sXQSs=; b=DQYCu1muJ3PwfJ0lKlRiWUpng8
 cfCvv9amn+CmahDr+yTfO0IiDj4BZJvHWOL0Dp8LN+QdLXKOehSfModL9NoVL1HshbfBT2etVfswl
 Pgs56YhOFEDrBbV4u6c3n+/Nwx1wveDokAkW77tJ3Ts6k9ZtvLuOQzzpEkv2ZFhPvzRzWIM3B8JMI
 Fa/Pl3uC4PXqbde9UBIbUGNx5p4MznNetLGwqWwCo77R71QtoYSQby8A5E7rmJxXmWYXlrn7KnXU7
 RjicZ0moCKMKJjm7hMsjGkpaQ3WIABU3rkkaXZBAux1nKjxUn0yEZHHKLVkyli0LX22MG0NFB7Mz3
 xjTv6+SRB8VYDUbvbTkknURIB7gJC+nHFuBbbvnSERpnNfyEl9pVnAAmZBcU+pMr98P4PZ7BeINUj
 FmJGKpGNlnAbT72fSF1ZH8GJn0kROK0vGXxgPnz327s58DvuLAVb8DPgEJlRyT+WvzC5xnTHEeypf
 ch2XIwDftgEF1An/OL8BbtuYbsER/Qj82+WVX1ixfPbuXliKYm/v4tZCIp9WV/0MyA8mQyHoQMo5Z
 93jMOyv1inihTt7CQVgf30wkSs/z0mlF08OUpbmXnrKnEXFk52nv5h4kNd/Q8/3tPtvsnWAqpus6W
 jZhdShXpnlBkvRCJ+aj+SaoJwrBgfx8+S1T+OqwQs=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFMr9-0008RR-FC; Tue, 10 Jan 2023 22:12:35 +0000
Message-ID: <e145f6b1-97d1-0268-d27b-7b0d2137f771@ilande.co.uk>
Date: Tue, 10 Jan 2023 22:12:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <f46bc751e8426f9d937c9540f2e67d2f0b2cc582.1672868854.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <f46bc751e8426f9d937c9540f2e67d2f0b2cc582.1672868854.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 1/7] input/adb: Only include header where needed
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 04/01/2023 21:59, BALATON Zoltan wrote:

> The header hw/input/adb.h is included by some files that don't need
> it. Clean it up and include only where necessary.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/cuda.c         | 2 --
>   hw/misc/macio/pmu.c          | 3 ---
>   hw/misc/mos6522.c            | 1 -
>   include/hw/misc/mac_via.h    | 1 +
>   include/hw/misc/macio/cuda.h | 1 +
>   include/hw/misc/macio/pmu.h  | 1 +
>   include/hw/misc/mos6522.h    | 3 +--
>   7 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
> index 853e88bfed..7208b90e12 100644
> --- a/hw/misc/macio/cuda.c
> +++ b/hw/misc/macio/cuda.c
> @@ -27,8 +27,6 @@
>   #include "hw/irq.h"
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
> -#include "hw/input/adb.h"
> -#include "hw/misc/mos6522.h"
>   #include "hw/misc/macio/cuda.h"
>   #include "qapi/error.h"
>   #include "qemu/timer.h"
> diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
> index 97ef8c771b..8575bc1264 100644
> --- a/hw/misc/macio/pmu.c
> +++ b/hw/misc/macio/pmu.c
> @@ -31,10 +31,7 @@
>   #include "qemu/osdep.h"
>   #include "hw/qdev-properties.h"
>   #include "migration/vmstate.h"
> -#include "hw/input/adb.h"
>   #include "hw/irq.h"
> -#include "hw/misc/mos6522.h"
> -#include "hw/misc/macio/gpio.h"
>   #include "hw/misc/macio/pmu.h"
>   #include "qapi/error.h"
>   #include "qemu/timer.h"
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> index 0ed631186c..d6ba47bde9 100644
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -25,7 +25,6 @@
>    */
>   
>   #include "qemu/osdep.h"
> -#include "hw/input/adb.h"
>   #include "hw/irq.h"
>   #include "hw/misc/mos6522.h"
>   #include "hw/qdev-properties.h"
> diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
> index 5fe7a7f592..422da43bf9 100644
> --- a/include/hw/misc/mac_via.h
> +++ b/include/hw/misc/mac_via.h
> @@ -12,6 +12,7 @@
>   #include "exec/memory.h"
>   #include "hw/sysbus.h"
>   #include "hw/misc/mos6522.h"
> +#include "hw/input/adb.h"
>   #include "qom/object.h"
>   
>   
> diff --git a/include/hw/misc/macio/cuda.h b/include/hw/misc/macio/cuda.h
> index a71deec968..8a6678c749 100644
> --- a/include/hw/misc/macio/cuda.h
> +++ b/include/hw/misc/macio/cuda.h
> @@ -26,6 +26,7 @@
>   #ifndef CUDA_H
>   #define CUDA_H
>   
> +#include "hw/input/adb.h"
>   #include "hw/misc/mos6522.h"
>   #include "qom/object.h"
>   
> diff --git a/include/hw/misc/macio/pmu.h b/include/hw/misc/macio/pmu.h
> index 00fcdd23f5..ba76afb52a 100644
> --- a/include/hw/misc/macio/pmu.h
> +++ b/include/hw/misc/macio/pmu.h
> @@ -10,6 +10,7 @@
>   #ifndef PMU_H
>   #define PMU_H
>   
> +#include "hw/input/adb.h"
>   #include "hw/misc/mos6522.h"
>   #include "hw/misc/macio/gpio.h"
>   #include "qom/object.h"
> diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
> index 05872fffc9..fba45668ab 100644
> --- a/include/hw/misc/mos6522.h
> +++ b/include/hw/misc/mos6522.h
> @@ -27,9 +27,8 @@
>   #ifndef MOS6522_H
>   #define MOS6522_H
>   
> -#include "exec/memory.h"
> +#include "exec/hwaddr.h"
>   #include "hw/sysbus.h"
> -#include "hw/input/adb.h"
>   #include "qom/object.h"
>   
>   #define MOS6522_NUM_REGS 16

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

