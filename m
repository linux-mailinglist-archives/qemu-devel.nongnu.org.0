Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF577538FC6
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 13:21:38 +0200 (CEST)
Received: from localhost ([::1]:57542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvzwP-0003vo-O0
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 07:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nvzol-000094-1T; Tue, 31 May 2022 07:13:44 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:53063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nvzoi-0001YN-Hk; Tue, 31 May 2022 07:13:42 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2E67E5C01BD;
 Tue, 31 May 2022 07:13:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 31 May 2022 07:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1653995619; x=1654082019; bh=43
 UNAH6EPPUREgT+APxDsSEn2E4sg9Gs3E1GAUh+DCQ=; b=Qlr9Hvj0DJK9hsnKDZ
 ZWZohVagn8eJLnammdz7MIDikjG9+veHcydFrbgX3OXywXrBNl7JzmcJT52LhU2q
 4RpBjLcntR1ynm7brp7H17BChV9Ks+m8Mc0hashjcSp1r+0j0KSkP0Q836DO4DFR
 R3vpa4kht8uwEInAhYkdAeugWtKHLrk4+3Ub6gX+lKkll8d6z6ELgeKz92651DNE
 /MuIAqiLijFJN2/Q9VnJxxChz1d85Co3lF4SJ/6hUFBGq2qhsuA/Oth9+DDZWBTB
 24Y8M0oY62yUIhYpXzTetm5m7K6ZlschQ6spAB8Pvwq4fUHB7nJ4qkDFUkeogwXs
 /s8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653995619; x=1654082019; bh=43UNAH6EPPUREgT+APxDsSEn2E4s
 g9Gs3E1GAUh+DCQ=; b=sCUYbj+R+mF+kRRnuuK4NZ+K11B6RDFoQUhPTKF2bEo0
 U4f4O5Eq2+lzWG0BqJrlmJdn2vHDP/Q3pJGmf1fCsvcQCIQMj6DFXBd/rW01F7Nc
 6Rq/YAAHdIXIGBfaW3AgwguSMAyqM8lOdSOBXL+lcsUxvmJP/wjgVgwpw2TB5tPK
 2cC7cnk+DnzCUwgwTGm+8xZOjc0u1s+R31OfTxBgU2JnEjUXbHQ0aVAIhlBRWTej
 RZU/UOivQWL9rCdr1N5GblLpTQTNuQ/GqKH0TI7Vk8lJAw0A808xJkJlFzO4WyaY
 Xo3PXUtVhBOVCF8CVFdSL9fhP89xLre3V5IQvr0x3A==
X-ME-Sender: <xms:YviVYni5Rg0Ikdc-C-n25elTXDWX7cVfh-guxf3i4jJFTYWACS7DOw>
 <xme:YviVYkDkVISbHFSxHCOlJ1KEGIdZel59e2msFttdybinlxrRnQMnoAOY_Iai9gvVx
 93gunwYyoX_SL96z7E>
X-ME-Received: <xmr:YviVYnEHl39jE_kQYSkaC2a_Egy1nS_ypyAieT_CBTdmnm8l_WSDQsOjKFKtbZa1inF7T7fM_kaC4E0Yyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeekgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjeejueeikefgueduffdufeellefhte
 fghfefhfdvteejjeefffduteduteeuhedtnecuffhomhgrihhnpeefugdrhihouhenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirh
 hrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:YviVYkQdDSPRgra7SFF4fAp1OLCdcOVSyQfUH5Q2TaiPLGH90QuS5w>
 <xmx:YviVYkxS1OMkVs9UcHbs9lMBq7UvmFdk4F0yqNMau1cdaDMAC9H7WQ>
 <xmx:YviVYq7uTQo9D7raC71O7l2k2tXPbQnD9LG-aBm3yLqkaZ7NeONDlA>
 <xmx:Y_iVYjpLwZ34DuH55SN-17fkT9N0KSObp6-Mqm4oew2jnGYADSQz7Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 May 2022 07:13:37 -0400 (EDT)
Date: Tue, 31 May 2022 13:13:35 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <d.tihov@yadro.com>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, qemu-block@nongnu.org,
 ddtikhov@gmail.com, linux@yadro.com
Subject: Re: [PATCH] hw/nvme: add new command abort case
Message-ID: <YpX4X2caQeC2G6SZ@apples>
References: <20220420082044.n6orslk2aukj2jai@localhost.localdomain>
 <Yl/csehng+W0gfQD@apples> <Yl/iRnvEj+tDycUI@apples>
 <20220420104126.iy5b4exyqh62m632@localhost.localdomain>
 <Yl/mdOnDzOE6Fdza@apples>
 <20220420123156.jnw4c3s66ikcl6df@localhost.localdomain>
 <YmABFkPP4Guj0F90@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5BXYX/K62XNOyABB"
Content-Disposition: inline
In-Reply-To: <YmABFkPP4Guj0F90@apples>
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


--5BXYX/K62XNOyABB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 20 14:48, Klaus Jensen wrote:
> On Apr 20 15:31, Dmitry Tikhov wrote:
> > On Wed, Apr 20, 2022 at 12:54:44, Klaus Jensen wrote:
> > >=20
> > > NVM Command Set Specification v1.0b, Section 5.2.3. It is exactly what
> > > you quoted above.
> > >=20
> > > I think you are interpreting
> > >=20
> > >   "If a command is aborted as a result of the Reference Tag Check bit=
 of
> > >   the PRCHK field being set to '1', ..."
> > >=20
> > > as
> > >=20
> > >    "If a command is aborted *because* the Reference Tag Check bit of =
the
> > >    PRCHK field being set to '1', ...".
> > Yeah, i was interpreting it exactly this way.
> >=20
> > >=20
> > > But that is not what it is saying. IMO, the only meaningful
> > > interpretation is that "If the command is aborted *as a result of* the
> > > check being done *because* the bit is set, *then* return an error".
> > Ok, but return error in this context still means to return either
> > Invalid Protection Information or Invalid Field in Command, isn't it?
> > Or why would it specify
> >     ...then that command should be aborted with a status code of Invalid
> > 	Protection Information, but may be aborted with a status code of
> > 	Invalid Field in Command
> > exactly this 2 status codes?
> >=20
> > >=20
> > > Your interpretation would break existing hosts that set the bit.
> >=20
> > I also opened NVM Express 1.4 "8.3.1.5 Control of Protection Information
> > Checking - PRCHK" and it says
> >     For Type 3 protection, if bit 0 of the PRCHK field is set to =E2=80=
=981=E2=80=99, then
> > 	the command should be aborted with status Invalid Protection
> > 	Information, but may be aborted with status Invalid Field in Command.
> > 	The controller may ignore the ILBRT and EILBRT fields when Type 3
> > 	protection is used because the computed reference tag remains
> > 	unchanged.
> > I think it marks clear intent to abort cmd with "Invalid Protection
> > Information" or "Invalid Field in Command" status codes exactly in case
> > reftag check bit is set. Also isn't "may ignore the ILBRT and EILBRT=20
> > fields" means not to compare reftag with ILBRT/EILBRT? If it is not=20
> > compared then reftag check error can't be returned.
>=20
> What the heck. This is a pretty major difference between v1.4 and v1.4b.
> v1.4b does not include that wording (but it *is* present in v1.3d). You
> are absolutely right that this conveys the intent to abort the command.
> Looks like this was lost in the changes in that section between v1.4 and
> v1.4b. This explains the wording in v2.0 - the spec people realized they
> screwed up and now they have to accept both behaviors.
>=20
> >=20
> > But anyways, spec says that "should" and "may" indicates flexibility of
> > choice and not mandatory behavior. So if you think that current behavior
> > is right i don't insist.
>=20
> I'm not so sure now. Another question for the spec people... I'll get
> back to you.

I got a long an exhaustive description of this issue from the spec
people, and it all boils down to, well, a mistake basically.

The bottom line is that both behaviors *are* acceptable as of now, but
this may change. Not sure how ;) However, I think this might be brough
up with the NVMe TWG, and I'll make sure to follow that discussion.

For now, I think we leave the behavior of *this* device as-is. It's not
that I think anyone really relies on this behavior, but better not to
break it as long as we report v1.4.

--5BXYX/K62XNOyABB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKV+F0ACgkQTeGvMW1P
Den1mQf8C8ifyI9xi174qRBgVpHW8GQhzAY8ZzcSNc/Z0jj0hxDtcv8t/nwh9oeT
gn0dTgqLSs8HPexZvXPpmCgvpeflpUU5xwfK9lX2xz0dfUSyQHmvrnxwgkEgVvaC
6Ce6nZ8e734kJFfhbHSLbfUuhYl+YsK6bVJ5/tR9O7Bot9d4e4NuTrDs7Pp7/UVv
kHGXs2yH3DrEwnh5AbdZkMJPSQjYo2TeJqpN2PAmuBC45/V0ypRecB3Ry0Of/7lg
VWQ0ntrto6MjauN+MGsUtWfR9UxRaIZlazzt+Ui7HXUCnrk4LWIRtrUb0Z9z5MV0
mGGyiLj6oRmrVHmUDWewCKjy6F7yuw==
=ZbVC
-----END PGP SIGNATURE-----

--5BXYX/K62XNOyABB--

