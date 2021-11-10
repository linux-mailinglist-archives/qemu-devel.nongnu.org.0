Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C781244C54F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:46:53 +0100 (CET)
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqkO-0002rQ-O8
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:46:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mkqdO-0006vw-4Q; Wed, 10 Nov 2021 11:39:41 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:55673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mkqdH-0006Nl-UA; Wed, 10 Nov 2021 11:39:37 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 883123202042;
 Wed, 10 Nov 2021 11:39:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 10 Nov 2021 11:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=VebcmMPlkqt6Y93ka1gTVn9HF+t
 DwtouDj3QyNxjqlc=; b=IVK0U+0GgGmFx88gqBs9xpC6NjUhVz5R7WZ0+JVuTx9
 Aq9sN/DRIgYem6sARSRQT7oExvLeRKK1uLv5h+XjpGFmKQTo8dK0gyZv7uEAURIe
 PeGPfySGkBSvCTQUS6RldcmAy/xm6W4CW0YmXWk5SCxRxzhEpWfwmdoCwJeBc8RE
 khiykTyG8Uq4ex+4+I6YlyfJ85LEGK7Huw4o/j0sXB+D/OyOnT/Hwq7nk1R9rvtf
 EKHYrD/HrIfoHgLissB9NhzPjgNUTo2Eck5LAZn2knJIUYNpLVoGGciGfkOrAu53
 wBaeJpu5zvXpMT+NC+YS5IwJBktQPioXaOYmXlSsLeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=VebcmM
 Plkqt6Y93ka1gTVn9HF+tDwtouDj3QyNxjqlc=; b=I/yHlH/TQweaAO/PlxNIqV
 6HAlSQ1uWnxEIbCH0O7Wrec6WCLBQW65tL2hglE/Xiq48xCXEagHApRBkwmslx5d
 9BfPDE5B5sJ1w5R5I65dOYWcGcYfgXRlEAif800aKV2sf8sIMulvlH+mSZEvp8aa
 s0yt0cFwpfn9CAAP94jRAgUgQxyJ3Iu4hUx36tlU7WdhCiFcWFN3vfJjYBgU8VeP
 qx0n1kXdXNlz9mK/aalM8jnQuBob6y5vY24TY8aD4AQjRkD0yOjE17FylQgGNyQj
 1A5lZUsrHaSk7kClB0A4YVd1JO+NaGxdPGvmkA0uNrFDa+IeSVl/B3EsTtsvukJA
 ==
X-ME-Sender: <xms:uvWLYRWgvnWIH93rJvfdnscI9hB_jS2__jCtMG7RCZkCxhCMMtDxWg>
 <xme:uvWLYRkjT3cveLAoIfeOK_XrLAgMKELXujtq4o4o3ADnn7h-ywqVrmfwe1o05318p
 hMwAFQsz2UBifRNkNA>
X-ME-Received: <xmr:uvWLYda_puYX9T096oiW0SkmJgFP7GjAuRRZ_k3xRmWgg-sUONBcnnvKkuDRYvDqby_0jKglAoT0_6rBPjWeLUSQmDTwHEo_yxZdDrPBmbIGWJMIcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudejgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:uvWLYUVehbeKOmWRQ6S0SzpQbnny1GAXGth5vLbGOkqVYDGAKi0V5w>
 <xmx:uvWLYbnlWvArG9ElFNSTttOo8DTni7_GdDzT5RBzRRZ_NFARQIpREA>
 <xmx:uvWLYReiiraY4GcujPzh8aITq4sMzkC-BmvmLEHLaJDxW1WC3m9TrA>
 <xmx:u_WLYZY0mHe8BdHeIYAV1PaeaIObcYPE86mHKN3UWgFKdrRgeJs0Zw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Nov 2021 11:39:20 -0500 (EST)
Date: Wed, 10 Nov 2021 17:39:18 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 05/15] hw/nvme: Add support for SR-IOV
Message-ID: <YYv1tjD+us33Wc9f@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-6-lukasz.maniak@linux.intel.com>
 <YYFMK3z1iAY52hp6@apples.localdomain>
 <20211102173244.GA3643516@lmaniak-dev.igk.intel.com>
 <20211104143045.GB3643516@lmaniak-dev.igk.intel.com>
 <YYjYO/M/bjk2WpUe@apples.localdomain>
 <20211110134201.GA3175@lmaniak-dev.igk.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ufg+KveVW6bXsPtK"
