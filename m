Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D780A331713
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 20:17:38 +0100 (CET)
Received: from localhost ([::1]:50234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJLNp-0006zU-6W
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 14:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJKti-00032u-Cf; Mon, 08 Mar 2021 13:46:30 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:40997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJKtg-0004nQ-9o; Mon, 08 Mar 2021 13:46:30 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4A68C580600;
 Mon,  8 Mar 2021 13:46:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Mar 2021 13:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=QnunLDI9CUe+wWcJ1LOt0WwRmln
 AFUicaOgPjDZeCBY=; b=m9htXV9q4WtJyGTAjKzV55D4kz9uLHl4/ghcrSKHWj4
 vx3SR+N6TiKMaXs+cqadZRcSlJh3JXgeFCW9TF6rfd94IbeHxA09zhhvaPmdCyXM
 /cwIWxPyXkrFAUO2zrhiEynnXhYAzIvNwP4x1tLk4MCT30c6pWynxauDuhTLmFjY
 amTJB35VypXy+yWzkpdaGRuyfvizkUZG4fxJqZtAwSp7/uAD8suyBFFj8g3hcdbs
 WDvC0evmHmkuV3P+WlEIwaySzgc1bHLClMKxBmIc2xT5gAEoIVh9JOY5MatZSKW+
 HcxOE5wGFMTNn+8p02/LLfAeLGzuiUhcAL5RO4T08vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QnunLD
 I9CUe+wWcJ1LOt0WwRmlnAFUicaOgPjDZeCBY=; b=b/iD15jZeEzCaue1sdTWvN
 1QhAf6sYj6v+MZF/ckLnmX9GPMbYNoje7zBHZE8oOq1NYWWDoFTy1ZR4xh2ddYOp
 7qd09stfRzS5HOIWckebbVczKTPG4Ggjt7ToZQSG6DuPJaa6rhcy1SEChYTd25Sv
 w67HPjxYr/bNtfSTmivL1RU+V6+uhZ1k/y6W4kXnd1Gh2cDOG5fuIpumWmS8RKpE
 7bfaG4tXlR4/l5qSn2MmYEZ93C5ebsUYoIR1KDb7yyOwiQSvW5NNY82mQBYSSXUI
 8GrjPKUGpoUKLK6T7wMixA2aElGNL5ued/vDQsaWK62OI3TVo3P8YFWej9bmjBtA
 ==
X-ME-Sender: <xms:AXFGYOHfJs9B8O44HdjIjkIlhGVPOemCk9EjBIvREhtqk1SSGLKYMg>
 <xme:AXFGYPWUE-rKe5SzVrqnJZQiCYcjsHTL_UHcJLgFQJ6cj85da9almV0_KU3EWWKOz
 HPXbE620Ege6_s4F4o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeehgeehgfffgeekveefteetudekheejffdtvedvudfgffelleefvdfftdekgffg
 udenucffohhmrghinhepvddtudelqddtkedrohhrghenucfkphepkedtrdduieejrdelke
 drudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:AXFGYILiZgHarHx6xp6BRkMxG8aFkG3gqOfYEqYQV3mZzNKYvFwHVA>
 <xmx:AXFGYIGpCtkpL0pxrfPGqIXg1-wKcoqguwxqCUhQ7CwQvCCBKnMSoQ>
 <xmx:AXFGYEXWA1t87KsBeE8uQ5s5Al_WDbBcqHVtWTyZVg-eSoKrtjun5Q>
 <xmx:AnFGYIpve8NU5EEy9hwPQhTH1N30GcMbx6V2qoNAdYQ1283_d7bGbQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id AFBFB1080054;
 Mon,  8 Mar 2021 13:46:23 -0500 (EST)
Date: Mon, 8 Mar 2021 19:46:21 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 01/38] hw/block/nvme: introduce nvme-subsys device
Message-ID: <YEZw/cDu+1zouiHT@apples.localdomain>
References: <20210308122313.286938-1-its@irrelevant.dk>
 <20210308122313.286938-2-its@irrelevant.dk>
 <48178d72-444c-91fd-c1ef-0ae28b8a674e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AMWcBMgIGZyrVgpg"
Content-Disposition: inline
In-Reply-To: <48178d72-444c-91fd-c1ef-0ae28b8a674e@redhat.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AMWcBMgIGZyrVgpg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar  8 19:32, Paolo Bonzini wrote:
> On 08/03/21 13:22, Klaus Jensen wrote:
> >=20
> > This patch introduced a simple nvme-subsys device model.  The subsystem
> > will be prepared with subsystem NQN with <subsys_id> provided in
> > nvme-subsys device:
> >=20
> >    ex) -device nvme-subsys,id=3Dsubsys0: nqn.2019-08.org.qemu:subsys0
>=20
> Hi Klaus, sorry for not spotting this before.  In the SCSI subsystem we
> moved away from using id as guest-visible data.  Keeping it as a default =
is
> fine I guess, but would it be possible to add an nqn property to nvme-sub=
sys
> and use it if it is present instead of the id?
>=20
> Thanks,
>=20
> Paolo
>=20

Hi Paolo,

Thanks for pointing this out! Absolutely - we have no specific reason to
use 'id', so we can just change it completely to use 'nqn'.

Peter, you want this in a v2 or did you already start integration of
this PR?

--AMWcBMgIGZyrVgpg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBGcPwACgkQTeGvMW1P
DelxTQgAtszrIjomIH1kxEAa9xrLsw8K9go4Tto/6DkPbl95aBzVCaj+QZCtwZAU
x4rdJPOa203grb/Rwngw9yHkyiXUHCwTu9q5ItDLbVuixVIma/SeU7tyE9sH5owk
VYDNtnsjI861M6C0+JwgQlPIYYdAGAo9fuJGJKM9nO5PqAxNLgMztxazmc2EjPOs
RMe4R9FUxB1VESAxt2gk8CugA1eANzv286MFqhgMa973lbLS6p76opGAp6G5MSQh
C/lqWJaqHkgTtYgEPRKrOfIovDXGxMbAA/AxlMlMycT6JdaLDG+Iy0lL0GxAnAK8
VJlRL9AUYJoY0I4cug+u6de6ir/rSw==
=pfUV
-----END PGP SIGNATURE-----

--AMWcBMgIGZyrVgpg--

