Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CFD447599
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 21:16:52 +0100 (CET)
Received: from [::1] (port=55292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjoax-0002ig-R9
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 15:16:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mjoZZ-0001nz-6m
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 15:15:30 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:53508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mjoZW-0006fR-Uf
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 15:15:24 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-oYcquR33PCWgGx-1WwhYDQ-1; Sun, 07 Nov 2021 15:15:09 -0500
X-MC-Unique: oYcquR33PCWgGx-1WwhYDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 596E6871803;
 Sun,  7 Nov 2021 20:15:08 +0000 (UTC)
Received: from bahia (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2D7560C4A;
 Sun,  7 Nov 2021 20:15:06 +0000 (UTC)
Date: Sun, 7 Nov 2021 21:15:04 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] target/ppc, hw/ppc: Change maintainers
Message-ID: <20211107211504.25334212@bahia>
In-Reply-To: <YYZCcDH/5ssXnORx@yekko>
References: <20211105034640.53754-1-david@gibson.dropbear.id.au>
 <8e05f98a-6a46-f728-5035-fab10f5a209a@gmail.com>
 <880124b9-5cd1-7fcb-fdc6-3d3f8a1da2b6@amsat.org>
 <91972ce2-8d1f-f22e-c87f-45cb3c221b18@gmail.com>
 <YYYCcwEuUNGVMKwu@yekko>
 <e93f45aa-b2dc-6f9a-d056-1bf50d431802@kaod.org>
 <YYZCcDH/5ssXnORx@yekko>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_VVK66DU_UGPQYh1PIM2/AA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-devel@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/_VVK66DU_UGPQYh1PIM2/AA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 6 Nov 2021 19:53:04 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Sat, Nov 06, 2021 at 09:28:54AM +0100, C=C3=A9dric Le Goater wrote:
> > > > > > Thank you and Greg and Red Hat for all the years of service sup=
porting
> > > > > > qemu-ppc in the community. IBM will shoulder this responsibilit=
y now.
> > > > >=20
> > > > > In term of the MAINTAINERS file:
> > > > >=20
> > > > >           S: Status, one of the following:
> > > > >              Supported:   Someone is actually paid to look after =
this.
> > > > >              Maintained:  Someone actually looks after it.
> > > > >=20
> > > > > The PPC entries have a 'Maintained' status. You say "IBM will sho=
ulder
> > > > > this responsibility", does that mean the entries will be 'Support=
ed'
> > > > > as in "someone paid to look after them"?
> > > >=20
> > > > Yes. It's appropriate to change the PPC entries of this patch to "S=
upported"
> > > > now.
> > >=20
> > > Good point, I've adjusted that.
> >=20
> > "Supported" would be setting the expectations too high. It is an extra
> > activity among what we are already dealing with. Please leave it to
> > "Maintained".
>=20
> Fair enough, reverted.
>=20

For the "Maintained" version,

Reviewed-by: Greg Kurz <groug@kaod.org>

Good luck C=C3=A9dric and Daniel !

Cheers,

--
Greg

--Sig_/_VVK66DU_UGPQYh1PIM2/AA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmGIM8gACgkQcdTV5YIv
c9azRw/9H0QXWUnlg7AYK6oMbe3daey2wukmtSxEph0tODjxx6+WsD7SPu9ulwjA
FtqqBABjBfr8pTuaalqGFS+bYbdAv/27DiWefMOu7qz0s93/mz5ddhFiDY8oDT2h
mLs1k4camzwonRHiiCCCWWcvLhGI6TN5yZgWg5/TzIVS+gk1GExayI9q7NX9LtjK
+dNn/de9YxaXRuGX1Dv5IegiXh5bktEsq1BpAjsrP4YiTRaELdJRXaTdqfE+QfBc
erd4PMq6EiVzn13qIOqJC16nwwbVp0Lh9GCeFXvUepnzqZNOuPifonr+rUhpvyjX
0OdfKWyHIyQAeKunAQWGOZnYUqaKdiYzFNlLcsO0vNHeDOWGProzTjHSefi1b8zq
KkBeYgdvT/c0iyCiDHXyq5Ri8Y5Rb4QC39fwQo0D8SJ+m9OfNWZj6mcFI82ioI6K
9HgzUwo2MUfSaB31ZFwfR2dXJQywwZPm8t/4qoYBsBxGIvS7aXN6nPFx4kvsjr1H
1A+/HFZDf8m45SHyd/2HC723t96CPWRb/woqXk+h8YUtQhcybfBNGVALp/8x2w5G
K8uyncTJAwbqyadUMQH1XYzgvHLfp1cYLJASoiZRqxb3Vew+Jw4HBoX5UwTaXZxe
YWMXGHklC7wb7EpzJv9QOzyoWJPfTi9VbRd1I2jmj5V3ZoQCcnw=
=ajc5
-----END PGP SIGNATURE-----

--Sig_/_VVK66DU_UGPQYh1PIM2/AA--


