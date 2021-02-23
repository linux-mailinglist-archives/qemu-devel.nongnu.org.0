Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC6322F7B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:19:50 +0100 (CET)
Received: from localhost ([::1]:58104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbLh-0006jM-Ix
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEbH7-0005GG-9z
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:15:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEbH4-0001kA-ST
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614100500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LXCmwur96asVa4Lv3nPVPbSr32rwuALexeFrbhj9lcU=;
 b=auHnloxFMumuMdn87GXi/w2YFxro/AUcj62tmi76WP7Q0dFk1uJM994QungyQ+nLYEc98w
 FhBDcuXSJNbRIvuh80JyomHCQsecwQQE283SQLnIuu5hWfhchDVjeY55FDWjgNMfePEXsh
 uLfWxlRJyfXs5ZAgoeCA7YDEVaFK7cU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-xQyXaIevNGO9qRTfAQ7iRA-1; Tue, 23 Feb 2021 12:13:56 -0500
X-MC-Unique: xQyXaIevNGO9qRTfAQ7iRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A04F801983;
 Tue, 23 Feb 2021 17:13:55 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5E0860C04;
 Tue, 23 Feb 2021 17:13:51 +0000 (UTC)
Date: Tue, 23 Feb 2021 12:08:51 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v5 2/4] Jobs based on custom runners: build environment
 docs and playbook
Message-ID: <20210223170851.GB987581@amachine.somewhere>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-3-crosa@redhat.com>
 <87im6i4znx.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87im6i4znx.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
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

--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 02:01:53PM +0000, Alex Benn=E9e wrote:
>=20
> Cleber Rosa <crosa@redhat.com> writes:
>=20
> > To run basic jobs on custom runners, the environment needs to be
> > properly set up.  The most common requirement is having the right
> > packages installed.
> >
> > The playbook introduced here covers the QEMU's project s390x and
> > aarch64 machines.  At the time this is being proposed, those machines
> > have already had this playbook applied to them.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  docs/devel/ci.rst                      | 30 ++++++++++
> >  scripts/ci/setup/build-environment.yml | 76 ++++++++++++++++++++++++++
> >  scripts/ci/setup/inventory             |  1 +
> >  3 files changed, 107 insertions(+)
> >  create mode 100644 scripts/ci/setup/build-environment.yml
> >  create mode 100644 scripts/ci/setup/inventory
> >
> > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
> > index 585b7bf4b8..a556558435 100644
> > --- a/docs/devel/ci.rst
> > +++ b/docs/devel/ci.rst
> > @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
> >  The GitLab CI jobs definition for the custom runners are located under=
::
> > =20
> >    .gitlab-ci.d/custom-runners.yml
> > +
> > +Machine Setup Howto
> > +-------------------
> > +
> > +For all Linux based systems, the setup can be mostly automated by the
> > +execution of two Ansible playbooks.  Start by adding your machines to
> > +the ``inventory`` file under ``scripts/ci/setup``, such as this::
> > +
> > +  fully.qualified.domain
> > +  other.machine.hostname
>=20
> Is this really needed? Can't the host list be passed in the command
> line? I find it off to imagine users wanting to configure whole fleets
> of runners.
>

No, it's not needed.

But, in my experience, it's the most common way people use
ansible-playbook.  As with all most tools QEMU relies on, that are
many different ways of using them.  IMO documenting more than one way
to perform the same task makes the documentation unclear.

> > +
> > +You may need to set some variables in the inventory file itself.  One
> > +very common need is to tell Ansible to use a Python 3 interpreter on
> > +those hosts.  This would look like::
> > +
> > +  fully.qualified.domain ansible_python_interpreter=3D/usr/bin/python3
> > +  other.machine.hostname ansible_python_interpreter=3D/usr/bin/python3
> > +
> > +Build environment
> > +~~~~~~~~~~~~~~~~~
> > +
> > +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
> > +set up machines with the environment needed to perform builds and run
> > +QEMU tests.  It covers a number of different Linux distributions and
> > +FreeBSD.
> > +
> > +To run the playbook, execute::
> > +
> > +  cd scripts/ci/setup
> > +  ansible-playbook -i inventory build-environment.yml
>=20
> So I got somewhat there with a direct command line invocation:
>=20
>   ansible-playbook -u root -i 192.168.122.24,192.168.122.45 scripts/ci/se=
tup/build-environment.yml -e 'ansible_python_interpreter=3D/usr/bin/python3=
'
>

Yes, and the "-e" is another example of the multiple ways to achieve
the same task.

> although for some reason a single host -i fails...
>=20
> > diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/=
build-environment.yml

It requires a comma separated list, even if it's a list with a single
item:

   https://docs.ansible.com/ansible/latest/cli/ansible-playbook.html#cmdopt=
ion-ansible-playbook-i

> > new file mode 100644
> > index 0000000000..0197e0a48b
> > --- /dev/null
> > +++ b/scripts/ci/setup/build-environment.yml
> > @@ -0,0 +1,76 @@
> > +---
> > +- name: Installation of basic packages to build QEMU
> > +  hosts: all
> > +  tasks:
> > +    - name: Update apt cache
> > +      apt:
> > +        update_cache: yes
> > +      when:
> > +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
>=20
> So are we limiting to Ubuntu here rather than say a Debian base?
>

