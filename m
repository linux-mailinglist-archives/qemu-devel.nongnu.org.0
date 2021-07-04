Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443A63BAAD9
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 03:47:11 +0200 (CEST)
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzrDy-0003tG-Ay
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 21:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1lzrD6-0003Cw-Ab
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 21:46:16 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:42345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1lzrD4-0007wY-2z
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 21:46:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3C29732008C0;
 Sat,  3 Jul 2021 21:46:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 03 Jul 2021 21:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fGVoE2
 GO18rMlQ069RzFH0xMlNwWjAXiSIhxLEAwBhI=; b=o+cBhz3ugo2puQLEoEdlc0
 meMDC6K5ShAHODOBvF2fJQ9KDQM7CK6uTuoQixRW+ljhnCuqO/lhILdZ9ojMq2NY
 BjnLrehig5k2mi28ESuG76U5ovYQjrUTukahFDhbARZreAPm4ItzxDWmrsoxZKI4
 8OYy20pCrrsBsVLl9pEsb0IP0xzDTf8DhUwaq8XADMYOnQHnX46+hGBl7jRIMdsz
 gmv8r4ribfeQTuagQGzUfm770vb0sAyMVOxYFRbjzT0ipQGe17OfMaDBSkV7Zi4S
 AfEN3RnKca6aORI8SF6UtOkJE9Dp398JlaHReJUQY1qfkqB3490i8/v7tyKvqwuQ
 ==
X-ME-Sender: <xms:4hLhYAo4jWGbQp01lx145q8C2a6HHE3WuJmWvskX0aAP5L6K0zn1Nw>
 <xme:4hLhYGr0pwaRvXVincbTS6oXUo84Psaax2ygUv34PQaBoCUuZvxBKhawJ3cjnInMq
 zE_RUzkWJZ7bj4mh6c>
X-ME-Received: <xmr:4hLhYFOlMvCX-6f33twKcQvAkyM0mpjkSbotsVig7IhtNuxZrmGUbrNt_I9nhh6N_OHLm9tsoJ71oFf7vgXA73BZHt5bLT3-n48>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejuddggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesmhdtreertddtjeenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepfeffjeeigfehveehfeevhfetgefgieejieeviefhffffudfgfeekleffhffg
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:4hLhYH5igG2fIid9OFX8-OUNc-nQ9FfXSwTjgXBOttxjpztRGzluGA>
 <xmx:4hLhYP7nkkQc4PlZ0ywTnhXB1Z_UOS6sr767acI8M7xhu3lQG-ZanQ>
 <xmx:4hLhYHiXCdL27IftmP7kC_Hnr8y3TzkY11CBAWJ88P_LOSOrcsAEZg>
 <xmx:4hLhYPG2hxtoGrzAY9HT-s-c2lJhKpBJWCts5oLJYmA9YpOGFx0JOQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Jul 2021 21:46:07 -0400 (EDT)
Date: Sun, 4 Jul 2021 11:46:05 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 6/6] dp8393x: Rewrite dp8393x_get() / dp8393x_put()
In-Reply-To: <20210703141947.352295-7-f4bug@amsat.org>
Message-ID: <25db776f-27b-efb7-ba10-c8da65fc92f@linux-m68k.org>
References: <20210703141947.352295-1-f4bug@amsat.org>
 <20210703141947.352295-7-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-1844589135-1625363165=:7"
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

---1463811774-1844589135-1625363165=:7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Sat, 3 Jul 2021, Philippe Mathieu-Daud=C3=A9 wrote:

> Instead of accessing N registers via a single address_space API
> call using a temporary buffer (stored in the device state) and
> updating each register, move the address_space call in the
> register put/get. The load/store and word size checks are moved
> to put/get too. This simplifies a bit, making the code easier
> to read.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

I tried this series with a Linux/m68k guest but network activity hanged=20
the emulator. The cause of the problem is somewhere in this patch.

BTW, I've become suspicious of the word "rewrite". In this case I think it=
=20
describes a commit that is attempting to do too much and needs to be split=
=20
up to make it easier to review (and debug).
---1463811774-1844589135-1625363165=:7--

