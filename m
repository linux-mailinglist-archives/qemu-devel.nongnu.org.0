Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D8B3185B3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 08:33:50 +0100 (CET)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA6U1-0001hV-I3
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 02:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lA6OL-0000QM-JY; Thu, 11 Feb 2021 02:27:57 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:55521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lA6OK-0002Zy-3b; Thu, 11 Feb 2021 02:27:57 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 650445C00B4;
 Thu, 11 Feb 2021 02:27:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Feb 2021 02:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=DWmIYRxw3NQe6V49JbVGYJuQkiW
 xMZoanjvIrIXbdkU=; b=VcW4N3JYpRLcpvo5u4jdDfzzdcq6NEM6bVHcS0JsUUD
 WpCb03N+udtA3UOdzyYrvxqXIQwBSB5A1gWS3GB5CUYSZDrb2UbGU7rljaipD9eF
 VkuyL++C+p0vk0LO+KoiZdugPe2jN19rmQCuSoR6U5eNyaqwCGsqsNd+zL4t/S7w
 8o4Hm9k6RxdKy/LDGXhX2BhXrBS457KT/UO9UGiKKbOmYc7IrOklTMjvXHI358jJ
 P8b52NAm+a8JPevgtac88f0LvkKr3RcxTGWlWCOWNjGvSzNQJQOotX8rhU587HSt
 0H3RDZLVP4snPqATgvXjv1Wjg/9XlYvQ3pnJsCajvIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DWmIYR
 xw3NQe6V49JbVGYJuQkiWxMZoanjvIrIXbdkU=; b=U0na/vPVdGnPfcT4rj56TH
 BFSI0RavQPb9lQykkAuquAsmRGqB4cr6Hackss7pavBcg3bpvH38KufPCesJHVDB
 nP9zS69WwjOzstDYcjduSl2t5rWobWxX0QGtdMMMVeJi7Rs3hjK7AwOBNeiES2e7
 Ju0+Ief5zxDEXwRFbBRcbB+FJTdDBYG7PGE+WMToCMA0xFJO/bsE67bLocLo5CIe
 AlA/OUxES2bJkKPrlnwly5ML6CrYNBdnXEaA/DwBSiXjdsVEfPnTMnqN/Wqro3dp
 TO50i3Q8n4HVi/fpHqVvqR7qLbTMJPeoW2ijAv9Ho9sAJjHgPoUoX/vhOxDG+EIA
 ==
X-ME-Sender: <xms:edwkYOKDtu5xIAQiW-yq8YTMASnjunUd4f81Uziwz5JOSjo9uB3xBQ>
 <xme:edwkYGJPgXav-df7kVxsxOrftMNlFvzLOhThRUA0bG1PigaE1H9IkJKnIt-HKsX0N
 PuXsWLdsr4NYT4rIoo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheekgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:edwkYOswGcRF0-2qFuD1WGlnp2QoyQ73TCHrzG-Kc9Do3XVLrHiI4A>
 <xmx:edwkYDZiNEhJFvk-KAerFvggJUeFYQG2QFzroWMsKWTdQjvQej-iGw>
 <xmx:edwkYFYZlmjQNSGYcVNqa7InIOi3HMCnWJchWTiBhfaasA_WOUfV2w>
 <xmx:etwkYIwdOqc8sn2rJ0ERzSKMCYWURMYZXmpf4cwrOXNYvmYqf2DTjw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5DCB6108005B;
 Thu, 11 Feb 2021 02:27:52 -0500 (EST)
Date: Thu, 11 Feb 2021 08:27:50 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH 2/2] hw/nvme: move device-scoped functions
Message-ID: <YCTcdnp1zs5+fIAj@apples.localdomain>
References: <20210209110826.585987-1-its@irrelevant.dk>
 <20210209110826.585987-3-its@irrelevant.dk>
 <20210211025500.GC24885@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mdGRyVpU+5+EIJ/q"
Content-Disposition: inline
In-Reply-To: <20210211025500.GC24885@localhost.localdomain>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--mdGRyVpU+5+EIJ/q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 11 11:55, Minwoo Im wrote:
> On 21-02-09 12:08:26, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Move a bunch of functions that are internal to a device out of the
> > shared header.
>=20
> May I ask why?  I think some kind of these helpers can stick onto the
> header.

I just thought they were cluttering up the header for no good reason
when they dont really need to be exported to the individual devices.
Especially since I consolidated the header files.

--mdGRyVpU+5+EIJ/q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAk3HUACgkQTeGvMW1P
DelHXQf/c9/AAVhqNvkWgq+WVuoX67MuKZAjnwm5hrMp0Yqrfmc9En1Afe2/a/r/
pen38qm8HEmYiUXU/oO6xDAPPFQEHjwehvTWFGUHxfv4dy0SC45eaFMi1JPETxaj
ynmyM35bnB0WFGZvqb0AVNgkyuU/cq29hY0S71YVehjv9DNpKjhOAnomw++mY1za
CG59AcZKhXSs8i85MSjjoXk8l1g9InYjJUH/uOTWjbSbtZREMZlU0smXrv+eM3CZ
TyMFWFVu3lNZnaxPqzwohzVgNp9Lo0H8DB0p2AZhnlnromqIfOrHr+nKHq70Nsza
JHlJzmggOR4diNQrREfE7zCQX8noZQ==
=i+9f
-----END PGP SIGNATURE-----

--mdGRyVpU+5+EIJ/q--

