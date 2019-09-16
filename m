Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A2B43A0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 23:56:57 +0200 (CEST)
Received: from localhost ([::1]:40358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9yzQ-00016K-JZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 17:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36722)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1i9yuP-0005Q6-DE
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 17:51:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1i9yuO-0005Qa-CS
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 17:51:45 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:43925)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1i9yuO-0005QG-4g; Mon, 16 Sep 2019 17:51:44 -0400
Received: by mail-lj1-x244.google.com with SMTP id d5so1372045lja.10;
 Mon, 16 Sep 2019 14:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dHV9MFS1O1cML6v2TCEuRoqITxao5npELaTL/5vjs70=;
 b=FgHr92e3ijT7FCOJ/a8hwAmgbA6ELOQmGhgv5ibxF+p4CcO1hN1BCZAiouc9/c5QPC
 P8vVShwEGbO5QtDh14fXIb5UljFRbMy0rqcw0WieFVxodMRnCiwFntQ3RJW8cvv0FdrU
 DiHYJZKgbsivDI5wf+JdfrWJsAISfW1LKdGFQ/JTRtmyHmUAaUIyBLK1OpjOOV21jXtt
 2R/Gw9qE3WzSCH2Er0sGQs/s3wJBn/752fBdeyxBI7xuAJMY/D8MavIXKzRMD4qzEIdm
 Ezpda2ZtPCR9N8i9mIF5AntIdJkLK/ljdLPEtWi4jQ+4MFwUh0gJ38qJZY/6N7MMjJBW
 X9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dHV9MFS1O1cML6v2TCEuRoqITxao5npELaTL/5vjs70=;
 b=frpBQejHPC+eibOVcttgjRMiI1yrmcGaZ+1ck5eE20wRVgYCR/u5kPDaiwwgd+Ls7i
 SbMNfhxIPD3z7O0/UMCO6FtLdZP5lX173elCpaveTaNh+J1Be3paFkD0T1J1rVZS7HoJ
 pAR6AgQv6VUU+kz26Shj1v6ExeEjGdvkUsYyR9a/lMhx5SYSxmRLD7142UiDdstrLyWw
 wXWpF+5sX0U/mUek3qZfAvTA8yV4TbchAGyaNqob3Y6CxBBTF2fGlE0XxyKKCrEy85m+
 jS6gHlE3CbWkgJ3538Y1bDFdbGKwYZ8Zn2oZZhIeu4uRchY8FPYskluCjEbHTvHl8+HJ
 irHA==
X-Gm-Message-State: APjAAAX1HRhr1adQBAz152E4v+0pVADSEuxIPowBZ8cqdNfZ7UIgab1u
 2BcA5F+GjASgFWFkAHgCWH18vPF6qmfkZ6RWBLQ=
X-Google-Smtp-Source: APXvYqytQKBSfFLF1EvownTgtzirpKMW4GHWAj4YBz/BRi/fG2HYJVfZcjGcnSqQ+TOgHo/g6rtKCg5sdX6Rgsf1Vzs=
X-Received: by 2002:a2e:81d1:: with SMTP id s17mr47515ljg.94.1568670702940;
 Mon, 16 Sep 2019 14:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190916154847.28936-1-philmd@redhat.com>
 <20190916154847.28936-14-philmd@redhat.com>
In-Reply-To: <20190916154847.28936-14-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Sep 2019 14:47:11 -0700
Message-ID: <CAKmqyKNgY8pR=U8rf7vMMDONSH2xRCz7_6ksNR0ZVupkpuKPAA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-devel] [PATCH 13/13] hw/rtc/xlnx-zynqmp-rtc: Remove
 unused "ptimer.h" include
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 16, 2019 at 9:46 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The "hw/ptimer.h" header is not used, remove it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/rtc/xlnx-zynqmp-rtc.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/rtc/xlnx-zynqmp-rtc.c b/hw/rtc/xlnx-zynqmp-rtc.c
> index f9f09b7296..2bcd14d779 100644
> --- a/hw/rtc/xlnx-zynqmp-rtc.c
> +++ b/hw/rtc/xlnx-zynqmp-rtc.c
> @@ -32,7 +32,6 @@
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "hw/irq.h"
> -#include "hw/ptimer.h"
>  #include "qemu/cutils.h"
>  #include "sysemu/sysemu.h"
>  #include "trace.h"
> --
> 2.20.1
>
>

