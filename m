Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1E7348538
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 00:21:11 +0100 (CET)
Received: from localhost ([::1]:56630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPCoI-0005er-5e
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 19:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCgc-0000fY-Jg
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:13:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lPCga-0001k9-UZ
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 19:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616627592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kBGD49iJqtTclhgI0p++X1T32eD+TEzMGN/D7dO/Jrs=;
 b=WhX0tj6qtyvVQ5PgS73bS7nF0Op7KcDcQ73hGRULjSrd6w4sJxyvsOs5uEWowOghkXsJ0S
 2iQ8UuLa21dgBJUlQz8VtX8RqVh+EkyPYdQ3XXXysGL/+teU0ZdXD/A07E4FqGAO2FVtuQ
 ET0/21/74+ule2zYshpJCpxeSzOdHZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-BTL7K1xAOJG1vw0_LBhBcg-1; Wed, 24 Mar 2021 19:13:07 -0400
X-MC-Unique: BTL7K1xAOJG1vw0_LBhBcg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 795C418C89CC;
 Wed, 24 Mar 2021 23:13:06 +0000 (UTC)
Received: from localhost (ovpn-119-39.rdu2.redhat.com [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3937E866F3;
 Wed, 24 Mar 2021 23:12:51 +0000 (UTC)
Date: Wed, 24 Mar 2021 18:40:59 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v2 05/10] Acceptance Tests: add port redirection for ssh
 by default
Message-ID: <20210324224059.GE3592254@amachine.somewhere>
References: <20210323221539.3532660-1-crosa@redhat.com>
 <20210323221539.3532660-6-crosa@redhat.com>
 <8b620ceb-f056-799e-93c4-02df3559e019@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8b620ceb-f056-799e-93c4-02df3559e019@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UnaWdueM1EBWVRzC"
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Eric Auger <eauger@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--UnaWdueM1EBWVRzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 11:36:53AM +0100, Auger Eric wrote:
> Hi Cleber,
> On 3/23/21 11:15 PM, Cleber Rosa wrote:
> > For users of the LinuxTest class, let's set up the VM with the port
> > redirection for SSH, instead of requiring each test to set the same
> > arguments.
> >=20
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  tests/acceptance/avocado_qemu/__init__.py | 4 +++-
> >  tests/acceptance/virtiofs_submounts.py    | 4 ----
> >  2 files changed, 3 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptan=
ce/avocado_qemu/__init__.py
> > index 67f75f66e5..e75b002c70 100644
> > --- a/tests/acceptance/avocado_qemu/__init__.py
> > +++ b/tests/acceptance/avocado_qemu/__init__.py
> > @@ -309,10 +309,12 @@ class LinuxTest(Test, LinuxSSHMixIn):
> >      timeout =3D 900
> >      chksum =3D None
> > =20
> > -    def setUp(self, ssh_pubkey=3DNone):
> > +    def setUp(self, ssh_pubkey=3DNone, network_device_type=3D'virtio-n=
et'):
> I would be interested in testing with HW bridging too, when a bridge is
> available. Do you think we could have the netdev configurable too?
> This would be helpful to test vhost for instance.
>

Right, I knew from the start that the user mode network would only
go so far.  TBH, I think it went too further than I expected.  But,
requiring, or supporting, other network modes can add quite a bit
of complexity, depending on how much you want the framework to do.

Anyway, this is a valid point/request.  For the lack of a better place,
and given that this may be a larger effort, I'm tracking it here:

  https://gitlab.com/cleber.gnu/qemu/-/issues/3

> With respect the network device type, I am currently working on SMMU
> test and I need to call the parent setUp-) with the following args now:
>=20
> super(IOMMU, self).setUp(pubkey,
> 'virtio-net-pci,iommu_platform=3Don,disable-modern=3Doff,disable-legacy=
=3Don')
>=20
> It works but I am not sure you had such kind of scenario in mind?
>

I see where you're coming from, and I share the slight feeling of abusing
the feature... but I think it's OK at this point.  I mean, I believe it's
better to focus on say, the HW bridging support as this at least works.

> Thanks
>=20
> Eric
>

Cheers,
- Cleber.

--UnaWdueM1EBWVRzC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBbv/kACgkQZX6NM6Xy
CfOnYA/8CUEgv2vImhUhmuyzbzB1mDTwG9alevLWGgQGDGx5obyFk5FEa6bBSaMd
gt4pyf8fIPFwQuu3ZonzpXNzG2ilVY8/QD33TKU7AFFYk8iC8SpyRF4A+QleEYco
6eHlSbM2quPCpK4VSUsN7jW53BgrMaR4dDkbk0ikcZoIch4Uut4ORP9VcN/9vswd
pzoj8nRwjOiebdxeyrdNrtQQN0BoMDdB9FqTxz2CMjV35GUFyZtKJOm3aAkesnQB
AT33VhN0EfTRnn/oDbZ71is4SjOlhvolY0XIX6GRk5kLpN0lfp9hnzRuChgVD0Vp
rKbhmZRRKviJmQFO4mKUtCjlQSLi5FvkfLB6zN91KIzftyZT1+qUsGKoN1bm8Zsb
njLza3j+yMWo+WDYOf77QB/9Lr1gKE4zABn2Jeon6FeGou3Lit1BreUOa0rtAIZf
3jOK1+CgTXsxMAnB3YpJHrEw9MNZW2SfnY4L7WdLr1IZ+h99XA+tpShDBAldUl90
64S/VsQODVWLlCFYzLTiU7j7GeZs/vUNY3oZhOEjsLDG+xU9o07n5OryH7ATbdkJ
jayOeMqbe9xVmN7ztNIZWMwRnL5n+EY8nBEXKq18OyAo3twmf6394NxjlKvpl38s
WYE8gFpwUITGS+arwKXHuAJr7/3lIrqTi4jVY7cwVyZdlTK9Usw=
=i/Sj
-----END PGP SIGNATURE-----

--UnaWdueM1EBWVRzC--


