Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A006102391
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 12:49:13 +0100 (CET)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX20O-0002wB-1G
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 06:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iX1z9-0002CH-4b
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:47:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iX1z4-0007Vm-DC
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:47:53 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30484
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iX1z4-0007VJ-8G
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574164068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWIq4JOtzfPy0aWekI1L3fQAFA20omPxksZwuh4DwiA=;
 b=c1l6VUErmH8VcUydEfKVpk62rrqa4V8v89iKXExRolgClAVtMFHMOpVYZqg/IEoxkMw9DD
 dDTxbExVaeMtLchbNtcFcFup+sbxODjWGFV5OeqmsM1RMhA8tMkhbvjz+EpH2RBNlPCNjh
 k+zg5n1YrU0bN6mWCuMWuZ4rg9/fbhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-dol9qlXAPDCLc6ATQhyzeA-1; Tue, 19 Nov 2019 06:47:45 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BDDA8CE683;
 Tue, 19 Nov 2019 11:47:43 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C3EF62671;
 Tue, 19 Nov 2019 11:47:37 +0000 (UTC)
Date: Tue, 19 Nov 2019 12:47:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Subject: Re: [PATCH v16 09/14] numa: Extend CLI to provide memory side cache
 information
Message-ID: <20191119124736.42f85fe9@redhat.com>
In-Reply-To: <20191115075352.17734-10-tao3.xu@intel.com>
References: <20191115075352.17734-1-tao3.xu@intel.com>
 <20191115075352.17734-10-tao3.xu@intel.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: dol9qlXAPDCLc6ATQhyzeA-1
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

On Fri, 15 Nov 2019 15:53:47 +0800
Tao Xu <tao3.xu@intel.com> wrote:

