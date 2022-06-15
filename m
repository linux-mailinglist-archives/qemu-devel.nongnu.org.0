Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51E254C4E0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 11:40:48 +0200 (CEST)
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1PW2-0003LP-Pp
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 05:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o1PTS-0002Vl-1R
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:38:06 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o1PTQ-0001cn-Ds
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 05:38:05 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B446F5C0184;
 Wed, 15 Jun 2022 05:38:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 15 Jun 2022 05:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655285882; x=1655372282; bh=qb
 UQjXabEG4kopdmBha9b/tDuRJGzB+ALppQAq3mW2Y=; b=WopCXNiRH8KzR0MNVU
 90CE8i9URmpOerw1ju/Qt9ybIgnIDckgbjoCm+SJzkMdYYnu7pC02WulLvvtM8BI
 7eomAHCCoHw3L9EyNRRnGFhAMbYuSVVhx8WT7IsIzpU6h6ee8MJtEvqNwcu9ApjP
 1MCBp4x2Jy+rhmYUgGx7pxgdfekVmCjdnv+vpb0z4N6XESxiTYFU4xHzGnY8K4Jz
 mx3bIM8IZnDg0qe/k7CQH7Oo4ose3bxlgHK7GHXDjkJxPd7umpAmGi4epAdEIBk4
 QRmkvEbC5LChb0/uSUlmQjFdpiHKJMNA1ra7siIL+EXMxD4bvMMNELQEFOLT7fUx
 XoaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655285882; x=1655372282; bh=qbUQjXabEG4kopdmBha9b/tDuRJG
 zB+ALppQAq3mW2Y=; b=xBrRj3X2LYLku/8J3uUynx+klP3nHZDcD1s54QSTySXV
 I8HXwE7PP048ZX4NP2PMyg3gis6KxKp4juGdTzm/mX0JZntesWwzX+kTBG3YQXz6
 otDpR8QpGfinAt9ROfyY5tWHmzrwz46phjlmSmwXrhZ0dEoKc4Nw4WQRZIu0DNBc
 +st2vEICAhqpMy6ah/4VloGmfB2rLbpXEzwP7wflsmSimx9zRm72Ze/ZvpPTYBO9
 1Fg4Ut6HshLbYL9lenhvankSaw/xTZv8kxJOYrK1Y9sPFXktP5SkqiC+HCJMHq89
 Y0+lRS/j9ePbTVGMi4B/R2PfWpWw3ZawkZKSXHQugg==
X-ME-Sender: <xms:eqipYnfn3atkkLm2kkwXHB9ViUCEGhKIXLXavGTFLb5Hree3astYhQ>
 <xme:eqipYtOTGmcnH4Lryuizq_ce5ewHVRROe4h7U5TR-pASyX8LvdI3iRFFvIPcOvLqo
 bnY_KYbSnkfayf54oc>
X-ME-Received: <xmr:eqipYgjbBP9vXg0jYToTFGtppOmhXIfHTNz2TrspPwjLXObHiw0eG6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvuddgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:eqipYo_eHRJOalDfJp0oyZhEgtQgVRoT6AtXqNLar4IVdvAIjqfodg>
 <xmx:eqipYjsBxPbJ6fc0XbqyVIUYE-r61XUzMULnU1gLUijm8TpIGXRv2A>
 <xmx:eqipYnEk2vcdc4Oio3OAXVznqtAp8WYarwqfd24CzqHiluz-4iEFoA>
 <xmx:eqipYjJHvsg7y92pbBTzx1BjslLjxNlV-569nAzDF-TkEWUw0ELLLA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jun 2022 05:38:01 -0400 (EDT)
