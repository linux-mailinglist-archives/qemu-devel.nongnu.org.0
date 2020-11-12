Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09B62B0E3C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 20:40:48 +0100 (CET)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdISd-0005n2-Ck
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 14:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdIOr-000560-Nf; Thu, 12 Nov 2020 14:36:53 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:54399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdIOm-00028z-QL; Thu, 12 Nov 2020 14:36:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B5C3A580403;
 Thu, 12 Nov 2020 14:36:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 12 Nov 2020 14:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=zyLbRu3dyMcthlm8tLkyGqFXvBG
 RsNAiAIoj5UZ+PyM=; b=0W/bLIaIau5aF+V4YkMka8KdPmnBtyGDa6yrx2pPz4E
 8Kprj21FqBFjp0SvGxXFyK58guFS7ePQyb92Fpy83Kgc41bjeoVeDLT+LSEYFAvv
 qc50Qu3a9n5si4cc+S1Y018oP/qS2putvvetrGX5f4S4GeR6dBl0er04754JcXWb
 4zvlZv+HuVUg0JoXr/N1LyKtRha4GetKOFEzG1YHJo9ksozNWLGFpUVlFbK3eSNi
 P9hNasibtKqCleI86q+MjHbivAlW/+sMdlGFIg0snK4Y1mf8ylfW04/BP0D/pjoP
 qbBpMGyrFy8RlxP1onOwqLgCKp3Hb9WXP+hgveECD3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zyLbRu
 3dyMcthlm8tLkyGqFXvBGRsNAiAIoj5UZ+PyM=; b=ZyfElIWg+nrPRV0LD0j+oF
 AS0nB8/WD9Rt+b1+5mnf+REr8iPHiecINM8wdnXS2p4iH3A25M0KpBayGpGIx1ir
 s/rIVcYN7qqnP8ozTte6Hvite1y8tcm+A7NzFsG3TOp1o8D3sbuOEhdKHK2iJKzs
 i7FypxOZVhxpbYrHxUv1twxe6rZM1uI3Q9fSrHTxIIWxU/voQI+kbxsks0MpgXEA
 /L3X5pUXIoJ61v8Xg7TqLcstXXnCA5NLvrHhNDGZrWOwRoYWwER5k4ZgEDRIPA22
 RcRfTd8IDgCeIw1kLlA89IS+hcxe3LX2Buzrg81x+eyDj+y42O76SeDOlOjXF3lw
 ==
X-ME-Sender: <xms:y46tX58i4pc1Q50M2R2MMoALeRIxJwmt28a5V6HyJWppVeunplepfw>
 <xme:y46tX9uz7er6MIfIGlfDrHLTb0x5JY1ZJw5Ala1wg6P7qLp-bKuQDpXdsF1GIuqkc
 _0YswGyKIofMvnw5C0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvfedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:y46tX3CuEEZfnSKmfQVQo4-Q5sXCM275z-5gkqnVAhLGWQGJJlqGpQ>
 <xmx:y46tX9dR9gV4OzKToozIqF_YBQXcJLX5_w6lgNZPGh7CK7g1ZfZNLw>
 <xmx:y46tX-PG3_d_6w7WFOIJ5yJauF8__iw_bS8-5trbgqQChvUNyIpBFw>
 <xmx:zY6tX6m296sZnty-hZW--nZTz6Foguv6gU2oZeZh9Q8sIoOZrAE0xQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 874963280063;
 Thu, 12 Nov 2020 14:36:41 -0500 (EST)
Date: Thu, 12 Nov 2020 20:36:39 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH v9 08/12] hw/block/nvme: Support Zoned Namespace Command
 Set
Message-ID: <20201112193639.GA811486@apples.localdomain>
References: <20201105025342.9037-1-dmitry.fomichev@wdc.com>
 <20201105025342.9037-9-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <20201105025342.9037-9-dmitry.fomichev@wdc.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 14:36:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Keith Busch <kbusch@kernel.org>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

I know you posted v10, but my comments should be relevant to that as
well.

