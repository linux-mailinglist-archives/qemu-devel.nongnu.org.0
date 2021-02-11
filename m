Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506FF3189D3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 12:51:03 +0100 (CET)
Received: from localhost ([::1]:50010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAUw-0004LZ-6z
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 06:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lAAQR-0003M4-1G; Thu, 11 Feb 2021 06:46:23 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:47767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lAAQK-0002gw-DB; Thu, 11 Feb 2021 06:46:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B2A3A580287;
 Thu, 11 Feb 2021 06:46:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Feb 2021 06:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=2jf2dhqSPloBGVdcKWv1nlQEPlF
 qqGFjRq5oXAvZbBg=; b=KNKhMsCSZ8JHBuZVnpWN6U+vna0pdrpob82oktcZcK5
 ArggoYYWXhOCmWh2M37qNHgWa0/R73R/S++qK8IXkMjcPM/TmHj1Mn4uR4lO/vZ/
 TCxJMGWsC3Ni/rPKTr3pgttH41bYxrx037oNbYy7eFRWu0li4m0f4j5TX7qOdU6h
 TqFyBK4Qxd9LQRhzvUeUH4qZ9VmgbQKXvx5aSfFYP0gPa9AkcWE4H1LXIdJElIK9
 /scv9nxDka+MZpjfiTW3Mes7sCbDJiSysQkaMdX+kv9mnXIsy8vy1g/hKRm9F/Cn
 54pqnK4r5zU3SficeCpMgI8l8ekumShEdoP6xLufT0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2jf2dh
 qSPloBGVdcKWv1nlQEPlFqqGFjRq5oXAvZbBg=; b=RkyHcDZAki93cVyslqmwu5
 TqZXfGBScnv9R05SP4tlHT/+mkarwpCh4uvJ3EWTpnnKJ53yZpAJeK/4V1ESNyYt
 kW+S/xJgEbBJ2a5zl1ZhsgLXis4DJgDDzEjmTtl6O4H4SiChuyxqnR56rPPiI8gp
 hWrb+BNYbpkBJwNBj3eNfOz7fMr8Yscmimd255SGMU+p7blK/yagGCtkbTCNJMPG
 RREvyhk8toAvgxFKjU/KzWM6wiB+6X1Uv+PBv8CF8EOnBdQfXD/XpvT+rWpmdEdD
 u7g1UzvDY2IETmqVEjTISKswM1ViUupMossCXB/2HCngyK0fn2oc5MdGxJyUSqpw
 ==
X-ME-Sender: <xms:BRklYHkhpZxZTqqiGZtx0ek-EuQWvzIfmxSMVi5mkx8kOo6UbwRczQ>
 <xme:BRklYK0S5B-mIuWFXmORZM5pLrV9c_Urb8IXGom1XB1T7Kq_y87-LPTVZOIHRP5zh
 3O7BsiR4KMIQCA1Ee0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:BRklYNq5v7FBjSpSzleDqPqoCY_YHfNG2LiJgjH7q9l-WVKasd-8Dg>
 <xmx:BRklYPlpd5XZCdzvSDjuGqd9xZkCXiE2wtxPx1g8SdExIzE_L92SzQ>
 <xmx:BRklYF2Z3cgV85WA-AnRyu6XfnaQB-eaG_59tVODeL7AhXmGyJMMog>
 <xmx:BhklYGsaZKY_qw8H6Q_ksX_Yr7QHrdAdOrZPVSLM5JXF_zxasVaQ7g>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 54BC91080059;
 Thu, 11 Feb 2021 06:46:11 -0500 (EST)
Date: Thu, 11 Feb 2021 12:46:09 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PULL 32/56] hw/block/nvme: split setup and register for namespace
Message-ID: <YCUZAfXP/YAYbuM4@apples.localdomain>
References: <20210209073101.548811-1-its@irrelevant.dk>
 <20210209073101.548811-33-its@irrelevant.dk>
 <20c3b649-b6c1-91ef-41cd-5c820a7f81cf@csgraf.de>
 <eff5e309-c932-d954-c2fe-da8cf62f98e2@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3Bp6uz2DsDIrCMdf"
