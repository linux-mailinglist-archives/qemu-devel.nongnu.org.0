Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F14556EF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 20:18:28 +0200 (CEST)
Received: from localhost ([::1]:34516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfq1T-0003oe-9g
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 14:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48103)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hfpzB-000300-U3
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 14:16:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hfpzA-0006dN-8Q
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 14:16:05 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36442)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hfpz9-0006cf-US
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 14:16:04 -0400
Received: by mail-ot1-x341.google.com with SMTP id r6so18249790oti.3
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 11:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZHlrIuSk11MD61W0v3vDArvKslWzs4N0mg5AH7eJoDA=;
 b=YbGF/SBfoRPaBdx7FJlql2LShSXthSS1EG2HiW7PQKMeUh/Cp8XUPN/Ce8q7ejSTh4
 V0NGdla+cYb1V+66fa4AooLl8Da9cA1LIOhckMunb84ohpWqQqN6sBs5AXxwBpbSRrdH
 mvPTCZwqaEAaa3+j+2hhQollCZNTcU7H08K0C2sbBzlcqPZEdzAWZpqLlZbZhwOFGxtO
 ajnLBozQYGDMX7/kod301PHSAxZLOqi2UsKrGAAZdRDipl5BgjePNG3mfcDiayaw1wa0
 Xg++7omfYPczTs1O94rqFYNCWOC5iMt5ZduGUqqEsAuHcjBF/dmQbI/6bbva5+1hvtcd
 g44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZHlrIuSk11MD61W0v3vDArvKslWzs4N0mg5AH7eJoDA=;
 b=Q5iB/RjMTQPuyv8hS136WYfcmdtusbt2OqpYtzy0YpLJa1UUfWDetP5lyweWDdT2GT
 QmWLOKJ3M+exhJy0tt0HF6xf4awP9cK0L0+MnFXs0JUjO0Lifa/yX0r+eJt15L71pu4k
 FGDVfR3oFh0PlWBGHejTgS8s1XCvEi+ycMjnXuzGP+gfdJt+olfCz/Kq/1VgGHt4UDVC
 xhOg6ki3NsYPZJc1bELL7NCQfnfswSzWFZvUY+ItxO9VWFzBHNrBIV1ksezUko4nlhiR
 E/Q6HTSTp5li4MKZD7/Zwu6C+dOVuQx1daDxVoUhn7xHUKy+ypxAninBgz38vfMKwbsQ
 +nDA==
X-Gm-Message-State: APjAAAVeYj/u/lZrP0QFEsmRozi0lwLhqkqTns0uvU7El4iOLdG6NQkf
 Hb/52xqm6ibHYkUn2yMfyqtzqzpCQm2KM+YhNrY=
X-Google-Smtp-Source: APXvYqx1l2foBujIyBvQKgYfsqb3aqa3IEcjXXKgcycVujN9YqAQ/7DBaQ0V5QeNQoy9ft23ZiNB+sCPZrLFDCPWqTs=
X-Received: by 2002:a05:6830:11d4:: with SMTP id
 v20mr20232619otq.121.1561486562998; 
 Tue, 25 Jun 2019 11:16:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Tue, 25 Jun 2019 11:16:02
 -0700 (PDT)
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Tue, 25 Jun 2019 11:16:02
 -0700 (PDT)
In-Reply-To: <20190624222844.26584-6-f4bug@amsat.org>
References: <20190624222844.26584-1-f4bug@amsat.org>
 <20190624222844.26584-6-f4bug@amsat.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Tue, 25 Jun 2019 20:16:02 +0200
Message-ID: <CAL1e-=h31uYzZ3dpdvwcW5fq5+g9Q5RMpb2r7sB4U3M9DK9T5A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH 05/10] hw/mips/gt64xxx_pci: Use
 qemu_log_mask() instead of debug printf()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jun 25, 2019 12:42 AM, "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org> w=
rote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

