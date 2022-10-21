Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22636607008
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 08:27:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollVZ-00021y-GR
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:27:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollUE-0000kb-D5
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1ollTy-0000QG-LG
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:26:17 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1ollTv-0007NU-R0
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:26:14 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B4B95C00A5;
 Fri, 21 Oct 2022 02:26:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Oct 2022 02:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1666333569; x=1666419969; bh=4B
 NgbxpCu3pHqSJ00hK4/moGlyiN1tdWBTsyQMTKyu0=; b=VBSTHHNhz9bowCHUur
 nM9439PXfCMk5yqUtILtquj1JkGs4P+Gex49J9I1c9BdhJWZCZPOYwSrKIot6t1W
 Xc+MKi2Kgudlv8rAfzO/Y0y1G3dvIYETMocGDbcNpkY4/kJhSwuKW7FgNcB8zQ+7
 h0urRggAcLswZE7uF01IDyvYo2L8o6X/ewIVH5u4QhkW+BadSRamylH8Aw79G7MG
 qssVJaCGDqy4wGUHf24QkSGlwZ3KJ/ZAFn8M6zOPTadvGcdVEh+t4TDFKIQGJU8T
 ib3qzVCuVy/1volIvzx6QSDgUq382DlyCzaSZQMnKIO1QkG3oe2uxJOs4sk3sjO+
 /OgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666333569; x=1666419969; bh=4BNgbxpCu3pHqSJ00hK4/moGlyiN
 1tdWBTsyQMTKyu0=; b=cgf9fS3d96pTMC3fXl9U4K8r2eg2Dw1F8/z7DExc4Vcg
 1iLw7eeHqknmxdVpaVHJVACd7v5dphu7gu4yL1opIyIpraPrzwitNDNCXZ2M3sFx
 e6fwdLOHpWEasnro8hAbpNJI/eKW9aUyuhlCQ0zwYHjsAAatvlG1Ck4hpTW3GeFF
 kye8HPY3FDh7dPk+jx7f3TYEOVA1hG19YqlTgpwxy2e72+Uod4x0zFnfSF6eE490
 f1x/6T2tmGWgty2HiH1zaKYISCVNDaQKL8Q/sUbPv/9Ba2Ql23LAjQep1O0HnBN3
 iGG33sBZrXFZ6xcReCodl10TsZOKOtioZG5+XX7Vhg==
X-ME-Sender: <xms:gTtSY_tOPmqq_RuITBTWV_c5gP8NEi5nHRTqMnw8-KA40LNbakhLeg>
 <xme:gTtSYwc_1_ihncPvwvzMvYZjhhdtmjkQFgvqExED7HedLvP9JccDj0euSAQsYjqaM
 x9RyF-ZqKnZc9QfSGg>
X-ME-Received: <xmr:gTtSYyx4GnrEgYm_spStH7MUPagZBXZCA79X1wazlKx_tFNydJYBzddvMMaKGolK4XD8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeljedguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:gTtSY-MesPrKA476HFv3L_QZVnu_AOl486J164J4CBdlT4g1B7YU5w>
 <xmx:gTtSY__cRIibBXNl-5VYovWbNRv9a5qPkwenhCsV_hHZV_9IDgJyLQ>
 <xmx:gTtSY-XO2UE6MIREFJBGxjFqaXhLfszybkbFpjjytRcst5YJbgPZ3w>
 <xmx:gTtSY7YvV6JMMUUhDxU-qQByxUIEECl0wQBkfUl4rVYcxJAbytSXlQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 02:26:07 -0400 (EDT)
Date: Fri, 21 Oct 2022 08:26:06 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: clay.mayers@kioxia.com
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Fam Zheng <fam@euphon.net>,
 Phlippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/4] hw/block/nvme: add zone descriptor changed log page
Message-ID: <Y1I7ftMSoKsN7u1T@cormorant.local>
References: <20221021001835.942642-1-clay.mayers@kioxia.com>
 <20221021001835.942642-3-clay.mayers@kioxia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MUoUSTBRzis8hy8C"
