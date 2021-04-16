Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34E83625BC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:35:30 +0200 (CEST)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXRRJ-0002Ad-TW
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lXRJN-0001Ae-9K
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:27:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lXRJL-0000le-3w
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618590434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oBX6hT4l2oy027SEp1vNuUr2ERDamE+4PcALleiO6Jk=;
 b=JP9urOBaaTGvXcLI8085kKGUABC0oWwgDuo9bqCoCZYn+3AzaVgSVlsDaOwX8S4rOWw4bM
 JlSUuF50vXT994HkmYKjsbFEwBirI1JlS7YnHv4PTe5bwxA//ZTEJzPSUFd++fOTint1EH
 2LCRlD/HIsqNLRmAGUS4lXuqRh5QGYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-KzEt240vMA6xduVuILME8Q-1; Fri, 16 Apr 2021 12:27:11 -0400
X-MC-Unique: KzEt240vMA6xduVuILME8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D79C081744F;
 Fri, 16 Apr 2021 16:27:09 +0000 (UTC)
Received: from localhost (ovpn-116-207.rdu2.redhat.com [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39A025D9E3;
 Fri, 16 Apr 2021 16:26:58 +0000 (UTC)
Date: Fri, 16 Apr 2021 12:25:59 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 8/8] Tests: add custom test jobs
Message-ID: <20210416162559.GE1914548@amachine.somewhere>
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-9-crosa@redhat.com>
 <e71737f7-4717-06ce-54c8-fbb82167dd8d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e71737f7-4717-06ce-54c8-fbb82167dd8d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 07:23:14AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Cleber,
>=20
> On 4/15/21 11:51 PM, Cleber Rosa wrote:
> > Different users (or even companies) have different interests, and
> > may want to run a reduced set of tests during development, or a
> > larger set of tests during QE.
> >=20
> > To cover these use cases, some example (but functional) jobs are
> > introduced here:
> >=20
> > 1) acceptance-all-targets.py: runs all arch agnostic tests on all
> >    built targets, unless there are conditions that make them not work
> >    out of the box ATM, then run all tests that are specific to
> >    predefined targets.
> >=20
> > 2) acceptance-kvm-only.py: runs only tests that require KVM and are
> >    specific to the host architecture.
> >=20
> > 3) qtest-unit.py: runs a combination of qtest and unit tests (in
> >    parallel).
> >=20
> > 4) qtest-unit-acceptance.py: runs a combineation of qtest, unit tests
>=20
> Typo "combination".
>=20
> >    and acceptance tests (all of them in parallel)
> >=20
> > To run the first two manually, follow the example bellow:
> >=20
> >  $ cd build
> >  $ make check-venv
> >  $ ./tests/venv/bin/python3 tests/jobs/acceptance-all-targets.py
> >  $ ./tests/venv/bin/python3 tests/jobs/acceptance-kvm-only.py
> >=20
> > The third and fouth example depends on information coming from Meson,
> > so the easiest way to run it is:
> >=20
> >  $ cd build
> >  $ make check-qtest-unit
> >  $ make check-qtest-unit-acceptance
> >=20
> > These are based on Avocado's Job API, a way to customize an Avocado
> > job execution beyond the possibilities of command line arguments.
> > For more Job API resources, please refer to:
> >=20
> > a) Job API Examples:
> >  - https://github.com/avocado-framework/avocado/tree/master/examples/jo=
bs
> >=20
> > b) Documentation about configurable features at the Job Level:
> >  - https://avocado-framework.readthedocs.io/en/87.0/config/index.html
> >=20
> > c) Documentation about the TestSuite class
> >  - https://avocado-framework.readthedocs.io/en/87.0/api/core/avocado.co=
re.html#avocado.core.suite.TestSuite
> >=20
> > d) Documentation about the Job class
> >  - https://avocado-framework.readthedocs.io/en/87.0/api/core/avocado.co=
re.html#avocado.core.job.Job
> >=20
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  configure                            |  2 +-
> >  tests/Makefile.include               |  8 ++++
> >  tests/jobs/acceptance-all-targets.py | 67 ++++++++++++++++++++++++++++
> >  tests/jobs/acceptance-kvm-only.py    | 35 +++++++++++++++
> >  tests/jobs/qtest-unit-acceptance.py  | 31 +++++++++++++
> >  tests/jobs/qtest-unit.py             | 24 ++++++++++
> >  tests/jobs/utils.py                  | 22 +++++++++
> >  7 files changed, 188 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/jobs/acceptance-all-targets.py
> >  create mode 100644 tests/jobs/acceptance-kvm-only.py
> >  create mode 100644 tests/jobs/qtest-unit-acceptance.py
> >  create mode 100644 tests/jobs/qtest-unit.py
> >  create mode 100644 tests/jobs/utils.py
>=20
> > +if __name__ =3D=3D '__main__':
> > +    sys.exit(main())
> > diff --git a/tests/jobs/acceptance-kvm-only.py b/tests/jobs/acceptance-=
kvm-only.py
> > new file mode 100644
> > index 0000000000..acdcbbe087
> > --- /dev/null
> > +++ b/tests/jobs/acceptance-kvm-only.py
> > @@ -0,0 +1,35 @@
> > +#!/usr/bin/env python3
> > +
> > +import os
> > +import sys
> > +
> > +# This comes from tests/acceptance/avocado_qemu/__init__.py and should
> > +# not be duplicated here.  The solution is to have the "avocado_qemu"
> > +# code and "python/qemu" available during build
> > +BUILD_DIR =3D os.path.dirname(os.path.dirname(os.path.dirname(__file__=
)))
> > +if os.path.islink(os.path.dirname(os.path.dirname(__file__))):
> > +    # The link to the acceptance tests dir in the source code director=
y
> > +    lnk =3D os.path.dirname(os.path.dirname(__file__))
> > +    #: The QEMU root source directory
> > +    SOURCE_DIR =3D os.path.dirname(os.path.dirname(os.readlink(lnk)))
> > +else:
> > +    SOURCE_DIR =3D BUILD_DIR
> > +sys.path.append(os.path.join(SOURCE_DIR, 'python'))
> > +
> > +from avocado.core.job import Job
> > +
> > +from qemu.accel import kvm_available
> > +
> > +
> > +def main():
> > +    if not kvm_available():
> > +        sys.exit(0)
> > +
> > +    config =3D {'run.references': ['tests/acceptance/'],
> > +              'filter.by_tags.tags': ['accel:kvm,arch:%s' % os.uname()=
[4]]}
>=20
> If we want forks to use their own set of tags, it would be better to
> provide an uniform way, not adding new test entry point for each set
> of fork tags. Could we consume a YAML config file instead? And provide
> templates so forks could adapt to their needs?
>
> Thanks,
>=20
> Phil.
>=20

