Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF36A36BD11
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 04:00:46 +0200 (CEST)
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbD1p-0008KR-R6
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 22:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbCy5-0003pX-98; Mon, 26 Apr 2021 21:56:54 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58687 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbCy1-0000hl-BO; Mon, 26 Apr 2021 21:56:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FTlHV5f99z9sXL; Tue, 27 Apr 2021 11:56:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619488598;
 bh=QmJw9Fge7FsbLMhyPPyxbFmvVgfkPnmS+J68h9r2Gsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YLA0P/BRfhz8aoNf1dB3vnUvdXViHohVQIqYbLeyFOtgFBjunv2+O6g4PdsmZqbRA
 n3iDCJoQphRdZcpynj04JF7kY/EEi85S5B6obh2gp9v4nqnl+J0vJTjGLOXLBtLbz7
 EWHhKoiHJBJkbRJ+cbmk9ByUx7Bfhn8EM3WEuBxo=
Date: Tue, 27 Apr 2021 11:52:42 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v3] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
Message-ID: <YIduatGc1UBGW7s1@yekko.fritz.box>
References: <20210414145947.30155-1-bruno.larsen@eldorado.org.br>
 <74b629d5-0b7f-e53c-2d2c-29de23c564b7@linaro.org>
 <YHkIHYx77a2XHMQN@yekko.fritz.box> <87sg3d2gf5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m3eVw2Gr5Hp5I8K5"
Content-Disposition: inline
In-Reply-To: <87sg3d2gf5.fsf@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--m3eVw2Gr5Hp5I8K5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 26, 2021 at 12:50:54PM -0300, Fabiano Rosas wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Wed, Apr 14, 2021 at 01:09:19PM -0700, Richard Henderson wrote:
> >> On 4/14/21 7:59 AM, Bruno Larsen (billionai) wrote:
> >> > All the code related to gdb has been moved from translate_init.c.inc
> >> > file to the gdbstub.c file, where it makes more sense.
> >> >=20
> >> > This new version puts the prototypes in internal.h, to not expose
> >> > them unnecessarily.
> >> >=20
> >> > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.b=
r>
> >> > Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
> >> > ---
> >> >   target/ppc/gdbstub.c            | 258 ++++++++++++++++++++++++++++=
++++
> >> >   target/ppc/internal.h           |   5 +
> >> >   target/ppc/translate_init.c.inc | 254 +---------------------------=
---
> >> >   3 files changed, 264 insertions(+), 253 deletions(-)
> >>=20
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >
> > Applied to ppc-for-6.1, thanks.
>=20
>=20
> The prototypes moved to internal.h in v3 so gdbstub.c needs to include
> it now. The linux-user build is breaking with:

Thanks for the report.  I've pulled this from ppc-for-6.1 and I'll
await the next spin.

>=20
> $ ../configure --target-list=3Dppc64le-linux-user
> $ make -j$(nproc)
> (...)
> [316/959] Compiling C object libqemu-ppc64le-linux-user.fa.p/target_ppc_g=
dbstub.c.o                      =20
> FAILED: libqemu-ppc64le-linux-user.fa.p/target_ppc_gdbstub.c.o           =
                                =20
> cc -Ilibqemu-ppc64le-linux-user.fa.p -I. -I.. -Itarget/ppc -I../target/pp=
c -I../linux-user/host/x86_64 -Ilinux-user -I../linux-user -Ilinux-user/ppc=
 -I../linux-user/ppc -I../capstone/include/capstone -Itrace -Iqap
> i -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -fdia=
gnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu99 -O2 -g=
 -isystem /home/fabiano/kvm/qemu-patch-testing/linux-headers -isystem
