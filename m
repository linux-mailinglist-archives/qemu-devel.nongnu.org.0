Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F14B7127
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 03:41:23 +0200 (CEST)
Received: from localhost ([::1]:36870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAlRi-0006YM-PX
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 21:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46445)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jingqi.liu@intel.com>) id 1iAlQi-00064f-9A
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 21:40:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jingqi.liu@intel.com>) id 1iAlQf-0004us-JT
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 21:40:19 -0400
Received: from mga09.intel.com ([134.134.136.24]:5733)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jingqi.liu@intel.com>)
 id 1iAlQf-0004r2-7P
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 21:40:17 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 18:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,522,1559545200"; d="scan'208";a="362363381"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga005.jf.intel.com with ESMTP; 18 Sep 2019 18:40:05 -0700
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 18 Sep 2019 18:40:05 -0700
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 FMSMSX154.amr.corp.intel.com (10.18.116.70) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 18 Sep 2019 18:40:05 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.140]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.86]) with mapi id 14.03.0439.000;
 Thu, 19 Sep 2019 09:40:03 +0800
From: "Liu, Jingqi" <jingqi.liu@intel.com>
To: "Xu, Tao3" <tao3.xu@intel.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>
Thread-Topic: [PATCH v11 05/11] numa: Extend CLI to provide initiator
 information for numa nodes
Thread-Index: AQHVaSwg5/YFUUDoLE+BgI9g4fePEacyQ6wA
Date: Thu, 19 Sep 2019 01:40:03 +0000
Message-ID: <09D68D4CF52CAF489B702DEBDD12D3D3529F9D90@SHSMSX103.ccr.corp.intel.com>
References: <20190912053638.4858-1-tao3.xu@intel.com>
 <20190912053638.4858-6-tao3.xu@intel.com>
In-Reply-To: <20190912053638.4858-6-tao3.xu@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-devel] [PATCH v11 05/11] numa: Extend CLI to provide
 initiator information for numa nodes
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
Cc: "Williams, Dan J" <dan.j.williams@intel.com>, "Du, Fan" <fan.du@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Xu, Tao3
> Sent: Thursday, September 12, 2019 1:37 PM
> To: imammedo@redhat.com; eblake@redhat.com; ehabkost@redhat.com
> Cc: Xu, Tao3 <tao3.xu@intel.com>; Liu, Jingqi <jingqi.liu@intel.com>; Wil=
liams, Dan J <dan.j.williams@intel.com>;
> jonathan.cameron@huawei.com; Du, Fan <fan.du@intel.com>; qemu-devel@nongn=
u.org
> Subject: [PATCH v11 05/11] numa: Extend CLI to provide initiator informat=
ion for numa nodes
>=20
> In ACPI 6.3 chapter 5.2.27 Heterogeneous Memory Attribute Table (HMAT), T=
he initiator represents processor which access to memory. And
> in 5.2.27.3 Memory Proximity Domain Attributes Structure, the attached in=
itiator is defined as where the memory controller responsible for
> a memory proximity domain. With attached initiator information, the topol=
ogy of heterogeneous memory can be described.
>=20
> Extend CLI of "-numa node" option to indicate the initiator numa node-id.
> In the linux kernel, the codes in drivers/acpi/hmat/hmat.c parse and repo=
rt the platform's HMAT tables.
>=20
Thanks.
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>

Jingqi

> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> ---
>=20
> No changes in v11.
>=20
> Changes in v10:
> 	- Add machine oprion properties "-machine hmat=3Don|off" for
> 	enabling or disabling HMAT in QEMU.
> 	- Add more description for initiator option.
> 	- Report error then HMAT is enalbe and initiator option is
> 	missing. Not allow invaild initiator now. (Igor)
> ---
>  hw/core/machine.c     | 72 +++++++++++++++++++++++++++++++++++++++++++
>  hw/core/numa.c        | 11 +++++++
>  include/sysemu/numa.h |  6 ++++
>  qapi/machine.json     | 10 +++++-
>  qemu-options.hx       | 35 ++++++++++++++++++---
>  5 files changed, 128 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/core/machine.c b/hw/core/machine.c index 1689ad3bf8..b42f=
574282 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -518,6 +518,20 @@ static void machine_set_nvdimm(Object *obj, bool val=
ue, Error **errp)
>      ms->nvdimms_state->is_enabled =3D value;  }
>=20
> +static bool machine_get_hmat(Object *obj, Error **errp) {
> +    MachineState *ms =3D MACHINE(obj);
> +
> +    return ms->numa_state->hmat_enabled; }
> +
> +static void machine_set_hmat(Object *obj, bool value, Error **errp) {
> +    MachineState *ms =3D MACHINE(obj);
> +
> +    ms->numa_state->hmat_enabled =3D value; }
> +
>  static char *machine_get_nvdimm_persistence(Object *obj, Error **errp)  =
{
>      MachineState *ms =3D MACHINE(obj);
> @@ -645,6 +659,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
>                                 const CpuInstanceProperties *props, Error=
 **errp)  {
>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> +    NodeInfo *numa_info =3D machine->numa_state->nodes;
>      bool match =3D false;
>      int i;
>=20
> @@ -714,6 +729,16 @@ void machine_set_cpu_numa_node(MachineState *machine=
,
>          match =3D true;
>          slot->props.node_id =3D props->node_id;
>          slot->props.has_node_id =3D props->has_node_id;
> +
> +        if (numa_info[props->node_id].initiator_valid &&
> +            (props->node_id !=3D numa_info[props->node_id].initiator)) {
> +            error_setg(errp, "The initiator of CPU NUMA node %" PRId64
> +                       " should be itself.", props->node_id);
> +            return;
> +        }
> +        numa_info[props->node_id].initiator_valid =3D true;
> +        numa_info[props->node_id].has_cpu =3D true;
> +        numa_info[props->node_id].initiator =3D props->node_id;
>      }
>=20
>      if (!match) {
> @@ -960,6 +985,13 @@ static void machine_initfn(Object *obj)
>=20
>      if (mc->numa_mem_supported) {
>          ms->numa_state =3D g_new0(NumaState, 1);
> +        object_property_add_bool(obj, "hmat",
> +                                 machine_get_hmat, machine_set_hmat,
> +                                 &error_abort);
> +        object_property_set_description(obj, "hmat",
> +                                        "Set on/off to enable/disable "
> +                                        "ACPI Heterogeneous Memory Attri=
bute "
> +                                        "Table (HMAT)", NULL);
>      }
>=20
>      /* Register notifier when init is done for sysbus sanity checks */ @=
@ -1048,6 +1080,41 @@ static char *cpu_slot_to_string(const
> CPUArchId *cpu)
>      return g_string_free(s, false);
>  }
>=20
> +static void numa_validate_initiator(NumaState *nstat) {
> +    int i;
> +    NodeInfo *numa_info =3D nstat->nodes;
> +
> +    for (i =3D 0; i < nstat->num_nodes; i++) {
> +        if (numa_info[i].initiator >=3D MAX_NODES) {
> +            error_report("The initiator id %" PRIu16 " expects an intege=
r "
> +                         "between 0 and %d", numa_info[i].initiator,
> +                         MAX_NODES - 1);
> +            goto err;
> +        }
> +
> +        if (!numa_info[numa_info[i].initiator].present) {
> +            error_report("NUMA node %" PRIu16 " is missing, use "
> +                         "'-numa node' option to declare it first.",
> +                         numa_info[i].initiator);
> +            goto err;
> +        }
> +
> +        if (numa_info[numa_info[i].initiator].has_cpu) {
> +            numa_info[i].initiator_valid =3D true;
> +        } else {
> +            error_report("The initiator of NUMA node %d is invalid.", i)=
;
> +            goto err;
> +        }
> +    }
> +
> +    return;
> +
> +err:
> +    error_printf("\n");
> +    exit(1);
> +}
> +
>  static void machine_numa_finish_cpu_init(MachineState *machine)  {
>      int i;
> @@ -1088,6 +1155,11 @@ static void machine_numa_finish_cpu_init(MachineSt=
ate *machine)
>              machine_set_cpu_numa_node(machine, &props, &error_fatal);
>          }
>      }
> +
> +    if (machine->numa_state->hmat_enabled) {
> +        numa_validate_initiator(machine->numa_state);
> +    }
> +
>      if (s->len && !qtest_enabled()) {
>          warn_report("CPU(s) not present in any NUMA nodes: %s",
>                      s->str);
> diff --git a/hw/core/numa.c b/hw/core/numa.c index 4dfec5c95b..bdce7d4217=
 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -133,6 +133,17 @@ static void parse_numa_node(MachineState *ms, NumaNo=
deOptions *node,
>          numa_info[nodenr].node_mem =3D object_property_get_uint(o, "size=
", NULL);
>          numa_info[nodenr].node_memdev =3D MEMORY_BACKEND(o);
>      }
> +
> +    if (node->has_initiator) {
> +        if (!ms->numa_state->hmat_enabled) {
> +            error_setg(errp, "ACPI Heterogeneous Memory Attribute Table =
"
> +                       "(HMAT) is disabled, use -machine hmat=3Don befor=
e "
> +                       "set initiator of NUMA");
> +            return;
> +        }
> +
> +        numa_info[nodenr].initiator =3D node->initiator;
> +    }
>      numa_info[nodenr].present =3D true;
>      max_numa_nodeid =3D MAX(max_numa_nodeid, nodenr + 1);
>      ms->numa_state->num_nodes++;
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h index ae9c41d0=
2b..a788c3b126 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -18,6 +18,9 @@ struct NodeInfo {
>      uint64_t node_mem;
>      struct HostMemoryBackend *node_memdev;
>      bool present;
> +    bool has_cpu;
> +    bool initiator_valid;
> +    uint16_t initiator;
>      uint8_t distance[MAX_NODES];
>  };
>=20
> @@ -33,6 +36,9 @@ struct NumaState {
>      /* Allow setting NUMA distance for different NUMA nodes */
>      bool have_numa_distance;
>=20
> +    /* Detect if HMAT support is enabled. */
> +    bool hmat_enabled;
> +
>      /* NUMA nodes information */
>      NodeInfo nodes[MAX_NODES];
>  };
> diff --git a/qapi/machine.json b/qapi/machine.json index ca26779f1a..3c29=
14cd1c 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -463,6 +463,13 @@
>  # @memdev: memory backend object.  If specified for one node,
>  #          it must be specified for all nodes.
>  #
> +# @initiator: defined in ACPI 6.3 Chapter 5.2.27.3 Table 5-145,
> +#             indicate the nodeid which has the memory controller
> +#             responsible for this NUMA node. This field provides
> +#             additional information as to the initiator node that
> +#             is closest (as in directly attached) to this node, and
> +#             therefore has the best performance (since 4.2)
> +#
>  # Since: 2.1
>  ##
>  { 'struct': 'NumaNodeOptions',
> @@ -470,7 +477,8 @@
>     '*nodeid': 'uint16',
>     '*cpus':   ['uint16'],
>     '*mem':    'size',
> -   '*memdev': 'str' }}
> +   '*memdev': 'str',
> +   '*initiator': 'uint16' }}
>=20
>  ##
>  # @NumaDistOptions:
> diff --git a/qemu-options.hx b/qemu-options.hx index bbfd936d29..74ccc4d7=
82 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -43,7 +43,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>      "                suppress-vmdesc=3Don|off disables self-describing m=
igration (default=3Doff)\n"
>      "                nvdimm=3Don|off controls NVDIMM support (default=3D=
off)\n"
>      "                enforce-config-section=3Don|off enforce configurati=
on section migration (default=3Doff)\n"
> -    "                memory-encryption=3D@var{} memory encryption object=
 to use (default=3Dnone)\n",