Date: Wed, 15 Jun 2022 11:38:00 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: Keith Busch <kbusch@kernel.org>, John Levon <levon@movementarian.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <YqmoeD+gwvLYQGv9@apples>
References: <20220608013659.472500-2-fanjinhao21s@ict.ac.cn>
 <YqEMwsclktptJvQI@apples>
 <YqIDyjxrZnkeMfcE@kbusch-mbp.dhcp.thefacebook.com>
 <YqIXIiQr+dpksBh6@movementarian.org> <YqItnbgtw7BNPBZH@apples>
 <D9A53959-6A31-4105-B0A9-37B8180D973C@ict.ac.cn>
 <Yqeo4EKtQJq8XRm+@kbusch-mbp.dhcp.thefacebook.com>
 <0CC03CA7-1BC5-4FDF-92BA-4256778AD113@ict.ac.cn>
 <YqisK8iYANhY/mCm@kbusch-mbp.dhcp.thefacebook.com>
 <A0E5C6FC-A020-4C0D-8DEA-04139F450455@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ms+Zr1HhovfiSnO8"
Content-Disposition: inline
In-Reply-To: <A0E5C6FC-A020-4C0D-8DEA-04139F450455@ict.ac.cn>
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


--ms+Zr1HhovfiSnO8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 15 11:58, Jinhao Fan wrote:
>=20
> > On Jun 14, 2022, at 11:41 PM, Keith Busch <kbusch@kernel.org> wrote:
> >=20
> > It's a pretty nasty hack, and definitely not in compliance with the spe=
c: the
> > db_addr is supposed to be read-only from the device side, though I do t=
hink
> > it's safe for this environment. Unless Klaus or anyone finds something =
I'm
> > missing, I feel this is an acceptable compromise to address this odd
> > discrepency.
>=20
> :) In my next patch I will check the performance numbers with this hack. =
Not
> sure if updating db_addr value from the host will have any performance=20
> implications but I guess it should be OK.
>=20

I prefer we use the NVMe terminology to minimize misunderstandings, so
"host" means the driver and "device" means the qemu side of things

> > By the way, I noticed that the patch never updates the cq's ei_addr val=
ue. Is
> > that on purpose?
>=20
> Klaus also raised a similar question in a prior comment. I think we need =
to figure
> this out before we move on to the v2 patch. I did this because the origin=
al Google
> extension patch did not update cq=E2=80=99s ei_addr. This seems to make s=
ense because
> the purpose of cq=E2=80=99s ei_addr is for the guest to notify the host a=
bout cq head
> changes when necessary. However, the host does not need this notification=
=20
> because we let the host proactively check for cq=E2=80=99s db_addr value =
when it wants
> to post a new cqe.
> This is also the only point where the host uses the cq=E2=80=99s
> db_addr. Therefore, it is OK to postpone the check for cq=E2=80=99s db_ad=
dr to this point,
> instead of getting timely but not useful notifications by updating cq=E2=
=80=99s ei_addr.
> This helps to reduce the number of MMIO=E2=80=99s on the cq=E2=80=99s doo=
rbell register.
>=20

True, it does reduce it, but it may leave CQEs "lingering" on the device
side (since the device has not been notified that the host has consumed
them).

> Klaus, Keith, do you think this design makes sense?

As I mentioned in my reply to John, I can see why this is a perfectly
reasonable optimization, we don't really care about the lingering CQEs
since we read the head anyway prior to posting completions. I jumped the
gun here in my eagerness to be "spec compliant" ;)

--ms+Zr1HhovfiSnO8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKpqHYACgkQTeGvMW1P
Del+jQgApV4kpoQlMALeR5F1x3NUsUx1i1Hmcz2R61YV7l5HCJsMEPfZlV+Ec3yp
dQ5OLUwocVHhGunVVqMwVPqDE+jUHaF/1xDhlcsk4LuJKufO1H8x7E/Sf2Zopo6d
DMXgWcbQr9Z9i33jf8mK3kHIJX0EDT6UjxFr3JzfKkYSgDXpCvRnCqDvwdJ2ybUE
KyUTpUHsc++tpCYa04r4ZBBqBKjla9XnwTEInN4hMUpUCZaGkcRA9XfppasoK/8Y
9AnI+qZrjFPEJEkj6oHjNzbqlxjTDt8zfnj+gyM9//Dpv7Me5YtHpYyq3JUYeGaW
qC278FkNIOzMALQXSl8xo6/PgPgZJg==
=/BGt
-----END PGP SIGNATURE-----

--ms+Zr1HhovfiSnO8--

