Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64930DF72E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 22:54:19 +0200 (CEST)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMeh0-0007hT-BO
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 16:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iMefY-0006iG-Lh
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 16:52:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iMefX-0001UF-Jd
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 16:52:48 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:36477)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iMefX-0001Sd-Ac; Mon, 21 Oct 2019 16:52:47 -0400
Received: by mail-lj1-x242.google.com with SMTP id v24so14833884ljj.3;
 Mon, 21 Oct 2019 13:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=shzBV7atMRuOLT/wTZTJagCUVXFE+q2AP76mmfFPd60=;
 b=JvhYaY/9oQ08dLhx6n9aCahDBONSlj1xFVk+19p1y1u7zohYJnfGLwGxodvi2c8a4U
 v9Efe0D5ycSlC7SzYpkgjn0oYgTiMMU4htNXYwt3mNy/xfcIJV2MzS+qbsLm9u4lI8/L
 3zHRMXiHKYxz7sWOMfr9vd4Y0HZJwarMsb6OurKp9vTqznyJONefgyIjcAS8wx1DBRqw
 VKw6CJ9Om2fJkjRqRAeCG7iPfxOhVRI+dy45PX4brJxaTy4YI2Nuofqu4bn2qkxLos4P
 poQzUmidq911OoLGe7ZWcnScS2e/FN6wJ8fNGpF46PW+Z8+r5LGzuzHZuyMG9+Wr6cUa
 WGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=shzBV7atMRuOLT/wTZTJagCUVXFE+q2AP76mmfFPd60=;
 b=Jafitqm59KKIC5kmaUp+D5PeizK2wdodfm+F3Oe+uycOfVGqjBRswlf7sYWIzKhU9k
 mHcNirZAwjUadO0k+3NTU3bvKUhd+qxxvWCVfJ3vh1hykAcE6HHFENPo7CIaR1H7FYcj
 rF0pb9cDdBXaQ/+QC2434nPeAgp0TAtFerVIYNHgKjiROzooWk0bxDjmZ1AzR9vCuN1D
 yGthtcj+tdyP3lVNzcPsC/0DrbBxZ8rH6OygrWAbdI4S4Pcj68xVr2QFdmaPOCSoZUAs
 1Wt6mlsC9hGHzAqLBn/gSA1XMf4hCci4us3f62+wBS7VlXkY3Okg3jsIPW2cvlsBCApc
 yykw==
X-Gm-Message-State: APjAAAXCMGGqr1oTm/H2gAvedStLz2DBA1tOTqCYflBZoCIlzN8d5fEw
 x6t3EqohytD2q/OYhgUt4iemK/7SfQAwM2zHQ/4=
X-Google-Smtp-Source: APXvYqweztJCvIJqzkVczX/4U4w5nnt5YgOZz9UQzzj4w1SqwXfL9jFqRdieeZ/GzLP6miOsMJZkqYgkFvm4lE5q4vs=
X-Received: by 2002:a2e:b010:: with SMTP id y16mr16776740ljk.147.1571691166203; 
 Mon, 21 Oct 2019 13:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-3-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-3-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Oct 2019 13:47:30 -0700
Message-ID: <CAKmqyKM7zebpHHezzQ=VBZOWduqRo=OE5tSJbEmks-TDYxUvTQ@mail.gmail.com>
Subject: Re: [PATCH 02/21] hw/arm/mps2: Use the IEC binary prefix definitions
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

On Sun, Oct 20, 2019 at 4:02 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> IEC binary prefixes ease code review: the unit is explicit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/mps2-tz.c | 3 ++-
>  hw/arm/mps2.c    | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 6b24aaacde..f8b620bcc6 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -38,6 +38,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/boot.h"
> @@ -458,7 +459,7 @@ static void mps2tz_common_init(MachineState *machine)
>       * call the 16MB our "system memory", as it's the largest lump.
>       */
>      memory_region_allocate_system_memory(&mms->psram,
> -                                         NULL, "mps.ram", 0x01000000);
> +                                         NULL, "mps.ram", 16 * MiB);
>      memory_region_add_subregion(system_memory, 0x80000000, &mms->psram);
>
>      /* The overflow IRQs for all UARTs are ORed together.
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index 10efff36b2..d002b126d3 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -23,6 +23,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/boot.h"
> @@ -146,7 +147,7 @@ static void mps2_common_init(MachineState *machine)
>       * zbt_boot_ctrl is always zero).
>       */
>      memory_region_allocate_system_memory(&mms->psram,
> -                                         NULL, "mps.ram", 0x1000000);
> +                                         NULL, "mps.ram", 16 * MiB);
>      memory_region_add_subregion(system_memory, 0x21000000, &mms->psram);
>
>      switch (mmc->fpga_type) {
> --
> 2.21.0
>
>