Content-Disposition: inline
In-Reply-To: <20211110134201.GA3175@lmaniak-dev.igk.intel.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--Ufg+KveVW6bXsPtK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 10 14:42, Lukasz Maniak wrote:
> On Mon, Nov 08, 2021 at 08:56:43AM +0100, Klaus Jensen wrote:
> > On Nov  4 15:30, Lukasz Maniak wrote:
> > > On Tue, Nov 02, 2021 at 06:33:31PM +0100, Lukasz Maniak wrote:
> > > > On Tue, Nov 02, 2021 at 03:33:15PM +0100, Klaus Jensen wrote:
> > > > > On Oct  7 18:23, Lukasz Maniak wrote:
> > > > > > This patch implements initial support for Single Root I/O Virtu=
alization
> > > > > > on an NVMe device.
> > > > > >=20
> > > > > > Essentially, it allows to define the maximum number of virtual =
functions
> > > > > > supported by the NVMe controller via sriov_max_vfs parameter.
> > > > > >=20
> > > > > > Passing a non-zero value to sriov_max_vfs triggers reporting of=
 SR-IOV
> > > > > > capability by a physical controller and ARI capability by both =
the
> > > > > > physical and virtual function devices.
> > > > > >=20
> > > > > > NVMe controllers created via virtual functions mirror functiona=
lly
> > > > > > the physical controller, which may not entirely be the case, th=
us
> > > > > > consideration would be needed on the way to limit the capabilit=
ies of
> > > > > > the VF.
> > > > > >=20
> > > > > > NVMe subsystem is required for the use of SR-IOV.
> > > > > >=20
> > > > > > Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
> > > > > > ---
> > > > > >  hw/nvme/ctrl.c           | 74 ++++++++++++++++++++++++++++++++=
++++++--
> > > > > >  hw/nvme/nvme.h           |  1 +
> > > > > >  include/hw/pci/pci_ids.h |  1 +
> > > > > >  3 files changed, 73 insertions(+), 3 deletions(-)
> > > > > >=20
> > > > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > > > > > index 6a571d18cf..ad79ff0c00 100644
> > > > > > --- a/hw/nvme/ctrl.c
> > > > > > +++ b/hw/nvme/ctrl.c
> > > > > > @@ -6361,8 +6406,12 @@ static int nvme_init_pci(NvmeCtrl *n, PC=
IDevice *pci_dev, Error **errp)
> > > > > >                            n->reg_size);
> > > > > >      memory_region_add_subregion(&n->bar0, 0, &n->iomem);
> > > > > > =20
> > > > > > -    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY=
 |
> > > > > > -                     PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar0);
> > > > > > +    if (pci_is_vf(pci_dev)) {
> > > > > > +        pcie_sriov_vf_register_bar(pci_dev, 0, &n->bar0);
> > > > > > +    } else {
> > > > > > +        pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_ME=
MORY |
> > > > > > +                         PCI_BASE_ADDRESS_MEM_TYPE_64, &n->bar=
0);
> > > > > > +    }
> > > > >=20
> > > > > I assume that the assert we are seeing means that the pci_registe=
r_bars
> > > > > in nvme_init_cmb and nvme_init_pmr must be changed similarly to t=
his.
> > > >=20
> > > > Assert will only arise for CMB as VF params are initialized with PF
> > > > params.
> > > >=20
> > > > @@ -6532,6 +6585,15 @@ static void nvme_realize(PCIDevice *pci_dev,=
 Error **errp)
