Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5980135B8E8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 05:23:53 +0200 (CEST)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVnB1-0002sG-RL
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 23:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVnA2-0002SU-1n
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 23:22:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVn9z-0001ab-Jy
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 23:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618197766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2cuoFIDRtx7BlpXwmrqswah/i+1CJBKhvJjFOOsrzL4=;
 b=Y9MEb6+0sLSNyWRP3OSR7X+IA2WF8P70f/ns9KHCSaT8muXEd5qjnnKwAs5snykti8Gg9H
 qhCocb7uObBH/y/Qk9r1HitCxlF3l+nn32FMv6LFtGqdvAypUXyLtSuuxwilxkiyQc3Wuh
 3v30vwkN2kKSOpNQu2X+KpK2gSy+84o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-Y0qGgcXQNBGeVvv34S8vmg-1; Sun, 11 Apr 2021 23:22:44 -0400
X-MC-Unique: Y0qGgcXQNBGeVvv34S8vmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EE5F18397A0;
 Mon, 12 Apr 2021 03:22:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-37.rdu2.redhat.com
 [10.10.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED4C5163CE;
 Mon, 12 Apr 2021 03:22:30 +0000 (UTC)
Date: Sun, 11 Apr 2021 23:22:28 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v2 00/10] Acceptance Test: introduce base class for Linux
 based tests
Message-ID: <YHO89BlmaHL1wlhT@localhost.localdomain>
References: <20210323221539.3532660-1-crosa@redhat.com>
 <05118984-4a12-6cc5-ab84-a3a4953b535c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <05118984-4a12-6cc5-ab84-a3a4953b535c@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NeyEYfmyLFjwpUn9"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
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
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--NeyEYfmyLFjwpUn9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 04:45:51PM -0300, Wainer dos Santos Moschetta wrote=
:
> Hi,
>=20
> On 3/23/21 7:15 PM, Cleber Rosa wrote:
> > This introduces a base class for tests that need to interact with a
> > Linux guest.  It generalizes the "boot_linux.py" code, already been
> > used by the "virtiofs_submounts.py" and also SSH related code being
> > used by that and "linux_ssh_mips_malta.py".
>=20
> I ran the linux_ssh_mips_malta.py tests, they all passed:
>=20
> (11/34) tests/acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta=
32eb_kernel3_2_0:
> PASS (64.41 s)
> (12/34) tests/acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta=
32el_kernel3_2_0:
> PASS (63.43 s)
> (13/34) tests/acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta=
64eb_kernel3_2_0:
> PASS (63.76 s)
> (14/34) tests/acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta=
64el_kernel3_2_0:
> PASS (62.52 s)
>=20
> Then I tried the virtiofs_submounts.py tests, it finishes with error.
> Something like that fixes it:
>=20
> diff --git a/tests/acceptance/virtiofs_submounts.py
> b/tests/acceptance/virtiofs_submounts.py
> index d77ee35674..21ad7d792e 100644
> --- a/tests/acceptance/virtiofs_submounts.py
> +++ b/tests/acceptance/virtiofs_submounts.py
> @@ -195,7 +195,7 @@ def setUp(self):
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0 self.run(('ssh-keygen', '-N', '', '-t', 'ed25519=
', '-f',
> self.ssh_key))
>=20
> -=A0=A0=A0=A0=A0=A0=A0 pubkey =3D open(self.ssh_key + '.pub').read()
> +=A0=A0=A0=A0=A0=A0=A0 pubkey =3D self.ssh_key + '.pub'
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0 super(VirtiofsSubmountsTest, self).setUp(pubkey)
>=20

Hi Wainer,

Yes, thank you so much for catching that and proposing a fix.  I'm
adding to the v3 of this series.

Thanks again!
- Cleber.

--NeyEYfmyLFjwpUn9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmBzvPEACgkQZX6NM6Xy
CfMXyg//QHSJPOH4LmN3uiWh4mwuU6lWPx4iZ3/3TKXpjolpTAh3Zmo/xQBlVAZD
lJNu+ggf2QaWz51LHU0LSex34bAJSuAqGQD+T9BTzDWnVpMHBgZVP8WS45cvKRA8
4jlsTskRqZDtZ3WFDJ7sUZIaSOwDOy8QQK0eVmyBT+byA56PYRMqFEqkR+XFDVZE
oNWXZlg0nF7N6hbuhPlEedqwmQdDu6TBIZ8LDPbXYOsXZiaX7nrVTQDdGRvDHk+f
KRBZeJuo9CiMhG35EFxrTw6KBRAqVQ/Bi7AJ+4s8Vw4Sr3bhDWCUzzI7PFhCWmn9
6VMCLmG5kgPtDS9h3F1nq2KYJxgF+9IHpPOdlG72lbOIrV1KMvsESRDhZGItlbDr
lnkT7GVJBjyTt1Vjo2mS0qjZQ+xEehzrIzmFjNwC+JoZZnK38n+Rr9dSbGkGiE9T
DXy3Xa1wx7LcY9KoWq8ni/BV4tRmmPCxMbZBHdkb7H8jVzUMR+NQl6RijmTXVquu
HXZVY74AjGUhHTvUoFVLCFouvFr4yYEAC97tGZr0zlMBLxbulVlKQ9H/Y49RQEhY
QCYH18J3Lw/ybiaeA85ov6Y9U4k+7SnRa8Odnw5n8K1W2RtoSUQjafD6VeOPm0Wz
CVFHVyaRJzkAAUgM6lJV1o40vIK7/n7frHM0VkcgAX1X1YmLYd8=
=9HdB
-----END PGP SIGNATURE-----

--NeyEYfmyLFjwpUn9--


