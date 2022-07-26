Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5F35810DB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 12:12:21 +0200 (CEST)
Received: from localhost ([::1]:38374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGHY4-0001mU-GN
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 06:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGHVD-0007ng-08
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 06:09:23 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:40213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGHVA-00064N-TV
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 06:09:22 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id AECE4320093F;
 Tue, 26 Jul 2022 06:09:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 26 Jul 2022 06:09:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1658830158; x=1658916558; bh=mV
 wQns5GSjqLB9VisqjsXF957mNrYCEgFMcbcZDhiuM=; b=nkyvWPLRhVWrMo0o9O
 uUW6is5kQn5TPYj0hj5Ee7ir2sKQfCzUAZj7yS83vfLLQ+FnI6vyTy/f7Xdr/nUp
 pa4/ZugRqVhrQEXLOjicr1diR8cdGlNTiJxZzutbvUO4Hl3n8/MP+7El+yCVW65q
 v7RCkWDCQZKhRWxlybNA2boTroaMtsWqvW5QBWrknbA174GgQGdJbjlsrETmazBK
 7CucMiA1UXpR9RcF5gUCTpbA5nZrmCgYxmbl5KpxM6/TTHgSGkdCN9N6x0k8JxEL
 7yyFyq2Ker4Ap51DxldqUsM2GTB6Y0oYAXZp24E2vAcg4+MQch3vFUVHDvKLI+/n
 5StQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658830158; x=1658916558; bh=mVwQns5GSjqLB9VisqjsXF957mNr
 YCEgFMcbcZDhiuM=; b=3L0dLt1wtcQsccc/6JU+HgUAbxz7EMs3u9mzrl8/5XMT
 9A4zlAYxezln1LmZHjBTqzeSijHqCy5qk6KBmtrBlZu7qnz+uO6Zzan2dp90vqbl
 04IecyG2B0WUWH+umuAg2E96XaWSUNBHT0i4GL+ZxFO5NX12jlxmiDbNNkMyh4Ct
 /9N3ZRvKAj8rIfAgjVGQo1PqY8OOE8Hqv/auHdZ7rsFKrUPXBfMGmghaPtpK5arV
 bpaHYakbyd/RTgN57Lte9QiG1MDzkaXRS2YLfi8O0enZg/I7IeMBnjH/6zNoFR0Q
 ccR++vdIfkzqew6GTknv7WyCmda5xgrfcJTtm/oS3g==
X-ME-Sender: <xms:TL3fYnpEW0-XpHXvZqGXmkCp412w6B1y9C2e8JsfChIOneG43SmoFw>
 <xme:TL3fYhrgz_3AZ8oXcudvGPcnI32X7S6letSelL-NtrVzFA248fk_RidM5wDlO9Fii
 gBVZ3aTbJpehXjeuiM>
X-ME-Received: <xmr:TL3fYkMfMvAW-FjrwBzXvXSONbWr9eJ-MdDFV4FmSMgZoXLqnc24J5k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddutddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Tb3fYq7tFH769hvBu9NeWghcaknNEXC2_KOpLQXa0ONdRerpZG3H2Q>
 <xmx:Tb3fYm5LH7lnmJONE-ahOjTRfqa-5MhFUUG5fCATuaFfJolM8t3RrQ>
 <xmx:Tb3fYiiOZl4Y3RFRfDziAA79bjI5pgNKrEbosYVjDMygEg5NqiBD-g>
 <xmx:Tr3fYmEYk0JcMc2T5H-w3D-ZSzYzLqlwZhO3kD6cVASqU3JF9efwJw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Jul 2022 06:09:16 -0400 (EDT)
Date: Tue, 26 Jul 2022 12:09:14 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <Yt+9Spzi17LRRexQ@apples>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <Yt8DWWg8qPLxL0fk@apples>
 <D12147BE-7F7A-4F41-9317-765F7EB2E971@ict.ac.cn>
 <Yt+avxgBxcwrxYgi@apples>
 <869047CA-DD0A-45D1-9DBA-2BA1A3E00ADF@ict.ac.cn>
 <Yt+xpMzwRWvn3QqR@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WajGkKi55+4swvkn"
Content-Disposition: inline
In-Reply-To: <Yt+xpMzwRWvn3QqR@apples>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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


--WajGkKi55+4swvkn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 26 11:19, Klaus Jensen wrote:
> On Jul 26 15:55, Jinhao Fan wrote:
> > at 3:41 PM, Klaus Jensen <its@irrelevant.dk> wrote:
> >=20
> > > On Jul 26 15:35, Jinhao Fan wrote:
> > >> at 4:55 AM, Klaus Jensen <its@irrelevant.dk> wrote:
> > >>=20
> > >>> We have a regression following this patch that we need to address.
> > >>>=20
> > >>> With this patch, issuing a reset on the device (`nvme reset /dev/nv=
me0`
> > >>> will do the trick) causes QEMU to hog my host cpu at 100%.
> > >>>=20
> > >>> I'm still not sure what causes this. The trace output is a bit
> > >>> inconclusive still.
> > >>>=20
> > >>> I'll keep looking into it.
> > >>=20
> > >> I cannot reproduce this bug. I just start the VM and used `nvme reset
> > >> /dev/nvme0`. Did you do anything before the reset?
> > >=20
> > > Interesting and thanks for checking! Looks like a kernel issue then!
> > >=20
> > > I remember that I'm using a dev branch (nvme-v5.20) of the kernel and
> > > reverting to a stock OS kernel did not produce the bug.
> >=20
> > I=E2=80=99m using 5.19-rc4 which I pulled from linux-next on Jul 1. It =
works ok on
> > my machine.
>=20
> Interesting. I can reproduce on 5.19-rc4 from torvalds tree. Can you
> drop your qemu command line here?
>=20
> This is mine.
>=20
> /home/kbj/work/src/qemu/build/x86_64-softmmu/qemu-system-x86_64 \
>   -nodefaults \
>   -display "none" \
>   -machine "q35,accel=3Dkvm,kernel-irqchip=3Dsplit" \
>   -cpu "host" \
>   -smp "4" \
>   -m "8G" \
>   -device "intel-iommu" \
>   -netdev "user,id=3Dnet0,hostfwd=3Dtcp::2222-:22" \
>   -device "virtio-net-pci,netdev=3Dnet0" \
>   -device "virtio-rng-pci" \
>   -drive "id=3Dboot,file=3D/home/kbj/work/vol/machines/img/nvme.qcow2,for=
mat=3Dqcow2,if=3Dvirtio,discard=3Dunmap,media=3Ddisk,read-only=3Dno" \
>   -device "pcie-root-port,id=3Dpcie_root_port1,chassis=3D1,slot=3D0" \
>   -device "nvme,id=3Dnvme0,serial=3Ddeadbeef,bus=3Dpcie_root_port1,mdts=
=3D7" \
>   -drive "id=3Dnull,if=3Dnone,file=3Dnull-co://,file.read-zeroes=3Don,for=
mat=3Draw" \
>   -device "nvme-ns,id=3Dnvm-1,drive=3Dnvm-1,bus=3Dnvme0,nsid=3D1,drive=3D=
null,logical_block_size=3D4096,physical_block_size=3D4096" \
>   -pidfile "/home/kbj/work/vol/machines/run/null/pidfile" \
>   -kernel "/home/kbj/work/src/kernel/linux/arch/x86_64/boot/bzImage" \
>   -append "root=3D/dev/vda1 console=3DttyS0,115200 audit=3D0 intel_iommu=
=3Don" \
>   -virtfs "local,path=3D/home/kbj/work/src/kernel/linux,security_model=3D=
none,readonly=3Don,mount_tag=3Dkernel_dir" \
>   -serial "mon:stdio" \
>   -d "guest_errors" \
>   -D "/home/kbj/work/vol/machines/log/null/qemu.log" \
>   -trace "pci_nvme*"

Alright. It was *some* config issue with my kernel. Reverted to a
defconfig + requirements and the issue went away.

I'll try to track down what happended, but doesnt look like qemu is at
fault here.

--WajGkKi55+4swvkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLfvUkACgkQTeGvMW1P
Deli+wgAlmrBDnGRYm1IqrVv11zCzp9WrDJ4rri6We43/8KYnTda8xT6Yo48Tshs
30JOOxIjlJmUa6q86NGO4wJwh38EqGJd7yX11L64iH4aYppoqbCilvjFAeQWUUdc
hXRUoMjDadAbgkN8Gmmm2k9CNcTfIuqdzHH3D79zxkXvN7Z1m1prx6bZoE+dxgVu
Wj7Cogl1SEhmEVivXTrYRlF5/Yz9tJQjAxt3IwrTasGHQjQkKJbEQ+LpVHCN6IBG
pQ1Y56hpKRCfZSMgo9dYv48799OmGeBj+8TArJEaCXifc9R7e3LPiSXPOkVC8ljZ
pKQTFUardAP4fnEvq9uzwJEf3rt2Tg==
=styQ
-----END PGP SIGNATURE-----

--WajGkKi55+4swvkn--

