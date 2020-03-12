Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19B6182692
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 02:25:59 +0100 (CET)
Received: from localhost ([::1]:60336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCCbm-0005zG-Vk
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 21:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33976)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1jCCZc-0002gj-9z
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 21:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1jCCZa-0006qb-Ls
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 21:23:43 -0400
Received: from ozlabs.org ([203.11.71.1]:48103)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1jCCZZ-0006d7-Ls; Wed, 11 Mar 2020 21:23:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48dB133Cv1z9sSL; Thu, 12 Mar 2020 12:23:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1583976215;
 bh=YZLDCq0BAEIqkA6Njsa4GZn3u3mXV0S322x0dTVdkqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WAD9xWOeWEycsAarijW4QYQ22/AqNnwHYBm3rpQbHYcm7H2a1/zYdI6sl+MRF/2NN
 9V0YtMlwNVSUa/IJuZSq4AiUcmy/y289Kkzrv+23HQLl53qYGNFx3eUDAAGfM/E+fv
 b6FccNgDE4T9F1vLjlUa4I8C4Myx+2t6ubdBye6k=
Date: Thu, 12 Mar 2020 12:10:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: Upstream QEMU guest support policy ? Re: [PATCH v3 0/2] spapr:
 Use vIOMMU translation for virtio by default
Message-ID: <20200312011049.GC711223@umbus.fritz.box>
References: <20200305043009.611636-1-david@gibson.dropbear.id.au>
 <20200310114343.GD3234052@redhat.com>
 <20200311011247.GT660117@umbus.fritz.box>
 <20200311031202-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Content-Disposition: inline
In-Reply-To: <20200311031202-mutt-send-email-mst@kernel.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: pair@us.ibm.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>, aik@ozlabs.ru,
 groug@kaod.org, qemu-devel@nongnu.org, paulus@samba.org, clg@kaod.org,
 mdroth@us.ibm.com, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 03:33:59AM -0400, Michael S. Tsirkin wrote:
> On Wed, Mar 11, 2020 at 12:12:47PM +1100, David Gibson wrote:
> > I am wondering if we have to introduce an "svm=3Don" flag anyway.  It's
> > pretty ugly, since all it would be doing is changing defaults here and
> > there for compatibilty with a possible future SVM transition, but
> > maybe it's the best we can do :/.
>=20
> Frankly I'm surprised there's no way for the hypervisor to block VM
> transition to secure mode. To me an inability to disable DRM looks like
> a security problem.

Uh.. I don't immediately see how it's a security problem, though I'm
certainly convinced it's a problem in other ways.

> Does not the ultravisor somehow allow
> enabling/disabling this functionality from the hypervisor?

Not at present, but as mentioned on the other thread, Paul and I came
up with a tentative plan to change that.

> It would be
> even better if the hypervisor could block the guest from poking at the
> ultravisor completely but I guess that would be too much to hope for.

Yeah, probably :/.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5pjBkACgkQbDjKyiDZ
s5LiRQ/7BzSYXdB0dyhXKN08T+Q5uguKlFWTc8FgnqkENUlOUF384PWwyDgpELG0
OKybPVfAGuSCFF22uuCktdV9X5K+4mUWbDbFw3RPL91e5zyDOIfgQUl9jBjCpAW9
NOhpPf+5MDINc7DhSwqydWLS0yHM9/L8h5dUaDJfbFl7bEkTjEgIvUzrDkh8R1wZ
f/nYt2E9HIDtv0W0EomZ/2Z9O1IbyLC6bCxZWaWPWYWE2KP+2XTkpY9mxFM1Muwd
fcWB1BJFIhFF01L0NW/PqjAHTwnpw3ApB5nr2w+3+3YcVl0JfIrmVxRPM1FoZiz0
1sldHwx45O3X5MW95ZASocLAqas4Zdm3hDp7FvSjC9hTMnIyYnZKMe3lhJfLAjuo
9uWyItB3rufyAIHc/0S4STc4Jy/296sy/N6jIZpDCQrMbhuW1qU2jdssPTk8FV4N
TW8KW88xSMW+6Ojbb+FrnGhAcVY6wz8edk+Z/Q0zw7RgE95/47aNe90NEfa0+gJ8
/GgZdJDl8ep3epYJxJRein+vWzxmkxKqhBnDzwjLP1HkW2AIRrYJEY8RXR/AHqO/
0S7NZ4yahm7vrrAtTjxcjqDf1je6DgGGu/OLzNrOFD0Xb+/g2rlFhoON2t5+HVx9
wqce+WuJZtsIAdCMaZD2cAi22dxSxjrY5kEFF65JgOCe+E4/hNU=
=OlK0
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--

