Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414C454F7C7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:46:08 +0200 (CEST)
Received: from localhost ([::1]:43464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2BMU-0001Ui-Ty
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o2BIi-0007wO-RI
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:42:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o2BIg-0005vV-73
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655469729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrdOsHSaFbLfNW07OM5GQn8+XgU+1N5zl2F9crQG84k=;
 b=DTUcrc0HZ6le576SyW/4BP/XwQrkj/p4lx2YsFozwdTLNaNmOVWPkctOB4MgMDjA0YK0k/
 y6GQkUqw1W4oZA64IZjVGQuaxSAjqtCpCHTWpA3ci6Ob6yZQU5aXFbtyssed2ekDaHVYY0
 RGPK5r1AK5j65kYvs9Y5Z5JJZMdR/JA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-A0yJNpWqN3CQf6wOIMorEg-1; Fri, 17 Jun 2022 08:42:06 -0400
X-MC-Unique: A0yJNpWqN3CQf6wOIMorEg-1
Received: by mail-wm1-f72.google.com with SMTP id
 h205-20020a1c21d6000000b0039c96ec500fso2654898wmh.8
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 05:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FrdOsHSaFbLfNW07OM5GQn8+XgU+1N5zl2F9crQG84k=;
 b=xxpTDdH/tlkBlMEelT6qmIoSoMa98UE8xPdzP8q0jCY9gzGoMVv1KKD+FVq0SNbEtP
 m8+HbU2LC41w7EmgSvNHg0kkXVLKx7coQRu3aAoQ1IfopBA5aT+icLHq3aKtgKfhV1HJ
 yecBa/28TKY1D5hjudytP+8B2kYHKuWXISuwpLnBeKM6ZHW0rOFCubyiTnMeO4zcddCq
 zINeN7IKENMNyFxUv5biWBgQkxi9Tq0UFfAeYmvV6+lb9NIBa69lOr7dmu9GNEAwQdC1
 5EPvN/X7TLvTjm84bN3AUxY8f/sFoo76HtJs4JfgvWt3K6hUEfGM2IEhjbpNwVq9uLO6
 7u/w==
X-Gm-Message-State: AJIora8ODNtj32B+Sv/hackjhvNXnNrt1AAPhm3xp1NIfiabJ5XN4cDX
 YoorCrKhcOA7k1/GQD3kxwP94JvAhFgH7ABTnHCiwLuSAfQe+tlurquUZw6FdpEp7rYT/Nhikeo
 SKOkG5xJwHjRGNbo=
X-Received: by 2002:adf:e902:0:b0:213:a337:92ae with SMTP id
 f2-20020adfe902000000b00213a33792aemr9370914wrm.84.1655469725180; 
 Fri, 17 Jun 2022 05:42:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1toHWTY/lCpcerHyBzleLwvcUaUGm8ONZwKRfW/cKxikEtliN2WJ5Z4HT9W9dcXIPTYe9tU6A==
X-Received: by 2002:adf:e902:0:b0:213:a337:92ae with SMTP id
 f2-20020adfe902000000b00213a33792aemr9370884wrm.84.1655469724966; 
 Fri, 17 Jun 2022 05:42:04 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a1c4c07000000b0039c4b518df4sm6775375wmf.5.2022.06.17.05.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 05:42:04 -0700 (PDT)
Date: Fri, 17 Jun 2022 14:42:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Ben Widawsky <ben.widawsky@intel.com>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, Xiao Guangrong
 <xiaoguangrong.eric@gmail.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Richard Henderson <richard.henderson@linaro.org>, Peter
 Maydell <peter.maydell@linaro.org>, Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v1] MAINTAINERS: Collect memory device files in "Memory
 devices"
Message-ID: <20220617144203.2cbdcea8@redhat.com>
In-Reply-To: <20220617123151.103033-1-david@redhat.com>
References: <20220617123151.103033-1-david@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Jun 2022 14:31:51 +0200
David Hildenbrand <david@redhat.com> wrote:

> Xiao Guangrong doesn't have enough time to actively review or contribute
> to our NVDIMM implementation. Let's dissolve the "NVDIMM" section, moving
> relevant ACPI parts to "ACPI/SMBIOS" and moving memory device stuff into a
> new "Memory devices" section. Make that new section cover other memory
> device stuff as well.
>=20
> We can now drop the "hw/mem/*" rule from "ACPI/SMBIOS". Note that
> hw/acpi/nvdimm.c is already covered by "ACPI/SMBIOS".
>=20
> The following files in hw/mem don't fall into the TYPE_MEMPORY_DEVICE
> category:
> * hw/mem/cxl_type3.c is CXL specific and belongs to "Compute Express Link"
> * hw/mem/sparse-mem.c is already covered by "Device Fuzzing"
> * hw/mem/npcm7xx_mc.c is already covered by "Nuvoton NPCM7xx"
>=20
> Thanks Xiao for your work on NVDIMM!
>=20
> Cc: Ben Widawsky <ben.widawsky@intel.com>
> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
> Cc: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Julia Suvorova <jusual@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>


Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  MAINTAINERS | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aaa649a50d..909e8dbb1b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1840,7 +1840,6 @@ R: Ani Sinha <ani@anisinha.ca>
>  S: Supported
>  F: include/hw/acpi/*
>  F: include/hw/firmware/smbios.h
> -F: hw/mem/*
>  F: hw/acpi/*
>  F: hw/smbios/*
>  F: hw/i386/acpi-build.[hc]
> @@ -1851,6 +1850,7 @@ F: tests/qtest/acpi-utils.[hc]
>  F: tests/data/acpi/
>  F: docs/specs/acpi_cpu_hotplug.rst
>  F: docs/specs/acpi_mem_hotplug.rst
> +F: docs/specs/acpi_nvdimm.rst
>  F: docs/specs/acpi_pci_hotplug.rst
>  F: docs/specs/acpi_hw_reduced_hotplug.rst
> =20
> @@ -2158,15 +2158,6 @@ F: qapi/rocker.json
>  F: tests/rocker/
>  F: docs/specs/rocker.txt
> =20
> -NVDIMM
> -M: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
> -S: Maintained
> -F: hw/acpi/nvdimm.c
> -F: hw/mem/nvdimm.c
> -F: include/hw/mem/nvdimm.h
> -F: docs/nvdimm.txt
> -F: docs/specs/acpi_nvdimm.rst
> -
>  e1000x
>  M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
>  S: Maintained
> @@ -2588,6 +2579,7 @@ M: Ben Widawsky <ben.widawsky@intel.com>
>  M: Jonathan Cameron <jonathan.cameron@huawei.com>
>  S: Supported
>  F: hw/cxl/
> +F: hw/mem/cxl_type3.c
>  F: include/hw/cxl/
> =20
>  Dirty Bitmaps
> @@ -2704,6 +2696,19 @@ F: softmmu/physmem.c
>  F: include/exec/memory-internal.h
>  F: scripts/coccinelle/memory-region-housekeeping.cocci
> =20
> +Memory devices
> +M: David Hildenbrand <david@redhat.com>
> +M: Igor Mammedov <imammedo@redhat.com>
> +R: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
> +S: Supported
> +F: hw/mem/memory-device.c
> +F: hw/mem/nvdimm.c
> +F: hw/mem/pc-dimm.c
> +F: include/hw/mem/memory-device.h
> +F: include/hw/mem/nvdimm.h
> +F: include/hw/mem/pc-dimm.h
> +F: docs/nvdimm.txt
> +
>  SPICE
>  M: Gerd Hoffmann <kraxel@redhat.com>
>  S: Odd Fixes


