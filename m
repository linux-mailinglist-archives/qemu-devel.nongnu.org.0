Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DF43B85B0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:02:18 +0200 (CEST)
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybjF-0006vA-7q
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lybi2-0006Cd-IV
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:01:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lybhz-0001CV-1A
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625065258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C4ou5YpvOnDtzNqrhWxofHlZH1cb0qY6aO2J5ijxF5U=;
 b=hM24zJBphfxapJbpr5/R2jSCJOtI0Ne8Vy9778Z3xl3aia7bVuYvpf80t0goxCPIommY6t
 z2xfRBvkxTMCMunq1cSVnRqiBGFMogFbzREfeXo7XMpNCT3Tlr2aO8uTRh4/DDxLyvEQvc
 +/OR4LshjLbQFVI8tC3H0Tel3BIQgOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-5U907vAQPl2FTHkHuO2M7w-1; Wed, 30 Jun 2021 11:00:54 -0400
X-MC-Unique: 5U907vAQPl2FTHkHuO2M7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 631301927807;
 Wed, 30 Jun 2021 15:00:53 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5998B5DD68;
 Wed, 30 Jun 2021 15:00:48 +0000 (UTC)
Date: Wed, 30 Jun 2021 17:00:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jingqi Liu <jingqi.liu@intel.com>
Subject: Re: [PATCH] nvdimm: add 'target-node' option
Message-ID: <20210630170047.2c6cc26b@redhat.com>
In-Reply-To: <20210625022518.29994-1-jingqi.liu@intel.com>
References: <20210625022518.29994-1-jingqi.liu@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pbonzini@redhat.com, xiaoguangrong.eric@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021 10:25:18 +0800
Jingqi Liu <jingqi.liu@intel.com> wrote:

> Linux kernel version 5.1 brings in support for the volatile-use of
> persistent memory as a hotplugged memory region (KMEM DAX).
> When this feature is enabled, persistent memory can be seen as a
> separate memory-only NUMA node(s). This newly-added memory can be
> selected by its unique NUMA node.
> 
> Add 'target-node' option for 'nvdimm' device to indicate this NUMA
> node. It can be extended to a new node after all existing NUMA nodes.

how dynamic it is?
can we force it to be 'static' node, would it break something?

> The 'node' option of 'pc-dimm' device is to add the DIMM to an
> existing NUMA node. The 'node' should be in the available NUMA nodes.
> For KMEM DAX mode, persistent memory can be in a new separate
> memory-only NUMA node. The new node is created dynamically.
> So users use 'target-node' to control whether persistent memory
> is added to an existing NUMA node or a new NUMA node.

I don't get reasoning behind creating new property instead of reusing
exiting 'node'.


Can you provide more context by pointing to relevant kernel series?
A pointer to a specification?

and SRAT handling looks a bit sketchy,
You are saying that it's dynamic and assigned by guest and then
are trying to put it in static SRAT along with predefined nodes.

