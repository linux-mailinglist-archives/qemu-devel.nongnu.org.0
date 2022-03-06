Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7434CEDF0
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 22:32:35 +0100 (CET)
Received: from localhost ([::1]:58314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQyUU-0005n9-VQ
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 16:32:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQyTJ-00056u-K4
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 16:31:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQyTF-0000Nj-GU
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 16:31:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646602275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mDyEdrxvzfoxrtEU8f4yxFIl4BzdNLxj8WE2v08QpZA=;
 b=TyvBp9/wCBuqSlj7HvEXYR8TDge+5wmu6gBudayEfPJP5FAwf+IE0/JX+/rtIespWQz6a5
 hvVgiWM6RtRVabljsp8Z+2hsEiK1rmLV5e9AH6mK+BVXU9+pVYATb7l4m/FBxanoAj5Io6
 ReU8Z8FNl45/uX5tU8yKFlN3D3ee884=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-BHzhnhNQNjCM77PdohqXFQ-1; Sun, 06 Mar 2022 16:31:14 -0500
X-MC-Unique: BHzhnhNQNjCM77PdohqXFQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 bq19-20020a056402215300b0040f276105a4so7380890edb.2
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 13:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mDyEdrxvzfoxrtEU8f4yxFIl4BzdNLxj8WE2v08QpZA=;
 b=mTpGLWj5w2TsA+wVzPRdxyb/Q1YR/6Wr62g02BOc56iksz3moJriiIpq6K1L9pFx6f
 f1DI0fyuy3J9I7z9dEBBcOe+ihLuToRc7g6C6hlRnRvvxze1B+eO3KjPMoKaycJETfaO
 IgKeh6NyI6s6jcDKkLe4EXwRP9QZ4MEx9XHmWJss0jUyau7RjPGTjJW6mvNXptc9QBxK
 YYN7cnvxJUf0Yr7YAKR24pBILztLVi+qc4+jmCraBxViQDx1Y+sSPdrCH0KGKLF5kIFz
 YN50N8u4gWO+kLvIwcJPGtpBNBx0/iGuxqhJKORjRj+y9IHeGVE8cP4rjZPoRkvxG8Et
 Cr5w==
X-Gm-Message-State: AOAM533DNfK+6tBJls/vkHv9X0ZSqVUMR/HodKnCXCMP6L+8JzB31/yv
 p17vTGChEltgRSzXMksC9+5i1rbmPvNIf/Qph/ZAKY5JzGohaoRIM9sHCtD3Q+rEWpqe3RdMNbw
 YthUH/0a8Flom3V0=
X-Received: by 2002:a17:907:7ba6:b0:6d7:1888:d553 with SMTP id
 ne38-20020a1709077ba600b006d71888d553mr7063524ejc.98.1646602271062; 
 Sun, 06 Mar 2022 13:31:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSIFCRcNaFgE8GkXwCEss7ARF+de6KG7ddR2I4QlTBhYxjkZaxNolzZ8LfVGQ/FimCRTdhUw==
X-Received: by 2002:a17:907:7ba6:b0:6d7:1888:d553 with SMTP id
 ne38-20020a1709077ba600b006d71888d553mr7063490ejc.98.1646602270676; 
 Sun, 06 Mar 2022 13:31:10 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 cy1-20020a0564021c8100b003e359e4f54asm5216694edb.43.2022.03.06.13.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 13:31:10 -0800 (PST)
Date: Sun, 6 Mar 2022 16:31:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v7 24/46] acpi/cxl: Add _OSC implementation (9.14.2)
Message-ID: <20220306162444-mutt-send-email-mst@kernel.org>
References: <20220306174137.5707-1-Jonathan.Cameron@huawei.com>
 <20220306174137.5707-25-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220306174137.5707-25-Jonathan.Cameron@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, qemu-devel@nongnu.org,
 Samarth Saxena <samarths@cadence.com>, Chris Browy <cbrowy@avery-design.com>,
 linuxarm@huawei.com, linux-cxl@vger.kernel.org,
 Markus Armbruster <armbru@redhat.com>,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 06, 2022 at 05:41:15PM +0000, Jonathan Cameron wrote:
