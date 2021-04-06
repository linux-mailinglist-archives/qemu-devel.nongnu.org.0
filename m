Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA3F354DDA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 09:30:40 +0200 (CEST)
Received: from localhost ([::1]:44582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTgAZ-0004KX-8K
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 03:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTg5C-00032N-Pc; Tue, 06 Apr 2021 03:25:06 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:53503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTg5A-0006jf-JB; Tue, 06 Apr 2021 03:25:06 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9C52458049F;
 Tue,  6 Apr 2021 03:25:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 06 Apr 2021 03:25:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=xFHpRkA5dY8u6hDaLSn7nBwY4E6
 VXZdvxR7cVA0eDLo=; b=cjNK1F7B3CZIpZLfzBM9tsGR6rQgVXFU8JArxki6eXv
 ve7SKb2+w4niCeS5il4FzxDBgR270IOsvroP4o5EwMF37uRNsCHTOj4M996SDjqj
 S14hQGlJJeKPRGrtoSFPZJsfC1cJiMVxVCud1wRvEGzMinZ3FCvxZiq0Cbc8wP8s
 4lK5wYbg0uS2y0vGoXpMC5GDM+DyUIIFVosB19BuuS8SoV35bWyXqi1HsSd1N4LJ
 t06Fs7LvuQHluem1RMdcVoRexnb0m3fZTAXpilneaLb4Fb9PNPVKIElzhrG+/kiO
 NM6EjBxSeSjUccqCXg3VdFEi1PmXpUR+1yiuAHEeFsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xFHpRk
 A5dY8u6hDaLSn7nBwY4E6VXZdvxR7cVA0eDLo=; b=fAY1m4CoMaMhy8w2bq/zSO
 YpaD+qPgm8Vw/KTCEZy6oGK7abXb8yB4x7v4qGP57gI4U5UgvqI5BTPKQeBloKl+
 9cBIV2xg1Jm9P6ehzSIDNYfK+bx93jcWAXrpaTLln553XD0K5P4Dvso4lEQ7whub
 jwCVAACFwqah/mWHTGX8uXbxsOWt0xCUlGqP8mjxolLr0Rqb6Hhtui8b7MftzFpA
 l5+ZGQiLArAAmV3D6IOg64dYK2W+hXd91LD2TQ3C3F5Gn06P8I7068Zbi5WQu9eF
 t/f6TWrFUahSOhowIAh0Zf5nL32AquhX3tYNUhswzjIx4SdeJ5yD35JouB2Vll9g
 ==
X-ME-Sender: <xms:ywxsYPV8glRycZ4XeAwdLeEmaJMETQWthPGX6R0hElnR75JVGftksw>
 <xme:ywxsYJF8UGWEioqJlq00YRVYUStr09tezhIAnfAC1ezJfCSVhzhXQuR2ixI6wYclF
 H1hqWGXHpPyqCXTugI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejfedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ywxsYLcM8TtdCoiAdTG_m-JjSDcw6yHcngPwj4r0it45MUe5WAXx-g>
 <xmx:ywxsYKItv4V3aJIoSYPJMoK5yzOpbnCZzs66MmrT_Uf_SOB4E0vpnA>
 <xmx:ywxsYAFC95iRWDWtX749lpU8oACmLsKbI-6apYgfzRou50N8LUE_iQ>
 <xmx:zAxsYH1eyXC-tg4WM3q5bGskNPxh1OA-RA5-MZzfXrXXAowNkmqmNg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D305B240067;
 Tue,  6 Apr 2021 03:24:57 -0400 (EDT)
Date: Tue, 6 Apr 2021 09:24:55 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH for-6.0 v2 6/8] hw/block/nvme: update dmsrl limit on
 namespace detachment
Message-ID: <YGwMx5n2MzBkG8pQ@apples.localdomain>
References: <20210405175452.37578-1-its@irrelevant.dk>
 <20210405175452.37578-7-its@irrelevant.dk>
 <fa06244b-b4d9-9edb-0fef-495a477bbe71@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6SNtQ2Av9wDKSIoR"
