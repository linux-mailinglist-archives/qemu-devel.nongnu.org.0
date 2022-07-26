Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B983B580FC8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:21:52 +0200 (CEST)
Received: from localhost ([::1]:52764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGGlC-0003wq-Jj
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGGj8-0002UD-PF
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 05:19:43 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:41281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGGj6-0004pb-77
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 05:19:42 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id F2C893200975;
 Tue, 26 Jul 2022 05:19:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 26 Jul 2022 05:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1658827175; x=1658913575; bh=+V
 sg+bGG5/ATac4s/WWqEzeQAmtGSd4+c4fHzd4XNWg=; b=rsBhpP9lp+iFYCP/mT
 4V+UWZe1AQV0/RnhI6I8Baful9z0AMMVvTy/GJkYaw8GQbrx4JSxiULeVd9Lkqq5
 cdWTp2uBoggk4IIycXyAKyQOTxzfyXgBsMYZxRvN/RIRZwtPZbY5W4Q1a6ZWsgAX
 6Ic5n11FBqoQOz5Smna17m49sI35VcZWe4/DGCOaTBGkJnOixB8NEzj/xvXyqCX/
 DGprBOEdRflgtBRIsd9ClC3r2lvzfJenzRcTyTnVrpl4G25fIyxP4uKHJ3kcYnXF
 u4aFW4voAjzk0Jq8CWGU+pVk8DAKduFB+fOn39jI0SvrIQzPo9yjpXI+uSSzZJ3p
 O02g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658827175; x=1658913575; bh=+Vsg+bGG5/ATac4s/WWqEzeQAmtG
 Sd4+c4fHzd4XNWg=; b=PWmTV24NDFop+LNUG/sgVl7plBwP1kp1+cxyOCt+3w2R
 Ou7t58xDm6+fPK1TvdQb3qlUzPIPECS363nHHdnUnJfye3OxqNBKFkwviZBVEzbn
 t9wghZfpgtLVFSP4o02IUgyZV8PgZiFv0P46wu2f2rBD0njttowjqJyseul5eiSK
 JX3Pgk1avJGYCp2d9nQBfYLv/YSCXraEJXqHHygUOSymxLAJd71k409Yt1/PQ+PM
 fPJYXYQez6V0PTrQ+1D9e+D5A4edyrSSgiOjeJDpKCJGuPMzW3gr+cueg5mbmVXH
 Dzm3CmRPvtQp9ZJzaD4kOYsJqJ7u2zWOhMBfoEKhLw==
X-ME-Sender: <xms:prHfYpZx8gC5a5IV6jJbkKVrkJbalSzPxSdDzm_5yMmSq8jvmgqOyA>
 <xme:prHfYgY9hUsc1CM2p6NXUn_C5_uI_o8FIuMZf6nUltG0dRaFvH-ejkqcH5Y-fNEu7
 ynJtb4gG3YTh71B8z0>
X-ME-Received: <xmr:prHfYr-3dklUO5OOeQoWqs9KYCklsKGO2dbCwAunqSPvv5MTprLVtHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddutddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:prHfYnpCmTuk7lvZlJ--Hsc1XHxZuc4Xe4EwLx2MgaQ2tBNBDm3WGQ>
 <xmx:prHfYkqutmLjDcU4RpTWJvHuVHbHUtz8sKf1BK9-SGLWPgtn2KH47A>
 <xmx:prHfYtRNfYGZWePKZSKi8yygqE84UypQOCxsfvjfRbjmtOx3PZA9hg>
 <xmx:p7HfYr16SRP-qNX1Tgvcul5TzVzdM2clNdbi7l0QiOi_gvMNFoOw5A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Jul 2022 05:19:34 -0400 (EDT)
Date: Tue, 26 Jul 2022 11:19:32 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <Yt+xpMzwRWvn3QqR@apples>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <Yt8DWWg8qPLxL0fk@apples>
 <D12147BE-7F7A-4F41-9317-765F7EB2E971@ict.ac.cn>
 <Yt+avxgBxcwrxYgi@apples>
 <869047CA-DD0A-45D1-9DBA-2BA1A3E00ADF@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3kXoJ1msQqrSYU3b"
Content-Disposition: inline
In-Reply-To: <869047CA-DD0A-45D1-9DBA-2BA1A3E00ADF@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--3kXoJ1msQqrSYU3b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 26 15:55, Jinhao Fan wrote:
> at 3:41 PM, Klaus Jensen <its@irrelevant.dk> wrote:
>=20
> > On Jul 26 15:35, Jinhao Fan wrote:
> >> at 4:55 AM, Klaus Jensen <its@irrelevant.dk> wrote:
> >>=20
> >>> We have a regression following this patch that we need to address.
> >>>=20
> >>> With this patch, issuing a reset on the device (`nvme reset /dev/nvme=
0`
> >>> will do the trick) causes QEMU to hog my host cpu at 100%.
> >>>=20
> >>> I'm still not sure what causes this. The trace output is a bit
> >>> inconclusive still.
> >>>=20
> >>> I'll keep looking into it.
> >>=20
> >> I cannot reproduce this bug. I just start the VM and used `nvme reset
> >> /dev/nvme0`. Did you do anything before the reset?
> >=20
> > Interesting and thanks for checking! Looks like a kernel issue then!
> >=20
> > I remember that I'm using a dev branch (nvme-v5.20) of the kernel and
> > reverting to a stock OS kernel did not produce the bug.
>=20
> I=E2=80=99m using 5.19-rc4 which I pulled from linux-next on Jul 1. It wo=
rks ok on
> my machine.

Interesting. I can reproduce on 5.19-rc4 from torvalds tree. Can you
drop your qemu command line here?

This is mine.

/home/kbj/work/src/qemu/build/x86_64-softmmu/qemu-system-x86_64 \
  -nodefaults \
  -display "none" \
  -machine "q35,accel=3Dkvm,kernel-irqchip=3Dsplit" \
  -cpu "host" \
  -smp "4" \
  -m "8G" \
  -device "intel-iommu" \
  -netdev "user,id=3Dnet0,hostfwd=3Dtcp::2222-:22" \
  -device "virtio-net-pci,netdev=3Dnet0" \
  -device "virtio-rng-pci" \
  -drive "id=3Dboot,file=3D/home/kbj/work/vol/machines/img/nvme.qcow2,forma=
t=3Dqcow2,if=3Dvirtio,discard=3Dunmap,media=3Ddisk,read-only=3Dno" \
  -device "pcie-root-port,id=3Dpcie_root_port1,chassis=3D1,slot=3D0" \
  -device "nvme,id=3Dnvme0,serial=3Ddeadbeef,bus=3Dpcie_root_port1,mdts=3D7=
" \
  -drive "id=3Dnull,if=3Dnone,file=3Dnull-co://,file.read-zeroes=3Don,forma=
t=3Draw" \
  -device "nvme-ns,id=3Dnvm-1,drive=3Dnvm-1,bus=3Dnvme0,nsid=3D1,drive=3Dnu=
ll,logical_block_size=3D4096,physical_block_size=3D4096" \
  -pidfile "/home/kbj/work/vol/machines/run/null/pidfile" \
  -kernel "/home/kbj/work/src/kernel/linux/arch/x86_64/boot/bzImage" \
  -append "root=3D/dev/vda1 console=3DttyS0,115200 audit=3D0 intel_iommu=3D=
on" \
  -virtfs "local,path=3D/home/kbj/work/src/kernel/linux,security_model=3Dno=
ne,readonly=3Don,mount_tag=3Dkernel_dir" \
  -serial "mon:stdio" \
  -d "guest_errors" \
  -D "/home/kbj/work/vol/machines/log/null/qemu.log" \
  -trace "pci_nvme*"

--3kXoJ1msQqrSYU3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLfsaMACgkQTeGvMW1P
DenaewgAjOL4e36GGpdIepu2ilYeewMq/6X4xGqBIy9OlKpg2bUs+6Islu0Np2yd
tPziwNCcFR5F50YuXdoRWFRQ3RujCU11TrDoiOvO54f7Xe5mIKqjbiTkSK5KMTC/
xfhUywvid6No5mssXCbOiGBDO95fq+7A6KPmW8lC0RFJGNO/e+cwj0Zh0RDNLJpK
k1KrGeKFi6HFHw2vehgmcayWyJ+z+tbb3mR5YWl/miPMemm5CTsbaCa/PCMJrmq6
8cRqGpceXR7K/Pj1oAGv2xYNd7FMFx8XmuRmc2bMFQGNzy84iL00XpFLG0/bVgIQ
DXWK0ZLc3kRXSra1eoY+Uc85McjANA==
=o+zA
-----END PGP SIGNATURE-----

--3kXoJ1msQqrSYU3b--

