Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9265C3F7466
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:34:18 +0200 (CEST)
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIrAa-0005j7-0p
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIr1v-0000Ee-ER; Wed, 25 Aug 2021 07:25:15 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:60197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIr1t-0005NX-O4; Wed, 25 Aug 2021 07:25:15 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 8CE9D3200AEE;
 Wed, 25 Aug 2021 07:25:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 25 Aug 2021 07:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=jGQUlGs6yZmufQmfIpgYz8Ik99p
 Q/yuNXns+lTO5TdQ=; b=hqc/4LBeYEFVEaZB4qfHOdI+hLmBMcYbffKWyZx9xzx
 UmTsAZnL+bzYirWj/I0+zZpQ73Yj8t7TLgYsy7Cxe7w81lVpr9/5M1MLXvwCBxQR
 IY7UjsvL21jgd6APQ/wBBE6OB7CKRmwpFIA74W1B2DY9om7mjoWHbNQy4osBvWhu
 Bses7f9iakQGQKyaOoSaFeeGml0ATUg/TJGeL2SrEVn2sPeHXDEZPkEznkcvY7us
 5igLdsoK5H7oE6daTgcnBaZ3NA6MXzYkeAPQk5l89XYSpBc13mben6cBgnOixzvr
 StLLYDAI48XqExg8+EOGPVFYHtFO1jxgwMqAERTw/9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jGQUlG
 s6yZmufQmfIpgYz8Ik99pQ/yuNXns+lTO5TdQ=; b=DYnt+OpRkTOm7HFva9+cHs
 RcTJ+3S71qaDaxHPhVtm/uXQFdlTyUtl8JEqekNMVEcIGNZfOVTkNA0E6oEOAqcN
 hUsUdzg6cEM01Jv6kqnv/uENQOZRxTAMt/LT0AIeFQvMBZO1xOcPe9ZOpCkbfc9x
 JYT1bRbw90FZc/R7n/fGpMjfPkohwFMn9GfKcg0d8vmgAgCnhKbFQ5EO7kYgCYdY
 90UIJmEoPURNQkrHptQptKVpMYRpPGCQlVQdZLD9OFHCM655lkVPwblEd3f91RUb
 uCS2G2OZLcqpfebRwAxIs6i5/LObRZpxX4yC8wTeV2qS6TicOpeQPjNwwei7EkOw
 ==
X-ME-Sender: <xms:lSgmYeoa_EzuO7vrQ3WmhOv9VMP1fGkNNaCueH63UlQXdt7eOsMZSw>
 <xme:lSgmYcrNM0tP0wjEqW-Jv9fswf8j488CXhLRmrBoqpHYecU28BBroI_BONWl_J33x
 3yOGh3Jzy5DXmOqG2Y>
X-ME-Received: <xmr:lSgmYTNzimkz3cOdzymDoaZlQVW63xaoMB1C2DS9t7Hcl_vS5e_FkXOluVvhAX0_sgo9N0tSCAxjU-mJKIcxXl4anRlO8Nkpw7j5ADU3OlcEeyBrAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtledggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:lSgmYd5KWgUmlqbr8IOWszkAeh80OeFjwYIig0N0TBh_Kfik_GBnnw>
 <xmx:lSgmYd4YoSuBRmMHyCH-AvZZX2sA0iwD-u0NoAiSi3tBxfCUsjS-3Q>
 <xmx:lSgmYdimfUFPRE4jhvB9f-WUg13cdyNOGAFNf6n_U8E1OpUd-QxGug>
 <xmx:lygmYYZetHF6TGcP0F7MWPRzwumZwytlyrgrXeNEM3ukAmK1UQPgXA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Aug 2021 07:25:08 -0400 (EDT)
Date: Wed, 25 Aug 2021 13:25:05 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/9] block/nvme: Use safer trace format string
Message-ID: <YSYokQ/AtvPjYd4L@apples.localdomain>
References: <20210824141142.1165291-1-philmd@redhat.com>
 <20210824141142.1165291-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YBbOWFarkDsQJaCN"
Content-Disposition: inline
In-Reply-To: <20210824141142.1165291-2-philmd@redhat.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YBbOWFarkDsQJaCN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 24 16:11, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix when building with -Wshorten-64-to-32:
>=20
>   warning: implicit conversion loses integer precision: 'unsigned long' t=
o 'int' [-Wshorten-64-to-32]
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--YBbOWFarkDsQJaCN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEmKJAACgkQTeGvMW1P
DemZ4Qf/WvKRMMFebL8cfyaIaYmSFIUTl7lBHI5dwe91XM8IdPe8MEf8Oo2HjffH
x6Dibj8ZL7C9z9eYrwVwXsEJurh7iVrs7adlCwhccjv/Whbq1cj1YZSzxnROENiF
omFot4EjmsQ4WJYZtlfcp8lI6/guCpCf1pUnHUji/KCNsXyt3q+HGV2ZfJyufC0M
l09U/H6q/+Q9u9FM45735vybekcPfu9i3LbbPlN21NlzaHM4toPH1PO/4pWVA39q
l3DXdtYz5Haa5+dcctErLJ+VMQT9Y3SvdgCCbF35CkbFemE239QFE93+WYNPzxuJ
W32GaubzoIaPDwMR5XsehV63QTTU3w==
=h8uO
-----END PGP SIGNATURE-----

--YBbOWFarkDsQJaCN--

