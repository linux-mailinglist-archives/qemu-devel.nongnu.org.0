Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568F364A05
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 20:43:17 +0200 (CEST)
Received: from localhost ([::1]:41684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYYrb-0005Gz-Tq
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 14:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lYYkg-0002DP-Ct
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:36:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lYYkc-0008OY-Tz
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618857360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LoY+Oout7vtW2zxTvtFKwl3YorPXaoR7UIIzPlafyKM=;
 b=d4hvDbeZCJNUONPrOu8iL1Zr5nEG5U1PzgTbBAQerRYkeicI3l0FSdjvjEbHaX2mNzl13w
 T9PqZsOyIUmh6GgBS43HHByCTyfMp/Pgt1HIQ79mMy4s6fP5Om4z7HL6HP0sK3VNhZCk8l
 L5Xo94UE2t7b+LX3NtPZsVf+ibPZ0G4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-GOJG_bf-MpOe0mHMu2FoBA-1; Mon, 19 Apr 2021 14:35:57 -0400
X-MC-Unique: GOJG_bf-MpOe0mHMu2FoBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23128501F5;
 Mon, 19 Apr 2021 18:35:57 +0000 (UTC)
Received: from localhost (ovpn-116-207.rdu2.redhat.com [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28A302B431;
 Mon, 19 Apr 2021 18:35:41 +0000 (UTC)
Date: Mon, 19 Apr 2021 14:35:32 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 2/3] Acceptance Tests: move definition of distro
 checksums to the framework
Message-ID: <20210419183532.GA2114760@amachine.somewhere>
References: <20210414221457.1653745-1-crosa@redhat.com>
 <20210414221457.1653745-3-crosa@redhat.com>
 <bc2b4167-4f4a-3c21-0283-3bf8b32a63b2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bc2b4167-4f4a-3c21-0283-3bf8b32a63b2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 12:25:44PM -0300, Wainer dos Santos Moschetta wrote=
:
> Hi,
>=20
> On 4/14/21 7:14 PM, Cleber Rosa wrote:
> > Instead of having, by default, the checksum in the tests, and the
> > definition of tests in the framework, let's keep them together.
> >=20
> > A central definition for distributions is available, and it should
> > allow other known distros to be added more easily.
> >=20
> > No behavior change is expected here, and tests can still define
> > a distro_checksum value if for some reason they want to override
> > the known distribution information.
> >=20
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >   tests/acceptance/avocado_qemu/__init__.py | 34 +++++++++++++++++++++-=
-
> >   tests/acceptance/boot_linux.py            |  8 ------
> >   2 files changed, 32 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptan=
ce/avocado_qemu/__init__.py
> > index aae1e5bbc9..97093614d9 100644
> > --- a/tests/acceptance/avocado_qemu/__init__.py
> > +++ b/tests/acceptance/avocado_qemu/__init__.py
> > @@ -299,6 +299,30 @@ def ssh_command(self, command):
> >           return stdout_lines, stderr_lines
> > +#: A collection of known distros and their respective image checksum
> > +KNOWN_DISTROS =3D {
>=20
> Do you plan to expand that mapping to record values other than checksums?
> Otherwise it could be named KNOWN_DISTROS_CHECKSUMS.
>

Let's just say I had an intuition about it being used for other
purposes.  Talking to Eric Auger earlier this morning, he will expand
this mapping with default kernel args distros, so that he can *add*
to the common args.

> > +    'fedora': {
> > +        '31': {
> > +            'x86_64':
> > +            {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d4621=
5d8fc026954f3c5c27a0'},
> > +            'aarch64':
> > +            {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad03293=
83d5639c997fdf16fe49'},
> > +            'ppc64':
> > +            {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2c=
c390dc4efa2026ad2f58'},
> > +            's390x':
> > +            {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d35=
5069ca982fdcaf5a122d'},
> > +            }
> > +        }
> > +    }
> > +
> > +
> > +def get_known_distro_checksum(distro, distro_version, arch):
> > +    try:
> > +        return KNOWN_DISTROS.get(distro).get(distro_version).get(arch)=
.get('checksum')
> > +    except AttributeError:
> > +        return None
> > +
> > +
>=20
> Currently we have a few loose methods on avocado_qemu/__init__.py, and I'=
m
> about to send a series to wrap them in a mixin class. This series will
> introduce more loose code on the file; so would you consider moving
> KNOWN_DISTROS and get_known_distro_checksum() to the LinuxTest class, and
> possibly making the latest a class method?
>

Some of our experience in "avocado.Test" revealed that users would:

  1) find it confusing to have so many methods in the class that are not us=
eful
     to them

  2) would conflict with variables/attributes of their own

About #2, we end up turning a lot of variables atttributes into
properties so that errors would be explicit when users tried to
overwrite them unknowingly.

But, in the specific example of KNOWN_DISTROS and its expansion I
mentioned before, it may indeed make sense to have a Test or LinuxTest
method that test writers can use.  It'd probably need to be a bit more
generic and evolved than this current version though.

Maybe wait for Eric's input based on real world use case here?

> >   class LinuxTest(Test, LinuxSSHMixIn):
> >       """Facilitates having a cloud-image Linux based available.
> > @@ -348,14 +372,20 @@ def download_boot(self):
> >           vmimage.QEMU_IMG =3D qemu_img
> >           self.log.info('Downloading/preparing boot image')
> > +        distro =3D 'fedora'
> > +        distro_version =3D '31'
> > +        known_distro_checksum =3D get_known_distro_checksum(distro,
> > +                                                          distro_versi=
on,
> > +                                                          self.arch)
> > +        distro_checksum =3D self.distro_checksum or known_distro_check=
sum
>=20
>=20
> distro_checksum may be None. In this case vmimage.get() will silently ski=
p
> the check? I suggest to log a warn message.
>=20
>=20

Yes, good point.  But, I think adding that warning to Avocado's
vmimage.get() method itself is even better.  What do you think?

Thanks for the review!
- Cleber.

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmB9zXIACgkQZX6NM6Xy
CfPJFw//TmibHvdjknjueUxw9czqLiio1MEuKtns2iwa9zL3J6xi66IQ3MZNXoXB
01lVNU6xsW4fy2oF4dKBdIU/a4wDvXfE9r/MY9ORYqJ3Vwj2MF7p8aWlgyWOCHUV
SgXzlZA62TcJcIGITJhbMHNoXzKyOPQAc9V6rxHm5Et4WjQH5Pd7fST0LHUjVIz7
Ztat94wO7X3AkLv4Jq3RqWz2hzzQ5f5h821KrbyldLXC83jmIHH3cg5qOdZlq691
S9ocMI4QnOlchrhLe4GbOW1jkBgQIYRaycpK20yShorMVruWeRPMkTygRUUb5RYO
JoSA5FBT/Y4o0NyEoIAn9ClM3QIBlZ9DqkX88kmmKlbhXli+ECEsgDccypfbDaeS
QCWzawf6nOplVto4yOw6biow+mgXZy5GWUKO5F/Alo4Ck8GR8hMOSgjVhtC01NzE
VUqJqwYzu/1ikPgd4byCz85/q8lIV/XzbNVjDyNNsY31Ndy/+LfTM9WgLR5IolKk
K4giH8BtEy79++jmX5z8JFWGbITOWEUnygFSWJhFlvknFITjOsRrA5FnN1a5hfTc
WLHwImkn9KAeo+7W/a4YqLJUl8//AtN8OkQrXoZ1DS+W4EmuQwRtfojPSvEGop3L
ekqzZqa9mUn2LigRri+StsIbPrEan2sWYMztcyG7B3xUnikblCs=
=sx3w
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--