On Nov  5 11:53, Dmitry Fomichev wrote:
> The emulation code has been changed to advertise NVM Command Set when
> "zoned" device property is not set (default) and Zoned Namespace
> Command Set otherwise.
>=20
> Define values and structures that are needed to support Zoned
> Namespace Command Set (NVMe TP 4053) in PCI NVMe controller emulator.
> Define trace events where needed in newly introduced code.
>=20
> In order to improve scalability, all open, closed and full zones
> are organized in separate linked lists. Consequently, almost all
> zone operations don't require scanning of the entire zone array
> (which potentially can be quite large) - it is only necessary to
> enumerate one or more zone lists.
>=20
> Handlers for three new NVMe commands introduced in Zoned Namespace
> Command Set specification are added, namely for Zone Management
> Receive, Zone Management Send and Zone Append.
>=20
> Device initialization code has been extended to create a proper
> configuration for zoned operation using device properties.
>=20
> Read/Write command handler is modified to only allow writes at the
> write pointer if the namespace is zoned. For Zone Append command,
> writes implicitly happen at the write pointer and the starting write
> pointer value is returned as the result of the command. Write Zeroes
> handler is modified to add zoned checks that are identical to those
> done as a part of Write flow.
>=20
> Subsequent commits in this series add ZDE support and checks for
> active and open zone limits.
>=20
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
> Signed-off-by: Ajay Joshi <ajay.joshi@wdc.com>
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> Signed-off-by: Matias Bjorling <matias.bjorling@wdc.com>
> Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Signed-off-by: Adam Manzanares <adam.manzanares@wdc.com>
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
> ---
>  hw/block/nvme-ns.h    |  54 +++
>  hw/block/nvme.h       |   8 +
>  hw/block/nvme-ns.c    | 173 ++++++++
>  hw/block/nvme.c       | 971 +++++++++++++++++++++++++++++++++++++++++-
>  hw/block/trace-events |  18 +-
>  5 files changed, 1209 insertions(+), 15 deletions(-)
>=20
> diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> index 2d9cd29d07..d2631ff5a3 100644
> --- a/hw/block/nvme-ns.h
> +++ b/hw/block/nvme-ns.h
> @@ -19,9 +19,20 @@
>  #define NVME_NS(obj) \
>      OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
> =20
> +typedef struct NvmeZone {
> +    NvmeZoneDescr   d;
> +    uint64_t        w_ptr;
> +    QTAILQ_ENTRY(NvmeZone) entry;
> +} NvmeZone;
> +
>  typedef struct NvmeNamespaceParams {
>      uint32_t nsid;
>      QemuUUID uuid;
> +
> +    bool     zoned;
> +    bool     cross_zone_read;
> +    uint64_t zone_size_bs;
> +    uint64_t zone_cap_bs;
>  } NvmeNamespaceParams;
> =20
>  typedef struct NvmeNamespace {
> @@ -34,6 +45,18 @@ typedef struct NvmeNamespace {
>      bool         attached;
>      uint8_t      csi;
> =20
> +    NvmeIdNsZoned   *id_ns_zoned;
> +    NvmeZone        *zone_array;
> +    QTAILQ_HEAD(, NvmeZone) exp_open_zones;
> +    QTAILQ_HEAD(, NvmeZone) imp_open_zones;
> +    QTAILQ_HEAD(, NvmeZone) closed_zones;
> +    QTAILQ_HEAD(, NvmeZone) full_zones;
> +    uint32_t        num_zones;
> +    uint64_t        zone_size;
> +    uint64_t        zone_capacity;
> +    uint64_t        zone_array_size;
> +    uint32_t        zone_size_log2;
> +
>      NvmeNamespaceParams params;
>  } NvmeNamespace;
> =20
> @@ -71,8 +94,39 @@ static inline size_t nvme_l2b(NvmeNamespace *ns, uint6=
4_t lba)
> =20
>  typedef struct NvmeCtrl NvmeCtrl;
> =20
> +static inline uint8_t nvme_get_zone_state(NvmeZone *zone)

This can (should?) return the NvmeZoneState enum.

> +{
> +    return zone->d.zs >> 4;
> +}
> +
> +static inline void nvme_set_zone_state(NvmeZone *zone, enum NvmeZoneStat=
e state)
> +{
> +    zone->d.zs =3D state << 4;
> +}
> +
> +static inline uint64_t nvme_zone_rd_boundary(NvmeNamespace *ns, NvmeZone=
 *zone)
> +{
> +    return zone->d.zslba + ns->zone_size;
> +}
> +
> +static inline uint64_t nvme_zone_wr_boundary(NvmeZone *zone)
> +{
> +    return zone->d.zslba + zone->d.zcap;
> +}
> +
> +static inline bool nvme_wp_is_valid(NvmeZone *zone)
> +{
> +    uint8_t st =3D nvme_get_zone_state(zone);
> +
> +    return st !=3D NVME_ZONE_STATE_FULL &&
> +           st !=3D NVME_ZONE_STATE_READ_ONLY &&
> +           st !=3D NVME_ZONE_STATE_OFFLINE;
> +}
> +
>  int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
>  void nvme_ns_drain(NvmeNamespace *ns);
>  void nvme_ns_flush(NvmeNamespace *ns);
> +void nvme_ns_shutdown(NvmeNamespace *ns);
> +void nvme_ns_cleanup(NvmeNamespace *ns);
> =20
>  #endif /* NVME_NS_H */
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index e080a2318a..4cb0615128 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -6,6 +6,9 @@
> =20
>  #define NVME_MAX_NAMESPACES 256
> =20
> +#define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
> +#define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
> +
>  typedef struct NvmeParams {
>      char     *serial;
>      uint32_t num_queues; /* deprecated since 5.1 */
> @@ -16,6 +19,7 @@ typedef struct NvmeParams {
>      uint32_t aer_max_queued;
>      uint8_t  mdts;
>      bool     use_intel_id;
> +    uint32_t zasl_bs;
>  } NvmeParams;
> =20
>  typedef struct NvmeAsyncEvent {
> @@ -28,6 +32,8 @@ typedef struct NvmeRequest {
>      struct NvmeNamespace    *ns;
>      BlockAIOCB              *aiocb;
>      uint16_t                status;
> +    uint64_t                fill_off;
> +    uint32_t                fill_len;
>      NvmeCqe                 cqe;
>      NvmeCmd                 cmd;
>      BlockAcctCookie         acct;
> @@ -147,6 +153,8 @@ typedef struct NvmeCtrl {
>      QTAILQ_HEAD(, NvmeAsyncEvent) aer_queue;
>      int         aer_queued;
> =20
> +    uint8_t     zasl;
> +
>      NvmeNamespace   namespace;
>      NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
>      NvmeSQueue      **sq;
> diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> index e191ef9be0..e6db7f7d3b 100644
> --- a/hw/block/nvme-ns.c
> +++ b/hw/block/nvme-ns.c
> @@ -25,6 +25,7 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-core.h"
> =20
> +#include "trace.h"
>  #include "nvme.h"
>  #include "nvme-ns.h"
> =20
> @@ -77,6 +78,151 @@ static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespac=
e *ns, Error **errp)
>      return 0;
>  }
> =20
> +static int nvme_calc_zone_geometry(NvmeNamespace *ns, Error **errp)

Maybe rename to nvme_ns_zoned_calc_geometry() to better align with
function naming in this file?

> +{
> +    uint64_t zone_size, zone_cap;
> +    uint32_t nz, lbasz =3D ns->blkconf.logical_block_size;
> +
> +    if (ns->params.zone_size_bs) {
> +        zone_size =3D ns->params.zone_size_bs;
> +    } else {
> +        zone_size =3D NVME_DEFAULT_ZONE_SIZE;
> +    }
> +    if (ns->params.zone_cap_bs) {
> +        zone_cap =3D ns->params.zone_cap_bs;
> +    } else {
> +        zone_cap =3D zone_size;
> +    }
> +    if (zone_cap > zone_size) {
> +        error_setg(errp, "zone capacity %luB exceeds zone size %luB",
> +                   zone_cap, zone_size);
> +        return -1;
> +    }
> +    if (zone_size < lbasz) {
> +        error_setg(errp, "zone size %luB too small, must be at least %uB=
",
> +                   zone_size, lbasz);
> +        return -1;
> +    }
> +    if (zone_cap < lbasz) {
> +        error_setg(errp, "zone capacity %luB too small, must be at least=
 %uB",
> +                   zone_cap, lbasz);
> +        return -1;
> +    }

These checks can be done pretty early, I suggest moving them to
nvme_ns_check_constraints().

> +    ns->zone_size =3D zone_size / lbasz;
> +    ns->zone_capacity =3D zone_cap / lbasz;
> +
> +    nz =3D DIV_ROUND_UP(ns->size / lbasz, ns->zone_size);

Rounding up? This looks wrong. That would at least require the zone
capacity of the last zone to be smaller and you are not doing that below
in nvme_init_zone_state. You would also need to allow reads in the
ZCAP/ZSZE gap and since your nvme_zone_rd_boundary() would say thumbs up
for the read in that gap on the last zone, you end up issuing I/O out of
bounds of the underlying block device.

> +    ns->num_zones =3D nz;
> +    ns->zone_array_size =3D sizeof(NvmeZone) * nz;
> +    ns->zone_size_log2 =3D 0;
> +    if (is_power_of_2(ns->zone_size)) {
> +        ns->zone_size_log2 =3D 63 - clz64(ns->zone_size);
> +    }
> +
> +    return 0;
> +}
> +
> +static void nvme_init_zone_state(NvmeNamespace *ns)

Maybe rename to nvme_ns_zoned_init_state()?

> +{
> +    uint64_t start =3D 0, zone_size =3D ns->zone_size;
> +    uint64_t capacity =3D ns->num_zones * zone_size;
> +    NvmeZone *zone;
> +    int i;
> +
> +    ns->zone_array =3D g_malloc0(ns->zone_array_size);

Just do g_new0_n(ns->num_zones, NvmeZone) and we can get rid of the
zone_array_size member (not used anywhere else).

> +
> +    QTAILQ_INIT(&ns->exp_open_zones);
> +    QTAILQ_INIT(&ns->imp_open_zones);
> +    QTAILQ_INIT(&ns->closed_zones);
> +    QTAILQ_INIT(&ns->full_zones);
> +
> +    zone =3D ns->zone_array;
> +    for (i =3D 0; i < ns->num_zones; i++, zone++) {
> +        if (start + zone_size > capacity) {
> +            zone_size =3D capacity - start;
> +        }
> +        zone->d.zt =3D NVME_ZONE_TYPE_SEQ_WRITE;
> +        nvme_set_zone_state(zone, NVME_ZONE_STATE_EMPTY);
> +        zone->d.za =3D 0;
> +        zone->d.zcap =3D ns->zone_capacity;
> +        zone->d.zslba =3D start;
> +        zone->d.wp =3D start;
> +        zone->w_ptr =3D start;
> +        start +=3D zone_size;
> +    }
> +}
> +
> +static int nvme_zoned_init_ns(NvmeCtrl *n, NvmeNamespace *ns, int lba_in=
dex,

Maybe rename to nvme_ns_init_zoned()?

> +                              Error **errp)
> +{
> +    NvmeIdNsZoned *id_ns_z;
> +
> +    if (nvme_calc_zone_geometry(ns, errp) !=3D 0) {
> +        return -1;
> +    }
> +
> +    nvme_init_zone_state(ns);
> +
> +    id_ns_z =3D g_malloc0(sizeof(NvmeIdNsZoned));
> +
> +    /* MAR/MOR are zeroes-based, 0xffffffff means no limit */
> +    id_ns_z->mar =3D 0xffffffff;
> +    id_ns_z->mor =3D 0xffffffff;
> +    id_ns_z->zoc =3D 0;
> +    id_ns_z->ozcs =3D ns->params.cross_zone_read ? 0x01 : 0x00;
> +
> +    id_ns_z->lbafe[lba_index].zsze =3D cpu_to_le64(ns->zone_size);
> +    id_ns_z->lbafe[lba_index].zdes =3D 0;
> +
> +    ns->csi =3D NVME_CSI_ZONED;
> +    ns->id_ns.nsze =3D cpu_to_le64(ns->zone_size * ns->num_zones);
> +    ns->id_ns.ncap =3D cpu_to_le64(ns->zone_capacity * ns->num_zones);
> +    ns->id_ns.nuse =3D ns->id_ns.ncap;

If NSZE !=3D NCAP, then THINP must be set in NSFEAT and NUSE must track
the number of allocated blocks. Since we do not do that, keep it simple
and do nuse =3D ncap =3D nsze.

> +
> +    ns->id_ns_zoned =3D id_ns_z;
> +
> +    return 0;
> +}
> +
> +static void nvme_clear_zone(NvmeNamespace *ns, NvmeZone *zone)
> +{
> +    uint8_t state;
> +
> +    zone->w_ptr =3D zone->d.wp;
> +    state =3D nvme_get_zone_state(zone);
> +    if (zone->d.wp !=3D zone->d.zslba) {
> +        if (state !=3D NVME_ZONE_STATE_CLOSED) {
> +            trace_pci_nvme_clear_ns_close(state, zone->d.zslba);
> +            nvme_set_zone_state(zone, NVME_ZONE_STATE_CLOSED);
> +        }
> +        QTAILQ_INSERT_HEAD(&ns->closed_zones, zone, entry);
> +    } else {
> +        trace_pci_nvme_clear_ns_reset(state, zone->d.zslba);
> +        nvme_set_zone_state(zone, NVME_ZONE_STATE_EMPTY);
> +    }
> +}
> +
> +/*
> + * Close all the zones that are currently open.
> + */
> +static void nvme_zoned_ns_shutdown(NvmeNamespace *ns)
> +{
> +    NvmeZone *zone, *next;
> +
> +    QTAILQ_FOREACH_SAFE(zone, &ns->closed_zones, entry, next) {
> +        QTAILQ_REMOVE(&ns->closed_zones, zone, entry);
> +        nvme_clear_zone(ns, zone);
> +    }
> +    QTAILQ_FOREACH_SAFE(zone, &ns->imp_open_zones, entry, next) {
> +        QTAILQ_REMOVE(&ns->imp_open_zones, zone, entry);
> +        nvme_clear_zone(ns, zone);
> +    }
> +    QTAILQ_FOREACH_SAFE(zone, &ns->exp_open_zones, entry, next) {
> +        QTAILQ_REMOVE(&ns->exp_open_zones, zone, entry);
> +        nvme_clear_zone(ns, zone);
> +    }
> +}
> +
>  static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
>  {
>      if (!ns->blkconf.blk) {
> @@ -98,6 +244,12 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Err=
or **errp)
>      }
> =20
>      nvme_ns_init(ns);
> +    if (ns->params.zoned) {
> +        if (nvme_zoned_init_ns(n, ns, 0, errp) !=3D 0) {
> +            return -1;
> +        }
> +    }
> +
>      if (nvme_register_namespace(n, ns, errp)) {
>          return -1;
>      }
> @@ -115,6 +267,21 @@ void nvme_ns_flush(NvmeNamespace *ns)
>      blk_flush(ns->blkconf.blk);
>  }
> =20
> +void nvme_ns_shutdown(NvmeNamespace *ns)
> +{
> +    if (ns->params.zoned) {
> +        nvme_zoned_ns_shutdown(ns);
> +    }
> +}
> +
> +void nvme_ns_cleanup(NvmeNamespace *ns)
> +{
> +    if (ns->params.zoned) {
> +        g_free(ns->id_ns_zoned);
> +        g_free(ns->zone_array);
> +    }
> +}
> +
>  static void nvme_ns_realize(DeviceState *dev, Error **errp)
>  {
>      NvmeNamespace *ns =3D NVME_NS(dev);
> @@ -133,6 +300,12 @@ static Property nvme_ns_props[] =3D {
>      DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
>      DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
>      DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
> +    DEFINE_PROP_BOOL("zoned", NvmeNamespace, params.zoned, false),

I disagree on this. Using the "magic" value ensures that only one
command set can be selected. We can do a custom property so we can set
`iocs=3Dzoned` as well as `iocs=3D0x2` if that makes it more user friendly?

> +    DEFINE_PROP_SIZE("zoned.zsze", NvmeNamespace, params.zone_size_bs,
> +                     NVME_DEFAULT_ZONE_SIZE),
> +    DEFINE_PROP_SIZE("zoned.zcap", NvmeNamespace, params.zone_cap_bs, 0),
> +    DEFINE_PROP_BOOL("zoned.cross_read", NvmeNamespace,
> +                     params.cross_zone_read, false),

Same reason why I think we should just expose ozcs directly instead of
adding more parameters.

We are already adding a bunch of new parameters - might as well keep the
number as low as possible.

>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 7495cdb5ef..3999d65aab 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -133,6 +133,16 @@ static const uint32_t nvme_cse_iocs_nvm[256] =3D {
>      [NVME_CMD_READ]                 =3D NVME_CMD_EFF_CSUPP,
>  };
> =20
> +static const uint32_t nvme_cse_iocs_zoned[256] =3D {
> +    [NVME_CMD_FLUSH]                =3D NVME_CMD_EFF_CSUPP | NVME_CMD_EF=
F_LBCC,
> +    [NVME_CMD_WRITE_ZEROES]         =3D NVME_CMD_EFF_CSUPP | NVME_CMD_EF=
F_LBCC,
> +    [NVME_CMD_WRITE]                =3D NVME_CMD_EFF_CSUPP | NVME_CMD_EF=
F_LBCC,
> +    [NVME_CMD_READ]                 =3D NVME_CMD_EFF_CSUPP,
> +    [NVME_CMD_ZONE_APPEND]          =3D NVME_CMD_EFF_CSUPP | NVME_CMD_EF=
F_LBCC,
> +    [NVME_CMD_ZONE_MGMT_SEND]       =3D NVME_CMD_EFF_CSUPP,

I guess Zone Management Send should have LBCC due to Reset Zone.

> +    [NVME_CMD_ZONE_MGMT_RECV]       =3D NVME_CMD_EFF_CSUPP,
> +};
> +
>  static void nvme_process_sq(void *opaque);
> =20
>  static uint16_t nvme_cid(NvmeRequest *req)
> @@ -149,6 +159,46 @@ static uint16_t nvme_sqid(NvmeRequest *req)
>      return le16_to_cpu(req->sq->sqid);
>  }
> =20
> +static void nvme_assign_zone_state(NvmeNamespace *ns, NvmeZone *zone,
> +                                   uint8_t state)
> +{
> +    if (QTAILQ_IN_USE(zone, entry)) {
> +        switch (nvme_get_zone_state(zone)) {
> +        case NVME_ZONE_STATE_EXPLICITLY_OPEN:
> +            QTAILQ_REMOVE(&ns->exp_open_zones, zone, entry);
> +            break;
> +        case NVME_ZONE_STATE_IMPLICITLY_OPEN:
> +            QTAILQ_REMOVE(&ns->imp_open_zones, zone, entry);
> +            break;
> +        case NVME_ZONE_STATE_CLOSED:
> +            QTAILQ_REMOVE(&ns->closed_zones, zone, entry);
> +            break;
> +        case NVME_ZONE_STATE_FULL:
> +            QTAILQ_REMOVE(&ns->full_zones, zone, entry);
> +        }
> +    }
> +
> +    nvme_set_zone_state(zone, state);
> +
> +    switch (state) {
> +    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
> +        QTAILQ_INSERT_TAIL(&ns->exp_open_zones, zone, entry);
> +        break;
> +    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
> +        QTAILQ_INSERT_TAIL(&ns->imp_open_zones, zone, entry);
> +        break;
> +    case NVME_ZONE_STATE_CLOSED:
> +        QTAILQ_INSERT_TAIL(&ns->closed_zones, zone, entry);
> +        break;
> +    case NVME_ZONE_STATE_FULL:
> +        QTAILQ_INSERT_TAIL(&ns->full_zones, zone, entry);
> +    case NVME_ZONE_STATE_READ_ONLY:
> +        break;
> +    default:
> +        zone->d.za =3D 0;
> +    }
> +}
> +
>  static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
>  {
>      hwaddr low =3D n->ctrl_mem.addr;
> @@ -900,6 +950,319 @@ static inline uint16_t nvme_check_bounds(NvmeCtrl *=
n, NvmeNamespace *ns,
>      return NVME_SUCCESS;
>  }
> =20
> +static void nvme_fill_read_data(NvmeRequest *req, uint64_t offset,
> +                                uint32_t max_len)
> +{
> +    QEMUSGList *qsg =3D &req->qsg;
> +    QEMUIOVector *iov =3D &req->iov;
> +    ScatterGatherEntry *entry;
> +    uint32_t len, ent_len;
> +
> +    if (qsg->nsg > 0) {
> +        entry =3D qsg->sg;
> +        len =3D qsg->size;
> +        if (max_len) {
> +            len =3D MIN(len, max_len);
> +        }
> +        for (; len > 0; len -=3D ent_len) {
> +            ent_len =3D MIN(len, entry->len);
> +            if (offset > ent_len) {
> +                offset -=3D ent_len;
> +            } else if (offset !=3D 0) {
> +                dma_memory_set(qsg->as, entry->base + offset,
> +                               0, ent_len - offset);
> +                offset =3D 0;
> +            } else {
> +                dma_memory_set(qsg->as, entry->base, 0, ent_len);
> +            }
> +            entry++;
> +        }
> +    } else if (iov->iov) {
> +        len =3D iov_size(iov->iov, iov->niov);
> +        if (max_len) {
> +            len =3D MIN(len, max_len);
> +        }
> +        qemu_iovec_memset(iov, offset, 0, len - offset);
> +    }
> +}
> +
> +static inline uint32_t nvme_zone_idx(NvmeNamespace *ns, uint64_t slba)
> +{
> +    return ns->zone_size_log2 > 0 ? slba >> ns->zone_size_log2 :
> +                                    slba / ns->zone_size;
> +}
> +
> +static inline NvmeZone *nvme_get_zone_by_slba(NvmeNamespace *ns, uint64_=
t slba)
> +{
> +    uint32_t zone_idx =3D nvme_zone_idx(ns, slba);
> +
> +    assert(zone_idx < ns->num_zones);
> +    return &ns->zone_array[zone_idx];
> +}
> +
> +static uint16_t nvme_zone_state_ok_to_write(NvmeZone *zone)

Slightly wierd naming since it is not returning a bool. But I'm
bikeshedding.

> +{
> +    uint16_t status;
> +
> +    switch (nvme_get_zone_state(zone)) {
> +    case NVME_ZONE_STATE_EMPTY:
> +    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
> +    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
> +    case NVME_ZONE_STATE_CLOSED:
> +        status =3D NVME_SUCCESS;
> +        break;
> +    case NVME_ZONE_STATE_FULL:
> +        status =3D NVME_ZONE_FULL;
> +        break;
> +    case NVME_ZONE_STATE_OFFLINE:
> +        status =3D NVME_ZONE_OFFLINE;
> +        break;
> +    case NVME_ZONE_STATE_READ_ONLY:
> +        status =3D NVME_ZONE_READ_ONLY;
> +        break;
> +    default:
> +        assert(false);
> +    }
> +
> +    return status;
> +}
> +
> +static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *ns,
> +                                      NvmeZone *zone, uint64_t slba,
> +                                      uint32_t nlb, bool append)
> +{
> +    uint16_t status;
> +
> +    if (unlikely((slba + nlb) > nvme_zone_wr_boundary(zone))) {
> +        status =3D NVME_ZONE_BOUNDARY_ERROR;
> +    } else {
> +        status =3D nvme_zone_state_ok_to_write(zone);
> +    }
> +
> +    if (status !=3D NVME_SUCCESS) {
> +        trace_pci_nvme_err_zone_write_not_ok(slba, nlb, status);
> +    } else {
> +        assert(nvme_wp_is_valid(zone));
> +        if (append) {
> +            if (unlikely(slba !=3D zone->d.zslba)) {
> +                trace_pci_nvme_err_append_not_at_start(slba, zone->d.zsl=
ba);
> +                status =3D NVME_ZONE_INVALID_WRITE;
> +            }
> +            if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
> +                trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
> +                status =3D NVME_INVALID_FIELD;
> +            }
> +        } else if (unlikely(slba !=3D zone->w_ptr)) {
> +            trace_pci_nvme_err_write_not_at_wp(slba, zone->d.zslba,
> +                                               zone->w_ptr);
> +            status =3D NVME_ZONE_INVALID_WRITE;
> +        }
> +    }
> +
> +    return status;
> +}
> +
> +static uint16_t nvme_zone_state_ok_to_read(NvmeZone *zone)

Same. Maybe change name?

> +{
> +    uint16_t status;
> +
> +    switch (nvme_get_zone_state(zone)) {
> +    case NVME_ZONE_STATE_EMPTY:
> +    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
> +    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
> +    case NVME_ZONE_STATE_FULL:
> +    case NVME_ZONE_STATE_CLOSED:
> +    case NVME_ZONE_STATE_READ_ONLY:
> +        status =3D NVME_SUCCESS;
> +        break;
> +    case NVME_ZONE_STATE_OFFLINE:
> +        status =3D NVME_ZONE_OFFLINE | NVME_DNR;

Inconsistent use of NVME_DNR here. I think DNR should be set higher in
the call stack.

> +        break;
> +    default:
> +        assert(false);
> +    }
> +
> +    return status;
> +}

> +
> +typedef struct NvmeReadFillCtx {
> +    uint64_t  pre_rd_fill_slba;
> +    uint64_t  read_slba;
> +    uint64_t  post_rd_fill_slba;
> +
> +    uint32_t  pre_rd_fill_nlb;
> +    uint32_t  read_nlb;
> +    uint32_t  post_rd_fill_nlb;
> +} NvmeReadFillCtx;
> +
> +static uint16_t nvme_check_zone_read(NvmeNamespace *ns, uint64_t slba,
> +                                     uint32_t nlb, NvmeReadFillCtx *rfc)
> +{
> +    NvmeZone *zone =3D nvme_get_zone_by_slba(ns, slba);
> +    NvmeZone *next_zone;
> +    uint64_t bndry =3D nvme_zone_rd_boundary(ns, zone);
> +    uint64_t end =3D slba + nlb, wp1, wp2;
> +    uint16_t status;
> +
> +    rfc->read_slba =3D slba;
> +    rfc->read_nlb =3D nlb;
> +
> +    status =3D nvme_zone_state_ok_to_read(zone);
> +    if (status !=3D NVME_SUCCESS) {
> +        ;
> +    } else if (likely(end <=3D bndry)) {
> +        if (end > zone->w_ptr) {
> +            wp1 =3D zone->w_ptr;
> +            if (slba >=3D wp1) {
> +                /* No i/o necessary, just fill */
> +                rfc->pre_rd_fill_slba =3D slba;
> +                rfc->pre_rd_fill_nlb =3D nlb;
> +                rfc->read_nlb =3D 0;
> +            } else {
> +                rfc->read_nlb =3D wp1 - slba;
> +                rfc->post_rd_fill_slba =3D wp1;
> +                rfc->post_rd_fill_nlb =3D nlb - rfc->read_nlb;
> +           }
> +        }
> +    } else if (!ns->params.cross_zone_read) {
> +        status =3D NVME_ZONE_BOUNDARY_ERROR;
> +    } else {
> +        /*
> +         * Read across zone boundary - look at the next zone.
> +         * Earlier bounds checks ensure that the current zone
> +         * is not the last one.
> +         */
> +        next_zone =3D zone + 1;
> +        status =3D nvme_zone_state_ok_to_read(next_zone);
> +        if (status !=3D NVME_SUCCESS) {
> +            ;
> +        } else if (end > nvme_zone_rd_boundary(ns, next_zone)) {
> +            /*
> +             * As zone size is much larger than a typical maximum
> +             * i/o size in real hardware, only allow the i/o range
> +             * to span no more than one pair of zones.
> +             */
> +            status =3D NVME_ZONE_BOUNDARY_ERROR;
> +        } else {
> +            wp1 =3D zone->w_ptr;
> +            wp2 =3D next_zone->w_ptr;
> +            if (wp2 =3D=3D bndry) {
> +                if (slba >=3D wp1) {
> +                    /* Again, no i/o necessary, just fill */
> +                    rfc->pre_rd_fill_slba =3D slba;
> +                    rfc->pre_rd_fill_nlb =3D nlb;
> +                    rfc->read_nlb =3D 0;
> +                } else {
> +                    rfc->read_nlb =3D wp1 - slba;
> +                    rfc->post_rd_fill_slba =3D wp1;
> +                    rfc->post_rd_fill_nlb =3D nlb - rfc->read_nlb;
> +                }
> +            } else if (slba < wp1) {
> +                if (end > wp2) {
> +                    if (wp1 =3D=3D bndry) {
> +                        rfc->post_rd_fill_slba =3D wp2;
> +                        rfc->post_rd_fill_nlb =3D end - wp2;
> +                        rfc->read_nlb =3D wp2 - slba;
> +                    } else {
> +                        rfc->pre_rd_fill_slba =3D wp2;
> +                        rfc->pre_rd_fill_nlb =3D end - wp2;
> +                        rfc->read_nlb =3D wp2 - slba;
> +                        rfc->post_rd_fill_slba =3D wp1;
> +                        rfc->post_rd_fill_nlb =3D bndry - wp1;
> +                    }
> +                } else {
> +                    rfc->post_rd_fill_slba =3D wp1;
> +                    rfc->post_rd_fill_nlb =3D bndry - wp1;
> +                }
> +            } else {
> +                if (end > wp2) {
> +                    rfc->pre_rd_fill_slba =3D slba;
> +                    rfc->pre_rd_fill_nlb =3D end - slba;
> +                    rfc->read_slba =3D bndry;
> +                    rfc->read_nlb =3D wp2 - bndry;
> +                } else {
> +                    rfc->read_slba =3D bndry;
> +                    rfc->read_nlb =3D end - bndry;
> +                    rfc->post_rd_fill_slba =3D slba;
> +                    rfc->post_rd_fill_nlb =3D bndry - slba;
> +                }
> +            }
> +        }
> +    }

Bypassing the block layer and just filling from memory obviously has a
performance benefit, I won't argue with that. But I don't think it's
worth the code, extra members in the NvmeRequest, or the slightly
arbitrary "cannot cross more than two zones" restriction it puts on
reads (however reasonable that restriction may be).

This is an optimization that only benefits the zoned read path and the
only use of this optimization is when a read is "accidentally" directed
towards unwritten parts of the zone or in the ZCAP/ZSZE gap, like when
the OS is booting.

I think we should just rely on the block layer here.

> +
> +    return status;
> +}
> +
> +static bool nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *re=
q,
> +                                      bool failed)
> +{
> +    NvmeRwCmd *rw =3D (NvmeRwCmd *)&req->cmd;
> +    NvmeZone *zone;
> +    NvmeZonedResult *res =3D (NvmeZonedResult *)&req->cqe;
> +    uint64_t slba, start_wp =3D res->slba;
> +    uint32_t nlb;
> +
> +    if (rw->opcode !=3D NVME_CMD_WRITE &&
> +        rw->opcode !=3D NVME_CMD_ZONE_APPEND &&
> +        rw->opcode !=3D NVME_CMD_WRITE_ZEROES) {
> +        return false;
> +    }

I don't think nvme_finalize_zoned_write should ever be called if the
command is not a write, so this check should maybe be moved up the
stack.

> +
> +    slba =3D le64_to_cpu(rw->slba);
> +    nlb =3D le16_to_cpu(rw->nlb) + 1;
> +    zone =3D nvme_get_zone_by_slba(ns, slba);
> +
> +    if (!failed && zone->w_ptr < start_wp + nlb) {
> +        /*
> +         * A preceding queued write to the zone has failed,
> +         * now this write is not at the WP, fail it too.
> +         */
> +        failed =3D true;
> +    }

This is dead code since you are never subtracting from zone->w_ptr. This
also means that failed will never be set to true and cause the function
to always return false.

> +
> +    if (failed) {
> +        res->slba =3D 0;

Looks like you followed my advise of just always advancing the write
pointer on failed write. But that includes advancing zone->d.wp so the
write pointer is still messed up now since it will lose the advancement
by nlb.

> +    } else if (zone->w_ptr =3D=3D nvme_zone_wr_boundary(zone)) {
> +        switch (nvme_get_zone_state(zone)) {
> +        case NVME_ZONE_STATE_IMPLICITLY_OPEN:
> +        case NVME_ZONE_STATE_EXPLICITLY_OPEN:
> +        case NVME_ZONE_STATE_CLOSED:
> +        case NVME_ZONE_STATE_EMPTY:
> +            nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_FULL);
> +            /* fall through */
> +        case NVME_ZONE_STATE_FULL:
> +            break;
> +        default:
> +            assert(false);
> +        }
> +        zone->d.wp =3D zone->w_ptr;
> +    } else {
> +        zone->d.wp +=3D nlb;
> +    }
> +
> +    return failed;
> +}
> +
> +static uint64_t nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
> +                                     uint32_t nlb)
> +{
> +    uint64_t result =3D zone->w_ptr;
> +    uint8_t zs;
> +
> +    zone->w_ptr +=3D nlb;
> +
> +    if (zone->w_ptr < nvme_zone_wr_boundary(zone)) {
> +        zs =3D nvme_get_zone_state(zone);
> +        switch (zs) {
> +        case NVME_ZONE_STATE_EMPTY:
> +        case NVME_ZONE_STATE_CLOSED:
> +            nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_IMPLICITLY_=
OPEN);
> +        }
> +    }
> +
> +    return result;
> +}
> +
>  static void nvme_rw_cb(void *opaque, int ret)
>  {
>      NvmeRequest *req =3D opaque;
> @@ -914,10 +1277,26 @@ static void nvme_rw_cb(void *opaque, int ret)
>      trace_pci_nvme_rw_cb(nvme_cid(req), blk_name(blk));
> =20
>      if (!ret) {
> -        block_acct_done(stats, acct);
> +        if (ns->params.zoned) {
> +            if (nvme_finalize_zoned_write(ns, req, false)) {

Since nvme_finalize_zoned_write will always return false, this condition
is moot.

> +                ret =3D EIO;
> +                block_acct_failed(stats, acct);
> +                req->status =3D NVME_ZONE_INVALID_WRITE;
> +            } else if (req->fill_len) {
> +                nvme_fill_read_data(req, req->fill_off, req->fill_len);
> +                req->fill_len =3D 0;

This can also go away if we just rely on the block layer like I proposed
above.

> +            }
> +        }
> +        if (!ret) {
> +            block_acct_done(stats, acct);
> +        }
>      } else {
>          uint16_t status;
> =20
> +        if (ns->params.zoned) {
> +            nvme_finalize_zoned_write(ns, req, true);
> +        }
> +
>          block_acct_failed(stats, acct);
> =20
>          switch (req->cmd.opcode) {
> @@ -960,7 +1339,9 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *=
req)
>      uint64_t slba =3D le64_to_cpu(rw->slba);
>      uint32_t nlb =3D (uint32_t)le16_to_cpu(rw->nlb) + 1;
>      uint64_t data_size =3D nvme_l2b(ns, nlb);
> -    uint64_t data_offset;
> +    uint64_t data_offset, fill_off;
> +    uint32_t fill_len;
> +    NvmeReadFillCtx rfc =3D {};
>      BlockBackend *blk =3D ns->blkconf.blk;
>      uint16_t status;
> =20
> @@ -978,11 +1359,40 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest=
 *req)
>          goto invalid;
>      }
> =20
> +    if (ns->params.zoned) {
> +        status =3D nvme_check_zone_read(ns, slba, nlb, &rfc);
> +        if (status !=3D NVME_SUCCESS) {
> +            trace_pci_nvme_err_zone_read_not_ok(slba, nlb, status);
> +            goto invalid;
> +        }
> +    }
> +
>      status =3D nvme_map_dptr(n, data_size, req);
>      if (status) {
>          goto invalid;
>      }
> =20
> +    if (ns->params.zoned) {
> +        if (rfc.pre_rd_fill_nlb) {
> +            fill_off =3D nvme_l2b(ns, rfc.pre_rd_fill_slba - slba);
> +            fill_len =3D nvme_l2b(ns, rfc.pre_rd_fill_nlb);
> +            nvme_fill_read_data(req, fill_off, fill_len);
> +        }
> +        if (!rfc.read_nlb) {
> +            /* No backend I/O necessary, only needed to fill the buffer =
*/
> +            req->status =3D NVME_SUCCESS;
> +            return NVME_SUCCESS;
> +        }
> +        if (rfc.post_rd_fill_nlb) {
> +            req->fill_off =3D nvme_l2b(ns, rfc.post_rd_fill_slba - slba);
> +            req->fill_len =3D nvme_l2b(ns, rfc.post_rd_fill_nlb);
> +        } else {
> +            req->fill_len =3D 0;
> +        }
> +        slba =3D rfc.read_slba;
> +        data_size =3D nvme_l2b(ns, rfc.read_nlb);
> +    }
> +
>      data_offset =3D nvme_l2b(ns, slba);
> =20
>      block_acct_start(blk_get_stats(blk), &req->acct, data_size,
> @@ -1001,7 +1411,7 @@ invalid:
>      return status | NVME_DNR;
>  }
> =20
> -static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req, bool wrz)
> +static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest *req, bool append, b=
ool wrz)
>  {
>      NvmeRwCmd *rw =3D (NvmeRwCmd *)&req->cmd;
>      NvmeNamespace *ns =3D req->ns;
> @@ -1009,6 +1419,8 @@ static uint16_t nvme_write(NvmeCtrl *n, NvmeRequest=
 *req, bool wrz)
>      uint32_t nlb =3D (uint32_t)le16_to_cpu(rw->nlb) + 1;
>      uint64_t data_size =3D nvme_l2b(ns, nlb);
>      uint64_t data_offset;
> +    NvmeZone *zone;
> +    NvmeZonedResult *res =3D (NvmeZonedResult *)&req->cqe;
>      BlockBackend *blk =3D ns->blkconf.blk;
>      uint16_t status;
> =20
> @@ -1029,6 +1441,25 @@ static uint16_t nvme_write(NvmeCtrl *n, NvmeReques=
t *req, bool wrz)
>          goto invalid;
>      }
> =20
> +    if (ns->params.zoned) {
> +        zone =3D nvme_get_zone_by_slba(ns, slba);
> +
> +        status =3D nvme_check_zone_write(n, ns, zone, slba, nlb, append);
> +        if (status !=3D NVME_SUCCESS) {
> +            goto invalid;
> +        }
> +
> +        if (append) {
> +            slba =3D zone->w_ptr;
> +        }
> +
> +        res->slba =3D nvme_advance_zone_wp(ns, zone, nlb);
> +    } else if (append) {
> +        trace_pci_nvme_err_invalid_opc(rw->opcode);
> +        status =3D NVME_INVALID_OPCODE;
> +        goto invalid;
> +    }
> +
>      data_offset =3D nvme_l2b(ns, slba);
> =20
>      if (!wrz) {
> @@ -1059,6 +1490,435 @@ invalid:
>      return status | NVME_DNR;
>  }
> =20
> +static uint16_t nvme_get_mgmt_zone_slba_idx(NvmeNamespace *ns, NvmeCmd *=
c,
> +                                            uint64_t *slba, uint32_t *zo=
ne_idx)
> +{
> +    uint32_t dw10 =3D le32_to_cpu(c->cdw10);
> +    uint32_t dw11 =3D le32_to_cpu(c->cdw11);
> +
> +    if (!ns->params.zoned) {
> +        trace_pci_nvme_err_invalid_opc(c->opcode);
> +        return NVME_INVALID_OPCODE | NVME_DNR;
> +    }
> +
> +    *slba =3D ((uint64_t)dw11) << 32 | dw10;
> +    if (unlikely(*slba >=3D ns->id_ns.nsze)) {
> +        trace_pci_nvme_err_invalid_lba_range(*slba, 0, ns->id_ns.nsze);
> +        *slba =3D 0;
> +        return NVME_LBA_RANGE | NVME_DNR;
> +    }
> +
> +    *zone_idx =3D nvme_zone_idx(ns, *slba);
> +    assert(*zone_idx < ns->num_zones);
> +
> +    return NVME_SUCCESS;
> +}
> +
> +typedef uint16_t (*op_handler_t)(NvmeNamespace *, NvmeZone *,
> +                                 uint8_t);
> +
> +enum NvmeZoneProcessingMask {
> +    NVME_PROC_CURRENT_ZONE    =3D 0,
> +    NVME_PROC_IMP_OPEN_ZONES  =3D 1 << 0,
> +    NVME_PROC_EXP_OPEN_ZONES  =3D 1 << 1,
> +    NVME_PROC_CLOSED_ZONES    =3D 1 << 2,
> +    NVME_PROC_READ_ONLY_ZONES =3D 1 << 3,
> +    NVME_PROC_FULL_ZONES      =3D 1 << 4,
> +};
> +
> +static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
> +                               uint8_t state)
> +{
> +    switch (state) {
> +    case NVME_ZONE_STATE_EMPTY:
> +    case NVME_ZONE_STATE_CLOSED:
> +    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
> +        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EXPLICITLY_OPEN=
);
> +        /* fall through */
> +    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
> +        return NVME_SUCCESS;
> +    }
> +
> +    return NVME_ZONE_INVAL_TRANSITION;
> +}
> +
> +static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
> +                                uint8_t state)
> +{
> +    switch (state) {
> +    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
> +    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
> +        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
> +        /* fall through */
> +    case NVME_ZONE_STATE_CLOSED:
> +        return NVME_SUCCESS;
> +    }
> +
> +    return NVME_ZONE_INVAL_TRANSITION;
> +}
> +
> +static uint16_t nvme_finish_zone(NvmeNamespace *ns, NvmeZone *zone,
> +                                 uint8_t state)
> +{
> +    switch (state) {
> +    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
> +    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
> +    case NVME_ZONE_STATE_CLOSED:
> +    case NVME_ZONE_STATE_EMPTY:
> +        zone->w_ptr =3D nvme_zone_wr_boundary(zone);
> +        zone->d.wp =3D zone->w_ptr;
> +        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_FULL);
> +        /* fall through */
> +    case NVME_ZONE_STATE_FULL:
> +        return NVME_SUCCESS;
> +    }
> +
> +    return NVME_ZONE_INVAL_TRANSITION;
> +}
> +
> +static uint16_t nvme_reset_zone(NvmeNamespace *ns, NvmeZone *zone,
> +                                uint8_t state)
> +{
> +    switch (state) {
> +    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
> +    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
> +    case NVME_ZONE_STATE_CLOSED:
> +    case NVME_ZONE_STATE_FULL:
> +        zone->w_ptr =3D zone->d.zslba;
> +        zone->d.wp =3D zone->w_ptr;
> +        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EMPTY);
> +        /* fall through */
> +    case NVME_ZONE_STATE_EMPTY:
> +        return NVME_SUCCESS;
> +    }
> +
> +    return NVME_ZONE_INVAL_TRANSITION;
> +}
> +
> +static uint16_t nvme_offline_zone(NvmeNamespace *ns, NvmeZone *zone,
> +                                  uint8_t state)
> +{
> +    switch (state) {
> +    case NVME_ZONE_STATE_READ_ONLY:
> +        nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_OFFLINE);
> +        /* fall through */
> +    case NVME_ZONE_STATE_OFFLINE:
> +        return NVME_SUCCESS;
> +    }
> +
> +    return NVME_ZONE_INVAL_TRANSITION;
> +}
> +
> +static uint16_t nvme_bulk_proc_zone(NvmeNamespace *ns, NvmeZone *zone,
> +                                    enum NvmeZoneProcessingMask proc_mas=
k,
> +                                    op_handler_t op_hndlr)
> +{
> +    uint16_t status =3D NVME_SUCCESS;
> +    uint8_t zs =3D nvme_get_zone_state(zone);
> +    bool proc_zone =3D false;
> +
> +    switch (zs) {
> +    case NVME_ZONE_STATE_IMPLICITLY_OPEN:
> +        proc_zone =3D proc_mask & NVME_PROC_IMP_OPEN_ZONES;
> +        break;
> +    case NVME_ZONE_STATE_EXPLICITLY_OPEN:
> +        proc_zone =3D proc_mask & NVME_PROC_EXP_OPEN_ZONES;
> +        break;
> +    case NVME_ZONE_STATE_CLOSED:
> +        proc_zone =3D proc_mask & NVME_PROC_CLOSED_ZONES;
> +        break;
> +    case NVME_ZONE_STATE_READ_ONLY:
> +        proc_zone =3D proc_mask & NVME_PROC_READ_ONLY_ZONES;
> +        break;
> +    case NVME_ZONE_STATE_FULL:
> +        proc_zone =3D proc_mask & NVME_PROC_FULL_ZONES;
> +    }
> +
> +    if (proc_zone) {
> +        status =3D op_hndlr(ns, zone, zs);
> +    }
> +
> +    return status;
> +}
> +
> +static uint16_t nvme_do_zone_op(NvmeNamespace *ns, NvmeZone *zone,
> +                                enum NvmeZoneProcessingMask proc_mask,
> +                                op_handler_t op_hndlr)
> +{
> +    NvmeZone *next;
> +    uint16_t status =3D NVME_SUCCESS;
> +    int i;
> +
> +    if (!proc_mask) {
> +        status =3D op_hndlr(ns, zone, nvme_get_zone_state(zone));
> +    } else {
> +        if (proc_mask & NVME_PROC_CLOSED_ZONES) {
> +            QTAILQ_FOREACH_SAFE(zone, &ns->closed_zones, entry, next) {
> +                status =3D nvme_bulk_proc_zone(ns, zone, proc_mask, op_h=
ndlr);
> +                if (status !=3D NVME_SUCCESS) {
> +                    goto out;
> +                }
> +            }
> +        }
> +        if (proc_mask & NVME_PROC_IMP_OPEN_ZONES) {
> +            QTAILQ_FOREACH_SAFE(zone, &ns->imp_open_zones, entry, next) {
> +                status =3D nvme_bulk_proc_zone(ns, zone, proc_mask, op_h=
ndlr);
> +                if (status !=3D NVME_SUCCESS) {
> +                    goto out;
> +                }
> +            }
> +        }
> +        if (proc_mask & NVME_PROC_EXP_OPEN_ZONES) {
> +            QTAILQ_FOREACH_SAFE(zone, &ns->exp_open_zones, entry, next) {
> +                status =3D nvme_bulk_proc_zone(ns, zone, proc_mask, op_h=
ndlr);
> +                if (status !=3D NVME_SUCCESS) {
> +                    goto out;
> +                }
> +            }
> +        }
> +        if (proc_mask & NVME_PROC_FULL_ZONES) {
> +            QTAILQ_FOREACH_SAFE(zone, &ns->full_zones, entry, next) {
> +                status =3D nvme_bulk_proc_zone(ns, zone, proc_mask, op_h=
ndlr);
> +                if (status !=3D NVME_SUCCESS) {
> +                    goto out;
> +                }
> +            }
> +        }
> +
> +        if (proc_mask & NVME_PROC_READ_ONLY_ZONES) {
> +            for (i =3D 0; i < ns->num_zones; i++, zone++) {
> +                status =3D nvme_bulk_proc_zone(ns, zone, proc_mask, op_h=
ndlr);
> +                if (status !=3D NVME_SUCCESS) {
> +                    goto out;
> +                }
> +            }
> +        }
> +    }
> +
> +out:
> +    return status;
> +}
> +
> +static uint16_t nvme_zone_mgmt_send(NvmeCtrl *n, NvmeRequest *req)
> +{
> +    NvmeCmd *cmd =3D (NvmeCmd *)&req->cmd;
> +    NvmeNamespace *ns =3D req->ns;
> +    NvmeZone *zone;
> +    uint32_t dw13 =3D le32_to_cpu(cmd->cdw13);
> +    uint64_t slba =3D 0;
> +    uint32_t zone_idx =3D 0;
> +    uint16_t status;
> +    uint8_t action;
> +    bool all;
> +    enum NvmeZoneProcessingMask proc_mask =3D NVME_PROC_CURRENT_ZONE;
> +
> +    action =3D dw13 & 0xff;
> +    all =3D dw13 & 0x100;
> +
> +    req->status =3D NVME_SUCCESS;
> +
> +    if (!all) {
> +        status =3D nvme_get_mgmt_zone_slba_idx(ns, cmd, &slba, &zone_idx=
);
> +        if (status) {
> +            return status;
> +        }
> +    }
> +
> +    zone =3D &ns->zone_array[zone_idx];
> +    if (slba !=3D zone->d.zslba) {
> +        trace_pci_nvme_err_unaligned_zone_cmd(action, slba, zone->d.zslb=
a);
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    switch (action) {
> +
> +    case NVME_ZONE_ACTION_OPEN:
> +        if (all) {
> +            proc_mask =3D NVME_PROC_CLOSED_ZONES;
> +        }
> +        trace_pci_nvme_open_zone(slba, zone_idx, all);
> +        status =3D nvme_do_zone_op(ns, zone, proc_mask, nvme_open_zone);
> +        break;
> +
> +    case NVME_ZONE_ACTION_CLOSE:
> +        if (all) {
> +            proc_mask =3D NVME_PROC_IMP_OPEN_ZONES | NVME_PROC_EXP_OPEN_=
ZONES;
> +        }
> +        trace_pci_nvme_close_zone(slba, zone_idx, all);
> +        status =3D nvme_do_zone_op(ns, zone, proc_mask, nvme_close_zone);
> +        break;
> +
> +    case NVME_ZONE_ACTION_FINISH:
> +        if (all) {
> +            proc_mask =3D NVME_PROC_IMP_OPEN_ZONES | NVME_PROC_EXP_OPEN_=
ZONES |
> +                        NVME_PROC_CLOSED_ZONES;
> +        }
> +        trace_pci_nvme_finish_zone(slba, zone_idx, all);
> +        status =3D nvme_do_zone_op(ns, zone, proc_mask, nvme_finish_zone=
);
> +        break;
> +
> +    case NVME_ZONE_ACTION_RESET:
> +        if (all) {
> +            proc_mask =3D NVME_PROC_IMP_OPEN_ZONES | NVME_PROC_EXP_OPEN_=
ZONES |
> +                        NVME_PROC_CLOSED_ZONES | NVME_PROC_FULL_ZONES;
> +        }
> +        trace_pci_nvme_reset_zone(slba, zone_idx, all);
> +        status =3D nvme_do_zone_op(ns, zone, proc_mask, nvme_reset_zone);
> +        break;
> +
> +    case NVME_ZONE_ACTION_OFFLINE:
> +        if (all) {
> +            proc_mask =3D NVME_PROC_READ_ONLY_ZONES;
> +        }
> +        trace_pci_nvme_offline_zone(slba, zone_idx, all);
> +        status =3D nvme_do_zone_op(ns, zone, proc_mask, nvme_offline_zon=
e);
> +        break;
> +
> +    case NVME_ZONE_ACTION_SET_ZD_EXT:
> +        trace_pci_nvme_set_descriptor_extension(slba, zone_idx);
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +        break;
> +
> +    default:
> +        trace_pci_nvme_err_invalid_mgmt_action(action);
> +        status =3D NVME_INVALID_FIELD;
> +    }
> +
> +    if (status =3D=3D NVME_ZONE_INVAL_TRANSITION) {
> +        trace_pci_nvme_err_invalid_zone_state_transition(action, slba,
> +                                                         zone->d.za);
> +    }
> +    if (status) {
> +        status |=3D NVME_DNR;
> +    }
> +
> +    return status;
> +}
> +
> +static bool nvme_zone_matches_filter(uint32_t zafs, NvmeZone *zl)
> +{
> +    int zs =3D nvme_get_zone_state(zl);
> +
> +    switch (zafs) {
> +    case NVME_ZONE_REPORT_ALL:
> +        return true;
> +    case NVME_ZONE_REPORT_EMPTY:
> +        return zs =3D=3D NVME_ZONE_STATE_EMPTY;
> +    case NVME_ZONE_REPORT_IMPLICITLY_OPEN:
> +        return zs =3D=3D NVME_ZONE_STATE_IMPLICITLY_OPEN;
> +    case NVME_ZONE_REPORT_EXPLICITLY_OPEN:
> +        return zs =3D=3D NVME_ZONE_STATE_EXPLICITLY_OPEN;
> +    case NVME_ZONE_REPORT_CLOSED:
> +        return zs =3D=3D NVME_ZONE_STATE_CLOSED;
> +    case NVME_ZONE_REPORT_FULL:
> +        return zs =3D=3D NVME_ZONE_STATE_FULL;
> +    case NVME_ZONE_REPORT_READ_ONLY:
> +        return zs =3D=3D NVME_ZONE_STATE_READ_ONLY;
> +    case NVME_ZONE_REPORT_OFFLINE:
> +        return zs =3D=3D NVME_ZONE_STATE_OFFLINE;
> +    default:
> +        return false;
> +    }
> +}
> +
> +static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
> +{
> +    NvmeCmd *cmd =3D (NvmeCmd *)&req->cmd;
> +    NvmeNamespace *ns =3D req->ns;
> +    /* cdw12 is zero-based number of dwords to return. Convert to bytes =
*/
> +    uint32_t data_size =3D (le32_to_cpu(cmd->cdw12) + 1) << 2;
> +    uint32_t dw13 =3D le32_to_cpu(cmd->cdw13);
> +    uint32_t zone_idx, zra, zrasf, partial;
> +    uint64_t max_zones, nr_zones =3D 0;
> +    uint16_t ret;
> +    uint64_t slba;
> +    NvmeZoneDescr *z;
> +    NvmeZone *zs;
> +    NvmeZoneReportHeader *header;
> +    void *buf, *buf_p;
> +    size_t zone_entry_sz;
> +
> +    req->status =3D NVME_SUCCESS;
> +
> +    ret =3D nvme_get_mgmt_zone_slba_idx(ns, cmd, &slba, &zone_idx);
> +    if (ret) {
> +        return ret;
> +    }

Zone Management Receive does not specify anything for the given SLBA.
Out-of-bounds is acceptable, just results in no descriptors being
returned.

> +
> +    zra =3D dw13 & 0xff;
> +    if (zra !=3D NVME_ZONE_REPORT) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    zrasf =3D (dw13 >> 8) & 0xff;
> +    if (zrasf > NVME_ZONE_REPORT_OFFLINE) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    if (data_size < sizeof(NvmeZoneReportHeader)) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    ret =3D nvme_map_dptr(n, data_size, req);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    partial =3D (dw13 >> 16) & 0x01;
> +
> +    zone_entry_sz =3D sizeof(NvmeZoneDescr);
> +
> +    max_zones =3D (data_size - sizeof(NvmeZoneReportHeader)) / zone_entr=
y_sz;
> +    buf =3D g_malloc0(data_size);
> +
> +    header =3D (NvmeZoneReportHeader *)buf;
> +    buf_p =3D buf + sizeof(NvmeZoneReportHeader);
> +
> +    while (zone_idx < ns->num_zones && nr_zones < max_zones) {
> +        zs =3D &ns->zone_array[zone_idx];
> +
> +        if (!nvme_zone_matches_filter(zrasf, zs)) {
> +            zone_idx++;
> +            continue;
> +        }
> +
> +        z =3D (NvmeZoneDescr *)buf_p;
> +        buf_p +=3D sizeof(NvmeZoneDescr);
> +        nr_zones++;
> +
> +        z->zt =3D zs->d.zt;
> +        z->zs =3D zs->d.zs;
> +        z->zcap =3D cpu_to_le64(zs->d.zcap);
> +        z->zslba =3D cpu_to_le64(zs->d.zslba);
> +        z->za =3D zs->d.za;
> +
> +        if (nvme_wp_is_valid(zs)) {
> +            z->wp =3D cpu_to_le64(zs->d.wp);
> +        } else {
> +            z->wp =3D cpu_to_le64(~0ULL);
> +        }

In nvme_finalize_zone_write you explicitly set d.wp when transitioning
to Full - but you always report it as zero if it is invalid. No need to
set it when finalizing then, or?

> +
> +        zone_idx++;
> +    }
> +
> +    if (!partial) {
> +        for (; zone_idx < ns->num_zones; zone_idx++) {
> +            zs =3D &ns->zone_array[zone_idx];
> +            if (nvme_zone_matches_filter(zrasf, zs)) {
> +                nr_zones++;
> +            }
> +        }
> +    }

I did something like this as well (only counting matching zones from
given SLBA), but when looking at the spec now, it seems that this is a
remnant from an older version of the spec? Please correct me if wrong.

On the Partial Report bit, the ratified specification just says that "If
this bit is cleared to '0', then the value in the Number of Zones field
indicates the number of zone descriptors that match the criteria in the
Zone Receive Action Specific field.".

So, I think if !partial, the Number of Zones field should not consider
the SLBA and just count from 0.

> +    header->nr_zones =3D cpu_to_le64(nr_zones);
> +
> +    ret =3D nvme_dma(n, (uint8_t *)buf, data_size,
> +                   DMA_DIRECTION_FROM_DEVICE, req);
> +
> +    g_free(buf);
> +
> +    return ret;
> +}
> +
>  static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
>  {
>      uint32_t nsid =3D le32_to_cpu(req->cmd.nsid);
> @@ -1084,11 +1944,17 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequ=
est *req)
>      case NVME_CMD_FLUSH:
>          return nvme_flush(n, req);
>      case NVME_CMD_WRITE_ZEROES:
> -        return nvme_write(n, req, true);
> +        return nvme_write(n, req, false, true);
> +    case NVME_CMD_ZONE_APPEND:
> +        return nvme_write(n, req, true, false);
>      case NVME_CMD_WRITE:
> -        return nvme_write(n, req, false);
> +        return nvme_write(n, req, false, false);

This is personal preference, but I find functions with literal boolean
arguments hard to read since I have to jump to the definition to check
what the arguments actually do. Especially when there are many of them.
In those cases I prefer the introduction of convenience wrapper
functions that "sets" the bools.

>      case NVME_CMD_READ:
>          return nvme_read(n, req);
> +    case NVME_CMD_ZONE_MGMT_SEND:
> +        return nvme_zone_mgmt_send(n, req);
> +    case NVME_CMD_ZONE_MGMT_RECV:
> +        return nvme_zone_mgmt_recv(n, req);
>      default:
>          assert(false);
>      }
> @@ -1348,6 +2214,9 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8=
_t csi, uint32_t buf_len,
>          case NVME_CSI_NVM:
>              src_iocs =3D nvme_cse_iocs_nvm;
>              break;
> +        case NVME_CSI_ZONED:
> +            src_iocs =3D nvme_cse_iocs_zoned;
> +            break;
>          }
>      }
> =20
> @@ -1529,6 +2398,16 @@ static uint16_t nvme_rpt_empty_id_struct(NvmeCtrl =
*n, NvmeRequest *req)
>      return nvme_dma(n, id, sizeof(id), DMA_DIRECTION_FROM_DEVICE, req);
>  }
> =20
> +static inline bool nvme_csi_has_nvm_support(NvmeNamespace *ns)
> +{
> +    switch (ns->csi) {
> +    case NVME_CSI_NVM:
> +    case NVME_CSI_ZONED:
> +        return true;
> +    }
> +    return false;
> +}
> +
>  static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
>  {
>      trace_pci_nvme_identify_ctrl();
> @@ -1540,11 +2419,16 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, N=
vmeRequest *req)
>  static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
>  {
>      NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
> +    NvmeIdCtrlZoned id =3D {};
> =20
>      trace_pci_nvme_identify_ctrl_csi(c->csi);
> =20
>      if (c->csi =3D=3D NVME_CSI_NVM) {
>          return nvme_rpt_empty_id_struct(n, req);
> +    } else if (c->csi =3D=3D NVME_CSI_ZONED) {
> +        id.zasl =3D n->zasl;

I've mentioned this before, but I don't like that something different
=66rom what the user has specified is reported here. Internally n->zasl
becomes MDTS if MDTS is non-zero (which is fine) and zasl is unspecified
by the user. But, by forcefully inserting it into the identify namespace
data structure, you cannot have a device that reports a non-zero MDTS
and a zero ZASL. I know that this might not have any practical impact,
but I still think it is unnecessary.

> +        return nvme_dma(n, (uint8_t *)&id, sizeof(id),
> +                        DMA_DIRECTION_FROM_DEVICE, req);
>      }
> =20
>      return NVME_INVALID_FIELD | NVME_DNR;
> @@ -1572,8 +2456,12 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, Nvme=
Request *req,
>          return nvme_rpt_empty_id_struct(n, req);
>      }
> =20
> -    return nvme_dma(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs),
> -                    DMA_DIRECTION_FROM_DEVICE, req);
> +    if (c->csi =3D=3D NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
> +        return nvme_dma(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs),
> +                        DMA_DIRECTION_FROM_DEVICE, req);
> +    }
> +
> +    return NVME_INVALID_CMD_SET | NVME_DNR;
>  }
> =20
>  static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
> @@ -1598,8 +2486,11 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, =
NvmeRequest *req,
>          return nvme_rpt_empty_id_struct(n, req);
>      }
> =20
> -    if (c->csi =3D=3D NVME_CSI_NVM) {
> +    if (c->csi =3D=3D NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
>          return nvme_rpt_empty_id_struct(n, req);
> +    } else if (c->csi =3D=3D NVME_CSI_ZONED && ns->csi =3D=3D NVME_CSI_Z=
ONED) {
> +        return nvme_dma(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZo=
ned),
> +                        DMA_DIRECTION_FROM_DEVICE, req);
>      }
> =20
>      return NVME_INVALID_FIELD | NVME_DNR;
> @@ -1668,7 +2559,7 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *=
n, NvmeRequest *req,
>          return NVME_INVALID_NSID | NVME_DNR;
>      }
> =20
> -    if (c->csi !=3D NVME_CSI_NVM) {
> +    if (c->csi !=3D NVME_CSI_NVM && c->csi !=3D NVME_CSI_ZONED) {
>          return NVME_INVALID_FIELD | NVME_DNR;
>      }
> =20
> @@ -1677,7 +2568,7 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *=
n, NvmeRequest *req,
>          if (!ns) {
>              continue;
>          }
> -        if (ns->params.nsid <=3D min_nsid) {
> +        if (ns->params.nsid <=3D min_nsid || c->csi !=3D ns->csi) {
>              continue;
>          }
>          if (only_active && !ns->attached) {
> @@ -1747,6 +2638,8 @@ static uint16_t nvme_identify_cmd_set(NvmeCtrl *n, =
NvmeRequest *req)
>      trace_pci_nvme_identify_cmd_set();
> =20
>      NVME_SET_CSI(*list, NVME_CSI_NVM);
> +    NVME_SET_CSI(*list, NVME_CSI_ZONED);
> +
>      return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
>  }
> =20
> @@ -2206,7 +3099,7 @@ static void nvme_process_sq(void *opaque)
>      }
>  }
> =20
> -static void nvme_clear_ctrl(NvmeCtrl *n)
> +static void nvme_clear_ctrl(NvmeCtrl *n, bool shutdown)
>  {
>      NvmeNamespace *ns;
>      int i;
> @@ -2250,6 +3143,17 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
>          nvme_ns_flush(ns);
>      }
> =20
> +    if (shutdown) {
> +        for (i =3D 1; i <=3D n->num_namespaces; i++) {
> +            ns =3D nvme_ns(n, i);
> +            if (!ns) {
> +                continue;
> +            }
> +
> +            nvme_ns_shutdown(ns);
> +        }
> +    }
> +
>      n->bar.cc =3D 0;
>  }

