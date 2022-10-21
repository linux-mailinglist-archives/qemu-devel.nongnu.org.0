Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BF160700E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 08:28:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollWD-0003du-Rk
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:28:33 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oll2L-0000yz-7V
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 01:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oll29-0000y0-Dv
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 01:57:29 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oll27-0006y4-EI
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 01:57:29 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 187105C00AE;
 Fri, 21 Oct 2022 01:57:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 21 Oct 2022 01:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1666331845; x=1666418245; bh=62
 3LHy4n6UT3NbGjmMwf1wm0a59dAvMQaaIAlkRtRSo=; b=NoNivlJvTHgxVLWfhZ
 qLvoy7UCubDKIzCpsqt7uYKPzaNjjxIyXH6PauAugJfKRmAC3RxvVV0WLhsF4U7C
 l8En0cInfnDnZKxR7Oa3nXVhuEQkR6vkl1tu3ZBpkE97fDUEeH0VWW6GMaLLygub
 IhpGi1TwxN1MAtc/gs37UyV+Mlmdt6toG+oDS0REWaaGBhbSORNhutIMynEXRjWn
 Kv3HEQ/nbPauf2FqV+oPcq+XY9+TqXON1Gih81599fOWDrX6NZMfvRy80JYkPsrv
 BsFRvGUxe/e5UbriBCmtQu5rhZvjkqa7LYh+io779sgAd46DblO04TKblZ1snTx6
 6fag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666331845; x=1666418245; bh=623LHy4n6UT3NbGjmMwf1wm0a59d
 AvMQaaIAlkRtRSo=; b=snJAQQbTPt8xfTs2MfzrI4bdUKfkF+6khgBM2oNZYd0o
 ucNVv8+goNtVkdauOF5sjw4q26gC2jWZdegxBj10XHTrgXu07U3lNE8iCqqeaRjl
 yQe+OGKg3pFa2MLNNzMMe3f3TJKlEq4tp5Zrsy03x08DCA5udaz00HlHxnQeVfXG
 4efm2voX/CtaRAKPtGp/7dwe/OJWiHqhHm2GDw4c71/4tKDWlBT/n3ISBepcfOQV
 M8QS761N8jm+DbIUbaaUbHiReRV8GQzH+3CFv9Xkg0r4pDSWKVIHf0S3+svWIONW
 yfjLvwmJQqAR195Mx40BlMs0vMPBjnjDr5WJyRs2QA==
X-ME-Sender: <xms:xDRSYynIILnbk0ZcZ8s0SUBEKrYZlbXih_eu8XATbOFMnbdKCJs3sw>
 <xme:xDRSY50rjKJY84vc9TVQtPjGP3ggQjTJ6p5OmFatD4znDdh27NgPIQML1JeQQ5VFy
 KdiKZnHodCOhxlqH2g>
X-ME-Received: <xmr:xDRSYwr4-XYctqAq7VJMZ53zf_cNdR1SOzPZj7PeW3EPTgJiNSTPD5zUuSu_PYuaKBG_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeljedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:xDRSY2kEY9etQe0BB4EkyPFKkmgivgCNTGBXQcDK3R2js7m3d5tONw>
 <xmx:xDRSYw37LgaL8Ssu98aNMhR0OYX6ZYJFLNRLTzSk6EigYffXx9IQJA>
 <xmx:xDRSY9sucQ7SnY6o5JZpiJHKfNUxitXUUUMf1Kk71970GHiCT33CwQ>
 <xmx:xTRSY0-ZGJYVbDD7FPNXNKMxyOy_O5YjWgKyfu8R-HabwWpa0vOQeg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 01:57:23 -0400 (EDT)
Date: Fri, 21 Oct 2022 07:57:21 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: clay.mayers@kioxia.com
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Fam Zheng <fam@euphon.net>,
 Phlippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH 0/4] hw/block/nvme: Implement ZNS finish-zone ZDC AEN
Message-ID: <Y1I0wfC4FRbFdhFA@cormorant.local>
References: <20221021001835.942642-1-clay.mayers@kioxia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XjgKJLKWhFzvYWwv"
Content-Disposition: inline
In-Reply-To: <20221021001835.942642-1-clay.mayers@kioxia.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--XjgKJLKWhFzvYWwv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Okt 20 17:18, clay.mayers@kioxia.com wrote:
> From: Clay Mayers <clay.mayers@kioxia.com>
>=20
> ZNS controllers have the option to limit the time a zone can remain in
> the active state.  It begins with a background process in the controller
> setting the finish-zone-recommended FZR attribute for a zone.  As part of
> setting this attribute, the zone's id is added to the namespace's
> zone-descriptor-changed (ZDC) log page. If enabled, items added to the
> ZDC log page generate a ZDC "asynchronous event notification" AEN. Option=
ally,
> the control can induce a "zone excursion" forcing the zone into the finis=
hed
> state that also generates a ZDC event.
>=20
> Zone enabled applications need to properly handle ZDC events. In a real d=
evice,
> the timeout is many hours making testing an application difficult.
> Implemented is the generation of FZR ZDC events to speed up O/S and appli=
cation
> testing.
>=20
> Added to the zoned NVMe command set is an optional, per-namespace timer
> (zoned.finish_time) to set the FZR attr for long-lived active zones; A per
> namespace ZDC log page; AEN results to including CQE.DW1 (the NSID of the=
 ZDC
> AEN) and generating a ZDC AEN if it's been enabled. Zone excursions are n=
ot
> modeled.
>=20
> See section 5.5 of the NVMe Zoned Namespace Command Set Specification v1.1
> for more details.
>=20
> Clay Mayers (4):
>   hw/block/nvme: add ZONE_FINISH_RECOMMENDED functionality
>   hw/block/nvme: add zone descriptor changed log page
>   hw/block/nvme: supply dw1 for aen result
>   hw/block/nvme: add zone descriptor changed AEN
>=20
>  docs/system/devices/nvme.rst |   5 ++
>  hw/nvme/ctrl.c               | 166 +++++++++++++++++++++++++++++++++--
>  hw/nvme/ns.c                 |  15 ++++
>  hw/nvme/nvme.h               |  37 +++++++-
>  hw/nvme/trace-events         |   3 +-
>  include/block/nvme.h         |  14 ++-
>  6 files changed, 225 insertions(+), 15 deletions(-)
>=20
> --=20
> 2.27.0
>=20


Hi Clay,

Thanks! Very nicely done, I have only a few comments on the individual
patches.

Adding Dmitry on CC.

--XjgKJLKWhFzvYWwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNSNMAACgkQTeGvMW1P
DeltBwf+IGWiDyRL8NT9JFaHoSzr7BZUfSjgccDIvDvLNTknxM8jinP89Wu2ZNm5
1+nkltkyEmM69CAmEX4MJ/ai5zmcC1A7oav8Gs5rGyllWv+F2hh0yHYuZ8f+oqje
w8WSM9vS7tSrVCNVgYLx4DRwg3uOlGAGbFBHTEFnG6upz5LRPWfrzcGRcZun+HXV
fjPFJtX5YztWcEPlGtPeBhYzoJIFGfChOE4t6V8oIWhu1BLjZChTBCURKgUhzB/M
Nv+tdGCxq5j1p8u0zAcbxRxb6IgiJWYwFjqWogcArB6i48esaUvVe80JdtNejzMx
+Zsb/YPLww6pxWCK7jvnTF9kXejC0w==
=Q2x/
-----END PGP SIGNATURE-----

--XjgKJLKWhFzvYWwv--

