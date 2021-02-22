Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0F7321F2A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:29:51 +0100 (CET)
Received: from localhost ([::1]:40044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFxt-0008Kn-DU
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEFsw-0006N8-Jd; Mon, 22 Feb 2021 13:24:42 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:49827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEFsu-0001YB-0Q; Mon, 22 Feb 2021 13:24:42 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9F46E580231;
 Mon, 22 Feb 2021 13:24:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 13:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=cCwwDhYTge6GD6K/le5yQmkQAmh
 hdisMPHedX8KGw2A=; b=Xa9hD/LNYZN4MdnPoZRidjznvCKI20X5pdooJHeEkf6
 5/IqKKryswwtITOHUUHTdGnfL6KYzJjQTcA7gfvztI0G1wXGDn01GjdbHwXUGTFl
 lGnrx3RjkOaqQj5tADz8fvP4CT6IGCdpYScax7SAMuaRFkHt3d0oli9eEYXtsRvh
 yS1FzhzY9EWzIz8W/vvCkfR0ZE5W7wi+PzSMl1e8QWC1nXYmrC1NwyOF7ldG2bhl
 ZxJMmhF2hfjY/fAXUXpQi/9kkgzYX9Tv4yxB/v70vzZDp1abeSSuRu+ypL3IuAC2
 p0nGvsC0wQIfwo2wWLBtFS3RNQbtBidcvFPqqLRgSLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cCwwDh
 YTge6GD6K/le5yQmkQAmhhdisMPHedX8KGw2A=; b=YhqUpc+r6s8SFvnKBq21zq
 v0Tq3nQHRLk3xMZnED4XfKSeIq8rAl70Uop1A6Z5wbaftJAiLfZhhq1lTv7KYQTj
 gcZazLALB7nkMSTwKWq9zDDEuV8+F86JcB5hVnp1dWpGoXrIh7FcdHB6aYNfyfle
 ggT5YwedCt+3ryerSNL8ZBsMeTP76BJtd8WkL0u8GP0uR4wmtJh1fQyyoxICv4Bz
 G842JxHORubKIfeoYKuFuSlFBpPkGMlD/fRaBzf4gTs9sh8IfbZeh9glekKNC4NF
 +N+rHkE7KnzXDj9087ZpA7cwt1uGKn64qIMbTxlikM5uKJ62OHjElGgX+1sRdQpA
 ==
X-ME-Sender: <xms:5fYzYM8GGB8WbGgecUgwALnDUZLGa9BgHjY_ylXJekBr1NLTQrRyMw>
 <xme:5fYzYEv8IuTWIH9FA5LpYeMnvetoIyMdG71OTf2A-tN3U_zXdaumR-Hm_uQADmXJW
 u5jCtgATO2Q37Q0d-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgdduudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:5fYzYCAmFSgGOt7qd2kt_f7avebO5kqb4IE07sC4_1te__kGEGAz_Q>
 <xmx:5fYzYMdnpTu1ep9sTBhZiTp1qsb1Oo1TnENb83cHk3sUFdqbazvC_Q>
 <xmx:5fYzYBO-YXrzeS7PfX2RAQXL9au2jm1ZtukQKDGddxspn0hc1ZBR_A>
 <xmx:5vYzYKjW2dWY2EWmJknUY-104lnbvz3OIGpmqbyrgpOO9g-e0LkF8A>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2977E108005F;
 Mon, 22 Feb 2021 13:24:36 -0500 (EST)
Date: Mon, 22 Feb 2021 19:24:33 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH 3/3] hw/block/nvme: report non-mdts command size limit
 for dsm
Message-ID: <YDP24RvL/zsqH5pl@apples.localdomain>
References: <20210222070615.9177-1-its@irrelevant.dk>
 <20210222070615.9177-4-its@irrelevant.dk>
 <20210222121105.GD2856@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h2JNhL008leLz+RN"
