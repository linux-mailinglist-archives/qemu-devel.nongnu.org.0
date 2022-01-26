Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9CF49C5D3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 10:08:36 +0100 (CET)
Received: from localhost ([::1]:53956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCeI6-0000Sg-PW
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 04:08:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nCe8H-0006Xs-Ma; Wed, 26 Jan 2022 03:58:25 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:44205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nCe8F-0005Hs-57; Wed, 26 Jan 2022 03:58:25 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3E0803200F3B;
 Wed, 26 Jan 2022 03:58:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 26 Jan 2022 03:58:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=zcGjTrs9+KUSvx4oJdopWY2geAz49W
 tXdCgEQU6UKTY=; b=r5Pwg5m/iR2I6/C63Cm8LeOBxQy61r9j+IUN117OvHYmTw
 KkZytXVe20mGOA+8PlRml3bqCgTxGaHeXZmtFT/XKQTmHiUSx/43QL87srSeZDeW
 9gjJ/KQHmQti7pUly09xLhrcOn3C8shT4krKZJbfUw7LXqWUDnZHsd+lO0oNGBv6
 /Yt2SUKg75pBpHNB8/NzzfwaKNr9GkJsZwUlv1k7LFtXn4ffMzT4fed3bjoXIrvb
 i2M0vzrRstunzMyHtiloKhUT5puKpxb5nRH6YqO1OsyLi0IEkpY2W2zVjmna4lpM
 PQw08BpqQMtUMQN0LwCZH/IlWoG1VYsBP7HPzOPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zcGjTrs9+KUSvx4oJ
 dopWY2geAz49WtXdCgEQU6UKTY=; b=Ky0BXhoX1k+WIV4SlKrZpGxhQS1bfcfru
 PuN3fEgJ5PKJrLSWz34wHCjAzWVcWJG6IvvqhpnKz/jxUJF8f9JkrIi/AfObzUpT
 awsO2vYN3fFgY+i1i9x1F31BB+wlFjVopJ9NaGMDO/AzQeqq+jFYUKPAG6H2g6wY
 JIqZZPP6mAtGF8iwfJu/xa0zXta6vgmm0E3YOoRNXGYUmkcl5yR+2QrtShuDSF0h
 /VUfN5QPpZBNIQYroo3tHJZGYgmsLruAK6VZb9YzioIIeBfXTwZ4ZR/OXzuAj6rY
 2pjM1bQ2K1DC+2JGjIU2HRTcKf5eMPbgS8WLyucJUzPoqYh4vJWyQ==
X-ME-Sender: <xms:Kg3xYa6ZEp22mOMi7pfB0KopdzaSe2ApJMCfS0TItVTK9tEJx2Isog>
 <xme:Kg3xYT7fW29WGoEaXcS-e47TdzvXCRj8gJfs3_ax10mm9jlULnBcU405W7NagofkH
 Ah8wBz5GsiJay6ENO0>
X-ME-Received: <xmr:Kg3xYZcZOH2r1a20YCPxwfV2ArRsH4uzv6cznY0m7YxTWNtStr5X-uzc8Gx1sBEuu3x5zCfYaiwyADkSRAo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfedtgdduvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejuddvfeffgfdvjefhleevtdevgeejteelveeiueejleeuledtueeiieetjeev
 vdenucffohhmrghinhepghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Kg3xYXL794UjxrtAfqoe6v093Gu64tnleTD74axb31_i6YWQ4HG0Gw>
 <xmx:Kg3xYeI_2rtpLxDtIQfg5bs1e0Q7bhRckJ7lSDJAmhAmA_CWUaZ9gQ>
 <xmx:Kg3xYYzbkHIGAVsIs3In1nJZmQsY6ONf7H7GRM20Rc_6FVOinAuW1g>
 <xmx:Kg3xYTEFkgVeHSBGi9WSRzrZ5hU3SZYCvN1nEjmp_pc4v4JAPNCXgg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jan 2022 03:58:17 -0500 (EST)
Date: Wed, 26 Jan 2022 09:58:15 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v3 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YfENJ1pSWLf2pFa8@apples>
References: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="r0IdI1u1dcUwj68U"
Content-Disposition: inline
In-Reply-To: <20211221143246.2052050-1-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--r0IdI1u1dcUwj68U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 21 15:32, Lukasz Maniak wrote:
> This is the version of the patch series that we consider ready for
> staging. We do not intend to work on the v4 unless there are major
> issues.
>=20
> Changes since v2:
> - The documentation mentions that SR-IOV support is still an
>   experimental feature.
> - The default value activates properly when sriov_max_v{i,q}_per_vf =3D=
=3D 0.
> - Secondary Controller List (CNS 15h) handles the CDW10.CNTID field.
> - Virtual Function Number ("VFN") in Secondary Controller Entry is not
>   cleared to zero as the controller goes offline.
> - Removed no longer used helper pcie_sriov_vf_number_total.
> - Reset other than Controller Reset is necessary to activate (or
>   deactivate) flexible resources.
> - The v{i,q}rfap fields in Primary Controller Capabilities store the
>   currently active number of bound resources, not the number active
>   after reset.
> - Secondary controller cannot be set online unless the corresponding VF
>   is enabled (sriov_numvfs set to at least the secondary controller's VF
>   number)
>=20
> The list of opens and known gaps remains the same as for v2:
> https://lists.gnu.org/archive/html/qemu-block/2021-11/msg00423.html
>=20

hw/nvme parts look fine.

I expect some changes in response to Michaels comments before we
coordinate merging this?

--r0IdI1u1dcUwj68U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmHxDSQACgkQTeGvMW1P
DekvmAf6A2tFw44EPxbFNFBmOwuNP6muqQ1EAR8lT4Yt6C4ptj8hj2bP0w8XdRt2
LUgaw2EQU0mH2Q8Sgu7XCq9gcer7+W8m1ZvGmqEctuTfIdKIubX3qpp5EilzT1VY
t0Ybkbebl/xe7IuvcQ7ie6DtuS6sLwUzca0NAUcbQCG8OT0AYKKQHNMHw9F7ueEa
ct91NDfqhuIf4bSgZns18sm2jqx6rPAPCe2n4IMbXcsE+C9D/qO5lKszMj4MTmT1
gGFetMmiml4vjCDbDjfdF8PYYwBLZUHdCshvI7gSj/FxgbDvfllOOZRezCpHPl5+
GHAjn4Yzwvmor8dVfmmWbh3U7MrCrw==
=GY1U
-----END PGP SIGNATURE-----

--r0IdI1u1dcUwj68U--