>  hw/mips/gt64xxx_pci.c | 48 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 11 deletions(-)
>
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index 0b9fb02475..f44326f14f 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -23,6 +23,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "hw/hw.h"
>  #include "hw/mips/mips.h"
>  #include "hw/pci/pci.h"
> @@ -466,12 +467,20 @@ static void gt64120_writel(void *opaque, hwaddr
addr,
>      case GT_CPUERR_DATAHI:
>      case GT_CPUERR_PARITY:
>          /* Read-only registers, do nothing */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "gt64120: Read-only register write "
> +                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      saddr << 2, size, size << 1, val);
>          break;
>
>      /* CPU Sync Barrier */
>      case GT_PCI0SYNC:
>      case GT_PCI1SYNC:
>          /* Read-only registers, do nothing */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "gt64120: Read-only register write "
> +                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      saddr << 2, size, size << 1, val);
>          break;
>
>      /* SDRAM and Device Address Decode */
> @@ -510,7 +519,10 @@ static void gt64120_writel(void *opaque, hwaddr addr=
,
>      case GT_DEV_B3:
>      case GT_DEV_BOOT:
>          /* Not implemented */
> -        DPRINTF ("Unimplemented device register offset 0x%x\n", saddr <<
2);
> +        qemu_log_mask(LOG_UNIMP,
> +                      "gt64120: Unimplemented device register write "
> +                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      saddr << 2, size, size << 1, val);
>          break;
>
>      /* ECC */
> @@ -520,6 +532,10 @@ static void gt64120_writel(void *opaque, hwaddr addr=
,
>      case GT_ECC_CALC:
>      case GT_ECC_ERRADDR:
>          /* Read-only registers, do nothing */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "gt64120: Read-only register write "
> +                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      saddr << 2, size, size << 1, val);
>          break;
>
>      /* DMA Record */
> @@ -543,23 +559,20 @@ static void gt64120_writel(void *opaque, hwaddr
addr,
>      case GT_DMA1_CUR:
>      case GT_DMA2_CUR:
>      case GT_DMA3_CUR:
> -        /* Not implemented */
> -        DPRINTF ("Unimplemented DMA register offset 0x%x\n", saddr << 2)=
;
> -        break;
>
>      /* DMA Channel Control */
>      case GT_DMA0_CTRL:
>      case GT_DMA1_CTRL:
>      case GT_DMA2_CTRL:
>      case GT_DMA3_CTRL:
> -        /* Not implemented */
> -        DPRINTF ("Unimplemented DMA register offset 0x%x\n", saddr << 2)=
;
> -        break;
>
>      /* DMA Arbiter */
>      case GT_DMA_ARB:
>          /* Not implemented */
> -        DPRINTF ("Unimplemented DMA register offset 0x%x\n", saddr << 2)=
;
> +        qemu_log_mask(LOG_UNIMP,
> +                      "gt64120: Unimplemented DMA register write "
> +                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      saddr << 2, size, size << 1, val);
>          break;
>
>      /* Timer/Counter */
> @@ -569,7 +582,10 @@ static void gt64120_writel(void *opaque, hwaddr addr=
,
>      case GT_TC3:
>      case GT_TC_CONTROL:
>          /* Not implemented */
> -        DPRINTF ("Unimplemented timer register offset 0x%x\n", saddr <<
2);
> +        qemu_log_mask(LOG_UNIMP,
> +                      "gt64120: Unimplemented timer register write "
> +                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      saddr << 2, size, size << 1, val);
>          break;
>
>      /* PCI Internal */
> @@ -610,6 +626,10 @@ static void gt64120_writel(void *opaque, hwaddr addr=
,
>      case GT_PCI1_CFGADDR:
>      case GT_PCI1_CFGDATA:
>          /* not implemented */
> +        qemu_log_mask(LOG_UNIMP,
> +                      "gt64120: Unimplemented timer register write "
> +                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      saddr << 2, size, size << 1, val);
>          break;
>      case GT_PCI0_CFGADDR:
>          phb->config_reg =3D val & 0x80fffffc;
> @@ -666,7 +686,10 @@ static void gt64120_writel(void *opaque, hwaddr addr=
,
>          break;
>
>      default:
> -        DPRINTF ("Bad register offset 0x%x\n", (int)addr);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "gt64120: Illegal register write "
> +                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
> +                      saddr << 2, size, size << 1, val);
>          break;
>      }
>  }
> @@ -940,7 +963,10 @@ static uint64_t gt64120_readl(void *opaque,
>
>      default:
>          val =3D s->regs[saddr];
> -        DPRINTF ("Bad register offset 0x%x\n", (int)addr);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "gt64120: Illegal register read "
> +                      "reg:0x03%x size:%u value:0x%0*x\n",
> +                      saddr << 2, size, size << 1, val);
>          break;
>      }
>
> --
> 2.19.1
>
>