Content-Disposition: inline
In-Reply-To: <20210222121105.GD2856@localhost.localdomain>
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--h2JNhL008leLz+RN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 22 21:11, Minwoo Im wrote:
> On 21-02-22 08:06:15, Klaus Jensen wrote:
> > From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> >=20
> > Dataset Management is not subject to MDTS, but exceeded a certain size
> > per range causes internal looping. Report this limit (DMRSL) in the NVM
> > command set specific identify controller data structure.
> >=20
> > Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme.h       |  1 +
> >  include/block/nvme.h  | 11 +++++++++++
> >  hw/block/nvme.c       | 30 ++++++++++++++++++++----------
> >  hw/block/trace-events |  1 +
> >  4 files changed, 33 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > index cb2b5175f1a1..3046b82b3da1 100644
> > --- a/hw/block/nvme.h
> > +++ b/hw/block/nvme.h
> > @@ -172,6 +172,7 @@ typedef struct NvmeCtrl {
> >      int         aer_queued;
> > =20
> >      uint8_t     zasl;
> > +    uint32_t    dmrsl;
> > =20
> >      NvmeSubsystem   *subsys;
> > =20
> > diff --git a/include/block/nvme.h b/include/block/nvme.h
> > index b23f3ae2279f..16d8c4c90f7e 100644
> > --- a/include/block/nvme.h
> > +++ b/include/block/nvme.h
> > @@ -1041,6 +1041,16 @@ typedef struct NvmeIdCtrlZoned {
> >      uint8_t     rsvd1[4095];
> >  } NvmeIdCtrlZoned;
> > =20
> > +typedef struct NvmeIdCtrlNvm {
> > +    uint8_t     vsl;
> > +    uint8_t     wzsl;
> > +    uint8_t     wusl;
> > +    uint8_t     dmrl;
> > +    uint32_t    dmrsl;
> > +    uint64_t    dmsl;
> > +    uint8_t     rsvd16[4080];
> > +} NvmeIdCtrlNvm;
> > +
> >  enum NvmeIdCtrlOacs {
> >      NVME_OACS_SECURITY  =3D 1 << 0,
> >      NVME_OACS_FORMAT    =3D 1 << 1,
> > @@ -1396,6 +1406,7 @@ static inline void _nvme_check_size(void)
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeEffectsLog) !=3D 4096);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrl) !=3D 4096);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrlZoned) !=3D 4096);
> > +    QEMU_BUILD_BUG_ON(sizeof(NvmeIdCtrlNvm) !=3D 4096);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeLBAF) !=3D 4);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeLBAFE) !=3D 16);
> >      QEMU_BUILD_BUG_ON(sizeof(NvmeIdNs) !=3D 4096);
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 897b9ff0db91..5d6bba5fcb0d 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -1777,6 +1777,10 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeReques=
t *req)
> >              trace_pci_nvme_dsm_deallocate(nvme_cid(req), nvme_nsid(ns)=
, slba,
> >                                            nlb);
> > =20
> > +            if (nlb > n->dmrsl) {
> > +                trace_pci_nvme_dsm_single_range_limit_exceeded(nlb, n-=
>dmrsl);
> > +            }
> > +
> >              offset =3D nvme_l2b(ns, slba);
> >              len =3D nvme_l2b(ns, nlb);
> > =20
> > @@ -3202,21 +3206,24 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n,=
 NvmeRequest *req)
