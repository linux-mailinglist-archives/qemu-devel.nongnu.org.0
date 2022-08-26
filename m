Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540445A2BB9
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:51:46 +0200 (CEST)
Received: from localhost ([::1]:35736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbcX-0004aZ-BO
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRbWd-0006EQ-K9; Fri, 26 Aug 2022 11:45:40 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:50941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oRbWX-0002Wb-7u; Fri, 26 Aug 2022 11:45:39 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E6A5032000E5;
 Fri, 26 Aug 2022 11:45:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 26 Aug 2022 11:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661528725; x=1661615125; bh=yR
 AKBoKxDxpnArSEj3ctKXjjrGRzKZ1RVTJuJyaINkU=; b=y04ku8oVXQQKydBKSq
 bxIzNdGUZkZsCDFQqiiR7eDr+xw4At5pwXROztdvcGMwCdVSRKyd6qhhN4ftJ/be
 sOhSH/hupk46FJBP/MnrmSEOE5qtRqEmByxtBVkNxuGWWyD4lYQg+sXgKWl1LD0U
 ILLxmk9iy1qInUepVVWWzpya88H5GiHG6Sab5CCNobL4EnVlnA+be4Avp3hE7BUf
 KeVL2DBWWu6/RuEmBqRdgAsjMmiCKamUFguHgsMMdMS0BdKcl0IFtVUXAqfczzt2
 h8t2u1+j1OZtxvtZFIvKuILvXIU6/yo1khA+zKnMTju14eFf41a2E44UXJCHqSwI
 IXqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661528725; x=1661615125; bh=yRAKBoKxDxpnArSEj3ctKXjjrGRz
 KZ1RVTJuJyaINkU=; b=bZCVMIbDcltIE/NUZtywf8qKIz8+LtZrHHsKLbC2HTaO
 N+I7Qb33e3ltWqODyf+pe3ret+IBT2cgMaktcAYZGxvUhFSb8Hf9ofP0LCguRaew
 v6+DeqPbyjMX4Nn+frr/SDpx0yGIhu4saGW2CXVesXUbUV4q7iWXj84FR8ezp+it
 Ncki+7uTxtvWQZS4bE+4oxD7jIMwWocHTR1IIUiDvbGDTtVt7dJiYdgNYay1712N
 8LTx0qV+50p+zTqcZgZqo9ZEtpnlKgFupNSN7cizrpgDTpP54M38jhyvUnlWL49L
 /3WDoPy7cfQRYElolzPQ1MuJZKWxTrNp5zRsCHWNEQ==
X-ME-Sender: <xms:leoIY4N9KdbY5HmT4jzuvzI_8kC9F9d2fy7j58GareYTHPWQBYEagg>
 <xme:leoIY-8-KA1QtvIzGTzlu3rEGZPcyRLWzf9-TGtRGTuSyI-RYRAjCbeJYdhc6c-wr
 _FqFlFOJgG58O6iSJ4>
X-ME-Received: <xmr:leoIY_TdYQBuYSU3zYe1zJf4HX1TU-3XFS4bTkb2WHQB2-fIH1iOfQbhnL1SPRNkx1EJWWFYfOGDgDTs-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejhedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:leoIYwsl6JDqgu3sUpBZjvFptWWbBQw-3NKhgnHJCnQdxWuVTCZ-Kw>
 <xmx:leoIYwdshzB-gb65528-LY35m12a4gZAiYyArkueJWRymyVajoicUQ>
 <xmx:leoIY03lEX5JqdU5kVdwyawsO_4DVGB7CxY8qKYm02E176X_5IDtZA>
 <xmx:leoIY1F4h9bttkslofj9ZGhrIhjnk11uQWgSUvlw2sOnFaJb2Col4Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 11:45:23 -0400 (EDT)
Date: Fri, 26 Aug 2022 17:45:21 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 stefanha@gmail.com, Klaus Jensen <k.jensen@samsung.com>,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 2/3] hw/nvme: use KVM irqfd when available
Message-ID: <YwjqkTgIEcCZJ3Be@apples>
References: <20220826151206.3148942-1-fanjinhao21s@ict.ac.cn>
 <20220826151206.3148942-3-fanjinhao21s@ict.ac.cn>
 <Ywjn7QOb9EyK1oJc@kbusch-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8XmrsozuGP7txlCa"
Content-Disposition: inline
In-Reply-To: <Ywjn7QOb9EyK1oJc@kbusch-mbp.dhcp.thefacebook.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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


--8XmrsozuGP7txlCa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 26 09:34, Keith Busch wrote:
> On Fri, Aug 26, 2022 at 11:12:04PM +0800, Jinhao Fan wrote:
> > Use KVM's irqfd to send interrupts when possible. This approach is
> > thread safe. Moreover, it does not have the inter-thread communication
> > overhead of plain event notifiers since handler callback are called
> > in the same system call as irqfd write.
> >=20
> > Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>=20
> No idea what's going on here... This one is causing the following assert
> failure with --enable-kvm:
>=20
>   qemu-system-x86_64: ../accel/kvm/kvm-all.c:1781: kvm_irqchip_commit_rou=
tes: Assertion `ret =3D=3D 0' failed.
>=20
> I find it calls KVM_SET_GSI_ROUTING ioctl with gsi set to KVM_IRQ_ROUTING=
_MSI,
> and linux kernel returns EINVAL in that case. It's never set that way wit=
hout
> this patch. Am I the only one seeing this?

Argh, sorry, I threw that patch together a bit too quickly. I was just
so pumped because I believed I had solved the issue hehe.

Are you missing the ioeventfd=3Don and irq-eventfd=3Don parameters by any
chance? Without those I'm also getting an assertion, but a different one

qemu-system-x86_64: ../hw/pci/msix.c:119: msix_fire_vector_notifier: Assert=
ion `ret >=3D 0' failed.



--8XmrsozuGP7txlCa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMI6o0ACgkQTeGvMW1P
DelA4ggAq1ouCX2riqWfAsYe8U++Nm7n8p5FH6iWuwN4zgsIiUQnC0Ee/Q4lIyjc
crgZnCsXoT7UcAwsAAbD3YOeze4FIWvifOg7yNRijikANr6XEPkK+SA2/sBXTk1A
4mrkfL0PkbEp6eiHul2xlb0XC6iLXrPwB835BqLMtRi0acirky1SMA7fTsug/lie
/hHvhsoXleO2jMlc20SrloqHbd/pIEmWzwAAKpSCCDcqSLD7RaDDfJr3+yP5rv43
QF/HVYUu5NPn+H4VSF/9E4+O1unePb6BDmhM8H7AKk5x3AXnNi7pVrop3QzyUorY
4Wm5LaPtGwAuhr/7B2WMQyiOCj0OBQ==
=fZqg
-----END PGP SIGNATURE-----

--8XmrsozuGP7txlCa--

