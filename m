Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB94430E309
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:06:10 +0100 (CET)
Received: from localhost ([::1]:55882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7NTc-0007s3-0l
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l7NLs-0005tj-7w; Wed, 03 Feb 2021 13:58:08 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:55985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l7NLq-0000aj-Hv; Wed, 03 Feb 2021 13:58:07 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D34DF764;
 Wed,  3 Feb 2021 13:58:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 03 Feb 2021 13:58:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=3XQg9vSVzD0p5tgTiGpD6JD+aJX
 llakLohQsa6TgWmM=; b=jwq0s2IeC3V5TLZk+fm1lOu+RvXzqNeLAKg2w3lMiLw
 95wQVDGwzwllLk6gxRmQon1zO+ByL9wBEAT3gf7t+N9RcESgnxeH7Zk1VSCGoUw6
 kSfZHi7Z1fviH2EiL2zT6TGX5W9Oyu0BBLDp/QkKPY7UOU6M5T4MfoxgfYUPzekd
 LB4CqoMtAbMMOx1NpK7noDO9tMwntBEN2rJrRkeyfxDTgglHD3LFDwaSjr3e1jf/
 fNEf8N9OlEELjo7guGv0W8EaqYtgXLqiBd8vqlCsRbXAZpIPhKgUmPbkwKBmkkmv
 GjhAUAYDoyezYY1rk/lp4Am8tw/qUeHHkUgf4ZbTMaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3XQg9v
 SVzD0p5tgTiGpD6JD+aJXllakLohQsa6TgWmM=; b=FOx0KE1bp7/6/MSA7fkBKI
 t2INGCXELoDZy1IwwFxdQHxVuKaJsNFKI6riPCxiY8Vwzsgu50/KatXIA22V3xDd
 g+F1AhYkT7RaK4F9i9VzsbSz5rrt3hCrCQz2jjTiNAS1JsS1fml2/9CTmnXOmo2O
 MsmYti96rChd9fvye0Q58fxMNakfcFu51FqF8TuMAwx2UBv9r/bZbUbDHVdBn0iC
 gpwj3574sBZCQ0IX8lC6V3gAF10aeUz0XiQ3GIs/VOHzqFuQJ35sfUKrj2DPpRLh
 XObUTFZnFnAgFX5RlpRjd7K3ywqWkXKsFoxZMTioMlytVLRGgF0GMyS+ktB89mJQ
 ==
X-ME-Sender: <xms:OvIaYGqW61KdEubjRgc5blfcfdxgqNuCVWZGpBvduyjtJEzgukDfMQ>
 <xme:OvIaYEpjINVRUmKguaCvp21FR6cpfzJMsq3r8XbsQhd3CAqhW8eaqxL1B6WaKwP2K
 SW9tPRAMYpxBtMivjI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgedvgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:OvIaYLMal4P9mGKCJzVpY18KBI0LNTHK6AQliCpVAaeClzD1AvLrMg>
 <xmx:OvIaYF6cOuXYjRgGKX-jnCklWd-U3kw4ceuOEiWn5CotZB50uE-umw>
 <xmx:OvIaYF7MXCn-QGuRlFHkZmzSBAwhmIdfZ-trYL8BNaHF18QwI8yvTg>
 <xmx:O_IaYCtqc3g6jQeOgWqj9_C2eM-XSon6Xw4NQnLlIux6rDZAmfe8FA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC7421080057;
 Wed,  3 Feb 2021 13:58:00 -0500 (EST)
Date: Wed, 3 Feb 2021 19:57:58 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v5 0/5] hw/block/nvme: add simple copy command
Message-ID: <YBryNmf4USekOR6y@apples.localdomain>
References: <20210129091541.566330-1-its@irrelevant.dk>
 <20210203172709.GD2182779@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/QOoUHb0Yw+myRaZ"
Content-Disposition: inline
In-Reply-To: <20210203172709.GD2182779@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/QOoUHb0Yw+myRaZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb  3 09:27, Keith Busch wrote:
> Just had the one comment on patch 4, which is really no big deal. I need
> to integrate tooling and/or kernel support in order to properly test
> this, but just from code inspection, I think it's good.
>=20
> Reviewed-by: Keith Busch <kbusch@kernel.org>
>=20

Thanks Keith!

Actually, nvme-cli already has support ;)

  # nvme copy /dev/nvme0n2 --sdlba=3D0x2000 --slbs=3D0x0,0x1000 --blocks=3D=
0,1

--/QOoUHb0Yw+myRaZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAa8jUACgkQTeGvMW1P
DelMGwf/U/14UIgXWvprYe1v/22LALA4R142EbVA35YH3y+ZXBaC/kqFnp2RExfE
XJxu3MrboYnh90MxYQkkrrTfRRGeeuV7pQLNG6NjKqtxs+RIk/bcGGiwTr//AN7F
cS26voS1u+BH9HeLyxAvu9NoCaoEmL+Avn4wbxw0GBnBZLprrraSX+tsoK0iFcTo
ePcWQs622Uh3RebOLQz9jDUf/TILUEkF6k2NLyUbM2Ncb+01rMxPODxqaMqP9Rgp
KkVkZTTQ+sGFM/MBR/XKH7ZWnRv7wBhMmJu7BxKOLYGoGPbW6acLwScxl+4vRgiF
N1dz6mKgTNt+l25lo461RUeT29Xmbg==
=tspU
-----END PGP SIGNATURE-----

--/QOoUHb0Yw+myRaZ--