> >  static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
> >  {
> >      NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
> > -    NvmeIdCtrlZoned id =3D {};
> > +    uint8_t id[NVME_IDENTIFY_DATA_SIZE] =3D {};
> > =20
> >      trace_pci_nvme_identify_ctrl_csi(c->csi);
> > =20
> > -    if (c->csi =3D=3D NVME_CSI_NVM) {
> > -        return nvme_rpt_empty_id_struct(n, req);
> > -    } else if (c->csi =3D=3D NVME_CSI_ZONED) {
> > -        if (n->params.zasl_bs) {
> > -            id.zasl =3D n->zasl;
> > -        }
> > -        return nvme_dma(n, (uint8_t *)&id, sizeof(id),
> > -                        DMA_DIRECTION_FROM_DEVICE, req);
> > +    switch (c->csi) {
> > +    case NVME_CSI_NVM:
> > +        ((NvmeIdCtrlNvm *)&id)->dmrsl =3D cpu_to_le32(n->dmrsl);
> > +        break;
> > +
> > +    case NVME_CSI_ZONED:
> > +        ((NvmeIdCtrlZoned *)&id)->zasl =3D n->zasl;
>=20
> Question.  Are we okay without checking this like above ? :)
>=20
> 	if (n->params.zasl_bs) {
> 		((NvmeIdCtrlZoned *)&id)->zasl =3D n->zasl;
> 	}
>=20

Ah yeah. Thanks!

I forgot about that zasl_bs vs zasl quirkiness.

> > +        break;
> > +
> > +    default:
> > +        return NVME_INVALID_FIELD | NVME_DNR;
> >      }
> > =20
> > -    return NVME_INVALID_FIELD | NVME_DNR;
> > +    return nvme_dma(n, id, sizeof(id), DMA_DIRECTION_FROM_DEVICE, req);
> >  }
> > =20
> >  static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
> > @@ -4670,6 +4677,9 @@ int nvme_register_namespace(NvmeCtrl *n, NvmeName=
space *ns, Error **errp)
> > =20
> >      n->namespaces[nsid - 1] =3D ns;
> > =20
> > +    n->dmrsl =3D MIN_NON_ZERO(n->dmrsl,
> > +                            BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
> > +
> >      return 0;
> >  }
> > =20
> > diff --git a/hw/block/trace-events b/hw/block/trace-events
> > index 1f958d09d2a9..27940fe2e98a 100644
> > --- a/hw/block/trace-events
> > +++ b/hw/block/trace-events
> > @@ -51,6 +51,7 @@ pci_nvme_copy_cb(uint16_t cid) "cid %"PRIu16""
> >  pci_nvme_block_status(int64_t offset, int64_t bytes, int64_t pnum, int=
 ret, bool zeroed) "offset %"PRId64" bytes %"PRId64" pnum %"PRId64" ret 0x%=
x zeroed %d"
> >  pci_nvme_dsm(uint16_t cid, uint32_t nsid, uint32_t nr, uint32_t attr) =
"cid %"PRIu16" nsid %"PRIu32" nr %"PRIu32" attr 0x%"PRIx32""
> >  pci_nvme_dsm_deallocate(uint16_t cid, uint32_t nsid, uint64_t slba, ui=
nt32_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""
> > +pci_nvme_dsm_single_range_limit_exceeded(uint32_t nlb, uint32_t dmrsl)=
 "nlb %"PRIu32" dmrsl %"PRIu32""
> >  pci_nvme_compare(uint16_t cid, uint32_t nsid, uint64_t slba, uint32_t =
nlb) "cid %"PRIu16" nsid %"PRIu32" slba 0x%"PRIx64" nlb %"PRIu32""
> >  pci_nvme_compare_cb(uint16_t cid) "cid %"PRIu16""
> >  pci_nvme_aio_discard_cb(uint16_t cid) "cid %"PRIu16""
> > --=20
> > 2.30.1
> >=20
> >=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--h2JNhL008leLz+RN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAz9t4ACgkQTeGvMW1P
DekxNAgApayuWVNJuxVK3fJFXANv4RZMdAYDDr+/7n1nrRIrtroBICEx/JViZ6wm
Czp/cPdtpA80l4UanyPVFMPB4B/0yytztLnvA0juuFBKrOp1GrY6QduCARC9fPaY
KZSAjKkA5mbFYyb+GE862BhyxMLIneSFQjvLbG89tyac642vKwPeXgqw4aph5xlR
WmkpdUqZXL1+69XA5/WQx3gQJMRoFMO0nkQDCY0p0dCZBjMD+CDswxqjyvhcfwji
eqbdyo1Y8XxXMVjNepYiFfpA974jB7TbS85rUfYChzeEG0xV4XRGmTAcNxDW3phW
5SXm376DyrIR0G+dZCuIgMwmVQoJlA==
=yGpO
-----END PGP SIGNATURE-----

--h2JNhL008leLz+RN--

