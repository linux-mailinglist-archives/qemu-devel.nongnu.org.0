Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9273295AB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 03:36:47 +0100 (CET)
Received: from localhost ([::1]:43690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGuty-0006Wv-Q9
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 21:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGupR-00048J-9G; Mon, 01 Mar 2021 21:32:05 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:49911 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lGupN-0005ow-HF; Mon, 01 Mar 2021 21:32:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DqLk45Cq4z9sXV; Tue,  2 Mar 2021 13:31:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614652316;
 bh=kb7ZBmbJhK48TJ02QBnZKhVWMH3o/JEsRB3lrv4vBxU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VZq4dhU0DYShHLI6pDy6BYgMsVYHsN/3zsMQXVLGH4B6kW10S6yzpTS1+e4pxMHnd
 7QwtygXepc5jy1YE2cOcGwMBNEd4/0qrpBRxn9keGzxEEcGLJkgsFiiivQkdFy08LV
 KHGxY9V/1QjYJCw/YV0eJXAXZ9nDEaSURHRw7eMw=
Date: Tue, 2 Mar 2021 13:17:40 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH qemu v14] spapr: Implement Open Firmware client interface
Message-ID: <YD2gRMjlkPP+qkHH@yekko.fritz.box>
References: <20210224054130.4540-1-aik@ozlabs.ru>
 <161414573477.13232.17399914296173612265@c667a6b167f6>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JQgUZX156WgBN+h1"
Content-Disposition: inline
In-Reply-To: <161414573477.13232.17399914296173612265@c667a6b167f6>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: aik@ozlabs.ru, qemu-ppc@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JQgUZX156WgBN+h1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 09:48:56PM -0800, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20210224054130.4540-1-aik@ozlabs.ru/
>=20
>=20
>=20
> Hi,
>=20
> This series seems to have some coding style problems. See output below for
> more information:
>=20
> Type: series
> Message-id: 20210224054130.4540-1-aik@ozlabs.ru
> Subject: [PATCH qemu v14] spapr: Implement Open Firmware client interface
>=20
> =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> =3D=3D=3D TEST SCRIPT END =3D=3D=3D
>=20
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  * [new tag]         patchew/20210224054130.4540-1-aik@ozlabs.ru -> patch=
ew/20210224054130.4540-1-aik@ozlabs.ru
> Switched to a new branch 'test'
> 3fc539b spapr: Implement Open Firmware client interface
>=20
> =3D=3D=3D OUTPUT BEGIN =3D=3D=3D
> WARNING: line over 80 characters
> #268: FILE: hw/ppc/spapr.c:4463:
> +    ClientArchitectureSupportClass *casc =3D CLIENT_ARCHITECTURE_SUPPORT=
_CLASS(oc);

These style warnings in the qemu code proper will need to be fixed.

> WARNING: line over 80 characters
> #1431: FILE: hw/ppc/vof.h:29:
> +    INTERFACE_CHECK(ClientArchitectureSupport, (obj), TYPE_CLIENT_ARCHIT=
ECTURE_SUPPORT)
>=20
> ERROR: code indent should never use tabs
> #1548: FILE: pc-bios/vof/bootmem.c:5:
> +^Iuint64_t kern[2];$

I'm a bit torn about these ones in the vof code.  I think it might be
simpler to go to non-tab indenting there (for .c, not .S) just to
avoid checkpatch whining all the time.

Or if you really don't want to update the coding style in VOF, it
would probably be good to include a patch altering checkpatch so it
excludes the VOF code (as it already does for the code imported into
linux-headers).

