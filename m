Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EA85899B9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 11:11:51 +0200 (CEST)
Received: from localhost ([::1]:56648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJWtO-0000Ww-AG
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 05:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oJWpD-0004jc-J5; Thu, 04 Aug 2022 05:07:30 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:41817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oJWp3-0002OP-Kx; Thu, 04 Aug 2022 05:07:27 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B90AE3200986;
 Thu,  4 Aug 2022 05:07:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 04 Aug 2022 05:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1659604032; x=1659690432; bh=8G
 cSY/EfPPlShgSuL1VWi76lkD2w04s+u68z4SZd4Qc=; b=zyrKIPH856PM+vReyn
 HOSc3VWnn+YgESLSuV7Rvj3wcnLuKLriJfFg9rS65ii7qu0tbxr7HgcqdO1Jh4uJ
 kr9+3eJFsNCEYK52sbIdeYdp2Cg1GEHyJEsp+X98PYyFdKC+g4rRb3fHVWBC95ux
 K88u0ruQd0SqLsAcwiPIB1yvNZ5400tTtjvOZM8iHkVrdKWT4O0w2LA4zT0EWmch
 0ORPYuUEgEZPeKrY6QVD2HD49MlCcJ+bdEyMo3rdPN+4eJ7/Gta9HE64QeSaDRnI
 Dqm+MQD0cVApUYK7jqFwx7q9X7fkxx/6byUOFJuIlABEEf3kRyen4vNRY3ab61Cp
 d8Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1659604032; x=1659690432; bh=8GcSY/EfPPlShgSuL1VWi76lkD2w
 04s+u68z4SZd4Qc=; b=V/g8OEUkdzM9QyivXkyLEFt+QNNMnLV5VnzLnGS1IW63
 O0GcIya9f60u50RauL39rbQlkLnmQXOuBGmF2H7fs3E1ZCGmCQxh0d24y/BtaLcs
 gcYh3L+VVTSm5pVJDOxNAYr/WbYaEwnALMbZk0e7lbzPIbtm4p6bcoD635+ApkqA
 205BfgPKNYVG0EQQ5k5eUhNMwoJ9AFqk4Cxr1hbUI4JNO6GFws0Kgh7MdmLrt5yZ
 Lq+HzLe+clCkbHeDWlZI9Rmv2WwuRVZ8yHMfoyYRetX+Gn5gGukBsxNF5e/HuQoc
 CHOuHpuLZEauwFb7u21OzpODazk6pfx0rM+o5o06Fw==
X-ME-Sender: <xms:P4zrYur69sh8phg0IflHCDHI72mP6wAe-z9QPx3qbDvDB_fimjJBmA>
 <xme:P4zrYsotRfq12ZUMNlqLZz1YvDuewmcCSDP6oaqOhCfh6QfR2Q25Pbs3gDrCvRqVd
 Xo1rUErp-xhmQAPoXw>
X-ME-Received: <xmr:P4zrYjNTMBB3IfdsloSN5w9CZUhBrkDJfge_FUzKEYds3gcLC-HId0PGLoU1YA5dcFgylVKhtD05w2BNQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvledgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 orredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeeivefffffhledukeehhfetueelke
 ffudeuieektdegtefhgeefleeiudelveelkeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:P4zrYt6qOoFTG_fFI207g07tdu1WDxNJ0nXYJdlIOq9xpKA9KyVwVw>
 <xmx:P4zrYt74aQCyVC1YUbGlHgZWUm8SIGuwO_P3xBMhmXBOAz7qBjCJCg>
 <xmx:P4zrYtgGRdRp3_D4_ES_I7LOD_Q-iShKImtNmh19m--XksQq6XBg6Q>
 <xmx:QIzrYnlvBkftXCa7pFjdzg7s6vi9GIuqgEUnvBFLGXYib5TpNypbYg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Aug 2022 05:07:10 -0400 (EDT)
Date: Thu, 4 Aug 2022 11:07:08 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v2] hw/nvme: Add helper functions for qid-db conversion
Message-ID: <YuuMPAWyzqBCWypV@apples>
References: <20220803015836.3590335-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FrwpPMLuMj5ocaAN"
Content-Disposition: inline
In-Reply-To: <20220803015836.3590335-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--FrwpPMLuMj5ocaAN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug  3 09:58, Jinhao Fan wrote:
> With the introduction of shadow doorbell and ioeventfd, we need to do
> frequent conversion between qid and its doorbell offset. The original
> hard-coded calculation is confusing and error-prone. Add several helper
> functions to do this task.
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>

Looks good,

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--FrwpPMLuMj5ocaAN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLrjDoACgkQTeGvMW1P
DemU8Af/WEQu0U+JIGURy0l2sFzHsM0ugV44GvmK68U6CYtK7pSJfYVa6YYDCeXp
hOu6V/vTLhPLPFx7FrQ9RanJdYGYuWoC+ul8j3m9ROO6PJDFSiFSNvx0P1dNiX7W
MihNB4KfM6haDXivflw9iHHtWBgDVM0jmg884tMipXPOeKKwvWE39I5mlhUxA1jU
MtSVMt72U+H4cM/vPiDEQ9VNaCbMKXDfdshV3c1tZ9C+2xx/bTAlZQxes/nTR4cq
mmX+x8pncc3Abqn6CTS9O/0m/DPzH0zL9PmRhHvn7mlXfIlT+gPC34VbJ6P3DZr6
x05LW/r5OuKkS5vmsQle8f5GIAyZ+Q==
=HpEB
-----END PGP SIGNATURE-----

--FrwpPMLuMj5ocaAN--

