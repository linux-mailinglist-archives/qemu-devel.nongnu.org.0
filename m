Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC76F4D7C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 14:46:13 +0100 (CET)
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iT4aa-0005ZR-He
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 08:46:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58588)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iT4Yp-0004Op-07
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 08:44:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iT4Ym-0003AJ-3M
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 08:44:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41116
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iT4Yl-00037s-LE
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 08:44:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573220658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5I6oLyHlXmNY/V+QTAg0wcNtjTNEMDAPulxYqXaqJA4=;
 b=I0B14KM74RWcdyordKnYR+XVkW0M/MXqaAKsHMbbqfCQtqM+StksC0/4txjr1pHufH1pTp
 ArtIiAojegLFT9naF15HN2XBAbnLiUwiOPmy/YfEB9QW4pyssP413010AnHxVZjrAARK91
 SHnOMRQqkLE8Lkuh+LNzOsxIBhIPDt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-RYndkY18MvS1B16Cw8pNQA-1; Fri, 08 Nov 2019 08:44:15 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D83A11800D7B;
 Fri,  8 Nov 2019 13:44:13 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC0255D6AE;
 Fri,  8 Nov 2019 13:44:08 +0000 (UTC)
Date: Fri, 8 Nov 2019 14:44:07 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Subject: Re: [PATCH v15 09/12] hmat acpi: Build Memory Proximity Domain
 Attributes Structure(s)
Message-ID: <20191108144407.204130ba@redhat.com>
In-Reply-To: <20191107074511.14304-10-tao3.xu@intel.com>
References: <20191107074511.14304-1-tao3.xu@intel.com>
 <20191107074511.14304-10-tao3.xu@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: RYndkY18MvS1B16Cw8pNQA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
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
Cc: lvivier@redhat.com, thuth@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, jingqi.liu@intel.com, fan.du@intel.com,
 mdroth@linux.vnet.ibm.com, Daniel Black <daniel@linux.ibm.com>,
 armbru@redhat.com, jonathan.cameron@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  7 Nov 2019 15:45:08 +0800
Tao Xu <tao3.xu@intel.com> wrote:

> From: Liu Jingqi <jingqi.liu@intel.com>
>=20
> HMAT is defined in ACPI 6.3: 5.2.27 Heterogeneous Memory Attribute Table
> (HMAT). The specification references below link:
> http://www.uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pd=
f
>=20
> It describes the memory attributes, such as memory side cache
> attributes and bandwidth and latency details, related to the
> Memory Proximity Domain. The software is
> expected to use this information as hint for optimization.
>=20
> This structure describes Memory Proximity Domain Attributes by memory
> subsystem and its associativity with processor proximity domain as well a=
s
> hint for memory usage.
>=20
> In the linux kernel, the codes in drivers/acpi/hmat/hmat.c parse and repo=
rt
> the platform's HMAT tables.
>=20
> Reviewed-by: Daniel Black <daniel@linux.ibm.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> ---

with nit below fixed
  Reviewed-by: Igor Mammedov <imammedo@redhat.com>

>=20
> No changes in v15.
>=20
> Changes in v13:
>     - Remove the unnecessary head file.
> ---
>  hw/acpi/Kconfig       |  7 ++-
>  hw/acpi/Makefile.objs |  1 +
>  hw/acpi/hmat.c        | 99 +++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/hmat.h        | 42 ++++++++++++++++++
>  hw/i386/acpi-build.c  |  5 +++
>  5 files changed, 152 insertions(+), 2 deletions(-)
>  create mode 100644 hw/acpi/hmat.c
>  create mode 100644 hw/acpi/hmat.h
>=20
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index 12e3f1e86e..54209c6f2f 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -7,6 +7,7 @@ config ACPI_X86
>      select ACPI_NVDIMM
>      select ACPI_CPU_HOTPLUG
>      select ACPI_MEMORY_HOTPLUG
> +    select ACPI_HMAT
> =20
>  config ACPI_X86_ICH
>      bool
> @@ -23,6 +24,10 @@ config ACPI_NVDIMM
>      bool
>      depends on ACPI
> =20
> +config ACPI_HMAT
> +    bool
> +    depends on ACPI
> +
>  config ACPI_PCI
>      bool
>      depends on ACPI && PCI
> @@ -33,5 +38,3 @@ config ACPI_VMGENID
>      depends on PC
> =20
>  config ACPI_HW_REDUCED
> -    bool
> -    depends on ACPI
> diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
> index 655a9c1973..517bd88704 100644
> --- a/hw/acpi/Makefile.objs
> +++ b/hw/acpi/Makefile.objs
> @@ -7,6 +7,7 @@ common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) +=3D cpu.o
>  common-obj-$(CONFIG_ACPI_NVDIMM) +=3D nvdimm.o
>  common-obj-$(CONFIG_ACPI_VMGENID) +=3D vmgenid.o
>  common-obj-$(CONFIG_ACPI_HW_REDUCED) +=3D generic_event_device.o
> +common-obj-$(CONFIG_ACPI_HMAT) +=3D hmat.o
>  common-obj-$(call lnot,$(CONFIG_ACPI_X86)) +=3D acpi-stub.o
> =20
>  common-obj-y +=3D acpi_interface.o
> diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
> new file mode 100644
> index 0000000000..c595098ba7
> --- /dev/null
> +++ b/hw/acpi/hmat.c
> @@ -0,0 +1,99 @@
> +/*
> + * HMAT ACPI Implementation
> + *
> + * Copyright(C) 2019 Intel Corporation.
> + *
> + * Author:
> + *  Liu jingqi <jingqi.liu@linux.intel.com>
> + *  Tao Xu <tao3.xu@intel.com>
> + *
> + * HMAT is defined in ACPI 6.3: 5.2.27 Heterogeneous Memory Attribute Ta=
ble
> + * (HMAT)
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
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "sysemu/numa.h"
> +#include "hw/acpi/hmat.h"
> +
> +/*
> + * ACPI 6.3:
> + * 5.2.27.3 Memory Proximity Domain Attributes Structure: Table 5-145
> + */
> +static void build_hmat_mpda(GArray *table_data, uint16_t flags,

> +                            uint16_t initiator, uint16_t mem_node)
why do you use 16 bit for fields that spec defines as 4byte ones?

