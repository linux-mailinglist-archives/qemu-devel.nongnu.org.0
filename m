Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A2166DD9C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 13:30:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHl6a-0007ln-Ro; Tue, 17 Jan 2023 07:30:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pHl6X-0007lf-Se
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:30:18 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pHl6V-0007UB-Mr
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:30:17 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C149D32009E9;
 Tue, 17 Jan 2023 07:30:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 17 Jan 2023 07:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1673958612; x=1674045012; bh=ZP0J/87GjW150D/d1Ww6tgi5cxgL1lflSrH
 S/LZtzgE=; b=Xl8Vd3ANVKEVsygnjwz9HcdsjFKL4trmTYRBY7eSNbz5QgNc/Fn
 NWbPOuqMsaxT5935UGiXyWKOAuE80/PzVRyyb63uH9Q0On1HfaVJB1uPlLCSw/GF
 Ei4R5ZWtc0bR6vJInWOhgJ9zbUK57YziWhJXGS1OhywHiEpb15V5IqiV9y8S7VDd
 aQzJE9RT+odAmC+wQX0JHnqBHdGLc0mdIlGXdnNypt4ZKCV5sYd01F3enGfFnRsK
 /ec35GGRfoYAvJwxOVM6Oqz126B4fZ7KpIO95neSajYCP1ccCHGfVmtjHdNmzctx
 26w+lQHNLqbOKGoo1GkwPQONR63yQxBmNUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673958612; x=
 1674045012; bh=ZP0J/87GjW150D/d1Ww6tgi5cxgL1lflSrHS/LZtzgE=; b=N
 Yb2xVAQK0Dykf+md+6fSzajDl4wWaRKns8B8aHLeCgelAKZ4R8d8vLKXHWAqkAXx
 AZ+b6/FTqkADQurU1nSuDpHldCnNE2TrVi90Cm23XXs5BaUo6JmfYn8hMbBK33dc
 GMfl+4gLEgeNuV9d1Ll2+NJt0v0Tbxrp+uYB1tyFnzL29ZwlP1tefTCXsYht3tVb
 jV7hxpeuGjUjBZARFwLHN+OfgusobZId/Ev7vpwyeu63ZNXkeC0Qz1MVKvUOwZVT
 bvaPUJEGXvC03YcjC7oYYWTsNp5bYK912swXstrTWnQ9jbMCYwXb0eV5gQ6A4eru
 PWtCJgg7qvQkDqZzCoE+g==
X-ME-Sender: <xms:05TGY5AsS0yh9vlXYfukvT27fzZu6AVIO1JgS3b1e3VlWr7rQbH8sw>
 <xme:05TGY3h1wUKD9nCZfnsE8GERaLFgqldQPU4ioGhoYZvsHJinVh--nmMeIwdPFL_my
 OzfKxoTXpkm5z5gPI8>
X-ME-Received: <xmr:05TGY0ks6Y2OEGNqP2pVHDtIP2heKtoO-jaNB-LZ509aCSJcdz45LLL1Oe1dOWXdYb5E2WrVl_wS2z1wR3P15VXtjLlLSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnheptdejgfetjeeuvdekfeejgfeikeeutedvudehffekheejveelheehvdfgieduhefh
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:05TGYzzdQFB1z93f0raDPvPiMwfrH1Fg4b4sMH_v1cKTAMccjcpZRQ>
 <xmx:05TGY-Te9anotcpnCmFYaPegBswVSEX4_nT-xf397X1EpDvPOgD9mw>
 <xmx:05TGY2ZbB_dFcOYUfj0n5mXJZ9hZiPpxHdfTrO3IIV_WY9UM6voYjA>
 <xmx:1JTGYxLUx_rghImrrA8Em-TK8zX74nIg2nwtNEi3tZYDNEd0ZBgYUg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 07:30:10 -0500 (EST)
Date: Tue, 17 Jan 2023 13:30:09 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: mips, nvme/pci boot regression (commit 145e2198d749)
Message-ID: <Y8aU0fQRDm2hm+c9@cormorant.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="06fhMepuaEiy8/PI"
Content-Disposition: inline
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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


--06fhMepuaEiy8/PI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Philippe,

Commit 145e2198d749 ("hw/mips/gt64xxx_pci: Endian-swap using
PCI_HOST_BRIDGE MemoryRegionOps") broke my mips64 nvme boot test
(little-endian host, mips64 and nvme boot device).

The pci device doesn't show up and the kernel panics.

  qemu-system-mips64 \
    -nodefaults -nographic -snapshot -no-reboot \
    -M "malta" -cpu "I6400" -m 512M \
    -nic user,model=pcnet \
    -drive file=images/rootfs.ext2,format=raw,if=none,id=d0 \
    -device nvme,serial=default,drive=d0 \
    -kernel images/vmlinux \
    -append "root=/dev/nvme0n1 console=ttyS0,115200" \
    -serial stdio

--06fhMepuaEiy8/PI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmPGlNAACgkQTeGvMW1P
DelD1Qf9HSIIT+V7nxzJZWPJBWGe+b4Cc50YvRkPJWRY+D/UtAvg04ii3gvTczmx
DSILuxo9LfHBgeqTvBibu8X1NsQXVby7gdUCqLQRHT/npMBwX6V0Vja7R6ftL0q9
b9SkHqARpiX9SUZ/oJp+/vdukPJqdWOaokicVvnDJxGQqNyQNwiFD+qPHsJ2Mqds
IkPned48wJQnVrndeLJkuep7GYTzxEiwNy826akHWtfSlraJRFVyp8te73QKcOMk
YDrJ9Y58jyO4u1l2SugD2GVJ/J1WUc6GwDm//IA64y0sGvigdxN+x+YMU53+PTBP
H/UjE6ti3JlvJGTGrxg3MnUuaUtXDg==
=a9OT
-----END PGP SIGNATURE-----

--06fhMepuaEiy8/PI--