This should be split into an nvme_ctrl_shutdown() and an
nvme_ctrl_reset() I think. CC should not be cleared on a shutdown.

> =20
> @@ -2270,6 +3174,13 @@ static void nvme_select_ns_iocs(NvmeCtrl *n)
>                  ns->iocs =3D nvme_cse_iocs_nvm;
>              }
>              break;
> +        case NVME_CSI_ZONED:
> +            if (NVME_CC_CSS(n->bar.cc) =3D=3D NVME_CC_CSS_CSI) {
> +                ns->iocs =3D nvme_cse_iocs_zoned;
> +            } else if (NVME_CC_CSS(n->bar.cc) =3D=3D NVME_CC_CSS_NVM) {
> +                ns->iocs =3D nvme_cse_iocs_nvm;
> +            }
> +            break;
>          }
>      }
>  }
> @@ -2368,6 +3279,17 @@ static int nvme_start_ctrl(NvmeCtrl *n)
>      nvme_init_sq(&n->admin_sq, n, n->bar.asq, 0, 0,
>                   NVME_AQA_ASQS(n->bar.aqa) + 1);
> =20
> +    if (!n->params.zasl_bs) {
> +        n->zasl =3D n->params.mdts;
> +    } else {
> +        if (n->params.zasl_bs < n->page_size) {
> +            trace_pci_nvme_err_startfail_zasl_too_small(n->params.zasl_b=
s,
> +                                                        n->page_size);
> +            return -1;
> +        }
> +        n->zasl =3D 31 - clz32(n->params.zasl_bs / n->page_size);
> +    }
> +
>      nvme_set_timestamp(n, 0ULL);
> =20
>      QTAILQ_INIT(&n->aer_queue);
> @@ -2440,12 +3362,12 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr of=
fset, uint64_t data,
>              }
>          } else if (!NVME_CC_EN(data) && NVME_CC_EN(n->bar.cc)) {
>              trace_pci_nvme_mmio_stopped();
> -            nvme_clear_ctrl(n);
> +            nvme_clear_ctrl(n, false);
>              n->bar.csts &=3D ~NVME_CSTS_READY;
>          }
>          if (NVME_CC_SHN(data) && !(NVME_CC_SHN(n->bar.cc))) {
>              trace_pci_nvme_mmio_shutdown_set();
> -            nvme_clear_ctrl(n);
> +            nvme_clear_ctrl(n, true);
>              n->bar.cc =3D data;
>              n->bar.csts |=3D NVME_CSTS_SHST_COMPLETE;
>          } else if (!NVME_CC_SHN(data) && NVME_CC_SHN(n->bar.cc)) {

Could you extract this to a separate patch and just send it on its own?
This is a pretty general fix that master could use right away. Before
this, the controller actually performs the equivalent of a Controller
Level Reset on a Shutdown, which it should not (it erronously clears
CC). On Shutdown it should just flush PMR and the blockdevs, on Reset it
should just drain.

I have a patch that does this, but since you found this bug, I think you
should send the patch. Or I can post mine if you don't care about it.

> @@ -2792,6 +3714,13 @@ static void nvme_check_constraints(NvmeCtrl *n, Er=
ror **errp)
> =20
>          host_memory_backend_set_mapped(n->pmrdev, true);
>      }
> +
> +    if (n->params.zasl_bs) {
> +        if (!is_power_of_2(n->params.zasl_bs)) {
> +            error_setg(errp, "zone append size limit has to be a power o=
f 2");
> +            return;
> +        }
> +    }
>  }
> =20
>  static void nvme_init_state(NvmeCtrl *n)
> @@ -3056,8 +3985,20 @@ static void nvme_realize(PCIDevice *pci_dev, Error=
 **errp)