>  linux-headers -iquote . -iquote /home/fabiano/kvm/qemu-patch-testing -iq=
uote /home/fabiano/kvm/qemu-patch-testing/include -iquote /home/fabiano/kvm=
/qemu-patch-testing/disas/libvixl -iquote /home/fabiano/kvm/qemu-
> patch-testing/tcg/i386 -iquote /home/fabiano/kvm/qemu-patch-testing/accel=
/tcg -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -m64 -mcx16 -D_GNU_SO=
URCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
>  -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-stri=
ct-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definit=
ion -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wig
> nored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion=
-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shift=
-negative-value -Wno-psabi -fstack-protector-strong -fPIC -isystem.
> ./linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"pp=
c64le-linux-user-config-target.h"' '-DCONFIG_DEVICES=3D"ppc64le-linux-user-=
config-devices.h"' -MD -MQ libqemu-ppc64le-linux-user.fa.p/target_ppc
> _gdbstub.c.o -MF libqemu-ppc64le-linux-user.fa.p/target_ppc_gdbstub.c.o.d=
 -o libqemu-ppc64le-linux-user.fa.p/target_ppc_gdbstub.c.o -c ../target/ppc=
/gdbstub.c                                                      =20
> ../target/ppc/gdbstub.c:615:8: error: no previous prototype for =E2=80=98=
ppc_gdb_arch_name=E2=80=99 [-Werror=3Dmissing-prototypes]                  =
                                                                           =
       =20
>   615 | gchar *ppc_gdb_arch_name(CPUState *cs)                           =
                                =20
>       |        ^~~~~~~~~~~~~~~~~                                         =
                                =20
> ../target/ppc/gdbstub.c:624:6: error: no previous prototype for =E2=80=98=
ppc_gdb_init=E2=80=99 [-Werror=3Dmissing-prototypes]                       =
                                                                           =
       =20
>   624 | void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)            =
   =20
>       |      ^~~~~~~~~~~~                                                =
                                =20
> cc1: all warnings being treated as errors
>=20
> >> > +void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
> >> > +{
> >> > +
> >> > +    if (pcc->insns_flags & PPC_FLOAT) {
> >>=20
> >> Watch the extra blank lines.
> >
> > Fixed in my tree.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--m3eVw2Gr5Hp5I8K5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCHbmoACgkQbDjKyiDZ
s5K8iA//XmEGJ45a5Gmt+ZAwKvdBz3HQbovV76c17qtrODXGhkx5+/LmdBvnwF7J
oDLgGX6jQyEqGzdQLUYMoDFSdM1iGtCUBpzYT2GW5+uUMErKPofXht+vEWE4DY1A
T5g67GZZIboURQOQRWKK5ssdj20YYiwcXlDqcQJ8Ske1E3HoSqNsiEOPpnjtOfm8
BEFgyXW23JhOqLNOxZKd5CXdNarodjYrhbq5oZqhkdDxRNEfont9orTOKMj88bcz
qzxJ2ZTjy682gQXocTM8rQfeeAEgLUDapU+s/US5ugRp8ntHXdXqyRK+p07ql1TA
fdIM3vlsaESghzMNv45AcxogV6UcuTrtFBCCam4GuBoPl8YOdfna8ZvrEWmTvwD5
TeEZoMlGM9hRCE0sQIssi+2O/Y2R2RKZfzHHv3EZRGgMFWEOTkv+wI22J1ITrbhB
qEnbIJVC/Rp2VCCuRNePscolINlk4l7tVJal8lqCol3+EBBQGoNEcjKK1slPe+nF
SXjX4M4A7rFRdz9HKd96u1z6qEfKZ19ya0+kU4vlotqJ3f0WT/pR2qZBOJ9XA8d+
1M6fr06grBw9QCaCENT2kMZHWE3O+X/EB/5hLCEt0IzhNrWmOnDyJN5eOyMAsTv3
fRql9n4+bmSkvMsbQ8BF7q3KQqphcF3ttVU1ILAlOXFRR8QCUmU=
=qqFF
-----END PGP SIGNATURE-----

--m3eVw2Gr5Hp5I8K5--

