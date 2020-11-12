Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12C32B0E6F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 20:46:03 +0100 (CET)
Received: from localhost ([::1]:47674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdIXi-0007hC-5y
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 14:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdIST-0006Hm-Gp; Thu, 12 Nov 2020 14:40:37 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:51059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdISR-0003iu-2A; Thu, 12 Nov 2020 14:40:37 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 159605804EE;
 Thu, 12 Nov 2020 14:40:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 12 Nov 2020 14:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=brKnNqvjZBasx06FxZOJdHPZHsY
 8Q3qrVXCsJG6Xdt8=; b=G5AUBMTcfVmY21kDbSB+q7TaOJgBURr1Zkfh0gclMLu
 V1H5etsQDtVmonvl3kse4MjrMxI0+qk3siuI3Dxgn51NqlStm372fN2jQqxK2A/u
 WpKj1RQZUrrURDGluzOIIov32D/B64LPM96cSagzTq83haPbAP7Gp0tLqh3PcXyA
 eRkZYadJSCuA8XEornzdJ26fDwwLhocoy54TF/rgefOimKFS1tdF0/7dNq4CGNmR
 zl4VcNo0yw90ZFdD0rkpHD7fzjlou0BhxNk5hIaD9vBv7AcY+f7TsCdFUIeyjAJx
 gLPJa6tcfEQQmASCc9HuOvhXJigKoQOXrbp1nC/BcRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=brKnNq
 vjZBasx06FxZOJdHPZHsY8Q3qrVXCsJG6Xdt8=; b=d+91zEf6rDhHZMub5rRrBZ
 RAvWASAKHaATiADq2yJ94UGS7SdMZqtLNFi7YZ4ZCxESENJswYoDaqhbA+BRb/Lr
 eH80wCxrMrqOboKCxsmu3cNfvq22Ie43t86ARfZmKS/ZiZdgATi07OQn6clcQ+No
 7LPxiPE/53ltpraTxTpwiI4dv5v1zp94NubO/DPCUSeKG/Jgz7w7hbBshlqw95G/
 /LCZnWuj/wgb+KfYYTrIW4I68VOHDbMfAam6g3EEWuBW/vgH3dqVbjalt24T0V1V
 7zd5TB2Ro7JN529Yq0ciK0wJTR8yJ7Qa7NpqpiEXKMO5eKIzhJueiOzfH4dq5Cww
 ==
X-ME-Sender: <xms:sI-tX-SPmBHmjrMEahUyEqx6vqpSs-7q9IMPKL_gRcjcTjAlrzkBnw>
 <xme:sI-tXzw4YjWySc7YbYUqbYR7OLl4DhMTCpWWgqg_883LSRNk5xpbyAx1I-U11EBkR
 QFQGBrkiAa8EX-VdQI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvfedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:sI-tX70xCNDyJlJNE7oHIn2nFjjD62MGPI3DlZ05r-ZeTAvCijfoRg>
 <xmx:sI-tX6BnTPWzt20e-XQ1Jdnrf3sq2OFIq09c7g6zszf2-QeaxzMVuA>
 <xmx:sI-tX3ijZZqG8LvID6B8S18ZZ-GFODkAXmKwyQx6wKpCrqFFpDelsg>
 <xmx:so-tXwYDapicstlmRFNV6KzTYrtZG1iYBJ88c9rSHL8gWITeccKRtQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 46B7C3068901;
 Thu, 12 Nov 2020 14:40:30 -0500 (EST)
Date: Thu, 12 Nov 2020 20:40:28 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH v10 09/12] hw/block/nvme: Introduce max active and open
 zone limits
Message-ID: <20201112194028.GA811841@apples.localdomain>
References: <20201106234305.21339-1-dmitry.fomichev@wdc.com>
 <20201106234305.21339-10-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <20201106234305.21339-10-dmitry.fomichev@wdc.com>
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


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov  7 08:43, Dmitry Fomichev wrote:
> Add two module properties, "zoned.max_active" and "zoned.max_open"
> to control the maximum number of zones that can be active or open.
> Once these variables are set to non-default values, these limits are
> checked during I/O and Too Many Active or Too Many Open command status
> is returned if they are exceeded.
>=20
> Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
> ---

For Zone Management Send, if the action is Open Zone and Select All is
set, it must be checked that there are enough resources for all Closed
zones to transition to Explicitly Opened - otherwise no state
transitions "shall" occur.