>  static void nvme_exit(PCIDevice *pci_dev)
>  {
>      NvmeCtrl *n =3D NVME(pci_dev);
> +    NvmeNamespace *ns;
> +    int i;
> +
> +    nvme_clear_ctrl(n, true);
> +
> +    for (i =3D 1; i <=3D n->num_namespaces; i++) {
> +        ns =3D nvme_ns(n, i);
> +        if (!ns) {
> +            continue;
> +        }
> +
> +        nvme_ns_cleanup(ns);
> +    }
> =20
> -    nvme_clear_ctrl(n);
>      g_free(n->cq);
>      g_free(n->sq);
>      g_free(n->aer_reqs);
> @@ -3085,6 +4026,8 @@ static Property nvme_props[] =3D {
>      DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued=
, 64),
>      DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
>      DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, fals=
e),
> +    DEFINE_PROP_SIZE32("zoned.append_size_limit", NvmeCtrl, params.zasl_=
bs,
> +                       NVME_DEFAULT_MAX_ZA_SIZE),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index 8b29423132..4d910bb942 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -89,6 +89,14 @@ pci_nvme_mmio_start_success(void) "setting controller =
enable bit succeeded"
>  pci_nvme_mmio_stopped(void) "cleared controller enable bit"
>  pci_nvme_mmio_shutdown_set(void) "shutdown bit set"
>  pci_nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
> +pci_nvme_open_zone(uint64_t slba, uint32_t zone_idx, int all) "open zone=
, slba=3D%"PRIu64", idx=3D%"PRIu32", all=3D%"PRIi32""
> +pci_nvme_close_zone(uint64_t slba, uint32_t zone_idx, int all) "close zo=
ne, slba=3D%"PRIu64", idx=3D%"PRIu32", all=3D%"PRIi32""
> +pci_nvme_finish_zone(uint64_t slba, uint32_t zone_idx, int all) "finish =
zone, slba=3D%"PRIu64", idx=3D%"PRIu32", all=3D%"PRIi32""
> +pci_nvme_reset_zone(uint64_t slba, uint32_t zone_idx, int all) "reset zo=
ne, slba=3D%"PRIu64", idx=3D%"PRIu32", all=3D%"PRIi32""
> +pci_nvme_offline_zone(uint64_t slba, uint32_t zone_idx, int all) "offlin=
e zone, slba=3D%"PRIu64", idx=3D%"PRIu32", all=3D%"PRIi32""
> +pci_nvme_set_descriptor_extension(uint64_t slba, uint32_t zone_idx) "set=
 zone descriptor extension, slba=3D%"PRIu64", idx=3D%"PRIu32""
