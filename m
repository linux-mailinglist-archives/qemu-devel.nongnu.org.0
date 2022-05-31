Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357A2538FF3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 13:40:48 +0200 (CEST)
Received: from localhost ([::1]:50660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0Ew-0002Xs-RI
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 07:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nw06R-00061E-Dh; Tue, 31 May 2022 07:31:59 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:44597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nw06O-0004k3-Vw; Tue, 31 May 2022 07:31:59 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 968C35C0113;
 Tue, 31 May 2022 07:31:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 31 May 2022 07:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1653996715; x=1654083115; bh=5r
 yN9xh+7cL7FzcLMzXUlE8F/AWyCpYYfYk+FJgaKdM=; b=A7JnFVQhOe8CVK3eXV
 1cbVN/tu7S9QlMwpTAVZ5KNZEGXe9vhhb1TZnEu+8AWqFTvrBrAFIchXL6YrC5rB
 +kC2UB3tf7HxGhgHMNJCzQRKXI+Cxx6q9cRvM9Z6U0LgLp3tONUccwUKZEUq+5DI
 KtCSKGgXamT7zONv/hY9lv9fdiHQZE7UnyHV34yQ01eSDFSly649PD1sC4vEy81E
 vb+0A+uP/7J5t3fk+1oDdgc68ThNC32RT1y9ea9YvY2J1+NfzaP/bzjt6ifWJH1I
 HYGuj3j/hfkj9PxswWFHtRIaJIOiO95obQjM9WgtHDKI9+7gr9/AFP+Fne0To3yQ
 R9kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653996715; x=1654083115; bh=5ryN9xh+7cL7FzcLMzXUlE8F/AWy
 CpYYfYk+FJgaKdM=; b=IFfTfZho+6if4dWd6UYnP90om3bQaapMRI6OW7TRnCAn
 4jPPq5FcL1OhcESWfk2d4nRCrbJPsFF4XiyZjWljWE/m0rVV5j+8PAWPEyEZ4Xhj
 0jShRM0F1B1Yclwsq6feD1GeQkA4q1gYjLeIFfMKHDkuWIlJv8NUgt9prQoJ6M9/
 0B94qQDu/lKk+pJvpB6Nk33/KTJT6F4OK5zuTVap3f8Ce1daJ7NX7Tuz0zV9TmcH
 OMzURTVFv3Y2b/Tg9tXtIhW9QSacpG8gAxzQO6+VkTofA6XXzDn1aWPqKgoRNn0Q
 tOQ5ydueGGqk3FYDjaKiJujCeE9r5gd3V3+2zga00Q==
X-ME-Sender: <xms:q_yVYkmC19XVn6ZbEfr_ps05IFZTmK1kuF3A6ucrMG3aZXEGvRvCvw>
 <xme:q_yVYj0rEl3axRTkx8Xj7AiPPuvM5EeXoCtWOINM2HXM4eNkwA08R519gs7wMSU4w
 hgf80wZY-Xka7t9VMo>
X-ME-Received: <xmr:q_yVYiqPMa2KORH6-u1UH0b-PziTg-X2w_PLBon1xNZq2oNowgC0BdDhbwzIevOt2_fwMF7pdvxxCshqfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeekgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjeejueeikefgueduffdufeellefhte
 fghfefhfdvteejjeefffduteduteeuhedtnecuffhomhgrihhnpeefugdrhihouhenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirh
 hrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:q_yVYgkdVfAYREHiPQBWyR2hXsgyenNSRU3T2ZVgyM4suo0I3Yq8vQ>
 <xmx:q_yVYi0345pX9EhslJ_EmrXxJK6T-q-FLEi06j4TaksFf9kJ-aDeiw>
 <xmx:q_yVYnuIs3qN7rdgWOc5-x2ZcgVM1be89hgN2U-ro_nCyV21irnsjw>
 <xmx:q_yVYu9PcXPhzWgyMqKOr6ijPcAjmf--9oMF436LVLTINpFyExPMVw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 May 2022 07:31:54 -0400 (EDT)
Date: Tue, 31 May 2022 13:31:52 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <d.tihov@yadro.com>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, qemu-block@nongnu.org,
 ddtikhov@gmail.com, linux@yadro.com
Subject: Re: [PATCH] hw/nvme: add new command abort case
Message-ID: <YpX8qCKyoxq2xi2t@apples>
References: <20220420082044.n6orslk2aukj2jai@localhost.localdomain>
 <Yl/csehng+W0gfQD@apples> <Yl/iRnvEj+tDycUI@apples>
 <20220420104126.iy5b4exyqh62m632@localhost.localdomain>
 <Yl/mdOnDzOE6Fdza@apples>
 <20220420123156.jnw4c3s66ikcl6df@localhost.localdomain>
 <YmABFkPP4Guj0F90@apples> <YpX4X2caQeC2G6SZ@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="43PWkM3IZgmd/tC2"
Content-Disposition: inline
In-Reply-To: <YpX4X2caQeC2G6SZ@apples>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--43PWkM3IZgmd/tC2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 31 13:13, Klaus Jensen wrote:
> On Apr 20 14:48, Klaus Jensen wrote:
> > On Apr 20 15:31, Dmitry Tikhov wrote:
> > > On Wed, Apr 20, 2022 at 12:54:44, Klaus Jensen wrote:
> > > >=20
> > > > NVM Command Set Specification v1.0b, Section 5.2.3. It is exactly w=
hat
> > > > you quoted above.
> > > >=20
> > > > I think you are interpreting
> > > >=20
> > > >   "If a command is aborted as a result of the Reference Tag Check b=
it of
> > > >   the PRCHK field being set to '1', ..."
> > > >=20
> > > > as
> > > >=20
> > > >    "If a command is aborted *because* the Reference Tag Check bit o=
f the
> > > >    PRCHK field being set to '1', ...".
> > > Yeah, i was interpreting it exactly this way.
> > >=20
> > > >=20
> > > > But that is not what it is saying. IMO, the only meaningful
> > > > interpretation is that "If the command is aborted *as a result of* =
the
> > > > check being done *because* the bit is set, *then* return an error".
> > > Ok, but return error in this context still means to return either
> > > Invalid Protection Information or Invalid Field in Command, isn't it?
> > > Or why would it specify
> > >     ...then that command should be aborted with a status code of Inva=
lid
> > > 	Protection Information, but may be aborted with a status code of
> > > 	Invalid Field in Command
> > > exactly this 2 status codes?
> > >=20
> > > >=20
> > > > Your interpretation would break existing hosts that set the bit.
> > >=20
> > > I also opened NVM Express 1.4 "8.3.1.5 Control of Protection Informat=
ion
> > > Checking - PRCHK" and it says
> > >     For Type 3 protection, if bit 0 of the PRCHK field is set to =E2=
=80=981=E2=80=99, then
> > > 	the command should be aborted with status Invalid Protection
> > > 	Information, but may be aborted with status Invalid Field in Command.
> > > 	The controller may ignore the ILBRT and EILBRT fields when Type 3
> > > 	protection is used because the computed reference tag remains
> > > 	unchanged.
> > > I think it marks clear intent to abort cmd with "Invalid Protection
> > > Information" or "Invalid Field in Command" status codes exactly in ca=
se
> > > reftag check bit is set. Also isn't "may ignore the ILBRT and EILBRT=
=20
> > > fields" means not to compare reftag with ILBRT/EILBRT? If it is not=
=20
> > > compared then reftag check error can't be returned.
> >=20
> > What the heck. This is a pretty major difference between v1.4 and v1.4b.
> > v1.4b does not include that wording (but it *is* present in v1.3d). You
> > are absolutely right that this conveys the intent to abort the command.
> > Looks like this was lost in the changes in that section between v1.4 and
> > v1.4b. This explains the wording in v2.0 - the spec people realized they
> > screwed up and now they have to accept both behaviors.
> >=20
> > >=20
> > > But anyways, spec says that "should" and "may" indicates flexibility =
of
> > > choice and not mandatory behavior. So if you think that current behav=
ior
> > > is right i don't insist.
> >=20
> > I'm not so sure now. Another question for the spec people... I'll get
> > back to you.
>=20
> I got a long an exhaustive description of this issue from the spec
> people, and it all boils down to, well, a mistake basically.
>=20
> The bottom line is that both behaviors *are* acceptable as of now, but
> this may change. Not sure how ;) However, I think this might be brough
> up with the NVMe TWG, and I'll make sure to follow that discussion.
>=20
> For now, I think we leave the behavior of *this* device as-is. It's not
> that I think anyone really relies on this behavior, but better not to
> break it as long as we report v1.4.

Sigh. I just got a correction on that email and the intention *is* to
remove this. So, I'll queue this up so QEMU can be a front-runner for
compliance ;)

Sorry for the noise.

Thanks, applied to nvme-next!

--43PWkM3IZgmd/tC2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKV/KYACgkQTeGvMW1P
Del4FwgAvmrmV61/6hGasMKswSHJll/gqfhZnCXdnfShlxheYxcZtQJDCBgoIZcR
8mRzl3oAn+qOtDiQDyyM+CbIkHwlmF8jlznrmP6+8vSkPfJhyRROSk9N6nS8PgP3
f7aUkal4DUk2ODe1+11B53YGkp/slywH9aXbPNqAkw2MhST92PiVoe0RzMWwlO8S
iupsYKV+e6BxhksUCpZEMk6DBx+sp3nBuP7/ZQUw/jbtdOBXmG71QZv5eLQt7aVu
nsxhb1I9tyji4cE2I+P9hwVmlVXiZblj9RxIQUs+QyTvU6CYtWDE0NKi4WDF4AIa
AWOXA+4jHX9/ZVQ9MeAZ1RnN+/GiPg==
=jJT2
-----END PGP SIGNATURE-----

--43PWkM3IZgmd/tC2--

