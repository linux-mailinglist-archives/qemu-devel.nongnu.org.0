Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907092D5832
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 11:28:54 +0100 (CET)
Received: from localhost ([::1]:48714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knJBt-0001UY-2n
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 05:28:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1knJ0I-0007gD-DB
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 05:16:54 -0500
Received: from 3.mo52.mail-out.ovh.net ([178.33.254.192]:36750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1knJ0E-0000Ln-85
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 05:16:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.17])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id BAB76221DF7;
 Thu, 10 Dec 2020 11:16:46 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 10 Dec
 2020 11:16:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001b909fccf-3cfb-4770-b946-56ac44686679,
 7F90A86A4359BCD1ACB0618936AE64BD6AD86209) smtp.auth=groug@kaod.org
Date: Thu, 10 Dec 2020 11:16:38 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH for-6.0] spapr: Allow memory unplug to always succeed
Message-ID: <20201210111638.0e6c9416@bahia.lan>
In-Reply-To: <20201210033844.GL2555@yekko.fritz.box>
References: <20201207133704.952459-1-groug@kaod.org>
 <20201208043004.GE2555@yekko.fritz.box>
 <20201208100609.5fcc604a@bahia.lan>
 <20201210033844.GL2555@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oqxBIVBdP/V9R1TIuwrO_pm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 771c9c68-5488-491f-901f-095be9202c5a
X-Ovh-Tracer-Id: 17694079990212631005
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheplefggfefueegudegkeevieevveejfffhuddvgeffteekieevueefgfeltdfgieetnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=groug@kaod.org;
 helo=3.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/oqxBIVBdP/V9R1TIuwrO_pm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Dec 2020 14:38:44 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Dec 08, 2020 at 10:06:09AM +0100, Greg Kurz wrote:
> > On Tue, 8 Dec 2020 15:30:04 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >=20
> > > On Mon, Dec 07, 2020 at 02:37:04PM +0100, Greg Kurz wrote:
> > > > It is currently impossible to hot-unplug a memory device between
> > > > machine reset and CAS.
> > > >=20
> > > > (qemu) device_del dimm1
> > > > Error: Memory hot unplug not supported for this guest
> > > >=20
> > > > This limitation was introduced in order to provide an explicit
> > > > error path for older guests that didn't support hot-plug event
> > > > sources (and thus memory hot-unplug).
> > > >=20
> > > > The linux kernel has been supporting these since 4.11. All recent
> > > > enough guests are thus capable of handling the removal of a memory
> > > > device at all time, including during early boot.
> > > >=20
> > > > Lift the limitation for the latest machine type. This means that
> > > > trying to unplug memory from a guest that doesn't support it will
> > > > likely just do nothing and the memory will only get removed at
> > > > next reboot. Such older guests can still get the existing behavior
> > > > by using an older machine type.
> > > >=20
> > > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > >=20
> > > Looks like this conflicts with something I've added to for-6.0
> > > recently.  Can you rebase and resend, please.
> > >=20
> >=20
> > I'm not quite sure what for-6.0 you're talking about. Despite
> > you're recent announcement about moving to gitlab, it seems
> > that the branch at github is the most up to date.
> >=20
> > gitlab:
> > - HEAD is "xive: Add trace events"
> > - Date: 26 Nov, 2020
> >=20
> > github:
> > - HEAD is "MAINTAINERS: Add Greg Kurz as co-maintainer for ppc"
> > - Date: Dec 4, 2020
> >=20
> > I've thus based this patch on github. Also, this is based on Connie's
> > "hw: add compat machines for 6.0" patch...
> >=20
> > > > ---
> > > > Based-on: 20201109173928.1001764-1-cohuck@redhat.com
> >=20
> > ... maybe I should have made it more clear than just
> > mentioning the message id ?
> >=20
> > I think I'll just wait for Connie's patch to get merged and I'll repost=
 after
> > you've rebased ppc-for-6.0.
>=20
> Sorry, I think I forgot to push the latest to either gitlab *or*
> github.  I've pushed some new stuff now.
>=20

Np. I see you now have the 6.0 compat machine types in your tree on gitlab.
This patch should apply flawlessly.

--Sig_/oqxBIVBdP/V9R1TIuwrO_pm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl/R9YcACgkQcdTV5YIv
c9afTxAAjyqYqS1I33f7mIdJPOaB7lNOIXTtFYiQnek6lzl1LXDTmtD54mtvX0Bs
Xx9mw+7Db06oDjADawtRuMvl6B2M32V9ihS20B2ddqWJmpp9+lnSq269TRNa3wGK
OnFfb+dMky+YI+uiCwRdfefbyh6viQt47C75ynYx8t50/187bgcIZj+qUM9zkR4H
SypC4unqduzpwbVxxj/1O7UDXA7F8stZ1pVkqSDkG2mwSV/B3mDfamUCJtgiWTaK
DHsgheQMDaTP9nc1JJRHYmrtXeZtAEEOncLDbW88M81XS+LcWVqpay4iU22ZZkq0
epJ8mk3j00Airg2EoPiCPLkH523nl2Hx0Zr3FWOqNwELYVfwzUVyW+GJqNlM2X31
/OhowlssBGVnf898U0QOJgsZxXRsAjLqCUK5yYLitzW1LYvKbEU+ij+Dzqt3mXU9
SyvcKuo2ei/dU0mDd02DiT3oYGJB30DW5T0AG5nHYhTm+Nh4OFDZFL9EzWuYBnHG
vKsU1zhwR9DlfnYyUDANpUmxH202JI0nigcOiI702sZmeJBYFtZhHtkjrFG/R/dW
wq04kB5kxhuwCeDGBHVmOomdeOwSzqP+axadOPvHmF9E8OZAeOEQA4yHRq8VK9mO
DENzqcR1eDOShRoO1Ypl/I4z13CIhGUGC5BgvTzLgonkD8rx7GE=
=Oagh
-----END PGP SIGNATURE-----

--Sig_/oqxBIVBdP/V9R1TIuwrO_pm--