> +pci_nvme_clear_ns_close(uint32_t state, uint64_t slba) "zone state=3D%"P=
RIu32", slba=3D%"PRIu64" transitioned to Closed state"
> +pci_nvme_clear_ns_reset(uint32_t state, uint64_t slba) "zone state=3D%"P=
RIu32", slba=3D%"PRIu64" transitioned to Empty state"
> =20
>  # nvme traces for error conditions
>  pci_nvme_err_mdts(uint16_t cid, size_t len) "cid %"PRIu16" len %zu"
> @@ -107,7 +115,13 @@ pci_nvme_err_invalid_opc(uint8_t opc) "invalid opcod=
e 0x%"PRIx8""
>  pci_nvme_err_invalid_admin_opc(uint8_t opc) "invalid admin opcode 0x%"PR=
Ix8""
>  pci_nvme_err_invalid_lba_range(uint64_t start, uint64_t len, uint64_t li=
mit) "Invalid LBA start=3D%"PRIu64" len=3D%"PRIu64" limit=3D%"PRIu64""
>  pci_nvme_err_invalid_log_page_offset(uint64_t ofs, uint64_t size) "must =
be <=3D %"PRIu64", got %"PRIu64""
> -pci_nvme_err_only_nvm_cmd_set_avail(void) "setting 110b CC.CSS, but only=
 NVM command set is enabled"
