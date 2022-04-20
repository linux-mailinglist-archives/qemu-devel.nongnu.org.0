Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E12085080DB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 08:08:32 +0200 (CEST)
Received: from localhost ([::1]:44036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh3Vv-0004LR-GZ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 02:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh3FZ-0007KT-PI; Wed, 20 Apr 2022 01:51:37 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:44231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh3FY-0004KY-Au; Wed, 20 Apr 2022 01:51:37 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B0A85C00C8;
 Wed, 20 Apr 2022 01:51:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 20 Apr 2022 01:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650433895; x=1650520295; bh=e6
 sXPn8p2tn1NOLacRXcg+bf0Y1ZYzJsGEwDjkMoY7c=; b=SxVjZRvhPS93YGA9lZ
 0eV/2K19bXSO9NysIEyhCr3ZW1xakqJIDy4OFy7hGOJ/TiPq22I0Hag5eg3ed5Ub
 GUhUPWdp3zuXkWrnS34DzKjcf9WTCujKV2rl27BnU97X+COpzviLwJxNcSoaPqf0
 FxlmKX3uaGSiXUro+aPL328RrTnuD4MCaAIcj+k/EeE+8yDQVp/i27rEmyy39RZI
 FxnAL3BoHbSKr+RsrC7iqbUYpzJyQ1XWxKyZ1t8uvo3BAvUCELE48nF+zRPY1WHN
 Hn7BhtpJ4Ogi0MerBwb+2MoLKo14aYcbfvWuU1i75DvPsX+3zHOLSyjX/99vE46j
 5xTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650433895; x=
 1650520295; bh=e6sXPn8p2tn1NOLacRXcg+bf0Y1ZYzJsGEwDjkMoY7c=; b=Z
 ctdFYLQ0c8xjOH2RGFuvh031D7t2yvudOc9XUOKBUpoVuVdKODisvYvpZZ+8JIhj
 NTeeOKgAsUjMNj+wSS724dtQp7iKobF70+0V247MtoH1bsXz+bLl8OQO0DSpsbHr
 /UlK662RTXNVsQ4/hIVTPasWkOT7SgbFoQNV/R4Gr5cPFswCMA2lE9e6jZCFCtfu
 PLPvdsW5b3xprXR5XavHw34yUESlxNgH/TtU7vxLvRrvtibGFM1v8gj8RMZ9bKPZ
 /oH2T8FMB/4Q8sOvBIaeux49db6Fmj1wKHAxw2XyjOHJ/bL0aGLY0+EJawuiRfh+
 UIJfJGsPyrXnCQy55qzaA==
X-ME-Sender: <xms:Z59fYoKYRD7StOsP98B3oiDuBpSaQ7k3uw_Zn0DQUoieChFhQ5lsmg>
 <xme:Z59fYoLXB8D2Z5FChib63zid8AZOPFpFhFV9CgfoC1Rh_WtNkoDjxQdzWntvF64p1
 N4bVLKYIiTDpbOlLD8>
X-ME-Received: <xmr:Z59fYovmLS787SgHihl3CPO1I2N7kXPBzJlj-htsBOwGYhUjblshoItK1_ZaoXoo5GA3GEKMmtz8rU8BNtU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtgedgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Z59fYlZ3sz2W-yncR6eG76D0J_-NPLVAKEjCI4a9SMRwZ_7JTGTLmA>
 <xmx:Z59fYvbXLFbLOt8GuwrudyR1dPkLPRlDz7UfKl-808C17AOwbY_VEA>
 <xmx:Z59fYhCUzeb6KVnZuXAnAUzRBwby8UQm7eZ9uuhUdEHZNTP31KC47Q>
 <xmx:Z59fYqwot4T68lkR3Dy87JedviHQtIpiQFSXFztf9uyCKprqQtcJhg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 01:51:34 -0400 (EDT)
Date: Wed, 20 Apr 2022 07:51:32 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/5] hw/nvme: do not auto-generate uuid
Message-ID: <Yl+fZI5kGW2wQ1DO@apples>
References: <20220419121039.1259477-1-its@irrelevant.dk>
 <20220419121039.1259477-5-its@irrelevant.dk>
 <20220420053336.GA2063@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ithiIFUu6dgqq7Q/"
Content-Disposition: inline
In-Reply-To: <20220420053336.GA2063@lst.de>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Luis Chamberlain <mcgrof@kernel.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ithiIFUu6dgqq7Q/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 20 07:33, Christoph Hellwig wrote:
> On Tue, Apr 19, 2022 at 02:10:38PM +0200, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Do not default to generate an UUID for namespaces if it is not
> > explicitly specified.
> >=20
> > This is a technically a breaking change in behavior. However, since the
> > UUID changes on every VM launch, it is not spec compliant and is of
> > little use since the UUID cannot be used reliably anyway and the
> > behavior prior to this patch must be considered buggy.
>=20
> So unlike the EUI, UUIDs are designed to be autogenerated even if the
> current algorithm is completely broken.  We'd just need to persist them.
> Note that NVMe at least in theory requires providing at least on of
> the unique identifiers, and the UUID is the only one designed to be
> autogenerated in a distributed fashion.

I understand, but it boils down to the fact that we do not have a
general method of storing "metadata" like this persistently.

But maybe it is time that we come up with something to do this.

--ithiIFUu6dgqq7Q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJfn2IACgkQTeGvMW1P
Deni+AgAwNW+z1CNbaj/tw+wPHGCXfYYw8APQblegSVX8wd3TRH4NbhkBK8glIAy
6UOwVFUWVpLhOQ5fZtN+gD/HN2ZXeLhv8/m4eL75p22AMdhGn/lBtqKmEGupKhpF
Fj7ZkP0BYAXGzVNMQo0tv+2LFCwMAAsNTxCZIhft5idWXXwt5U5g2nsw9FQ4SpFP
VcPEu2QJ1nkJmCwfkIajmMhCCRLmCGCp1lwQ1ntcTEYK/5vASyeFbJYgUZRQwGN9
OW2zn2Txx1H1wfvjR4rTFxF7xditU5qTUFUP1/dnlK9smC10H3/8v8OKrTBLz3de
Ht53CxK9rYcaxdsCJL5/tnB7P3SCJg==
=AqOo
-----END PGP SIGNATURE-----

--ithiIFUu6dgqq7Q/--