> From: Liu Jingqi <jingqi.liu@intel.com>
>=20
> Add -numa hmat-cache option to provide Memory Side Cache Information.
> These memory attributes help to build Memory Side Cache Information
> Structure(s) in ACPI Heterogeneous Memory Attribute Table (HMAT).
>=20
> Reviewed-by: Daniel Black <daniel@linux.ibm.com>
> Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> ---
>=20
> Changes in v16:
>     - Add cross check with hmat_lb data (Igor)
>     - Drop total_levels in struct HMAT_Cache_Info (Igor)
>     - Correct the error table number (Igor)
>=20
> Changes in v15:
>     - Change the QAPI version tag to 5.0 (Eric)
>=20
> Changes in v13:
>     - Drop the total_levels option.
>     - Use readable cache size (Igor)
> ---
>  hw/core/numa.c        | 73 ++++++++++++++++++++++++++++++++++++++++
>  include/sysemu/numa.h | 26 +++++++++++++++
>  qapi/machine.json     | 78 +++++++++++++++++++++++++++++++++++++++++--
>  qemu-options.hx       | 16 +++++++--
>  4 files changed, 189 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 47c7a96863..4d7af60bfd 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -359,6 +359,66 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaH=
matLBOptions *node,
>      g_array_append_val(hmat_lb->list, lb_data);
>  }
> =20
> +void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
> +                           Error **errp)
> +{
> +    int nb_numa_nodes =3D ms->numa_state->num_nodes;
> +    NodeInfo *numa_info =3D ms->numa_state->nodes;
> +    HMAT_Cache_Info *hmat_cache =3D NULL;
> +
> +    if (node->node_id >=3D nb_numa_nodes) {
> +        error_setg(errp, "Invalid node-id=3D%" PRIu32 ", it should be le=
ss "
> +                   "than %d", node->node_id, nb_numa_nodes);
> +        return;
> +    }
> +
> +    if (numa_info[node->node_id].lb_info_provided !=3D (BIT(0) | BIT(1))=
) {
> +        error_setg(errp, "The latency and bandwidth information of "
> +                   "node-id=3D%" PRIu32 " should be provided before conf=
igure "

s/configure//

> +                   "memory side cache attributes",
> +                   node->node_id);
> +        return;
> +    }
> +
> +    if (node->level >=3D HMAT_LB_LEVELS) {
> +        error_setg(errp, "Invalid level=3D%" PRIu8 ", it should be less =
than or "
> +                   "equal to %d", node->level, HMAT_LB_LEVELS - 1);
> +        return;
> +    }
> +    assert(node->assoc < HMAT_CACHE_ASSOCIATIVITY__MAX);
> +    assert(node->policy < HMAT_CACHE_WRITE_POLICY__MAX);
> +    if (ms->numa_state->hmat_cache[node->node_id][node->level]) {
> +        error_setg(errp, "Duplicate configuration of the side cache for =
"
> +                   "node-id=3D%" PRIu32 " and level=3D%" PRIu8,
> +                   node->node_id, node->level);
> +        return;
> +    }
> +
> +    if ((node->level > 1) &&
> +        ms->numa_state->hmat_cache[node->node_id][node->level - 1] &&
will this check work as expected if I define on CLI "L+1" and then after it=
 "L"?

> +        (node->size >=3D
> +            ms->numa_state->hmat_cache[node->node_id][node->level - 1]->=
size)) {
> +        error_setg(errp, "Invalid size=3D0x%" PRIx64 ", the size of leve=
l=3D%" PRIu8
> +                   " should be less than the size(0x%" PRIx64 ") of "
> +                   "level=3D%" PRIu8, node->size, node->level,
> +                   ms->numa_state->hmat_cache[node->node_id]
> +                                             [node->level - 1]->size,
> +                   node->level - 1);
> +        return;
> +    }
> +
> +    hmat_cache =3D g_malloc0(sizeof(*hmat_cache));
> +
> +    hmat_cache->proximity =3D node->node_id;
> +    hmat_cache->size =3D node->size;
> +    hmat_cache->level =3D node->level;
> +    hmat_cache->associativity =3D node->assoc;
> +    hmat_cache->write_policy =3D node->policy;
> +    hmat_cache->line_size =3D node->line;
> +
> +    ms->numa_state->hmat_cache[node->node_id][node->level] =3D hmat_cach=
e;
> +}
> +
>  void set_numa_options(MachineState *ms, NumaOptions *object, Error **err=
p)
>  {
>      Error *err =3D NULL;
> @@ -410,6 +470,19 @@ void set_numa_options(MachineState *ms, NumaOptions =
*object, Error **errp)
>              goto end;
>          }
>          break;
> +    case NUMA_OPTIONS_TYPE_HMAT_CACHE:
> +        if (!ms->numa_state->hmat_enabled) {
> +            error_setg(errp, "ACPI Heterogeneous Memory Attribute Table =
"
> +                       "(HMAT) is disabled, enable it with -machine hmat=
=3Don "
> +                       "before using any of hmat specific options");
> +            return;
> +        }
> +
> +        parse_numa_hmat_cache(ms, &object->u.hmat_cache, &err);
> +        if (err) {
> +            goto end;
> +        }
> +        break;
>      default:
>          abort();
>      }
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 70f93c83d7..b415550678 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -76,6 +76,27 @@ struct HMAT_LB_Info {
>  };
>  typedef struct HMAT_LB_Info HMAT_LB_Info;
> =20
> +struct HMAT_Cache_Info {
> +    /* The memory proximity domain to which the memory belongs. */
> +    uint32_t    proximity;
> +
> +    /* Size of memory side cache in bytes. */
> +    uint64_t    size;
> +
> +    /* Cache level described in this structure. */
> +    uint8_t     level;
> +
> +    /* Cache Associativity: None/Direct Mapped/Comple Cache Indexing */
> +    uint8_t     associativity;
> +
> +    /* Write Policy: None/Write Back(WB)/Write Through(WT) */
> +    uint8_t     write_policy;
> +
> +    /* Cache Line size in bytes. */
> +    uint16_t    line_size;
> +};
> +typedef struct HMAT_Cache_Info HMAT_Cache_Info;
Is there a reason why you use this structure instead of QAPI
generated NumaHmatCacheOptions structure?


