Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085D947B08C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 16:46:12 +0100 (CET)
Received: from localhost ([::1]:36234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzKra-0005rS-To
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 10:46:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mzCLt-000452-1j; Mon, 20 Dec 2021 01:40:53 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:39375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mzCLq-0001XE-Hu; Mon, 20 Dec 2021 01:40:52 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 444A75804A7;
 Mon, 20 Dec 2021 01:40:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 20 Dec 2021 01:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=0HV1SN7k3AEo6ateLFkeXa1p6gu
 1kHxcDSkpAt81dBc=; b=kD/k/aer8CmFz3pfCZtcIp7uheK8Q2XcgARKxGYNPrZ
 TPfi4CzI5Z797+YrXqkdpSuII5fqsrDdANAeW+99PE9sKCdDdFb6dLKRj3bkSgTH
 x2xAJh+T2xM5UoyycbTAcjLTXZ/K0DvgD8/NEnmDLOIGEGopb/pQ8q/2V1+OArmc
 sGkqcmlsNvxb4CiyuhICAmo2RiVnVEcmFsiYivNwRnCpJytVt/c565+h1yHNbBJG
 81E6XIYVKHSRZRwepFa2jPJDqyYQUk61X8yQGS9dqRIfabfIV1aBBkqya6+8pXKe
 h4aBElVzLMlcmuJSeJVWhSWQnHJVNSfrnG+UTZ4lAkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0HV1SN
 7k3AEo6ateLFkeXa1p6gu1kHxcDSkpAt81dBc=; b=joIgsrpCeKHF7/u1zqVP41
 NP71bTv8wOotLW3wVIlLVPi4RVnqMKfGmhcYjZ+2HSKLrxwU/9aRHFsIPxKMCTvu
 I2KL51+6XYDwl5x51pjgznj2uHLC49kQRFnQT2IQkrOotccEQCiPasMNn8aX03+e
 gcE/d/BUVUdhdid5SfNGaASncxaotleHVfgmcM/GlaCelKvY8mK+lKjBibTJ75Cb
 eZMaK09jvfe2K1Nlp9RqHMcAN7AHnZSKyJCZa7mcc0LYG0CHbx2a+QY8s5j626hd
 tv+Iak4/kgYpDKBRIhRqc0NCnj8o+zWhlpV7TdjQBikFsxbJESoI6K+43r2hheLQ
 ==
X-ME-Sender: <xms:biXAYfX5iE93cotw4FACGii-6SfSrzfKBvh_x-r_2HcACGfj3MhlzQ>
 <xme:biXAYXmnthnue93OE8lapU-B4sOARqPdomyewM7DJN4LgAnjRzi3-TsiBrf_YqjR6
 k7rwGQYNLOt71mLBjs>
X-ME-Received: <xmr:biXAYbZcKFaidn_FKOG_WU4h0Jrg-Su_cDLHIi4CO3QR7iyYQSn2O-UqduucOIP--mdPIKJuVGAd54GIBsb-mRnEj2QcPXqhLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddtuddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepudegfeevgeefudfhueeludfgueefteehuefhueffjeeglefggfdtfeefuddv
 tdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:biXAYaVpJoM298g90W3qJMNXnTF7hmt6aF2b_vVz2U5Wa9qYxDnuyQ>
 <xmx:biXAYZn9pBCHxgCD-iW3TG4nMekOT3_AXARGEmC5kXPcgw3aLDAogQ>
 <xmx:biXAYXcMCkqKE8SYSmTVyYVT-wDzMemmmEPxVz1GRAPpdWQHM3d0_g>
 <xmx:byXAYZl3CxfyuaCi7Ve6i1m8nNaegD970iXvt02tyg1YNJBxENHB4A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Dec 2021 01:40:42 -0500 (EST)
Date: Mon, 20 Dec 2021 07:40:39 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/2] hw/nvme: Fix CVE-2021-3929 (DMA re-entrancy
 exploitation)
Message-ID: <YcAlZ6VkqAnLjJlF@apples>
References: <20211216175510.884749-1-philmd@redhat.com>
 <YbuP4/rLTlCVBRi7@apples> <YbuZw3vTaNuqAISS@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="glBrsymOtS8hVSif"
