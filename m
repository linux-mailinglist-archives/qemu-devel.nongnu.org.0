Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872F92B4344
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:04:37 +0100 (CET)
Received: from localhost ([::1]:41540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedFM-0001an-2n
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ked8s-0008Kl-4U; Mon, 16 Nov 2020 06:57:54 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ked8n-0002QP-2j; Mon, 16 Nov 2020 06:57:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 22A0B5C0191;
 Mon, 16 Nov 2020 06:57:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 16 Nov 2020 06:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=rj7QpRX9cQ5qjekoSN37yWHq45w
 pNvR0qYMxAyKDCOA=; b=1Fg9e3DQnkTv+cJfvyoKJNKlPb0lzff7BLp2VSbwDpE
 kav2SCqHp13xsH2ARA4Hdqpexs4VS1uWUPyRtEj0rCwQEdXu4RFTopM0g+rl7eq4
 rc0dbr6eyv5dfPpMbb8bChDoLtjVkY276k+RN078/0aAEMor0KMDV2sYqmiWIB6/
 xF5jdLKgmcVgeaGcq8Jzi9+V0Ch+4NL8BY+9yb+u/g6gwsmKR/Fs+DHh8dqvTCSX
 6ClTwdIggAJLIgeWc1QYjye5jGj8iYKAH+05IINSlC21vl/5NLxCLHP+iiUTIu2W
 AVfOPGj4F3c8/Zv/fRd26UkhGjWD7Dsbjg3KyTKR2YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rj7QpR
 X9cQ5qjekoSN37yWHq45wpNvR0qYMxAyKDCOA=; b=d06e6AfCxK1fJ0ue93zixK
 0GSkXNx+larughAPgk1LZQqXTq06i/v15k/9wkG3yjTuEmDStnVTsQepiwbkmzBV
 /rfca+iTEKcxXGeQVyibfkhloOJkHuMLUX4solJsfLEWNUs0Gb99YnbgKeVXKL7L
 ePkjl3o2UQcPDux/sIXzCpFZWlF1RcHCoMOD1iG4GHzH63nTtTODCij198SWu74M
 3wQQD3B7r1ah1rQJNGT/ksq6ARvP9mt2vatsLGHIwuPiJ4A/tS9SFcWjCO55UMkp
 p0Qi/T8XOeNpbYSspqlsMEUIvQjRCFCsin4f0Kf/+pFVxun2VSmeAcVudvdQ76Tg
 ==
X-ME-Sender: <xms:O2myX89eFUFUdQ560aFhJTl1fIFGvAHS53JQnsOiL88KI-gQD7zxlw>
 <xme:O2myX0t0ERr70VrPBOEMdm2Xw08fL_T_Dz42DMAvpbUyGlPG1juXdrxRnA__lrkbU
 ZzEybzu7hCDd5nerRY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefuddgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:O2myXyA-bv5h30eZMYc4wpXeRHgtFSI2FGewmvPc2wjeM7ui_lKjHA>
 <xmx:O2myX8efJKuyEva9rjoVbjL86-0sCgLBmN7xVjRM_S3C5kyg-1Tu4A>
 <xmx:O2myXxOW3N-fp5q_5xFJu4TQ5xF-UMmxp4_TYlYdkaKQAW6E4dXEzQ>
 <xmx:PGmyX9AVZPLP8rNIwU4L8Zy1eW3nPqGdphPXpYbam6atlPwGygT8-w>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1557A328005E;
 Mon, 16 Nov 2020 06:57:45 -0500 (EST)
Date: Mon, 16 Nov 2020 12:57:44 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v8 3/5] hw/block/nvme: add dulbe support
Message-ID: <20201116115744.GC982821@apples.localdomain>
References: <20201112195945.819915-1-its@irrelevant.dk>
 <20201112195945.819915-4-its@irrelevant.dk>
 <20201116114348.GC7308@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline
