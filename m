Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5B7105368
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 14:43:08 +0100 (CET)
Received: from localhost ([::1]:40594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXmjj-0004SU-I7
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 08:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60223)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iXmhA-0002O6-T3
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:40:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iXmh9-0003Ww-S5
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:40:28 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33715)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iXmh7-0003QV-Uj
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 08:40:27 -0500
Received: by mail-ot1-x342.google.com with SMTP id u13so2967220ote.0
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 05:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ufUC7Hrdp01lUaI7/yPjPIzKGNZ/PGaWg+Z8DWu+6nI=;
 b=y/yhtfvsN8HxZwWABR4pdHfl6LcVWYh9FwiPY2YJgv+S6ngayEmj5wpC/lMsvKMRQX
 xc/dbyQqY3ONZz7blgLEc2tgQHC9tWy+Y6DVPfGrXKZwXaFblF+g2IJDJs7pGN9nSo4c
 Xtj82I/q1JM0pQDpW+r3oKFFOS3YTwORFmpYh6MFLJ54FBAUQMBXfMjVPj9UMIQuN5N4
 HC9TJkPM3MMwFOrU3XGKbmVzm1ND/Y3KyChsIPin7HUt9ujPZTT6W8RTBSpMR0vr/MmD
 aNnf9pgY7/sTOqk5Zw+TxAY6NB1HzuIARC91PDRdYn+fN6Kc0cFRCtQsMD6r6SWHa/3W
 +L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ufUC7Hrdp01lUaI7/yPjPIzKGNZ/PGaWg+Z8DWu+6nI=;
 b=GE3y/TomjWzIjioHHEFdrjFVufH8hKYhOdP3j4ZJexulW0195h1ilPqplxfKex/qwq
 H0QZz2bCG2CKxYjAav1od109Yz9zLDhHuDfK6dGPW5C1SBaXbhIUQy9XTzgVcRMFdPWN
 FNmqPA0pbyR1DQMCzCGIQ8yr3onEEcYg/XPaVu1arp4gD3meTBpRdMMUyt/7ong3tUl4
 nSJ+EOutJj6AEpdGwaB/DBza9Hcq52ouzKv2DW+BueURpEHz7Hae+TQvPpR7WjYfQael
 pXstZownb2bOKqSYChKOxqaqjSyr7sosXaqw/tL8HPJ9/MJ+5SXNSgBXceS41VTQ7ulY
 eIRA==
X-Gm-Message-State: APjAAAViwdNhlnq+5mXBfe7YUGAjoSIlh7zobDXDSL8YzHvgByO3yKRc
 CEucxmFH1pwu4eyeGa4DGy1psGlw4V4+u9HtPDipVg==
X-Google-Smtp-Source: APXvYqzJG4ZvDQ/wFNUCnA0TgjNI/RxCOqhaN/UZyQJm23l4Q/BIPeQXbojdkZkp7APuU7oyyVpwaFdLqLPH6xzB1VE=
X-Received: by 2002:a9d:7ac2:: with SMTP id m2mr6504426otn.135.1574343618098; 
 Thu, 21 Nov 2019 05:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20191120152442.26657-1-marcandre.lureau@redhat.com>
 <20191120152442.26657-20-marcandre.lureau@redhat.com>
In-Reply-To: <20191120152442.26657-20-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Nov 2019 13:40:07 +0000
Message-ID: <CAFEAcA9GEng0pQqk8cfUJvKMuxSMrdG-rkDOC3_srg5qS9V=jg@mail.gmail.com>
Subject: Re: [PATCH v4 19/37] mips: use sysbus_add_io()
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Nov 2019 at 15:28, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/mips/mips_mipssim.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
> index 3cd0e6eb33..2c2c7f25b2 100644
> --- a/hw/mips/mips_mipssim.c
> +++ b/hw/mips/mips_mipssim.c
> @@ -227,8 +227,7 @@ mips_mipssim_init(MachineState *machine)
>          qdev_set_legacy_instance_id(dev, 0x3f8, 2);
>          qdev_init_nofail(dev);
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, env->irq[4]);
> -        memory_region_add_subregion(get_system_io(), 0x3f8,
> -                                    &SERIAL_IO(dev)->serial.io);
> +        sysbus_add_io(SYS_BUS_DEVICE(dev), 0x3f8, &SERIAL_IO(dev)->seria=
l.io);
>      }
>
>      if (nd_table[0].used)
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

