Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528843A974C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 12:29:29 +0200 (CEST)
Received: from localhost ([::1]:48940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltSnX-0001j7-Le
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 06:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltShQ-0007mh-Cx; Wed, 16 Jun 2021 06:23:10 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ltShL-0005Jp-AV; Wed, 16 Jun 2021 06:23:07 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 79ED25C01DE;
 Wed, 16 Jun 2021 06:22:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 16 Jun 2021 06:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=hP4O9vc0IDLK+dFNIMbWCeHN+1d
 tHvrWnl6lghuA9ik=; b=hbR7A97my45MX6f4wLR96VabEGv7acjJnJ3xtPWtaH4
 58FtfDHdlF3uNbDdkfsbKbuUWAqvhFPvnv5/pqvi3att9+DjhDDr6wxYnhkXRdLR
 lOmAJFBT/4hIK+k649X/9NpWz7Qa+dzZywdzsK/b2l0VxuDhoF+S8U5FZrNpUiw3
 bB/Yb2jcvjBxH0rTpMsUhUIcZu1wYv6gKiJAtNGmOJI4YNbvulEGjTDg3zuntAhD
 N0VRO9rszBlSQktDn9TYIntdmAfhun8H+U25qI++MSb+hz+h/eqaTsoCOYCd8bJw
 cW3YAZuxhRTQIdcvNSBdph4wHe43XDmwvZpSSK7KZRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hP4O9v
 c0IDLK+dFNIMbWCeHN+1dtHvrWnl6lghuA9ik=; b=gzdOBHU5+wfibIx7egPNjT
 yIxGIecaZAuszJfGY6nk4vJJNKcFybt9YKvTqrFdQoTjwVR6oO/9GguUZnE50zFf
 HwP536R7fGdO45QVjJJxoxnUAJMO2gW60YnFvfznXLACKyqJm2UnpK4y/rwyxuXO
 O9S35kbAqEwbN/OgpCcKVZQ5kmxwskw3yqAww1ygbnJK1kMIHN8D2D9YGJLNORSC
 xLn4oFe9NkP7mAoC4Bb45rsUyQ/Rm4pgQejlGba2Q5H3H8GFOmBEOVO7eVIf6udt
 XbvZviFlFaxnoDHsvT95xk5PkTsH+C/LpM1Zv7flc2k/6h0Sm2crV5vQGxFAdxYw
 ==
X-ME-Sender: <xms:AtHJYFIK_PjPeCNQRs1cUR6n2tW2qwT9YCspudurj4lZ3Q0LgJ422Q>
 <xme:AtHJYBItJFx9XggIXYD5HpfzyL1UyNmJ36Vgg_V28oOmtEgjBNiEtvlBwNttPyf1L
 Xio9MpMyp95ldj6oX8>
X-ME-Received: <xmr:AtHJYNu03dv9762NFwMSddhZZxZe6_Jlemb3DaHY_0sHDDwYmA1sxpcMC9rgPhNORAh4Kqu6C_1DtdA8-NuYSUu4Zefv6Tpwewd37RqINZl7DlvesQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:AtHJYGYvqrYxMjnlwa-3Dxc_t0687Lk9EpAIVjSuRuBZjChODFrblw>
 <xmx:AtHJYMaWVw-0ekcHReoJvt7qcSSkKglAsmfKCc9Cl8rLKuXCGDikNA>
 <xmx:AtHJYKCyL22ymdraPP4FaxudAYc4c4Y3nEFsixbLludOa9jDXQ0oCQ>
 <xmx:A9HJYLxj_eRdBf-s5oMjv8gPB758LTzl011h7kVc_jVyDNAxpKs81Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 06:22:57 -0400 (EDT)
Date: Wed, 16 Jun 2021 12:22:54 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH v3 0/2] hw/nvme: namespace parameter for EUI-64
Message-ID: <YMnQ/udIfw5mLFlr@apples.localdomain>
References: <20210614201901.17871-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MV2TmlXxZfg502i9"
Content-Disposition: inline
In-Reply-To: <20210614201901.17871-1-xypron.glpk@gmx.de>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MV2TmlXxZfg502i9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Jun 14 22:18, Heinrich Schuchardt wrote:
>The EUI-64 field is the only identifier for NVMe namespaces in UEFI device
>paths. Add a new namespace property "eui64", that provides the user the
>option to specify the EUI-64.
>
>v3:
>	use 52-54-00-00-00-00-00-00 as starting values for generating
>	EUI-64s
>
>Heinrich Schuchardt (2):
>  hw/nvme: namespace parameter for EUI-64
>  hw/nvme: default for namespace EUI-64
>
> docs/system/nvme.rst |  6 +++++
> hw/core/machine.c    |  1 +
> hw/nvme/ctrl.c       | 58 ++++++++++++++++++++++++++------------------
> hw/nvme/ns.c         | 11 +++++++++
> hw/nvme/nvme.h       |  3 +++
> 5 files changed, 56 insertions(+), 23 deletions(-)
>
>--
>2.30.2
>

LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--MV2TmlXxZfg502i9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDJ0PsACgkQTeGvMW1P
DekCuAgAuapW+P0auL47kBiccaZmdN5fnvQqkoPRA48tk3NKlLXreKW8wwAVupmt
5u3kxY6WA62OiTTUzBjT7hbnZHEb6Zqc0FqB9J7JpQ32iwUMIYSu9OglVBoAiC0E
EtXOS8V0GX+aRkdbJ6T43k8WQi3Kc35Jq2hyhUAU+lktE1e0O3bTK5x7cUguySYn
o4SgBrV0rVaWK3VeDfJVW7HX5wblYX4O7c8NOIf/1dqUGs3dVw8q6Zw34gNSGQvv
WrFJ89BgXbah3Tf8u8muub8uTHYaagWnveBqj73vzaCnwIcmtF6Vq1RbM6EWlBjW
BRRmRLscNrydzUjIxiHuVeNQ/H0r/g==
=jviH
-----END PGP SIGNATURE-----

--MV2TmlXxZfg502i9--

