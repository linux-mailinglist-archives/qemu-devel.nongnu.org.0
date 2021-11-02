Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1366E442862
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 08:29:46 +0100 (CET)
Received: from localhost ([::1]:58020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhoEq-00018H-EF
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 03:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mhoAK-0007MC-Cc; Tue, 02 Nov 2021 03:25:04 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:51403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mhoAG-0001Cz-IK; Tue, 02 Nov 2021 03:25:04 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9E15D5C0131;
 Tue,  2 Nov 2021 03:24:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 02 Nov 2021 03:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=zohuzlayuMjTGQ/WgxcXx9/Nr5+
 h+GV6fSPqq/niSTo=; b=crSScYtax6gq/xqVj/YlOlmHHjH5ZiKz2Ux270cPxN6
 5Ujhq8oyoIabS97FKLQAVCFj3cMPzRVPe8lqexOrg1Zjw5WSVV1qRLrIxqPQnF4p
 KzKMBP/0t6l2mrxSA1X3JRQh5VJgxuhg5vLu5EqJSAYmrFCLPPoHVeSojMsNwCC/
 E9m+G0VwDUHAEfG7PaZp/PyIA5ZLfN/YbNh5T8vi8jxRLObDdZLyrMlhCCBkDaXF
 N8nDHSuJanSTanG5W27j+mZdBf8w9Mj77W1JtRxGVT5zR6X0D/k+mP4YPpmMp7Gx
 KIcCXYupFNnXr25ep+7e/Z6GLpwOfdXTl5UEg6JBzxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zohuzl
 ayuMjTGQ/WgxcXx9/Nr5+h+GV6fSPqq/niSTo=; b=A0YpaePzSlM5E5ZSEWM91S
 lq5o+bzF2290yeSXQZtmoX22z5WYFxkJ5tfmIQ9fsNLKgoXWMD2gwGUcN83PQZkz
 yW399uzETntW84XYKjg4Yud8227UnYdZHoqoqMjnq8rsxgwa9trIDU6Ft5EFrtTp
 fwVPz/3NRVyCzhvZ/DwMZvSfGwRIMdAuJBZyalWsvqbBVgrq4+Sf89vn+cEgwKo5
 uj96RTpyXlJ3FKfDt9opaJas5yf64JkWQjIPctn9qxgefrI3g13j3hXHM5a8GVHw
 RA34hlRCmfNhspQjeVICBY/c5I2sv3a3uNNOsFEC4xxhBt2+7Z80PVq9isGKc5Gw
 ==
X-ME-Sender: <xms:yOeAYYeRbkpMloMOzGabc2jOyYMtVQX4zbgE_i4sfkysS353Ece7uQ>
 <xme:yOeAYaNcPYpH3B_fp-gs9dorgUbvfz4MpQNF_tH1b0OxgZPYjCm6wsyws00gUOk1C
 ZTkhQyWh4VLdGRoY1U>
X-ME-Received: <xmr:yOeAYZg7_7QtLlpPzsXwIPgVk3CCZK3EK4RCGEnG-_mXTTApV3hIvavYc_svoioBbvPnVwb64FVgn1NywYfdpeSr7dtZJMy0Fy6I7kyh78JlpKX9Ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdehgedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepteehveejgffhtddvteefleehveduudduffekffehkedvudeghfeujefggefg
 heeunecuffhomhgrihhnpehgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:yOeAYd9bOmV2is5AlhRVcyQCu0x1_-0dIJcXM8GUfrToRDjVu6zGww>
 <xmx:yOeAYUs8O9h0mQR_4tREqQP8fv7NQEhd29kO58AIS7T7v4N2pef4JQ>
 <xmx:yOeAYUGqbmlQQ51C6RyaPg9r5dqUWaqalTF5F9wAYLwAkfLE63yYXw>
 <xmx:yeeAYQK3DzMV8Ak2IEbWnOt_0D705rn1oB8JuOoGATVAuAWQ9RD6SQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 03:24:55 -0400 (EDT)
Date: Tue, 2 Nov 2021 08:24:53 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YYDnxTNriIifeHsq@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <YXhG3L+brG0q6o/2@apples.localdomain>
 <20211027164930.GC3331@lmaniak-dev.igk.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3vm395HjFEd5ZmAu"
Content-Disposition: inline
In-Reply-To: <20211027164930.GC3331@lmaniak-dev.igk.intel.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Cc: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3vm395HjFEd5ZmAu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 27 18:49, Lukasz Maniak wrote:
> On Tue, Oct 26, 2021 at 08:20:12PM +0200, Klaus Jensen wrote:
> > On Oct  7 18:23, Lukasz Maniak wrote:
> > > Hi,
> > >=20
> > > This series of patches is an attempt to add support for the following
> > > sections of NVMe specification revision 1.4:
> > >=20
> > > 8.5 Virtualization Enhancements (Optional)
> > >     8.5.1 VQ Resource Definition
> > >     8.5.2 VI Resource Definition
> > >     8.5.3 Secondary Controller States and Resource Configuration
> > >     8.5.4 Single Root I/O Virtualization and Sharing (SR-IOV)
> > >=20
> > > The NVMe controller's Single Root I/O Virtualization and Sharing
> > > implementation is based on patches introducing SR-IOV support for PCI
> > > Express proposed by Knut Omang:
> > > https://lists.gnu.org/archive/html/qemu-devel/2015-10/msg05155.html
> > >=20
> > > However, based on what I was able to find historically, Knut's patches
> > > have not yet been pulled into QEMU due to no example of a working dev=
ice
> > > up to this point:
> > > https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg02722.html
> > >=20
> > > In terms of design, the Physical Function controller and the Virtual
> > > Function controllers are almost independent, with few exceptions:
> > > PF handles flexible resource allocation for all its children (VFs have
> > > read-only access to this data), and reset (PF explicitly calls it on =
VFs).
> > > Since the MMIO access is serialized, no extra precautions are required
> > > to handle concurrent resets, as well as the secondary controller state
> > > access doesn't need to be atomic.
> > >=20
> > > A controller with full SR-IOV support must be capable of handling the
> > > Namespace Management command. As there is a pending review with this
> > > functionality, this patch list is not duplicating efforts.
> > > Yet, NS management patches are not required to test the SR-IOV suppor=
t.
> > >=20
> > > We tested the patches on Ubuntu 20.04.3 LTS with kernel 5.4.0. We have
> > > hit various issues with NVMe CLI (list and virt-mgmt commands) between
> > > releases from version 1.09 to master, thus we chose this golden NVMe =
CLI
> > > hash for testing: a50a0c1.
> > >=20
> > > The implementation is not 100% finished and certainly not bug free,
> > > since we are already aware of some issues e.g. interaction with
> > > namespaces related to AER, or unexpected (?) kernel behavior in more
> > > complex reset scenarios. However, our SR-IOV implementation is already
> > > able to support typical SR-IOV use cases, so we believe the patches a=
re
> > > ready to share with the community.
> > >=20
> > > Hope you find some time to review the work we did, and share your
> > > thoughts.
> > >=20
> > > Kind regards,
> > > Lukasz
> >=20
> > Hi Lukasz,
> >=20
> > If possible, can you share a brief guide on testing this? I keep hitting
> > an assert
> >=20
> >   qemu-system-x86_64: ../hw/pci/pci.c:1215: pci_register_bar: Assertion=
 `!pci_is_vf(pci_dev)' failed.
> >=20
> > when I try to modify sriov_numvfs. This should be fixed anyway, but I
> > might be doing something wrong in the first place.
>=20
> Hi Klaus,
>=20
> Let me share all the details about the steps I did to run 7 fully
> functional VF controllers and failed to reproduce the assert.
>=20
> I rebased v1 patches to eliminate any recent regression onto the current
> master 931ce30859.
>=20
> I configured build as follows:
> ./configure \
> --target-list=3Dx86_64-softmmu \
> --enable-kvm
>=20
> Then I launched QEMU using these options:
> ./qemu-system-x86_64 \
> -m 4096 \
> -smp 4 \
> -drive file=3Dqemu-os.qcow2 \
> -nographic \
> -enable-kvm \
> -machine q35 \
> -device pcie-root-port,slot=3D0,id=3Drp0 \
> -device nvme-subsys,id=3Dsubsys0 \
> -device nvme,serial=3D1234,id=3Dnvme0,subsys=3Dsubsys0,bus=3Drp0,sriov_ma=
x_vfs=3D127,sriov_max_vq_per_vf=3D2,sriov_max_vi_per_vf=3D1
>=20
> Next, I issued below commands as root to configure VFs:
> nvme virt-mgmt /dev/nvme0 -c 0 -r 1 -a 1 -n 0
> nvme virt-mgmt /dev/nvme0 -c 0 -r 0 -a 1 -n 0
> nvme reset /dev/nvme0
> echo 1 > /sys/bus/pci/rescan
>=20
> nvme virt-mgmt /dev/nvme0 -c 1 -r 1 -a 8 -n 1
> nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 8 -n 2
> nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 9 -n 0
> nvme virt-mgmt /dev/nvme0 -c 2 -r 1 -a 8 -n 1
> nvme virt-mgmt /dev/nvme0 -c 2 -r 0 -a 8 -n 2
> nvme virt-mgmt /dev/nvme0 -c 2 -r 0 -a 9 -n 0
> nvme virt-mgmt /dev/nvme0 -c 3 -r 1 -a 8 -n 1
> nvme virt-mgmt /dev/nvme0 -c 3 -r 0 -a 8 -n 2
> nvme virt-mgmt /dev/nvme0 -c 3 -r 0 -a 9 -n 0
> nvme virt-mgmt /dev/nvme0 -c 4 -r 1 -a 8 -n 1
> nvme virt-mgmt /dev/nvme0 -c 4 -r 0 -a 8 -n 2
> nvme virt-mgmt /dev/nvme0 -c 4 -r 0 -a 9 -n 0
> nvme virt-mgmt /dev/nvme0 -c 5 -r 1 -a 8 -n 1
> nvme virt-mgmt /dev/nvme0 -c 5 -r 0 -a 8 -n 2
> nvme virt-mgmt /dev/nvme0 -c 5 -r 0 -a 9 -n 0
> nvme virt-mgmt /dev/nvme0 -c 6 -r 1 -a 8 -n 1
> nvme virt-mgmt /dev/nvme0 -c 6 -r 0 -a 8 -n 2
> nvme virt-mgmt /dev/nvme0 -c 6 -r 0 -a 9 -n 0
> nvme virt-mgmt /dev/nvme0 -c 7 -r 1 -a 8 -n 1
> nvme virt-mgmt /dev/nvme0 -c 7 -r 0 -a 8 -n 2
> nvme virt-mgmt /dev/nvme0 -c 7 -r 0 -a 9 -n 0
>=20
> echo 7 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
>=20
> If you use only up to patch 05 inclusive then this command should do all
> the job:
> echo 7 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
>=20
> The OS I used for the host and guest was Ubuntu 20.04.3 LTS.
>=20
> Can you share more call stack for assert or the configuration you are
> trying to run?
>=20
> Thanks,
> Lukasz
>=20

Hi Lukasz,

Thanks, this all works for me and in general it all looks pretty good to
me. I don't have any big reservations about this series (the hw/nvme
parts).

However, the assert.

I did the right procedure, but if the device has a CMB, then changing
sriov_numvfs asserts QEMU. I.e., add `cmb_size_mb=3D64` to the controller
parameters.

--3vm395HjFEd5ZmAu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGA58AACgkQTeGvMW1P
DekulggAvkwwccpPXxB6WCIUs35ftWvoHNj4hW91oCLNWsB+SYKudKeGCPOFhvJd
SZI2ybWmul2W6bIlo4hG7X6kmBrvz6PCAaNr04BVnam21Cml5xgrQs/wFwV6M1ER
lNgIlWrbudxsLQ64Ppx552+B3JdDc3U3BkoUEpeYvtICsd4Js0MkmuIx+z8XXjaA
5ZOMyi4nx39J5ecYb9S6kg5chtEt3lMK88iDeMK24EHFjBh0UMmk5D+IpnIuBvBq
bT8qe5SEywERSFtkcCsSs7ecIpph6CaBEH/GjlUcYoxluSZiWL0xJG9lk+yeOdQJ
VSoVIr9ypM5je2n6oyN/9KgLVwtHZw==
=6oAt
-----END PGP SIGNATURE-----

--3vm395HjFEd5ZmAu--

