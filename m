Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A783226B9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 09:00:52 +0100 (CET)
Received: from localhost ([::1]:34412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lESck-0000Ta-Cy
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 03:00:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lESbO-0008Mw-M5
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 02:59:26 -0500
Received: from 4.mo51.mail-out.ovh.net ([188.165.42.229]:60392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lESbM-00061m-Ot
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 02:59:26 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.158])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 59BD1267F19;
 Tue, 23 Feb 2021 08:59:14 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 23 Feb
 2021 08:59:13 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00693980e69-3ae6-4d92-a1a1-9283f88f8190,
 6F2917FB5EF69EFB637F8DE19110E4015BA123FD) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 23 Feb 2021 08:59:10 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: Editing QEMU POWER Platform wiki page
Message-ID: <20210223085910.6928135a@bahia.lan>
In-Reply-To: <YDSJxzxjs3jJImEY@yekko.fritz.box>
References: <91874f1e-4b14-5fb1-f1ae-1225938df759@linux.ibm.com>
 <20210222120138.31f313c9@bahia.lan>
 <3c3fc3f0-afb8-1012-eaf7-11ecbe146025@linux.ibm.com>
 <YDSJxzxjs3jJImEY@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sBLVOKjbrxVqTKeaM68Ir2n";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 017f3f2c-0cb1-478a-a8e8-230147003e81
X-Ovh-Tracer-Id: 13101252793626695974
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeeggdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleegieevfedvhfelgfeujeehgfeigfegueegvdehhfetveefjeeludduueffffffnecuffhomhgrihhnpehqvghmuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=groug@kaod.org;
 helo=4.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: lagarcia@br.ibm.com, Programmingkid <programmingkidx@gmail.com>,
 QEMU PPC devel list <qemu-ppc@nongnu.org>,
 QEMU devel list <qemu-devel@nongnu.org>, Cedric Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/sBLVOKjbrxVqTKeaM68Ir2n
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Feb 2021 15:51:19 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Feb 22, 2021 at 06:18:08PM -0300, Leonardo Augusto Guimar=C3=A3es=
 Garcia wrote:
> > On 2/22/21 8:01 AM, Greg Kurz wrote:
> > > On Thu, 18 Feb 2021 10:16:25 -0300
> > > Leonardo Augusto Guimar=C3=A3es Garcia <lagarcia@linux.ibm.com> wrote:
> > >=20
> > > > Hi there,
> > > >=20
> > > > I would like to edit the wiki page at [0] as it contains some outda=
ted
> > > > information. Could anyone that has access to the wiki please help me
> > > > create a user so that I can edit it?
> > > >=20
> > > > 0. https://wiki.qemu.org/Documentation/Platforms/POWER
> > > >=20
> > > Hi Leo,
> > >=20
> > > User creation isn't publicly available to avoid spam : only an existi=
ng
> > > user can create a new account.
> >=20
> > Yeah, I saw that. That's why I asked here.
>=20
> The other concerns raised in this thread are valid, but those
> notwithstanding, I think it makes sense to let you update the Wiki if
> you have the time and inclination.
>=20

Sure, but the point is that this incentive to update documentation
would be better used in the main QEMU documentation, i.e. the
docs/system/ppc/pseries.rst file in Cedric's "docs/system: Extend PPC
section" patch.

> I have a wiki account, and I know who you are, so I've created an
> account for you.  Credentials to follow via private communication.
>=20


--Sig_/sBLVOKjbrxVqTKeaM68Ir2n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmA0tc4ACgkQcdTV5YIv
c9ZXIQ/9HWTLJDfSls1pDyggCIjKobefHLqPu4IxPIgX+wF5k8vNEtvpmwkcc30B
s6YSxqyO/3pr8EIngltYEK738WPGop7F2U3+j7cKN909TmrcgIgn28Pr3LNjAUOb
r1a2+ry78xiN1SJnrVlLJfBhlksCY7lj3JVfvlz5YBJQSIwr4pjnpERa5m9bYQgJ
IZ5u0hUkf3eiHSp99bDF1mvmFJWDbr5tZ54lytgEteVV6XRKCdWlMEvKwCwbw116
dAQ1fy4YpvDM6mROg9b6DmEWkbH6eIewDdCy497ref9aI5xgE3lcTrNpe1wrJKO3
tew7gUphSbMVW2LH9ROnRWp5tgxNE+D1dD+oAvdrNLv4kOo9uK2lQoWEh3jrhF7z
3JBjqh0IOpdZzcyBTimKVQyomjyp491haKtd2r173oBEKrNT6GLRpe5qz7LJXdTs
7FyATZIvPpNKUWKlQ3ta5EZrZ0xZa7s5JhZXiC++rk+EHuiTJN1IbA2urPCGPf8b
pQgaA1jSBeMFXECD8ZugpyiQ3JV96fp8MN9ZZhQWwJrc10gftF42cg8hAFA0wDwb
FRqnla5DGAG8+R5bENhtNfKYjLc49AFSRJeb9M/U7d5xXH/qggtP3FfW7ghJxYvp
pYJZM2lyAcfwN8kdhmwoMCChz5p6UL0TdSEskJD3z4PPlt5D1nc=
=QHeQ
-----END PGP SIGNATURE-----

--Sig_/sBLVOKjbrxVqTKeaM68Ir2n--

