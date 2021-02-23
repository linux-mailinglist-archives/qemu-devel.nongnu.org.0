Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322CD322FE7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:48:10 +0100 (CET)
Received: from localhost ([::1]:36044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbn6-0005oc-Mj
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEbkJ-0004ca-8D
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:45:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEbkH-0006wo-1L
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614102312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lpe1icLKtdw5hdSj69PQvoDW7RWCOuweyTvPkcMZFDI=;
 b=hnFwtJWKTD04hf9KRkH9Nj7K6dIqOZIPazwdBLuSrKymg/V12AdfdKJSdyczLcMgWCoUoX
 xdNVpJ2Bkp2MbIT3IxfhLkBWANg0KxUF9KRksk/AH/YW6RuGCR7+dToZUmnpRujPyBsSaB
 35rh3q6n1kxA5H8omGUiU9zYLdJDqoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-BH24EfZGMLyQr6FtUGwCew-1; Tue, 23 Feb 2021 12:45:07 -0500
X-MC-Unique: BH24EfZGMLyQr6FtUGwCew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47905100CCCA;
 Tue, 23 Feb 2021 17:45:06 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDD3D5D9D3;
 Tue, 23 Feb 2021 17:44:58 +0000 (UTC)
Date: Tue, 23 Feb 2021 12:44:31 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v5 2/4] Jobs based on custom runners: build environment
 docs and playbook
Message-ID: <20210223174431.GE987581@amachine.somewhere>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-3-crosa@redhat.com>
 <87im6i4znx.fsf@linaro.org> <87ft1m4yjw.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87ft1m4yjw.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3O1VwFp74L81IIeR"
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
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--3O1VwFp74L81IIeR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 03:01:50PM +0000, Alex Benn=E9e wrote:
>=20
> Alex Benn=E9e <alex.bennee@linaro.org> writes:
>=20
> > Cleber Rosa <crosa@redhat.com> writes:
> >
> >> To run basic jobs on custom runners, the environment needs to be
> >> properly set up.  The most common requirement is having the right
> >> packages installed.
> >>
> <snip>
> >
> > So I got somewhat there with a direct command line invocation:
> >
> >   ansible-playbook -u root -i 192.168.122.24,192.168.122.45 scripts/ci/=
setup/build-environment.yml -e 'ansible_python_interpreter=3D/usr/bin/pytho=
n3'
> >
> > although for some reason a single host -i fails...
> >
> >> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup=
/build-environment.yml
> >> new file mode 100644
> >> index 0000000000..0197e0a48b
> >> --- /dev/null
> >> +++ b/scripts/ci/setup/build-environment.yml
> >> @@ -0,0 +1,76 @@
> >> +---
> >> +- name: Installation of basic packages to build QEMU
> >> +  hosts: all
> >> +  tasks:
> >> +    - name: Update apt cache
> >> +      apt:
> >> +        update_cache: yes
> >> +      when:
> >> +        - ansible_facts['distribution'] =3D=3D 'Ubuntu'
> >
> > So are we limiting to Ubuntu here rather than say a Debian base?
>=20
> Also I'm getting:
>=20
>   TASK [Update apt cache] ***********************************************=
***************************************************************************=
***************************
>   fatal: [hackbox-ubuntu-2004]: FAILED! =3D> {"msg": "The conditional che=
ck 'ansible_facts['distribution'] =3D=3D 'Ubuntu'' failed. The error was: e=
rror while evaluating conditional (ansible_facts['distribution'] =3D=3D 'Ub=
untu'): 'dict object' has no attribute 'distribution'\n\nThe error appears =
to have been in '/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environmen=
t.yml': line 5, column 7, but may\nbe elsewhere in the file depending on th=
e exact syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n =
   - name: Update apt cache\n      ^ here\n"}
>=20
> which is odd given that machine is definitely an Ubuntu one.
>

It's defintely odd.  This is what I get on a fresh machine:

   TASK [Update apt cache] ************************************************=
*************************************************************************
   [WARNING]: Updating cache and auto-installing missing dependency: python=
3-apt
   ok: [localhost]

Could you please let me know the output of:

   $ ansible -m setup -u $YOUR_USERNAME -i $HOSTNAME, all | grep ansible_di=
stribution

Thanks,
- Cleber.

--3O1VwFp74L81IIeR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmA1Pv0ACgkQZX6NM6Xy
CfMDyhAAl/svXBzxXzSl3UHVttTmaVP2Sdwb6vcdeV19/0ngrf/WqmcN6TOdDYDy
oQCesHZJ8pnII2YLd4Nl6vptZoDaZLs9VLvacYLRJEBd7icMTFoMrHB98Fj+KzBC
WwKHsznRu7EjfeM840skIInewTYnDkRd6JUEqX23o+PvSmuqoS/5iwg/RiyuNYJq
Tq0WD8C6/HKySWmXTitLShI47sdGSOufaI1y1oRLMKGRRim+8drYZ5JhGCOYFC5r
Bv87aottUAFcaSEGmbltatVgdyXoMHc4ndSHVmkOTEQbuj2gcS5BgqGw99bTtA4f
MesU0sIs5bdyxzfKVaDH3Sux/4MBXqJoAxj6jBJSAOjuy6JtmzYw/ZZHatlZ04ui
oBIsLFPXWNrMPfhGtb/mC5J3Q+G58ZW8ANieutpP0M/4gCk61Dbohcb9K1srAmrs
WCAtJbrXZ1Bybgnxh7L2cD6MWrsspSjshqy2bA6H8qy6YpnClL+vw/LYxa82lqBj
L1lZZGnNVNsr0ZBlRYDf/okyKStVwsgoUC4aQrqcpsSRWxfHdxYXgWMyv5CIpNp3
QNpPB5bp/423lCpLoZv+b21FcEuEIeshQcVJ2HQVRDIX0P9W5c7MoQMJCaG54DSB
tSwJ7oazdjfyXD+geiqC40XwxDjXwa3ZWKSIztpefqOkiUhmcsY=
=Chri
-----END PGP SIGNATURE-----

--3O1VwFp74L81IIeR--


