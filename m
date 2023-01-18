Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF23671504
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:25:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI2oA-0004U3-UG; Wed, 18 Jan 2023 02:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pI2o8-0004Tj-R1
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:24:29 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pI2o6-0006Kz-CQ
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:24:28 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 45E8E5C012D;
 Wed, 18 Jan 2023 02:24:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 18 Jan 2023 02:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1674026663; x=1674113063; bh=2u
 rV17fTFo9HQc+FmlRvdhkXInjvSdYhvLfG6pC8ceA=; b=WE0niB4SUEMbm6csJc
 +JXegFzRJvtm4fTnc/LVEZXGfO+g2ESO1o8/AzGh28g4eNp6w7OKPJ66NShKRc1F
 P1ipoqfLbstyZBXUsIHBVwBwJKAB83bZsmpbx9onzPqR+DLIxV4+CCffBBjQ1YpU
 cg7ivZfz1hpgwjaIXAbjoMuQLv26tG9mTrs8Sv4PfXYMx2vFSqlqqxoKd61PAf9v
 Xdc/5CUx8Lv9pDSUUGzo80GP4fJThgSKA8/o686omGVP53ZVAWER6vsmDHyRQACS
 pztGZcmUL1kuMP9WWxKFpkpeNADoq4FF1+i8cmpFJV36JObe6Cb5u3HTMtwsPYXX
 Q6QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674026663; x=1674113063; bh=2urV17fTFo9HQc+FmlRvdhkXInjv
 SdYhvLfG6pC8ceA=; b=seI9Jg6zPb4vDpthWpjuEvBaYbORnvLcvhIrv2pZRnCx
 97yuR58Vj/kSJoACgnLnknHN+aHyzTlKFICVXd5O4DOah5zNZHy6P3Q9wcHmihzf
 njRRLW2fT1+YcfOG5cxhhjl1TPpIaXk7MB3IB0ah4gx2ZpuF/aIgoRw54VvurdqL
 vYfaI53XNeq8r+9R/7jcVAAOO+YC7Py453+o99iZdHKo5DJRtz7kHAJPlVp+S/wg
 CtIVuRi+O0XNrpySl0E3uIbIZHt+tMUaV+p5Z+MqRx+d+zScvkXWyWzZIzADFAQ+
 3XpMj6IiL/aQeOYw7TNnG+zhU3OwbzET2MT7tgBb+g==
X-ME-Sender: <xms:pp7HY4vN4hYxXgz7MCKDsiEkABo6EuKMLyeeDNWG7986_-zuXA_QCQ>
 <xme:pp7HY1eCVtFeee_SVlDrVMxE9m7wwq_WCIBU36r6U0kUUP2oJUeGn6dxVtBe9Ry0X
 Q54BGdEd1o8TR4gM9k>
X-ME-Received: <xmr:pp7HYzwBhGy3niD4dkSPLMnftVxb6JIJyItgxm-NS_mHq1BZwa5dTTw7qgBlfgMjjEE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpefgveeujefhleetiefhveeigeetheekteefgfejtedvgfffteegkeeuhedv
 ieekkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehi
 rhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:pp7HY7Pagz0UCWr_0t08J1a5ZuFhHlDsl2-FyfNAubOta153vhMPmg>
 <xmx:pp7HY4-06Lq7Blxf3Gyac-g1vA834F-N6NCh8DI1cnAHPvoNjxbBQA>
 <xmx:pp7HYzX3B56KwE5e6oHNwCVeT1ur19nI767Ae_rbp_TcpwwWEplT9Q>
 <xmx:p57HY2lpCrcVjLP5Y0_CpRt1o7B1fW4Ln7sz4QeDhOPA4VO7JFsuXw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jan 2023 02:24:21 -0500 (EST)
Date: Wed, 18 Jan 2023 08:24:20 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: mips, nvme/pci boot regression (commit 145e2198d749)
Message-ID: <Y8eepLAgZg8H+sq2@cormorant.local>
References: <Y8aU0fQRDm2hm+c9@cormorant.local>
 <aad40d69-c570-de15-8258-cde109842af9@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RV40kkdQsl3fJRnN"
Content-Disposition: inline
In-Reply-To: <aad40d69-c570-de15-8258-cde109842af9@linaro.org>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--RV40kkdQsl3fJRnN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 17 15:25, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Klaus,
>=20
> On 17/1/23 13:30, Klaus Jensen wrote:
> > Hi Philippe,
> >=20
> > Commit 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using
> > PCI_HOST_BRIDGE MemoryRegionOps") broke my mips64 nvme boot test
> > (little-endian host, mips64 and nvme boot device).
> >=20
> > The pci device doesn't show up and the kernel panics.
> >=20
> >    qemu-system-mips64 \
> >      -nodefaults -nographic -snapshot -no-reboot \
> >      -M "malta" -cpu "I6400" -m 512M \
> >      -nic user,model=3Dpcnet \
> >      -drive file=3Dimages/rootfs.ext2,format=3Draw,if=3Dnone,id=3Dd0 \
> >      -device nvme,serial=3Ddefault,drive=3Dd0 \
> >      -kernel images/vmlinux \
> >      -append "root=3D/dev/nvme0n1 console=3DttyS0,115200" \
> >      -serial stdio
>=20
> How do I get this images/ folder, or how do you generate
> the kernel / rootfs images?

It's a buildroot with the qemu_mips64r6_malta_defconfig. However, the
kernel must be at least v6.2-rc3 and a potential fix for pin-based
interrupts[1] (other fixes are being discussed) must be applied. On
older kernels the device should show up, but it will be broken (issue on
big-endian with shadow doorbells and occasional timeouts due to the
kernel missing interrupts).

If you don't want to mess with that, I put the images on github[2] (the
kernel is v6.2-rc4 + my potential nvme driver fix). Just gunzip
rootfs.ext2.gz.

  [1]: https://lore.kernel.org/linux-nvme/Y8W+H6T9DOZ08SoF@cormorant.local/
  [2]: https://github.com/birkelund/qemu-nvme-boot

--RV40kkdQsl3fJRnN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPHnqMACgkQTeGvMW1P
DelP8Qf6Aqhx5UO1mzi9yh56Ql1CrQSYtF1fulbwomV5yM6d4e8WbA2Se3WFjbnD
N85liZr8AKM8uq1AU5gziB0C2AgXEqGttlUmN7hIR1T17P5VDyodCfJef99yBHmO
PQ0/KUc14KoccmoooIG75+y3oNEzdgJvAFP/kj/vADIPfFZSSR+cBAxy1X8MYh/S
xPzNvHTa1dfcUS9NY4t+TQWQfgnKv/2zOflKkKZtdi2S4Et3bqzjVP1F6zqWfLSK
zVV9DM9NdOaV9DRpZ/hJF9glegaL4B467o7lNV7EUnYBYLFsoeVqobJ83jvfsX54
n/uibULmNUhtq6EC4Zi2xXZCLrMHhw==
=GKTJ
-----END PGP SIGNATURE-----

--RV40kkdQsl3fJRnN--