> > > >      NvmeCtrl *n =3D NVME(pci_dev);
> > > >      NvmeNamespace *ns;
> > > >      Error *local_err =3D NULL;
> > > > +    NvmeCtrl *pn =3D NVME(pcie_sriov_get_pf(pci_dev));
> > > > +
> > > > +    if (pci_is_vf(pci_dev)) {
> > > > +        /* VFs derive settings from the parent. PF's lifespan exce=
eds
> > > > +         * that of VF's, so it's safe to share params.serial.
> > > > +         */
> > > > +        memcpy(&n->params, &pn->params, sizeof(NvmeParams));
> > > > +        n->subsys =3D pn->subsys;
> > > > +    }
> > > > =20
> > > >      nvme_check_constraints(n, &local_err);
> > > >      if (local_err) {
> > > >=20
> > > > The following simple fix will both fix assert and also allow
> > > > each VF to have its own CMB of the size defined for PF.
> > > >=20
> > > > ---
> > > >  hw/nvme/ctrl.c | 13 +++++++++----
> > > >  1 file changed, 9 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > > > index 19b32dd4da..99daa6290c 100644
> > > > --- a/hw/nvme/ctrl.c
> > > > +++ b/hw/nvme/ctrl.c
> > > > @@ -6837,10 +6837,15 @@ static void nvme_init_cmb(NvmeCtrl *n, PCID=
evice *pci_dev)
> > > >      n->cmb.buf =3D g_malloc0(cmb_size);
> > > >      memory_region_init_io(&n->cmb.mem, OBJECT(n), &nvme_cmb_ops, n,
> > > >                            "nvme-cmb", cmb_size);
> > > > -    pci_register_bar(pci_dev, NVME_CMB_BIR,
> > > > -                     PCI_BASE_ADDRESS_SPACE_MEMORY |
> > > > -                     PCI_BASE_ADDRESS_MEM_TYPE_64 |
> > > > -                     PCI_BASE_ADDRESS_MEM_PREFETCH, &n->cmb.mem);
> > > > +
> > > > +    if (pci_is_vf(pci_dev)) {
> > > > +        pcie_sriov_vf_register_bar(pci_dev, NVME_CMB_BIR, &n->cmb.=
mem);
> > > > +    } else {
> > > > +        pci_register_bar(pci_dev, NVME_CMB_BIR,
> > > > +                        PCI_BASE_ADDRESS_SPACE_MEMORY |
> > > > +                        PCI_BASE_ADDRESS_MEM_TYPE_64 |
> > > > +                        PCI_BASE_ADDRESS_MEM_PREFETCH, &n->cmb.mem=
);
> > > > +    }
> > > > =20
> > > >      NVME_CAP_SET_CMBS(cap, 1);
> > > >      stq_le_p(&n->bar.cap, cap);
> > > >=20
> > > > As for PMR, it is currently only available on PF, as only PF is cap=
able
> > > > of specifying the memory-backend-file object to use with PMR.
> > > > Otherwise, either VFs would have to share the PMR with its PF, or t=
here
> > > > would be a requirement to define a memory-backend-file object for e=
ach VF.
> > >=20
> > > Hi Klaus,
> > >=20
> > > After some discussion, we decided to prohibit in V2 the use of CMB and
> > > PMR in combination with SR-IOV.
> > >=20
> > > While the implementation of CMB with SR-IOV is relatively
> > > straightforward, PMR is not. We are committed to consistency in CMB a=
nd
> > > PMR design in association with SR-IOV. So we considered it best to
> > > disable both features and implement them in separate patches.
> > >=20
> >=20
> > I am completely fine with that. However, since we are copying the
> > parameters verbatimly, it would nice that the `info qtree` would reflect
> > this difference (that the parameters, say, cmb_size_mb is 0 for the
> > virtual controllers).
> >=20
>=20
> Hi Klaus,
>=20
> Literal copying will still be correct and there will be no difference
> between PF and VF since by prohibit we mean to disable interaction
> between SR-IOV functionality and CMB/PMR for PF as well.
>=20
> if (params->sriov_max_vfs) {
>     if (!n->subsys) {
>         error_setg(errp, "subsystem is required for the use of SR-IOV");
>         return;
>     }
>=20
>     if (params->sriov_max_vfs > NVME_MAX_VFS) {
>         error_setg(errp, "sriov_max_vfs must be between 0 and %d",
>                    NVME_MAX_VFS);
>         return;
>     }
>=20
>     if (params->cmb_size_mb) {
>         error_setg(errp, "CMB is not supported with SR-IOV");
>         return;
>     }
>=20
>     if (n->pmr.dev) {
>         error_setg(errp, "PMR is not supported with SR-IOV");
>         return;
>     }
>=20

Right. Understood.

--Ufg+KveVW6bXsPtK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGL9bUACgkQTeGvMW1P
Demicgf+NfvPFDSbp2sBeSM0QXYnkj0qRByxWTBh5E84S4e1x/quGixr0s5QVquT
zTe8n4OQ12WoQLM76dY4m5z75ADNxKbXmkvhpBqDxHNeOIXRq70XBSuJMvTgzscl
19/2V2Ndx1ynfL4Nfa4F/iLU3xYcXs0dBFJmZgivPF8PO5O7dkLHeFRWWp3qgRro
/5GW0Dy4cakgGmPtuILAfCX7zZD/5b2hE2J9KmK0p2SPD/jXOZpjHO2g5ey5eiS6
nv+CkPfwJqT3WRvmwOuaQ8oQjYk+ytPrOpYEn3Os0KrGAU8/6+gnXZTJNaeeTLsO
fJ7GIoMuWJMgY6DqoWdoA2U8F89RuQ==
=yIDs
-----END PGP SIGNATURE-----

--Ufg+KveVW6bXsPtK--

