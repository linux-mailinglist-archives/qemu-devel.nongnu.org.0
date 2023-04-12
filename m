Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF826DFB8E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 18:42:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmdXb-00082g-Ih; Wed, 12 Apr 2023 12:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1pmdXZ-00081x-I3
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 12:41:49 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1pmdXX-0000o8-8J
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 12:41:49 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1681317691; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=I+t8eRb3J0Wz8iGH4VGrdFKhPdpazQLrOTBWZFLTP9ITkldAA8ZeWRj/n5S8nDoHdB
 fEGMtLHmI1HIWRnTLSO3jbTxwKQV4GFFE8kCPMsas88S6wvrZmXcyTEnHzO8KUdMFapa
 3gyckNaEZ9ZDmg3MWmQVAtr2ia/I/4Cm0LurKl3c2UMyQXr9+VjJIGtOKpC8+yGoTOMJ
 pGbyIWL/IZbbr7Nk3IPomJlSdDXK8/70DYLk5PIKWCbu6ZrfhJo3z8ttCQPGaFxT0KAJ
 PGw3jc9yRhN7YTGAWcaBE8AubZaZtaJcknr5lDY415qUSmM3Zisix/jK8QNyZ9oyToHK
 hIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1681317691;
 s=strato-dkim-0002; d=strato.com;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=JT5qExcTM6gL1DYlQsfWt1VJB7UprVZ7ijMUDkPIPck=;
 b=TBeIhViaDoF8JpJvPhRVHA/i9syhjLchfxygzcgLGG4tfPKbHX/42z5HaP5au9DJq6
 oAhvBGwH3VnID9mZyKNwIIpBTizFPascoqbn88LWjyMLhUEOg5ml2zt7gPPU1s7ZRoPl
 Ft0MUjw0EbGagF7UEWrBJhfpfduM2LKFSabqDWIYj1BZbZFY36UC9yeT2XgJxkjxjAOv
 IDAjBr/b1MuYZwOPzNUCTbRqwVsHA+MV9KvxVwtdc/Rhq62AK3MvrVpfGXSk53jTWj1/
 YVf/NL3ZjU2sJ4al8YogxqcOg+1Y/6/O1C2FD37hvVuzeIwbJ8TUl84lvyo2jYeLshbl
 30Aw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1681317691;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=JT5qExcTM6gL1DYlQsfWt1VJB7UprVZ7ijMUDkPIPck=;
 b=ZPOqnlvxK9UT+hr8ZiUYcbOuKLFlIzM0NFaZ2Mlo7ERnB9LXKqCcyKYKuJv5pSqPYl
 gwxz05QLixPEjtg+Y7zNGxLanCEiapYiRAQk7+BjkxHO0MpUy5wnsySqTgJm4g9fooCN
 I1Sool4ZFnRSsHwgjGgBYQ1hJ+/W80fTzDoKzq75evWfBQLBgrLHU7pFBcYEIeFbzrqi
 /a33x+ivNDPYqEvfCx8X6/sjHFMys0+nxav1ys62yltQXui36IoQlC/2YMX4lulFTLUU
 CE0HtN2TcCNxe02pVsX6ozgtwHdijJwgRrouPNtoEM+F6wJsgWWciTAik10Pr2CqxU6X
 Ptcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1681317691;
 s=strato-dkim-0003; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=JT5qExcTM6gL1DYlQsfWt1VJB7UprVZ7ijMUDkPIPck=;
 b=xFs/mNsD8GSetBU2Hkh21+JYOSdfy+YkSXJDlE7NRpdO2xfleN59vUhlVazJXSeicn
 VHFekQ+YlMY0H9M+U1Dw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AEWIPBvsPI52f2TnxTwFPmhSWhc+9ByBCFU+BA=="
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz3CGfUStO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 12 Apr 2023 18:41:30 +0200 (CEST)
Date: Wed, 12 Apr 2023 18:41:18 +0200
From: Olaf Hering <olaf@aepfle.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Alex =?UTF-8?B?QmVubsOpZQ==?=  <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: qemu v8.0-rc3 fails to compile with Xen
Message-ID: <20230412184118.7069e990.olaf@aepfle.de>
In-Reply-To: <80e7920a8947fe58d94003c7591af6e876edf706.camel@infradead.org>
References: <20230412125842.573dc418.olaf@aepfle.de>
 <873555pakr.fsf@linaro.org>
 <20230412142022.4b88df69.olaf@aepfle.de>
 <80e7920a8947fe58d94003c7591af6e876edf706.camel@infradead.org>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem,
 kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h6Lf34jrhap.YMvKQ/rAlkh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=81.169.146.218; envelope-from=olaf@aepfle.de;
 helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/h6Lf34jrhap.YMvKQ/rAlkh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Wed, 12 Apr 2023 15:05:06 +0100 David Woodhouse <dwmw2@infradead.org>:

