Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7B03142FD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:30:01 +0100 (CET)
Received: from localhost ([::1]:35958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9F2e-0007EB-EM
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:30:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9AeI-0004gq-Q8; Mon, 08 Feb 2021 12:48:35 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:42003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9AeG-00011A-QK; Mon, 08 Feb 2021 12:48:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4DC69C89;
 Mon,  8 Feb 2021 12:48:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 08 Feb 2021 12:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Eixkel7k5bO0SNp7Gts0mR2BExZ
 WF50WzNIji/HWbbg=; b=iEYQWfendW8sp4ykHOsmOPZK0ArjUXM8oKyQgaT4Iuu
 jgIfiO33M9s4zgcDc5wQ/004XTkNz3bCgtfU+LUzoVPe/aFh8jDl+5hLVe7AzWwl
 r+tY8SntfyfyKJWyzSFeUVNDHcbb3Qxiwykr2GJtD4K9ma/uwy3czvkGJW37t+ek
 2BJ96sHDFlgfg2CuoNAGiVMg58k7iEA17IDpVutwoJdPoK3afabLgtECESqo9rCl
 RRWZYOoWyz5yGrDK2JyLaDUYAFHx8PJtpYOoGDEenfT8CGQeFl0ebRgKwsi4H/Wg
 cZsKBlMJWtNIGzrIq8tEKa6mRhOe+KVMZN187tv00TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Eixkel
 7k5bO0SNp7Gts0mR2BExZWF50WzNIji/HWbbg=; b=DMghhpe4KQLoAZ3+aVFnts
 VjC3COPLYsy5v3xHGki/O0MAFIQOX6aH0PVbS1cFhuYCSxcv1Y45fFced21wQBJ5
 2Enj9B02cc8gYX+v5exFh0F614KBwKyQFDw6Jyxx2dGMo9fiw8wENHX9JdrhZDWM
 uooJmHbBd6XyQOYor5EEtRVUeceVajBAgmyxCLD2refgrllntjosjrKHWJICdsbX
 7DFKzh8zX4+XAeOzvLX74q+mHKtnw98V/AXerxPhooKYTq9uQiuPLLOCf81AYmT1
 td8nEC6lDjj9Ufq7ByMyGo+sf+V1Wa1g6JSsY82HplBms2u7fkktpvA0wcPVy25Q
 ==
X-ME-Sender: <xms:bHkhYNFyZ5fVceMe5Ytn9oFHleRWQkEHk2Na_FQdXa5uzyelqeq5Sg>
 <xme:bHkhYCXF1ca2xt9FECVUDIxVkR3aveflM5i43T4KuIwrBbEJlvham73HEPj54nPXW
 rp0mpV9Sqf9Uj74I1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheefgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:bHkhYPKGoIOtNzRvm1VqosR0MhFo-Bd3bkuv-TPX9dJdTDwfwFMFEw>
 <xmx:bHkhYDFNkszBMfF_C-XsRdtPZrcdtIYB99v1FFSrRModDTyBFuN0sg>
 <xmx:bHkhYDWoFG93LvUlQUSiDvg5ih3zEv1vu1UCBNMAj-AcGbq2QviCXQ>
 <xmx:bXkhYKHi_k42dOJqXOmffnPTG9jp255vQopHK-5Oj_eqn1IiL2Rj7A>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2F10A240064;
 Mon,  8 Feb 2021 12:48:27 -0500 (EST)
Date: Mon, 8 Feb 2021 18:48:25 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/block/nvme: add broadcast nsid support flush command
Message-ID: <YCF5aTzIPSPqhEFe@apples.localdomain>
References: <20210125204231.254925-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hSBAggJUBZalqk2q"
Content-Disposition: inline
In-Reply-To: <20210125204231.254925-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hSBAggJUBZalqk2q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 25 21:42, Klaus Jensen wrote:
> From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>=20
> Add support for using the broadcast nsid to issue a flush on all
> namespaces through a single command.
>=20

Gentle ping on this.

--hSBAggJUBZalqk2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAheWcACgkQTeGvMW1P
Den1UwgAk7du2hk+VvIDPBFxeb/woG7iyGgIZgD8nO9mgFIUZpxBEz/Jsl3Z/SSf
LaA1drJeE5KB7Tz/vcL8P/J3f9PO+qRN1wtZsFaCqup/iROKpIf19g8YqBDLrBZ5
ayZhlzuSr4T5oHKmAUeSdg5F8OA4C5AqR9RUqbIpNrenx+pbrCcW64Y2NWVA40BQ
DNEKa6Wt7sl3BLHreEA+prKARIoeZXY1v+bsB/7RDPKNjhJWZ1Dl4jdhg0bsJTCr
VZN7ULY0HcY/gA+RoCkvrC8eNF2Z6ahCptKkVXDPdsLiudBqmdwgeAdSay/XnSea
2MfWq9dYtVquhvu/gBN+pU7uumIQFw==
=FT19
-----END PGP SIGNATURE-----

--hSBAggJUBZalqk2q--

