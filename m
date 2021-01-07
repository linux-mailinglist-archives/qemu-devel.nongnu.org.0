Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864712EECD6
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 06:21:53 +0100 (CET)
Received: from localhost ([::1]:38916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxkDg-0001vX-JA
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 00:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kxkBb-0000aR-Gz; Fri, 08 Jan 2021 00:19:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40505 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kxkBY-00030v-Om; Fri, 08 Jan 2021 00:19:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DBrxq1Wjbz9sWl; Fri,  8 Jan 2021 16:19:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1610083167;
 bh=R8yIype4M4Q3PgQiQZ1z0eOH5rLnw9NyidpMTsavZBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C0+Bg3VDaQdkovuQ41cjZ2HaXPT+IOULaW6rsXVWIAKCvKEExYfjwQZPM2RuD+TLU
 7p/dkjlMqe0GIaXrXnWSqhuaA69nhzHXbJYZdDBPa6om7mxQfxNeVdcGWB/pxdpWOn
 H1dkEnoWvXwFFUHe3yFuVwg5QTFIx1Oyy6H1L55E=
Date: Fri, 8 Jan 2021 10:24:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 0/7] macio: remove PIC object property links
Message-ID: <20210107232402.GF3209@yekko.fritz.box>
References: <20201229175619.6051-1-mark.cave-ayland@ilande.co.uk>
 <2b58fe51-ddeb-3fd3-9557-b236821b764d@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Y/WcH0a6A93yCHGr"
Content-Disposition: inline
In-Reply-To: <2b58fe51-ddeb-3fd3-9557-b236821b764d@ilande.co.uk>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2021 at 02:26:33PM +0000, Mark Cave-Ayland wrote:
> On 29/12/2020 17:56, Mark Cave-Ayland wrote:
>=20
> > This patchset follows on from the dicussion at https://lists.gnu.org/ar=
chive/html/qemu-devel/2020-11/msg02630.html
> > where the user_creatable flag for the macio devices was set back to fal=
se just
> > before the 5.2 release.
> >=20
> > The underlying cause was that the PIC object property links were not be=
ing set
> > before realise. Whilst this cannot happen when launching the g3beige an=
d mac99
> > machines from qemu-system-ppc, it caused some automated tests to fail.
> >=20
> > Here we fix the real problem which is to move the PIC for both machines=
 into the
> > macio device, which not only matches real hardware but also enables the=
 PIC object
> > property links to be completely removed.
> >=20
> > Patch 6 rewires the macio gpios for the mac99 machine as per Ben's orig=
inal comment
> > after the OpenPIC device has been moved into the macio-newworld device,=
 and then
> > finally patch 7 removes setting the user_creatable flag to false on the=
 macio devices
> > once again.
> >=20
> > Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >=20
> > v2:
> > - Add R-B tag for patch 1 from David
> > - Update commit messages to included more detail as requested by David
> >=20
> >=20
> > Mark Cave-Ayland (7):
> >    mac_oldworld: remove duplicate bus check for PPC_INPUT(env)
> >    mac_oldworld: move initialisation of grackle before heathrow
> >    macio: move heathrow PIC inside macio-oldworld device
> >    mac_newworld: delay wiring of PCI IRQs in New World machine
> >    macio: move OpenPIC inside macio-newworld device
> >    macio: wire macio GPIOs to OpenPIC using sysbus IRQs
> >    macio: don't set user_creatable to false
> >=20
> >   hw/misc/macio/gpio.c          | 24 +++--------
> >   hw/misc/macio/macio.c         | 53 ++++++++++++------------
> >   hw/ppc/mac_newworld.c         | 71 ++++++++++++++++----------------
> >   hw/ppc/mac_oldworld.c         | 76 ++++++++++++++++-------------------
> >   include/hw/misc/macio/gpio.h  |  2 -
> >   include/hw/misc/macio/macio.h |  4 +-
> >   6 files changed, 104 insertions(+), 126 deletions(-)
>=20
> Any further thoughts on this? David has reviewed patches 1-5 but I've had=
 no
> other feedback to date. If everyone is happy then I don't mind including
> this in a qemu-macppc PR.

I'm happy for you to do that.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Y/WcH0a6A93yCHGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/3mA0ACgkQbDjKyiDZ
s5LChRAAmFSIKfL7cqul/C0nDdsgn22ziMojIJsHmX9Y0r1AxasGslFYcoILDD5u
yTlJ0Gy84OWRTVy7lU9T9s7JAM0Rv/UdzytwyYsnG2uQly9QaX8YK3WV/SPoENVi
janTQxr/+VIINwEl+II4qJOWofv9Sq8MGJplAYlLhxouSjgjkjbdyYhpKo8d7uN3
zeSPVCygp+nVxIcEGDC+Js3ge7XLyQm5iytOGoT2gIefOwWS4U58GgBXQ6i1z95s
WzXfwOzk4vqPmuK2MpJ6y3AIzu1rBygtuRpQlll/xSgjXZB6jsmGsFVfQMtQqZPW
TdpmGqmLHkwxIs76PpUW+BgYUDwPX7hHIX/2nuoFMKIQpX7uSs6pH0sCTltQlXXz
0INZJl7CUgVCrweuNBdTyo0Hb7O7HaabzQr1SVdrJo721tC70yFdno6Ac85WBYtp
qgqk+lzk32Xz2ACWNEhACJLPyEuFZG7CzJYe7lOPLtEdEDGGq2H0JYkwpxk1VR/f
MZZn5dvT+C2UGegYfDEBY1aOswT1HkkO5YoAcecJboe5gRjTKJemOFWV9+ThnjNq
YBlR3Sai1xuV3JtcuSnY/Sa/RnVOdKMkAycjFOYIhUwj1Jonu3WfkDto9116bcH1
CY/TYagCJlz5895pUzWQhtjTulm0u5Dsre3aTla2Wf/YFJUTXTk=
=TKfs
-----END PGP SIGNATURE-----

--Y/WcH0a6A93yCHGr--