Content-Disposition: inline
In-Reply-To: <eff5e309-c932-d954-c2fe-da8cf62f98e2@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3Bp6uz2DsDIrCMdf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 11 12:40, Philippe Mathieu-Daud=C3=A9 wrote:
> On 2/11/21 10:53 AM, Alexander Graf wrote:
> > Hi Klaus,
> >=20
> > On 09.02.21 08:30, Klaus Jensen wrote:
> >> From: Minwoo Im <minwoo.im.dev@gmail.com>
> >>
> >> In NVMe, namespace is being attached to process I/O.=C2=A0 We register=
 NVMe
> >> namespace to a controller via nvme_register_namespace() during
> >> nvme_ns_setup().=C2=A0 This is main reason of receiving NvmeCtrl object
> >> instance to this function to map the namespace to a controller.
> >>
> >> To make namespace instance more independent, it should be split into t=
wo
> >> parts: setup and register.=C2=A0 This patch split them into two differ=
nt
> >> parts, and finally nvme_ns_setup() does not have nothing to do with
> >> NvmeCtrl instance at all.
> >>
> >> This patch is a former patch to introduce NVMe subsystem scheme to the
> >> existing design especially for multi-path.=C2=A0 In that case, it shou=
ld be
> >> split into two to make namespace independent from a controller.
> >>
> >> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> >> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> >=20
> >=20
> > In latest master, I can no longer access NVMe devices from edk2. Git
> > bisect pointed me to this commit.
> >=20
> > To reproduce:
> >=20
> > =C2=A0 $ ./build/qemu-system-x86_64 -enable-kvm -pflash
> > build/pc-bios/edk2-x86_64-code.fd -drive
> > file=3Dimage.raw,if=3Dnone,id=3Dd,snapshot=3Don -device nvme,serial=3D1=
234,drive=3Dd
> > -nographic -net none
> >=20
> > You will see that before this commit, edk2 is able to enumerate the
> > block device, while after this commit it does not find it.
> >=20
> >=20
> > good:
> >=20
> > Mapping table
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FS0: Alias(s):HD1b:;BLK2:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=EF=BF=BD
> > PciRoot(0x0)/Pci(0x3,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(1,GPT,7A=
866FF6-0A12-4911-A4ED-D0565BEB41A2,0x80,0x64000)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 BLK0: Alias(s):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PciRoot(0x0)/Pci=
(0x1,0x1)/Ata(0x0)
> > =C2=A0=C2=A0=C2=A0=C2=A0 BLK1: Alias(s):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=EF=BF=BD PciRoot(0x0)/=
Pci(0x3,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)
> > =C2=A0=C2=A0=C2=A0=C2=A0 BLK3: Alias(s):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=EF=BF=BD
> > PciRoot(0x0)/Pci(0x3,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(2,GPT,F0=
70566B-C58D-4F13-9B92-64F1794385E7,0x64080,0x40000)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 BLK4: Alias(s):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=EF=BF=BD
> > PciRoot(0x0)/Pci(0x3,0x0)/NVMe(0x1,00-00-00-00-00-00-00-00)/HD(3,GPT,ED=
E86BE3-C64F-4ACB-B4AA-5E6C0135D335,0xA4080,0x315BF1B)
>=20
> Good integration test for the emulated NVMe subsystem!
>=20
> tests/acceptance/boot_linux_console.py should provide trivial template.
>=20

Yes. This is something we really need. I will priorities this together
with documentation :)

Thanks for pointing me in the direction of this Philippe.

--3Bp6uz2DsDIrCMdf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAlGP8ACgkQTeGvMW1P
Del7swgArH7KJos77eXenxIl+pKgztLujCQEySoYUDE79Hu0x/Oayf4MvFJi9baU
TxDUKyRj/hsd4ybAaQ5wHOkJg9bLiPWCipOKf5t1guNCfBsFmITSjPtPVaHFnJMB
i7C1NN5VtX97WUH86evjDYRAwYyye+RShFqoDGwGz9zj42E7uVxxvCYkEYKawNqG
PztVBXqLFeuxtFqZd97ZpcKpZS4so1CboghylcZEaXJ+M2maFuVe7W3rlvWCEO17
rzimtk/JumT1NtMnu5aTAy1DYHS1t0c0RauVWbTgUuiZlzmgLBqMjB7w5ZjpF6iX
sHqvMHhsN8g8xaT2PlYtk76VopoN8Q==
=wEew
-----END PGP SIGNATURE-----

--3Bp6uz2DsDIrCMdf--