> An example of configuration is as follows.
> 
> Using the following QEMU command:
>  -object memory-backend-file,id=nvmem1,share=on,mem-path=/dev/dax0.0,size=3G,align=2M
>  -device nvdimm,id=nvdimm1,memdev=mem1,label-size=128K,targe-node=2
> 
> To list DAX devices:
>  # daxctl list -u
>  {
>    "chardev":"dax0.0",
>    "size":"3.00 GiB (3.22 GB)",
>    "target_node":2,
>    "mode":"devdax"
>  }
> 
> To create a namespace in Device-DAX mode as a standard memory:
>  $ ndctl create-namespace --mode=devdax --map=mem
> To reconfigure DAX device from devdax mode to a system-ram mode:
>  $ daxctl reconfigure-device dax0.0 --mode=system-ram
> 
> There are two existing NUMA nodes in Guest. After these operations,
> persistent memory is configured as a separate Node 2 and
> can be used as a volatile memory. This NUMA node is dynamically
> created according to 'target-node'.
> 
> Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
> ---
>  docs/nvdimm.txt         | 93 +++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/nvdimm.c        | 18 ++++++--
>  hw/i386/acpi-build.c    | 12 +++++-
>  hw/mem/nvdimm.c         | 23 +++++++++-
>  include/hw/mem/nvdimm.h | 15 ++++++-
>  util/nvdimm-utils.c     | 22 ++++++++++
>  6 files changed, 175 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
> index 0aae682be3..083d954bb4 100644
> --- a/docs/nvdimm.txt
> +++ b/docs/nvdimm.txt
> @@ -107,6 +107,99 @@ Note:
>     may result guest data corruption (e.g. breakage of guest file
>     system).
>  
> +Target node
> +-----------
> +
> +Linux kernel version 5.1 brings in support for the volatile-use of
> +persistent memory as a hotplugged memory region (KMEM DAX).
> +When this feature is enabled, persistent memory can be seen as a
> +separate memory-only NUMA node(s). This newly-added memory can be
> +selected by its unique NUMA node.
> +Add 'target-node' option for nvdimm device to indicate this NUMA node.
> +It can be extended after all existing NUMA nodes.
> +
> +An example of configuration is presented below.
> +
> +Using the following QEMU command:
> + -object memory-backend-file,id=nvmem1,share=on,mem-path=/dev/dax0.0,size=3G,align=2M
> + -device nvdimm,id=nvdimm1,memdev=mem1,label-size=128K,targe-node=1
> +
> +The below operations are in Guest.
> +
> +To list available NUMA nodes using numactl:
> + # numactl -H
> + available: 1 nodes (0)
> + node 0 cpus: 0 1 2 3 4 5 6 7
> + node 0 size: 5933 MB
> + node 0 free: 5457 MB
> + node distances:
> + node   0
> +   0:  10
> +
> +To create a namespace in Device-DAX mode as a standard memory from
> +all the available capacity of NVDIMM:
> +
> + # ndctl create-namespace --mode=devdax --map=mem
> + {
> +   "dev":"namespace0.0",
> +   "mode":"devdax",
> +   "map":"mem",
> +   "size":"3.00 GiB (3.22 GB)",
> +   "uuid":"4e4d8293-dd3b-4e43-8ad9-7f3d2a8d1680",
> +   "daxregion":{
> +     "id":0,
> +     "size":"3.00 GiB (3.22 GB)",
> +     "align":2097152,
> +     "devices":[
> +       {
> +         "chardev":"dax0.0",
> +         "size":"3.00 GiB (3.22 GB)",
> +         "target_node":1,
> +         "mode":"devdax"
> +       }
> +     ]
> +   },
> +   "align":2097152
> + }
> +
> +To list DAX devices:
> + # daxctl list -u
> + {
> +   "chardev":"dax0.0",
> +   "size":"3.00 GiB (3.22 GB)",
> +   "target_node":1,
> +   "mode":"devdax"
> + }
> +
> +To reconfigure DAX device from devdax mode to a system-ram mode:
> + # daxctl reconfigure-device dax0.0 --mode=system-ram
> + [
> +   {
> +     "chardev":"dax0.0",
> +     "size":3217031168,
> +     "target_node":1,
> +     "mode":"system-ram",
> +     "movable":false
> +   }
> + ]
> +
> +After this operation, persistent memory is configured as a separate NUMA node
> +and can be used as a volatile memory.
> +The new NUMA node is Node 1:
> + # numactl -H
> + available: 2 nodes (0-1)
> + node 0 cpus: 0 1 2 3 4 5 6 7
> + node 0 size: 5933 MB
> + node 0 free: 5339 MB
> + node 1 cpus:
> + node 1 size: 2816 MB
> + node 1 free: 2815 MB
> + node distances:
> + node   0   1
> +   0:  10  20
> +   1:  20  10
> +
> +
>  Hotplug
>  -------
>  
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index e3d5fe1939..376ad6fd58 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -228,11 +228,13 @@ nvdimm_build_structure_spa(GArray *structures, DeviceState *dev)
>                                               NULL);
>      uint64_t size = object_property_get_uint(OBJECT(dev), PC_DIMM_SIZE_PROP,
>                                               NULL);
> -    uint32_t node = object_property_get_uint(OBJECT(dev), PC_DIMM_NODE_PROP,
node id is 32 bit per spec, don't loose it here


> +    int node = object_property_get_int(OBJECT(dev), NVDIMM_TARGET_NODE_PROP,
>                                               NULL);
>      int slot = object_property_get_int(OBJECT(dev), PC_DIMM_SLOT_PROP,
>                                         NULL);
> -
> +    if (node < 0) {
> +        node = object_property_get_uint(OBJECT(dev), PC_DIMM_NODE_PROP, NULL);
> +    }
see below about error handling

>      nfit_spa = acpi_data_push(structures, sizeof(*nfit_spa));
>  
>      nfit_spa->type = cpu_to_le16(0 /* System Physical Address Range
> @@ -1337,8 +1339,9 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
>      free_aml_allocator();
>  }
>  
> -void nvdimm_build_srat(GArray *table_data)
> +int nvdimm_build_srat(GArray *table_data)
>  {
> +    int max_target_node = nvdimm_check_target_nodes();
>      GSList *device_list = nvdimm_get_device_list();
>  
>      for (; device_list; device_list = device_list->next) {
> @@ -1348,7 +1351,12 @@ void nvdimm_build_srat(GArray *table_data)
>          uint64_t addr, size;
>          int node;
>  
> -        node = object_property_get_int(obj, PC_DIMM_NODE_PROP, &error_abort);
> +        node = object_property_get_int(obj, NVDIMM_TARGET_NODE_PROP,
> +                                       &error_abort);
> +        if (node < 0) {
> +            node = object_property_get_uint(obj, PC_DIMM_NODE_PROP,
> +                                            &error_abort);
> +        }
it should be checked at realize time, with proper error handling.
Also I'd make both properties mutually exclusive

>          addr = object_property_get_uint(obj, PC_DIMM_ADDR_PROP, &error_abort);
>          size = object_property_get_uint(obj, PC_DIMM_SIZE_PROP, &error_abort);
>  
> @@ -1357,6 +1365,8 @@ void nvdimm_build_srat(GArray *table_data)
>                            MEM_AFFINITY_ENABLED | MEM_AFFINITY_NON_VOLATILE);
>      }
>      g_slist_free(device_list);
> +
> +   return max_target_node;
>  }
>  
>  void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 796ffc6f5c..19bf91063f 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1879,6 +1879,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>      AcpiSratMemoryAffinity *numamem;
>  
>      int i;
> +    int max_node = 0;
>      int srat_start, numa_start, slots;
>      uint64_t mem_len, mem_base, next_base;
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
> @@ -1974,7 +1975,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>      }
>  
>      if (machine->nvdimms_state->is_enabled) {
> -        nvdimm_build_srat(table_data);
> +        max_node = nvdimm_build_srat(table_data);
>      }
>  
>      slots = (table_data->len - numa_start) / sizeof *numamem;
> @@ -1992,9 +1993,16 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>       * providing _PXM method if necessary.
>       */
>      if (hotplugabble_address_space_size) {
> +        if (max_node < 0) {
> +            max_node = pcms->numa_nodes - 1;
> +        } else {
> +            max_node = max_node > pcms->numa_nodes - 1 ?
> +                       max_node : pcms->numa_nodes - 1;
> +        }
>
>          numamem = acpi_data_push(table_data, sizeof *numamem);
>          build_srat_memory(numamem, machine->device_memory->base,
> -                          hotplugabble_address_space_size, pcms->numa_nodes - 1,
> +                          hotplugabble_address_space_size, max_node,
>                            MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
>      }
>  
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index 7397b67156..a9c27f7ad0 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -27,11 +27,15 @@
>  #include "qemu/pmem.h"
>  #include "qapi/error.h"
>  #include "qapi/visitor.h"
> +#include "hw/boards.h"
>  #include "hw/mem/nvdimm.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/mem/memory-device.h"
>  #include "sysemu/hostmem.h"
>  
> +unsigned long nvdimm_target_nodes[BITS_TO_LONGS(MAX_NODES)];
> +int nvdimm_max_target_node;
> +
>  static void nvdimm_get_label_size(Object *obj, Visitor *v, const char *name,
>                                    void *opaque, Error **errp)
>  {
> @@ -96,7 +100,6 @@ static void nvdimm_set_uuid(Object *obj, Visitor *v, const char *name,
>      g_free(value);
>  }
>  
> -
>  static void nvdimm_init(Object *obj)
>  {
>      object_property_add(obj, NVDIMM_LABEL_SIZE_PROP, "int",
> @@ -181,6 +184,23 @@ static MemoryRegion *nvdimm_md_get_memory_region(MemoryDeviceState *md,
>  static void nvdimm_realize(PCDIMMDevice *dimm, Error **errp)
>  {
>      NVDIMMDevice *nvdimm = NVDIMM(dimm);

> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    int nb_numa_nodes = ms->numa_state->num_nodes;
> +
> +    if (nvdimm->target_node >= MAX_NODES) {
> +        error_setg(errp, "'NVDIMM property " NVDIMM_TARGET_NODE_PROP
> +                   " has value %" PRIu32
> +                   "' which exceeds the max number of numa nodes: %d",
> +                   nvdimm->target_node, MAX_NODES);
> +        return;
> +    }
> +
> +    if (nvdimm->target_node >= nb_numa_nodes) {
> +        set_bit(nvdimm->target_node, nvdimm_target_nodes);
> +        if (nvdimm->target_node > nvdimm_max_target_node) {
> +            nvdimm_max_target_node = nvdimm->target_node;
> +        }
> +    }


device shouldn't poke into Machine,
use _pre_plug callback for that

>  
>      if (!nvdimm->nvdimm_mr) {
>          nvdimm_prepare_memory_region(nvdimm, errp);
> @@ -229,6 +249,7 @@ static void nvdimm_write_label_data(NVDIMMDevice *nvdimm, const void *buf,
>  
>  static Property nvdimm_properties[] = {
>      DEFINE_PROP_BOOL(NVDIMM_UNARMED_PROP, NVDIMMDevice, unarmed, false),
> +    DEFINE_PROP_INT32(NVDIMM_TARGET_NODE_PROP, NVDIMMDevice, target_node, -1),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index bcf62f825c..96b609a60e 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -51,6 +51,7 @@ OBJECT_DECLARE_TYPE(NVDIMMDevice, NVDIMMClass, NVDIMM)
>  #define NVDIMM_LABEL_SIZE_PROP "label-size"
>  #define NVDIMM_UUID_PROP       "uuid"
>  #define NVDIMM_UNARMED_PROP    "unarmed"
> +#define NVDIMM_TARGET_NODE_PROP "target-node"
>  
>  struct NVDIMMDevice {
>      /* private */
> @@ -89,6 +90,14 @@ struct NVDIMMDevice {
>       * The PPC64 - spapr requires each nvdimm device have a uuid.
>       */
>      QemuUUID uuid;
> +
> +    /*
> +     * Support for the volatile-use of persistent memory as normal RAM.
> +     * This newly-added memory can be selected by its unique NUMA node.
> +     * This node can be extended to a new node after all existing NUMA
> +     * nodes.
> +     */
> +    int target_node;
>  };
>  
>  struct NVDIMMClass {
> @@ -148,14 +157,18 @@ struct NVDIMMState {
>  };
>  typedef struct NVDIMMState NVDIMMState;
>  
> +extern unsigned long nvdimm_target_nodes[];
> +extern int nvdimm_max_target_node;
> +
>  void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
>                              struct AcpiGenericAddress dsm_io,
>                              FWCfgState *fw_cfg, Object *owner);
> -void nvdimm_build_srat(GArray *table_data);
> +int nvdimm_build_srat(GArray *table_data);
>  void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
>                         BIOSLinker *linker, NVDIMMState *state,
>                         uint32_t ram_slots, const char *oem_id,
>                         const char *oem_table_id);
>  void nvdimm_plug(NVDIMMState *state);
>  void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev);
> +int nvdimm_check_target_nodes(void);
>  #endif
> diff --git a/util/nvdimm-utils.c b/util/nvdimm-utils.c
> index aa3d199f2d..767f1e4787 100644
> --- a/util/nvdimm-utils.c
> +++ b/util/nvdimm-utils.c
> @@ -1,5 +1,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/nvdimm-utils.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
>  #include "hw/mem/nvdimm.h"
>  
>  static int nvdimm_device_list(Object *obj, void *opaque)
> @@ -28,3 +30,23 @@ GSList *nvdimm_get_device_list(void)
>      object_child_foreach(qdev_get_machine(), nvdimm_device_list, &list);
>      return list;
>  }
> +
> +int nvdimm_check_target_nodes(void)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    int nb_numa_nodes = ms->numa_state->num_nodes;
> +    int node;
> +
> +    if (!nvdimm_max_target_node) {
> +        return -1;
> +    }
> +
> +    for (node = nb_numa_nodes; node <= nvdimm_max_target_node; node++) {
> +        if (!test_bit(node, nvdimm_target_nodes)) {
> +            error_report("nvdimm target-node: Node ID missing: %d", node);
> +            exit(1);
> +        }
> +    }
> +
> +    return nvdimm_max_target_node;
> +}