> +    "                memory-encryption=3D@var{} memory encryption object=
 to use (default=3Dnone)\n"
> +    "                hmat=3Don|off controls ACPI HMAT support (default=
=3Doff)\n",
>      QEMU_ARCH_ALL)
>  STEXI
>  @item -machine [type=3D]@var{name}[,prop=3D@var{value}[,...]]
> @@ -103,6 +104,9 @@ NOTE: this parameter is deprecated. Please use @optio=
n{-global}  @option{migration.send-
> configuration}=3D@var{on|off} instead.
>  @item memory-encryption=3D@var{}
>  Memory encryption object to use. The default is none.
> +@item hmat=3Don|off
> +Enables or disables ACPI Heterogeneous Memory Attribute Table (HMAT) sup=
port.
> +The default is off.
>  @end table
>  ETEXI
>=20
> @@ -161,14 +165,14 @@ If any on the three values is given, the total numb=
er of CPUs @var{n} can be omi  ETEXI
>=20
>  DEF("numa", HAS_ARG, QEMU_OPTION_numa,
> -    "-numa node[,mem=3Dsize][,cpus=3Dfirstcpu[-lastcpu]][,nodeid=3Dnode]=
\n"
> -    "-numa node[,memdev=3Did][,cpus=3Dfirstcpu[-lastcpu]][,nodeid=3Dnode=
]\n"
> +    "-numa node[,mem=3Dsize][,cpus=3Dfirstcpu[-lastcpu]][,nodeid=3Dnode]=
[,initiator=3Dnode]\n"
> +    "-numa node[,memdev=3Did][,cpus=3Dfirstcpu[-lastcpu]][,nodeid=3Dnode=
][,initiator=3Dnode]\n"
>      "-numa dist,src=3Dsource,dst=3Ddestination,val=3Ddistance\n"
>      "-numa cpu,node-id=3Dnode[,socket-id=3Dx][,core-id=3Dy][,thread-id=
=3Dz]\n",
>      QEMU_ARCH_ALL)
>  STEXI
> -@item -numa node[,mem=3D@var{size}][,cpus=3D@var{firstcpu}[-@var{lastcpu=
}]][,nodeid=3D@var{node}]
> -@itemx -numa node[,memdev=3D@var{id}][,cpus=3D@var{firstcpu}[-@var{lastc=
pu}]][,nodeid=3D@var{node}]
> +@item -numa
> +node[,mem=3D@var{size}][,cpus=3D@var{firstcpu}[-@var{lastcpu}]][,nodeid=
=3D@va
> +r{node}][,initiator=3D@var{initiator}]
> +@itemx -numa
> +node[,memdev=3D@var{id}][,cpus=3D@var{firstcpu}[-@var{lastcpu}]][,nodeid=
=3D@v
> +ar{node}][,initiator=3D@var{initiator}]
>  @itemx -numa dist,src=3D@var{source},dst=3D@var{destination},val=3D@var{=
distance}
>  @itemx -numa cpu,node-id=3D@var{node}[,socket-id=3D@var{x}][,core-id=3D@=
var{y}][,thread-id=3D@var{z}]
>  @findex -numa
> @@ -215,6 +219,27 @@ split equally between them.
>  @samp{mem} and @samp{memdev} are mutually exclusive. Furthermore,  if on=
e node uses @samp{memdev}, all of them have to use it.
>=20
> +@samp{initiator} is an additional option indicate the @var{initiator}
> +NUMA that has best performance (the lowest latency or largest
> +bandwidth) to this NUMA @var{node}. Note that this option can be set
> +only when the machine oprion properties "-machine hmat=3Don".
> +
> +Following example creates a machine with 2 NUMA nodes, node 0 has CPU.
> +node 1 has only memory, and its' initiator is node 0. Note that because
> +node 0 has CPU, by default the initiator of node 0 is itself and must
> +be itself.
> +@example
> +-machine hmat=3Don \
> +-m 2G,slots=3D2,maxmem=3D4G \
> +-object memory-backend-ram,size=3D1G,id=3Dm0 \ -object
> +memory-backend-ram,size=3D1G,id=3Dm1 \ -numa node,nodeid=3D0,memdev=3Dm0=
 \
> +-numa node,nodeid=3D1,memdev=3Dm1,initiator=3D0 \ -smp 2,sockets=3D2,max=
cpus=3D2
> +\ -numa cpu,node-id=3D0,socket-id=3D0 \ -numa cpu,node-id=3D0,socket-id=
=3D1
> +@end example
> +
>  @var{source} and @var{destination} are NUMA node IDs.
>  @var{distance} is the NUMA distance from @var{source} to @var{destinatio=
n}.
>  The distance from a node to itself is always 10. If any pair of nodes is
> --
> 2.20.1


