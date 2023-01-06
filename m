Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E2565FEF4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 11:29:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDjy7-0006gX-Ah; Fri, 06 Jan 2023 05:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pDjy0-0006g8-3W; Fri, 06 Jan 2023 05:28:52 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pDjxx-0002eT-Ep; Fri, 06 Jan 2023 05:28:51 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 05C1B3200AB5;
 Fri,  6 Jan 2023 05:28:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 06 Jan 2023 05:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673000923; x=1673087323; bh=D7
 Igv/nVuQVkDUEUqUHrUfaWztKiZl8NVstQFvdFfF8=; b=aqYj8OJbwhkrhsHsmr
 /c3DhKWc2I5gh8Uj0wx4/xsxI6M6s+qzr1wDpnb0DGyCRLvIDMJgGSr/0w4OCxAa
 asfpbXKGvXrmOBFuO2Sy4oSHs+ownjykEZ/eMbwMrrc/Sx6texeG9lxiCW8sGqj6
 cSYn3pK2zfAYjI/mq+/JriBqwlDz/PMGKeu1HygDSXt3s3jrVfG4q+spEwvAkKGU
 LZcIKJp6wYRrv3AhThHa7sxZ/HvlxPajbbVra2mPGQMdTfykL7vwkY7+S+H7wB0h
 uC3OD3XdY1k2TnCqvKqjyXYKNRBD5eRoH4V52G2osmRZEZHzHGhekcyomDSqpoRW
 hDRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1673000923; x=1673087323; bh=D7Igv/nVuQVkDUEUqUHrUfaWztKi
 Zl8NVstQFvdFfF8=; b=FYYTihx8E4yuhOPrpG9lY+sRXFx0fXu19awcHxxiQtmP
 nKmWP1qg51fH0YnYG9ndRSa8a6kfhmgoIy95AUAvoxsmLq+jb5H87LqsYOxWtaHe
 Y0zS8i5BXfPIaHYa8tIJmvtm4FicPNWHKekOlu6WuWOfNSCVDCZ8g17Ya7eSTjWm
 FdIDF1vjcsj0mjgrafKLKULA7PQ1yJcUF3QkTgowFPsbvy+CryYcMlKPmCy5p/z2
 K/IClLIu36GPMNeFlMTPYMCp+kwQKBwj43uuS3YPD0an2HOTuRr+DDdmeEuYmfx2
 OVrC+NLSUfpURU+ueyOpJLxqjjdlSkXlnN/Og2aRkA==
X-ME-Sender: <xms:2fe3Y2yXhz1tqEpNSDcUE9SdIz_9CUq6ijeXH2OsJNnNn-dvJgIEgQ>
 <xme:2fe3YySdTIyM946q99E9KxfW_Nm0O0opfZIDhxL0XqNojG8ciLrI-YuCAS4u-w5wM
 cI1xXNAwv_VagQ8IY4>
X-ME-Received: <xmr:2fe3Y4WYXZ6uJBvdMJr8CjDfnXfGtgD75AT6QFBm-dEoEMVTCtFQHcz2VaV8Ij7VstU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkedtgdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeffuddvhfehjedugfeijeeuieelgeevuddvlefhkefhgfettefftddvkeevieel
 feenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:2fe3Y8jaYLriHVTgFfhX735nuJN_3LxuAUKufCgLYp1HCI0N0GUWDQ>
 <xmx:2fe3Y4CbcLxE_kPxXLG_vH4rpjELqO0yQyQ0SVvpB9vtmTVqutJxgA>
 <xmx:2fe3Y9LRjULvVl5VPc7ov3MOHgEatxNriAj2OmdWZq6sv3f5dWxUFA>
 <xmx:2_e3Y37Ro_PIDAB3AF2cD5vI8zrGOB5KjxjHCCSrVevb32OQ7DtiRg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jan 2023 05:28:38 -0500 (EST)
Date: Fri, 6 Jan 2023 11:28:36 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Guenter Roeck <linux@roeck-us.net>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v4 0/4] hw/nvme: fix broken shadow doorbells on some
 platforms
Message-ID: <Y7f31NcnniHHoLq7@cormorant.local>
References: <20221212114409.34972-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0rv5l1XYdPpu7f0T"
Content-Disposition: inline
In-Reply-To: <20221212114409.34972-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--0rv5l1XYdPpu7f0T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 12 12:44, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Guenter reports that hw/nvme is broken on riscv64[1] and big endian
> platforms[2].
>=20
> This is a regression since 7.1, so this does not warrent an rc5 for 7.2.
> I'm sure Guenter can carry this patch in his tree, and maybe we can get
> this out in a stable release.
>=20
> On riscv, the issue is a missing cq eventidx update. I really wonder why
> this issue only shows up on riscv64. We have not observed this on other
> platforms (yet).
>=20
> Further, Guenter also reported problems on big-endian platforms. The
> issue here is missing endian conversions which patch 3 addresses. This
> also requires a fix for the Linux kernel that I am posting separately
> (can't link to it, chicken and egg problem).
>=20
>   [1]: https://lore.kernel.org/qemu-devel/20221207174918.GA1151796@roeck-=
us.net/
>   [2]: https://lore.kernel.org/qemu-devel/20221209110022.GA3396194@roeck-=
us.net/
>=20
> v4:
>  - screwed up the rebase (Philippe)
>=20
> v3:
>  - add patch to fix big-endian platforms
>=20
> v2:
>  - use QOM accessor (Philippe)
>  - added some cleanup patches in front
>=20
> Klaus Jensen (4):
>   hw/nvme: use QOM accessors
>   hw/nvme: rename shadow doorbell related trace events
>   hw/nvme: fix missing endian conversions for doorbell buffers
>   hw/nvme: fix missing cq eventidx update
>=20
>  hw/nvme/ctrl.c       | 121 ++++++++++++++++++++++++++-----------------
>  hw/nvme/trace-events |   8 +--
>  2 files changed, 78 insertions(+), 51 deletions(-)
>=20
> --=20
> 2.38.1
>=20

Applied to nvme-next. Thansk for the reviews!

--0rv5l1XYdPpu7f0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmO399QACgkQTeGvMW1P
Del7YAgAqukfVVTn/kUpOPrZKBuE6lSzxWCDTD9wWJCyARWzPQiV6rIlFAjMuqXc
gKD1XFkOfbjvRC9pS/4Tkzo0LEexyeghLPTNUf0eqykphMnh2Y50ijeIVq6B+qoM
FEzTiQiZL4lQms+Vr/jsWCc1+PoezantO49ZZbNqypInF25hCl40FXp5csPZmDtb
nFQFKI/roOxGMX9pvrXX8xwT+ywHQyZkZshSbHU13abTmDxU0Uitb02GrRI8CfOY
QkrbI8YyX2tisLDZwteLuUX7WzbXcZyLIt+tSkjrQpURk33PaR+rM6fB3UoCmlAN
NoU2mzk33pE+fbJ/5Hk0TAVjHjQPww==
=6GYq
-----END PGP SIGNATURE-----

--0rv5l1XYdPpu7f0T--

