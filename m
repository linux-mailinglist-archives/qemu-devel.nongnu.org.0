Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A563138DB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:07:15 +0100 (CET)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l994E-0004yv-4U
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:07:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l92hY-00078B-W6; Mon, 08 Feb 2021 04:19:27 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l92hK-0004pO-9f; Mon, 08 Feb 2021 04:19:22 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3F738A42;
 Mon,  8 Feb 2021 04:19:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 08 Feb 2021 04:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=JJU/1/XJl3cRY9bYTdmrDvBlXPx
 PpncjTxt3Zv26d6I=; b=XeafipaFxg37rbPPFoi+cyX6QRoKTJpC2+SeBWfCA1d
 x4QOWa4beV5KNLvDIWt12qfiZkMFfKIcremXTWUGfexGChn8BtUhDi5hnIShX9Xl
 S4gKHiCdIExvJDObem4kYEf/EIHvvrMCT7U1sNuuVaxyFxzvp9sGlSfiKHc4wlbn
 qkKUb5nhGNVGjlVJ0sH5C4vLTgUSFVpFCz31xQvyq0Nllg9axsE/sG02pdh+m/jw
 VGts3QYGDTgIbooEaU5+Txwe5uOwMY5KudriEAHp/cYTO/+yQb2x660bC7MmEhIJ
 1pr7OKJtkgWjZ9NZWI/0XL8/T5bHVh9RwKIVsPil14Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JJU/1/
 XJl3cRY9bYTdmrDvBlXPxPpncjTxt3Zv26d6I=; b=uhtCDTcuhpzmnMJ/ueQlO8
 bQkkQfwB3czGTyWUNu2LfEKwUAyW7AWUSK2eXNSLG8ssz77uUlKHTNd/h3YMOelO
 IZSl+/CmOq0SVlVt2t3vD/D6BbIUo3tU1K5LY+dQsUndVQNMV4GKGjrCAZOLBLn/
 op9ZV86ljN7OWalGWMyZ5f798Y0axyrsoYaooiVSMFjYFjfDhUh7yrI0LQGwDRKT
 t9j6aar2QEK97SOHYJf91bQ3kQYyIQiSpgt8029tJjNfW+plHCyzetJYbzPfZIko
 smuIPlBwLFgmdJoBpStmXz4Z594LR2ZFhlxQ0PdiEyj9I1kBTBYhnuQPDx6CQ7hA
 ==
X-ME-Sender: <xms:BwIhYAJxgWg6htrs9plqV7MZHEMRVEtAuATjPjcdmdlhhc-wqMPphw>
 <xme:BwIhYAIGc_xL-TkpGz67R2--JwsfhcaKVX4JyWPovvs_kA68LL2DE8PCcbnuh7t-o
 abuqzQx6LAgdk3s2v8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:BwIhYAuzlxFd8TNWDsMPmyMnLhNThhyyz0pr7fA6-WUif78ukxflfA>
 <xmx:BwIhYNaJeqVGJSdmRj6PfAdDMLxXLCCnT_S_UZpiZNCA7zeAew8b4A>
 <xmx:BwIhYHa4jm6Y6X5uj2Ir3RvyvOgGlmOdeczw6_GiJaWNy2GJW3U08g>
 <xmx:CAIhYMMaFSyatsLJdHUomBiRr0-IFEePbRwpcGw7cRblRBDHxrBGfQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 67A5E240066;
 Mon,  8 Feb 2021 04:19:02 -0500 (EST)
Date: Mon, 8 Feb 2021 10:19:00 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: "info@dantalion.nl" <info@dantalion.nl>
Subject: Re: [PATCH] hw/block/nvme: improve invalid zasl value reporting
Message-ID: <YCECBCV5LbTbYn84@apples.localdomain>
References: <20210208082532.308435-1-its@irrelevant.dk>
 <75433660-5650-8598-2143-4158113acb8e@dantalion.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uBL4A9j8hiFucHio"
Content-Disposition: inline
In-Reply-To: <75433660-5650-8598-2143-4158113acb8e@dantalion.nl>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uBL4A9j8hiFucHio
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb  8 10:15, info@dantalion.nl wrote:
> On 08-02-2021 09:25, Klaus Jensen wrote:
> > The Zone Append Size Limit (ZASL) must be at least 4096 bytes, so
> > improve the user experience by adding an early parameter check in
> > nvme_check_constraints.
>=20
> I have confirmed this and it works for me, I don't think I am actually
> qualified or understand QEMUs source well enough to sign this off but
> just wanted to let you know.
>=20
> Thanks for the quick updates.
>=20

I'll add a 'Tested-by: ...' tag from you.

Thanks for reporting and following up! ;)

--uBL4A9j8hiFucHio
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAhAgIACgkQTeGvMW1P
DemPTwf/QTQQVih8ZGq3Owu1l5jMZ+j4eTzZIohHq/ktgwzcqiUwdn+/2fCdOraZ
X3qREG1i+OzzTniYz5Qdc9n8HzyTbywGTeF6JRpBQyDCnI+vHKyPQdcMjmodvOtF
CqzotlbywFUOtyHlaSvgBSMLYHlx0eEUEy/sjvC3JqlJVP+H20HBSelRzoaNa82W
/uf7k82GY0UoYYSnjGXfgeqJkKXwOUjpwQYxd2Cvd6P/zoCYARZDx/KDYwaMfSLp
eApE/SqM6TSaUw+gIeOQvyK/raeakRbMRWAjuSVhAVgxnlIV9NuMw33LwTYgy/5A
aw8SMxCPRaUuzefkTE7OKBDu2NYMpw==
=qDGX
-----END PGP SIGNATURE-----

--uBL4A9j8hiFucHio--

