Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1E13C39E2
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 04:10:23 +0200 (CEST)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2OvG-00052K-0M
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 22:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m2Ou2-0004AM-2H
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 22:09:06 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:53129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m2Ou0-0001jm-4g
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 22:09:05 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id AC0EA3201064;
 Sat, 10 Jul 2021 22:09:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 10 Jul 2021 22:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-id:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=vSbbkfYtZsGr4Ca7g+fXTVn85jFmuE2U5p40MlQ2ys8=; b=LdP93obR
 /VpyNiKp4FgmvXj25oUi3605GAq+CNpAZn6hqvBgtpD4HhFJx4g/+X/q6rCe+U6U
 2ajtTeAoBNPlE1j4eHc33AVSzXTevEW/JHayAQT0uCdoHyb8D9ipgJ412K6HOUXv
 nhfPgbq1MVXO8bnOTNPTFz0f8Nzf4yLZKMeHBJUQlPIKPRz51EGkXURJ8Mb7QPtH
 A3FgZcTq/pEz3F65LrMvGwJ6UW+6wdkzVMr77nxL8bVbn8A2RU7sGRF+gNlFoyOH
 QJwQpj3C/EvyxD+KKnytfWMOJB2W8kyGgu1D8bCZTDrM+LNCq/DB8yU/QV4A0tMH
 NqMRPgJjdgornA==
X-ME-Sender: <xms:u1LqYMAtVQSlBCAfOyMQOXLac_5l06N5ijRLm1KOakyi7ffSELCbBQ>
 <xme:u1LqYOgWVVQpQAchr1N46BUBxpt2M4pa5U357wKwRWv5BYxDNgagIIELer1KJKwlv
 BB--AzFdnct7dnDVoM>
X-ME-Received: <xmr:u1LqYPmID6BRFBppUrrW99t4YRY10kEnatcng7O_ZECxppUrS_efSWVuvvD3zpp6XGHBzS5-3nDyeUbcRSdNVu87YEr2NBW3caU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdelgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeefffejiefgheevheefvefhteeggfeijeeiveeihfffffdugfefkeelfffhgfeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
 hhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:u1LqYCx0HJS2S1gTDNnChe0w007pbzCjMfgW4FQUQHOBGjZ890aGFA>
 <xmx:u1LqYBTDUB3qSJrvurFqiD1eyaUB740tr8_TIwLJ_N3gN9w0LWl6nQ>
 <xmx:u1LqYNaj_bmRD66cWVhafMZz1l7nWyUZ6vosUBrLwa4YIkv8svP1LA>
 <xmx:vFLqYMeeQUv5KcCSDUZ_wXvgh24aQY8fjFnb7rzU8KUSv30otSCGDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Jul 2021 22:08:57 -0400 (EDT)
Date: Sun, 11 Jul 2021 12:08:26 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 0/8] dp8393x: fixes and improvements
In-Reply-To: <20210710174954.2577195-1-f4bug@amsat.org>
Message-ID: <d4266ef3-693a-c00-117-96987fd16117@linux-m68k.org>
References: <20210710174954.2577195-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="-1463811774-1824221605-1625963912=:6"
Content-ID: <fafec589-1f43-cccd-97d7-469686783bc9@nippy.intranet>
Received-SPF: none client-ip=64.147.123.20; envelope-from=fthain@linux-m68k.org;
 helo=wout4-smtp.messagingengine.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-1824221605-1625963912=:6
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <9730eab-32ed-8c7-3716-edddead661e5@nippy.intranet>

On Sat, 10 Jul 2021, Philippe Mathieu-Daud=C3=A9 wrote:

>=20
> The last 2 patches are included for Mark, but I don't plan to merge
>=20
> them without Finn's Ack, and apparently they require more work.
>=20


I tested the patch series both with and without the last 2 patches. Both=20
builds worked fine with my NetBSD/arc, Linux/mipsel and Linux/m68k guests.

Tested-by: Finn Thain <fthain@linux-m68k.org>

I have no objection to patch 8/8 ("dp8393x: don't force 32-bit register=20
access"). I asked Mark to explain why it was a bug fix (since it didn't=20
change QEMU behaviour in my tests) but when I looked into it I found that=
=20
he is quite right, the patch does fix a theoretical bug.

My only objection to patch 7/8 ("dp8393x: Rewrite dp8393x_get() /=20
dp8393x_put()") was that it could be churn.

If I'm right that the big_endian flag should go away, commit b1600ff195=20
("hw/mips/jazz: specify correct endian for dp8393x device") has already=20
taken mainline in the wrong direction and amounts to churn.

I have the same reservations about patch 6/8 ("dp8393x: Store CRC using=20
device configured endianess"). Perhaps that should be NOTFORMERGE too=20
(even though it too a theoretical bug fix).

Is there a good way to avoid using big_endian for storing the CRC and the=
=20
other DMA operations?

BTW, if you see "sn0: receive buffers exhausted" occasionally logged by=20
the NetBSD 9.2 kernel, accompanied by packet loss, it's not a regression=20
in QEMU. I first observed it last year when stress testing dp8393x with=20
NetBSD 5.1. I believe this to be an old NetBSD sn driver bug because Linux=
=20
is unaffected.
---1463811774-1824221605-1625963912=:6--

