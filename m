Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29F75719F9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:29:22 +0200 (CEST)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBF0z-00083J-LA
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oBEve-0003YH-0w
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:23:50 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:41679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oBEvc-0004vH-Fs
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:23:49 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id AF0355C00BD;
 Tue, 12 Jul 2022 08:23:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 12 Jul 2022 08:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657628626; x=1657715026; bh=MU
 uC2zBzYMps/tzwu4iwfnYm++J/e1AQbIGC3c6ZA4o=; b=3NyhsDLoVuVby6v+kz
 j4RvKtND/hF3kCOvQvN5f5t2gM0CHRiw5dZs4sR8waFG5j2p9tvO+Vv2PLgj168J
 EMmdQP7an3Jt+OkWKybch69fePsMD1ALxFg5Y1QyyjM8Cr9FlMt4UQf88iUnk6DD
 6zuQYO/XVqaX+QRCBjLbzbScjS41mCrEMGpfQGZU3iMNmBVaCdIO7zuorrMpsxxg
 1aQIfQVB0iP/5+AWZ+YhzlYGco2V8A9JMOQPzuBuvp8EbNNaE2MrGuIQPAaK3zLc
 bRpgdrOq9Qt13R4asfUWi/GKqUIRI6XBs0Zr4GbZzge9DtfL+Q5BSq/JRU1tkuz5
 Ic7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657628626; x=1657715026; bh=MUuC2zBzYMps/tzwu4iwfnYm++J/
 e1AQbIGC3c6ZA4o=; b=nQYR8/l+2ob5yYpwbzKCEojv96aUhvwBecxXp4G0xyhV
 hL57CINmab+CjdOE3BiS6Axho/EkrkGNU6YdHqrK85Wzo/mNqzb24OMmmK/vV/Lw
 TXdOU/yNLAF+MOrXXO+GtBdKwkB5ue8iAVggbdGhgIoZ58YcBigh5leDj9jqEhij
 fsTUWWrGY8GdxDUKIj/ZTN4uiNJ4LR+ds5/d3vIejCRk3zRqG7Pn5FSUw04NXMlp
 bT1ONbIWHgux0XacYbjz88QwT4L6VRq6CnTXJWEvxlMa6bnIiIM7wlstWR+aUXQn
 LnZvHpFCbRG++dMwppFJN6MmpQqMfQeRVIptqiI22w==
X-ME-Sender: <xms:0mfNYplm9Or77YOArVZ9RstndCF0-8pD1ulgdFyLbmGhzL-m2Py4gA>
 <xme:0mfNYk1BPymt5WB3KG2jo31j7XoUR7nQdiL7zhEGJ-UBjQTj23xU1PfX2IbqFrgyi
 G5d9Px-Uwj2DoG9d3c>
X-ME-Received: <xmr:0mfNYvpT9lTXd_ecPG1jfrRps6KngGmC8Xj_EKILV4vrbbfQLOeyGiWlBj8tgXrdVhDoB9UHrWzpycJM8D0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:0mfNYpnJr_fcAW6Zs3fIpQFVhJWEM6FqWiDZp598DH6HYlywf9yC6Q>
 <xmx:0mfNYn0QSCirOlpI-fFEYmFGD7HAND0UJSYTPLGvnHYFdlffecyL8A>
 <xmx:0mfNYovvof-dzAl8EttBO_VAvd86V5drAmaTDlaxEzH-J9ZZcs1DWQ>
 <xmx:0mfNYlDQY7W9aKb0LvjoMEWbQdCPhVDNMf9a09vysuY387eYhJHy4w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Jul 2022 08:23:45 -0400 (EDT)
Date: Tue, 12 Jul 2022 14:23:43 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <Ys1nz68zLPN3Hq8F@apples>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <D7E0940C-3263-485C-81AC-E102566282EF@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wmC0QJPm5SC595b6"
Content-Disposition: inline
In-Reply-To: <D7E0940C-3263-485C-81AC-E102566282EF@ict.ac.cn>
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


--wmC0QJPm5SC595b6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  9 11:06, Jinhao Fan wrote:
> at 10:24 PM, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:
>=20
> > @@ -5793,6 +5891,7 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, co=
nst NvmeRequest *req)
> >     uint64_t dbs_addr =3D le64_to_cpu(req->cmd.dptr.prp1);
> >     uint64_t eis_addr =3D le64_to_cpu(req->cmd.dptr.prp2);
> >     int i;
> > +    int ret;
> >=20
>=20
> I just noticed this ret is unused. Could you help remove this line when
> applying the patch?

Yes, I noticed it and hot-fixed it ;)

--wmC0QJPm5SC595b6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLNZ84ACgkQTeGvMW1P
Demw1Af/TecT37vluSRgdVStSrekmkZrhlxeMRnZLkxFGq8Y4Byi9sQbWhhvwEG3
gtKq049yK0OrrvbJCDF8svUmXDOxuoD4aMvVVC+URPPR33r79RjaBinhSnPb+UoF
FLOEA3yo5r1GrxBCekKFLJl97xCLf/SoE/KDMoMO6BH3KKUQvb2qSKYRxoAGvcLe
lBfw7PtdLNsETnJcbTgas/Ckh4jqVUBLYdzBl4HHKgaqsE/xKvCOKF45Ngvcxxs+
AVd40Fc/BzB6P/SFY5eiGBffl+3wtsh4e8hqyew4p/tWG7uaicWDFE5mrqyves/0
XxhC1SEhh2xNL7l+EUFjSWLnO5sNmw==
=qe1w
-----END PGP SIGNATURE-----

--wmC0QJPm5SC595b6--