>=20
> ERROR: code indent should never use tabs
> #1549: FILE: pc-bios/vof/bootmem.c:6:
> +^Iphandle chosen =3D ci_finddevice("/chosen");$
>=20
> ERROR: code indent should never use tabs
> #1551: FILE: pc-bios/vof/bootmem.c:8:
> +^Iif (ci_getprop(chosen, "qemu,boot-kernel", kern, sizeof(kern)) !=3D$
>=20
> ERROR: code indent should never use tabs
> #1552: FILE: pc-bios/vof/bootmem.c:9:
> +^I^I^Isizeof(kern))$
>=20
> ERROR: code indent should never use tabs
> #1553: FILE: pc-bios/vof/bootmem.c:10:
> +^I^Ireturn;$
>=20
> ERROR: code indent should never use tabs
> #1555: FILE: pc-bios/vof/bootmem.c:12:
> +^Ido_boot(kern[0], initrd, initrdsize);$
>=20
> ERROR: externs should be avoided in .c files
> #1574: FILE: pc-bios/vof/ci.c:12:
> +extern uint32_t ci_entry(uint32_t params);
>=20
> ERROR: externs should be avoided in .c files
> #1576: FILE: pc-bios/vof/ci.c:14:
> +extern unsigned long hv_rtas(unsigned long params);
>=20
> ERROR: externs should be avoided in .c files
> #1577: FILE: pc-bios/vof/ci.c:15:
> +extern unsigned int hv_rtas_size;
>=20
> ERROR: code indent should never use tabs
> #1581: FILE: pc-bios/vof/ci.c:19:
> +^Ivoid *rtasbase;$
>=20
> ERROR: code indent should never use tabs
> #1582: FILE: pc-bios/vof/ci.c:20:
> +^Iuint32_t rtassize =3D 0;$
>=20
> ERROR: code indent should never use tabs
> #1583: FILE: pc-bios/vof/ci.c:21:
> +^Iphandle rtas;$
>=20
> ERROR: code indent should never use tabs
> #1585: FILE: pc-bios/vof/ci.c:23:
> +^Iif (strcmp("call-method", (void *)(unsigned long) pargs->service))$
>=20
> ERROR: braces {} are necessary for all arms of this statement
> #1585: FILE: pc-bios/vof/ci.c:23:
> +       if (strcmp("call-method", (void *)(unsigned long) pargs->service))
> [...]
>=20
> ERROR: code indent should never use tabs
> #1586: FILE: pc-bios/vof/ci.c:24:
> +^I^Ireturn false;$
>=20
> ERROR: code indent should never use tabs
> #1588: FILE: pc-bios/vof/ci.c:26:
> +^Iif (strcmp("instantiate-rtas", (void *)(unsigned long) pargs->args[0])=
)$
>=20
> ERROR: braces {} are necessary for all arms of this statement
> #1588: FILE: pc-bios/vof/ci.c:26:
> +       if (strcmp("instantiate-rtas", (void *)(unsigned long) pargs->arg=
s[0]))
> [...]
>=20
> ERROR: code indent should never use tabs
> #1589: FILE: pc-bios/vof/ci.c:27:
> +^I^Ireturn false;$
>=20
> ERROR: code indent should never use tabs
> #1591: FILE: pc-bios/vof/ci.c:29:
> +^Irtas =3D ci_finddevice("/rtas");$
>=20
> ERROR: code indent should never use tabs
> #1592: FILE: pc-bios/vof/ci.c:30:
> +^Ici_getprop(rtas, "rtas-size", &rtassize, sizeof(rtassize));$
>=20
> ERROR: code indent should never use tabs
> #1593: FILE: pc-bios/vof/ci.c:31:
> +^Iif (rtassize < hv_rtas_size)$
>=20
> ERROR: braces {} are necessary for all arms of this statement
> #1593: FILE: pc-bios/vof/ci.c:31:
> +       if (rtassize < hv_rtas_size)
> [...]
>=20
> ERROR: code indent should never use tabs
> #1594: FILE: pc-bios/vof/ci.c:32:
> +^I^Ireturn false;$
>=20
> ERROR: code indent should never use tabs
> #1596: FILE: pc-bios/vof/ci.c:34:
> +^Irtasbase =3D (void *)(unsigned long) pargs->args[2];$
>=20
> ERROR: code indent should never use tabs
> #1598: FILE: pc-bios/vof/ci.c:36:
> +^Imemcpy(rtasbase, hv_rtas, hv_rtas_size);$
>=20
> ERROR: code indent should never use tabs
> #1599: FILE: pc-bios/vof/ci.c:37:
> +^Ipargs->args[pargs->nargs] =3D 0;$
>=20
> ERROR: code indent should never use tabs
> #1600: FILE: pc-bios/vof/ci.c:38:
> +^Ipargs->args[pargs->nargs + 1] =3D pargs->args[2];$
>=20
> ERROR: code indent should never use tabs
> #1602: FILE: pc-bios/vof/ci.c:40:
> +^Ireturn true;$
>=20
> ERROR: code indent should never use tabs
> #1607: FILE: pc-bios/vof/ci.c:45:
> +^Iif (!prom_handle((void *)(unsigned long) args))$
>=20
> ERROR: braces {} are necessary for all arms of this statement
> #1607: FILE: pc-bios/vof/ci.c:45:
> +       if (!prom_handle((void *)(unsigned long) args))
> [...]
>=20
> ERROR: code indent should never use tabs
> #1608: FILE: pc-bios/vof/ci.c:46:
> +^I^Ici_entry(args);$
>=20
> ERROR: braces {} are necessary for all arms of this statement
> #1622: FILE: pc-bios/vof/ci.c:60:
> +        for (i =3D 0; i < nargs; i++)
> [...]
>=20
> ERROR: braces {} are necessary for all arms of this statement
> #1626: FILE: pc-bios/vof/ci.c:64:
> +        for (i =3D 0; i < nret; i++)
> [...]
>=20
> ERROR: spaces required around that '+' (ctx:VxV)
> #1627: FILE: pc-bios/vof/ci.c:65:
> +                args.args[nargs+i] =3D 0;
>                                 ^
>=20
> ERROR: braces {} are necessary for all arms of this statement
> #1629: FILE: pc-bios/vof/ci.c:67:
> +        if (ci_entry((uint32_t)(&args)) < 0)
> [...]
>=20
> ERROR: code indent should never use tabs
> #1637: FILE: pc-bios/vof/ci.c:75:
> +^Icall_prom("exit", 0, 0);$
>=20
> ERROR: code indent should never use tabs
> #1642: FILE: pc-bios/vof/ci.c:80:
> +^Ireturn call_prom("finddevice", 1, 1, path);$
>=20
> ERROR: code indent should never use tabs
> #1647: FILE: pc-bios/vof/ci.c:85:
> +^Ireturn call_prom("getprop", 4, 1, ph, propname, prop, len);$
>=20
> ERROR: code indent should never use tabs
> #1652: FILE: pc-bios/vof/ci.c:90:
> +^Ireturn call_prom("open", 1, 1, path);$
>=20
> ERROR: code indent should never use tabs
> #1657: FILE: pc-bios/vof/ci.c:95:
> +^Icall_prom("close", 1, 0, ih);$
>=20
> ERROR: code indent should never use tabs
> #1662: FILE: pc-bios/vof/ci.c:100:
> +^Iuint32_t ret =3D call_prom("claim", 3, 1, ADDR(virt), size, align);$
>=20
> ERROR: code indent should never use tabs
> #1664: FILE: pc-bios/vof/ci.c:102:
> +^Ireturn (void *) (unsigned long) ret;$
>=20
> ERROR: code indent should never use tabs
> #1669: FILE: pc-bios/vof/ci.c:107:
> +^Ireturn call_prom("release", 2, 1, ADDR(virt), size);$
>=20
> ERROR: code indent should never use tabs
> #1792: FILE: pc-bios/vof/libc.c:5:
> +^Iint len =3D 0;$
>=20
> ERROR: code indent should never use tabs
> #1794: FILE: pc-bios/vof/libc.c:7:
> +^Iwhile (*s !=3D 0) {$
>=20
> ERROR: code indent should never use tabs
> #1795: FILE: pc-bios/vof/libc.c:8:
> +^I^Ilen +=3D 1;$
>=20
> ERROR: code indent should never use tabs
> #1796: FILE: pc-bios/vof/libc.c:9:
> +^I^Is +=3D 1;$
>=20
> ERROR: code indent should never use tabs
> #1797: FILE: pc-bios/vof/libc.c:10:
> +^I}$
>=20
> ERROR: code indent should never use tabs
> #1799: FILE: pc-bios/vof/libc.c:12:
> +^Ireturn len;$
>=20
> ERROR: braces {} are necessary for all arms of this statement
> #1805: FILE: pc-bios/vof/libc.c:18:
> +                if (*s1 !=3D *s2)
> [...]
>=20
> ERROR: braces {} are necessary for all arms of this statement
> #1833: FILE: pc-bios/vof/libc.c:46:
> +                if (*p1 !=3D *p2)
> [...]
>=20
> ERROR: return is not a function, parentheses are not required
> #1834: FILE: pc-bios/vof/libc.c:47:
> +                        return (*p1 - *p2);
>=20
> ERROR: else should follow close brace '}'
> #1857: FILE: pc-bios/vof/libc.c:70:
> +        }
> +        else {
>=20
> ERROR: code indent should never use tabs
> #1890: FILE: pc-bios/vof/main.c:6:
> +^Iregister unsigned long r3 __asm__("r3") =3D _r3;$
>=20
> ERROR: code indent should never use tabs
> #1891: FILE: pc-bios/vof/main.c:7:
> +^Iregister unsigned long r4 __asm__("r4") =3D _r4;$
>=20
> ERROR: code indent should never use tabs
> #1892: FILE: pc-bios/vof/main.c:8:
> +^Iregister unsigned long r5 __asm__("r5") =3D (unsigned long) _prom_entr=
y;$
>=20
> ERROR: code indent should never use tabs
> #1894: FILE: pc-bios/vof/main.c:10:
> +^I((client *)(uint32_t)addr)();$
>=20
> ERROR: code indent should never use tabs
> #1899: FILE: pc-bios/vof/main.c:15:
> +^Iregister unsigned long r3 __asm__("r3");$
>=20
> ERROR: code indent should never use tabs
> #1900: FILE: pc-bios/vof/main.c:16:
> +^Iregister unsigned long r4 __asm__("r4");$
>=20
> ERROR: code indent should never use tabs
> #1901: FILE: pc-bios/vof/main.c:17:
> +^Iregister unsigned long r5 __asm__("r5");$
>=20
> ERROR: code indent should never use tabs
> #1902: FILE: pc-bios/vof/main.c:18:
> +^Iuint64_t initrd =3D r3, initrdsize =3D r4;$
>=20
> ERROR: code indent should never use tabs
> #1904: FILE: pc-bios/vof/main.c:20:
> +^Iboot_from_memory(initrd, initrdsize);$
>=20
> ERROR: code indent should never use tabs
> #1905: FILE: pc-bios/vof/main.c:21:
> +^Ici_panic("*** No boot target ***\n");$
>=20
> total: 63 errors, 2 warnings, 1738 lines checked
>=20
> Commit 3fc539b07428 (spapr: Implement Open Firmware client interface) has=
 style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> =3D=3D=3D OUTPUT END =3D=3D=3D
>=20
> Test command exited with code: 1
>=20
>=20
> The full log is available at
> http://patchew.org/logs/20210224054130.4540-1-aik@ozlabs.ru/testing.check=
patch/?type=3Dmessage.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JQgUZX156WgBN+h1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmA9oEMACgkQbDjKyiDZ
s5KLCA//UoLsjsBr/cPVhLAaGZo9dl+fIFg7ZU/gJtwMX6NnjlbVcJa7yXsiQfjT
V6BhwcXYzsnEnza6WZDcg9smjA5bxZExx5gUyFwVHlXJ8n5TuMNS/cMNsQ/egWcH
A5sbvWyu1rWdstqL25gZTFy132ItxWxprJOE/35y8SJ7kJzbQzVze3riV8b/VSlf
h8T+HdNKxhiYZPCgaQubnNryA/+FOYSSoDqdDowEqeJHEhNJrD00L7wKHfUaoDxu
eLGlWmvYQsWM6JZcNr0tjBYCqmAf2ErQrU+r6SVKGpfqJRE/q0Y4Q+9XcSZ81siZ
kqkKqg7GPibVix209ZTUjxfYhYFUPoeovW+HJZoikuVPLVzICj2wOLs/7gVlQWvv
8u1AZ0Y69vZg5Dzc2bjZyi18m7P8gugAaUdkatXWW8DtCV9JOnprsaRuOuEo5tG1
HzcIUa76tIw8LTWP6NDshdQjtoXw8txhSGs3Nw/aX+amx/v9TsoXvpOmIpNVHTB4
nlvNTZpSnU3fUkLw4STiW/Br9PzJn25cAm4lhNuGbxGdgRpneQiYB35o1gvG3Mx0
ynE8EeIR9hMAmFNtpSeDPP4jKUuael+Z3ET7bYPCrQJuu9FV1mnkX5iHNeUv0cnh
cylO7moUGMVDkqvG+v+q6MXdt9ZbG319NLZGJa+Wr5QhABMWzGY=
=WDp/
-----END PGP SIGNATURE-----

--JQgUZX156WgBN+h1--