> On Wed, 2023-04-12 at 14:20 +0200, Olaf Hering wrote:
> > Wed, 12 Apr 2023 12:46:23 +0100 Alex Benn=C3=A9e <alex.bennee@linaro.or=
g>:
> >=20
> > > Olaf Hering <olaf@aepfle.de> writes:
> > > > Qemu v7.2.1 can be compiled with Xen 4.6, but v8.0.0-rc3 needs now =
at least Xen 4.7.=C2=A0=20
> > > Was this caused by the addition of the KVM Xen target support or some=
 other churn since?
> >=20
> > I did not bisect this failure, just checking if bisect is worth the eff=
ort.
>=20
> It'll be something like this. I haven't tested this yet because I can't
> even get Xen that old to build locally.

The error with this patch applied looks like this:

FAILED: libcommon.fa.p/hw_xen_xen-operations.c.o=20
/usr/bin/gcc-7 -m64 -mcx16 -Ilibcommon.fa.p -I/usr/include/pixman-1 -I/usr/=
include/libpng16 -I/usr/include/spice-server -I/usr/include/cacard -I/usr/i=
nclude/nss3 -I/usr/include/nspr4 -I/usr/include/glib-2.0 -I/usr/lib64/glib-=
2.0/include -I/usr/include/spice-1 -I/usr/include/p11-kit-1 -I/usr/include/=
libusb-1.0 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/gio-=
unix-2.0 -I/usr/include/ncursesw -fdiagnostics-color=3Dauto -Wall -Winvalid=
-pch -std=3Dgnu11 -O2 -isystem /Qc6f3cbca32/linux-headers -isystem linux-he=
aders -iquote . -iquote /Qc6f3cbca32 -iquote /Qc6f3cbca32/include -iquote /=
Qc6f3cbca32/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_GNU_SOURCE -D_FILE_OFFSE=
T_BITS=3D64 -D_LARGEFILE_SOURCE -fno-strict-aliasing -fno-common -fwrapv -W=
undef -Wwrite-strings -Wmissing-prototypes -Wstrict-prototypes -Wredundant-=
decls -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat=
-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnest=
ed-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2=
 -Wmissing-format-attribute -Wno-missing-include-dirs -Wno-shift-negative-v=
alue -Wno-psabi -fstack-protector-strong -fmessage-length=3D0 -grecord-gcc-=
switches -O2 -Wall -D_FORTIFY_SOURCE=3D2 -fstack-protector-strong -funwind-=
tables -fasynchronous-unwind-tables -fstack-clash-protection -fPIE -DOPENSS=
L_LOAD_CONF -MD -MQ libcommon.fa.p/hw_xen_xen-operations.c.o -MF libcommon.=
fa.p/hw_xen_xen-operations.c.o.d -o libcommon.fa.p/hw_xen_xen-operations.c.=
o -c ../hw/xen/xen-operations.c
../hw/xen/xen-operations.c:37:19: error: conflicting types for 'xenevtchn_h=
andle'
 typedef xc_evtchn xenevtchn_handle;
                   ^~~~~~~~~~~~~~~~
In file included from ../hw/xen/xen-operations.c:17:0:
/Qc6f3cbca32/include/hw/xen/xen_backend_ops.h:33:33: note: previous declara=
tion of 'xenevtchn_handle' was here
 typedef struct xenevtchn_handle xenevtchn_handle;
                                 ^~~~~~~~~~~~~~~~
../hw/xen/xen-operations.c:49:19: error: conflicting types for 'xengnttab_h=
andle'
 typedef xc_gnttab xengnttab_handle;
                   ^~~~~~~~~~~~~~~~
In file included from ../hw/xen/xen-operations.c:17:0:
/Qc6f3cbca32/include/hw/xen/xen_backend_ops.h:136:33: note: previous declar=
ation of 'xengnttab_handle' was here
 typedef struct xengntdev_handle xengnttab_handle;
                                 ^~~~~~~~~~~~~~~~
../hw/xen/xen-operations.c:193:13: warning: initialization from incompatibl=
e pointer type [-Wincompatible-pointer-types]
     .open =3D libxenevtchn_backend_open,
             ^~~~~~~~~~~~~~~~~~~~~~~~~
