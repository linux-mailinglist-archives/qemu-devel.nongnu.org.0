Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2083445A2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 14:25:08 +0100 (CET)
Received: from localhost ([::1]:52634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOKYH-0007Q4-U2
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 09:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOKTI-0005ns-Kt; Mon, 22 Mar 2021 09:19:52 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:33185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lOKTG-0004pc-GF; Mon, 22 Mar 2021 09:19:52 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5BA12168E;
 Mon, 22 Mar 2021 09:19:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 22 Mar 2021 09:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Y1LYVJ3HIJOtnDbihJ3Vjpy1Ns0
 Zi6Yk09+YVWpizXU=; b=CveijoGajZb4rQ2YZnHw/m17zcZjQac7I1jD2pLoN/J
 hZLjkTXg75pjq7WtRiulekSH5npZtTZo+Xx/WGGa51c3Q6AQKJC3aGU6lJaF+Q8z
 r+KJHTQ1+88gEPGN2T1DQNTf4tr0XhRtjnR8huQt6BP59CN8LlCs6XqWYiO6srHE
 Ivx/y3kFRccyMuX2W6zAGx5tQNZMteqSPT+0sZaX1s3qlTJqqodA0OuYBXp+JoPX
 NzwE68uEbSl+klbjvSWl1GQEuOihK5UgYWM5/0Yfv+ArlUBBzALg6xsc44n4WI3p
 BbjZGwaALn9nkvO1JRAAMVuYFlaESTR5kIAEJasGodA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Y1LYVJ
 3HIJOtnDbihJ3Vjpy1Ns0Zi6Yk09+YVWpizXU=; b=WvygbpVycY7vCUNKcs85pI
 LSTf1HJyf8+imIoOheL3ABIaU+bmceP7F9Xm560TugNzQdso47KMEVjdA88eGRCK
 hR/wK5dwIYiRZ2vFiS5UTFejTb3wsiIy7kraTOmhBpW8fEY/8MWFUZDEmddZZAYB
 n8UyL7NdcBD/oEEJsANHnwPzjdPcWHusIqtvF/lgtNK88GFywaG6jzx2aUFx2ABE
 9TtjBmFI9foWUvSJlgGwKheLpBuIUZZ2eMsStMrP7NCXOMRv0kU2bq6rJypSSSqT
 RycwlLNe7tEfZMHs3dy27GQXXJQsA2tvjOLhMBr9WTgR16kA4wu4c4CfQrUu7Jfg
 ==
X-ME-Sender: <xms:cplYYISUTU45QyFew8NscC5OkozwS6V8qaWsjZf7MS0Th0Wh2JsvEg>
 <xme:cplYYFzwHLQ9ccpkNaohgXHa_uEV2unicuY4ZY8FqRSXfu8hv79fhSL3dAp8skprZ
 qV2OoaI274whyGn0Yc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:cplYYF1XdQRaMmGhOuHhxTZjfAMmJGPbXz7EizpfN_TXiUqJNPMUrg>
 <xmx:cplYYMAsE8ewdUmF3QMxYTyyFGX2j264RBRU-cBw6cD4i_MM49XK4A>
 <xmx:cplYYBhSovrWqkNR1GdtdCIa8bpv6JEnZNEF4hAue2HfuhMuwIaPPA>
 <xmx:c5lYYPYBn3IkFavOuP_VdMQmbcqkNBer4IiIF8iTDtrdB6p7Y5uFJw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 403E8108005F;
 Mon, 22 Mar 2021 09:19:45 -0400 (EDT)
Date: Mon, 22 Mar 2021 14:19:43 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] nvme: expose 'bootindex' property
Message-ID: <YFiZb+DBFU3F40Sl@apples.localdomain>
References: <20210322082444.12916-1-j@getutm.app>
 <a7030c4b-943d-c88d-655d-dfd6398d68d5@redhat.com>
 <YFiPfnX8is7tCS16@apples.localdomain>
 <79302867-4160-8a39-bc0b-a981e04d8b1d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8OEpzVU9IigQSv7N"
Content-Disposition: inline
In-Reply-To: <79302867-4160-8a39-bc0b-a981e04d8b1d@redhat.com>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:nvme" <qemu-block@nongnu.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Joelle van Dyne <j@getutm.app>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8OEpzVU9IigQSv7N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 22 14:10, Philippe Mathieu-Daud=C3=A9 wrote:
> On 3/22/21 1:37 PM, Klaus Jensen wrote:
> > On Mar 22 10:58, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 3/22/21 9:24 AM, Joelle van Dyne wrote:
> >>> The check for `n->namespace.blkconf.blk` always fails because
> >>> this is in the initialization function.
> >>
> >> This usually mean the code depends to some state only available
> >> during the QOM 'realization' step, so this code should be in
> >> nvme_realize(). Maybe in this case we don't need it there and
> >> can add the property regardless a block drive is provided, I
> >> haven't checked.
> >>
> >=20
> > If we defer to realization, it won't be available as a parameter on the
> > command line, but as far as I can test, adding it unconditionally
> > doesn't break anything when there is no drive attached to the controller
> > device.
>=20
> Patch is good then :)
>=20

Agreed :)

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--8OEpzVU9IigQSv7N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBYmW0ACgkQTeGvMW1P
DemoYgf/bd+U7lmEXqt2Ws3zYRMmjTOGFJhIFCkAf8TffuZQNBtCiKmzhypmmJrO
XWX0L07AfbQUt3KYiPi/sf91iacWERWTDL5PT5F1uo5RQ+NNTRtsSMOqvrl8pi46
Y4o/FVtWiMLCH/Qkt4gOpaLwYEmrTk065rq+hEAxfo+NTJ9nUygqqQaUogOJ8QCF
dbbW4jYINt68mp/BcjwIMQkvP857bn5gUmhmQdstfzbrmzkszJIudL4+2ZH1MDyT
kCeup9PvX/BZuMVb4t7MoeZHvn1HeFj4Id6+ZTWmAlnE15ald4uFzRQSxjLcOGSb
qvFR+ostqFOxbHpj4bbtSUbFZPn8KA==
=YEgp
-----END PGP SIGNATURE-----

--8OEpzVU9IigQSv7N--

