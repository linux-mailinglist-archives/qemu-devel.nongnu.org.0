Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3B25080D6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 08:06:48 +0200 (CEST)
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh3UE-0003Bu-KG
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 02:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh3DB-0006XP-4V; Wed, 20 Apr 2022 01:49:09 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:44841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh3D9-0003nE-8d; Wed, 20 Apr 2022 01:49:08 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8139C5C0062;
 Wed, 20 Apr 2022 01:49:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 20 Apr 2022 01:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650433743; x=1650520143; bh=P4
 A0N40qncbIsnNDAtxrt7TOSXhs4Mdb8FlzHkzNbFc=; b=LLRxaOKFgL0oSaiH78
 /rCSGlW100ApKhjvqwh+daLzA63APs3ClmKjXGPvrOZXVQnuPFnxOH4+llm2NNlN
 fsyvQi3NgAkNll6h0tlpZlT34a/suur0ETJThN+irJD6nLewoF8uDhwyE7RSMfSu
 5BCSxk1ywFO452qVTVTrbroevaMPbYo7kPlJ4jLO2meMWcUidhz/DIjNdn9IYJPk
 wZzH0sNs6fnOfIOE48C4aYxW7MGFRrD+U6O7bmIbJyKbV8czWP7TI9WaGpwhkKjL
 6xbimrKrk7wM8NhRgFl5r9seIBnk2estcNm1yJi0BK5Njf+jA79n1yVmmMGFQQKf
 i60w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650433743; x=
 1650520143; bh=P4A0N40qncbIsnNDAtxrt7TOSXhs4Mdb8FlzHkzNbFc=; b=q
 HDlGs7I0uK7YY+XtBrHIiQZbOXh52QvANegZA406ad6EHx0m8ZIYmEWrcjW+YabO
 b1sFJabPuITQufyDZJjMF/yQRYRobJ6AuqwXGRfrEvaB5yXxzmvWJfX9uhpnmbEM
 Ty97oMyrPNLAmNepiKPqV06w+Sp4QtpYurlWVkYT9EtGr/zwRAA9avKhe8CxDELv
 kxtwffmWflJujL+BD7sChaHkl1dtOlZ2YERlpD/tg4nJi9y2mtgiP9iFXSU40Cul
 mlGSwYPsZJm7wF3cmv5riIYF/0BjWepfFEW21Sz4vxwUqV4VgM6e74bF7tO9N2dJ
 ljVQVt4tdF2TX8J0wBo/A==
X-ME-Sender: <xms:zp5fYiDP6ocZsZ54zHguyChWoHi0p3pvnb9sll0FeBF8hI7Ghy9jAQ>
 <xme:zp5fYsgMh87GZbhi_jMkXAFyWNY8RalgfLTOFh2BDFaeURtEsmm_g3jJo3TkRo-dw
 jD7rMQJKp7eBm7LAvM>
X-ME-Received: <xmr:zp5fYll5vHSVcxgr-BU5FvWmjsnZNZ-Ca9-HSHC1i-x56K0AN2y6u1Tqfv2JfcY6SGYOEVs0LaLVpyd5FdU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtgedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:zp5fYgwNNVo8Z3ym3ei3Jd1_CGcAWL8igs8G5VsdrAfAAquysv5_cg>
 <xmx:zp5fYnQao70Agcn4E6UZhWpMUabgOCbkW9xFwMs0GVpmT8ywCNVNHQ>
 <xmx:zp5fYrYXDcTnacPNEiPQlqaIkPwfapZ7b-97dV-Xdx7gNhvwC4cNOA>
 <xmx:z55fYoKw-NLyaL8QqOS9Guqp8lOoDMs8LWfP--yQD4sR6mYi5nCfPg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 01:49:01 -0400 (EDT)
Date: Wed, 20 Apr 2022 07:48:59 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/5] hw/nvme: always set eui64
Message-ID: <Yl+ey8yiaSrYY0CB@apples>
References: <20220419121039.1259477-1-its@irrelevant.dk>
 <20220419121039.1259477-3-its@irrelevant.dk>
 <20220420053059.GB1901@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lod4pgjo6IypGf0m"
Content-Disposition: inline
In-Reply-To: <20220420053059.GB1901@lst.de>
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


--lod4pgjo6IypGf0m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 20 07:30, Christoph Hellwig wrote:
> On Tue, Apr 19, 2022 at 02:10:36PM +0200, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Unconditionally set an EUI64 for namespaces. The nvme-ns device defaults
> > to auto-generating a persistent EUI64 if not specified, but for single
> > namespace setups (-device nvme,drive=3D...), this does not happen.
> >=20
> > Since the EUI64 has previously been zeroed it is not considered valid,
> > so it should be safe to add this now.
> >=20
> > The generated EUI64 is of the form 52:54:00:<namespace counter>. Note,
> > this is NOT the namespace identifier since that is not unique across
> > subsystems; it is a global namespace counter. This has the effect that
> > the value of this auto-generated EUI64 is dependent on the order with
> > which the namespaces are created. If a more flexible setup is required,
> > the eui64 namespace parameter should be explicitly set. Update the
> > documentation to make this clear.
>=20
> How is this actually globally unique given that it uses a start value
> that is incremented for each created namespace?

I think it is as good as we can do when we cannot store the EUI64
persistently anywhere. The EUI64s will be unique to a single QEMU
instance. If someone wants to simulate a fabrics setup or something like
that, then, as per the documentation, set the EUI explicitly.

> Also EUI64 values are based on a OUI, while NVME_EUI64_DEFAULT seems
> to have the OUI values cleared to all zero as far as I can tell.
>=20

It really should be a u8 array, yes, but won't the integer approach
work? The "template" is byte swapped to big endian, or am I off here?

> I would strongly advise againt autogenerating eui64 values.  They are
> small and have little entropy, and require at least three bytes (for
> new allocations more) to be set to a IEEE assigned OUI.

52:54:00 is a "private" OUI if I am not mistaken (something about some
bit being 1 or 0, cant remember the specifics) and is what QEMU uses
when an IEEE OUI is needed (MAC-addresses etc.). This is also what the
device uses in the IEEE field.

--lod4pgjo6IypGf0m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJfnskACgkQTeGvMW1P
Den6VQf9HVtVtkV/LQmToOuuBpU0pgHuk0SDDRrGhUJLKXIs6+KNn9lUgXtdv6oo
oW28uXU7iZpo/0EQe/rm+ABj5bWBTDLKZwZo03F+hk6x8F9O8KLibpZeowrNKSJd
GPQyaJ0vO0XHvE3YEnwN4LmnnubQv27uOye/O0XE71F7J/dzXxHor2cvNLmF/snD
Qil4ypwHqai2iN/9AK1DKSakuSdEFPcnnSUkn3xr63N+EZKqL8kjHhVMpEHs+dHC
0Sd/b+OA1fnYKKy43PLiPcM/5wtaSFcHsAIAx/fu06PylRTik7NJ4nmZPEF/8WTr
6K8CM1c+noxZT8vYDXcefH3bP6wSew==
=8rk2
-----END PGP SIGNATURE-----

--lod4pgjo6IypGf0m--

