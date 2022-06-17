Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1FE54F7D2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:50:03 +0200 (CEST)
Received: from localhost ([::1]:50778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2BQI-0006qy-6N
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o2BLg-0002IK-Vm
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:45:18 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o2BLY-0000At-B8
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:45:11 -0400
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LPdzT1vL2z6GD4T;
 Fri, 17 Jun 2022 20:44:53 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 14:45:04 +0200
Received: from localhost (10.81.209.131) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.24; Fri, 17 Jun
 2022 13:45:03 +0100
Date: Fri, 17 Jun 2022 13:44:59 +0100
To: David Hildenbrand <david@redhat.com>
CC: <qemu-devel@nongnu.org>, Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Richard Henderson
 <richard.henderson@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v1] MAINTAINERS: Collect memory device files in "Memory
 devices"
Message-ID: <20220617134459.0000398e@Huawei.com>
In-Reply-To: <20220617123151.103033-1-david@redhat.com>
References: <20220617123151.103033-1-david@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.81.209.131]
X-ClientProxiedBy: lhreml709-chm.china.huawei.com (10.201.108.58) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

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
> Cc: "Philippe Mathieu-Daud=E9" <f4bug@amsat.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Julia Suvorova <jusual@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

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