Yes, it should be possible indeed.  BTW, starting this kind of
discussion is one of the main goals of this series.

With regards to your suggestion, I believe there's an audience and
value to this KVM only job.  But, your idea of a YAML config file is
also very much valid.

Maybe even a job that retrieves the list of tags from a CI variable?
That could allow people to run jobs for different subset of tests at
"push" time, without the need to add committed changes to (YAML)
config files.

Cheers,
- Cleber.

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmB5upQACgkQZX6NM6Xy
CfMyjw//Te6lV2ZKIUNOyU6M1592hkPkbDpoJ/ay3l9LQ4W7PPBhqeJ+qsFmU65Y
Bv7JTEfikS/ZvXhkISR5Ofx6hVLu9X9rmzxRWX/P6If52jnGFvz12tjlIWzkxv84
tjYuvjDkKgwQm1Tk2wpIiZLyDQN4WT0BSRSWgC6FDGF0tOhw3INhdalAXFKD1pOt
+0sVxe4AD4QGHY/aqE+Ruu/SSoVw+NDQr/ikYef5X8B3Lrbr1Qleofqxa76x4KPB
nLkuWzs4BuHEo/Qx6wVdd29mnMf57dz9rAYvQDb1Hkn28h9ATFxF+k02TJL+R5JN
8WNUI2jvyCtl3bk+p7zHZ5G7NHql8OlfbrqaKBfjhYN7TC+GITfQL1yItMFnn27u
68mkbWjjF8oNTF5TM5HCrg8PPNcYn1ZcmtgOqspDY0v4PFeE7sIp31H5kAfhlqb6
MkM0WH51Aq46XaqQLk1RhVQ+2xF5LHCtbRrrzq7DUbd5nMbD/3IvcNiByJvbpqO2
Htkh2BpFLRS/sTmccdJ8CQ2DBLQXyExs5DNIrF99B/kmLNtqJJnz44Ql4JLOlrbm
ZI6ED4YzO0U/VlqfVr7gjA2s1jXYhQNxNpiFG6qhmOtP1JlOs0mRclN6MWCgI3ei
KddQ3RfxcKj8hbDIBQCIqxIT434jpgY/C8fPB9oNacb5arqkCo4=
=Ye9B
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--


