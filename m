Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66073C45C0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 09:10:57 +0200 (CEST)
Received: from localhost ([::1]:36434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2q5e-0001Y4-Nt
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 03:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m2q4K-0000q6-09
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 03:09:32 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:33039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m2q4H-0003eq-Gk
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 03:09:31 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3234F5C0160;
 Mon, 12 Jul 2021 03:09:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 12 Jul 2021 03:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-id:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+SGJkoHy6TiYpSv5er4tsZC/5K9PqB/fC2fMnw2TPlw=; b=XHglSg2R
 NS9FI8U/nhPq/zBwJ7mBpVKuWXSm94Qs7HvJkyXu2WymRzakU8Quzrgr++ywTbLQ
 Co/hgubBxmZsX2ZQ5QsLIAgyRZv4rUevx5mVRT0eNdgtyLux2FilQTvZKQIa5h+U
 4cvuD9GsI+xPhtz9e5yGwOWID3+N8XdKBuglDvlwaRR9EaXNjZSwRIc/aehc4YUv
 hlpvD2ii/VEkptOn90WUJDCWDHTGDleTE+DVmi0Q/FQ6SsLCMHx0qjg/5X7e1xUO
 lXI/ACRypOgrfRA79fQjNu2sK9adGolxrgz9RIdJc6mMcCucXxckTPlS1V+nPMgo
 jvhfQZsZm1VGQw==
X-ME-Sender: <xms:perrYKs_kFDaTbqIJ2Mtkw0yMR8_4zXEG59EfbjioTLfcTODCXB9fA>
 <xme:perrYPfZOCqjM9w5KqaUbtMm1w2heA1DOqCcUGf6v2CMuirrEBXg_XOjIVAY4_-ga
 bDRMYIjU-edekO4Ljw>
X-ME-Received: <xmr:perrYFwQHSdTeYUiXSvUOipV6qyU5Ninlu0dYaKkXwVwR8yHiUBbrlS_g4Dtq7IJF6LYWBJgBnFLNzXB1Apq4Nd3v40Tr_LQX3c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddugdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnheptddtgefggfegkedvuddvkeehuedtudekvdeitedvhfehtddutdffffeuvddv
 uefgnecuffhomhgrihhnpehlthhurdhsvgdpghhunhhkihgvshdrohhrghdpshhgihdrtg
 homhdprghrtghhihhvvgdrohhrghdpshgvnhhsihdrohhrghenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmh
 eikehkrdhorhhg
X-ME-Proxy: <xmx:perrYFMLxuVCr4fPsNVddkbGxFohxdCCgS2ZZtWbxbQ8Y4gXLI2NmQ>
 <xmx:perrYK8oR2puJbMbx-sy10YAr0xGPGv3MQi0FGgl80Zer0I_XqBaQg>
 <xmx:perrYNUoFPOkRoaxgPQ1zH0fxbAJyKIjcvHdSoYWWt5TfdeZYLI5sA>
 <xmx:purrYML8hjQ18cna7mtD86hZULPq7fwsJmfp4TbwT6t1hEPEkOrH2w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Jul 2021 03:09:22 -0400 (EDT)
Date: Mon, 12 Jul 2021 17:09:16 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH v3 0/8] dp8393x: fixes and improvements
In-Reply-To: <8a8ff514-8931-b6ba-f82b-163f79bdb7a6@amsat.org>
Message-ID: <b6d444e1-eb3e-b21e-d0d6-5e8a5581b623@linux-m68k.org>
References: <20210710174954.2577195-1-f4bug@amsat.org>
 <d4266ef3-693a-c00-117-96987fd16117@linux-m68k.org>
 <8a8ff514-8931-b6ba-f82b-163f79bdb7a6@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-1953249462-1626073225=:6"
Content-ID: <8e26165b-3bcd-f5a9-927b-98b23f4e8783@nippy.intranet>
Received-SPF: none client-ip=66.111.4.29; envelope-from=fthain@linux-m68k.org;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1953249462-1626073225=:6
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <3072c1e2-9091-b8ee-1be-70d231e288bf@nippy.intranet>

On Sun, 11 Jul 2021, Philippe Mathieu-Daud=C3=A9 wrote:

>=20
> > If I'm right that the big_endian flag should go away, commit=20
> > b1600ff195 ("hw/mips/jazz: specify correct endian for dp8393x device")=
=20
> > has already taken mainline in the wrong direction and amounts to=20
> > churn.
>=20
> We might figure out with a BE guest image, the remove the endian flag.

Yes, it's hard to make progress without a BE guest. However, for testing=20
dp8393x we probably don't need a disk image. I think we only need working=
=20
firmware, since the RISC/os firmware appears to implement BOOTP and TFTP=20
and appears to contain a SONIC driver.

This page discusses using the "MIPS Monitor" firmware on a Mips Magnum=20
3000 machine to netboot NetBSD/mipsco:=20
https://www.ludd.ltu.se/~ragge/htdocs/Ports/mipsco/install.html

Note that the firmware banner message looks like this:
Rx3230 MIPS Monitor: Version 5.43 OPT Mon May 13 17:31:12 PDT 1991 root=20

It appears that there may be a similar firmware for MIPS Magnum at,=20
https://gunkies.org/wiki/Installing_Windows_NT_4.0_on_Qemu(MIPS)

(I suppose this is the firmware floppy that was once found at ftp.sgi.com,=
=20
after SGI acquired MIPS?)

The file RISCOS.RAW found in SETUP.ZIP appears to contain various string=20
constants, both LE and BE, including:

$ swap64 < RISCOS.RAW |strings |egrep "Version|MIPS|Rx|Monitor"
=2E..
Version 5.60 OPT-EB Wed Jun 17 11:23:28 PDT 1992 root
MIPS
Rx4230
%s %s Monitor: %s
=2E..

This looks like the same banner, only for a different machine (as you'd=20
expect). Unfortunately, nothing happened when I tried to boot that=20
firmware:

$ ln -s RISCOS.RAW mips_bios.bin=20
$ qemu-system-mips64 -M magnum -L . -global ds1225y.filename=3Dmips-nvram -=
serial mon:stdio -serial null -nic bridge,model=3Ddp83932,mac=3D00:00:00:aa=
:bb:cc

I don't know enough about this platform or about QEMU to go much further=20
with this so I hope that others will be able to help.

I did find this link, which talks a little about the early boot code.
https://web.archive.org/web/20180823065803/http://www.sensi.org/~alec/mips/=
mips-history.html
---1463811774-1953249462-1626073225=:6--