It's ACPI api so it, I suggest to stay close to spec when building
ACPI primitives (i.e. use uint32_t here).

> +{
> +
> +    /* Memory Proximity Domain Attributes Structure */
> +    /* Type */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* Length */
> +    build_append_int_noprefix(table_data, 40, 4);
> +    /* Flags */
> +    build_append_int_noprefix(table_data, flags, 2);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 2);
> +    /* Proximity Domain for the Attached Initiator */
> +    build_append_int_noprefix(table_data, initiator, 4);
> +    /* Proximity Domain for the Memory */
> +    build_append_int_noprefix(table_data, mem_node, 4);
> +    /* Reserved */
> +    build_append_int_noprefix(table_data, 0, 4);
> +    /*
> +     * Reserved:
> +     * Previously defined as the Start Address of the System Physical
> +     * Address Range. Deprecated since ACPI Spec 6.3.
> +     */
> +    build_append_int_noprefix(table_data, 0, 8);
> +    /*
> +     * Reserved:
> +     * Previously defined as the Range Length of the region in bytes.
> +     * Deprecated since ACPI Spec 6.3.
> +     */
> +    build_append_int_noprefix(table_data, 0, 8);
> +}
> +
> +/* Build HMAT sub table structures */
> +static void hmat_build_table_structs(GArray *table_data, NumaState *numa=
_state)
> +{
> +    uint16_t flags;
> +    int i;
> +
> +    for (i =3D 0; i < numa_state->num_nodes; i++) {
> +        flags =3D 0;
> +
> +        if (numa_state->nodes[i].initiator < MAX_NODES) {
> +            flags |=3D HMAT_PROXIMITY_INITIATOR_VALID;
> +        }
> +
> +        build_hmat_mpda(table_data, flags, numa_state->nodes[i].initiato=
r, i);
> +    }
> +}
> +
> +void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_=
state)
> +{
> +    int hmat_start =3D table_data->len;
> +
> +    /* reserve space for HMAT header  */
> +    acpi_data_push(table_data, 40);
> +
> +    hmat_build_table_structs(table_data, numa_state);
> +
> +    build_header(linker, table_data,
> +                 (void *)(table_data->data + hmat_start),
> +                 "HMAT", table_data->len - hmat_start, 2, NULL, NULL);
> +}
> diff --git a/hw/acpi/hmat.h b/hw/acpi/hmat.h
> new file mode 100644
> index 0000000000..437dbc6872
> --- /dev/null
> +++ b/hw/acpi/hmat.h
> @@ -0,0 +1,42 @@
> +/*
> + * HMAT ACPI Implementation Header
> + *
> + * Copyright(C) 2019 Intel Corporation.
> + *
> + * Author:
> + *  Liu jingqi <jingqi.liu@linux.intel.com>
> + *  Tao Xu <tao3.xu@intel.com>
> + *
> + * HMAT is defined in ACPI 6.3: 5.2.27 Heterogeneous Memory Attribute Ta=
ble
> + * (HMAT)
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
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>
> + */
> +
> +#ifndef HMAT_H
> +#define HMAT_H
> +
> +#include "hw/acpi/aml-build.h"
> +
> +/*
> + * ACPI 6.3: 5.2.27.3 Memory Proximity Domain Attributes Structure,
> + * Table 5-145, Field "flag", Bit [0]: set to 1 to indicate that data in
> + * the Proximity Domain for the Attached Initiator field is valid.
> + * Other bits reserved.
> + */
> +#define HMAT_PROXIMITY_INITIATOR_VALID  0x1
> +
> +void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_=
state);
> +
> +#endif
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 266d9b534b..aec8b71569 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -67,6 +67,7 @@
>  #include "hw/i386/intel_iommu.h"
> =20
>  #include "hw/acpi/ipmi.h"
> +#include "hw/acpi/hmat.h"
> =20
>  /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
>   * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
> @@ -2721,6 +2722,10 @@ void acpi_build(AcpiBuildTables *tables, MachineSt=
ate *machine)
>              acpi_add_table(table_offsets, tables_blob);
>              build_slit(tables_blob, tables->linker, machine);
>          }
> +        if (machine->numa_state->hmat_enabled) {
> +            acpi_add_table(table_offsets, tables_blob);
> +            build_hmat(tables_blob, tables->linker, machine->numa_state)=
;
> +        }
>      }
>      if (acpi_get_mcfg(&mcfg)) {
>          acpi_add_table(table_offsets, tables_blob);


