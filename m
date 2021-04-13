Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBAD35DAA1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 11:05:11 +0200 (CEST)
Received: from localhost ([::1]:46706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEys-0002v3-7x
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 05:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lWExV-00020H-PC
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:03:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lWExT-00067L-Q8
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618304622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLNBIKv5Snzxs072CYzeze8s4yH1MxaDBJBIbv0ZO3M=;
 b=C/K/pXLUkW+RtICU13SS4XEvOnAO9ByzK+h/C/NVgmrg8CeMPsuR050jqcDKOQq2OQEAMq
 FZLgBVNDC9+mv3DmHaKz2Whf5L6ejwkK+AxIUIq2TL60L/U2vIr83bUYFv7Y54iIUAWHMC
 Nc2Dn8ZeWRv/nyGkWnK54FyRYRz1sH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-mIBp_5t9PLmnMgR9TxoAcA-1; Tue, 13 Apr 2021 05:03:35 -0400
X-MC-Unique: mIBp_5t9PLmnMgR9TxoAcA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB99D107ACCA;
 Tue, 13 Apr 2021 09:03:33 +0000 (UTC)
Received: from [10.36.113.20] (ovpn-113-20.ams2.redhat.com [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E2DE1001B2C;
 Tue, 13 Apr 2021 09:03:17 +0000 (UTC)
Subject: Re: [PATCH RFC RESEND v2 4/6] hw/arm/virt-acpi-build: Add explicit
 idmap info in IORT table
To: Wang Xingang <wangxingang5@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, peter.maydell@linaro.org,
 ehabkost@redhat.com, richard.henderson@linaro.org, pbonzini@redhat.com
References: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
 <1616656965-23328-5-git-send-email-wangxingang5@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ee78ca19-d73d-7c99-38b5-4140e2a9e1b7@redhat.com>
Date: Tue, 13 Apr 2021 11:03:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1616656965-23328-5-git-send-email-wangxingang5@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Xingang,

On 3/25/21 8:22 AM, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
> 
> The idmap of smmuv3 and root complex covers the whole RID space for now,
> this patch add explicit idmap info according to root bus number range.
> This add smmuv3 idmap for certain bus which has enabled the iommu property.
> 
> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 103 ++++++++++++++++++++++++++++++---------
>  1 file changed, 81 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index f5a2b2d4cb..5491036c86 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -44,6 +44,7 @@
>  #include "hw/acpi/tpm.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bus.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/arm/virt.h"
>  #include "hw/mem/nvdimm.h"
> @@ -237,6 +238,41 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>      aml_append(scope, dev);
>  }
>  
> +typedef
> +struct AcpiIortMapping {
> +    AcpiIortIdMapping idmap;
> +    bool iommu;
> +} AcpiIortMapping;
> +
> +/* For all PCI host bridges, walk and insert DMAR scope */
this comment should rather be in the caller
also DMAR is not the ARM vocable.

I would add the comment for this function:
build the ID mapping for aa given PCI host bridge
> +static int
> +iort_host_bridges(Object *obj, void *opaque)
> +{
> +    GArray *map_blob = opaque;
> +    AcpiIortMapping map;
> +    AcpiIortIdMapping *idmap = &map.idmap;
> +    int bus_num, max_bus;
> +
> +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> +        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> +
> +        if (bus) {
> +            bus_num = pci_bus_num(bus);
> +            max_bus = pci_root_bus_max_bus(bus);
> +
> +            idmap->input_base = cpu_to_le32(bus_num << 8);
> +            idmap->id_count = cpu_to_le32((max_bus - bus_num + 1) << 8);
> +            idmap->output_base = cpu_to_le32(bus_num << 8);
> +            idmap->flags = cpu_to_le32(0);
> +
> +            map.iommu = pci_root_bus_has_iommu(bus);
if iommu is not set, we don't need to populate the idmap and we may even
directly continue, ie. not add the element the map_bap_blob, no?
> +            g_array_append_val(map_blob, map);
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> @@ -247,6 +283,21 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      AcpiIortSmmu3 *smmu;
>      size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
>      AcpiIortRC *rc;
> +    int smmu_mapping_count;
> +    GArray *map_blob = g_array_new(false, true, sizeof(AcpiIortMapping));
> +    AcpiIortMapping *map;
> +
> +    /* pci_for_each_bus(vms->bus, insert_map, map_blob); */
comment to be removed
> +    object_child_foreach_recursive(object_get_root(),
> +                                   iort_host_bridges, map_blob);
> +
> +    smmu_mapping_count = 0;
> +    for (int i = 0; i < map_blob->len; i++) {
> +        map = &g_array_index(map_blob, AcpiIortMapping, i);
> +        if (map->iommu) {
> +            smmu_mapping_count++;
> +        }
> +    }
>  
>      iort = acpi_data_push(table_data, sizeof(*iort));
>  
> @@ -280,13 +331,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>          /* SMMUv3 node */
>          smmu_offset = iort_node_offset + node_size;
> -        node_size = sizeof(*smmu) + sizeof(*idmap);
> +        node_size = sizeof(*smmu) + sizeof(*idmap) * smmu_mapping_count;
>          iort_length += node_size;
>          smmu = acpi_data_push(table_data, node_size);
>  
>          smmu->type = ACPI_IORT_NODE_SMMU_V3;
>          smmu->length = cpu_to_le16(node_size);
> -        smmu->mapping_count = cpu_to_le32(1);
> +        smmu->mapping_count = cpu_to_le32(smmu_mapping_count);
>          smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
>          smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
>          smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
> @@ -295,23 +346,28 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          smmu->gerr_gsiv = cpu_to_le32(irq + 2);
>          smmu->sync_gsiv = cpu_to_le32(irq + 3);
>  
> -        /* Identity RID mapping covering the whole input RID range */
> -        idmap = &smmu->id_mapping_array[0];
> -        idmap->input_base = 0;
> -        idmap->id_count = cpu_to_le32(0xFFFF);
> -        idmap->output_base = 0;
> -        /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort_node_offset);
> +        for (int i = 0, j = 0; i < map_blob->len; i++) {
> +            map = &g_array_index(map_blob, AcpiIortMapping, i);
> +
> +            if (!map->iommu) {
> +                continue;
> +            }
> +
> +            idmap = &smmu->id_mapping_array[j++];
> +            *idmap = map->idmap;
> +            /* output IORT node is the ITS group node (the first node) */
> +            idmap->output_reference = cpu_to_le32(iort_node_offset);
> +        }
>      }
>  
>      /* Root Complex Node */
> -    node_size = sizeof(*rc) + sizeof(*idmap);
> +    node_size = sizeof(*rc) + sizeof(*idmap) * map_blob->len;
>      iort_length += node_size;
>      rc = acpi_data_push(table_data, node_size);
>  
>      rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
>      rc->length = cpu_to_le16(node_size);
> -    rc->mapping_count = cpu_to_le32(1);
> +    rc->mapping_count = cpu_to_le32(map_blob->len);
>      rc->mapping_offset = cpu_to_le32(sizeof(*rc));
>  
>      /* fully coherent device */
> @@ -319,20 +375,23 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
>      rc->pci_segment_number = 0; /* MCFG pci_segment */
>  
> -    /* Identity RID mapping covering the whole input RID range */
> -    idmap = &rc->id_mapping_array[0];
> -    idmap->input_base = 0;
> -    idmap->id_count = cpu_to_le32(0xFFFF);
> -    idmap->output_base = 0;
> +    for (int i = 0; i < map_blob->len; i++) {
> +        map = &g_array_index(map_blob, AcpiIortMapping, i);
> +        idmap = &rc->id_mapping_array[i];
>  
> -    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> -        /* output IORT node is the smmuv3 node */
> -        idmap->output_reference = cpu_to_le32(smmu_offset);
> -    } else {
> -        /* output IORT node is the ITS group node (the first node) */
> -        idmap->output_reference = cpu_to_le32(iort_node_offset);
> +        *idmap = map->idmap;
We we descibe the link between SMMU SID and ITS deviceids, shouldn't we
leave the whole range? Even if an RID is not translated, it may use MSIs?
> +
> +        if (vms->iommu == VIRT_IOMMU_SMMUV3 && map->iommu) {
> +            /* output IORT node is the smmuv3 node */
> +            idmap->output_reference = cpu_to_le32(smmu_offset);
> +        } else {
> +            /* output IORT node is the ITS group node (the first node) */
> +            idmap->output_reference = cpu_to_le32(iort_node_offset);
is that case we have a direct mapping between RC and ITS (no
instantiated SMMU). Shouldn't the whole RID range being used in that case?

Thanks

Eric
> +        }
>      }
>  
> +    g_array_free(map_blob, true);
> +
>      /*
>       * Update the pointer address in case table_data->data moves during above
>       * acpi_data_push operations.
> 