Content-Disposition: inline
In-Reply-To: <fa06244b-b4d9-9edb-0fef-495a477bbe71@redhat.com>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6SNtQ2Av9wDKSIoR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  6 09:10, Philippe Mathieu-Daud=C3=A9 wrote:
> On 4/5/21 7:54 PM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > The Non-MDTS DMSRL limit must be recomputed when namespaces are
> > detached.
> >=20
> > Fixes: 645ce1a70cb6 ("hw/block/nvme: support namespace attachment comma=
nd")
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > ---
> >  hw/block/nvme.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index de0e726dfdd8..3dc51f407671 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -4876,6 +4876,21 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeReques=
t *req)
> >      return NVME_NO_COMPLETE;
> >  }
> > =20
> > +static void __nvme_update_dmrsl(NvmeCtrl *n)
> > +{
> > +    int nsid;
> > +
> > +    for (nsid =3D 1; nsid <=3D NVME_MAX_NAMESPACES; nsid++) {
> > +        NvmeNamespace *ns =3D nvme_ns(n, nsid);
> > +        if (!ns) {
> > +            continue;
> > +        }
> > +
> > +        n->dmrsl =3D MIN_NON_ZERO(n->dmrsl,
> > +                                BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, =
1));
> > +    }
> > +}
> > +
> >  static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
> >  static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
> >  {
> > @@ -4925,6 +4940,8 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, N=
vmeRequest *req)
> >              }
> > =20
> >              nvme_ns_detach(ctrl, ns);
> > +
> > +            __nvme_update_dmrsl(ctrl);
> >          }
>=20
> Why the '__' prefix? It doesn't seem clearer (I'm not sure there is
> a convention, it makes me think of a internal macro expansion use
> for preprocessor).
>=20
> There are very few uses of this prefix:
>=20
> hw/9pfs/cofs.c:21:static ssize_t __readlink(V9fsState *s, V9fsPath
> *path, V9fsString *buf)
> hw/block/nvme.c:1683:static uint16_t __nvme_zrm_open(NvmeNamespace *ns,
> NvmeZone *zone,
> hw/block/nvme.c:1742:static void __nvme_advance_zone_wp(NvmeNamespace
> *ns, NvmeZone *zone,
> hw/block/nvme.c:5213:static void __nvme_select_ns_iocs(NvmeCtrl *n,
> NvmeNamespace *ns)
> hw/i386/amd_iommu.c:1160:static int __amdvi_int_remap_msi(AMDVIState *iom=
mu,
> hw/intc/s390_flic_kvm.c:255:static int __get_all_irqs(KVMS390FLICState
> *flic,
> hw/net/rocker/rocker_desc.c:199:static bool
> __desc_ring_post_desc(DescRing *ring, int err)
> hw/net/sungem.c:766:static uint16_t __sungem_mii_read(SunGEMState *s,
> uint8_t phy_addr,
> hw/ppc/ppc.c:867:static void __cpu_ppc_store_decr(PowerPCCPU *cpu,
> uint64_t *nextp,
> hw/s390x/pv.c:25:static int __s390_pv_cmd(uint32_t cmd, const char
> *cmdname, void *data)
> pc-bios/s390-ccw/cio.c:315:static int __do_cio(SubChannelId schid,
> uint32_t ccw_addr, int fmt, Irb *irb)
> target/ppc/mmu-hash64.c:170:static void __helper_slbie(CPUPPCState *env,
> target_ulong addr,
>=20
> Thomas, Eric, is it worth cleaning these and updating the
> 'CODESTYLE.rst'?
>=20

Yeah ok, I think you are right that there is no clear convention on when
to use this or not. I typically just use it for functions that are
normally not supposed to be called directly.

But I don't even think its consistent in the nvme device. For my sake,
we can clean it up, I'll drop it in this case since there is no good
reason for it other than my own idea of "style".

--6SNtQ2Av9wDKSIoR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBsDMUACgkQTeGvMW1P
Deko2gf5AU/jHY+oy0JkkTfJuzMstDSNfLgww/91ULcXJZUsrB+QQlJZqlJSHDOr
MpO6j3V9R2xWJ7uJ8BGEsl1hnr5Y2lbhkyIzY/M/926sMwG+p0AEe93/o2Xc+oSE
GOLzub2o3Y3jswfj4LdDxEkc3RRRKkhMNWSuOsrjlSWuXkheCdR6WZmkUgj+a0l3
4kWeIC0AXxvhbgaJRbZXzMcxEAg6DVRuWd3iOF4PPi2Qub9yct7xEeKgT2v+24wb
h3cYDNpmQyRAnbb5W6io3nJvVZ5h+T0uoeTnXyBdJIHShA/UpeWnaiZm0H7BOj14
d2oUuGMKXRVmLRQ9h9ssrWIVoMOrmg==
=wrwd
-----END PGP SIGNATURE-----

--6SNtQ2Av9wDKSIoR--

