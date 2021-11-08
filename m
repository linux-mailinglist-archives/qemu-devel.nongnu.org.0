Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D8E447B80
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:02:18 +0100 (CET)
Received: from localhost ([::1]:58812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjzbd-00089E-8g
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:02:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mjzWP-0005UN-OV; Mon, 08 Nov 2021 02:56:54 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mjzWM-0007Yi-UH; Mon, 08 Nov 2021 02:56:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5B29F5C00AE;
 Mon,  8 Nov 2021 02:56:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 08 Nov 2021 02:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=nHrkd7siAXB6lwYSWmOBQYizNFn
 Ft1MsEWRiVJ0VD+U=; b=dBkkcOzayU5wZwd1Rnyft44VBMgdtzoprxoUrPf9mwY
 Xq2KCgyBVpSm/iaSUqxtDI44Pg7vqQfqNFxc6mk2badXgOxV8QwemF9CuuX5PPN+
 MboV3mFnA/EUjtIMkhH/ksOQOBUEE61IY4lo8zEybPrEl5LthlQuwovu3mTcRONw
 oQcknBs6DS2Ay5OjXgFE0gJ3geO1D+KpO2BvIBS9U01nII4E6JVnbUhkbvk6d6XD
 31FAeVwu585ljVeo91ENwAmdq/JvOsHOkwX0GLmVMCQhHoisqxFFd9X9EoJGvVK6
 Qy/MX+B5IAEGldAcSzqLfw4wGUMM7HSNnQ42df4nM0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nHrkd7
 siAXB6lwYSWmOBQYizNFnFt1MsEWRiVJ0VD+U=; b=fZamFJtLSlXDnvvRFloJ0b
 pxdUoMR50CCBWPfpGo8Sz5EFnRXDGuU7vxiz34DApIxPmb3+duuixaSfZaC/GQzD
 WO1ewVHh5GK9vW/WqHlfpnF+82Ff5fWwLF7j32vhbPcJbZP79E0Xx9x52PiUTFC6
 DJgxcZW6bWVCympJ2HQ4vRsy4oegySdNI7SUYRNsZeNN4kdC4evIihgJ4XumLAUg
 Tg7FutDPurqXxHRxHBYfdwM8EzCtBn/9CRBvhpIUrCZWy5/lQn738xYQZOi2WPOY
 QW6HZ/DEen/FiuF0tCUZgY0AJG9GQ7jtxDz+eOmyhbrqDaKw92QmDSX0zOlETSFg
 ==
X-ME-Sender: <xms:PtiIYbT971Of1opikMOl6KxStpjMuN3Cg1HOqZk2dSQ0tpeihN6sWw>
 <xme:PtiIYczZBJ2YbQrcOXYtBWGZ_A1eIe7t8bX1kbIcLwqEQt51dzY_ZxplrYChS43hW
 uIzJ00ak4vYRunJukg>
X-ME-Received: <xmr:PtiIYQ1cLt6aFgw6UW3KYY-N7nNx1h-RXeEdJwV8Pnm7aPpRKIJSSy022TUvzPZPZz_Xf6k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddugddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:PtiIYbBLUKeKUsIB7ImOb8proMESSIARXoIUXtwTZaWht7EhmQV-0g>
 <xmx:PtiIYUgetAOll1Lh6PFeSPOOlw6gHbzLlK-kcQWp62IqcmDjr7J0Vw>
 <xmx:PtiIYfowLEKmWFYFDN_r5yGweIV_GJSz_bJsoACcHDVjtg4fTIoNlA>
 <xmx:P9iIYfU36FBp2ZVCmDVnVA1zcqckiXX0Pd6hCuDO__dFRvKYh0GlLg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Nov 2021 02:56:45 -0500 (EST)
Date: Mon, 8 Nov 2021 08:56:43 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 05/15] hw/nvme: Add support for SR-IOV
Message-ID: <YYjYO/M/bjk2WpUe@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-6-lukasz.maniak@linux.intel.com>
 <YYFMK3z1iAY52hp6@apples.localdomain>
 <20211102173244.GA3643516@lmaniak-dev.igk.intel.com>
 <20211104143045.GB3643516@lmaniak-dev.igk.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Eyy21zQkcEB7Tnpc"
