Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E957258E11
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 14:17:12 +0200 (CEST)
Received: from localhost ([::1]:59080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD5Dr-0000XX-FT
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 08:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kD5CT-0007os-39
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 08:15:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kD5CQ-0006Fm-Te
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 08:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598962542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7IqS16nCEU8ViJOjfzJAvloIUe3pboCS0OP/AJjDC1M=;
 b=fOZnF7Lpf7ocXMKR/lgccSF/7rOjdK1MZzKcDRpghGnfbYnj7/kDURccYTMBp6rX2nvx7/
 y6QSrMwKL5/p6Jlle13hl8vIp3rh2iODKJgXo1sWmginEJEjKMJudANWGzhDxBXOR9q0Ug
 0v59DRydgC6kJU62WFL6kn8SgSNvgec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-gPe-s9NaPF65gkw7FmeOPA-1; Tue, 01 Sep 2020 08:15:38 -0400
X-MC-Unique: gPe-s9NaPF65gkw7FmeOPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CA321DDF1;
 Tue,  1 Sep 2020 12:15:37 +0000 (UTC)
Received: from imammedo-mac (unknown [10.40.193.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1891F78B50;
 Tue,  1 Sep 2020 12:15:32 +0000 (UTC)
Date: Tue, 1 Sep 2020 14:15:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v6 06/10] Revert "target/i386: Cleanup and use the EPYC
 mode topology functions"
Message-ID: <20200901141531.7bb633de@imammedo-mac>
In-Reply-To: <159889936257.21294.1786224705357428082.stgit@naples-babu.amd.com>
References: <159889924378.21294.16494070903874534542.stgit@naples-babu.amd.com>
 <159889936257.21294.1786224705357428082.stgit@naples-babu.amd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 23:17:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Aug 2020 13:42:42 -0500
Babu Moger <babu.moger@amd.com> wrote:

> This reverts commit dd08ef0318e2b61d14bc069590d174913f7f437a.
>=20
> Remove the EPYC specific apicid decoding and use the generic
> default decoding.
>=20
> Signed-off-by: Babu Moger <babu.moger@amd.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  target/i386/cpu.c |  161 ++++++++++++++++++++++++++++++++++++++++++-----=
------
>  1 file changed, 127 insertions(+), 34 deletions(-)
>=20
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index b72b4b08ac..256bfa669f 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -338,15 +338,68 @@ static void encode_cache_cpuid80000006(CPUCacheInfo=
 *l2,
>      }
>  }
> =20
> +/*
> + * Definitions used for building CPUID Leaf 0x8000001D and 0x8000001E
> + * Please refer to the AMD64 Architecture Programmer=E2=80=99s Manual Vo=
lume 3.
> + * Define the constants to build the cpu topology. Right now, TOPOEXT
> + * feature is enabled only on EPYC. So, these constants are based on
> + * EPYC supported configurations. We may need to handle the cases if
> + * these values change in future.
> + */
> +/* Maximum core complexes in a node */
> +#define MAX_CCX 2
> +/* Maximum cores in a core complex */
> +#define MAX_CORES_IN_CCX 4
> +/* Maximum cores in a node */
> +#define MAX_CORES_IN_NODE 8
> +/* Maximum nodes in a socket */
> +#define MAX_NODES_PER_SOCKET 4
> +
> +/*
> + * Figure out the number of nodes required to build this config.
> + * Max cores in a node is 8
> + */
> +static int nodes_in_socket(int nr_cores)
> +{
> +    int nodes;
> +
> +    nodes =3D DIV_ROUND_UP(nr_cores, MAX_CORES_IN_NODE);
> +
> +   /* Hardware does not support config with 3 nodes, return 4 in that ca=
se */
> +    return (nodes =3D=3D 3) ? 4 : nodes;
> +}
> +
> +/*
> + * Decide the number of cores in a core complex with the given nr_cores =
using
> + * following set constants MAX_CCX, MAX_CORES_IN_CCX, MAX_CORES_IN_NODE =
and
> + * MAX_NODES_PER_SOCKET. Maintain symmetry as much as possible
> + * L3 cache is shared across all cores in a core complex. So, this will =
also
> + * tell us how many cores are sharing the L3 cache.
> + */
> +static int cores_in_core_complex(int nr_cores)
> +{
> +    int nodes;
> +
> +    /* Check if we can fit all the cores in one core complex */
> +    if (nr_cores <=3D MAX_CORES_IN_CCX) {
> +        return nr_cores;
> +    }
> +    /* Get the number of nodes required to build this config */
> +    nodes =3D nodes_in_socket(nr_cores);
> +
> +    /*
> +     * Divide the cores accros all the core complexes
> +     * Return rounded up value
> +     */
> +    return DIV_ROUND_UP(nr_cores, nodes * MAX_CCX);
> +}
> +
>  /* Encode cache info for CPUID[8000001D] */
> -static void encode_cache_cpuid8000001d(CPUCacheInfo *cache,
> -                                       X86CPUTopoInfo *topo_info,
> -                                       uint32_t *eax, uint32_t *ebx,
> -                                       uint32_t *ecx, uint32_t *edx)
> +static void encode_cache_cpuid8000001d(CPUCacheInfo *cache, CPUState *cs=
,
> +                                uint32_t *eax, uint32_t *ebx,
> +                                uint32_t *ecx, uint32_t *edx)
>  {
>      uint32_t l3_cores;
> -    unsigned nodes =3D MAX(topo_info->nodes_per_pkg, 1);
> -
>      assert(cache->size =3D=3D cache->line_size * cache->associativity *
>                            cache->partitions * cache->sets);
> =20
> @@ -355,13 +408,10 @@ static void encode_cache_cpuid8000001d(CPUCacheInfo=
 *cache,
> =20
>      /* L3 is shared among multiple cores */
>      if (cache->level =3D=3D 3) {
> -        l3_cores =3D DIV_ROUND_UP((topo_info->dies_per_pkg *
> -                                 topo_info->cores_per_die *
> -                                 topo_info->threads_per_core),
> -                                 nodes);
> -        *eax |=3D (l3_cores - 1) << 14;
> +        l3_cores =3D cores_in_core_complex(cs->nr_cores);
> +        *eax |=3D ((l3_cores * cs->nr_threads) - 1) << 14;
>      } else {
> -        *eax |=3D ((topo_info->threads_per_core - 1) << 14);
> +        *eax |=3D ((cs->nr_threads - 1) << 14);
>      }
> =20
>      assert(cache->line_size > 0);
> @@ -381,17 +431,55 @@ static void encode_cache_cpuid8000001d(CPUCacheInfo=
 *cache,
>             (cache->complex_indexing ? CACHE_COMPLEX_IDX : 0);
>  }
> =20
> +/* Data structure to hold the configuration info for a given core index =
*/
> +struct core_topology {
> +    /* core complex id of the current core index */
> +    int ccx_id;
> +    /*
> +     * Adjusted core index for this core in the topology
> +     * This can be 0,1,2,3 with max 4 cores in a core complex
> +     */
> +    int core_id;
> +    /* Node id for this core index */
> +    int node_id;
> +    /* Number of nodes in this config */
> +    int num_nodes;
> +};
> +
> +/*
> + * Build the configuration closely match the EPYC hardware. Using the EP=
YC
> + * hardware configuration values (MAX_CCX, MAX_CORES_IN_CCX, MAX_CORES_I=
N_NODE)
> + * right now. This could change in future.
> + * nr_cores : Total number of cores in the config
> + * core_id  : Core index of the current CPU
> + * topo     : Data structure to hold all the config info for this core i=
ndex
> + */
> +static void build_core_topology(int nr_cores, int core_id,
> +                                struct core_topology *topo)
> +{
> +    int nodes, cores_in_ccx;
> +
> +    /* First get the number of nodes required */
> +    nodes =3D nodes_in_socket(nr_cores);
> +
> +    cores_in_ccx =3D cores_in_core_complex(nr_cores);
> +
> +    topo->node_id =3D core_id / (cores_in_ccx * MAX_CCX);
> +    topo->ccx_id =3D (core_id % (cores_in_ccx * MAX_CCX)) / cores_in_ccx=
;
> +    topo->core_id =3D core_id % cores_in_ccx;
> +    topo->num_nodes =3D nodes;
> +}
> +
>  /* Encode cache info for CPUID[8000001E] */
> -static void encode_topo_cpuid8000001e(X86CPUTopoInfo *topo_info, X86CPU =
*cpu,
> +static void encode_topo_cpuid8000001e(CPUState *cs, X86CPU *cpu,
>                                         uint32_t *eax, uint32_t *ebx,
>                                         uint32_t *ecx, uint32_t *edx)
>  {
> -    X86CPUTopoIDs topo_ids =3D {0};
> -    unsigned long nodes =3D MAX(topo_info->nodes_per_pkg, 1);
> +    struct core_topology topo =3D {0};
> +    unsigned long nodes;
>      int shift;
> =20
> -    x86_topo_ids_from_apicid_epyc(cpu->apic_id, topo_info, &topo_ids);
> -
> +    build_core_topology(cs->nr_cores, cpu->core_id, &topo);
>      *eax =3D cpu->apic_id;
>      /*
>       * CPUID_Fn8000001E_EBX
> @@ -408,8 +496,12 @@ static void encode_topo_cpuid8000001e(X86CPUTopoInfo=
 *topo_info, X86CPU *cpu,
>       *             3 Core complex id
>       *           1:0 Core id
>       */
> -    *ebx =3D ((topo_info->threads_per_core - 1) << 8) | (topo_ids.node_i=
d << 3) |
> -            (topo_ids.core_id);
> +    if (cs->nr_threads - 1) {
> +        *ebx =3D ((cs->nr_threads - 1) << 8) | (topo.node_id << 3) |
> +                (topo.ccx_id << 2) | topo.core_id;
> +    } else {
> +        *ebx =3D (topo.node_id << 4) | (topo.ccx_id << 3) | topo.core_id=
;
> +    }
>      /*
>       * CPUID_Fn8000001E_ECX
>       * 31:11 Reserved
> @@ -418,8 +510,9 @@ static void encode_topo_cpuid8000001e(X86CPUTopoInfo =
*topo_info, X86CPU *cpu,
>       *         2  Socket id
>       *       1:0  Node id
>       */
> -    if (nodes <=3D 4) {
> -        *ecx =3D ((nodes - 1) << 8) | (topo_ids.pkg_id << 2) | topo_ids.=
node_id;
> +    if (topo.num_nodes <=3D 4) {
> +        *ecx =3D ((topo.num_nodes - 1) << 8) | (cpu->socket_id << 2) |
> +                topo.node_id;
>      } else {
>          /*
>           * Node id fix up. Actual hardware supports up to 4 nodes. But w=
ith
> @@ -434,10 +527,10 @@ static void encode_topo_cpuid8000001e(X86CPUTopoInf=
o *topo_info, X86CPU *cpu,
>           * number of nodes. find_last_bit returns last set bit(0 based).=
 Left
>           * shift(+1) the socket id to represent all the nodes.
>           */
> -        nodes -=3D 1;
> +        nodes =3D topo.num_nodes - 1;
>          shift =3D find_last_bit(&nodes, 8);
> -        *ecx =3D (nodes << 8) | (topo_ids.pkg_id << (shift + 1)) |
> -               topo_ids.node_id;
> +        *ecx =3D ((topo.num_nodes - 1) << 8) | (cpu->socket_id << (shift=
 + 1)) |
> +                topo.node_id;
>      }
>      *edx =3D 0;
>  }
> @@ -5471,7 +5564,6 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index=
, uint32_t count,
>      uint32_t signature[3];
>      X86CPUTopoInfo topo_info;
> =20
> -    topo_info.nodes_per_pkg =3D env->nr_nodes;
>      topo_info.dies_per_pkg =3D env->nr_dies;
>      topo_info.cores_per_die =3D cs->nr_cores;
>      topo_info.threads_per_core =3D cs->nr_threads;
> @@ -5902,20 +5994,20 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t ind=
ex, uint32_t count,
>          }
>          switch (count) {
>          case 0: /* L1 dcache info */
> -            encode_cache_cpuid8000001d(env->cache_info_amd.l1d_cache,
> -                                       &topo_info, eax, ebx, ecx, edx);
> +            encode_cache_cpuid8000001d(env->cache_info_amd.l1d_cache, cs=
,
> +                                       eax, ebx, ecx, edx);
>              break;
>          case 1: /* L1 icache info */
> -            encode_cache_cpuid8000001d(env->cache_info_amd.l1i_cache,
> -                                       &topo_info, eax, ebx, ecx, edx);
> +            encode_cache_cpuid8000001d(env->cache_info_amd.l1i_cache, cs=
,
> +                                       eax, ebx, ecx, edx);
>              break;
>          case 2: /* L2 cache info */
> -            encode_cache_cpuid8000001d(env->cache_info_amd.l2_cache,
> -                                       &topo_info, eax, ebx, ecx, edx);
> +            encode_cache_cpuid8000001d(env->cache_info_amd.l2_cache, cs,
> +                                       eax, ebx, ecx, edx);
>              break;
>          case 3: /* L3 cache info */
> -            encode_cache_cpuid8000001d(env->cache_info_amd.l3_cache,
> -                                       &topo_info, eax, ebx, ecx, edx);
> +            encode_cache_cpuid8000001d(env->cache_info_amd.l3_cache, cs,
> +                                       eax, ebx, ecx, edx);
>              break;
>          default: /* end of info */
>              *eax =3D *ebx =3D *ecx =3D *edx =3D 0;
> @@ -5924,7 +6016,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index=
, uint32_t count,
>          break;
>      case 0x8000001E:
>          assert(cpu->core_id <=3D 255);
> -        encode_topo_cpuid8000001e(&topo_info, cpu, eax, ebx, ecx, edx);
> +        encode_topo_cpuid8000001e(cs, cpu,
> +                                  eax, ebx, ecx, edx);
>          break;
>      case 0xC0000000:
>          *eax =3D env->cpuid_xlevel2;
>=20


