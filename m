Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21735321D1A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:36:22 +0100 (CET)
Received: from localhost ([::1]:51648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEC5-0001w0-8R
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEE59-0004Yj-U7
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:29:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEE58-00059U-0j
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614011348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GVt0EN8c6INy47OraVNpiJtke2iI1ZirBnifhw4Cgmw=;
 b=VZvi+Eb42LAqxpVDqsIk7So0tN4eGAZE2gn3RumVEOxKvG6RG7s+1W4EC4lqv0aHcR76dy
 /JAllm9ORGH8SSiqVov9TUTjZR3ab1zIZI4kPKhtTMwja7YfTZUiHt4h/hW5GDTdUBijeM
 GbqJaXDq3ewE+/HedcToGMnYunz/yrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-6rat7mS5PkO7GtjP0xYXcQ-1; Mon, 22 Feb 2021 11:29:02 -0500
X-MC-Unique: 6rat7mS5PkO7GtjP0xYXcQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03223107ACE3
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 16:29:01 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E81960C47;
 Mon, 22 Feb 2021 16:28:49 +0000 (UTC)
Date: Mon, 22 Feb 2021 11:28:31 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: Can we run QEMU Avocado tests without root access?
Message-ID: <20210222162831.GA903049@amachine.somewhere>
References: <04391605-1413-f944-6e17-8a4bc50608b5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <04391605-1413-f944-6e17-8a4bc50608b5@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: avocado-devel <avocado-devel@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 12:23:17AM +0100, Philippe Mathieu-Daud=C3=A9 wrote=
:
> Hi,
>=20
> On a system I want to run the QEMU integration tests I got:
>

Would you care to give more information about this system?  Is it
possible that it's a Debian-like system with "python3-minimal"
installed instead of "python3"?

> $ make check-venv
>   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 dtc capstone slirp
>   VENV    build/tests/venv
> The virtual environment was not created successfully because ensurepip
> is not
> available.  On Debian/Ubuntu systems, you need to install the python3-ven=
v
> package using the following command.
>=20
>     apt-get install python3-venv
>=20
> You may need to use sudo with that command.  After installing the
> python3-venv
> package, recreate your virtual environment.
>=20
> Failing command: ['build/tests/venv/bin/python3', '-Im', 'ensurepip',
> '--upgrade', '--default-pip']
>

make check-{venv,acceptance} won't attempt to install pip, so I'm
guessing this message is coming from the Python distribution on
your system.  And notice that the bare venv *has* been created.

> make: *** [/home/philmd/qemu/tests/Makefile.include:98:
> build/tests/venv] Error 1
>=20
> However I could do:
>=20
> $ python3 -m pip install --user virtualenv
> Collecting virtualenv
>   Downloading virtualenv-20.4.2-py2.py3-none-any.whl (7.2 MB)
>      |=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=
=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88| 7=
.2 MB 6.4 MB/s
> Collecting distlib<1,>=3D0.3.1
>   Downloading distlib-0.3.1-py2.py3-none-any.whl (335 kB)
>      |=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=
=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=
=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=
=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88=E2=96=88| 3=
35 kB 6.4 MB/s
> Collecting appdirs<2,>=3D1.4.3
>   Downloading appdirs-1.4.4-py2.py3-none-any.whl (9.6 kB)
> Requirement already satisfied: six<2,>=3D1.9.0 in
> /usr/lib/python3/dist-packages (from virtualenv) (1.15.0)
> Collecting filelock<4,>=3D3.0.0
>   Downloading filelock-3.0.12-py3-none-any.whl (7.6 kB)
> Installing collected packages: distlib, appdirs, filelock, virtualenv
> Successfully installed appdirs-1.4.4 distlib-0.3.1 filelock-3.0.12
> virtualenv-20.4.2
>=20
> $ virtualenv --version
> virtualenv 20.4.2 from
> /home/philmd/.local/lib/python3.9/site-packages/virtualenv/__init__.py
>=20
> Note, there is still the old tests/venv/ dir created bug:
>

OK, noted.  We not have a formal bug report to work on:

   https://bugs.launchpad.net/qemu/+bug/1916506

> $ make check-venv
>   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3
> tests/fp/berkeley-softfloat-3 dtc capstone slirp
> make: Nothing to be done for 'check-venv'.
>=20
> Although it might be true... If I don't have root access, there is
> nothing to be done =C2=AF\_(=E3=83=84)_/=C2=AF
>

With regards to your question on the subject line, one could attempt
to have a secondary Python installation with the *required packages*
(as per the documentation) installed as a non-root user.  And then,
you could give that Python path to configure.  The current
documentation states:

   Note: the build environment must be using a Python 3 stack, and have
   the ``venv`` and ``pip`` packages installed.  If necessary, make sure
   ``configure`` is called with ``--python=3D`` and that those modules are
   available.  On Debian and Ubuntu based systems, depending on the
   specific version, they may be on packages named ``python3-venv`` and
   ``python3-pip``.

IIUC, the improvement you suggest is to not require "python-venv" as a
package, but install it via "python3 -m pip".  One possible way to
rely *only* on Python 3 and setuptools (dropping venv and pip
requirements) would be to do something like:

   $ python3 -m ensurepip
   $ python3 -m pip install venv
   $ make check-venv

It's a valid approach, in theory.  In practice, depending on your
distro, you may not have "ensurepip" at all, even if it is a *standard
Python library*:

   https://docs.python.org/3/library/ensurepip.html

You can read about how those packaging decisions can become hell
in bug reports such as:

   https://bugs.launchpad.net/ubuntu/+source/python3.4/+bug/1290847

In my experience, venv and pip have caveats and using the distro's
(complete) packages will give you an overall better experience.

While *one* could setup the dependencies as non-root, but I don't
think it should be used in the current check-venv rule.

Regards,
- Cleber.

> Thanks,
>=20
> Phil.
>=20

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAz26wACgkQZX6NM6Xy
CfMzIxAAgMs7saCwluT8GYieUrbv8EqWcaSnxH2jqd/z69d+3B12FjhwwA1yS/uu
OSOkcLLQFeTKf0q7wgDNUKfcvVNHzZOwSECsr7E97b3itJ3WBqfu08iSecdxJ2Pq
FohmoU6GkU1qDHrpPDlmyUBu2d6eeficIwYtOer4KSFeW9AtJUomcyssFuDbGkRq
wOPFsRtEkr/peJhxTFTFm4mqtjQxMvnA94Z2Od6Ogavi9telwOqE4MDssi6ztwOH
zE6OSqbwNRZUGf0RgHZvSB6+gsdEeCiiJyfOiEvvh7HV0YwoXTnESgznZZptwJEL
fgZm1r0VkwB4BXcy/B3v1BJd6Ia89WHInKKQL9ERCpLowAEgkGvrtXNynlEMPz4V
ru+NcYBpPNs8b+M/U6FdIshfjls0y6Q5icD9t5h4xbFd5UqNfPevVZc4n7FleJ98
8HiMfLDxQYpedhIJ6B8nY66CgHCvY5PXKWEoQXE7nDfIhoFDmGq2SaX26OUrH1aJ
dsP86XqAY1sMafkR4R0/MQcatkU1XV2iZsdnYTMjc7jYhwyjrKnzwEEOi+fdwcvF
XYa+N+55iv8tU4NgFISyWIix7H2R9meXjG1R1YhzBBYhejrDdsVl+vrdKiXWHukf
EvY1EO44hm3xjNht6xa23KnMdPZlVQIHlIsmJh2wZA/XIErT8oU=
=eiGO
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--


