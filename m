Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40885086D6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:22:37 +0200 (CEST)
Received: from localhost ([::1]:50838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh8Ps-00005s-FF
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh7z3-0001Gg-8v; Wed, 20 Apr 2022 06:55:22 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:55173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh7z1-0001Vy-5M; Wed, 20 Apr 2022 06:54:52 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D0FA332020C9;
 Wed, 20 Apr 2022 06:54:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 20 Apr 2022 06:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650452087; x=1650538487; bh=NM
 0+lRdv18G1Mcrvpma/yNvhMP2EU/ZHWM9s8Y3QvCM=; b=Pv4B21bOOFR+tledBH
 O4PjDqhOEcfXgRAy5Vwq6JgTq/NMwyRkPq5WrIZ3NEyw2d7BgIlvgu3SkLFzqdZo
 xSKjo+z8pXeIqfjmgjP7BJJYtfVxmChPjFJgj7xafLQSAfshDGElWNKeKMxpht50
 mZz7RSXmH+sGAs3zpGBvi6Vaq2DJZTx0DZtlsa8LizwIUHdhM9xeKBle5U7jtZUB
 +QF7DK7wSNKwtPYbiKF34wmwHjcUpsGNVh2kQ+/siJAChwbO0uiga1Ie59W70ZSs
 rPP6X4uLSnZTE/kGVQ+Kz6Q7a8wS2ary21njJ7S641sdlg49Zn/WlZfFl1ak2j6o
 iVPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650452087; x=
 1650538487; bh=NM0+lRdv18G1Mcrvpma/yNvhMP2EU/ZHWM9s8Y3QvCM=; b=r
 8X0ePzaXk4NZ7zLKVSVKaN5bpeuD0EiHvV3PRaxOfF/Nkf579tzkQPztdVcDsQ3q
 RpwXkw9KGMtythiFrDibwbI3NT6wJ41SNNOlEzy//PBvMfi3xVKbsYOMVqoWK1mb
 WEty1L+VEhC5nJPLnbk5zMJfYYz0vDQoHZF6WWqmMnohNYJG8p6xd7mGfEptV+WC
 25G4G8ETb84loTm+6cFv5/Rrgmn4TqmwYVIUYo+myxCC/cY5CyVsvRXD/9ZIALST
 lo68pOe+1mVvKftJNdrQlWqnsUJEi46PddETB/+lJnvRYldyB0YDnvD2zCzJlrRy
 yOUhhLFLXWfZ2B/mpjZ1A==
X-ME-Sender: <xms:d-ZfYkB6QwUsuoSV3MQ_GUvq6lkOlE9we685j2YJldUWc3kvqeDQjQ>
 <xme:d-ZfYmiphljCAYPJU_BJpaBVrjPPvGweQZbKIEnuGh1TGSY-eWGsJlFptSBI9NwwT
 E4XFlo2NM0ZpNVI0ic>
X-ME-Received: <xmr:d-ZfYnnpyQDjacgZ6iWIMIcnBT1OZ04jryGZd0DQxH-9DojUXX0703b12xIisxH8ycYFwVokbP18aoBCnZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddtgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggfeule
 ehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:d-ZfYqyKKiz4txMzdYA88K8avv1HfITtodVyFw69F1yii_hnaxzJ5A>
 <xmx:d-ZfYpRXh0GXXF3x5bmEHY-3w4WJQSAkZZC9J2NC6d16aJPiBuqUpg>
 <xmx:d-ZfYlbepRTKpJ9Q7P9QS-AFc9FdHOvjK1Wl9oOl8sGR2-E3CTbo_g>
 <xmx:d-ZfYiK8B_RYbaWXpJOjAaOHC9H35ZAcQlBOAnr5BpBR6t5407XBhQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 06:54:45 -0400 (EDT)
Date: Wed, 20 Apr 2022 12:54:44 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <d.tihov@yadro.com>
Subject: Re: [PATCH] hw/nvme: add new command abort case
Message-ID: <Yl/mdOnDzOE6Fdza@apples>
References: <20220420082044.n6orslk2aukj2jai@localhost.localdomain>
 <Yl/csehng+W0gfQD@apples> <Yl/iRnvEj+tDycUI@apples>
 <20220420104126.iy5b4exyqh62m632@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9VGCuhRsMLrmCmlo"
Content-Disposition: inline
In-Reply-To: <20220420104126.iy5b4exyqh62m632@localhost.localdomain>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kbusch@kernel.org, ddtikhov@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9VGCuhRsMLrmCmlo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 20 13:41, Dmitry Tikhov wrote:
> On Wed, Apr 20, 2022 at 12:36:54, Klaus Jensen wrote:
> > On Apr 20 12:13, Klaus Jensen wrote:
> > > On Apr 20 11:20, Dmitry Tikhov wrote:
> > > > NVMe command set specification for end-to-end data protection forma=
tted
> > > > namespace states:
> > > >=20
> > > >     o If the Reference Tag Check bit of the PRCHK field is set to =
=E2=80=981=E2=80=99 and
> > > >       the namespace is formatted for Type 3 protection, then the
> > > >       controller:
> > > >           =E2=96=AA should not compare the protection Information R=
eference Tag
> > > >             field to the computed reference tag; and
> > > >           =E2=96=AA may ignore the ILBRT and EILBRT fields. If a co=
mmand is
> > > >             aborted as a result of the Reference Tag Check bit of t=
he
> > > >             PRCHK field being set to =E2=80=981=E2=80=99, then that=
 command should be
> > > >             aborted with a status code of Invalid Protection Inform=
ation,
> > > >             but may be aborted with a status code of Invalid Field =
in
> > > >             Command.
> > > >=20
> > > > Currently qemu compares reftag in the nvme_dif_prchk function whene=
ver
> > > > Reference Tag Check bit is set in the command. For type 3 namespaces
> > > > however, caller of nvme_dif_prchk - nvme_dif_check does not increme=
nt
> > > > reftag for each subsequent logical block. That way commands incorpo=
rating
> > > > more than one logical block for type 3 formatted namespaces with re=
ftag
> > > > check bit set, always fail with End-to-end Reference Tag Check Erro=
r.
> > > > Comply with spec by handling case of set Reference Tag Check
> > > > bit in the type 3 formatted namespace.
> > > >=20
> > >=20
> > > Note the "should" and "may" in your quote. What QEMU does right now is
> > > compliant with v1.4. That is, the reftag must NOT be incremented
> > > - it is the same for the first and all subsequent logical blocks.
> > >=20
> > > I'm a bit hesitant to follow v2.0 here, since we do not report v2.0
> > > compliance yet. I'm honestly also a bit perplexed as to how the NVMe =
TWG
> > > ended up considering this backwards compatible. As far as I can tell
> > > this breaks current hosts that do set the reference tag check bit,
> > > provides a valid ILBRT/EILBRT and expects it to succeed.
> >=20
> > Ok, so reading the spec more closely...
> >=20
> > The Invalid Protection Information should not be set just because the
> > reference tag check bit is set. It should be set *if* the controller
> > chooses to check it and it fails. However, in v2.0, the controller is
> > allowed to ignore it and not perform the check.
> >=20
> > So, just because the host sets the bit, that does not mean we fail the
> > command. However, a difference is that a v2.0 compliant controller
> > should return Invalid Protection Information or Invalid Field in Command
> > instead of End-to-end Reference Tag Check Error if the check fails.
>=20
> Can you please link the spec you are referring to?

NVM Command Set Specification v1.0b, Section 5.2.3. It is exactly what
you quoted above.

I think you are interpreting

  "If a command is aborted as a result of the Reference Tag Check bit of
  the PRCHK field being set to '1', ..."

as

   "If a command is aborted *because* the Reference Tag Check bit of the
   PRCHK field being set to '1', ...".

But that is not what it is saying. IMO, the only meaningful
interpretation is that "If the command is aborted *as a result of* the
check being done *because* the bit is set, *then* return an error".

Your interpretation would break existing hosts that set the bit.

--9VGCuhRsMLrmCmlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJf5nEACgkQTeGvMW1P
DekpqQgAu/NXjTEkkkkYPAv2NxMZm+nb7UjegMVyb+wMfDtNTOkgrZq7MJFX4lNv
+wydKaDBEYVYeJEZKflRob7ci+q2DDhdXXDST0H9JS8KotR9UXSZxeyNBIyThLSM
uu7hsfsz97Vq0iNpnr2rtJlFgL9DHgclrDNAOi/56xFAiaduh/aVuJnJHpKfMaaF
cO3al4zSIAuT6zICTTep+vQqrp+uC+s56E1rLs694hafuAL3wDb7aSGGKFmVxMLF
0oUF/Go6sxR0GIg1Ftw/1eYx9cK0gzsz8/I5XnuFFcSi/RUsVpMH7CWUGbwGB8rN
TguXLtRWzlkfeL40xHSUv8h/+4MLmA==
=jgqP
-----END PGP SIGNATURE-----

--9VGCuhRsMLrmCmlo--