You have a point, because this would certainly work and be applicable
to Debian systems too.  But, this is a new addition on v5, and I'm
limiting this patch to the machines that are available/connected right
now to the QEMU project on GitLab.

I can change that to "distribution_family =3D=3D Debian" if you think
it's a good idea.  But IMO it'd make more sense for a patch
introducing the package list for Debian systems to change that.

> > +
> > +    - name: Install basic packages to build QEMU on Ubuntu 18.04/20.04
> > +      package:
> > +        name:
> > +        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
> > +          - ccache
> > +          - clang
> > +          - gcc
> > +          - gettext
> > +          - git
> > +          - glusterfs-common
> > +          - libaio-dev
> > +          - libattr1-dev
> > +          - libbrlapi-dev
> > +          - libbz2-dev
> > +          - libcacard-dev
> > +          - libcap-ng-dev
> > +          - libcurl4-gnutls-dev
> > +          - libdrm-dev
> > +          - libepoxy-dev
> > +          - libfdt-dev
> > +          - libgbm-dev
> > +          - libgtk-3-dev
> > +          - libibverbs-dev
> > +          - libiscsi-dev
> > +          - libjemalloc-dev
> > +          - libjpeg-turbo8-dev
> > +          - liblzo2-dev
> > +          - libncurses5-dev
> > +          - libncursesw5-dev
> > +          - libnfs-dev
> > +          - libnss3-dev
> > +          - libnuma-dev
> > +          - libpixman-1-dev
> > +          - librados-dev
> > +          - librbd-dev
> > +          - librdmacm-dev
> > +          - libsasl2-dev
> > +          - libsdl2-dev
> > +          - libseccomp-dev
> > +          - libsnappy-dev
> > +          - libspice-protocol-dev
> > +          - libssh-dev
> > +          - libusb-1.0-0-dev
> > +          - libusbredirhost-dev
> > +          - libvdeplug-dev
> > +          - libvte-2.91-dev
> > +          - libzstd-dev
> > +          - make
> > +          - ninja-build
> > +          - python3-yaml
> > +          - python3-sphinx
> > +          - sparse
> > +          - xfslibs-dev
> > +        state: present
> > +      when:
> > +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
> > +
> > +    - name: Install packages to build QEMU on Ubuntu 18.04/20.04 on no=
n-s390x
> > +      package:
> > +        name:
> > +          - libspice-server-dev
> > +          - libxen-dev
> > +        state: present
> > +      when:
> > +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
> > +        - ansible_facts['architecture'] !=3D 's390x'
> > diff --git a/scripts/ci/setup/inventory b/scripts/ci/setup/inventory
> > new file mode 100644
> > index 0000000000..2fbb50c4a8
> > --- /dev/null
> > +++ b/scripts/ci/setup/inventory
> > @@ -0,0 +1 @@
> > +localhost
>=20
> I'm not sure we should have a default here because it will inevitably
> cause someone to do something to their machine when trying to setup a
> runner.
>

Fair enough.  Then I see two options:

1) follow the vars.yml.template example and only ship a
   inventory.template file

2) use a placeholder with an impossible hostname such as
   "my-qemu-runner.example.org" or "your-host-name-here"

> --=20
> Alex Benn=E9e
>=20

Let me know what you think is more reasonable, and thanks for the
review!

Regards,
- Cleber.

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmA1NqEACgkQZX6NM6Xy
CfPbXxAAzP14jK6K6fWUkq3vpshoihZIkmlXmxlx1eJLUsGVe11SxnPg+7OO6cNT
jfYjGr6bKsA/rB3LzQ35Pw9THyr9EW7CBEUw60kdOqM57fRd5jF37NlP9E/l5NqG
FdKJPUdej5vgR4qP/snSPySyxujXWIV6Qn79eFCLoTrZvPVpdsWxtHA77BO0G2MR
nZz9BoTRU6JFACKS6Hw8fh3HYUIndK+huZ2C4BvcHtwvoiRe4DM+R7QdG9ZwtO8U
aL4EEGkPuaQVML/QjvX9R7mlVtWVZwc7+qsQ5avNpYdH1omKV3CUUF1D74oDH/Mi
3iK2eY3qn4mAu7tE4TSY8H4CE5SlHp+e9hd2Q42lefjVvN5DDSlrKQPegN62KMUj
MYZngK4iO+HdN5QhQOsdpO8pHbouBU7E+qmEdx2ken3v5o7nX2bjdCmIJd+t9YGE
beLUsrI3qWglCdyeFP4A2Na4ZBFgdW0xpyna2DlwcWquuLhOKRou/JRLVPk1mUe1
CKbeQNuj0uYh0m563m2tSKGe54NOqnW0i+IZhKC9PepKHAiuQOfJoPWRkp5eniqB
GjASWPyWEjYbQNoxRqb4lfddRe/vLBj9/sbclIX1JZX8hf0WHHLYcW6LftWKLHMk
EQa80oxauu226bxuhiwHqNXp711LjcqKZzmQUH3zAxijHovr9rs=
=9ofW
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--


