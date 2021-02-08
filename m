Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A46314216
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:43:40 +0100 (CET)
Received: from localhost ([::1]:41198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EJn-0003XP-OK
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9Ad0-0003IE-Ja; Mon, 08 Feb 2021 12:47:17 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:54249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9Acw-0000ag-9f; Mon, 08 Feb 2021 12:47:13 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id BA599B15;
 Mon,  8 Feb 2021 12:47:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 08 Feb 2021 12:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=PQKVleHvRb2BDlWS6oNg8I+sgdG
 vfKEtBOEDWQbRrAA=; b=MN6H/eamKfvkFL5N5XNDMDjQlvBG9JeIaOoG9RMKo18
 fp7oNlPkig9Y8HE9YVYUJ28A0a74ekfj6ZPAFIRVo1QL7/BUL4CmiHlHEdSv40x7
 7LqRUKWCIq8aJjhsi4Vtw/j4jJrcVuKLsNuKfwkwspBzSSQ2cevDJbe6oiiP6MPL
 RuFmImp9FXnGj54Mk+JX8Ze8utJS8ZAgUfygdh4yb8Pe48gkjp+DHDWaCzmPP4iM
 EgnYJvjtPgk7KqXW4wJ4AoHstUzjaFhw3Jynj8qrI6d3SzClHwqBYyOYU0Wzr7oq
 lZLfIRIBsYwhqLXIC5EFpSmC/m7u24QqD+uKa4KMNSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PQKVle
 HvRb2BDlWS6oNg8I+sgdGvfKEtBOEDWQbRrAA=; b=RJzrr4QpYJdnR9pHoRIT4r
 tXzsV5ogpB/04SHs7nQ/zUGDHKBRxLwdbY9LJhDst6LDVFhPaDL/viDbX2WuP7FG
 DTu1Fwt6lFCLWtP9I7bCbG6Jdh6hy0IYvxVCsx+QxOkwNZkkMWCpC1+pxtIio9MD
 cxvvraw0UOn+tU1lcDP4o6n093EAgnHV8aKn1m0XH8WmDRPwoOJ3HqO48d7tEQ28
 egIimv0ZLWL7/e+V0xsVaE5ZVXrGAAH9BdkBMD32g7Nil53+zoN9b2ioK5zP4je6
 9GZLxrkzRn1tf/B+V18PssUQa5xPf220qksjVYRngWC5bY4b19Uqg3ou974Sx9PA
 ==
X-ME-Sender: <xms:GXkhYPQrQqH-ZqTkdTaYXvL2r_wuZdT0BXQ_BxIYIqfjHKU0OmfOGA>
 <xme:GXkhYAwLkIHf6auKuUBny3dEU9csFpr3UOXm910orGBXBlypkd9TOZ4qjVH1qtjGL
 fXLcKtUR_7jpb6PUS8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:GXkhYE3UsSJsEvRTSnmkfbRsNnC_0S6NA3kRkd6bvmNbzeUWyv_Rkw>
 <xmx:GXkhYPD-U0xHq6QIsqjajnGt6s8JBT8zTFsSvI-G8Lt6wKDzx8OcXw>
 <xmx:GXkhYIjwUlgulf1yYjn_BKLf2l9zdGeaqSGySxj1_ZwfNaH_A7bc5w>
 <xmx:GnkhYEhwgnl1HrYhJXNLi6FVpwcPEUQ8-Krw7Lf_mHmjo_Ew8ZPk_w>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B655F1080063;
 Mon,  8 Feb 2021 12:47:03 -0500 (EST)
Date: Mon, 8 Feb 2021 18:47:01 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 0/2] hw/block/nvme: add support for telemetry log pages
Message-ID: <YCF5FbyRyyieFhiz@apples.localdomain>
References: <20210208141012.377500-1-its@irrelevant.dk>
 <20210208154008.GB16360@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TJpPJLSvnQm2TD6s"
Content-Disposition: inline
In-Reply-To: <20210208154008.GB16360@redsun51.ssa.fujisawa.hgst.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TJpPJLSvnQm2TD6s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb  9 00:40, Keith Busch wrote:
> On Mon, Feb 08, 2021 at 03:10:10PM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > This adds support for the telemetry log pages and fixes up the
> > controller IEEE OUI.
>=20
> Patch 1 is fine.
>=20
> I don't see the point for patch 2. We don't need an empty implementation
> for every optional spec feature just because it's there. The features
> we do implement ought to provide something useful, yeah?

Alright, point taken :)

--TJpPJLSvnQm2TD6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAheRQACgkQTeGvMW1P
DelpOgf9GrfATJdZV7nfweIEx7Jb5Lm6HCNC30+Dn18NlYyGnEhVs3PDuoKnO2Tk
jWYq4yOAAy8s56KrmaCYqb4nX3LuvaHZYz/XkJQsrveOuDxsqMvpIMYLqQqyHXJ1
W4zQRxfqDPWwv03QmTfgI2sjBq4P9PzNs858d9K80ASG4X2lR7KxzvO3lUl+XoL0
xoxajUlrUUx+KwyFA3Twyw5TfJe3pVenn+Dq2dmRX6iP3V2UMwrSG3w3QEhQcoWM
luRFRkIEc8MqfpZAKkcZr3eurnETy8b0TZSK4dYO5g/n4a9HROZWVbEJB9rRn1GM
f3lsO6cDLLwdFJh/sNvoMZ6wZz4HsA==
=xl8P
-----END PGP SIGNATURE-----

--TJpPJLSvnQm2TD6s--