Content-Disposition: inline
In-Reply-To: <20221021001835.942642-3-clay.mayers@kioxia.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MUoUSTBRzis8hy8C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Okt 20 17:18, clay.mayers@kioxia.com wrote:
> From: Clay Mayers <clay.mayers@kioxia.com>
>=20
> Zones marked with ZONE_FINISH_RECOMMENDED are added to the zone
> descriptor changed log page.  Once read with RAE cleared, they are
> removed from the list.
>=20
> Zones stay in the list regardless of what other states the zones may
> go through so applications must be aware of ABA issues where finish
> may be recommended, the zone freed and re-opened and now the attribute
> is now clear.
>=20
> Signed-off-by: Clay Mayers <clay.mayers@kioxia.com>
> ---
>  hw/nvme/ctrl.c       | 50 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/nvme/ns.c         |  6 ++++++
>  hw/nvme/nvme.h       |  8 +++++++
>  hw/nvme/trace-events |  1 +
>  include/block/nvme.h |  8 +++++++
>  5 files changed, 73 insertions(+)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index d7e9fae0b0..3ffd0fb469 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -1516,15 +1516,42 @@ static void nvme_clear_events(NvmeCtrl *n, uint8_=
t event_type)
>      }
>  }
> =20
> +static void nvme_zdc_list(NvmeNamespace *ns, NvmeZoneIdList *zlist, bool=
 reset)
