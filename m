Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E626A412714
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 22:00:26 +0200 (CEST)
Received: from localhost ([::1]:37542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSPSj-0000oe-PY
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 16:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPQu-0007ZK-1N
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:58:32 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:41173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPQs-0007z3-8A
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:58:31 -0400
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MyKYE-1mn7eK1rXI-00yhGg; Mon, 20 Sep 2021 21:58:28 +0200
Subject: Re: [PATCH v4 07/20] nubus: add trace-events for empty slot accesses
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-8-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8314e775-9cf9-bb9e-316d-32bc0f019a4f@vivier.eu>
Date: Mon, 20 Sep 2021 21:58:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-8-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eHlvUSlJ+WJ688D+w6JUlNzc+ZxCe69LTL8zBA/2QPiWxaIMuX5
 TKdU0yGe97XGpT6Jk8zi9stLIE6WU9DM+yDbOjZVo76X1KogCJPLLUeq7JwEEfRUKmzrm28
 7Ir7DtBfTTFNegHGpbtMMk6/x5Tuinf2ARnfTdOqwFN9tezA6nytH5R9Zd8ammEmR4YL+UN
 dqU2mKvPRS0K6AtO/a20Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z6FfkpF7h+8=:OZv/fuQUxdYss4ULsWw6Qz
 zVbWJYzDiikh/9QB8sC712sWg55WyVYn1XbZ69T/jZ1Vdc6yC9X8fcuvOii4/cI/LafDCa9EQ
 0wxQ0pMev0u3ve/6Mh7XsZmu1skzao2Kh5o4wtlp1s5wxwWb7XwN68gMNtA7FVdznZgb8yyBF
 olFHhIlialnwdBGphi5zLKzqMdiv6zMy4P26Wi2IMmZn7BWwjoapUtGbz00MwetFVebBe8ov/
 XBPEB6l7pW80qgVcPs1d64nUI96b5VbVXvN9pP+0z+UuZTuquavTqZ6uhSI/7wvkZxIH2ZKm+
 3BjUap1Uslgo/DLNkR9a+AFGuw88LwCCriRMINQk02oUyv7EDW7O8SFmpzs/A/8Ty06s0//9N
 1fUzbS4EOom3uXErAowR4c7EytkxQHeIEKMqphthvvjpPaXkzggLKKY8c/5m7VVGKx+Wnzo/n
 OPqtroO68rSwmeaIA8PHIBvXcL7/KhHXUQ9zYXl6XmbmEEjqHGs2mpIJ5q24fP3a7NkgxtHBO
 eSmT1S0HSY2nvBNjA7UUc6+ybLSG9yHsLkXf73kK/BGZvZuzPl9cgR42UiZW2BJh0YgRuftIo
 IbeGRLnz1VQf7xrsgqNaZow+iPLN2NPPiTJnse4cArh9VWWwZO5NWgBeti9rvWWl8XMMxOXfx
 Ffyq/D5XCyBfFWOeyTOlJKreoCjvrAlsy4mpMZHqkqzjNDc08jV3vYBYXOG5fJcYuZnP3qNx0
 j/Jx+VsWbREZphltME6dNet320xVe4gj97h8wA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
> Increase the max_access_size to 4 bytes for empty Nubus slot and super slot
> accesses to allow tracing of the Nubus enumeration process by the guest OS.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/nubus/nubus-bus.c  | 10 +++++++---
>  hw/nubus/trace-events |  7 +++++++
>  hw/nubus/trace.h      |  1 +
>  meson.build           |  1 +
>  4 files changed, 16 insertions(+), 3 deletions(-)
>  create mode 100644 hw/nubus/trace-events
>  create mode 100644 hw/nubus/trace.h
> 
> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
> index 63e7d66b95..39182db065 100644
> --- a/hw/nubus/nubus-bus.c
> +++ b/hw/nubus/nubus-bus.c
> @@ -11,6 +11,7 @@
>  #include "qemu/osdep.h"
>  #include "hw/nubus/nubus.h"
>  #include "qapi/error.h"
> +#include "trace.h"
>  
>  
>  static NubusBus *nubus_find(void)
> @@ -23,12 +24,13 @@ static void nubus_slot_write(void *opaque, hwaddr addr, uint64_t val,
>                               unsigned int size)
>  {
>      /* read only */
> +    trace_nubus_slot_write(addr, val, size);
>  }
>  
> -
>  static uint64_t nubus_slot_read(void *opaque, hwaddr addr,
>                                  unsigned int size)
>  {
> +    trace_nubus_slot_read(addr, size);
>      return 0;
>  }
>  
> @@ -38,7 +40,7 @@ static const MemoryRegionOps nubus_slot_ops = {
>      .endianness = DEVICE_BIG_ENDIAN,
>      .valid = {
>          .min_access_size = 1,
> -        .max_access_size = 1,
> +        .max_access_size = 4,
>      },
>  };
>  
> @@ -46,11 +48,13 @@ static void nubus_super_slot_write(void *opaque, hwaddr addr, uint64_t val,
>                                     unsigned int size)
>  {
>      /* read only */
> +    trace_nubus_super_slot_write(addr, val, size);
>  }
>  
>  static uint64_t nubus_super_slot_read(void *opaque, hwaddr addr,
>                                        unsigned int size)
>  {
> +    trace_nubus_super_slot_read(addr, size);
>      return 0;
>  }
>  
> @@ -60,7 +64,7 @@ static const MemoryRegionOps nubus_super_slot_ops = {
>      .endianness = DEVICE_BIG_ENDIAN,
>      .valid = {
>          .min_access_size = 1,
> -        .max_access_size = 1,
> +        .max_access_size = 4,
>      },
>  };
>  
> diff --git a/hw/nubus/trace-events b/hw/nubus/trace-events
> new file mode 100644
> index 0000000000..e31833d694
> --- /dev/null
> +++ b/hw/nubus/trace-events
> @@ -0,0 +1,7 @@
> +# See docs/devel/tracing.txt for syntax documentation.
> +
> +# nubus-bus.c
> +nubus_slot_read(uint64_t addr, int size) "reading unassigned addr 0x%"PRIx64 " size %d"
> +nubus_slot_write(uint64_t addr, uint64_t val, int size) "writing unassigned addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
> +nubus_super_slot_read(uint64_t addr, int size) "reading unassigned addr 0x%"PRIx64 " size %d"
> +nubus_super_slot_write(uint64_t addr, uint64_t val, int size) "writing unassigned addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
> diff --git a/hw/nubus/trace.h b/hw/nubus/trace.h
> new file mode 100644
> index 0000000000..3749420da1
> --- /dev/null
> +++ b/hw/nubus/trace.h
> @@ -0,0 +1 @@
> +#include "trace/trace-hw_nubus.h"
> diff --git a/meson.build b/meson.build
> index 2711cbb789..612ce671b5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2135,6 +2135,7 @@ if have_system
>      'hw/misc/macio',
>      'hw/net',
>      'hw/net/can',
> +    'hw/nubus',
>      'hw/nvme',
>      'hw/nvram',
>      'hw/pci',
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

