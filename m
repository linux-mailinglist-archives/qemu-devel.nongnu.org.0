Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18254346B71
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:56:57 +0100 (CET)
Received: from localhost ([::1]:47820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOp1E-000600-3N
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOoyv-000367-KE
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:54:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOoyu-0001XE-3J
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:54:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nHaOAcSo0BnjXQO2swE326wEHfraayPhAn7b95FDv8s=;
 b=CSEm0zQYRuz3aFRBbQCBBAmD0RVq3n+dm5VGYLSmcgpSeINJ9gZuBOjEcO0Sms6dogeUis
 g0vr4qE9BYOZJmhFdDakJ5ZIIFyJGf8v9i161F9oQCc4n9VELbgScfhoRcKbytej4Cx4W2
 qZC1hT2N243gDqu3b56JfGkeoRSLYaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-rrbwaBMFN8iXeE2RxVSujg-1; Tue, 23 Mar 2021 17:54:28 -0400
X-MC-Unique: rrbwaBMFN8iXeE2RxVSujg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65A0C107ACCD;
 Tue, 23 Mar 2021 21:54:27 +0000 (UTC)
Received: from localhost (ovpn-119-39.rdu2.redhat.com [10.10.119.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40AF81980D;
 Tue, 23 Mar 2021 21:54:19 +0000 (UTC)
Date: Tue, 23 Mar 2021 13:56:11 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 19/22] Acceptance Tests: add port redirection for ssh by
 default
Message-ID: <20210323175611.GA3463681@amachine.somewhere>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-20-crosa@redhat.com>
 <e0f187b2-8cc2-f187-a44c-e9448cbe5fc2@redhat.com>
 <2acf7e3a-0fc3-fe63-5af2-c49e5053fbe5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2acf7e3a-0fc3-fe63-5af2-c49e5053fbe5@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 06:51:42PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/3/21 6:46 PM, Philippe Mathieu-Daud=E9 wrote:
> > On 2/3/21 6:23 PM, Cleber Rosa wrote:
> >> For users of the LinuxTest class, let's set up the VM with the port
> >> redirection for SSH, instead of requiring each test to set the same
> >> arguments.
> >>
> >> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> >> ---
> >>  tests/acceptance/avocado_qemu/__init__.py | 2 ++
> >>  tests/acceptance/virtiofs_submounts.py    | 4 ----
> >>  2 files changed, 2 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/accepta=
nce/avocado_qemu/__init__.py
> >> index 5f4dd6b9ec..89669cc604 100644
> >> --- a/tests/acceptance/avocado_qemu/__init__.py
> >> +++ b/tests/acceptance/avocado_qemu/__init__.py
> >> @@ -301,6 +301,8 @@ class LinuxTest(Test, LinuxSSHMixIn):
> >>          super(LinuxTest, self).setUp()
> >>          self.vm.add_args('-smp', '2')
> >>          self.vm.add_args('-m', '1024')
> >> +        self.vm.add_args('-netdev', 'user,id=3Dvnet,hostfwd=3D:127.0.=
0.1:0-:22',
> >> +                         '-device', 'virtio-net,netdev=3Dvnet')
> >=20
> > You need a machine with a virtio-bus to be able to plug a virtio device=
,
> > not all provide one.
>

Very true.

> Alternatively you could provide a network_device_type argument to
> setUp() which has to be explicitly set (since the tests would be
> pointless without network access).
>

Sure, I'll add the capability to configure the device type on v2.

Thanks!
- Cleber.
--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBaK7gACgkQZX6NM6Xy
CfN89w/+OC8l1q9uP1WAjjMDs1jkbk3HNhAEYj3SSCe1nZM5OrddcnOYDt/URG4E
49wvDmwMRZmJ687SsfjwqCqVL7TAaNcZp0cDOLkvjwROK4yZX9NNg/IrSHalw0Lu
yJuZ35F3oUEFN1LU6IEpCp3fB/CwnIYoVD8YIyCpF98zuzhaTmlY25caeqEoumT/
lSafuVpy9/EAa5hiAh4BnhsQwBeXW7jp3QOd9v8nzm5VyYZ7FflbsYHEiNmrhcb7
OIQBLWlOhTCOJNTFFtGQ/KGckWOs8LiTm9rw2ulPt1ZeK4BryKMvbWTRo59xNs4I
ogBM8SMNqhNvaEEzayrvPI7R5SyUHc3snN4QNpuIW17vwhX5YZB6/j91ZLSbNPFL
6HLIyVt8mpzx9LZJJwEYlsiiQFEPTfY6ahhpNqMU1fDbRdh75DqgGFN45yJoGWKW
daJt+WdWfaEWlWMSTuQB5Q64VsjtZt4tNxA2Pxikg1jHCSp48ia54R68yfYDyF8N
G7t823XgwS8iY/Hx3VkXAH7Mt7Jk4SbD0+4ayVs475tNDxwcoIy/D3EJEyuOoEdT
zYK0MPdMU+1Uknq1djQZzEP6zmJEI4eqPIrtPV6IursT78thEyvyj8RoNWyGSsKh
p3FyH5pHe7afEydDgiWgtHr9G8cqUj5fFhysAvrijBXWsHmlxUY=
=DQzk
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--