Content-Disposition: inline
In-Reply-To: <YbuZw3vTaNuqAISS@apples>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--glBrsymOtS8hVSif
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 16 20:55, Klaus Jensen wrote:
> On Dec 16 20:13, Klaus Jensen wrote:
> > On Dec 16 18:55, Philippe Mathieu-Daud=C3=A9 wrote:
> > > Now that the DMA API allow passing MemTxAttrs argument and
> > > returning MemTxResult (with MEMTX_BUS_ERROR in particular),
> > > we can restrict the NVMe controller to memories (prohibitting
> > > accesses by the DMA engine to devices) and block yet another
> > > DMA re-entrancy attack.
> > >=20
> > > I'll will try to get a reproducer (and authorization to commit
> > > it as qtest) from the reporter.
> > >=20
> > > Based-on: <20211216123558.799425-1-philmd@redhat.com>
> > > "hw: Have DMA API take MemTxAttrs arg & propagate MemTxResult (part 2=
)"
> > > https://lore.kernel.org/qemu-devel/20211216123558.799425-1-philmd@red=
hat.com/
> > >=20
> > > Philippe Mathieu-Daud=C3=A9 (2):
> > >   hw/nvme/ctrl: Do not ignore DMA access errors
> > >   hw/nvme/ctrl: Prohibit DMA accesses to devices (CVE-2021-3929)
> > >=20
> > >  hw/nvme/ctrl.c | 9 +++++----
> > >  1 file changed, 5 insertions(+), 4 deletions(-)
> > >=20
> >=20
> > LGTM.
> >=20
> > Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
>=20
> Ugh. Jumped the gun here.
>=20
> This all looked fine, but since this prohibits DMA to other devices it
> breaks DMA'ing to a controller memory buffer on another device, which is
> a used feature of some setups.
>=20
> I think we need to fix this like e1000 did?

Something like this maybe?

This fixes CVE-2021-3929 "locally" by denying DMA to the iomem of the
device itself. This still allows DMA to MMIO regions of other devices
(e.g. doing P2P DMA to the controller memory buffer of another NVMe
device).


diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 5f573c417b3d..9a79f6728867 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -357,6 +357,16 @@ static inline void *nvme_addr_to_pmr(NvmeCtrl *n, hwad=
dr addr)
     return memory_region_get_ram_ptr(&n->pmr.dev->mr) + (addr - n->pmr.cba=
);
 }

+static inline bool nvme_addr_is_iomem(NvmeCtrl *n, hwaddr addr)
+{
+    hwaddr hi, lo;
+
+    lo =3D n->bar0.addr;
+    hi =3D lo + int128_get64(n->bar0.size);
+
+    return addr >=3D lo && addr < hi;
+}
+
 static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
 {
     hwaddr hi =3D addr + size - 1;
@@ -614,6 +624,10 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg,=
 hwaddr addr, size_t len)

     trace_pci_nvme_map_addr(addr, len);

+    if (nvme_addr_is_iomem(n, addr)) {
+        return NVME_DATA_TRAS_ERROR;
+    }
+
     if (nvme_addr_is_cmb(n, addr)) {
         cmb =3D true;
     } else if (nvme_addr_is_pmr(n, addr)) {

--glBrsymOtS8hVSif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmHAJWMACgkQTeGvMW1P
DekrSAf/aw2PWQo/dSgGPWFfMIWJALMoP2BCeZ5Kq2b59tTwAMHYnYFShblNKF8q
Fnp1bUPsKA2PjbrOXAIK16ND+yfVngnBvc8shNCOU8lTKVyrxSdF/jiifbpbE9Td
yVuXYxtrT+gOmXH84PZBkRciXTBDExYg8cwoIgt5v3tWXS4hKlOBz3AN0CzvbnUQ
n+XnepX8AN65Iz1rN8VTFwa9chSgkH8yxi+IK/Fpjt03upmsSGtH+E6FCynZZKvr
JikGpVzYJAmLR44F5NVS5GEgLXdUwQGMVOA1y51YqJKijakTld4l8PmPK1SlI18y
UcQPaUFmdrEc7sJlde+gPuwBd6jUTQ==
=5nl+
-----END PGP SIGNATURE-----

--glBrsymOtS8hVSif--

