Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C5A11E10B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 10:41:51 +0100 (CET)
Received: from localhost ([::1]:43910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifhSI-0006Uq-4m
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 04:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ifhQr-0005Ot-FV
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 04:40:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ifhQo-0000kk-OQ
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 04:40:21 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41624
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ifhQo-0000jb-IT
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 04:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576230018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1H2RDERroiyvHAB0Ikvq8GeIjCfthgNJrFZHaXprsQI=;
 b=GtQW9J8oj5B5q1x2XCbANilt4iAeMTLooXU7Y5X3Ecbh04Z+AEUfYDbDKHM1mCXQoTeYlZ
 EKawwaiEYDnqez54arz1tYjio+G5WhzeyeYTT9sbQIzwAVX/GIXdyf8YpnR1Z6bJbH//3P
 9oLKGg7aZTXr3+DEAtjALcvZKOCBBOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-qB9VbnRbN0-qnVu9faOxQg-1; Fri, 13 Dec 2019 04:40:13 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27A38800EB5;
 Fri, 13 Dec 2019 09:40:11 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C878541FC;
 Fri, 13 Dec 2019 09:40:04 +0000 (UTC)
Date: Fri, 13 Dec 2019 10:40:03 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Subject: Re: [PATCH RESEND v20 2/8] numa: Extend CLI to provide memory
 latency and bandwidth information
Message-ID: <20191213104003.0c8e5940@redhat.com>
In-Reply-To: <20191213011929.2520-3-tao3.xu@intel.com>
References: <20191213011929.2520-1-tao3.xu@intel.com>
 <20191213011929.2520-3-tao3.xu@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: qB9VbnRbN0-qnVu9faOxQg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: lvivier@redhat.com, thuth@redhat.com, fan.du@intel.com, ehabkost@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, sw@weilnetz.de,
 jonathan.cameron@huawei.com, armbru@redhat.com, mdroth@linux.vnet.ibm.com,
 jingqi.liu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Dec 2019 09:19:23 +0800
Tao Xu <tao3.xu@intel.com> wrote:

> From: Liu Jingqi <jingqi.liu@intel.com>
> 
> Add -numa hmat-lb option to provide System Locality Latency and
> Bandwidth Information. These memory attributes help to build
> System Locality Latency and Bandwidth Information Structure(s)
> in ACPI Heterogeneous Memory Attribute Table (HMAT). Before using
> hmat-lb option, enable HMAT with -machine hmat=on.
> 
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
> Signed-off-by: Tao Xu <tao3.xu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> 
> Changes in v20:
>     - Update the QAPI description (Markus)
>     - Keep base and bitmap unchanged when latency or bandwidth
>       out of range
> 
> Changes in v19:
>     - Add description about the machine property 'hmat' in commit
>       message (Markus)
> 
> Changes in v18:
>     - Use qapi type uint64 and only nanosecond for latency (Markus)
> 
> Changes in v17:
>     - Add check when user input latency or bandwidth 0, the
>       lb_info_provided should also be 0. Because in ACPI 6.3 5.2.27.4,
>       0 means the corresponding latency or bandwidth information is
>       not provided.
>     - Fix the infinite loop when node->latency is 0.
> ---
>  hw/core/numa.c        | 194 ++++++++++++++++++++++++++++++++++++++++++
>  include/sysemu/numa.h |  53 ++++++++++++
>  qapi/machine.json     |  93 +++++++++++++++++++-
>  qemu-options.hx       |  47 +++++++++-
>  4 files changed, 384 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index e60da99293..34eb413f5d 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -23,6 +23,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "sysemu/hostmem.h"
>  #include "sysemu/numa.h"
>  #include "sysemu/sysemu.h"
> @@ -198,6 +199,186 @@ void parse_numa_distance(MachineState *ms, NumaDistOptions *dist, Error **errp)
>      ms->numa_state->have_numa_distance = true;
>  }
>  
> +void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
> +                        Error **errp)
> +{
> +    int i, first_bit, last_bit;
> +    uint64_t max_entry, temp_base, bitmap_copy;
> +    NodeInfo *numa_info = numa_state->nodes;
> +    HMAT_LB_Info *hmat_lb =
> +        numa_state->hmat_lb[node->hierarchy][node->data_type];
> +    HMAT_LB_Data lb_data = {};
> +    HMAT_LB_Data *lb_temp;
> +
> +    /* Error checking */
> +    if (node->initiator > numa_state->num_nodes) {
> +        error_setg(errp, "Invalid initiator=%d, it should be less than %d",
> +                   node->initiator, numa_state->num_nodes);
> +        return;
> +    }
> +    if (node->target > numa_state->num_nodes) {
> +        error_setg(errp, "Invalid target=%d, it should be less than %d",
> +                   node->target, numa_state->num_nodes);
> +        return;
> +    }
> +    if (!numa_info[node->initiator].has_cpu) {
> +        error_setg(errp, "Invalid initiator=%d, it isn't an "
> +                   "initiator proximity domain", node->initiator);
> +        return;
> +    }
> +    if (!numa_info[node->target].present) {
> +        error_setg(errp, "The target=%d should point to an existing node",
> +                   node->target);
> +        return;
> +    }
> +
> +    if (!hmat_lb) {
> +        hmat_lb = g_malloc0(sizeof(*hmat_lb));
> +        numa_state->hmat_lb[node->hierarchy][node->data_type] = hmat_lb;
> +        hmat_lb->list = g_array_new(false, true, sizeof(HMAT_LB_Data));
> +    }
> +    hmat_lb->hierarchy = node->hierarchy;
> +    hmat_lb->data_type = node->data_type;
> +    lb_data.initiator = node->initiator;
> +    lb_data.target = node->target;
> +
> +    if (node->data_type <= HMATLB_DATA_TYPE_WRITE_LATENCY) {
> +        /* Input latency data */
> +
> +        if (!node->has_latency) {
> +            error_setg(errp, "Missing 'latency' option");
> +            return;
> +        }
> +        if (node->has_bandwidth) {
> +            error_setg(errp, "Invalid option 'bandwidth' since "
> +                       "the data type is latency");
> +            return;
> +        }
> +
> +        /* Detect duplicate configuration */
> +        for (i = 0; i < hmat_lb->list->len; i++) {
> +            lb_temp = &g_array_index(hmat_lb->list, HMAT_LB_Data, i);
> +
> +            if (node->initiator == lb_temp->initiator &&
> +                node->target == lb_temp->target) {
> +                error_setg(errp, "Duplicate configuration of the latency for "
> +                    "initiator=%d and target=%d", node->initiator,
> +                    node->target);
> +                return;
> +            }
> +        }
> +
> +        hmat_lb->base = hmat_lb->base ? hmat_lb->base : UINT64_MAX;
> +
> +        if (node->latency) {
> +            /* Calculate the temporary base and compressed latency */
> +            max_entry = node->latency;
> +            temp_base = 1;
> +            while (QEMU_IS_ALIGNED(max_entry, 10)) {
> +                max_entry /= 10;
> +                temp_base *= 10;
> +            }
> +
> +            /* Calculate the max compressed latency */
> +            temp_base = MIN(hmat_lb->base, temp_base);
> +            max_entry = node->latency / hmat_lb->base;
> +            max_entry = MAX(hmat_lb->range_bitmap, max_entry);
> +
> +            /*
> +             * For latency hmat_lb->range_bitmap record the max compressed
> +             * latency which should be less than 0xFFFF (UINT16_MAX)
> +             */
> +            if (max_entry >= UINT16_MAX) {
> +                error_setg(errp, "Latency %" PRIu64 " between initiator=%d and "
> +                        "target=%d should not differ from previously entered "
> +                        "min or max values on more than %d", node->latency,
> +                        node->initiator, node->target, UINT16_MAX - 1);
> +                return;
> +            } else {
> +                hmat_lb->base = temp_base;
> +                hmat_lb->range_bitmap = max_entry;
> +            }
> +
> +            /*
> +             * Set lb_info_provided bit 0 as 1,
> +             * latency information is provided
> +             */
> +            numa_info[node->target].lb_info_provided |= BIT(0);
> +        }
> +        lb_data.data = node->latency;
> +    } else if (node->data_type >= HMATLB_DATA_TYPE_ACCESS_BANDWIDTH) {
> +        /* Input bandwidth data */
> +        if (!node->has_bandwidth) {
> +            error_setg(errp, "Missing 'bandwidth' option");
> +            return;
> +        }
> +        if (node->has_latency) {
> +            error_setg(errp, "Invalid option 'latency' since "
> +                       "the data type is bandwidth");
> +            return;
> +        }
> +        if (!QEMU_IS_ALIGNED(node->bandwidth, MiB)) {
> +            error_setg(errp, "Bandwidth %" PRIu64 " between initiator=%d and "
> +                       "target=%d should be 1MB aligned", node->bandwidth,
> +                       node->initiator, node->target);
> +            return;
> +        }
> +
> +        /* Detect duplicate configuration */
> +        for (i = 0; i < hmat_lb->list->len; i++) {
> +            lb_temp = &g_array_index(hmat_lb->list, HMAT_LB_Data, i);
> +
> +            if (node->initiator == lb_temp->initiator &&
> +                node->target == lb_temp->target) {
> +                error_setg(errp, "Duplicate configuration of the bandwidth for "
> +                    "initiator=%d and target=%d", node->initiator,
> +                    node->target);
> +                return;
> +            }
> +        }
> +
> +        hmat_lb->base = hmat_lb->base ? hmat_lb->base : 1;
> +
> +        if (node->bandwidth) {
> +            /* Keep bitmap unchanged when bandwidth out of range */
> +            bitmap_copy = hmat_lb->range_bitmap;
> +            bitmap_copy |= node->bandwidth;
> +            first_bit = ctz64(bitmap_copy);
> +            temp_base = UINT64_C(1) << first_bit;
> +            max_entry = node->bandwidth / temp_base;
> +            last_bit = 64 - clz64(bitmap_copy);
> +
> +            /*
> +             * For bandwidth, first_bit record the base unit of bandwidth bits,
> +             * last_bit record the last bit of the max bandwidth. The max
> +             * compressed bandwidth should be less than 0xFFFF (UINT16_MAX)
> +             */
> +            if ((last_bit - first_bit) > UINT16_BITS ||
> +                max_entry >= UINT16_MAX) {
> +                error_setg(errp, "Bandwidth %" PRIu64 " between initiator=%d "
> +                        "and target=%d should not differ from previously "
> +                        "entered values on more than %d", node->bandwidth,
> +                        node->initiator, node->target, UINT16_MAX - 1);
> +                return;
> +            } else {
> +                hmat_lb->base = temp_base;
> +                hmat_lb->range_bitmap = bitmap_copy;
> +            }
> +
> +            /*
> +             * Set lb_info_provided bit 1 as 1,
> +             * bandwidth information is provided
> +             */
> +            numa_info[node->target].lb_info_provided |= BIT(1);
> +        }
> +        lb_data.data = node->bandwidth;
> +    } else {
> +        assert(0);
> +    }
> +
> +    g_array_append_val(hmat_lb->list, lb_data);
> +}
> +
>  void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
>  {
>      Error *err = NULL;
> @@ -236,6 +417,19 @@ void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp)
>          machine_set_cpu_numa_node(ms, qapi_NumaCpuOptions_base(&object->u.cpu),
>                                    &err);
>          break;
> +    case NUMA_OPTIONS_TYPE_HMAT_LB:
> +        if (!ms->numa_state->hmat_enabled) {
> +            error_setg(errp, "ACPI Heterogeneous Memory Attribute Table "
> +                       "(HMAT) is disabled, enable it with -machine hmat=on "
> +                       "before using any of hmat specific options");
> +            return;
> +        }
> +
> +        parse_numa_hmat_lb(ms->numa_state, &object->u.hmat_lb, &err);
> +        if (err) {
> +            goto end;
> +        }
> +        break;
>      default:
>          abort();
>      }
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 788cbec7a2..70f93c83d7 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -14,11 +14,34 @@ struct CPUArchId;
>  #define NUMA_DISTANCE_MAX         254
>  #define NUMA_DISTANCE_UNREACHABLE 255
>  
> +/* the value of AcpiHmatLBInfo flags */
> +enum {
> +    HMAT_LB_MEM_MEMORY           = 0,
> +    HMAT_LB_MEM_CACHE_1ST_LEVEL  = 1,
> +    HMAT_LB_MEM_CACHE_2ND_LEVEL  = 2,
> +    HMAT_LB_MEM_CACHE_3RD_LEVEL  = 3,
> +    HMAT_LB_LEVELS   /* must be the last entry */
> +};
> +
> +/* the value of AcpiHmatLBInfo data type */
> +enum {
> +    HMAT_LB_DATA_ACCESS_LATENCY   = 0,
> +    HMAT_LB_DATA_READ_LATENCY     = 1,
> +    HMAT_LB_DATA_WRITE_LATENCY    = 2,
> +    HMAT_LB_DATA_ACCESS_BANDWIDTH = 3,
> +    HMAT_LB_DATA_READ_BANDWIDTH   = 4,
> +    HMAT_LB_DATA_WRITE_BANDWIDTH  = 5,
> +    HMAT_LB_TYPES   /* must be the last entry */
> +};
> +
> +#define UINT16_BITS       16
> +
>  struct NodeInfo {
>      uint64_t node_mem;
>      struct HostMemoryBackend *node_memdev;
>      bool present;
>      bool has_cpu;
> +    uint8_t lb_info_provided;
>      uint16_t initiator;
>      uint8_t distance[MAX_NODES];
>  };
> @@ -28,6 +51,31 @@ struct NumaNodeMem {
>      uint64_t node_plugged_mem;
>  };
>  
> +struct HMAT_LB_Data {
> +    uint8_t     initiator;
> +    uint8_t     target;
> +    uint64_t    data;
> +};
> +typedef struct HMAT_LB_Data HMAT_LB_Data;
> +
> +struct HMAT_LB_Info {
> +    /* Indicates it's memory or the specified level memory side cache. */
> +    uint8_t     hierarchy;
> +
> +    /* Present the type of data, access/read/write latency or bandwidth. */
> +    uint8_t     data_type;
> +
> +    /* The range bitmap of bandwidth for calculating common base */
> +    uint64_t    range_bitmap;
> +
> +    /* The common base unit for latencies or bandwidths */
> +    uint64_t    base;
> +
> +    /* Array to store the latencies or bandwidths */
> +    GArray      *list;
> +};
> +typedef struct HMAT_LB_Info HMAT_LB_Info;
> +
>  struct NumaState {
>      /* Number of NUMA nodes */
>      int num_nodes;
> @@ -40,11 +88,16 @@ struct NumaState {
>  
>      /* NUMA nodes information */
>      NodeInfo nodes[MAX_NODES];
> +
> +    /* NUMA nodes HMAT Locality Latency and Bandwidth Information */
> +    HMAT_LB_Info *hmat_lb[HMAT_LB_LEVELS][HMAT_LB_TYPES];
>  };
>  typedef struct NumaState NumaState;
>  
>  void set_numa_options(MachineState *ms, NumaOptions *object, Error **errp);
>  void parse_numa_opts(MachineState *ms);
> +void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
> +                        Error **errp);
>  void numa_complete_configuration(MachineState *ms);
>  void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
>  extern QemuOptsList qemu_numa_opts;
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 27d0e37534..cf8faf5a2a 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -426,10 +426,12 @@
>  #
>  # @cpu: property based CPU(s) to node mapping (Since: 2.10)
>  #
> +# @hmat-lb: memory latency and bandwidth information (Since: 5.0)
> +#
>  # Since: 2.1
>  ##
>  { 'enum': 'NumaOptionsType',
> -  'data': [ 'node', 'dist', 'cpu' ] }
> +  'data': [ 'node', 'dist', 'cpu', 'hmat-lb' ] }
>  
>  ##
>  # @NumaOptions:
> @@ -444,7 +446,8 @@
>    'data': {
>      'node': 'NumaNodeOptions',
>      'dist': 'NumaDistOptions',
> -    'cpu': 'NumaCpuOptions' }}
> +    'cpu': 'NumaCpuOptions',
> +    'hmat-lb': 'NumaHmatLBOptions' }}
>  
>  ##
>  # @NumaNodeOptions:
> @@ -557,6 +560,92 @@
>     'base': 'CpuInstanceProperties',
>     'data' : {} }
>  
> +##
> +# @HmatLBMemoryHierarchy:
> +#
> +# The memory hierarchy in the System Locality Latency and Bandwidth
> +# Information Structure of HMAT (Heterogeneous Memory Attribute Table)
> +#
> +# For more information about @HmatLBMemoryHierarchy, see chapter
> +# 5.2.27.4: Table 5-146: Field "Flags" of ACPI 6.3 spec.
> +#
> +# @memory: the structure represents the memory performance
> +#
> +# @first-level: first level of memory side cache
> +#
> +# @second-level: second level of memory side cache
> +#
> +# @third-level: third level of memory side cache
> +#
> +# Since: 5.0
> +##
> +{ 'enum': 'HmatLBMemoryHierarchy',
> +  'data': [ 'memory', 'first-level', 'second-level', 'third-level' ] }
> +
> +##
> +# @HmatLBDataType:
> +#
> +# Data type in the System Locality Latency and Bandwidth
> +# Information Structure of HMAT (Heterogeneous Memory Attribute Table)
> +#
> +# For more information about @HmatLBDataType, see chapter
> +# 5.2.27.4: Table 5-146:  Field "Data Type" of ACPI 6.3 spec.
> +#
> +# @access-latency: access latency (nanoseconds)
> +#
> +# @read-latency: read latency (nanoseconds)
> +#
> +# @write-latency: write latency (nanoseconds)
> +#
> +# @access-bandwidth: access bandwidth (Bytes per second)
> +#
> +# @read-bandwidth: read bandwidth (Bytes per second)
> +#
> +# @write-bandwidth: write bandwidth (Bytes per second)
> +#
> +# Since: 5.0
> +##
> +{ 'enum': 'HmatLBDataType',
> +  'data': [ 'access-latency', 'read-latency', 'write-latency',
> +            'access-bandwidth', 'read-bandwidth', 'write-bandwidth' ] }
> +
> +##
> +# @NumaHmatLBOptions:
> +#
> +# Set the system locality latency and bandwidth information
> +# between Initiator and Target proximity Domains.
> +#
> +# For more information about @NumaHmatLBOptions, see chapter
> +# 5.2.27.4: Table 5-146 of ACPI 6.3 spec.
> +#
> +# @initiator: the Initiator Proximity Domain.
> +#
> +# @target: the Target Proximity Domain.
> +#
> +# @hierarchy: the Memory Hierarchy. Indicates the performance
> +#             of memory or side cache.
> +#
> +# @data-type: presents the type of data, access/read/write
> +#             latency or hit latency.
> +#
> +# @latency: the value of latency from @initiator to @target
> +#           proximity domain, the latency unit is "ns(nanosecond)".
> +#
> +# @bandwidth: the value of bandwidth between @initiator and @target
> +#             proximity domain, the bandwidth unit is
> +#             "Bytes per second".
> +#
> +# Since: 5.0
> +##
> +{ 'struct': 'NumaHmatLBOptions',
> +    'data': {
> +    'initiator': 'uint16',
> +    'target': 'uint16',
> +    'hierarchy': 'HmatLBMemoryHierarchy',
> +    'data-type': 'HmatLBDataType',
> +    '*latency': 'uint64',
> +    '*bandwidth': 'size' }}
> +
>  ##
>  # @HostMemPolicy:
>  #
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 63f6b33322..c45e2ae513 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -168,16 +168,19 @@ DEF("numa", HAS_ARG, QEMU_OPTION_numa,
>      "-numa node[,mem=size][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=node]\n"
>      "-numa node[,memdev=id][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=node]\n"
>      "-numa dist,src=source,dst=destination,val=distance\n"
> -    "-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]\n",
> +    "-numa cpu,node-id=node[,socket-id=x][,core-id=y][,thread-id=z]\n"
> +    "-numa hmat-lb,initiator=node,target=node,hierarchy=memory|first-level|second-level|third-level,data-type=access-latency|read-latency|write-latency[,latency=lat][,bandwidth=bw]\n",
>      QEMU_ARCH_ALL)
>  STEXI
>  @item -numa node[,mem=@var{size}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
>  @itemx -numa node[,memdev=@var{id}][,cpus=@var{firstcpu}[-@var{lastcpu}]][,nodeid=@var{node}][,initiator=@var{initiator}]
>  @itemx -numa dist,src=@var{source},dst=@var{destination},val=@var{distance}
>  @itemx -numa cpu,node-id=@var{node}[,socket-id=@var{x}][,core-id=@var{y}][,thread-id=@var{z}]
> +@itemx -numa hmat-lb,initiator=@var{node},target=@var{node},hierarchy=@var{hierarchy},data-type=@var{tpye}[,latency=@var{lat}][,bandwidth=@var{bw}]
>  @findex -numa
>  Define a NUMA node and assign RAM and VCPUs to it.
>  Set the NUMA distance from a source node to a destination node.
> +Set the ACPI Heterogeneous Memory Attributes for the given nodes.
>  
>  Legacy VCPU assignment uses @samp{cpus} option where
>  @var{firstcpu} and @var{lastcpu} are CPU indexes. Each
> @@ -256,6 +259,48 @@ specified resources, it just assigns existing resources to NUMA
>  nodes. This means that one still has to use the @option{-m},
>  @option{-smp} options to allocate RAM and VCPUs respectively.
>  
> +Use @samp{hmat-lb} to set System Locality Latency and Bandwidth Information
> +between initiator and target NUMA nodes in ACPI Heterogeneous Attribute Memory Table (HMAT).
> +Initiator NUMA node can create memory requests, usually it has one or more processors.
> +Target NUMA node contains addressable memory.
> +
> +In @samp{hmat-lb} option, @var{node} are NUMA node IDs. @var{hierarchy} is the memory
> +hierarchy of the target NUMA node: if @var{hierarchy} is 'memory', the structure
> +represents the memory performance; if @var{hierarchy} is 'first-level|second-level|third-level',
> +this structure represents aggregated performance of memory side caches for each domain.
> +@var{type} of 'data-type' is type of data represented by this structure instance:
> +if 'hierarchy' is 'memory', 'data-type' is 'access|read|write' latency or 'access|read|write'
> +bandwidth of the target memory; if 'hierarchy' is 'first-level|second-level|third-level',
> +'data-type' is 'access|read|write' hit latency or 'access|read|write' hit bandwidth of the
> +target memory side cache.
> +
> +@var{lat} is latency value in nanoseconds. @var{bw} is bandwidth value,
> +the possible value and units are NUM[M|G|T], mean that the bandwidth value are
> +NUM byte per second (or MB/s, GB/s or TB/s depending on used suffix).
> +Note that if latency or bandwidth value is 0, means the corresponding latency or
> +bandwidth information is not provided.
> +
> +For example, the following options describe 2 NUMA nodes. Node 0 has 2 cpus and
> +a ram, node 1 has only a ram. The processors in node 0 access memory in node
> +0 with access-latency 5 nanoseconds, access-bandwidth is 200 MB/s;
> +The processors in NUMA node 0 access memory in NUMA node 1 with access-latency 10
> +nanoseconds, access-bandwidth is 100 MB/s.
> +@example
> +-machine hmat=on \
> +-m 2G \
> +-object memory-backend-ram,size=1G,id=m0 \
> +-object memory-backend-ram,size=1G,id=m1 \
> +-smp 2 \
> +-numa node,nodeid=0,memdev=m0 \
> +-numa node,nodeid=1,memdev=m1,initiator=0 \
> +-numa cpu,node-id=0,socket-id=0 \
> +-numa cpu,node-id=0,socket-id=1 \
> +-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=5 \
> +-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=200M \
> +-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
> +-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=100M
> +@end example
> +
>  ETEXI
>  
>  DEF("add-fd", HAS_ARG, QEMU_OPTION_add_fd,


