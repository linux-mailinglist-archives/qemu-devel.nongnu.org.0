Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00845322F7A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:19:40 +0100 (CET)
Received: from localhost ([::1]:57952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbLW-0006fC-Lk
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEbGx-0005Aj-JL
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:14:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEbGu-0001gO-0s
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614100491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kytcFEA6htvzEy+OHJohXb5tCt8PldoX9MtgnZ/r1ts=;
 b=i9GHb4ILQWibs4XpqGYszxkxIV8oEfpFXOrM0XUhpae57YityisCKT01dh2mU4oMGaKY6V
 CnknP1XRl4pS79C8FnllK2sR0a2TXK7C9NVxkRdlxLwKa8Zgn9Cz9QPTEBQejlIEsRbFQe
 2Vfna5kwteWaWDTgasOTuYimJZv7Avc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-UZfMEY5tMK-kV65klNhjKg-1; Tue, 23 Feb 2021 12:13:49 -0500
X-MC-Unique: UZfMEY5tMK-kV65klNhjKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2B08107ACE3;
 Tue, 23 Feb 2021 17:13:47 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF8085D9D0;
 Tue, 23 Feb 2021 17:13:43 +0000 (UTC)
Date: Tue, 23 Feb 2021 12:13:16 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Erik Skultety <eskultet@redhat.com>
Subject: Re: [PATCH v5 2/4] Jobs based on custom runners: build environment
 docs and playbook
Message-ID: <20210223171316.GC987581@amachine.somewhere>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-3-crosa@redhat.com>
 <87im6i4znx.fsf@linaro.org> <YDUWdeTcyf0Fwn/w@nautilus.local>
MIME-Version: 1.0
In-Reply-To: <YDUWdeTcyf0Fwn/w@nautilus.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 03:51:33PM +0100, Erik Skultety wrote:
> On Tue, Feb 23, 2021 at 02:01:53PM +0000, Alex Benn=E9e wrote:
> >=20
> > Cleber Rosa <crosa@redhat.com> writes:
> >=20
> > > To run basic jobs on custom runners, the environment needs to be
> > > properly set up.  The most common requirement is having the right
> > > packages installed.
> > >
> > > The playbook introduced here covers the QEMU's project s390x and
> > > aarch64 machines.  At the time this is being proposed, those machines
> > > have already had this playbook applied to them.
> > >
> > > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > > ---
> > >  docs/devel/ci.rst                      | 30 ++++++++++
> > >  scripts/ci/setup/build-environment.yml | 76 ++++++++++++++++++++++++=
++
> > >  scripts/ci/setup/inventory             |  1 +
> > >  3 files changed, 107 insertions(+)
> > >  create mode 100644 scripts/ci/setup/build-environment.yml
> > >  create mode 100644 scripts/ci/setup/inventory
> > >
> > > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> > > index 585b7bf4b8..a556558435 100644
> > > --- a/docs/devel/ci.rst
> > > +++ b/docs/devel/ci.rst
> > > @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
> > >  The GitLab CI jobs definition for the custom runners are located und=
er::
> > > =20
> > >    .gitlab-ci.d/custom-runners.yml
> > > +
> > > +Machine Setup Howto
> > > +-------------------
> > > +
> > > +For all Linux based systems, the setup can be mostly automated by th=
e
> > > +execution of two Ansible playbooks.  Start by adding your machines t=
o
> > > +the ``inventory`` file under ``scripts/ci/setup``, such as this::
> > > +
> > > +  fully.qualified.domain
> > > +  other.machine.hostname
> >=20
> > Is this really needed? Can't the host list be passed in the command
> > line? I find it off to imagine users wanting to configure whole fleets
> > of runners.
>=20
> Why not support both, since the playbook execution is not wrapped by anyt=
hing,
> giving the option of using either and inventory or direct cmdline invocat=
ion
> seems like the proper way to do it.
>

Well, these two (and possibly many others) are supported by
ansible-playbook.  I don't think we should document more than one
though, as it leads to a more confusing documentation.

> >=20
> > > +
> > > +You may need to set some variables in the inventory file itself.  On=
e
> > > +very common need is to tell Ansible to use a Python 3 interpreter on
> > > +those hosts.  This would look like::
> > > +
> > > +  fully.qualified.domain ansible_python_interpreter=3D/usr/bin/pytho=
n3
> > > +  other.machine.hostname ansible_python_interpreter=3D/usr/bin/pytho=
n3
> > > +
> > > +Build environment
> > > +~~~~~~~~~~~~~~~~~
> > > +
> > > +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
> > > +set up machines with the environment needed to perform builds and ru=
n
> > > +QEMU tests.  It covers a number of different Linux distributions and
> > > +FreeBSD.
> > > +
> > > +To run the playbook, execute::
> > > +
> > > +  cd scripts/ci/setup
> > > +  ansible-playbook -i inventory build-environment.yml
> >=20
> > So I got somewhat there with a direct command line invocation:
> >=20
> >   ansible-playbook -u root -i 192.168.122.24,192.168.122.45 scripts/ci/=
setup/build-environment.yml -e 'ansible_python_interpreter=3D/usr/bin/pytho=
n3'
> >=20
> > although for some reason a single host -i fails...
>=20
> The trick is to end it with a ',' like "-i host1,"
>

Yep, that is the trick!  A weird one nevertheless... :)

> Erik

Thanks for the review and comments so far Erik!

Best,
- Cleber.

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmA1N6wACgkQZX6NM6Xy
CfN1HA//aA0cLFVUploZI4o9VgJh9H8tpa36glAs6/wOtlX6V6eJ/4fni8ql6G1z
CuTVnKlug5FysskLvxnOOnRyd/WzkCxTzWa3rcbKmB/yw+YMg5JsDrj6g+IV8QLw
Lg8xa3DQ00+tJgasrK826s2XcvznlhOCU6dWrM3PRlEqQDcu+qJnMdigZR/OM7MT
JglCYG2ZiQmPe5PScnc76R0IXqqhX1V6pBXi2pwYisa7ryqJD5GQLVxdNnR9hmKB
SBXPcZ+Le2w7I/iagdgEBiKEqVArD4Gq52WLTiDZYlV5Z2K5BIzsMvg5YUBGHF5W
6JSp3g7XNNqA1Uqc93qL7SFgNBkBaNGCZklW/BXOLmDAr3IZMYykS4tDsqQl5NRX
DrbAz9V9Eec1xtjGlacuROSacy+Lu/9m5nAlfUM2lGdU8j/P3ttvlFGR6T6hg47D
mi/JT2sWzYCe5xpJ1LCX8ytO8IzyepeQe9BlqWkGXGzpzVHyKsV2NvQBXHMgRzOb
lQ4d0KYO7hMs9taBW9xEkfJ5D+Hn+pjVvt2EETQ9DlpDKLonsH6G/2Io+VEMz3Ng
9DbQsCNzZCDpTZul67qyHrKKiNT0AwJYl4qT22IBSX8h0W3oa3OmYFUYANkFXEBd
JqfriE3z41vdJzL9zCpUDEv5Nh6CU1J02rezRuxtKsy3sdX0nu4=
=iIUj
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--


