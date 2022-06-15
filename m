Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28054C45C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 11:10:57 +0200 (CEST)
Received: from localhost ([::1]:44208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1P3A-0007Yj-I9
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 05:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o1Ok6-0003t0-5B; Wed, 15 Jun 2022 04:51:14 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o1Ok4-0001no-95; Wed, 15 Jun 2022 04:51:13 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B2F65C0130;
 Wed, 15 Jun 2022 04:51:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 15 Jun 2022 04:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655283069; x=1655369469; bh=yD
 WpJWQ5LxQaXucC4V0FUbyyOwtTT2uoCHi0vJWsFhw=; b=aeEAeWBwKl/iVnWk4O
 wRQpjxHvSa4Aj7XmSJ06LeFHSWWR34UCVum7Wrqh4fQd2mK0BC2RUI9mFcv2lqgL
 1+9t7OfEjuwY3Y/vPgVhs3kdPlEXSkDYZUFL90/lJD5jmr5EKz8FYBe00W7jCfw2
 gkjKAbmtbQ3/N6Zl/EXhQrWnwVC+4OUtFzChPxlKUtTRnpqbZ+N1kvS8rJFpJ/tz
 lb3QgK6ZlzJr2KVF2fhAFbyER5nt/e7fIVxQjyZZqgwN5ygosQ52TQiWxRfgifa8
 0jS344lkkEvFSgrhYH+ece4GyDyP8Zn20Zb2ZH2TBclG0TdlEOgmLj4Ql7ZcaV5S
 6Cbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655283069; x=1655369469; bh=yDWpJWQ5LxQaXucC4V0FUbyyOwtT
 T2uoCHi0vJWsFhw=; b=NxgbV4jM/Y1m8OiWvc7fUoDQAKOtJyy/Ei2OPTWbYzZ/
 /983R1nihWAOEJkTE+2x3juf6NE65qEXKnBWbmWak6ceGXfc9u5/KFM3Sb4umOIF
 jgKRKWZrk0hKkWIdESMxDRbe2wXLNhkJhxSltCdcWBDSAXw7PP0fWWX8Arutkufq
 llfyWWeQ6XZh7krCMvHBtPGMe4yDQFoib0NJM525Or9EI2uMBjwkAi13x/E/elt/
 pBgX8pUjoOO8tQG45AJWpIf2AZs2rGQFymHpWgYgg0Gttasfoic7xV6/TrXqEJ+W
 i/QEuBS2E19OVYhXh4P3UiODAbP9rnQrw7ri3CwQhA==
X-ME-Sender: <xms:fJ2pYqKktgq_y6M218GumgvpECIm-Nky3k2-nAxcGchmHaFI8iC3Rg>
 <xme:fJ2pYiLB-zARpylz45YJ77nOsK0jBUOv2HIqcVYDB5JdB1RDftjxUvmHr6W-e55RR
 gkRMhvWkO2pNSiuVPk>
X-ME-Received: <xmr:fJ2pYqsfbokmKRLTKNnHtH1EXOybgtg7jshNcjQBnw7_nY4up--iYy8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvuddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:fJ2pYvaJ3jTY9aA7mVSVhnjbOavlJzCHcU3tqJkGfqkjzquBo-jV0Q>
 <xmx:fJ2pYhaGvzENBjPlap01K7dzxrXWJHiScsDdGh1wHpMCeWyKDfeeIw>
 <xmx:fJ2pYrB3MnLX1YLTxdpvGbarZ6bm2W_jRyIYkVzeNFYfZxQshRitWQ>
 <xmx:fZ2pYuTJC7NdZg5t5z2qUm75fYJxpBya1LE48WOJ6gncMI9oKLu2aA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 04:51:07 -0400 (EDT)
Date: Wed, 15 Jun 2022 10:51:05 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu,
 mjt@tls.msk.ru, danielhb413@gmail.com, clg@kaod.org, mst@redhat.com,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH 0/2] Two sets of trivials
Message-ID: <YqmdeUCc+9dtVeV7@apples>
References: <20220614104045.85728-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dgdY8oKLskTV074e"
Content-Disposition: inline
In-Reply-To: <20220614104045.85728-1-dgilbert@redhat.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dgdY8oKLskTV074e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 14 11:40, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> I've sent the 3 char set last month, but have updated
> it a little; I cleaned up a comment style that was already
> broken so checkpatch is happy.
>=20
> The 'namesapce' is a new patch; it's amazing how many places
> make the same typo!
>=20
> Dave
>=20
> Dr. David Alan Gilbert (2):
>   Trivial: 3 char repeat typos
>   trivial typos: namesapce
>=20
>  hw/9pfs/9p-xattr-user.c          | 8 ++++----
>  hw/acpi/nvdimm.c                 | 2 +-
>  hw/intc/openpic.c                | 2 +-
>  hw/net/imx_fec.c                 | 2 +-
>  hw/nvme/ctrl.c                   | 2 +-
>  hw/pci/pcie_aer.c                | 2 +-
>  hw/pci/shpc.c                    | 3 ++-
>  hw/ppc/spapr_caps.c              | 2 +-
>  hw/scsi/spapr_vscsi.c            | 2 +-
>  qapi/net.json                    | 2 +-
>  tools/virtiofsd/passthrough_ll.c | 2 +-
>  ui/input.c                       | 2 +-
>  12 files changed, 16 insertions(+), 15 deletions(-)
>=20
> --=20
> 2.36.1
>=20

Nice (and Thanks)!

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--dgdY8oKLskTV074e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKpnXgACgkQTeGvMW1P
Dekm2QgAvCvoFg4Oc3K6RCxEjBHA51yDw/MgoHEZbcJT7QyWlOGyMnwzQvF8PLiz
liv/i+rt2KVvymqjTVYEFK2PmPi8OWEH4VaogKbC790hlpmYbLI6fxWkCufbYFcL
JZXzNslcQ1otFmHVjeonzqMdQo7pj+jTN/6mM7sNfA5qltXHesHNq8iszpkVNIJX
PztHuLBQTv6FMUU5U6VrXb+kKIWzuVG0deAC+HK4a1vT4fZUHgF/JlX93eAPmys4
g+U3JB8zLnmUBY7ms9neuNQMVvbklgG/Y75aXh35Hl7s4DgIjX9ohQ3g1klRMX9m
LBitp089lt4U8j24LtFbtbkklXHe3g==
=GwDD
-----END PGP SIGNATURE-----

--dgdY8oKLskTV074e--

