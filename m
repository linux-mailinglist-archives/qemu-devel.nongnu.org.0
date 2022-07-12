Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD219571A0E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:33:03 +0200 (CEST)
Received: from localhost ([::1]:60270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBF4Y-0002Hb-SU
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oBEy1-0005sf-1p
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:26:17 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:39995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oBExz-0005Tw-3N
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:26:16 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 0A8F75C0067;
 Tue, 12 Jul 2022 08:26:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 12 Jul 2022 08:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657628774; x=1657715174; bh=xI
 vyjE0GuHquMQbnJvaKjT6PIGzo2BM+LsreBuCKaGI=; b=R18erdLOyHhMgbymSn
 OZAxwSuMbObZGGnha2vncVJY3je2+EnOjfl6fODFGuZE6i2Cu3tRABotJ8SeGZcF
 3pPguH6X71X1EUGP0XO8kepvTvi5iL3BekZhmIgxtlJ37W/Xtb/Ebs3uPrKHXsJP
 DSj1uAyRGVgvW5s4EMt/lLgyL8Lj0h920Po0vGBF+zI1l7raEdbSq+SWp2zf0d9w
 JFj6ioqFZI5g6sF6cRFSEn+T890F50HEgh+JuH0YMLq5CzWpJT0nuAlbmEQ7Wc3h
 X42N8y49F5nrne4P0aehATdrhgwT297P2mEyiAYO1PP5s4J99FK1+Sh/aKcv51ad
 8czQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657628774; x=1657715174; bh=xIvyjE0GuHquMQbnJvaKjT6PIGzo
 2BM+LsreBuCKaGI=; b=YHUUe/+J9S0BYGzS/d4RKxn1+8cJo2gfD7tQVW0dgD1V
 eEx4TrMwkg2DXf0syYRKvY9O87LYcufi6VBU/0Z+04KQbn4Zhr4mLVbLnPyvNJ8a
 fQYwTpNv6nsL24x4rM1kPFkqlwUmpe6YT+JcMxqM8+41lbKdOgvtCyb+R691TVEY
 L3XGfRQ0oSUyfoU1236RinhqIuWn7v9wQTkmJTHB3ogfyizjUqL3adVSJoNpqm7Y
 OhTaRL9pANfp2yFfjfgaxe4AM7wo8Iej/Xn1qp3vhTiZga8i1D2xhrdbs1/1qL+l
 aDCVCFpcRJiomED11owc2oJ19xgLN1iE8yyRbU1tGg==
X-ME-Sender: <xms:ZWjNYkBluRdMAhLA8B0p6ozOIBIpgo_t5uXDCjE3m5hvB75PSzGCbA>
 <xme:ZWjNYmi43cmmsauzxOEvZ4d-cbwOPE2O42KcdSvfjrVhoh67AoM55coHYmUsWSE8b
 Ju-5u8IqPWUfzGZfHE>
X-ME-Received: <xmr:ZWjNYnlMVU4-_YmyZKFWo8HJg2rcJzYE5yn1nTudbNvErPsL5EexLTUfAY0wt2J2oTJYnd7G9ya3POfBPKo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ZWjNYqyxda_ufV15aJBndrI4cYDsbxxxeRbNfNC3_Sbk0lDMfGkRoQ>
 <xmx:ZWjNYpTykKFKgP0RivZ5t4JSwcN83YOUsOEEvG-UiEgJo_d2VoLaaQ>
 <xmx:ZWjNYlbd_n2-fHtv9sp-8vxGJ345KtLXdt0sIMLJdNLDoZ7m7QTFPw>
 <xmx:ZmjNYkc-iJIMb2WafxUTdLLq_Guu3G7red4S1jAgsexNJi0SkmZMBw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Jul 2022 08:26:12 -0400 (EDT)
Date: Tue, 12 Jul 2022 14:26:11 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
Message-ID: <Ys1oY9LmeDCGT9FT@apples>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3owB6eZS6XDAvR2L"
Content-Disposition: inline
In-Reply-To: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--3owB6eZS6XDAvR2L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  9 12:35, Jinhao Fan wrote:
> Use irqfd to directly notify KVM to inject interrupts. This is done by
> registering a virtual IRQ(virq) in KVM and associate the virq with an
> irqfd, so that KVM can directly inject the interrupt when it receives
> notification from the irqfd. This approach is supposed to improve=20
> performance because it bypasses QEMU's MSI interrupt emulation logic.
>=20
> However, I did not see an obvious improvement of the emulation KIOPS:
>=20
> QD      1   4  16  64=20
> QEMU   38 123 210 329
> irqfd  40 129 219 328
>=20
> I found this problem quite hard to diagnose since irqfd's workflow
> involves both QEMU and the in-kernel KVM.=20
>=20
> Could you help me figure out the following questions:
>=20
> 1. How much performance improvement can I expect from using irqfd?

This is a level of QEMU/KVM that I am by no means an expert on and I
would have to let the broader QEMU community comment on this.

> 2. How can I debug this kind of cross QEMU-KVM problems?

Not sure how to directly "debug" it, but there is `perf kvm` to get
information about what is happing in the kvm subsystem.

--3owB6eZS6XDAvR2L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLNaGEACgkQTeGvMW1P
DekEbAf/fouLr22nvG3428QNaTZRl8j50ooWMAwx7Upw/+lMhCp9WizETCnhEnNE
vRwhd5yxGFvh72GqK+bi9WtfaKK/TzMYlErRIy+z/kUpFEN12Fyiod+7ozXMaGu7
0R9zlOPvqTDdsTAL+YrbKUmL3rs1VsgGrHeANx6DRUWfXx2jB8RhkyzMCc+QB4SR
RSAS0zzcg67t++O490ZHtjMNZnhKbHce+We5y5B4fmWKzH2xGMySPyPNiNsOBQ0H
8iBIABFjnrNkWo0kHTGPErPhkv/ZGkHmXTmT0M3gxbaUZYH/Ca8YFSO0u3TF+5eD
beZUcq9TtbfrA1CmngJSkccVDk5wXg==
=imql
-----END PGP SIGNATURE-----

--3owB6eZS6XDAvR2L--

