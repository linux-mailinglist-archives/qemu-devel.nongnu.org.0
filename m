Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DA9322F98
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:28:17 +0100 (CET)
Received: from localhost ([::1]:45916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbTs-0005ef-Ub
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEbQc-0003Rd-7h
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:24:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEbQZ-0005po-Vm
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614101091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bC1sFQBMLn5b6BjzN78m9HWZvaiMOVLLjn3b6hL4plo=;
 b=ZqkHj212FksSEsH3qDV7XQCQu6CVNVnjoGe0FCSeTGk7Z2h2uBm+mxWTnl6waqu+/Kc1UT
 LhnKoHEk0t8VgjmFiPVfjd2/Ki0bbqh6zLgUh7KIOg39AriNhhZERWDQI7VEnsMAwca+nK
 2psEB5aULKZZ1t1OWXGX/VdjgIKqJh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-DqFPH3ZSMpqK_b2AmkqwJw-1; Tue, 23 Feb 2021 12:24:16 -0500
X-MC-Unique: DqFPH3ZSMpqK_b2AmkqwJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87649107ACF7;
 Tue, 23 Feb 2021 17:24:14 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AD345C8BE;
 Tue, 23 Feb 2021 17:24:11 +0000 (UTC)
Date: Tue, 23 Feb 2021 12:23:40 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v5 2/4] Jobs based on custom runners: build environment
 docs and playbook
Message-ID: <20210223172340.GD987581@amachine.somewhere>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-3-crosa@redhat.com>
 <87im6i4znx.fsf@linaro.org> <YDUWdeTcyf0Fwn/w@nautilus.local>
 <87a6ru4xs5.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87a6ru4xs5.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 03:17:24PM +0000, Alex Benn=E9e wrote:
>=20
> Erik Skultety <eskultet@redhat.com> writes:
>=20
> > On Tue, Feb 23, 2021 at 02:01:53PM +0000, Alex Benn=E9e wrote:
> >>=20
> >> Cleber Rosa <crosa@redhat.com> writes:
> >>=20
> >> > To run basic jobs on custom runners, the environment needs to be
> >> > properly set up.  The most common requirement is having the right
> >> > packages installed.
> >> >
> >> > The playbook introduced here covers the QEMU's project s390x and
> >> > aarch64 machines.  At the time this is being proposed, those machine=
s
> >> > have already had this playbook applied to them.
> >> >
> >> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> >> > ---
> >> >  docs/devel/ci.rst                      | 30 ++++++++++
> >> >  scripts/ci/setup/build-environment.yml | 76 +++++++++++++++++++++++=
+++
> >> >  scripts/ci/setup/inventory             |  1 +
> >> >  3 files changed, 107 insertions(+)
> >> >  create mode 100644 scripts/ci/setup/build-environment.yml
> >> >  create mode 100644 scripts/ci/setup/inventory
> >> >
> >> > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> >> > index 585b7bf4b8..a556558435 100644
> >> > --- a/docs/devel/ci.rst
> >> > +++ b/docs/devel/ci.rst
> >> > @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
> >> >  The GitLab CI jobs definition for the custom runners are located un=
der::
> >> > =20
> >> >    .gitlab-ci.d/custom-runners.yml
> >> > +
> >> > +Machine Setup Howto
> >> > +-------------------
> >> > +
> >> > +For all Linux based systems, the setup can be mostly automated by t=
he
> >> > +execution of two Ansible playbooks.  Start by adding your machines =
to
> >> > +the ``inventory`` file under ``scripts/ci/setup``, such as this::
> >> > +
> >> > +  fully.qualified.domain
> >> > +  other.machine.hostname
> >>=20
> >> Is this really needed? Can't the host list be passed in the command
> >> line? I find it off to imagine users wanting to configure whole fleets
> >> of runners.
> >
> > Why not support both, since the playbook execution is not wrapped by an=
ything,
> > giving the option of using either and inventory or direct cmdline invoc=
ation
> > seems like the proper way to do it.
>=20
> Sure - and I dare say people used to managing fleets of servers will
> want to do it properly but in the first instance lets provide the simple
> command line option so a user can get up and running without also
> ensuring files are in the correct format.
>

Like I said before, I'm strongly in favor of a more straightforward
documentation, instead of documenting multiple ways to perform the
same task.  I clearly believe that writing the inventory file (which
will later be used for the second gitlab-runner playbook) is the best
choice here.

Do you think the command line approach is clearer?  Should we switch?

Regards,
Cleber.

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmA1OhoACgkQZX6NM6Xy
CfNiaQ/6AwkPfwNGBWrEtMi1DRyZulorJ/7qTjtRdthq994Re9bX4mmKiWqxIM8h
px7AcFNthTRiBAamK8Jb0XwXhImrQJvTit6DmH0TEwxPRjWTI0auKpENIkq9PpJR
cXgQTZMB/dNt45XjU4d/qgpj2SVkFOBBiPi7nb+psQSreqGlI7I5m80Jnhqex7rO
olG6iin40u7VZEvouZ6IbmBtGgz7sn9g550i7B/MwNiU1uVybU5du7t/rtBTvHc/
+BDZl9xmmHEd904J3lY/Bx7L8v+g2K7mCN4hdrgC6+RHwPORCPUOgRQRPca5brXH
js8nnmpUoYyYG/bIIdzNKDsagNnfMRox1i4fC91BQMWZDb6ZMCHWZmR4tJhQjOj+
p0RcLjC+Nt6fRvdoiCWbTiVJf4K0bQZdabFUvyO8vfMWznwlf5D6018J9DO2KV9F
0ORkHxKy1X4z7mWmMYNuhb1X2XyLpshJ/EYPpkojNWb6YmsDKhQmyXVGit+YEsIi
P1JCvxq329sDz+59OxoSOatD0y6X2yb86tFrAEJUlocHsqrx82+zSjMZNs/zDFpJ
nTekrFIvCbZqrL3EWzPXOBjHW1T27pzfxWacNf6tRG0pr/bxbN+CpsBqaM/w5as0
D7UV6yYW1j5KlEDzU/iE3sSE5tnMo+SqpqTxKunRKiVPSOCnYww=
=o7To
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--


