Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279A4D663C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 17:38:37 +0200 (CEST)
Received: from localhost ([::1]:51598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK2Qe-00050p-86
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 11:38:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60631)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2PP-0004HF-CX
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 11:37:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2PO-0002WJ-57
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 11:37:19 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35884)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iK2PN-0002Vz-Ve
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 11:37:18 -0400
Received: by mail-oi1-x244.google.com with SMTP id k20so14107226oih.3
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y32A3HJkq/d3cuV4YZtMh4nWb24oTgdNXB+M2DCNMHA=;
 b=LTJhyt+/lQvd7U7ZHETZkyBgut7BBmZ3qzIQDz337HWsmR7AZuwUx2zsaRy0O/EZuH
 x/Ib5QIcFp7UK4iHVmsxnB8S0NatTl3Caa1imNVRq2egRaurjlXvjXYZsUvi7+NYBuVT
 gN8psICUfFSeuLEh1kPZ2AORhzMwLXPl82TTXAG2Y2iWD8LnVx9eLQhgUEkur7R8L8Nf
 qNupytVd4P3RUX+Xqwj/Wv04ZLd5zrPGWyWqnyflR0ArB3tFiSmvvqLrrGCYCEbRLPy3
 OkKZQhiF/BC2cAHzekHuZ5DTNUCruLhGAvtdAttHeFbxJEter/cuWIB6eW/PXrrpaw9A
 b/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y32A3HJkq/d3cuV4YZtMh4nWb24oTgdNXB+M2DCNMHA=;
 b=KM/SYlv2ASZPMMfzSWOJpIJBlB7j3SkiUX7tNF9jPIu69dDUsF8ly+PQ/Mj4cZJbPR
 TEQMVhOjNpAtBBzQGyP3cZihcoAD6dKJ5fS3oi7RlNlV9z3ZlbzK/GAnntPaSj8HangK
 bGH2fo08efumYJ3PbhDa4eVy1faLSJAzcs3nEOAI18qK/r53vcCJO/IEeOOEaSrjYO7K
 /7oIBhYpUgesANwlOTNFlwHkCzeUUx5mr60tJ953R+4uwGZWSpQIJRV4lnHxNjUvXNU5
 rEcd+qFOLlKhAFgaRqXuZB+M7DmVYAAQEpByN5SXbwotQaV9794qqfHFBTMhMEycFFis
 sMtg==
X-Gm-Message-State: APjAAAWvpo1KgQdWDCwYOeC7ImRx7z+cniYr7p2/e9hZUXxRmyGqKIDr
 wYrQSuufmNC/fVMJTAjUVYT4n+8aewE465X9SjR5VQ==
X-Google-Smtp-Source: APXvYqzsqMLVHaUqTw/k7KQXu8gLg85xxAUvyXsS2iO3z5pibwI6ceo7aQCRSk4IYoMsc9LTfq+q7+C9DxnSRRKZ0kk=
X-Received: by 2002:aca:2b08:: with SMTP id i8mr23689243oik.146.1571067437188; 
 Mon, 14 Oct 2019 08:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-9-f4bug@amsat.org>
In-Reply-To: <20190926173428.10713-9-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2019 16:37:05 +0100
Message-ID: <CAFEAcA-2SCsRepsERqGWD-4AYy=uxb7Y2eW2F_z45tyo0Yx-fw@mail.gmail.com>
Subject: Re: [PATCH 08/19] hw/misc/bcm2835_thermal: Add a dummy BCM2835
 thermal sensor
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: =?UTF-8?Q?Zolt=C3=A1n_Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Sep 2019 at 18:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We will soon implement the SYS_timer. This timer is used by Linux
> in the thermal subsystem, so once available, the subsystem will be
> enabled and poll the temperature sensors. We need to provide the
> minimum required to keep Linux booting.
>
> Add a dummy thermal sensor returning ~25=C2=B0C based on:
> https://github.com/raspberrypi/linux/blob/rpi-5.3.y/drivers/thermal/broad=
com/bcm2835_thermal.c
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> checkpatch warning:
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> This is OK because the regex are:
>
>   F: hw/*/bcm283*
>   F: include/hw/*/bcm283*

> +static void bcm2835_thermal_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->realize =3D bcm2835_thermal_realize;
> +}

This is missing the vmsd and reset function.

thanks
-- PMM