>  struct NumaState {
>      /* Number of NUMA nodes */
>      int num_nodes;
> @@ -91,6 +112,9 @@ struct NumaState {
> =20
>      /* NUMA nodes HMAT Locality Latency and Bandwidth Information */
>      HMAT_LB_Info *hmat_lb[HMAT_LB_LEVELS][HMAT_LB_TYPES];
> +
> +    /* Memory Side Cache Information Structure */
> +    HMAT_Cache_Info *hmat_cache[MAX_NODES][HMAT_LB_LEVELS];
>  };
>  typedef struct NumaState NumaState;
> =20
> @@ -98,6 +122,8 @@ void set_numa_options(MachineState *ms, NumaOptions *o=
bject, Error **errp);
>  void parse_numa_opts(MachineState *ms);
>  void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
>                          Error **errp);
> +void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
> +                           Error **errp);
>  void numa_complete_configuration(MachineState *ms);
>  void query_numa_node_mem(NumaNodeMem node_mem[], MachineState *ms);
>  extern QemuOptsList qemu_numa_opts;
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 67f5910400..999235bc1b 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -428,10 +428,12 @@
>  #
>  # @hmat-lb: memory latency and bandwidth information (Since: 5.0)
>  #
> +# @hmat-cache: memory side cache information (Since: 5.0)
> +#
>  # Since: 2.1
>  ##
>  { 'enum': 'NumaOptionsType',
> -  'data': [ 'node', 'dist', 'cpu', 'hmat-lb' ] }
> +  'data': [ 'node', 'dist', 'cpu', 'hmat-lb', 'hmat-cache' ] }
> =20
>  ##
>  # @NumaOptions:
> @@ -447,7 +449,8 @@
>      'node': 'NumaNodeOptions',
>      'dist': 'NumaDistOptions',
>      'cpu': 'NumaCpuOptions',
> -    'hmat-lb': 'NumaHmatLBOptions' }}
> +    'hmat-lb': 'NumaHmatLBOptions',
> +    'hmat-cache': 'NumaHmatCacheOptions' }}
> =20
>  ##
>  # @NumaNodeOptions:
> @@ -647,6 +650,77 @@
>      '*latency': 'time',
>      '*bandwidth': 'size' }}
> =20
> +##
> +# @HmatCacheAssociativity:
> +#
> +# Cache associativity in the Memory Side Cache
> +# Information Structure of HMAT
> +#
> +# For more information of @HmatCacheAssociativity see
> +# the chapter 5.2.27.5: Table 5-147 of ACPI 6.3 spec.
> +#
> +# @none: None
> +#
> +# @direct: Direct Mapped
> +#
> +# @complex: Complex Cache Indexing (implementation specific)
> +#
> +# Since: 5.0
> +##
> +{ 'enum': 'HmatCacheAssociativity',
> +  'data': [ 'none', 'direct', 'complex' ] }
> +
> +##
> +# @HmatCacheWritePolicy:
> +#
> +# Cache write policy in the Memory Side Cache
> +# Information Structure of HMAT
> +#
> +# For more information of @HmatCacheWritePolicy see
> +# the chapter 5.2.27.5: Table 5-147: Field "Cache Attributes" of ACPI 6.=
3 spec.
> +#
> +# @none: None
> +#
> +# @write-back: Write Back (WB)
> +#
> +# @write-through: Write Through (WT)
> +#
> +# Since: 5.0
> +##
> +{ 'enum': 'HmatCacheWritePolicy',
> +  'data': [ 'none', 'write-back', 'write-through' ] }
> +
> +##
> +# @NumaHmatCacheOptions:
> +#
> +# Set the memory side cache information for a given memory domain.
> +#
> +# For more information of @NumaHmatCacheOptions see
> +# the chapter 5.2.27.5: Table 5-147: Field "Cache Attributes" of ACPI 6.=
3 spec.
> +#
> +# @node-id: the memory proximity domain to which the memory belongs.
> +#
> +# @size: the size of memory side cache in bytes.
> +#
> +# @level: the cache level described in this structure.
> +#
> +# @assoc: the cache associativity, none/direct-mapped/complex(complex ca=
che indexing).
> +#
> +# @policy: the write policy, none/write-back/write-through.
> +#
> +# @line: the cache Line size in bytes.
> +#
> +# Since: 5.0
> +##
> +{ 'struct': 'NumaHmatCacheOptions',
> +  'data': {
> +   'node-id': 'uint32',
> +   'size': 'size',
> +   'level': 'uint8',
> +   'assoc': 'HmatCacheAssociativity',
> +   'policy': 'HmatCacheWritePolicy',
> +   'line': 'uint16' }}
> +
>  ##
>  # @HostMemPolicy:
>  #
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 929d275450..ad0e5aa190 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -169,7 +169,8 @@ DEF("numa", HAS_ARG, QEMU_OPTION_numa,
>      "-numa node[,memdev=3Did][,cpus=3Dfirstcpu[-lastcpu]][,nodeid=3Dnode=
][,initiator=3Dnode]\n"
>      "-numa dist,src=3Dsource,dst=3Ddestination,val=3Ddistance\n"
>      "-numa cpu,node-id=3Dnode[,socket-id=3Dx][,core-id=3Dy][,thread-id=
=3Dz]\n"
> -    "-numa hmat-lb,initiator=3Dnode,target=3Dnode,hierarchy=3Dmemory|fir=
st-level|second-level|third-level,data-type=3Daccess-latency|read-latency|w=
rite-latency[,latency=3Dlat][,bandwidth=3Dbw]\n",
> +    "-numa hmat-lb,initiator=3Dnode,target=3Dnode,hierarchy=3Dmemory|fir=
st-level|second-level|third-level,data-type=3Daccess-latency|read-latency|w=
rite-latency[,latency=3Dlat][,bandwidth=3Dbw]\n"
> +    "-numa hmat-cache,node-id=3Dnode,size=3Dsize,level=3Dlevel[,assoc=3D=
none|direct|complex][,policy=3Dnone|write-back|write-through][,line=3Dsize]=
\n",
>      QEMU_ARCH_ALL)
>  STEXI
>  @item -numa node[,mem=3D@var{size}][,cpus=3D@var{firstcpu}[-@var{lastcpu=
}]][,nodeid=3D@var{node}][,initiator=3D@var{initiator}]
> @@ -177,6 +178,7 @@ STEXI
>  @itemx -numa dist,src=3D@var{source},dst=3D@var{destination},val=3D@var{=
distance}
>  @itemx -numa cpu,node-id=3D@var{node}[,socket-id=3D@var{x}][,core-id=3D@=
var{y}][,thread-id=3D@var{z}]
>  @itemx -numa hmat-lb,initiator=3D@var{node},target=3D@var{node},hierarch=
y=3D@var{hierarchy},data-type=3D@var{tpye}[,latency=3D@var{lat}][,bandwidth=
=3D@var{bw}]
> +@itemx -numa hmat-cache,node-id=3D@var{node},size=3D@var{size},level=3D@=
var{level}[,assoc=3D@var{str}][,policy=3D@var{str}][,line=3D@var{size}]
>  @findex -numa
>  Define a NUMA node and assign RAM and VCPUs to it.
>  Set the NUMA distance from a source node to a destination node.
> @@ -282,11 +284,19 @@ Note that if NUM is 0, means the corresponding late=
ncy or bandwidth information
>  is not provided. And if input numbers without any unit, the latency unit=
 will be
