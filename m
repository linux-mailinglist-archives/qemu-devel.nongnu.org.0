Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AA831C10F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 18:58:42 +0100 (CET)
Received: from localhost ([::1]:41330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBi8v-0004IE-Bw
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 12:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBi7Z-0003rf-Aa
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:57:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBi7W-0004O2-8n
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:57:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613411833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NzKpPej4oZ9KzdDxeOfhvFyebhtyrKOFHTV8D6tCj1M=;
 b=RiIejA4ZN3ch/xaggyTDyvZpQraLmd3VI1wG7o/UjK4d7Zx6oiLjd1EPID4+goLQp7FIiO
 xtQuezLRbbcXpbx7UkNFW5CY9QFasg5W1awAOYNZrknDRk4xMlT4l80GmBKZBhK10NIVum
 ZLS04ooL4/uGUozClEKrCAKLdJA1qqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-en3peMaFMVCNZF2GwPxmsw-1; Mon, 15 Feb 2021 12:57:08 -0500
X-MC-Unique: en3peMaFMVCNZF2GwPxmsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACBB5801962;
 Mon, 15 Feb 2021 17:57:06 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E98E31002382;
 Mon, 15 Feb 2021 17:56:58 +0000 (UTC)
Date: Mon, 15 Feb 2021 12:56:57 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 07/22] tests/acceptance/virtiofs_submounts.py: evaluate
 string not length
Message-ID: <20210215175657.GB72984@localhost.localdomain>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-8-crosa@redhat.com>
 <8735ycq80u.fsf@linaro.org>
 <2c1a58b2-e023-4aca-16c7-c850f6069657@redhat.com>
 <87k0rha2mu.fsf@linaro.org>
 <2bacef90-7533-d439-cf7d-8fba51e64c1a@redhat.com>
 <87h7ml9z7g.fsf@linaro.org>
 <a64bac47-ac2a-f708-239a-5b17fa365eb7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a64bac47-ac2a-f708-239a-5b17fa365eb7@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 06:15:26PM +0100, Philippe Mathieu-Daud=E9 wrote:
> >=20
> > I've actually done this with some Xen patches I'm working on at the
> > moment. I'll probably decorate the test with:
> >=20
> >   @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted cod=
e')
> >=20
> > with a comment explaining what's waiting to be upstreamed. Once there
> > are upstream binaries I plan on transitioning the test to those.
>=20
> Instead of a binary AVOCADO_ALLOW_UNTRUSTED_CODE variable, we could
> have a list allowed domains/namespaces, that can be increased on the
> tester discretion.
>=20
> For example these are assumed trusted:
>=20
> . archives.fedoraproject.org
> . archive.debian.org
> . cdn.netbsd.org
> . github.com/torvalds
> . people.debian.org/~aurel32
> . snapshot.debian.org
> . storage.kernelci.org
> . www.qemu-advent-calendar.org
>=20
> Then personally interested in testing ARM boards I'd amend:
>=20
> . apt.armbian.com
> . github.com/philmd
> . github.com/groeck
> . github.com/hskinnemoen
> . github.com/pbatard
>=20
> and Max's repo since I'm interested in testing virtiofs_submounts.
>=20

Hi Phil,

I think I follow your idea, but I see two issues here:

 1) Functional area (subsystem / architecture / machine type, etc)
 2) Trustfulness of the code

WRT 1, the domains do not contain meaning onto themselves, so a
secondary mapping of subsystem/architecture/machine to the domain
would be needed.  Also, wouldn't it be common to end up needing a N:N
mapping between domains and subsystem/architecture/machine?

WRT 2, while limiting download from a number of domains can add some
protection, the ultimate trust is achieved by setting a hash to the
exact code we will download/run.

If those points seem valid, then I believe it's better to continue
thinking of subsystem/architecture/machine because of the usability
aspects, and possibly improve the perceived level of trust/stability
of the assets by adding a "tier" classification.  That one, one could
pick, say:

 * board|machine_type =3D=3D "foo" AND
 * tier =3D=3D 1

And exclude what is considered inferior tiers.  How does that sound?

Regards,
- Cleber.

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAqteYACgkQZX6NM6Xy
CfP5mQ//VbSbqB5ddPI52xXCpigAeFuEXFUJB9BupSsOVq0pzyoC/DbH2KRN+mMS
DVN0YA5ybQh7BOhg+nworAec88GxZXW/YwuwIIqmhghp4yFQHEc6smXLzIlxeMbT
o+YEecw3I3MaD7c4tuioYzPWoZMbO+fkJXJgQwF9SeyGu00xhLuHZkK6u55ro81s
nv0O0C2iBa5Hv91OZdGARd1pcj4eaOGjmHrHV2l9wrJ3goaQijEaFanvehOVPmPM
a5VUDkajn3iorh03G5mM9g+PzItdSphTZaTDAAqQdE2q2EWw07ORx4OMNcuQDYmY
zpkFyYGhkkDgUVIM0zRlVg9kbj0RXSk82uMNy0v2U89BOGaHYR4tx5MSYXOQFY37
5UGHJGshAOP7/7gkGGgC4iN+iQsmzfmGlxzrLuXj3AWp6dOtncy99hW3/nwG4uVS
7Oxy+v8EQiuAoRjImoJL2ue8ebRzieSM/Vz4B5R9L50imKjL3XnGcbELHKWQt7Ck
5idN5wxlP5aexquQ/R237/UzOz/SrUU8OgfisG7RfLnYMk1O2rzl6eQSwu2JGtnd
7YZp8Wk0Rtm4nZmYYWxERF5zNHVCkdQvpbhD34w1QzbN53bMsv4xUYoPXIp7qidh
I4njUcS0HRvVL8zORk21tQbdyE9Pu5Dutffs2O6nZn4KFS39Oj8=
=hWAo
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--


