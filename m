Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E347A1DD
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 19:50:06 +0100 (CET)
Received: from localhost ([::1]:52584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mz1G1-0002hg-Je
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 13:50:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1mz1DP-000203-CU
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 13:47:23 -0500
Received: from woodpecker.gentoo.org ([140.211.166.183]:58706
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <dilfridge@gentoo.org>)
 id 1mz1DM-0000nx-V4
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 13:47:22 -0500
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] linux-user/signal: Map exit signals in SIGCHLD siginfo_t
Date: Sun, 19 Dec 2021 19:47:09 +0100
Message-ID: <5523284.DvuYhMxLoT@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <87c9f71f-ed9d-03e4-9a0e-594b649525b5@vivier.eu>
References: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net>
 <87c9f71f-ed9d-03e4-9a0e-594b649525b5@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5776037.lOV4Wx5bFT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
Received-SPF: pass client-ip=140.211.166.183;
 envelope-from=dilfridge@gentoo.org; helo=smtp.gentoo.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Matthias Schiffer <mschiffer@universe-factory.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nextPart5776037.lOV4Wx5bFT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: "Andreas K. Huettel" <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Matthias Schiffer <mschiffer@universe-factory.net>, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user/signal: Map exit signals in SIGCHLD siginfo_t
Date: Sun, 19 Dec 2021 19:47:09 +0100
Message-ID: <5523284.DvuYhMxLoT@pinacolada>
Organization: Gentoo Linux
In-Reply-To: <87c9f71f-ed9d-03e4-9a0e-594b649525b5@vivier.eu>
References: <81534fde7cdfc6acea4889d886fbefdd606630fb.1635019124.git.mschiffer@universe-factory.net> <87c9f71f-ed9d-03e4-9a0e-594b649525b5@vivier.eu>

Well, the original fix 1c3dfb506ea3 did clearly improve things for me, but =
it wasn't
complete yet. At some point I gave up on finding a minimal reproducer for m=
y remaining=20
problems (futex-related hangs in a complex python+bash app).

So, this *may* be the missing piece.

Will test, but that takes a few days.

Andreas