Content-Disposition: inline
In-Reply-To: <20211104143045.GB3643516@lmaniak-dev.igk.intel.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Eyy21zQkcEB7Tnpc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov  4 15:30, Lukasz Maniak wrote:
> On Tue, Nov 02, 2021 at 06:33:31PM +0100, Lukasz Maniak wrote:
> > On Tue, Nov 02, 2021 at 03:33:15PM +0100, Klaus Jensen wrote:
> > > On Oct  7 18:23, Lukasz Maniak wrote:
> > > > This patch implements initial support for Single Root I/O Virtualiz=
ation
> > > > on an NVMe device.
> > > >=20
> > > > Essentially, it allows to define the maximum number of virtual func=
tions
> > > > supported by the NVMe controller via sriov_max_vfs parameter.
> > > >=20
> > > > Passing a non-zero value to sriov_max_vfs triggers reporting of SR-=
IOV
> > > > capability by a physical controller and ARI capability by both the
> > > > physical and virtual function devices.
> > > >=20
> > > > NVMe controllers created via virtual functions mirror functionally
> > > > the physical controller, which may not entirely be the case, thus
> > > > consideration would be needed on the way to limit the capabilities =
of
> > > > the VF.
> > > >=20
> > > > NVMe subsystem is required for the use of SR-IOV.
> > > >=20
> > > > Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
> > > > ---
> > > >  hw/nvme/ctrl.c           | 74 ++++++++++++++++++++++++++++++++++++=
++--
> > > >  hw/nvme/nvme.h           |  1 +
> > > >  include/hw/pci/pci_ids.h |  1 +
> > > >  3 files changed, 73 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > > > index 6a571d18cf..ad79ff0c00 100644
> > > > --- a/hw/nvme/ctrl.c
> > > > +++ b/hw/nvme/ctrl.c
> > > > @@ -6361,8 +6406,12 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDev=
ice *pci_dev, Error **errp)
> > > >                            n->reg_size);
> > > >      memory_region_add_subregion(&n->bar0, 0, &n->iomem);
> > > > =20
> > > > -    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY |
> > > > -                     PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
> > > > +    if (pci_is_vf(pci_dev)) {
> > > > +        pcie_sriov_vf_register_bar(pci_dev, 0, &n->bar0);
> > > > +    } else {
> > > > +        pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY=
 |
> > > > +                         PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
> > > > +    }
> > >=20
> > > I assume that the assert we are seeing means that the pci_register_ba=
rs
> > > in nvme_init_cmb and nvme_init_pmr must be changed similarly to this.
> >=20
> > Assert will only arise for CMB as VF params are initialized with PF
> > params.
> >=20
> > @@ -6532,6 +6585,15 @@ static void nvme_realize(PCIDevice *pci_dev, Err=
or **errp)
> >      NvmeCtrl *n =3D NVME(pci_dev);
> >      NvmeNamespace *ns;
> >      Error *local_err =3D NULL;
> > +    NvmeCtrl *pn =3D NVME(pcie_sriov_get_pf(pci_dev));
> > +
> > +    if (pci_is_vf(pci_dev)) {
> > +        /* VFs derive settings from the parent. PF's lifespan exceeds
> > +         * that of VF's, so it's safe to share params.serial.
> > +         */
> > +        memcpy(&n->params, &pn->params, sizeof(NvmeParams));
> > +        n->subsys =3D pn->subsys;
> > +    }
> > =20
> >      nvme_check_constraints(n, &local_err);
> >      if (local_err) {
> >=20
> > The following simple fix will both fix assert and also allow
> > each VF to have its own CMB of the size defined for PF.
> >=20
> > ---
> >  hw/nvme/ctrl.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 19b32dd4da..99daa6290c 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -6837,10 +6837,15 @@ static void nvme_init_cmb(NvmeCtrl *n, PCIDevic=
e *pci_dev)
> >      n->cmb.buf =3D g_malloc0(cmb_size);
> >      memory_region_init_io(&n->cmb.mem, OBJECT(n), &nvme_cmb_ops, n,
> >                            "nvme-cmb", cmb_size);
> > -    pci_register_bar(pci_dev, NVME_CMB_BIR,
> > -                     PCI_BASE_ADDRESS_SPACE_MEMORY |
> > -                     PCI_BASE_ADDRESS_MEM_TYPE_64 |
> > -                     PCI_BASE_ADDRESS_MEM_PREFETCH, &n->cmb.mem);
> > +
> > +    if (pci_is_vf(pci_dev)) {
> > +        pcie_sriov_vf_register_bar(pci_dev, NVME_CMB_BIR, &n->cmb.mem);
> > +    } else {
> > +        pci_register_bar(pci_dev, NVME_CMB_BIR,
> > +                        PCI_BASE_ADDRESS_SPACE_MEMORY |
> > +                        PCI_BASE_ADDRESS_MEM_TYPE_64 |
> > +                        PCI_BASE_ADDRESS_MEM_PREFETCH, &n->cmb.mem);
> > +    }
> > =20
> >      NVME_CAP_SET_CMBS(cap, 1);
> >      stq_le_p(&n->bar.cap, cap);
> >=20
> > As for PMR, it is currently only available on PF, as only PF is capable
> > of specifying the memory-backend-file object to use with PMR.
> > Otherwise, either VFs would have to share the PMR with its PF, or there
> > would be a requirement to define a memory-backend-file object for each =
VF.
>=20
> Hi Klaus,
>=20
> After some discussion, we decided to prohibit in V2 the use of CMB and
> PMR in combination with SR-IOV.
>=20
> While the implementation of CMB with SR-IOV is relatively
> straightforward, PMR is not. We are committed to consistency in CMB and
> PMR design in association with SR-IOV. So we considered it best to
> disable both features and implement them in separate patches.
>=20

I am completely fine with that. However, since we are copying the
parameters verbatimly, it would nice that the `info qtree` would reflect
this difference (that the parameters, say, cmb_size_mb is 0 for the
virtual controllers).


--Eyy21zQkcEB7Tnpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGI2DcACgkQTeGvMW1P
Dem/UAf/TTDmjR0IFBSMKv2cwt6t9p1HdoTbqdcTE0xL7yh0y5/g0f22rqeyF3WB
42SoXjg682pjqPofyRwNAYDafIq0BoJ2UXuEkplBfqri62CDi6UKshIzejH0+3SJ
UCIi8jRhLZwmlwPAZjhKC33t/uYF8DFdNC1WEFrR62NQ90uoLZuD2fADvwKMJnjz
4khlgdriikMy8QhkwBW9gAEaBt6TwGNrdXJneG+eZJG8fFpFfbWEYpMyAnU4Oyrw
9UhVP4AMQUTZwyz6OGy3/N3/ZUExmSMWZf8A8N0mgJP3xxMBlwFFHPjnTjgIvTMG
NN+yjq6LLF4It+MhMa8L09z2QC1JvA==
=nfo/
-----END PGP SIGNATURE-----

--Eyy21zQkcEB7Tnpc--

