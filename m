Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66328701D65
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 14:36:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyAwN-00047u-E9; Sun, 14 May 2023 08:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyAwD-00047H-MC; Sun, 14 May 2023 08:34:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyAwB-0004Q9-SP; Sun, 14 May 2023 08:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G/qq3SvdqTtRjr7ZqSkPkMGDi4N3302SLIRO0oVyfD0=; b=EZ9TOuFmmSgSVv//LHV4xDCe8f
 7heRigNkIbuvoCxyBD4pHltpjG+TAM3kEaBqMVLTrIufg4So+Stjng/UoFLJ8OG8xGqtp08zt2kO1
 IQpUCaMSNWas/zdxTBGHrI3TB+KukSUAwHsLXn3tDLvGQnUFS0QDRRD9hQvM58tPeW+In+mqRTC8Q
 MafpTvLTL5HDZs8X1CQj3KCAY/89iE1Hn5Ol0YEtPa3d816AIQq4dpckVsxoNB00rnmWjjLIO3u95
 zh+aO//6Yuz85gqhBgnBHFEZ52Wwbl/HKRqq6r4CVbAH6Bbppt2OgBD7HWrqGjgQzBipC1T7WxMot
 z09g53dUc7yvUHpe1USnkYDAwYRuVD5ICJa6EwaoFtfZDwXqHiivudr+T5gR66ChD9BmxeWGJhGPB
 prmQsziZUcJDq0H1gZB6N+eyYjX9nv2QApR3+EeG9hOVus1c/tRF/5cJgc6a0LCE5GUJgrCKSGe0v
 7vI6I1FNlSfIlwjOYl4suYL/KQBtIBV89b8QRjxpt7boKn26fh52/bdkcJT+kbSou7m811GFRAbdX
 Ny5JLjdMil0K3Dmoe7IgSjSR6mDsqjOXwWo0QuEadqFbgwfe+ELopD/+aG9s6RlyOzguCNppG/E6o
 NKaan3iumr4ScWFDMhVLRM82LgF5C0WMYnGjvmuDw=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyAv8-0003D5-9m; Sun, 14 May 2023 13:33:50 +0100
Message-ID: <90acf35d-70ff-8da7-322e-96bf3504001e@ilande.co.uk>
Date: Sun, 14 May 2023 13:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230513100906.46672-1-shentey@gmail.com>
 <20230513100906.46672-4-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230513100906.46672-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 3/4] hw/char/parallel: Export TYPE_ISA_PARALLEL macro
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 13/05/2023 11:09, Bernhard Beschow wrote:

> Rather than using a string literal which is prone to typos let's use a macro
> instead which is caught by the compiler if mistyped.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/char/parallel.h | 2 ++
>   hw/char/parallel-isa.c     | 2 +-
>   hw/char/parallel.c         | 1 -
>   hw/isa/isa-superio.c       | 3 ++-
>   4 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/char/parallel.h b/include/hw/char/parallel.h
> index 0a23c0f57e..29d2876d00 100644
> --- a/include/hw/char/parallel.h
> +++ b/include/hw/char/parallel.h
> @@ -4,6 +4,8 @@
>   #include "hw/isa/isa.h"
>   #include "chardev/char.h"
>   
> +#define TYPE_ISA_PARALLEL "isa-parallel"
> +

We don't really want to separate the QOM TYPE_* constant macro and the OBJECT_* 
declaration macro.

It looks like the real issue is that ParallelState should be in 
include/hw/char/parallel.h, and ISAParallelState along with its QOM macros should be 
in a new include/hw/char/parallel-isa.h header.

Once that is done then using the TYPE_ISA_PARALLEL QOM macro will "just work".

>   void parallel_hds_isa_init(ISABus *bus, int n);
>   
>   bool parallel_mm_init(MemoryRegion *address_space,
> diff --git a/hw/char/parallel-isa.c b/hw/char/parallel-isa.c
> index 1ccbb96e70..547ae69304 100644
> --- a/hw/char/parallel-isa.c
> +++ b/hw/char/parallel-isa.c
> @@ -21,7 +21,7 @@ static void parallel_init(ISABus *bus, int index, Chardev *chr)
>       DeviceState *dev;
>       ISADevice *isadev;
>   
> -    isadev = isa_new("isa-parallel");
> +    isadev = isa_new(TYPE_ISA_PARALLEL);
>       dev = DEVICE(isadev);
>       qdev_prop_set_uint32(dev, "index", index);
>       qdev_prop_set_chr(dev, "chardev", chr);
> diff --git a/hw/char/parallel.c b/hw/char/parallel.c
> index af551e7864..3d32589bb3 100644
> --- a/hw/char/parallel.c
> +++ b/hw/char/parallel.c
> @@ -93,7 +93,6 @@ typedef struct ParallelState {
>       PortioList portio_list;
>   } ParallelState;
>   
> -#define TYPE_ISA_PARALLEL "isa-parallel"
>   OBJECT_DECLARE_SIMPLE_TYPE(ISAParallelState, ISA_PARALLEL)
>   
>   struct ISAParallelState {
> diff --git a/hw/isa/isa-superio.c b/hw/isa/isa-superio.c
> index c81bfe58ef..53b80de0ce 100644
> --- a/hw/isa/isa-superio.c
> +++ b/hw/isa/isa-superio.c
> @@ -20,6 +20,7 @@
>   #include "hw/isa/superio.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/input/i8042.h"
> +#include "hw/char/parallel.h"
>   #include "hw/char/serial.h"
>   #include "trace.h"
>   
> @@ -51,7 +52,7 @@ static void isa_superio_realize(DeviceState *dev, Error **errp)
>               } else {
>                   name = g_strdup_printf("parallel%d", i);
>               }
> -            isa = isa_new("isa-parallel");
> +            isa = isa_new(TYPE_ISA_PARALLEL);
>               d = DEVICE(isa);
>               qdev_prop_set_uint32(d, "index", i);
>               if (k->parallel.get_iobase) {


ATB,

Mark.