>  'ns' and the bandwidth will be B/s.
> =20
> +In @samp{hmat-cache} option, @var{node-id} is the NUMA-id of the memory =
belongs.
> +@var{size} is the size of memory side cache in bytes. @var{level} is the=
 cache
> +level described in this structure. @var{assoc} is the cache associativit=
y,
> +the possible value is 'none/direct(direct-mapped)/complex(complex cache =
indexing)'.
> +@var{policy} is the write policy. @var{line} is the cache Line size in b=
ytes.
> +
>  For example, the following options describe 2 NUMA nodes. Node 0 has 2 c=
pus and
>  a ram, node 1 has only a ram. The processors in node 0 access memory in =
node
>  0 with access-latency 5 nanoseconds, access-bandwidth is 200 MB/s;
>  The processors in NUMA node 0 access memory in NUMA node 1 with access-l=
atency 10
>  nanoseconds, access-bandwidth is 100 MB/s.
> +And for memory side cache information, NUMA node 0 and 1 both have 1 lev=
el memory
> +cache, size is 10KB, policy is write-back, the cache Line size is 8 byte=
s:
>  @example
>  -machine hmat=3Don \
>  -m 2G \
> @@ -300,7 +310,9 @@ nanoseconds, access-bandwidth is 100 MB/s.
>  -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Dac=
cess-latency,latency=3D5ns \
>  -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Dac=
cess-bandwidth,bandwidth=3D200M \
>  -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Dac=
cess-latency,latency=3D10ns \
> --numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Dac=
cess-bandwidth,bandwidth=3D100M
> +-numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Dac=
cess-bandwidth,bandwidth=3D100M \
> +-numa hmat-cache,node-id=3D0,size=3D10K,level=3D1,assoc=3Ddirect,policy=
=3Dwrite-back,line=3D8 \
> +-numa hmat-cache,node-id=3D1,size=3D10K,level=3D1,assoc=3Ddirect,policy=
=3Dwrite-back,line=3D8
>  @end example
> =20
>  ETEXI


