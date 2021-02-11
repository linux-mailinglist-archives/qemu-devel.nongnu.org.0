Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5306231910E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:32:03 +0100 (CET)
Received: from localhost ([::1]:55314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFow-0006pj-AO
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAFj0-0002mm-MG
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:25:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAFiy-0007i8-OO
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613064350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g00gdEK3gEnDYV0qU70s8EKC5MNWJNRRdsKsPjIWvsM=;
 b=EOAxhu2fMbA8ZnuC85M+s1BmyjvXBpzCrlSlG5/e8jjC2+I3GPizGyQgpJbyxafcK5RvNG
 9Ke5wEQA3+EpzTlxOz7JIbxpjxoxNM+JcCOc3beu7DVHXU5wzQc9rmWRwipQ59ZLReUH+b
 9RcKwZzUwkTEUM+7/dIdx80Wk34g/eA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-DjdItSDdP-KDyjKBJQnEgg-1; Thu, 11 Feb 2021 12:25:45 -0500
X-MC-Unique: DjdItSDdP-KDyjKBJQnEgg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 144AC56AA6;
 Thu, 11 Feb 2021 17:25:44 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D03B60622;
 Thu, 11 Feb 2021 17:25:43 +0000 (UTC)
Date: Thu, 11 Feb 2021 12:25:41 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: runaway avocado
Message-ID: <20210211172541.GA2316309@localhost.localdomain>
References: <CAFEAcA8z=vQ9E6hNKUuzk2EgH8Dpkxo=3YbnQ5iX0DYCQDr6bg@mail.gmail.com>
 <CAFEAcA_S81bnYVcNENW9bFApAc-Ob1uKQncsGPmyFD034p2FOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_S81bnYVcNENW9bFApAc-Ob1uKQncsGPmyFD034p2FOA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 07:23:22PM +0000, Peter Maydell wrote:
> On Mon, 26 Oct 2020 at 22:35, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> >
> > So, I somehow ended up with this process still running on my
> > local machine after a (probably failed) 'make check-acceptance':
> >
> > petmay01 13710 99.7  3.7 2313448 1235780 pts/16 Sl  16:10 378:00
> > ./qemu-system-aarch64 -display none -vga none -chardev
> > socket,id=3Dmon,path=3D/var/tmp/tmp5szft2yi/qemu-13290-monitor.sock -mo=
n
> > chardev=3Dmon,mode=3Dcontrol -machine virt -chardev
> > socket,id=3Dconsole,path=3D/var/tmp/tmp5szft2yi/qemu-13290-console.sock=
,server,nowait
> > -serial chardev:console -icount
> > shift=3D7,rr=3Drecord,rrfile=3D/var/tmp/avocado_iv8dehpo/avocado_job_w9=
efukj5/32-tests_acceptance_reverse_debugging.py_ReverseDebugging_AArch64.te=
st_aarch64_virt/replay.bin,rrsnapshot=3Dinit
> > -net none -drive
> > file=3D/var/tmp/avocado_iv8dehpo/avocado_job_w9efukj5/32-tests_acceptan=
ce_reverse_debugging.py_ReverseDebugging_AArch64.test_aarch64_virt/disk.qco=
w2,if=3Dnone
> > -kernel /home/petmay01/avocado/data/cache/by_location/a00ac4ae676ef0322=
126abd2f7d38f50cc9cbc95/vmlinuz
> > -cpu cortex-a53
> >
> > and it was continuing to log to a deleted file
> > /var/tmp/avocado_iv8dehpo/avocado_job_w9efukj5/32-tests_acceptance_reve=
rse_debugging.py_ReverseDebugging_AArch64.test_aarch64_virt/replay.bin
> >
> > which was steadily eating my disk space and got up to nearly 100GB
> > in used disk (invisible to du, of course, since it was an unlinked
> > file) before I finally figured out what was going on and killed it
> > about six hours later...
>=20
> Just got hit by this test framework bug again :-( Same thing,
> runaway avacado record-and-replay test ate all my disk space.
>=20
> -- PMM
>=20

Hi Peter,

I'm sorry this caused you trouble again.

IIUC, this specic issue was caused by a runaway QEMU.  Granted, it was
started by an Avocado test.  I've opened a bug report to look into the
possibilities to mitigate or prevent this from happening again:

   https://bugs.launchpad.net/qemu/+bug/1915431

The bug report contains a bit more context into why Avocado does not
try to kill all processes started by a test by default.

BTW, we've been working with Pavel on identifying issues with
replay/reverse features that are causing test failures.  So far,
I've seen a couple of issues that may be related to this runaway
QEMU writing to to the replay.bin file.

Regards,
- Cleber.

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAlaJIACgkQZX6NM6Xy
CfP8UBAAt2yHzg+0URd9apbgAIZCA4Xx3fwIQ4sU6FYOffQiu9/o4gR5eghVlWmo
+ZGTlcnxRSyNv3zkjqH8oraljLqlAPr/1U36kLRpyRXdkHEMNsTr0iww36gbtzMX
WX8OgTZ2D6MQsrqazxBQ8Az7rvogE2Ez/fT7Jf2+LK5BF3pgH9Zjgu6qVQjcB/A1
nOV1XK8nCIsXbOKCO72XISkPpyPLbem/W5sxHbSMHRXRIBB8uhTx/zuxqE2JqRGC
lE70COOqbPK+3uesEJ8ozowgS4IYT6wPwnUbWZk3ioiZfPDzFfGc0rCR/qvK4lTa
VrTalEz95wL506vDORRBFKprZ2TPvCnTBP9fHRO/b8M1G5wEkc1DANWwAiL7B3BD
U+Fe4ZKlwWGUsthMX1enTaswv4YtKD8De0TllB0s0V+7QgHCGV2sPB/4Geg69YeU
+o2L9S02J1TAL7Q75jT8p9tYDlDmslTHKZNNcDWlPdYxG4FtQWvU5QJ8pOhm9A/C
p9cf4zmVBdKAPPWYhZkkfIRqO6xH+fLEuCuUgh8AuhuNfPAMKd7Xv4WmN6O5oPhl
suZVFOFWIUypp/v+LLSl4VWbfGk0Ry/fQU8NmDk0XfCioy9CnbvY66LzunhkItT9
n8Mhumgc/8cOsX+qmpPjjzd1D2y6n6UUoP4xvyHeMjrQwee8xws=
=Sji9
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--


