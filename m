Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A804F130801
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jan 2020 13:35:18 +0100 (CET)
Received: from localhost ([::1]:41600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1io57l-000424-H3
	for lists+qemu-devel@lfdr.de; Sun, 05 Jan 2020 07:35:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1io56b-0003In-65
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 07:34:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1io56Z-00077X-Nd
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 07:34:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51618
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1io56Z-00076q-J6
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 07:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578227642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8Prri9WaGRO65yjl09PcbeCr+ZCjA9X+9asGScE0xU=;
 b=L6/PngZrUzhqNWJhhMlFqmad+xHmwwaXB97Vg57/Etqw6zaxgvhdDv8AUmCHbLvTB9BfM7
 oTMNcPMq+Kw/k6WsjFXa7yo90rw7TEacfucGKl7HW2O0iHj3Dk3vpv9ZOoeKDDlarqs6fj
 uTwW3ANOPU0EqqhxyQYO45FgjiKrBmI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-0pyR4CuWOae9roh14E0G_g-1; Sun, 05 Jan 2020 07:34:01 -0500
Received: by mail-qv1-f70.google.com with SMTP id di5so16606268qvb.3
 for <qemu-devel@nongnu.org>; Sun, 05 Jan 2020 04:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TR3cstnnK+QyGLvRLq/RdvlbvZb4gYytD8iSV5sXewE=;
 b=dFn+sQLTeDv7loeb2sZ11CnZ3EiO7g3yw/NQizQtYptI5rW6LFdkbDJ9LlZgBhybnu
 /OuPjkClRYcHPfU4rZHfvHeLqVv/7r1iqrAgFeJNtW3nFV9WDKIhOluUluohvlkHrXr0
 28URtbW07wRNmrw/IsColZYAG0DPGZ69/qGftjHyQ/Su8cBN+bbQefoBN+b4s1IJeFOP
 AkSzqGXxij8CjNvDJanEcf+Z0UOxpi7vRNwZRgMp4d1ubHvLo4hw5JB5/OdQq3d/BLE8
 jmw7XLcruePn01lNc2oJBt9neX3bqfYm7n0tfBbXCyTJT00UCVm+DFstAxjwoMW3o2yv
 C6FQ==
X-Gm-Message-State: APjAAAWAL+640HaQKiev0F3XWF/CjdY/9eXXdCoyJF/L7HdrE0paDSV7
 Cz8JFLATfGvloGGIl5hwqR6Dujgrhgt4B3Jhl33s9iOogvYNO2x9cDbaB7W8RSo7/W5zRIMqlC1
 SgSRrF8BuHF7Lkys=
X-Received: by 2002:a37:9245:: with SMTP id u66mr80446287qkd.102.1578227641148; 
 Sun, 05 Jan 2020 04:34:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqwdUsdYh/bUtV2CzvAF3l16jKUb3caYUthYOiNiE+doW1wVtBHwYFkR1tknHHak0dOQ/XOUCw==
X-Received: by 2002:a37:9245:: with SMTP id u66mr80446274qkd.102.1578227640900; 
 Sun, 05 Jan 2020 04:34:00 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id j194sm19260957qke.83.2020.01.05.04.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 04:34:00 -0800 (PST)
Date: Sun, 5 Jan 2020 07:33:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [PATCH 2/2] arm/virt/acpi: remove _ADR from devices identified
 by _HID
Message-ID: <20200105072504-mutt-send-email-mst@kernel.org>
References: <20191219064759.35053-1-guoheyi@huawei.com>
 <20191219064759.35053-3-guoheyi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20191219064759.35053-3-guoheyi@huawei.com>
X-MC-Unique: 0pyR4CuWOae9roh14E0G_g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 Corey Minyard <cminyard@mvista.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 19, 2019 at 02:47:59PM +0800, Heyi Guo wrote:
> According to ACPI spec, _ADR should be used for device which is on a
> bus that has a standard enumeration algorithm. It does not make sense
> to have a _ADR object for devices which already have _HID and will be
> enumerated by OSPM.
>=20
> Signed-off-by: Heyi Guo <guoheyi@huawei.com>

Are you sure? I would think this depends on the ID and the device
really. E.g. PCI devices all are expected to have _ADR and some of them
have a _HID.

CC Corey who added a device with both HID and ADR to x86 recenly.

Apropos Corey, why was HID APP0005 chosen?

> ---
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c          |   8 --------
>  tests/data/acpi/virt/DSDT         | Bin 18449 -> 18426 bytes
>  tests/data/acpi/virt/DSDT.memhp   | Bin 19786 -> 19763 bytes
>  tests/data/acpi/virt/DSDT.numamem | Bin 18449 -> 18426 bytes
>  4 files changed, 8 deletions(-)
>=20
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9f4c7d1889..be752c0ad8 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -78,11 +78,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMa=
pEntry *uart_memmap,
>                               AML_EXCLUSIVE, &uart_irq, 1));
>      aml_append(dev, aml_name_decl("_CRS", crs));
> =20
> -    /* The _ADR entry is used to link this device to the UART described
> -     * in the SPCR table, i.e. SPCR.base_address.address =3D=3D _ADR.
> -     */
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(uart_memmap->base)));
> -
>      aml_append(scope, dev);
>  }
> =20
> @@ -170,7 +165,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
>      aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
>      aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
>      aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>      aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
>      aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")))=
;
>      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> @@ -334,7 +328,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemM=
apEntry *gpio_memmap,
>  {
>      Aml *dev =3D aml_device("GPO0");
>      aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> =20
>      Aml *crs =3D aml_resource_template();
> @@ -364,7 +357,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
>  {
>      Aml *dev =3D aml_device(ACPI_POWER_BUTTON_DEVICE);
>      aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
>      aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>      aml_append(scope, dev);
>  }
> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT


Please do not include binary changes in acpi patches.

See comment at the top of tests/bios-tables-test.c for documentation
on how to update these.

--=20
MST