>  hw/block/nvme-ns.h    | 41 +++++++++++++++++++
>  hw/block/nvme-ns.c    | 30 +++++++++++++-
>  hw/block/nvme.c       | 94 +++++++++++++++++++++++++++++++++++++++++++
>  hw/block/trace-events |  2 +
>  4 files changed, 165 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> index d2631ff5a3..421bab0a57 100644
> --- a/hw/block/nvme-ns.h
> +++ b/hw/block/nvme-ns.h
> @@ -33,6 +33,8 @@ typedef struct NvmeNamespaceParams {
>      bool     cross_zone_read;
>      uint64_t zone_size_bs;
>      uint64_t zone_cap_bs;
> +    uint32_t max_active_zones;
> +    uint32_t max_open_zones;
>  } NvmeNamespaceParams;
> =20
>  typedef struct NvmeNamespace {
> @@ -56,6 +58,8 @@ typedef struct NvmeNamespace {
>      uint64_t        zone_capacity;
>      uint64_t        zone_array_size;
>      uint32_t        zone_size_log2;
> +    int32_t         nr_open_zones;
> +    int32_t         nr_active_zones;
> =20
>      NvmeNamespaceParams params;
>  } NvmeNamespace;
> @@ -123,6 +127,43 @@ static inline bool nvme_wp_is_valid(NvmeZone *zone)
>             st !=3D NVME_ZONE_STATE_OFFLINE;
>  }
> =20
> +static inline void nvme_aor_inc_open(NvmeNamespace *ns)
> +{
> +    assert(ns->nr_open_zones >=3D 0);
> +    if (ns->params.max_open_zones) {
> +        ns->nr_open_zones++;
> +        assert(ns->nr_open_zones <=3D ns->params.max_open_zones);
> +    }
> +}
> +
> +static inline void nvme_aor_dec_open(NvmeNamespace *ns)
> +{
> +    if (ns->params.max_open_zones) {
> +        assert(ns->nr_open_zones > 0);
> +        ns->nr_open_zones--;
> +    }
> +    assert(ns->nr_open_zones >=3D 0);
> +}
> +
> +static inline void nvme_aor_inc_active(NvmeNamespace *ns)
> +{
> +    assert(ns->nr_active_zones >=3D 0);
> +    if (ns->params.max_active_zones) {
> +        ns->nr_active_zones++;
> +        assert(ns->nr_active_zones <=3D ns->params.max_active_zones);
> +    }
> +}
> +
> +static inline void nvme_aor_dec_active(NvmeNamespace *ns)
> +{
> +    if (ns->params.max_active_zones) {
> +        assert(ns->nr_active_zones > 0);
> +        ns->nr_active_zones--;
> +        assert(ns->nr_active_zones >=3D ns->nr_open_zones);
> +    }
> +    assert(ns->nr_active_zones >=3D 0);
> +}
> +
>  int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
>  void nvme_ns_drain(NvmeNamespace *ns);
>  void nvme_ns_flush(NvmeNamespace *ns);
> diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> index e6db7f7d3b..2e45838c15 100644
> --- a/hw/block/nvme-ns.c
> +++ b/hw/block/nvme-ns.c
> @@ -119,6 +119,20 @@ static int nvme_calc_zone_geometry(NvmeNamespace *ns=
, Error **errp)
>          ns->zone_size_log2 =3D 63 - clz64(ns->zone_size);
>      }
> =20
> +    /* Make sure that the values of all ZNS properties are sane */
> +    if (ns->params.max_open_zones > nz) {
> +        error_setg(errp,
> +                   "max_open_zones value %u exceeds the number of zones =
%u",
> +                   ns->params.max_open_zones, nz);
> +        return -1;
> +    }
> +    if (ns->params.max_active_zones > nz) {
> +        error_setg(errp,
> +                   "max_active_zones value %u exceeds the number of zone=
s %u",
> +                   ns->params.max_active_zones, nz);
> +        return -1;
> +    }
> +
>      return 0;
>  }
> =20
> @@ -166,8 +180,8 @@ static int nvme_zoned_init_ns(NvmeCtrl *n, NvmeNamesp=
ace *ns, int lba_index,
>      id_ns_z =3D g_malloc0(sizeof(NvmeIdNsZoned));
> =20
>      /* MAR/MOR are zeroes-based, 0xffffffff means no limit */
> -    id_ns_z->mar =3D 0xffffffff;
> -    id_ns_z->mor =3D 0xffffffff;
> +    id_ns_z->mar =3D cpu_to_le32(ns->params.max_active_zones - 1);
> +    id_ns_z->mor =3D cpu_to_le32(ns->params.max_open_zones - 1);
>      id_ns_z->zoc =3D 0;
>      id_ns_z->ozcs =3D ns->params.cross_zone_read ? 0x01 : 0x00;
> =20
> @@ -195,6 +209,7 @@ static void nvme_clear_zone(NvmeNamespace *ns, NvmeZo=
ne *zone)
>              trace_pci_nvme_clear_ns_close(state, zone->d.zslba);
>              nvme_set_zone_state(zone, NVME_ZONE_STATE_CLOSED);
>          }
> +        nvme_aor_inc_active(ns);
>          QTAILQ_INSERT_HEAD(&ns->closed_zones, zone, entry);
>      } else {
>          trace_pci_nvme_clear_ns_reset(state, zone->d.zslba);
> @@ -211,16 +226,23 @@ static void nvme_zoned_ns_shutdown(NvmeNamespace *n=
s)
> =20
>      QTAILQ_FOREACH_SAFE(zone, &ns->closed_zones, entry, next) {
>          QTAILQ_REMOVE(&ns->closed_zones, zone, entry);
> +        nvme_aor_dec_active(ns);
>          nvme_clear_zone(ns, zone);
>      }
>      QTAILQ_FOREACH_SAFE(zone, &ns->imp_open_zones, entry, next) {
>          QTAILQ_REMOVE(&ns->imp_open_zones, zone, entry);
> +        nvme_aor_dec_open(ns);
> +        nvme_aor_dec_active(ns);
>          nvme_clear_zone(ns, zone);
>      }
>      QTAILQ_FOREACH_SAFE(zone, &ns->exp_open_zones, entry, next) {
>          QTAILQ_REMOVE(&ns->exp_open_zones, zone, entry);
> +        nvme_aor_dec_open(ns);
> +        nvme_aor_dec_active(ns);
>          nvme_clear_zone(ns, zone);
>      }
> +
> +    assert(ns->nr_open_zones =3D=3D 0);
>  }
> =20
>  static int nvme_ns_check_constraints(NvmeNamespace *ns, Error **errp)
> @@ -306,6 +328,10 @@ static Property nvme_ns_props[] =3D {
>      DEFINE_PROP_SIZE("zoned.zcap", NvmeNamespace, params.zone_cap_bs, 0),
>      DEFINE_PROP_BOOL("zoned.cross_read", NvmeNamespace,
>                       params.cross_zone_read, false),
> +    DEFINE_PROP_UINT32("zoned.max_active", NvmeNamespace,
> +                       params.max_active_zones, 0),
> +    DEFINE_PROP_UINT32("zoned.max_open", NvmeNamespace,
> +                       params.max_open_zones, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index f5390e6863..c6b3a5dcf7 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -199,6 +199,26 @@ static void nvme_assign_zone_state(NvmeNamespace *ns=
, NvmeZone *zone,
>      }
>  }
> =20
> +/*
> + * Check if we can open a zone without exceeding open/active limits.
> + * AOR stands for "Active and Open Resources" (see TP 4053 section 2.5).
> + */
> +static int nvme_aor_check(NvmeNamespace *ns, uint32_t act, uint32_t opn)
> +{
> +    if (ns->params.max_active_zones !=3D 0 &&
> +        ns->nr_active_zones + act > ns->params.max_active_zones) {
> +        trace_pci_nvme_err_insuff_active_res(ns->params.max_active_zones=
);
> +        return NVME_ZONE_TOO_MANY_ACTIVE | NVME_DNR;
> +    }
> +    if (ns->params.max_open_zones !=3D 0 &&
> +        ns->nr_open_zones + opn > ns->params.max_open_zones) {
> +        trace_pci_nvme_err_insuff_open_res(ns->params.max_open_zones);
> +        return NVME_ZONE_TOO_MANY_OPEN | NVME_DNR;
> +    }
> +
> +    return NVME_SUCCESS;
> +}
> +
>  static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
>  {
>      hwaddr low =3D n->ctrl_mem.addr;
> @@ -1193,6 +1213,41 @@ static uint16_t nvme_check_zone_read(NvmeNamespace=
 *ns, uint64_t slba,
>      return status;
>  }
> =20
> +static void nvme_auto_transition_zone(NvmeNamespace *ns, bool implicit,
> +                                      bool adding_active)
> +{
> +    NvmeZone *zone;
> +
> +    if (implicit && ns->params.max_open_zones &&
> +        ns->nr_open_zones =3D=3D ns->params.max_open_zones) {
> +        zone =3D QTAILQ_FIRST(&ns->imp_open_zones);
> +        if (zone) {
> +            /*
> +             * Automatically close this implicitly open zone.
> +             */
> +            QTAILQ_REMOVE(&ns->imp_open_zones, zone, entry);
> +            nvme_aor_dec_open(ns);
> +            nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
> +        }
> +    }
> +}

If implicit is false this function is a noop. Since you are always
calling it with a literal bool there should be no reason to even call
it.

> +
> +static uint16_t nvme_auto_open_zone(NvmeNamespace *ns, NvmeZone *zone)
> +{
> +    uint16_t status =3D NVME_SUCCESS;
> +    uint8_t zs =3D nvme_get_zone_state(zone);
> +
> +    if (zs =3D=3D NVME_ZONE_STATE_EMPTY) {
> +        nvme_auto_transition_zone(ns, true, true);
> +        status =3D nvme_aor_check(ns, 1, 1);
> +    } else if (zs =3D=3D NVME_ZONE_STATE_CLOSED) {
> +        nvme_auto_transition_zone(ns, true, false);
> +        status =3D nvme_aor_check(ns, 0, 1);
> +    }
> +
> +    return status;
> +}
> +
>  static bool nvme_finalize_zoned_write(NvmeNamespace *ns, NvmeRequest *re=
q,
>                                        bool failed)
>  {
> @@ -1226,7 +1281,11 @@ static bool nvme_finalize_zoned_write(NvmeNamespac=
e *ns, NvmeRequest *req,
>          switch (nvme_get_zone_state(zone)) {
>          case NVME_ZONE_STATE_IMPLICITLY_OPEN:
>          case NVME_ZONE_STATE_EXPLICITLY_OPEN:
> +            nvme_aor_dec_open(ns);
> +            /* fall through */
>          case NVME_ZONE_STATE_CLOSED:
> +            nvme_aor_dec_active(ns);
> +            /* fall through */
>          case NVME_ZONE_STATE_EMPTY:
>              nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_FULL);
>              /* fall through */
> @@ -1255,7 +1314,10 @@ static uint64_t nvme_advance_zone_wp(NvmeNamespace=
 *ns, NvmeZone *zone,
>          zs =3D nvme_get_zone_state(zone);
>          switch (zs) {
>          case NVME_ZONE_STATE_EMPTY:
> +            nvme_aor_inc_active(ns);
> +            /* fall through */
>          case NVME_ZONE_STATE_CLOSED:
> +            nvme_aor_inc_open(ns);
>              nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_IMPLICITLY_=
OPEN);
>          }
>      }
> @@ -1449,6 +1511,11 @@ static uint16_t nvme_write(NvmeCtrl *n, NvmeReques=
t *req, bool append, bool wrz)
>              goto invalid;
>          }
> =20
> +        status =3D nvme_auto_open_zone(ns, zone);
> +        if (status !=3D NVME_SUCCESS) {
> +            goto invalid;
> +        }
> +
>          if (append) {
>              slba =3D zone->w_ptr;
>          }
> @@ -1529,9 +1596,27 @@ enum NvmeZoneProcessingMask {
>  static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
>                                 uint8_t state)
>  {
> +    uint16_t status;
> +
>      switch (state) {
>      case NVME_ZONE_STATE_EMPTY:
> +        nvme_auto_transition_zone(ns, false, true);
> +        status =3D nvme_aor_check(ns, 1, 0);
> +        if (status !=3D NVME_SUCCESS) {
> +            return status;
> +        }
> +        nvme_aor_inc_active(ns);
> +        /* fall through */
>      case NVME_ZONE_STATE_CLOSED:
> +        status =3D nvme_aor_check(ns, 0, 1);
> +        if (status !=3D NVME_SUCCESS) {
> +            if (state =3D=3D NVME_ZONE_STATE_EMPTY) {
> +                nvme_aor_dec_active(ns);
> +            }
> +            return status;
> +        }
> +        nvme_aor_inc_open(ns);
> +        /* fall through */
>      case NVME_ZONE_STATE_IMPLICITLY_OPEN:
>          nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_EXPLICITLY_OPEN=
);
>          /* fall through */
> @@ -1548,6 +1633,7 @@ static uint16_t nvme_close_zone(NvmeNamespace *ns, =
NvmeZone *zone,
>      switch (state) {
>      case NVME_ZONE_STATE_EXPLICITLY_OPEN:
>      case NVME_ZONE_STATE_IMPLICITLY_OPEN:
> +        nvme_aor_dec_open(ns);
>          nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_CLOSED);
>          /* fall through */
>      case NVME_ZONE_STATE_CLOSED:
> @@ -1563,7 +1649,11 @@ static uint16_t nvme_finish_zone(NvmeNamespace *ns=
, NvmeZone *zone,
>      switch (state) {
>      case NVME_ZONE_STATE_EXPLICITLY_OPEN:
>      case NVME_ZONE_STATE_IMPLICITLY_OPEN:
> +        nvme_aor_dec_open(ns);
> +        /* fall through */
>      case NVME_ZONE_STATE_CLOSED:
> +        nvme_aor_dec_active(ns);
> +        /* fall through */
>      case NVME_ZONE_STATE_EMPTY:
>          zone->w_ptr =3D nvme_zone_wr_boundary(zone);
>          zone->d.wp =3D zone->w_ptr;
> @@ -1582,7 +1672,11 @@ static uint16_t nvme_reset_zone(NvmeNamespace *ns,=
 NvmeZone *zone,
>      switch (state) {
>      case NVME_ZONE_STATE_EXPLICITLY_OPEN:
>      case NVME_ZONE_STATE_IMPLICITLY_OPEN:
> +        nvme_aor_dec_open(ns);
> +        /* fall through */
>      case NVME_ZONE_STATE_CLOSED:
> +        nvme_aor_dec_active(ns);
> +        /* fall through */
>      case NVME_ZONE_STATE_FULL:
>          zone->w_ptr =3D zone->d.zslba;
>          zone->d.wp =3D zone->w_ptr;
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index 4d910bb942..e674522883 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -122,6 +122,8 @@ pci_nvme_err_append_not_at_start(uint64_t slba, uint6=
4_t zone) "appending at slb
>  pci_nvme_err_zone_write_not_ok(uint64_t slba, uint32_t nlb, uint32_t sta=
tus) "slba=3D%"PRIu64", nlb=3D%"PRIu32", status=3D0x%"PRIx16""
>  pci_nvme_err_zone_read_not_ok(uint64_t slba, uint32_t nlb, uint32_t stat=
us) "slba=3D%"PRIu64", nlb=3D%"PRIu32", status=3D0x%"PRIx16""
>  pci_nvme_err_append_too_large(uint64_t slba, uint32_t nlb, uint8_t zasl)=
 "slba=3D%"PRIu64", nlb=3D%"PRIu32", zasl=3D%"PRIu8""
> +pci_nvme_err_insuff_active_res(uint32_t max_active) "max_active=3D%"PRIu=
32" zone limit exceeded"
> +pci_nvme_err_insuff_open_res(uint32_t max_open) "max_open=3D%"PRIu32" zo=
ne limit exceeded"
>  pci_nvme_err_invalid_iocsci(uint32_t idx) "unsupported command set combi=
nation index %"PRIu32""
>  pci_nvme_err_invalid_del_sq(uint16_t qid) "invalid submission queue dele=
tion, sid=3D%"PRIu16""
>  pci_nvme_err_invalid_create_sq_cqid(uint16_t cqid) "failed creating subm=
ission queue, invalid cqid=3D%"PRIu16""
> --=20
> 2.21.0
>=20
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl+tj6kACgkQTeGvMW1P
DemJ9AgAhXTMTPxwyzDwChmmMZBC8/MNkx2ahu/xIhimRLnTIKMPa/bq56wkfHff
NDvua4VvaSr8XEp1nkG8IVzFJ1kWYl/RkD4DRDI3+/T8/ecDz6hGaprLH7AkU+gO
9MmqsBqT8l1URdI5M29ghShiYjt62F3AWssm6phflEBNDDQuOmnRlLXbYigLJGHh
kLlXg8db5MhpBuSqR2spdrKPgEHeUbvi/1BUtGMx49DyT+74TCbXJ0voj53d4MsA
miHrS3nJkXkpSzxcGcCQy5dI5ABXCqUxeMWWCwEB+WeCeCde2fvSypdU1ISgSw3C
UP9WdHZx+JXc36KNZtB8N0AU1z+HMw==
=hoSQ
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--

