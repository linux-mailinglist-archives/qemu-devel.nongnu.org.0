Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1309F59F8D7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:51:31 +0200 (CEST)
Received: from localhost ([::1]:45896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQouv-00034q-IU
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oQoTF-0007tz-0o; Wed, 24 Aug 2022 07:22:53 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oQoTB-0001Og-Pi; Wed, 24 Aug 2022 07:22:51 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EF1A55C00ED;
 Wed, 24 Aug 2022 07:22:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 24 Aug 2022 07:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661340164; x=1661426564; bh=pG
 9H2s3G9xS75ig4EL/xL3jVI3TrlgkQ26so/F3eNdY=; b=E5OIZLMBojhpCB6FnX
 U/M/kKRMmul3F4Rj+jQWaQjq7ycRSrScWEzQTzBKY1PqxOX0ogi5ytePOOiZ06ap
 UHRegZ7Dngh1Gyu49OCLrWLGf/JNuq401jbknyAjwN7SwSwrfpcHi4Av7L/qAuVL
 G9LT/G5jtlyfl5Huv9MbKEEJHBm1XI4MxlcY/P7pxGIK9tfARUiiLrqXFt0hvSnD
 IdnPZuRdNnMhKG1/bThqtdefJ7x0eOcHvFSmrDioH6NSMO59qcg5hYlCsqJe4PzT
 mMFnAS06D0X6SPUNgeQYBjmuWZFSApYziUJgApXjVXVU/ljgDKHzuU6NRXVw4Z49
 zvIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661340164; x=1661426564; bh=pG9H2s3G9xS75ig4EL/xL3jVI3Tr
 lgkQ26so/F3eNdY=; b=whzse3BGpMtTK+wtrFvJsNI4TUYLRWcUkpESq6DO76uA
 8SIojUOV0KdoTUDyYlCjZWla0pJ5GM1/MaaQ2m8eOcKFl33JLl7KadOQP4X1fwpU
 UEBhkGAmmkW+R48/fLAF23up16YUTeVlZoff6TIZQRzM2F6+5QzKY0pikCGCFzOY
 X+0JiuuSzwcRGySVox1bF/BrfHPC3/mkhR4VdT3LAPowjl86ERXSA7Si4gcKOyH8
 pNrHWA5Zg3z5gTi/RG01k2yd2yEfceM9T6fHqwRxWI2xxjtVtdUoR+TPhLopcRdl
 xQfbaBi/6svrrODJqAxup8DOOBVxDtTdK5IDToQ8lw==
X-ME-Sender: <xms:AwoGY45XkLRp6nHfc7OCwSQd8u-GkMln4CNzwNRW8pp5noiVkzY45w>
 <xme:AwoGY573_LIWsR4Lt0pdNP1ECHGhTZMJE3lCrduyIP5gcZxcgCjzgGIdHg0w32kxF
 Lg5J_oMP5p-jJCv24U>
X-ME-Received: <xmr:AwoGY3e6Nb1WwCrxGsx3OFD1CVvxBk-ia64no2KISf3Df8Za83Nk8J-HS4rGJj6JSOEtfi5bdzJeSxxtwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:AwoGY9K6_jEoiucWdrYg-SSotrm8Z5YeIF5FWPwIT8ZFSnLvRWvTJw>
 <xmx:AwoGY8L7KbcHeTyKw4hjc2mgdtRGFeN3Xxb_NjVuvcZc0YePSoOMLw>
 <xmx:AwoGY-wZz4ghTSDIJfU9nZ1pNEUObQijJkLbJ_1aEFRwxmV2S8-A7g>
 <xmx:BAoGYxHQ04hMrbIjf_n4EQmVWNCbu_h4kVN5p-MFkdlgD-yWYX1upQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Aug 2022 07:22:42 -0400 (EDT)
Date: Wed, 24 Aug 2022 13:22:41 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH 4/4] hw/nvme: add MSI-x mask handlers for irqfd
Message-ID: <YwYKAZUz/Voheaov@apples>
References: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
 <20220811153739.3079672-5-fanjinhao21s@ict.ac.cn>
 <Yvt1k5X6Gu0xW3Lg@apples>
 <78380f57-4a65-f55f-524b-f2145d18b068@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QPgQ9Q00hNKMQAmQ"
Content-Disposition: inline
In-Reply-To: <78380f57-4a65-f55f-524b-f2145d18b068@ict.ac.cn>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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


--QPgQ9Q00hNKMQAmQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 23 22:43, Jinhao Fan wrote:
> On 8/16/2022 6:46 PM, Klaus Jensen wrote:
> > Did qtest work out for you for testing? If so, it would be nice to add a
> > simple test case as well.
>=20
> Since MSI-x masking handlers are only implemented for IO queues, if we wa=
nt
> to use qtest we need to implement utilities for controller initialization
> and IO queue creation. After that we can actually test the MSI-x masking
> feature. Although we may reuse some code from virtio's tests, that is sti=
ll
> a large amount of work.
>=20
> Is it possible to get this patch merged without testing? If not, I guess
> I'll have to take the hard work to implement something like
> qtest/libqos/nvme.c
>=20

I'm not too happy about code that is completely untestable (worse, right
now it is actually not even runnable).

What are the implications if we drop it? That is, if we go back to your
version that did not include this? If it doesnt impact the kvm irqchip
logic, then I'd rather that we rip it out and leave the device without
masking/unmasking support, keeping irqfd support as an experimental
feature until we can sort this out.

--QPgQ9Q00hNKMQAmQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMGCcoACgkQTeGvMW1P
DekHwgf/dr90AOGcPSRB6T8PiVxrVwg6w3kHcWCNVGYf+B8Gb/NYPQ6XoEvejQJC
jYemj3+hW/7ghDCvfiU4u2Ke15xu7d1LJLJcwgyGnF6BhcAa+O/BQCP9BKsEqxBT
myDdfb2oVLsf5lCQN7uzVMPONlgk4TcFrwxlp+gqnZhaLwhLz5ffTJcHpCrgSD75
q7Sfdo1kIAdd7Tg1+ezPeEyGQjiggoqVvoz2sy5aFf1vqciadu4Ww98fHEGlXo4M
MTg7vu22cbxOqa0vp8cY/oT/tgAlHRIi4UWAmrRwhFHWQ4g+Cp0OSEv9Op7IWznp
fECvQx3aSd3vqIUljgOqOfYXYn4Pow==
=r4a5
-----END PGP SIGNATURE-----

--QPgQ9Q00hNKMQAmQ--

