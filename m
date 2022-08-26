Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D9D5A213B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 08:56:01 +0200 (CEST)
Received: from localhost ([::1]:33682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRTG3-000201-Ms
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 02:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRTAi-0007MW-N5; Fri, 26 Aug 2022 02:50:28 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:54213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRTAe-0003YA-UZ; Fri, 26 Aug 2022 02:50:28 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E06AF3200A1C;
 Fri, 26 Aug 2022 02:50:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 26 Aug 2022 02:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661496620; x=1661583020; bh=TL
 kSaf7Tiv53ea7QWN/XFM+AfBkR1Di61gpbOwszNjU=; b=xOJEZ934dQkscWT6HY
 4nXx/fMYMY2Qd21Q2iuz/0GqHwVDywtIH90R3f/DyCkwnJwMS+a/31XWlDO/FtLx
 zZOG+SE9hM6Osuy1gGYJ0EoyMuerxCKIsXy6hihYRY0b/RIxc6gOnqnDF7kZ/XBm
 FIMDBFwNpGsvdzpQaWo9eErpqyKsDGgBijUDD41LENM98tS3G5Egxgi5psEe27ac
 OeDCpSE+TASxH6W9ffZCdmNVWZlg3GWYgfKBndMkI7skLI52bxhDTGvYzoxIq0O5
 8cg7L+t6PAssGJULMRNr1xRA/6usTa1w8aFCdmhbEJ1D819Qlv/lN1PESwUxR5zu
 a4QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661496620; x=1661583020; bh=TLkSaf7Tiv53ea7QWN/XFM+AfBkR
 1Di61gpbOwszNjU=; b=KOOtC7cTQGlQKPpPnQ9nO6tbLtiSG2K7eoV89QTZd1hQ
 L8KzLti59yWI9ZVWllPE17QpQNPB41P3uHoDQw2skD2LUKnzYfn4zNyY+G0W1Xsn
 TQCEp0xs0d51S2J051uEfM9+DUfe/F6Ll1b8S7pMOBlxXEryqxYe95d/Ci5VXkq8
 fwGF1NQVyJbcvAHzlHAPcPlxG2x2AruLLjGmbXlwKDHlS2VZhjrDRBgqJMA15cdR
 So0hO/UVL+NT1V4Z+N+9RRQO8r+wO5Aa8fwV7HEpsDIHd0OBR79/pqxPTfUAMz+f
 9z6zPCyRze0RQZtqXs8XJdTPKeUKBCDbrTKmGpI20g==
X-ME-Sender: <xms:Km0IY_O_vQFmOc3DyqhBs8rZ4pjvSBOzpjg2FOtlktg08nbsRzHKAw>
 <xme:Km0IY58oOS6HgteNcJo0eHB-xsBftK9g5GAT8dUA1tGoKZUCQZeOq9k6QLfhFcYZ5
 1oYh7yzMz13F-0F_qE>
X-ME-Received: <xmr:Km0IY-R9yVQ7-v18BST8Y1UitIAQTOxuMbZVzwT4Ikx8Xwhoihs7A1c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgedguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Km0IYzve-Cuj02tViHT2Q_MF7mGD_pJRRczcMrrX1tz9uxm02teSzw>
 <xmx:Km0IY3dlR5Xb6Fb4SitGjVwBVC4ZnwBxLpzWfJIOdey8hsSO6sV1dA>
 <xmx:Km0IY_25KfE9hyrHBuhdwKAIp5rDuiSrC9ZXNPKmck7sq-SamiBC3A>
 <xmx:LG0IY4HqsR2kL5wJQwE4AZJRCbaJ2WHH5INjumw4McdWlIzJMoXnxA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 02:50:17 -0400 (EDT)
Date: Fri, 26 Aug 2022 08:50:16 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, stefanha@gmail.com,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v3 0/2] hw/nvme: add irqfd support
Message-ID: <YwhtKH2/emkJssUG@apples>
References: <20220825201454.259190-1-its@irrelevant.dk>
 <22035CA1-E374-4DB7-809C-569E5BC41DC0@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I6+qCzywwIhUz/z8"
Content-Disposition: inline
In-Reply-To: <22035CA1-E374-4DB7-809C-569E5BC41DC0@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--I6+qCzywwIhUz/z8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 26 10:03, Jinhao Fan wrote:
> at 4:14 AM, Klaus Jensen <its@irrelevant.dk> wrote:
>=20
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > This is a re-spin of Jinhao's irqfd support series that fixes msix
> > vector masking/unmasking to work correctly.
> >=20
> > I kept being bugged out about that msi route not getting updated, so I
> > hit the code into submission with a hammer.
> >=20
> > I finally noticed the core issue:
> >=20
> >  1. The vector notifiers was never set because msix is not enabled at
> >     the point where nvme_init_pci() is called.
> >=20
> >     Move this call to nvme_start_ctrl().
> >=20
> > Since the unmask callback was suddenly getting called now, another fix
> > was needed:
> >=20
> >  2. Call kvm_irqchip_add_irqfd_notifier_gsi() in the unmask handler -
> >     not in nvme_init_irq_notifier(). The vectors may potentially be
> >     masked/unmasked and shall cause a pair of add_irqfd and
> >     remove_irqfd calls. Removing it from nvme_init_irq_notifier() makes
> >     sure we do not try to double add.
> >=20
> > Now it does what it is supposed to; no hacks required :)
> >=20
> > Jinhao Fan (2):
> >  hw/nvme: support irq(de)assertion with eventfd
> >  hw/nvme: use KVM irqfd when available
> >=20
> > hw/nvme/ctrl.c       | 261 ++++++++++++++++++++++++++++++++++++++++---
> > hw/nvme/nvme.h       |   6 +
> > hw/nvme/trace-events |   3 +
> > 3 files changed, 253 insertions(+), 17 deletions(-)
> >=20
> > --=20
> > 2.37.2
>=20
> This patch series works well on my machine without a vIOMMU.=20
>=20
> Just to confirm my understanding, the workflow of updating msi route is:
> Host driver update MSI msg and addr -> unmask callback get called ->
> kvm_irqchip_update_msi_route() does the work. Right?
>=20

Yes :)

--I6+qCzywwIhUz/z8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMIbSQACgkQTeGvMW1P
DelKZAgAmGEv0+CcjRjIv9AmaKpG2wK9DJ8qxqkLE4TG9l99LIxBUnhQpAdPFQGt
15vJfdny8EyU/MHRvO7kbGsdUoWQLN8HvuJt8V/dTr8Ap9/6s0jXoS4fMZQruXuI
AjeqRmo5sAdbfkoJJ9i+alvi6Vm2qoDQjoAQfMIRKq6uH5cJHEdycwWs8yLA8K+n
WDTit0O6TT6QAJ6tlzxeRt6dKJyY3mXviVhvbVgUV0D0RGmTWAMdIR4IXXoc3uwT
nU+71aiuREhGgKaCUYNCx46IvvTxfKHzGKbXuZCpPRcLyijrtSWVcdYBytBrsMFU
od900fsGhxvxBjZrV3CAQNS0A0F1WA==
=gHUi
-----END PGP SIGNATURE-----

--I6+qCzywwIhUz/z8--