> +pci_nvme_err_unaligned_zone_cmd(uint8_t action, uint64_t slba, uint64_t =
zslba) "unaligned zone op 0x%"PRIx32", got slba=3D%"PRIu64", zslba=3D%"PRIu=
64""
> +pci_nvme_err_invalid_zone_state_transition(uint8_t action, uint64_t slba=
, uint8_t attrs) "action=3D0x%"PRIx8", slba=3D%"PRIu64", attrs=3D0x%"PRIx32=
""
> +pci_nvme_err_write_not_at_wp(uint64_t slba, uint64_t zone, uint64_t wp) =
"writing at slba=3D%"PRIu64", zone=3D%"PRIu64", but wp=3D%"PRIu64""
> +pci_nvme_err_append_not_at_start(uint64_t slba, uint64_t zone) "appendin=
g at slba=3D%"PRIu64", but zone=3D%"PRIu64""
> +pci_nvme_err_zone_write_not_ok(uint64_t slba, uint32_t nlb, uint32_t sta=
tus) "slba=3D%"PRIu64", nlb=3D%"PRIu32", status=3D0x%"PRIx16""
> +pci_nvme_err_zone_read_not_ok(uint64_t slba, uint32_t nlb, uint32_t stat=
us) "slba=3D%"PRIu64", nlb=3D%"PRIu32", status=3D0x%"PRIx16""
> +pci_nvme_err_append_too_large(uint64_t slba, uint32_t nlb, uint8_t zasl)=
 "slba=3D%"PRIu64", nlb=3D%"PRIu32", zasl=3D%"PRIu8""
