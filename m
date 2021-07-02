Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81BD3B9B9C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 06:43:21 +0200 (CEST)
Received: from localhost ([::1]:42212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzB1M-0004g6-L0
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 00:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1lzAuW-00026o-39
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:36:16 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:47947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1lzAuT-0001j6-V0
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:36:15 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E09F85C0165;
 Fri,  2 Jul 2021 00:36:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 02 Jul 2021 00:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-id:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=u6AkPJ+MXnR3l1Jt5HqFkS22mnFK3mFgV4kbfgy5Ucw=; b=HAVl60t8
 7SC5pqNTbk9L4mQT1TmzTfNUSPMflJmoySLiT06gO19tFKJZJLsJedVbj7OkqqQB
 n0C2d7jcgY9u8Si6A1YqQ0tAi1cyqOPMaAbxYY+nm+XUH/a0+ZERR0FGMOLq+pvi
 wuiyK4Wp78k/SUztXyby0o7tQRWfRoWFAjSkclEiJkNFGuEeqCmTGtPk+Owyv0+U
 8pbZJeKJbu1QuTPuGWE1tv/JpvXT9E3iNbEww+FwOA5Puatch1D8RHEUuwPmCpu7
 zOVFJNmEEA2cvOmwH3bwApyoDuI1NPQx3QPJ4TidwAvFBZxYy6cJGKoeX5bqc+Cm
 ssp7KfBb879Cvg==
X-ME-Sender: <xms:uZfeYG5NiGhKfsmjTeqFTmTDgDPD24M7Int8d40hsV1kzO2RLGgJNw>
 <xme:uZfeYP7n9wQbW6dc6Sy4n9TtGqctqj5KwyiOorpRHhlCtiyaSKuYTveEtnYRKSow5
 eDDTo8Pa7fxPqAwFl4>
X-ME-Received: <xmr:uZfeYFdThPGd7VjO8kby5YeZdHh657orutazaEw12Fn4KxAJbJjHY_5XtZYXQeaHlZs4BsLmA1Sl1iSLLzqRbQLlMdLBJNzwb0M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeijedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepfeffjeeigfehveehfeevhfetgefgieejieeviefhffffudfgfeekleffhffg
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:uZfeYDIST0NVsmI3rnzKjEfHZEDOZKGx1RWnO5YlymGEPEr5u3aL1w>
 <xmx:uZfeYKJvXxGBKo7itvejPFTwHmXf6WeP-Gfj8Yg0rRjcLqHLHIV5FQ>
 <xmx:uZfeYEywLAp1aJyWFJcFC9IaWdBQoSXD_JNEGSfKdyEUug22cO2mbA>
 <xmx:upfeYC_qe5wMsp4MEC5Qkf5mUlf3lr0tmcfNhpfMvoFjUXd-c3cEIA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Jul 2021 00:36:06 -0400 (EDT)
Date: Fri, 2 Jul 2021 14:36:00 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 08/10] dp8393x: don't force 32-bit register access
In-Reply-To: <a6fae6a6-4fbd-a75c-96b5-403ba3658217@amsat.org>
Message-ID: <82eeaede-12e7-29f3-9084-33105f5cb61e@linux-m68k.org>
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-9-mark.cave-ayland@ilande.co.uk>
 <a6fae6a6-4fbd-a75c-96b5-403ba3658217@amsat.org>
X-Reply-UID: (2 > )(1 1611008712 1474)/home/fthain/mail/m68k
X-Reply-Mbox: mail/m68k
X-Cursor-Pos: : 218
X-Our-Headers: From
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-979206523-1625197871=:6"
Content-ID: <aee4e7fd-2f39-108d-2a71-fb575c1e45e4@nippy.intranet>
Received-SPF: none client-ip=66.111.4.27; envelope-from=fthain@linux-m68k.org;
 helo=out3-smtp.messagingengine.com
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
Cc: aleksandar.rikalo@syrmia.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 laurent@vivier.eu, hpoussin@reactos.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-979206523-1625197871=:6
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <55e4a90-316e-1e80-28c5-6bcec62e4974@nippy.intranet>

On Thu, 1 Jul 2021, Philippe Mathieu-Daud=C3=A9 wrote:

> On 6/25/21 8:53 AM, Mark Cave-Ayland wrote:
> > Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" assumed that=20
> > all accesses to the registers were 32-bit=20

No, that assumption was not made there. Just take a look at my commits in=
=20
Linux that make 16-bit accesses. If commit 3fe9a838ec worked by accident,=
=20
it probably just reflects my inadequate knowledge of QEMU internals.

> > but this is actually not the case. The access size is determined by=20
> > the CPU instruction used and not the number of physical address lines.
> >=20

I think that's an over-simplification (in the context of commit=20
3fe9a838ec).

> > The big_endian workaround applied to the register read/writes was=20
> > actually caused by forcing the access size to 32-bit when the guest OS=
=20
> > was using a 16-bit access. Since the registers are 16-bit then we can=
=20
> > simply set .impl.min_access to 2 and then the memory API will=20
> > automatically do the right thing for both 16-bit accesses used by=20
> > Linux and 32-bit accesses used by the MacOS toolbox ROM.
>=20
> Hmm I'm not sure. This sounds to me like the "QEMU doesn't model busses=
=20
> so we end using kludge to hide bugs" pattern. Can you provide a QTest=20
> (ideally) or a "-trace memory_region_ops_\*" log of your firmware=20
> accessing the dp8393x please?
>=20

The DP83932 chip is highly configurable, so I'm not sure that the=20
behaviour of any given firmware would resolve the question.

Anyway, as far as the DP83932 hardware is concerned, the behaviour of the=
=20
upper 16-bits of the data bus depends on the configuration programmed into=
=20
the DP83932 registers, and whether the chip is accessed as a slave or=20
performing DMA as a master.
---1463811774-979206523-1625197871=:6--