Am Sonntag, 19. Dezember 2021, 16:55:16 CET schrieb Laurent Vivier:
> CC'ing Alistair and Andreas that were involved in original fix 1c3dfb506e=
a3 ("linux-user/signal:=20
> Decode waitid si_code")
>=20
> Thanks,
> Laurent
>=20
> Le 23/10/2021 =E0 21:59, Matthias Schiffer a =E9crit :
> > When converting a siginfo_t from waitid(), the interpretation of si_sta=
tus
> > depends on the value of si_code: For CLD_EXITED, it is an exit code and
> > should be copied verbatim. For other codes, it is a signal number
> > (possibly with additional high bits from ptrace) that should be mapped.
> >=20
> > This code was previously changed in commit 1c3dfb506ea3
> > ("linux-user/signal: Decode waitid si_code"), but the fix was
> > incomplete.
> >=20
> > Tested with the following test program:
> >=20
> >      #include <stdio.h>
> >      #include <stdlib.h>
> >      #include <unistd.h>
> >      #include <sys/wait.h>
> >=20
> >      int main() {
> >      	pid_t pid =3D fork();
> >      	if (pid =3D=3D 0) {
> >      		exit(12);
> >      	} else {
> >      		siginfo_t siginfo =3D {};
> >      		waitid(P_PID, pid, &siginfo, WEXITED);
> >      		printf("Code: %d, status: %d\n", (int)siginfo.si_code, (int)sigi=
nfo.si_status);
> >      	}
> >=20
> >      	pid =3D fork();
> >      	if (pid =3D=3D 0) {
> >      		raise(SIGUSR2);
> >      	} else {
> >      		siginfo_t siginfo =3D {};
> >      		waitid(P_PID, pid, &siginfo, WEXITED);
> >      		printf("Code: %d, status: %d\n", (int)siginfo.si_code, (int)sigi=
nfo.si_status);
> >      	}
> >      }
> >=20
> > Output with an x86_64 host and mips64el target before 1c3dfb506ea3
> > (incorrect: exit code 12 is translated like a signal):
> >=20
> >      Code: 1, status: 17
> >      Code: 2, status: 17
> >=20
> > After 1c3dfb506ea3 (incorrect: signal number is not translated):
> >=20
> >      Code: 1, status: 12
> >      Code: 2, status: 12
> >=20
> > With this patch:
> >=20
> >      Code: 1, status: 12
> >      Code: 2, status: 17
> >=20
> > Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
> > ---
> >   linux-user/signal.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/linux-user/signal.c b/linux-user/signal.c
> > index 14d8fdfde152..8e3af98ec0a7 100644
> > --- a/linux-user/signal.c
> > +++ b/linux-user/signal.c
> > @@ -403,7 +403,12 @@ static inline void host_to_target_siginfo_noswap(t=
arget_siginfo_t *tinfo,
> >           case TARGET_SIGCHLD:
> >               tinfo->_sifields._sigchld._pid =3D info->si_pid;
> >               tinfo->_sifields._sigchld._uid =3D info->si_uid;
> > -            tinfo->_sifields._sigchld._status =3D info->si_status;
> > +            if (si_code =3D=3D CLD_EXITED)
> > +                tinfo->_sifields._sigchld._status =3D info->si_status;
> > +            else
> > +                tinfo->_sifields._sigchld._status
> > +                    =3D host_to_target_signal(info->si_status & 0x7f)
> > +                        | (info->si_status & ~0x7f);
> >               tinfo->_sifields._sigchld._utime =3D info->si_utime;
> >               tinfo->_sifields._sigchld._stime =3D info->si_stime;
> >               si_type =3D QEMU_SI_CHLD;
> >=20
>=20
>=20
>=20


=2D-=20
Andreas K. H=FCttel
dilfridge@gentoo.org
Gentoo Linux developer
(council, toolchain, base-system, perl, libreoffice)
--nextPart5776037.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAABCgB9FiEE6W4INB9YeKX6Qpi1TEn3nlTQogYFAmG/fi1fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEU5
NkUwODM0MUY1ODc4QTVGQTQyOThCNTRDNDlGNzlFNTREMEEyMDYACgkQTEn3nlTQ
ogbKZxAAlAoqrsO6kijjvZJnU+EHR4nDuy3vb7DHAaoQGR54s7ErIe9vPCB3vXvY
RTWaNf+U/W43A2xPLJNzcmq1/FcaLmac+7xBoIP2tublsgjUIX2eT8qDlLBCUHp/
dUjOAfiQ5dP0TpKCG0O1mWz5vgjs5C7AqoFjvLUO9Em16QrF5aPJjWnClpWLtq70
7ZWQNm+WNETsgamZ5k+XwjxRyzByhUqZiINxmt7ZP/B9jp/y9f/YhOAc1GgeE2c4
7NQDO083BwE7ByKK8DZKEaRakTDN4B4vxul+ciBfqR9vkjQgxHUewtcSECcJcckR
wzSXxpje5iDvkEcySmm2B7iXt276s3NFiiNxIMdWb9Ajoh0oO9zUzaXT8FnSCuWu
gJtKIT1anDNgLHCPzzXUPyTshyFpnXlPLWpm5BD378VTZD4sj4wdXbM9M0RPrQcV
RZwuPZ6DZEONwLy5pOV9ONarMlFNS/9DmHO6RY9hexmf8SzLHeqUDXWuBpu30KaY
kW9Q/1ACuEeNei5BY1HdXfo6NTjktwrJ0OmvpPnRLz7HacD1//9cdiWRzmr6P1Bn
xjfnUgdR5hEmnv+54Aqgv+UtzzyePsTffQJ1XwegQSCtFU5iGhLYZaS3BIJ8N+Au
8iaoAgWgsgyzYfjLIr6bx2bJJ0ZQ9FKDIwjfSr6OAN5pwmfRgk8=
=rMbV
-----END PGP SIGNATURE-----

--nextPart5776037.lOV4Wx5bFT--