> +{
> +    NvmeZdc *zdc;
> +    NvmeZdc *next;
> +    int index =3D 0;
> +
> +    QTAILQ_FOREACH_SAFE(zdc, &ns->zdc_list, entry, next) {
> +        if (index >=3D ARRAY_SIZE(zlist->zids)) {
> +            break;
> +        }

I could've sweared that a previous revision of the spec stated that this
required `nzid` to be set to 0xffff and the log page be zeroed in this
case.

However, upon reading it again, that doesnt seem to be the case, so this
seems to be just fine.

> +        zlist->zids[index++] =3D zdc->zone->d.zslba;
> +        if (reset) {
> +            QTAILQ_REMOVE(&ns->zdc_list, zdc, entry);
> +            zdc->zone->zdc_entry =3D NULL;
> +            g_free(zdc);
> +        }
> +    }
> +    zlist->nzid =3D cpu_to_le16(index);
> +}
> +
>  static void nvme_check_finish(NvmeNamespace *ns, NvmeZoneListHead *list)
>  {
>      int64_t now =3D qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
>      NvmeZone *zone;
> +    NvmeZdc  *zdc;
> =20
>      QTAILQ_FOREACH(zone, list, entry) {
>          if (zone->finish_ms <=3D now) {
>              zone->finish_ms =3D INT64_MAX;
>              zone->d.za |=3D NVME_ZA_FINISH_RECOMMENDED;
> +            if (!zone->zdc_entry) {
> +                zdc =3D g_malloc0(sizeof(*zdc));
> +                zdc->zone =3D zone;
> +                zone->zdc_entry =3D zdc;
> +                QTAILQ_INSERT_TAIL(&ns->zdc_list, zdc, entry);
> +            }
>          } else if (zone->finish_ms !=3D INT64_MAX) {
>              timer_mod_anticipate(ns->active_timer, zone->finish_ms);
>          }
> @@ -4675,6 +4702,27 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint=
8_t csi, uint32_t buf_len,
>      return nvme_c2h(n, ((uint8_t *)&log) + off, trans_len, req);
>  }
> =20
> +static uint16_t nvme_changed_zones(NvmeCtrl *n, uint8_t rae, uint32_t bu=
f_len,
> +                                    uint64_t off, NvmeRequest *req)
> +{
> +    NvmeNamespace *ns;
> +    NvmeCmd *cmd =3D &req->cmd;
> +    uint32_t nsid =3D le32_to_cpu(cmd->nsid);
> +    NvmeZoneIdList zlist =3D { };
> +    uint32_t trans_len =3D MIN(sizeof(zlist) - off, buf_len);

I believe this is unsafe if off >=3D sizeof(zlist).

> +
> +    nsid =3D le32_to_cpu(cmd->nsid);
> +    trace_pci_nvme_changed_zones(nsid);
> +
> +    ns =3D nvme_ns(n, nsid);
> +    if (!ns) {
> +        return NVME_INVALID_NSID | NVME_DNR;
> +    }
> +    nvme_zdc_list(ns, &zlist, !rae);
> +
> +    return nvme_c2h(n, ((uint8_t *)&zlist) + off, trans_len, req);
> +}
> +
>  static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
>  {
>      NvmeCmd *cmd =3D &req->cmd;
> @@ -4722,6 +4770,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeReque=
st *req)
>          return nvme_changed_nslist(n, rae, len, off, req);
>      case NVME_LOG_CMD_EFFECTS:
>          return nvme_cmd_effects(n, csi, len, off, req);
> +    case NVME_LOG_CHANGED_ZONE:
> +        return nvme_changed_zones(n, rae, len, off, req);
>      default:
>          trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
>          return NVME_INVALID_FIELD | NVME_DNR;
> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> index b577f2d8e0..25cd490c99 100644
> --- a/hw/nvme/ns.c
> +++ b/hw/nvme/ns.c
> @@ -240,6 +240,7 @@ static void nvme_ns_zoned_init_state(NvmeNamespace *n=
s)
>      QTAILQ_INIT(&ns->imp_open_zones);
>      QTAILQ_INIT(&ns->closed_zones);
>      QTAILQ_INIT(&ns->full_zones);
> +    QTAILQ_INIT(&ns->zdc_list);
> =20
>      zone =3D ns->zone_array;
>      for (i =3D 0; i < ns->num_zones; i++, zone++) {
> @@ -526,8 +527,13 @@ void nvme_ns_shutdown(NvmeNamespace *ns)
> =20
>  void nvme_ns_cleanup(NvmeNamespace *ns)
>  {
> +    NvmeZdc *zdc;
> +
>      if (ns->params.zoned) {
>          timer_free(ns->active_timer);
> +        while ((zdc =3D QTAILQ_FIRST(&ns->zdc_list))) {
> +            g_free(zdc);
> +        }
>          g_free(ns->id_ns_zoned);
>          g_free(ns->zone_array);
>          g_free(ns->zd_extensions);
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 9a54dcdb32..ae65226150 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -32,6 +32,7 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BROAD=
CAST - 1);
> =20
>  typedef struct NvmeCtrl NvmeCtrl;
>  typedef struct NvmeNamespace NvmeNamespace;
> +typedef struct NvmeZone NvmeZone;
> =20
>  #define TYPE_NVME_BUS "nvme-bus"
>  OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
> @@ -90,10 +91,16 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsy=
stem *subsys,
>  #define NVME_NS(obj) \
>      OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
> =20
> +typedef struct NvmeZdc {
> +    QTAILQ_ENTRY(NvmeZdc) entry;
> +    NvmeZone *zone;
> +} NvmeZdc;
> +
>  typedef struct NvmeZone {
>      NvmeZoneDescr   d;
>      uint64_t        w_ptr;
>      int64_t         finish_ms;
> +    NvmeZdc         *zdc_entry;
>      QTAILQ_ENTRY(NvmeZone) entry;
>  } NvmeZone;
> =20
> @@ -172,6 +179,7 @@ typedef struct NvmeNamespace {
> =20
>      int64_t         fto_ms;
>      QEMUTimer       *active_timer;
> +    QTAILQ_HEAD(, NvmeZdc) zdc_list;
> =20
>      NvmeNamespaceParams params;
> =20
> diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
> index fccb79f489..337927e607 100644
> --- a/hw/nvme/trace-events
> +++ b/hw/nvme/trace-events
> @@ -64,6 +64,7 @@ pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
>  pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=3D%"PRIu16"=
, csi=3D0x%"PRIx8""
>  pci_nvme_identify_cmd_set(void) "identify i/o command set"
>  pci_nvme_identify_ns_descr_list(uint32_t ns) "nsid %"PRIu32""
> +pci_nvme_changed_zones(uint32_t ns) "nsid %"PRIu32""
>  pci_nvme_get_log(uint16_t cid, uint8_t lid, uint8_t lsp, uint8_t rae, ui=
nt32_t len, uint64_t off) "cid %"PRIu16" lid 0x%"PRIx8" lsp 0x%"PRIx8" rae =
0x%"PRIx8" len %"PRIu32" off %"PRIu64""
>  pci_nvme_getfeat(uint16_t cid, uint32_t nsid, uint8_t fid, uint8_t sel, =
uint32_t cdw11) "cid %"PRIu16" nsid 0x%"PRIx32" fid 0x%"PRIx8" sel 0x%"PRIx=
8" cdw11 0x%"PRIx32""
>  pci_nvme_setfeat(uint16_t cid, uint32_t nsid, uint8_t fid, uint8_t save,=
 uint32_t cdw11) "cid %"PRIu16" nsid 0x%"PRIx32" fid 0x%"PRIx8" save 0x%"PR=
Ix8" cdw11 0x%"PRIx32""
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 8027b7126b..c747cc4948 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -1010,6 +1010,7 @@ enum NvmeLogIdentifier {
>      NVME_LOG_FW_SLOT_INFO   =3D 0x03,
>      NVME_LOG_CHANGED_NSLIST =3D 0x04,
>      NVME_LOG_CMD_EFFECTS    =3D 0x05,
> +    NVME_LOG_CHANGED_ZONE   =3D 0xbf,
>  };
> =20
>  typedef struct QEMU_PACKED NvmePSD {
> @@ -1617,6 +1618,12 @@ typedef enum NvmeVirtualResourceType {
>      NVME_VIRT_RES_INTERRUPT     =3D 0x01,
>  } NvmeVirtualResourceType;
> =20
> +typedef struct QEMU_PACKED NvmeZoneIdList {
> +    uint16_t nzid;
> +    uint16_t rsvd2[3];
> +    uint64_t zids[511];
> +} NvmeZoneIdList;
> +
>  static inline void _nvme_check_size(void)
>  {
>      QEMU_BUILD_BUG_ON(sizeof(NvmeBar) !=3D 4096);
> @@ -1655,5 +1662,6 @@ static inline void _nvme_check_size(void)
>      QEMU_BUILD_BUG_ON(sizeof(NvmePriCtrlCap) !=3D 4096);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlEntry) !=3D 32);
>      QEMU_BUILD_BUG_ON(sizeof(NvmeSecCtrlList) !=3D 4096);
> +    QEMU_BUILD_BUG_ON(sizeof(NvmeZoneIdList) !=3D 4096);
>  }
>  #endif
> --=20
> 2.27.0
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--MUoUSTBRzis8hy8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNSO30ACgkQTeGvMW1P
Dem3ewf+MXg5SVNGRjXIoC2Wj0NAGUlDO0mWnf5jZJw0bamfzmpW0+F/SBxB1dtZ
jsvwb650OHMVL2aiOr/IpBy7FE3WbSVi6eRYt6EhoXfNaAJAItFw++TekxLHv1LG
PrZKh6vhZTe52En3aNuU71ntnM6C7eAstdWN/FpPjD53mWwO3Go6ngeZFJO1QyBK
DDgBZjmE2lJankKetjl2al9fuBQJmq/Q35b/GnUKhB9gd3uNsA4jMbOdolLjoQH4
2zkOo3Eu3YuFAcSSP8p9Eo47RTjwRAQHRCKQssS2/SmIcHTwIeN6iqQYarsR3y2a
bNofKew5P5dNNZ5zmRI9hVTUje7jSg==
=YNI9
-----END PGP SIGNATURE-----

--MUoUSTBRzis8hy8C--