../hw/xen/xen-operations.c:193:13: note: (near initialization for 'libxenev=
tchn_backend_ops.open')
../hw/xen/xen-operations.c:194:14: error: 'xenevtchn_close' undeclared here=
 (not in a function); did you mean 'xc_evtchn_close'?
     .close =3D xenevtchn_close,
              ^~~~~~~~~~~~~~~
              xc_evtchn_close
../hw/xen/xen-operations.c:195:25: error: 'xenevtchn_bind_interdomain' unde=
clared here (not in a function); did you mean 'xc_evtchn_bind_interdomain'?
     .bind_interdomain =3D xenevtchn_bind_interdomain,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
                         xc_evtchn_bind_interdomain
../hw/xen/xen-operations.c:196:15: error: 'xenevtchn_unbind' undeclared her=
e (not in a function); did you mean 'xc_evtchn_unbind'?
     .unbind =3D xenevtchn_unbind,
               ^~~~~~~~~~~~~~~~
               xc_evtchn_unbind
../hw/xen/xen-operations.c:197:15: error: 'xenevtchn_fd' undeclared here (n=
ot in a function); did you mean 'xc_evtchn_fd'?
     .get_fd =3D xenevtchn_fd,
               ^~~~~~~~~~~~
               xc_evtchn_fd
../hw/xen/xen-operations.c:198:15: error: 'xenevtchn_notify' undeclared her=
e (not in a function); did you mean 'xc_evtchn_notify'?
     .notify =3D xenevtchn_notify,
               ^~~~~~~~~~~~~~~~
               xc_evtchn_notify
../hw/xen/xen-operations.c:199:15: error: 'xenevtchn_unmask' undeclared her=
e (not in a function); did you mean 'xc_evtchn_unmask'?
     .unmask =3D xenevtchn_unmask,
               ^~~~~~~~~~~~~~~~
               xc_evtchn_unmask
../hw/xen/xen-operations.c:200:16: error: 'xenevtchn_pending' undeclared he=
re (not in a function); did you mean 'xc_evtchn_pending'?
     .pending =3D xenevtchn_pending,
                ^~~~~~~~~~~~~~~~~
                xc_evtchn_pending
../hw/xen/xen-operations.c:218:13: warning: initialization from incompatibl=
e pointer type [-Wincompatible-pointer-types]
     .open =3D libxengnttab_backend_open,
             ^~~~~~~~~~~~~~~~~~~~~~~~~
../hw/xen/xen-operations.c:218:13: note: (near initialization for 'libxengn=
ttab_backend_ops.open')
../hw/xen/xen-operations.c:219:14: error: 'xengnttab_close' undeclared here=
 (not in a function); did you mean 'xc_gnttab_close'?
     .close =3D xengnttab_close,
              ^~~~~~~~~~~~~~~
              xc_gnttab_close
../hw/xen/xen-operations.c:220:19: warning: initialization from incompatibl=
e pointer type [-Wincompatible-pointer-types]
     .grant_copy =3D libxengnttab_fallback_grant_copy,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../hw/xen/xen-operations.c:220:19: note: (near initialization for 'libxengn=
ttab_backend_ops.grant_copy')
../hw/xen/xen-operations.c:221:23: error: 'xengnttab_set_max_grants' undecl=
ared here (not in a function); did you mean 'xc_gnttab_set_max_grants'?
     .set_max_grants =3D xengnttab_set_max_grants,
                       ^~~~~~~~~~~~~~~~~~~~~~~~
                       xc_gnttab_set_max_grants
../hw/xen/xen-operations.c:222:17: error: 'xengnttab_map_domain_grant_refs'=
 undeclared here (not in a function); did you mean 'xc_gnttab_map_domain_gr=
ant_refs'?
     .map_refs =3D xengnttab_map_domain_grant_refs,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                 xc_gnttab_map_domain_grant_refs
../hw/xen/xen-operations.c:223:14: warning: initialization from incompatibl=
e pointer type [-Wincompatible-pointer-types]
     .unmap =3D libxengnttab_backend_unmap,
              ^~~~~~~~~~~~~~~~~~~~~~~~~~
../hw/xen/xen-operations.c:223:14: note: (near initialization for 'libxengn=
ttab_backend_ops.unmap')


Olaf

--Sig_/h6Lf34jrhap.YMvKQ/rAlkh
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmQ23y4ACgkQ86SN7mm1
DoBlkxAAg8+vKeBiJqJ7efmZojAXqdM70wQFLa0q3jJTpzRqrsrwf4yA2vakdRj+
yDmkYkTpr0KAcOD8nrXNdOoPwL3zGVwN2nKwpnvuIT7RkuYoVpykbtRlh5uHlMvW
DtV0XxHMwrvPNpNICDBvl2XfnYI3NZEj3t6D0X3a8ApN5NGGLvi5R7OgBiPosUgy
SUprZpBVV9F6o+RKmT/7QraP9JTF8+SsUwIWVTs5GP8/0qRgCuKoGlHlrQPgPYmw
vc/SojVhCrO7M8S/27l6uDc/U1z5DEZHPtqxdaP23PmEWQknFKGdQG7/Hjcgu4WS
bLHYP9R+5swbJg9uiquugrup6uX1i/wzxQnEGpL/grZIaydQmWNwOVUZN4cutCrp
O/HWnt5Z0DTxq8L8d0ZSl+VPPWRAac32MV4idu5rVh07AK4FIBwsCENp7YY+KhcL
NalT1LXb8GQ5Qtc7XVP3CKrONRFx7wfTWbfiaVd72Arh89sVVRrB0ryggd/fdlcK
mUpeCGdoqCA6/K7bFouTHnvDqX9aIqT9ihAlW/vEiCVVyRMjhLcTqP8ZRiPSkoFp
KYV14EfEUdBkel2IfXyKQdIdxHHhGq35dEo37J46+J0XLOyi2a1xI18An7bnNIF6
1eGOvCTHRQgyqlmXCQRDRVF2D+TrG7K6uhjZhbmgCX3oF3+8dJQ=
=wKyr
-----END PGP SIGNATURE-----

--Sig_/h6Lf34jrhap.YMvKQ/rAlkh--