In-Reply-To: <20201116114348.GC7308@localhost.localdomain>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 06:52:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bAmEntskrkuBymla
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 16 20:43, Minwoo Im wrote:
> On 11/12 20:59, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Add support for reporting the Deallocated or Unwritten Logical Block
> > Error (DULBE).
> >=20
> > Rely on the block status flags reported by the block layer and consider
> > any block with the BDRV_BLOCK_ZERO flag to be deallocated.
> >=20
> > Multiple factors affect when a Write Zeroes command result in
> > deallocation of blocks.
> >=20
> >   * the underlying file system block size
> >   * the blockdev format
> >   * the 'discard' and 'logical_block_size' parameters
> >=20
> >      format | discard | wz (512B)  wz (4KiB)  wz (64KiB)
> >     -----------------------------------------------------
> >       qcow2    ignore   n          n          y
> >       qcow2    unmap    n          n          y
> >       raw      ignore   n          y          y
> >       raw      unmap    n          y          y
> >=20
> > So, this works best with an image in raw format and 4KiB LBAs, since
> > holes can then be punched on a per-block basis (this assumes a file
> > system with a 4kb block size, YMMV). A qcow2 image, uses a cluster size
> > of 64KiB by default and blocks will only be marked deallocated if a full
> > cluster is zeroed or discarded. However, this *is* consistent with the
> > spec since Write Zeroes "should" deallocate the block if the Deallocate
> > attribute is set and "may" deallocate if the Deallocate attribute is not
> > set. Thus, we always try to deallocate (the BDRV_REQ_MAY_UNMAP flag is
> > always set).
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/block/nvme-ns.h    |  4 ++
> >  include/block/nvme.h  |  5 +++
> >  hw/block/nvme-ns.c    |  8 ++--
> >  hw/block/nvme.c       | 91 ++++++++++++++++++++++++++++++++++++++++++-
> >  hw/block/trace-events |  4 ++
> >  5 files changed, 107 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> > index 83734f4606e1..44bf6271b744 100644
> > --- a/hw/block/nvme-ns.h
> > +++ b/hw/block/nvme-ns.h
> > @@ -31,6 +31,10 @@ typedef struct NvmeNamespace {
> >      NvmeIdNs     id_ns;
> > =20
> >      NvmeNamespaceParams params;
> > +
> > +    struct {
> > +        uint32_t err_rec;
> > +    } features;
> >  } NvmeNamespace;
> > =20
> >  static inline uint32_t nvme_nsid(NvmeNamespace *ns)
> > diff --git a/include/block/nvme.h b/include/block/nvme.h
> > index 8a46d9cf015f..966c3bb304bd 100644
> > --- a/include/block/nvme.h
> > +++ b/include/block/nvme.h
> > @@ -687,6 +687,7 @@ enum NvmeStatusCodes {
> >      NVME_E2E_REF_ERROR          =3D 0x0284,
> >      NVME_CMP_FAILURE            =3D 0x0285,
> >      NVME_ACCESS_DENIED          =3D 0x0286,
> > +    NVME_DULB                   =3D 0x0287,
> >      NVME_MORE                   =3D 0x2000,
> >      NVME_DNR                    =3D 0x4000,
> >      NVME_NO_COMPLETE            =3D 0xffff,
> > @@ -903,6 +904,9 @@ enum NvmeIdCtrlLpa {
> >  #define NVME_AEC_NS_ATTR(aec)       ((aec >> 8) & 0x1)
> >  #define NVME_AEC_FW_ACTIVATION(aec) ((aec >> 9) & 0x1)
> > =20
> > +#define NVME_ERR_REC_TLER(err_rec)  (err_rec & 0xffff)
> > +#define NVME_ERR_REC_DULBE(err_rec) (err_rec & 0x10000)
> > +
> >  enum NvmeFeatureIds {
> >      NVME_ARBITRATION                =3D 0x1,
> >      NVME_POWER_MANAGEMENT           =3D 0x2,
> > @@ -1023,6 +1027,7 @@ enum NvmeNsIdentifierType {
> > =20
> > =20
> >  #define NVME_ID_NS_NSFEAT_THIN(nsfeat)      ((nsfeat & 0x1))
> > +#define NVME_ID_NS_NSFEAT_DULBE(nsfeat)     ((nsfeat >> 2) & 0x1)
> >  #define NVME_ID_NS_FLBAS_EXTENDED(flbas)    ((flbas >> 4) & 0x1)
> >  #define NVME_ID_NS_FLBAS_INDEX(flbas)       ((flbas & 0xf))
> >  #define NVME_ID_NS_MC_SEPARATE(mc)          ((mc >> 1) & 0x1)
> > diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> > index 31c80cdf5b5f..f1cc734c60f5 100644
> > --- a/hw/block/nvme-ns.c
> > +++ b/hw/block/nvme-ns.c
> > @@ -33,9 +33,7 @@ static void nvme_ns_init(NvmeNamespace *ns)
> >      NvmeIdNs *id_ns =3D &ns->id_ns;
> >      int lba_index =3D NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
> > =20
> > -    if (blk_get_flags(ns->blkconf.blk) & BDRV_O_UNMAP) {
> > -        ns->id_ns.dlfeat =3D 0x9;
> > -    }
> > +    ns->id_ns.dlfeat =3D 0x9;
> > =20
> >      id_ns->lbaf[lba_index].ds =3D 31 - clz32(ns->blkconf.logical_block=
_size);
> > =20
> > @@ -44,6 +42,9 @@ static void nvme_ns_init(NvmeNamespace *ns)
> >      /* no thin provisioning */
> >      id_ns->ncap =3D id_ns->nsze;
> >      id_ns->nuse =3D id_ns->ncap;
> > +
> > +    /* support DULBE */
> > +    id_ns->nsfeat |=3D 0x4;
> >  }
> > =20
> >  static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **er=
rp)
> > @@ -92,6 +93,7 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Err=
or **errp)
> >      }
> > =20
> >      nvme_ns_init(ns);
> > +
> >      if (nvme_register_namespace(n, ns, errp)) {
> >          return -1;
> >      }
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index a96a996ddc0d..8d75a89fd872 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -105,6 +105,7 @@ static const bool nvme_feature_support[NVME_FID_MAX=
] =3D {
> > =20
> >  static const uint32_t nvme_feature_cap[NVME_FID_MAX] =3D {
> >      [NVME_TEMPERATURE_THRESHOLD]    =3D NVME_FEAT_CAP_CHANGE,
> > +    [NVME_ERROR_RECOVERY]           =3D NVME_FEAT_CAP_CHANGE | NVME_FE=
AT_CAP_NS,
> >      [NVME_VOLATILE_WRITE_CACHE]     =3D NVME_FEAT_CAP_CHANGE,
> >      [NVME_NUMBER_OF_QUEUES]         =3D NVME_FEAT_CAP_CHANGE,
> >      [NVME_ASYNCHRONOUS_EVENT_CONF]  =3D NVME_FEAT_CAP_CHANGE,
> > @@ -878,6 +879,49 @@ static inline uint16_t nvme_check_bounds(NvmeNames=
pace *ns, uint64_t slba,
> >      return NVME_SUCCESS;
> >  }
> > =20
> > +static uint16_t nvme_check_dulbe(NvmeNamespace *ns, uint64_t slba,
> > +                                 uint32_t nlb)
> > +{
> > +    BlockDriverState *bs =3D blk_bs(ns->blkconf.blk);
> > +
> > +    int64_t pnum =3D 0, bytes =3D nvme_l2b(ns, nlb);
> > +    int64_t offset =3D nvme_l2b(ns, slba);
> > +    bool zeroed;
> > +    int ret;
> > +
> > +    Error *local_err =3D NULL;
> > +
> > +    /*
> > +     * `pnum` holds the number of bytes after offset that shares the s=
ame
> > +     * allocation status as the byte at offset. If `pnum` is different=
 from
> > +     * `bytes`, we should check the allocation status of the next rang=
e and
> > +     * continue this until all bytes have been checked.
> > +     */
> > +    do {
> > +        bytes -=3D pnum;
> > +
> > +        ret =3D bdrv_block_status(bs, offset, bytes, &pnum, NULL, NULL=
);
> > +        if (ret < 0) {
> > +            error_setg_errno(&local_err, -ret, "unable to get block st=
atus");
> > +            error_report_err(local_err);
> > +
> > +            return NVME_INTERNAL_DEV_ERROR;
> > +        }
> > +
> > +        zeroed =3D !!(ret & BDRV_BLOCK_ZERO);
> > +
> > +        trace_pci_nvme_block_status(offset, bytes, pnum, ret, zeroed);
> > +
> > +        if (zeroed) {
> > +            return NVME_DULB;
> > +        }
> > +
> > +        offset +=3D pnum;
> > +    } while (pnum !=3D bytes);
> > +
> > +    return NVME_SUCCESS;
> > +}
> > +
> >  static void nvme_aio_err(NvmeRequest *req, int ret)
> >  {
> >      uint16_t status =3D NVME_SUCCESS;
> > @@ -996,6 +1040,15 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest =
*req)
> >          goto invalid;
> >      }
> > =20
> > +    if (acct =3D=3D BLOCK_ACCT_READ) {
> > +        if (NVME_ERR_REC_DULBE(ns->features.err_rec)) {
> > +            status =3D nvme_check_dulbe(ns, slba, nlb);
> > +            if (status) {
> > +                goto invalid;
> > +            }
> > +        }
> > +    }
> > +
> >      status =3D nvme_map_dptr(n, data_size, req);
> >      if (status) {
> >          goto invalid;
> > @@ -1643,6 +1696,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, Nvm=
eRequest *req)
> >      uint8_t fid =3D NVME_GETSETFEAT_FID(dw10);
> >      NvmeGetFeatureSelect sel =3D NVME_GETFEAT_SELECT(dw10);
> >      uint16_t iv;
> > +    NvmeNamespace *ns;
> > =20
> >      static const uint32_t nvme_feature_default[NVME_FID_MAX] =3D {
> >          [NVME_ARBITRATION] =3D NVME_ARB_AB_NOLIMIT,
> > @@ -1705,6 +1759,18 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, Nv=
meRequest *req)
> >          }
> > =20
> >          return NVME_INVALID_FIELD | NVME_DNR;
> > +    case NVME_ERROR_RECOVERY:
> > +        if (!nvme_nsid_valid(n, nsid)) {
> > +            return NVME_INVALID_NSID | NVME_DNR;
> > +        }
> > +
> > +        ns =3D nvme_ns(n, nsid);
> > +        if (unlikely(!ns)) {
> > +            return NVME_INVALID_FIELD | NVME_DNR;
> > +        }
> > +
> > +        result =3D ns->features.err_rec;
> > +        goto out;
> >      case NVME_VOLATILE_WRITE_CACHE:
> >          result =3D n->features.vwc;
> >          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled"=
);
> > @@ -1777,7 +1843,7 @@ static uint16_t nvme_set_feature_timestamp(NvmeCt=
rl *n, NvmeRequest *req)
> > =20
> >  static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
> >  {
> > -    NvmeNamespace *ns;
> > +    NvmeNamespace *ns =3D NULL;
> > =20
> >      NvmeCmd *cmd =3D &req->cmd;
> >      uint32_t dw10 =3D le32_to_cpu(cmd->cdw10);
> > @@ -1785,6 +1851,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, Nvm=
eRequest *req)
> >      uint32_t nsid =3D le32_to_cpu(cmd->nsid);
> >      uint8_t fid =3D NVME_GETSETFEAT_FID(dw10);
> >      uint8_t save =3D NVME_SETFEAT_SAVE(dw10);
> > +    int i;
> > =20
> >      trace_pci_nvme_setfeat(nvme_cid(req), nsid, fid, save, dw11);
> > =20
> > @@ -1844,11 +1911,31 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, N=
vmeRequest *req)
> >                                 NVME_LOG_SMART_INFO);
> >          }
> > =20
> > +        break;
> > +    case NVME_ERROR_RECOVERY:
> > +        if (nsid =3D=3D NVME_NSID_BROADCAST) {
> > +            for (i =3D 1; i <=3D n->num_namespaces; i++) {
> > +                ns =3D nvme_ns(n, i);
> > +
> > +                if (!ns) {
> > +                    continue;
> > +                }
> > +
> > +                if (NVME_ID_NS_NSFEAT_DULBE(ns->id_ns.nsfeat)) {
> > +                    ns->features.err_rec =3D dw11;
> > +                }
> > +            }
> > +
> > +            break;
> > +        }
> > +
> > +        assert(ns);
>=20
> Klaus,
>=20
> Sorry, but can we have assert for the failure that might happen due to
> user's mis-behavior?  Why don't we have NVME_INVALID_NSID for this case?
>=20

Oh. I see that this is pretty convoluted.

The assert catches if you add a new namespace specific feature but
forget to give it the NVME_FEAT_CAP_NS capability in the
nvme_feature_cap array.

If NVME_FEAT_CAP_NS is correctly set for the feature, then the code at
the beginning of nvme_set_feature will ensure that the namespace id
given is valid.

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl+yaTUACgkQTeGvMW1P
DelKBAf9F/Zy6SfYZKrdhOIjuYRB/wNqwQ+6iSOrREEB5LjTf1UEjzGt7fEUceES
Ir/CHYx+s8fw4yqmHFCxL+lg25uiYqATUoLFrLkeRTiInhVYVnStsLp+8evqDKnd
n4/SbedXSwqZ3ZswBYC8FduBrlsff9k8zzIbcQ9NEfhNvfSWRGV3MJ8Eqk01iVDr
UMSOJT1hbuKOpLMa2ArMo2qw9DZzLyAnZS6nneufs4chAs7eeMKFEbdWm7zSv/eQ
l3LO4FLcBN8apJRQB/g1ZS/0U0HiNVHYDESsio0PemWksbvXgVDtCh9mP5uMCthH
BwSLkeHeDdTfoooxjWAWOINdAwiHQg==
=LZXI
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--

