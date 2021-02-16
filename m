Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43CB31C5DF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 04:36:15 +0100 (CET)
Received: from localhost ([::1]:32884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBr9q-0006pN-OZ
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 22:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBr8w-0006Pe-Cu
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 22:35:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBr8u-0003bl-Ke
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 22:35:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613446515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dxFygnuh3DG4PokyFn5//ceUtyM22APwVV8Du8Du6oA=;
 b=eBCjw8Au2RS3yqaYQf16hZ+fs1mlCjRwSYo4vg51a2AHMasjkamBt6t66bd5JYR1wSimCV
 dH9b+8xPERq8W0wZqTCMqvFoX2mByvWRSMw3CQUQEzl1fDzBJjFpdfavE9ZQ95CT82EjKW
 KumY9k7WL5x7KjkfyT414zIYS/DSMac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-z4f0-8kxMAW7IUwqsPQFbw-1; Mon, 15 Feb 2021 22:35:11 -0500
X-MC-Unique: z4f0-8kxMAW7IUwqsPQFbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92B92835E21;
 Tue, 16 Feb 2021 03:35:10 +0000 (UTC)
Received: from localhost.localdomain (ovpn-2-24.rdu2.redhat.com [10.22.2.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCA66608DB;
 Tue, 16 Feb 2021 03:35:02 +0000 (UTC)
Date: Mon, 15 Feb 2021 22:35:00 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 00/22] Acceptance Test: introduce base class for Linux
 based tests
Message-ID: <YCs9ZL1014kDxUAd@localhost.localdomain>
References: <20210203172357.1422425-1-crosa@redhat.com>
 <02bcee13-64fa-e14a-98ad-e8426a26d7d2@redhat.com>
 <dd2fda88-723c-7954-6f7e-bfb2d4bdae81@redhat.com>
 <a57b6bbb-d170-6746-5234-193038b41c41@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a57b6bbb-d170-6746-5234-193038b41c41@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="B+Fqr6iBi0SxAEsf"
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
 Beraldo Leal <bleal@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--B+Fqr6iBi0SxAEsf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 06:03:33PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/15/21 4:49 PM, Wainer dos Santos Moschetta wrote:
> > Hi,
> >=20
> > On 2/8/21 8:35 AM, Philippe Mathieu-Daud=E9 wrote:
> >> On 2/3/21 6:23 PM, Cleber Rosa wrote:
> >>> This introduces a base class for tests that need to interact with a
> >>> Linux guest.=A0 It generalizes the "boot_linux.py" code, already been
> >>> used by the "virtiofs_submounts.py" and also SSH related code being
> >>> used by that and "linux_ssh_mips_malta.py".
> >>>
> >>> While at it, a number of fixes on hopeful improvements to those tests
> >>> were added.
> >>>
> >>> Cleber Rosa (22):
> >>> =A0=A0 tests/acceptance/boot_linux.py: fix typo on cloudinit error me=
ssage
> >>> =A0=A0 tests/acceptance/boot_linux.py: rename misleading cloudinit me=
thod
> >>> =A0=A0 Acceptance Tests: remove unnecessary tag from documentation ex=
ample
> >>> =A0=A0 tests/acceptance/virtiofs_submounts.py: use workdir property
> >>> =A0=A0 tests/acceptance/virtiofs_submounts.py: do not ask for ssh key
> >>> =A0=A0=A0=A0 password
> >>> =A0=A0 tests/acceptance/virtiofs_submounts.py: use a virtio-net devic=
e
> >>> =A0=A0=A0=A0 instead
> >>> =A0=A0 tests/acceptance/virtiofs_submounts.py: evaluate string not le=
ngth
> >>> =A0=A0 tests/acceptance/virtiofs_submounts.py: standardize port as in=
teger
> >>> =A0=A0 tests/acceptance/virtiofs_submounts.py: required space between=
 IP and
> >>> =A0=A0=A0=A0 port
> >>> =A0=A0 Python: add utility function for retrieving port redirection
> >>> =A0=A0 tests/acceptance/linux_ssh_mips_malta.py: standardize port as =
integer
> >>> =A0=A0 Acceptance tests: clarify ssh connection failure reason
> >>> =A0=A0 tests/acceptance/virtiofs_submounts.py: add missing accel tag
> >>> =A0=A0 Acceptance Tests: introduce LinuxTest base class
> >>> =A0=A0 Acceptance Tests: move useful ssh methods to base class
> >>> =A0=A0 Acceptance Tests: introduce method for requiring an accelerato=
r
> >>> =A0=A0 Acceptance Tests: fix population of public key in cloudinit im=
age
> >>> =A0=A0 Acceptance Tests: set up existing ssh keys by default
> >>> =A0=A0 Acceptance Tests: add port redirection for ssh by default
> >>> =A0=A0 Acceptance Tests: add basic documentation on LinuxTest base cl=
ass
> >>> =A0=A0 Acceptance Tests: introduce CPU hotplug test
> >>> =A0=A0 [NOTFORMERGE] Bump Avocado version to latest master
> >>>
> >>> =A0 docs/devel/testing.rst=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 29 +++-
> >>> =A0 python/qemu/utils.py=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0 35 +++++
> >>> =A0 tests/acceptance/avocado_qemu/__init__.py | 176 +++++++++++++++++=
+++++
> >>> =A0 tests/acceptance/boot_linux.py=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
 128 ++--------------
> >>> =A0 tests/acceptance/hotplug_cpu.py=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 38 +++++
> >>> =A0 tests/acceptance/info_usernet.py=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 =
29 ++++
> >>> =A0 tests/acceptance/linux_ssh_mips_malta.py=A0 |=A0 44 +-----
> >>> =A0 tests/acceptance/virtiofs_submounts.py=A0=A0=A0 |=A0 73 +--------
> >>> =A0 tests/requirements.txt=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0=A0 2 +-
> >>> =A0 tests/vm/basevm.py=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 7 +-
> >>> =A0 10 files changed, 334 insertions(+), 227 deletions(-)
> >>> =A0 create mode 100644 python/qemu/utils.py
> >>> =A0 create mode 100644 tests/acceptance/hotplug_cpu.py
> >>> =A0 create mode 100644 tests/acceptance/info_usernet.py
> >> Patches 1-6, 8-9 & 12 queued.
> >=20
> >=20
> > Those are merged. Most of the remaining patches got at least one review=
,
> > so could you (Cleber or Philippe) open a pull request for them as well?
> > Telling it because there are many series in flight for the acceptance
> > tests, and to avoid conflicts with future series...
>=20
> I asked a question to Cleber in patch 13 and am waiting what he meant
> before queuing the series (fixing the typo Marc-Andr=E9 noticed).
>=20
> Regards,
>=20
> Phil.
>=20

Hi Phil,

Thanks for taking the previous patches, and thanks for the willingness
to take (and tweak) some more.  I only saw this comment now, and I
have a bunch of these ready to fire a PR.

I guess I also provided an answer to the question you're referring to.

If my tree passes CI, then I should be sending a PR within the next
few hours.

Best,
- Cleber.

--B+Fqr6iBi0SxAEsf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmArPWEACgkQZX6NM6Xy
CfPRAQ//Wg2NGoNUw9o02fkSHPmF0nITProEiwuzLRhGcgSKrfzJA1hK5G0x76yC
IOyjukbvtaHEsKrZU/cXBAuGqFBQonVjR9g3IhBSWHlmJqCwXRlvG13JMpgIDs2c
8lmY/mUZPrIdni7mzvm+bke6jLtHDUzSZ86TYjLBAzUTYZJCP50awpEaAeTqtH53
ExNJ3Er5E4zj0UJ+lvLPUey76XyjyNxsYkMpoee916jdk+jlyLoX5xMcWuSssoIv
5yGJlEJ4DwHehct85GgufEMTPUDRaxpOQuuK3FW11gOABgIOX4X/k6G+OxSB23XN
uD6S9LeoXXt+rKqjZpZPsY46bTl9Txo1bCr02ZFHyuu2AN3d9pFDOBIzPaJhKjvy
tBckxMsr/RNEWqFUB1c+yShzpZgsfmMmu4a4m6Nvf1wZz8sMJwc46bJ8XgmYFWCh
fSgEFvNt6iNXTRzOt+yIoDxW3cFFQu7l0ZSNTA1BZY+lvzgfcaZ770kVT3cLUX6w
boPMYBEvInF0TAZME++90GSJh68uCgWOFXB4+KA4WyWdzsKeSc4XJq2z6T9uF9XS
NATnSpnnbHI0gmGFmveereewBxrPIIcEk1YXucitxojHKuwFV07i/rwsIueAHNMW
vb1YV5j2lZAzNrHZqJF0yNRI1/aEAUkBPJDUDk7w/jVaeiPI7ZA=
=BRpK
-----END PGP SIGNATURE-----

--B+Fqr6iBi0SxAEsf--


