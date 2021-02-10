Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6A2316583
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:47:13 +0100 (CET)
Received: from localhost ([::1]:55646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nxg-0003oB-9M
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9nsx-0002bj-5c; Wed, 10 Feb 2021 06:42:19 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:51591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9nsv-0007qj-BD; Wed, 10 Feb 2021 06:42:18 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E2B3AC9B;
 Wed, 10 Feb 2021 06:42:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 06:42:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=vHG9GmJOFeeLpmXBDBamLx7BDr+
 hd4+g6oA3+GQmPXM=; b=Wl4l45pMotqhftW9A+8R4dotBkzKcOKhtfWWkvUAOrr
 HvDp6zbdJ0qDFHw0z30W56L9b+KpbkAnRRYdLp5kxrZYId046DAa35GqjD5bnt1D
 kOGsiwHCift1CXFQJG78FxuRXHtz2FZsxCD89VFYmxNMvJMFOQHo4cIYNjuLeDhC
 V38EAAR8wpytce+yEPJ+YahoOlKoHOHwiz1HMMqqBtJhmvu8RIJdh9yNFG2vo22/
 caKfXosjGv2sGQdI91ffkDgKEJStKa9kxLMHBuTt31ZRT5WqzrmfUls/5ZRukDbC
 QOqFsEze2U82Qf75YmdZfLUzoryAtixXVey7mF7qCiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vHG9Gm
 JOFeeLpmXBDBamLx7BDr+hd4+g6oA3+GQmPXM=; b=eDPQPucKcLYlrNN2Jlw0RG
 9vu4Ub7Zanv+wjVQTuj9deK7L2prDASZaGKtJ+K+1XcyBADpBwRQD900us1b7sHt
 VTTwNpSoamEQoBZme6h9izmw6HJSSa5K97Y4hZGGZ5vvdwb6bAMRoyk3PHqT17zD
 z0FF5p1DTywowf/2+ummzADrMcOAcOKeOMfsPPOxdcpqZ0LKPnJzm/vS+9s0uzoI
 NhpG26Q0fpTjV3DecxUrizQB2vACF396eO1BYx2qdrXjpO7ON66GsLHTi+CN+o6v
 +erv2aMploNK0Lo0T5T0A2oZjGLOqTVOr24wH83i4xi4TVAUhQMlzOPoQDVKJJrw
 ==
X-ME-Sender: <xms:lcYjYBWtAOtFWkWuieYtqqxCbgS24UIHCYVTAJoVOclaBgVPL8Na_A>
 <xme:lcYjYG2ZJX9uHCLQGkRNVQo2_SCjtHblusIwsRaqnUw2P-n-7YhmpUBYU6JqTatJV
 JvqaIDWVASbiRnO3MY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:lcYjYPHg6blkULkVoLS5234BSZmSVy6OtWZq7lUvSwxVakMxEsASaA>
 <xmx:lcYjYMhCItlA8jRgY1a7IQclNMQ27Q_InTlbDkUHL7sL7mzf76C1ZA>
 <xmx:lcYjYC9o0GPOSXwmVzefEeWkkacahreAq06RSUYPCA05X-irVldHZA>
 <xmx:lsYjYPCbZ6Mwhey7ns038pRO3MOfuTCqZ1VtzgrisOyco1YfauJ6Jw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id AC6FC108005C;
 Wed, 10 Feb 2021 06:42:12 -0500 (EST)
Date: Wed, 10 Feb 2021 12:42:10 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH 2/2] hw/block/nvme: add write uncorrectable command
Message-ID: <YCPGki8xxU/chdJP@apples.localdomain>
References: <20210210070646.730110-1-its@irrelevant.dk>
 <20210210070646.730110-3-its@irrelevant.dk>
 <20210210111432.GC9664@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hgLjN04d7lqypgWa"
Content-Disposition: inline
In-Reply-To: <20210210111432.GC9664@localhost.localdomain>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hgLjN04d7lqypgWa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 10 20:14, Minwoo Im wrote:
> On 21-02-10 08:06:46, Klaus Jensen wrote:
> > From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> >=20
> > Add support for marking blocks invalid with the Write Uncorrectable
> > command. Block status is tracked in a (non-persistent) bitmap that is
> > checked on all reads and written to on all writes. This is potentially
> > expensive, so keep Write Uncorrectable disabled by default.
> >=20
> > Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  docs/specs/nvme.txt   |  3 ++
> >  hw/block/nvme-ns.h    |  2 ++
> >  hw/block/nvme.h       |  1 +
> >  hw/block/nvme-ns.c    |  2 ++
> >  hw/block/nvme.c       | 65 +++++++++++++++++++++++++++++++++++++------
> >  hw/block/trace-events |  1 +
> >  6 files changed, 66 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/docs/specs/nvme.txt b/docs/specs/nvme.txt
> > index 56d393884e7a..88f9cc278d4c 100644
> > --- a/docs/specs/nvme.txt
> > +++ b/docs/specs/nvme.txt
> > @@ -19,5 +19,8 @@ Known issues
> > =20
> >  * The accounting numbers in the SMART/Health are reset across power cy=
cles
> > =20
> > +* Marking blocks invalid with the Write Uncorrectable is not persisted=
 across
