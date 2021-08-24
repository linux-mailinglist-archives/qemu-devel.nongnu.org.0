Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8BD3F5854
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 08:37:28 +0200 (CEST)
Received: from localhost ([::1]:43106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIQ3r-0002LG-AP
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 02:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIPxr-0008LV-4Z; Tue, 24 Aug 2021 02:31:15 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:50371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIPxo-0005NA-Ff; Tue, 24 Aug 2021 02:31:14 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 477192B011DC;
 Tue, 24 Aug 2021 02:31:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 24 Aug 2021 02:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=2NfbRR46ZTUMjmqEpqjnyEOtdpY
 zIfUKgCDebA7V8U8=; b=O8hCOu/dhj8nVYZZ1Kzp4nDF7nH4wbUkEMMDfWBF6O1
 rPsDMOlr2q3k+ZRP6lNjBfn+1ejLJQZuTexlItFSORphvn4tP/+mOkaV6lm3Avms
 rpXExKbKS+uxKimmY0BqiZfw1QULopesaFhVtkq0BLARVcOquPhY129B06QZNLHa
 12ifsD0LXf1pAE34vfKzdf6RfcTXyehgdHHjLYBo4v623CHtEwhsIzBlrHZmpjIW
 cyysVojYy18hArtkHHQ5UVFuAU9Gp5aRmhf6JNTE6xzzkiRQA+guz7KhGBG1gNY9
 KIAkWMsIkuogkp2sDTE2Q2rRuA2cRgx8MP2sAkHPEvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2NfbRR
 46ZTUMjmqEpqjnyEOtdpYzIfUKgCDebA7V8U8=; b=Z4ZcHWr9pVGv347x+Z3eIp
 FMLlYWOdZnnJY1QaMh839jKEglm+YPxu3VavnwL9M7V/j11Eu/T5Z/xykflbOks5
 etG2ZYZn7s93U65eqZQbyV8dfc7iiSNaehhlp37DYuH6ZxF3V06QiaMj2srFMF8I
 QI/KSkoZvhicbMpEUYDICnAd9qFia4ITCGxv2QxXtoy9f6WrntffzEQhnypKNNeI
 Vc4kC3JeaqRTbHMzkVeYEHYJmIrV/jQdb4vpfwHn7I4VHOhL/WPHKAxVu25439AE
 b4cnPychJ/aKMnQDNpnWRi5vgRKzxZlye2ncFGBvXlx+nB3lRzaLSjeuK99t513w
 ==
X-ME-Sender: <xms:KZIkYS9h4hitcIE1bvNu3uSrcXswcQCwwxGNcI6Uk82gc4y1iK_SHA>
 <xme:KZIkYSu3_ZyhHHSSf-UT4OcgVP-Z_AIHdHdmQjKRbMj8v21EmdnGWTjaS2qcniLOm
 5LBY1-QJ2Q4KrCcYRY>
X-ME-Received: <xmr:KZIkYYD3m-cdth91lQw93Km2lxo1PiH7MqSiRP4kMZdcQnp500mJnrxqJGvUOxXfRNxtfH3QHhC_8cfb47mxByBQuTizE0IvFUE6BqR0ezaW2vVoHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtiedguddtiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 orredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeeuueffiefhgffgteehjeeiveelud
 fhteffhfehiefgheetjeeitedvtdegvdehtdenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:KZIkYafNqCyPKxW3Dvkp5QM2kxNRqNC5dmGxKD6f3lpUTpoLbaIHhQ>
 <xmx:KZIkYXNe21Du2W2-W2LkIbu01lXabKJL7lDW0azTOpaFP0E2TRzM0g>
 <xmx:KZIkYUklLdESjxWo-6CTg7gS5EmtVLurzlpuOiQhdeebJJbCeDmzBQ>
 <xmx:K5IkYektVQ7bYR7VIUXELgEXsjHqDAXwQMbR9pQlWOY8LzBNfaR3aEju4EI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Aug 2021 02:31:03 -0400 (EDT)
Date: Tue, 24 Aug 2021 08:31:01 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Naveen <naveen.n1@samsung.com>
Subject: Re: hw/nvme: fix verification of select field in namespace attachment
Message-ID: <YSSSJZmFVAyChTJA@apples.localdomain>
References: <CGME20210823114601epcas5p17b488aeeae3dd41d32ab3df4fd235256@epcas5p1.samsung.com>
 <1629716613-26819-1-git-send-email-naveen.n1@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BdNr9uM7kx4zHoPE"
Content-Disposition: inline
In-Reply-To: <1629716613-26819-1-git-send-email-naveen.n1@samsung.com>
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
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
Cc: fam@euphon.net, kwolf@redhat.com, anuj.singh@samsung.com,
 jg123.choi@samsung.com, qemu-block@nongnu.org, k.jensen@samsung.com,
 d.palani@samsung.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 minwoo.im.dev@gmail.com, stefanha@redhat.com, kbusch@kernel.org,
 prakash.v@samsung.com, raphel.david@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BdNr9uM7kx4zHoPE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 23 16:33, Naveen wrote:
> Fix is added to check for reserved value in select field for=20
> namespace attachment
>=20
> Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> cc: Minwoo Im <minwoo.im.dev@gmail.com>
>=20

Looks like your MUA didnt pick up on the CC: tag, so:

+CC Minwoo

--BdNr9uM7kx4zHoPE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEkkiMACgkQTeGvMW1P
DemZlQf/ZAffUWVyBNAjLjJUdb0DIikIGsOEoYaqOEEe+JNJMitje+t9wXPYSrJI
FaqjpWTszpE3z1NpTX+SnydlM5iaCD+qI90qv3aLFOm50HM1GKnlXaQOijG+Bj2G
lP4U4eJ0jk8giOLXNjM7+2h03Ov/rz8NB4MePLeXiEiz9ALnFwngpETrCJ0rPHfU
RfVOV6OgyksnEVSsOEr11DV1yBYO+8vlsylDdnH/sWNllL+gNs9CT31Z07nQi+mA
ZiUSCX17oC/llIDKruJZDzueG5GxBBoIWLX7GbiBxyb6t9V/sEQWvUzXS0krMEOw
4DscJvf+KqL+VPGNE5czFRlBJtTE/w==
=+PGY
-----END PGP SIGNATURE-----

--BdNr9uM7kx4zHoPE--

