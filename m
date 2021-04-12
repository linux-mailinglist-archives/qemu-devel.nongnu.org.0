Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5903835B8BE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 04:49:07 +0200 (CEST)
Received: from localhost ([::1]:59004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVmdN-0006Vu-F5
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 22:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVmcX-000659-C6
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 22:48:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVmcS-0005kJ-Qs
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 22:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618195687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=88KpTMnpJjtptRhaHMbjsiTCEk62O5IEIHVd1sTey74=;
 b=WSSGQa3g5iKCtE695iKLHzjlrbZm3EN8tpaDtyKeSZn+kzU/sXno7f/KQj7O8p1EoJL+LO
 j2qyjiUI8kO7C1ALRRDCyGy+4YwZY13jejD0bCdjlg4ooMcA3CDDDJjbydhTqVz6nLtYQp
 DXfYXpMEj4JVZKhAQgPmkWlOg5+pICU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-nBadhm4dPQWls9VfFIDdew-1; Sun, 11 Apr 2021 22:48:03 -0400
X-MC-Unique: nBadhm4dPQWls9VfFIDdew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10FDA107ACC7;
 Mon, 12 Apr 2021 02:48:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-37.rdu2.redhat.com
 [10.10.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9221100164A;
 Mon, 12 Apr 2021 02:47:50 +0000 (UTC)
Date: Sun, 11 Apr 2021 22:47:48 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 05/10] Acceptance Tests: add port redirection for ssh
 by default
Message-ID: <YHO01FJoJBRATL5S@localhost.localdomain>
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-6-crosa@redhat.com>
 <3d9fc9c8-d6ac-2829-9ddb-6484142463d0@redhat.com>
 <cad0fb8c-5cab-023d-b55c-9ddeb3659b55@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cad0fb8c-5cab-023d-b55c-9ddeb3659b55@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p4iS92W1VVI1EVcy"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--p4iS92W1VVI1EVcy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 02:57:48PM -0300, Wainer dos Santos Moschetta wrote=
:
> Hi,
>=20
> On 3/24/21 6:10 AM, Auger Eric wrote:
> > Hi Cleber,
> >=20
> > On 3/23/21 11:15 PM, Cleber Rosa wrote:
> > > For users of the LinuxTest class, let's set up the VM with the port
> > > redirection for SSH, instead of requiring each test to set the same
> > also sets the network device to virtio-net. This may be worth mentionin=
g
> > here in the commit msg.
> > > arguments.
> > >=20
> > > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> >=20
> > Thanks
> >=20
> > Eric
> >=20
> > > ---
> > >   tests/acceptance/avocado_qemu/__init__.py | 4 +++-
> > >   tests/acceptance/virtiofs_submounts.py    | 4 ----
> > >   2 files changed, 3 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/accept=
ance/avocado_qemu/__init__.py
> > > index 67f75f66e5..e75b002c70 100644
> > > --- a/tests/acceptance/avocado_qemu/__init__.py
> > > +++ b/tests/acceptance/avocado_qemu/__init__.py
> > > @@ -309,10 +309,12 @@ class LinuxTest(Test, LinuxSSHMixIn):
> > >       timeout =3D 900
> > >       chksum =3D None
> > > -    def setUp(self, ssh_pubkey=3DNone):
> > > +    def setUp(self, ssh_pubkey=3DNone, network_device_type=3D'virtio=
-net'):
> > >           super(LinuxTest, self).setUp()
> > >           self.vm.add_args('-smp', '2')
> > >           self.vm.add_args('-m', '1024')
> > > +        self.vm.add_args('-netdev', 'user,id=3Dvnet,hostfwd=3D:127.0=
.0.1:0-:22',
> > > +                         '-device', '%s,netdev=3Dvnet' % network_dev=
ice_type)
> > >           self.set_up_boot()
> > >           if ssh_pubkey is None:
> > >               ssh_pubkey, self.ssh_key =3D self.set_up_existing_ssh_k=
eys()
> > > diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptanc=
e/virtiofs_submounts.py
> > > index bed8ce44df..e10a935ac4 100644
> > > --- a/tests/acceptance/virtiofs_submounts.py
> > > +++ b/tests/acceptance/virtiofs_submounts.py
> > > @@ -207,10 +207,6 @@ def setUp(self):
> > >               self.vm.add_args('-kernel', vmlinuz,
> > >                                '-append', 'console=3DttyS0 root=3D/de=
v/sda1')
> > > -        # Allow us to connect to SSH
>=20
> Somewhat related with Eric's suggestion: keep the above comment along wit=
h
> the netdev setup code.
>=20
> - Wainer
>

Sure, good point.

Thanks,
- Cleber.

--p4iS92W1VVI1EVcy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBztNEACgkQZX6NM6Xy
CfNfOw/+MmT8SaOWIJBvN+tafh5uUl9/366VtSn9dzSAei+FUk7n6Jv/4BJQgjDd
HRg72DOjCcQJ0AD2+BSdC4rbiFZJhsaFpRTgrH/zSl6YvX3JKfcCrjRj7pF69k2+
AgvgcQrvoLJCtDoU47wILzS5E2Duf93eRDGRusoJocKwVdner5ZCzs1pdjvIIaiE
UIg5yELxIiJYP+ULCJQW4tLtBEcCEvb45+f0AsLxGZ1ik+DNP8TA18Abt3SXESpQ
KGflt0lhWqXjqHwfXuv0wQ1jDPMDsEnks3eWcOgOzn6kazI5i+t//0KJ/ii4NwOn
9izlZuDgzLAaGKdDyoF4SqGmsfyrd+Pkqwwlkoso2icVtkjzlt0FtdnXtpK9WbMH
DZsXx0hJKk/FSKOFwLlCLNtyFytObJxOnwr0mrM07Ef2ORK+FN6RLRz6WQuUxmqc
P8abCTzmjRaGvbOhV+fjVh5xWmgOC7/zJuTG/0FgXyh1o8kJorq26cLDD5mkZ3fR
TNvGlDUkgIdIHlB2F/KqD4GWj0UMtINoMvG1zI2+CdFULB4V6P7w+M29FGcpXT6t
PvZKkcPcgCt0sufisSx4ZIR8tA++qtQsmWdfFdi0Lrb2CLpaFIqKwk47RmQIEKSY
hDnsh+3PiGGLXp8dKKy81bl6IK1zsHOTUHP05ejCADzHhAfNkco=
=D29Z
-----END PGP SIGNATURE-----

--p4iS92W1VVI1EVcy--


