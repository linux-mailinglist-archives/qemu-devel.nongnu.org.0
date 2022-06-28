Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC755C0FD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:35:29 +0200 (CEST)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6ARD-0005Fu-LC
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o6ANS-0003as-48; Tue, 28 Jun 2022 08:31:34 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:40393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o6ANO-0007w9-Va; Tue, 28 Jun 2022 08:31:33 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8ED195C00CD;
 Tue, 28 Jun 2022 08:31:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 28 Jun 2022 08:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656419489; x=1656505889; bh=2n
 DlQB6DLhtiy0brXwnjHZIo2oT6t6ue1R0vredYp2Y=; b=Eh0iodubCqfdXX+g+H
 4YMpl6zeEiRJgOP6/BFGYqJSKarQHaNWH38OH05xjFSl6ykssfpwXFfl/K8WL+VA
 MVhTqRChhqDVKyzaVtVtVq3fK9ibnglOHvu10r2DYPyyLvbd8hSFGqJ2/5pD5PZO
 nb3NYIzOGc4ab5wrhRQN3R7XSddtRJgWbLSrDW/vORnOOpDx8Y5gWbn3gk6sC7HO
 cAPzlzO6f94LqM178bIlDH2rJvAyv8+wP1XYMm6h8SUfRb9+6JwE7JYQyW5p+yuM
 iNlX/fLXLu0hQFQlxehZHSrVrn0jiNXOmsOGivjN/SXI7AP4MARGni5/2sy8X82g
 8T6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1656419489; x=1656505889; bh=2nDlQB6DLhtiy0brXwnjHZIo2oT6
 t6ue1R0vredYp2Y=; b=GY7H/+bsbQqOPkzaLnsL72H8pC5V0QEqeyub5tGIkesm
 xcAitZbIpC7lFdd0kLuQTDLAQFmedf3jCjjIlmJJG9IGq2Is6/fCdZ4j+x7GPsAb
 /h0UZdPux5+xZo+y9kgI6MAcfsEmEYk6js2kHlB/36PVwU4ewo/b82QUMUOYv41k
 8KhN0JJT2jH+sUxFChWsLdLnqc9HHYF84Wpq/sqj0PDjhmdb2aFv6rEiNjeiCS06
 lFDC2v630GPkHOlQG0kyY4ZtY9Ya8gwMK/CFWIWQMcDcOlqjUrxGg8dmB6uUt143
 4THThxnOrCQroWcerudhF7zPN78eZIGOPG1c2jYUFg==
X-ME-Sender: <xms:ofS6YgTRdLatQrCzd7K7Fa7XwzNeh_GI_OZa2TptEIXEExxNa8Cbhg>
 <xme:ofS6YtyyLBP2kCWMOd98RBR2EV6LrrEYDr3pzPezU9fIXEL3K7Ziq0vmtvLJtWPj2
 yLrfp0NSNGiTIQqNjo>
X-ME-Received: <xmr:ofS6Yt0n6vT78Zn--lfgmmVloSWIfpKA_qJk7cRgzVO-mzf5khJ_RZHnvtNNampqAAkEwm2kt9QkoS6TJkk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegjedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ofS6YkDzIlJTl7jHXYEDvUDLApHrfS23n4viKguKWWQQEZwQq2Sg_w>
 <xmx:ofS6YpjWsFrw4tj3CCb5EDB0zdv1-dy_BIzp19BPShXxzZnCqbY0Rw>
 <xmx:ofS6YgqLHqMU352isIOIXuFUmLU8sdIwqzdLuEppg7lpGyDkROdKEw>
 <xmx:ofS6YpegjwnQXF0VtJunMPqcIWX5wRnxJ4aF5Rr-zTh8wA88ZPFwhA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jun 2022 08:31:27 -0400 (EDT)
Date: Tue, 28 Jun 2022 14:31:26 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, kbusch@kernel.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/nvme: fix example serial in documentation
Message-ID: <Yrr0nrBdh6Qz4c/E@apples>
References: <20220627123957.363889-1-niklas.cassel@wdc.com>
 <YrrzcdBRJ2pe2bcb@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lwf/9RTJRwQDAdk9"
Content-Disposition: inline
In-Reply-To: <YrrzcdBRJ2pe2bcb@redhat.com>
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


--lwf/9RTJRwQDAdk9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 28 13:26, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Jun 27, 2022 at 02:39:57PM +0200, Niklas Cassel via wrote:
> > The serial prop on the controller is actually describing the nvme
> > subsystem serial, which has to be identical for all controllers within
> > the same nvme subsystem.
>=20
> Given this description...
>=20
> > =20
> >     -device nvme-subsys,id=3Dnvme-subsys-0,nqn=3Dsubsys0
>=20
> ...I'm wondering why 'serial' isn't a property of this device..
>=20
> > -   -device nvme,serial=3Da,subsys=3Dnvme-subsys-0
> > -   -device nvme,serial=3Db,subsys=3Dnvme-subsys-0
> > +   -device nvme,serial=3Ddeadbeef,subsys=3Dnvme-subsys-0
> > +   -device nvme,serial=3Ddeadbeef,subsys=3Dnvme-subsys-0
>=20
> ..rather than requiring it to be redundantly set to the same value here ?
>=20

-device nvme can be used without a subsystem device, and in that case
the serial must be set. However, you are right that we could not require
it if set on the subsystem device.

--lwf/9RTJRwQDAdk9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmK69JwACgkQTeGvMW1P
DenvFAgAivUIaU4bLdUEkcXgvXkCXUoaVQrOMbd/h9J+wCiD4P3xFFVVU2dORdbe
4WvGmec/+S85kuc+jI9/6/pjsZEQ9pZML5s9VKYdHc/EGVpFOE1ncSDwDHXUgK8p
PN1yS/roVGDn9D8NkSLqfINrNUnNxZkcduq6eTH4PwJEiONyYxklmprMmcHRPoPI
gTYO3sQgx2NcugqP55VGTsQkoH5jNI60XcQslqIAnX0Kz04jwivd49x3X075lrba
zLpHT49PwvRpWDsfO8GxdhFV7LJv4RBgPM4IMd89Fo0uA01nZqveJ+jXUWdWuPbp
0vmMLGq2xPC7pAG7cJq8fTGLt0Cm+w==
=sujl
-----END PGP SIGNATURE-----

--lwf/9RTJRwQDAdk9--

