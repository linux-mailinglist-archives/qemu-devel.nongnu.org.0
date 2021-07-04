Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57DC3BAAE0
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 04:07:27 +0200 (CEST)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzrXa-00089G-6i
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 22:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1lzrWR-0007NH-Kq
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 22:06:15 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:33845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1lzrWP-0003wu-Jb
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 22:06:15 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7C444320028E;
 Sat,  3 Jul 2021 22:06:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 03 Jul 2021 22:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=BsBhdc
 MLjPXuh5oRc3uapS3+mwCCeGhCbasRUHs00k8=; b=MRRwkeyWXDDPuHbts+Ik01
 5Gq2M7PJu/P3kcrcjxUUOX8lvM2aImTI4ClDmoer+WYKPFpd+ZO3xVfPukzCKrNF
 gdTDhQUV9IXMyueU9syNPG4KNIxUqlUr7W8S3IH3kJaqmRnK592vOfqE2h6vmrd/
 f41m4PXuPd22kAxrtcEewZrQNALARM/Qcy+pCxnVxe9P7WFozmHlo8PmEFbW1zqe
 agMLHL+/knPzFwtYlgpPuwNzGeMvXv2bSXiPHs5Fuwgg9rXq/hSYOybSVjlBSFCJ
 uhEWnMgSapufyp98qZmEdvBXCKTw7KlLpVn1igCiP44y5mAD+WDhndAK+Rv+MVyw
 ==
X-ME-Sender: <xms:jhfhYByKX1tU_6mT_NL7epxD_F22TZ6YrdBeg8tvcueCxJlXvU5vZw>
 <xme:jhfhYBQSiZ-tI6ENDeA_-0nIocjeS6-sVNDT8QanJXlHoz5IF9HfKnj6lUiUtS9dk
 pNABMTdOLDMYCA8mNE>
X-ME-Received: <xmr:jhfhYLUCaw1wXZVzjNrYexK1iMDeDHgTlOUzo2pCh5WdJXk_Acz8opf2okdebMV4HJ_2dTy77z_ndgu24X4KTJSuKwIYrNeTYik>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejuddghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepfeffjeeigfehveehfeevhfetgefgieejieeviefhffffudfgfeekleffhffg
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:jxfhYDgxvpRCURnDZ-NwMYouWHDsR5tBFQn-z4OwKAE-IS5hpSQjEA>
 <xmx:jxfhYDAJF2HN4YrADvUsVeoV2nSy5VGY10J84pY-NCPcEg_Koh4smw>
 <xmx:jxfhYMKlNqJLs0UUXDeQrgG2Ag39TWZKBqeX1T3UBk3-L3mne-nrbw>
 <xmx:kBfhYGMMaLPnlFWJBxVbwSWPDnWlwKCQhLgFRCxvXslN0m6uMxXOxQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Jul 2021 22:06:04 -0400 (EDT)
Date: Sun, 4 Jul 2021 12:06:02 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/6] dp8393x: don't force 32-bit register access
In-Reply-To: <20210703141947.352295-3-f4bug@amsat.org>
Message-ID: <abe56ba1-b5e7-3e41-47aa-54a385376052@linux-m68k.org>
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-1456652280-1625364362=:6"
Received-SPF: none client-ip=64.147.123.21; envelope-from=fthain@linux-m68k.org;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1456652280-1625364362=:6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Sat, 3 Jul 2021, Philippe Mathieu-Daud=C3=A9 wrote:

> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>=20
> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" assumed that all =
accesses
> to the registers were 32-bit but this is actually not the case. The acces=
s size is
> determined by the CPU instruction used and not the number of physical add=
ress lines.
>=20
> The big_endian workaround applied to the register read/writes was actuall=
y caused
> by forcing the access size to 32-bit when the guest OS was using a 16-bit=
 access.
> Since the registers are 16-bit then we can simply set .impl.min_access to=
 2 and
> then the memory API will automatically do the right thing for both 16-bit=
 accesses
> used by Linux and 32-bit accesses used by the MacOS toolbox ROM.
>=20
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
> Tested-by: Finn Thain <fthain@linux-m68k.org>

I have to retract that tested-by tag for this new version. It breaks my=20
Linux/mipsel guest. The jazzsonic driver now says,

SONIC ethernet controller not found (0x40004)

> Message-Id: <20210625065401.30170-9-mark.cave-ayland@ilande.co.uk>
> [PMD: dp8393x_ops.impl.max_access_size 4 -> 2]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---1463811774-1456652280-1625364362=:6--