> > +  power cycles.
> > +
> >  * Interrupt Coalescing is not supported and is disabled by default in =
volation
> >    of the specification.
> > diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> > index 7af6884862b5..15fa422ded03 100644
> > --- a/hw/block/nvme-ns.h
> > +++ b/hw/block/nvme-ns.h
> > @@ -72,6 +72,8 @@ typedef struct NvmeNamespace {
> >      struct {
> >          uint32_t err_rec;
> >      } features;
> > +
> > +    unsigned long *uncorrectable;
> >  } NvmeNamespace;
> > =20
> >  static inline uint32_t nvme_nsid(NvmeNamespace *ns)
> > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > index 98082b2dfba3..9b8f85b9cf16 100644
> > --- a/hw/block/nvme.h
> > +++ b/hw/block/nvme.h
> > @@ -68,6 +68,7 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
> >      case NVME_CMD_FLUSH:            return "NVME_NVM_CMD_FLUSH";
> >      case NVME_CMD_WRITE:            return "NVME_NVM_CMD_WRITE";
> >      case NVME_CMD_READ:             return "NVME_NVM_CMD_READ";
> > +    case NVME_CMD_WRITE_UNCOR:      return "NVME_CMD_WRITE_UNCOR";
> >      case NVME_CMD_COMPARE:          return "NVME_NVM_CMD_COMPARE";
> >      case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
> >      case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
> > diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> > index ade46e2f3739..742bbc4b4b62 100644
> > --- a/hw/block/nvme-ns.c
> > +++ b/hw/block/nvme-ns.c
> > @@ -72,6 +72,8 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **er=
rp)
> >      id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
> >      id_ns->msrc =3D ns->params.msrc;
> > =20
> > +    ns->uncorrectable =3D bitmap_new(id_ns->nsze);
> > +
> >      return 0;
> >  }
> > =20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index e5f6666725d7..56048046c193 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -1112,6 +1112,20 @@ static uint16_t nvme_check_dulbe(NvmeNamespace *=
ns, uint64_t slba,
> >      return NVME_SUCCESS;
> >  }
> > =20
> > +static inline uint16_t nvme_check_uncor(NvmeNamespace *ns, uint64_t sl=
ba,
> > +                                        uint32_t nlb)
> > +{
> > +    uint64_t elba =3D nlb + slba;
> > +
> > +    if (ns->uncorrectable) {
> > +        if (find_next_bit(ns->uncorrectable, elba, slba) < elba) {
> > +            return NVME_UNRECOVERED_READ | NVME_DNR;
> > +        }
> > +    }
> > +
> > +    return NVME_SUCCESS;
> > +}
> > +
> >  static void nvme_aio_err(NvmeRequest *req, int ret)
> >  {
> >      uint16_t status =3D NVME_SUCCESS;
> > @@ -1423,14 +1437,24 @@ static void nvme_rw_cb(void *opaque, int ret)
> >      BlockAcctCookie *acct =3D &req->acct;
> >      BlockAcctStats *stats =3D blk_get_stats(blk);
> > =20
> > +    bool is_write =3D nvme_is_write(req);
> > +
> >      trace_pci_nvme_rw_cb(nvme_cid(req), blk_name(blk));
> > =20
> > -    if (ns->params.zoned && nvme_is_write(req)) {
> > +    if (ns->params.zoned && is_write) {
> >          nvme_finalize_zoned_write(ns, req);
> >      }
> > =20
> >      if (!ret) {
> >          block_acct_done(stats, acct);
> > +
> > +        if (is_write) {
> > +            NvmeRwCmd *rw =3D (NvmeRwCmd *)&req->cmd;
> > +            uint64_t slba =3D le64_to_cpu(rw->slba);
> > +            uint32_t nlb =3D le16_to_cpu(rw->nlb) + 1;
> > +
> > +            bitmap_clear(ns->uncorrectable, slba, nlb);
>=20
> It might be nitpick, 'nlb' would easily represent the value which is
> defined itself in the spec which is zero-based.  Can we have this like:
>=20
> 	uint32_t nlb =3D le16_to_cpu(rw->nlb);
>=20
> 	bitmap_clear(ns->uncorrectable, slba, nlb + 1);
>=20


I do not disagree, but the `uint32_t nlb =3D le16_to_cpu(rw->nlb) + 1;`
pattern is already used in several places.

> Otherwise, it looks good to me.
>=20
> Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

--=20
One of us - No more doubt, silence or taboo about mental illness.

--hgLjN04d7lqypgWa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAjxpAACgkQTeGvMW1P
Dem7GQf/YO+/bsVkcM26QFw+eyvxf3uUmemOkXYz5bu9SMO6gljVTnQ57qtwsCt/
0dQ+vLPbCbNLd46ipagyf2CBAsKGc9MiWDFWxJUw4z5GOwVU6QzZf/LLqbHZSYha
qV7zTBssoI4Gny7jizKTyxNHjdCVIs+i2zwfVVb8KwKe/Pfl5UbuNND5FOBje+Nl
IAEGiEnTxP/GOCMfLnatUPOUEU9i9n4qT6/HeFjC9L3Tibs4g9YoKhSIME1gpSan
3nX6oh/fk+ySBjw0GA2emqLr+603TCfri3zxNIXv4ZZUthbVMOT+BY6ayV2tRbNJ
Tg9Rtj2EBSCZyewMdD2fXWp4qb8udA==
=raYu
-----END PGP SIGNATURE-----

--hgLjN04d7lqypgWa--