> From: Ben Widawsky <ben.widawsky@intel.com>
> 
> CXL 2.0 specification adds 2 new dwords to the existing _OSC definition
> from PCIe. The new dwords are accessed with a new uuid. This
> implementation supports what is in the specification.
> 
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/acpi/Kconfig       |   5 ++
>  hw/acpi/cxl-stub.c    |  12 +++++
>  hw/acpi/cxl.c         | 104 ++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/meson.build   |   4 +-
>  hw/i386/acpi-build.c  |  15 ++++--
>  include/hw/acpi/cxl.h |  23 ++++++++++
>  6 files changed, 157 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index 19caebde6c..3703aca212 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -5,6 +5,7 @@ config ACPI_X86
>      bool
>      select ACPI
>      select ACPI_NVDIMM
> +    select ACPI_CXL
>      select ACPI_CPU_HOTPLUG
>      select ACPI_MEMORY_HOTPLUG
>      select ACPI_HMAT
> @@ -66,3 +67,7 @@ config ACPI_ERST
>      bool
>      default y
>      depends on ACPI && PCI
> +
> +config ACPI_CXL
> +    bool
> +    depends on ACPI
> diff --git a/hw/acpi/cxl-stub.c b/hw/acpi/cxl-stub.c
> new file mode 100644
> index 0000000000..15bc21076b
> --- /dev/null
> +++ b/hw/acpi/cxl-stub.c
> @@ -0,0 +1,12 @@
> +
> +/*
> + * Stubs for ACPI platforms that don't support CXl
> + */
> +#include "qemu/osdep.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/cxl.h"
> +
> +void build_cxl_osc_method(Aml *dev)
> +{
> +    g_assert_not_reached();
> +}
> diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
> new file mode 100644
> index 0000000000..7124d5a1a3
> --- /dev/null
> +++ b/hw/acpi/cxl.c
> @@ -0,0 +1,104 @@
> +/*
> + * CXL ACPI Implementation
> + *
> + * Copyright(C) 2020 Intel Corporation.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/cxl/cxl.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/aml-build.h"
> +#include "hw/acpi/bios-linker-loader.h"
> +#include "hw/acpi/cxl.h"
> +#include "qapi/error.h"
> +#include "qemu/uuid.h"
> +
> +static Aml *__build_cxl_osc_method(void)
> +{
> +    Aml *method, *if_uuid, *else_uuid, *if_arg1_not_1, *if_cxl, *if_caps_masked;
> +    Aml *a_ctrl = aml_local(0);
> +    Aml *a_cdw1 = aml_name("CDW1");
> +
> +    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> +    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> +
> +    /* 9.14.2.1.4 */

List spec name and version pls?

