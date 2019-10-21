Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDE0DF731
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 22:54:51 +0200 (CEST)
Received: from localhost ([::1]:47776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMehW-0008Kg-Bl
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 16:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41517)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iMef8-0006Fn-G4
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 16:52:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iMef7-00012c-Hx
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 16:52:22 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:44379)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iMef7-00010X-Ak; Mon, 21 Oct 2019 16:52:21 -0400
Received: by mail-lj1-x242.google.com with SMTP id m13so14789962ljj.11;
 Mon, 21 Oct 2019 13:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KrhRfwiS41Hw/oEUjcvgsIMHQ+z/35x3gIw8/+L5IFU=;
 b=ENGoBSA5gZ4flA07YahWqS2CvhJN7bEkVitIWe+kzqqXWlAwuMr9IWBZubCnCOGwny
 /np8GcV2lOZq19Y8dUSxqAYTuuoDa1xPnST8yzUGMTRu7PGU+rRki007wB+6F0t7SSmb
 HzD+wq1o0W81G0RETCo9+0lNeoWPws10QROmL/qbWklgyl4aKFODCWhGoarmVIvDoU6I
 sRLhwbTXcC7ph46uqdLPLC4aoTofEIDDAjLcrSjTNsUB5VFKfEsBDp57cRlmtarwti6x
 IFR91p0ICv4BHfEpdfy/lOHbO0Lvlmb21JKMdFGASHe4LqtkZr5Gc/XA1vyo+LfeOl7S
 WUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KrhRfwiS41Hw/oEUjcvgsIMHQ+z/35x3gIw8/+L5IFU=;
 b=S5yJO1I0djJUkA4dU0AzCOX4AruBdrr/9j1OEtF3N/tInBeqwe/9WrxNVD8WLCcl10
 uQFpXCm+5rrpjKRB0xuUmhLkEOPh/142NVSEPfPCPL+O8dMvZH3JziFd/J/REEv5Oj6x
 cqwmGTJ5bZilNqPm7C93iG4kLv8wLzZdHBNixlTGbf20THW5HwVjqpQtFesatR6cOkWW
 DPFG0bp67Mp8mwQlzHU0QFGF3zRbBV+gdOwQSv8e+Jug5Vps+sGLEt+972fnC457xVQO
 6qe0vJSbBlPGuz8cbvNhN253m6dFTlns8+HQI2xYoG+lDR6UAGqQljJUgPTNa/mEYaNd
 woSg==
X-Gm-Message-State: APjAAAXroYfEO9gGCgev1kMMVLQn6HsC5mIPaeGuJUJYhBRrqj2GVSoW
 Xt10YMmPKgBRwZNnkTL1n+wzFZUJblpUmrAdYhM=
X-Google-Smtp-Source: APXvYqxiVU/K+dApIBZl2SRm3CE8hvgJQSgXuK7Y47EFdHLHqaJCfF13VI49956TzJlk8yX0Eog7NDmu3Yy7zACrNmw=
X-Received: by 2002:a2e:420a:: with SMTP id p10mr16782265lja.16.1571691138487; 
 Mon, 21 Oct 2019 13:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-2-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-2-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Oct 2019 13:47:02 -0700
Message-ID: <CAKmqyKN0AMExig+d-TFOA4J6iK+Kn9jcNvaayLBdcwdjbno6eg@mail.gmail.com>
Subject: Re: [PATCH 01/21] hw/arm/xilinx_zynq: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
Cc: Paul Burton <pburton@wavecomp.com>, Jan Kiszka <jan.kiszka@web.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Fabien Chouteau <chouteau@adacore.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 20, 2019 at 3:58 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> IEC binary prefixes ease code review: the unit is explicit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xilinx_zynq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index c14774e542..3a0fa5b23f 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -16,6 +16,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "hw/sysbus.h"
> @@ -194,7 +195,7 @@ static void zynq_init(MachineState *machine)
>      memory_region_add_subregion(address_space_mem, 0, ext_ram);
>
>      /* 256K of on-chip memory */
> -    memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 << 10,
> +    memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 * KiB,
>                             &error_fatal);
>      memory_region_add_subregion(address_space_mem, 0xFFFC0000, ocm_ram);
>
> --
> 2.21.0
>
>