>  pci_nvme_err_invalid_iocsci(uint32_t idx) "unsupported command set combi=
nation index %"PRIu32""
>  pci_nvme_err_invalid_del_sq(uint16_t qid) "invalid submission queue dele=
tion, sid=3D%"PRIu16""
>  pci_nvme_err_invalid_create_sq_cqid(uint16_t cqid) "failed creating subm=
ission queue, invalid cqid=3D%"PRIu16""
> @@ -141,7 +155,9 @@ pci_nvme_err_startfail_sqent_too_large(uint8_t log2ps=
, uint8_t maxlog2ps) "nvme_
>  pci_nvme_err_startfail_css(uint8_t css) "nvme_start_ctrl failed because =
invalid command set selected:%u"
>  pci_nvme_err_startfail_asqent_sz_zero(void) "nvme_start_ctrl failed beca=
use the admin submission queue size is zero"
>  pci_nvme_err_startfail_acqent_sz_zero(void) "nvme_start_ctrl failed beca=
use the admin completion queue size is zero"
> +pci_nvme_err_startfail_zasl_too_small(uint32_t zasl, uint32_t pagesz) "n=
vme_start_ctrl failed because zone append size limit %"PRIu32" is too small=
, needs to be >=3D %"PRIu32""
>  pci_nvme_err_startfail(void) "setting controller enable bit failed"
> +pci_nvme_err_invalid_mgmt_action(int action) "action=3D0x%"PRIx8""
> =20
>  # Traces for undefined behavior
>  pci_nvme_ub_mmiowr_misaligned32(uint64_t offset) "MMIO write not 32-bit =
aligned, offset=3D0x%"PRIx64""
> --=20
> 2.21.0
>=20
>=20

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl+tjsQACgkQTeGvMW1P
DekTFggAg3Zd718ivZBtgdmA0s2WaD2/dZ+61TPHBgk8zHWkdlkYuDu1Y8rf88Kv
6X/mD4QUaBipQrZAIq3yQxVyng910Bp1//P0MKUkaf1/FO5konJnHBMHXcH7UEC8
BnhYP3harMci4YZEuQgIxAThOgO4eA2osdm4T+CDT69DrFR8ugrYUnSz+hnNRus7
/ZGGNS+Vzv1nIYa76PljDuQlmF6/AzaRFVQiKHCaJkGuPj6HkFgkP5yjJNL60Bqi
43+tL0eDyTJinOTL53n4K4NRyx4Jz0yexeVy8osOvexBG9caVuIKnuaX5sc7NQMp
yhb1huHGaVMNoyUcxXJKJdd0HOObsg==
=YcZt
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--