> +    if_uuid = aml_if(
> +        aml_lor(aml_equal(aml_arg(0),
> +                          aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")),
> +                aml_equal(aml_arg(0),
> +                          aml_touuid("68F2D50B-C469-4D8A-BD3D-941A103FD3FC"))));
> +    aml_append(if_uuid, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
> +    aml_append(if_uuid, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
> +
> +    aml_append(if_uuid, aml_store(aml_name("CDW3"), a_ctrl));
> +
> +    /* This is all the same as what's used for PCIe */

Referring to what exactly?
Better to also document the meaning.


> +    aml_append(if_uuid,
> +               aml_and(aml_name("CTRL"), aml_int(0x1F), aml_name("CTRL")));
> +
> +    if_arg1_not_1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
> +    /* Unknown revision */
> +    aml_append(if_arg1_not_1, aml_or(a_cdw1, aml_int(0x08), a_cdw1));
> +    aml_append(if_uuid, if_arg1_not_1);
> +
> +    if_caps_masked = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
> +    /* Capability bits were masked */
> +    aml_append(if_caps_masked, aml_or(a_cdw1, aml_int(0x10), a_cdw1));
> +    aml_append(if_uuid, if_caps_masked);
> +
> +    aml_append(if_uuid, aml_store(aml_name("CDW2"), aml_name("SUPP")));
> +    aml_append(if_uuid, aml_store(aml_name("CDW3"), aml_name("CTRL")));
> +
> +    if_cxl = aml_if(aml_equal(
> +        aml_arg(0), aml_touuid("68F2D50B-C469-4D8A-BD3D-941A103FD3FC")));
> +    /* CXL support field */
> +    aml_append(if_cxl, aml_create_dword_field(aml_arg(3), aml_int(12), "CDW4"));
> +    /* CXL capabilities */
> +    aml_append(if_cxl, aml_create_dword_field(aml_arg(3), aml_int(16), "CDW5"));
> +    aml_append(if_cxl, aml_store(aml_name("CDW4"), aml_name("SUPC")));
> +    aml_append(if_cxl, aml_store(aml_name("CDW5"), aml_name("CTRC")));
> +
> +    /* CXL 2.0 Port/Device Register access */
> +    aml_append(if_cxl,
> +               aml_or(aml_name("CDW5"), aml_int(0x1), aml_name("CDW5")));
> +    aml_append(if_uuid, if_cxl);
> +
> +    /* Update DWORD3 (the return value) */
> +    aml_append(if_uuid, aml_store(a_ctrl, aml_name("CDW3")));
> +
> +    aml_append(if_uuid, aml_return(aml_arg(3)));
> +    aml_append(method, if_uuid);
> +
> +    else_uuid = aml_else();
> +
> +    /* unrecognized uuid */
> +    aml_append(else_uuid,
> +               aml_or(aml_name("CDW1"), aml_int(0x4), aml_name("CDW1")));
> +    aml_append(else_uuid, aml_return(aml_arg(3)));
> +    aml_append(method, else_uuid);
> +
> +    return method;
> +}
> +
> +void build_cxl_osc_method(Aml *dev)
> +{
> +    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
> +    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
> +    aml_append(dev, aml_name_decl("SUPC", aml_int(0)));
> +    aml_append(dev, aml_name_decl("CTRC", aml_int(0)));
> +    aml_append(dev, __build_cxl_osc_method());
> +}
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index 8bea2e6933..cea2f5f93a 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -13,6 +13,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_MEMORY_HOTPLUG', if_false: files('acpi-mem-hotplu
>  acpi_ss.add(when: 'CONFIG_ACPI_NVDIMM', if_true: files('nvdimm.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_NVDIMM', if_false: files('acpi-nvdimm-stub.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_PCI', if_true: files('pci.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_CXL', if_true: files('cxl.c'), if_false: files('cxl-stub.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
> @@ -33,4 +34,5 @@ softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
>  softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
>                                                    'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c',
>                                                    'acpi-mem-hotplug-stub.c', 'acpi-cpu-hotplug-stub.c',
> -                                                  'acpi-pci-hotplug-stub.c', 'acpi-nvdimm-stub.c'))
> +                                                  'acpi-pci-hotplug-stub.c', 'acpi-nvdimm-stub.c',
> +                                                  'cxl-stub.c'))
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 0a28dd6d4e..b5a4b663f2 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -66,6 +66,7 @@
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/utils.h"
>  #include "hw/acpi/pci.h"
> +#include "hw/acpi/cxl.h"
>  
>  #include "qom/qom-qobject.h"
>  #include "hw/i386/amd_iommu.h"
> @@ -1574,11 +1575,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>              aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
>              aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
>              if (pci_bus_is_cxl(bus)) {
> -                aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> -                aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> -
> -                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
> -                aml_append(dev, build_q35_osc_method(true));
> +                struct Aml *pkg = aml_package(2);
> +
> +                aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0016")));
> +                aml_append(pkg, aml_eisaid("PNP0A08"));
> +                aml_append(pkg, aml_eisaid("PNP0A03"));
> +                aml_append(dev, aml_name_decl("_CID", pkg));
> +                aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> +                aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
> +                build_cxl_osc_method(dev);
>              } else if (pci_bus_is_express(bus)) {
>                  aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
>                  aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> diff --git a/include/hw/acpi/cxl.h b/include/hw/acpi/cxl.h
> new file mode 100644
> index 0000000000..7b8f3b8a2e
> --- /dev/null
> +++ b/include/hw/acpi/cxl.h
> @@ -0,0 +1,23 @@
> +/*
> + * Copyright (C) 2020 Intel Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> +
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> +
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_ACPI_CXL_H
> +#define HW_ACPI_CXL_H
> +
> +void build_cxl_osc_method(Aml *dev);
> +
> +#endif
> -- 
> 2.32.0


