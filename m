Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39776DF261
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:59:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYBl-0000eO-DH; Wed, 12 Apr 2023 06:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1pmYBj-0000dZ-0l
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:58:55 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1pmYBg-0001AK-Gp
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:58:54 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1681297129; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=bZ2Xj4Zr5VCNWlv1UHyMafn+/jCYgW6iZmVKQvJ2DRCMlc8IM3Qcj9hwD/4IVgLLci
 ftGITVlecXd5I7I7zZuCSW0AHsxL/toBybHxx9mGLvtc66KQycVLo3dlW7qFJtoa3Vw5
 6Lr1JYOIfR3oBtBcfeg80+8QigKq7Xa4LoMwJHTVIS8ZoT+bAFqoPNz/tbJeVVs2mpah
 qNp6qs7p2gJA90BFBTdw7xn2rYMkxweto/TbwvSaEY/zrBaM1VBsIPh2SfCHNBsl5Rje
 ZTPUvqVWBcL2gIkW1/x9GHVu9LafBySfNqz5ww2XNxhQTNpWJVbqtBi/P0d7WUYWmD5N
 vq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1681297129;
 s=strato-dkim-0002; d=strato.com;
 h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
 bh=ZNtnjiocBclBVXeTWLuP6oS9tHWjDcFCBGbXY1yuKgM=;
 b=cWQGoh6/YrdtuGkqTFGQfPwZMj+bwHS4OKAElsLU2osWD6XiX83ax6cIEAjuyGcdgn
 7PqhQvMm38O3Qu2VtIi9LpDfziaWKZaA5YWbofHsG3YZWQXF8vr7nJS0iD5Xz1OskD5r
 usScsNlhV9RX3zJFxQAafO2hyoiWPGLwuv2gavzZrMo6XZSyfMUC3WGmZOoQBbJFQlKR
 YIYuCyzK6CS3PPQ9qPSnFcm1rK3Xr++uQ644RKNXaI5/PBpjzQ1jvAiwjdoVLFsiu8Ug
 iHUO7m6GuyzrL4DVqFM4wa0pIU0k9fuJMRaQxUC1XF1l7Myk7YkxWQ0rQCL8ggqPDvaI
 RtTw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1681297129;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
 bh=ZNtnjiocBclBVXeTWLuP6oS9tHWjDcFCBGbXY1yuKgM=;
 b=atTTNLvbvxQMVT1qIZhGreODT7zcTy8n/aEkY3kY1cB+ILiRTJdQJErOxpzVRPel6b
 rO7//0knKVCpZxpGDlUCbHRoWZpjLMx8ZXH0d5cdDWVFb92FScEg6/IVa8ySha8wjV5m
 D3HzBmZn7a0O3RWbxa79ZgLgxUx/JjXpD4cDcIrG5sDPJv1+opnouWJnDslwOMdyyfKj
 986Pwh0I8SrHNuafrowmz1rpoUgk5tgA5SRiikCseE8DHHAoSLA5JBxBPqzY/DRXm/8f
 tn1IorufpIoJOxxzuHdBngJYRkehpUTR7Vro2zT2YJL5AKbi33uG7pAW392GLurXeRk5
 xawQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1681297129;
 s=strato-dkim-0003; d=aepfle.de;
 h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
 bh=ZNtnjiocBclBVXeTWLuP6oS9tHWjDcFCBGbXY1yuKgM=;
 b=QyQKKOg2AqECbrfXtav2uyRGu2SiH7Ba8kFQacvLciwfBXSRs/2Dk9qZLygLCsPuoz
 0o2kNwZDK56aCcshotDw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AEWIPBvsPI52f2TnxTwFPmhSWhc+9ByBCFU+BA=="
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz3CAwmRSk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <qemu-devel@nongnu.org>;
 Wed, 12 Apr 2023 12:58:48 +0200 (CEST)
Date: Wed, 12 Apr 2023 12:58:42 +0200
From: Olaf Hering <olaf@aepfle.de>
To: qemu-devel@nongnu.org
Subject: qemu v8.0-rc3 fails to compile with Xen
Message-ID: <20230412125842.573dc418.olaf@aepfle.de>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem,
 kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J8xZ3FGht6cBF6IZ64TOzHP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=85.215.255.21; envelope-from=olaf@aepfle.de;
 helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

--Sig_/J8xZ3FGht6cBF6IZ64TOzHP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Qemu v7.2.1 can be compiled with Xen 4.6, but v8.0.0-rc3 needs now at least=
 Xen 4.7.

Is Xen older than 4.7 still a supported target? There is a lot compat code,=
 and the meson checks go back to 4.2.

Olaf


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
In file included from ../hw/xen/xen-operations.c:16:0:
/Qc6f3cbca32/include/hw/xen/xen_native.h: In function 'xenforeignmemory_map=
2':
/Qc6f3cbca32/include/hw/xen/xen_native.h:121:12: warning: implicit declarat=
ion of function 'xenforeignmemory_map'; did you mean 'xenforeignmemory_map2=
'? [-Wimplicit-function-declaration]
     return xenforeignmemory_map(h, dom, prot, pages, arr, err);
            ^~~~~~~~~~~~~~~~~~~~
            xenforeignmemory_map2
/Qc6f3cbca32/include/hw/xen/xen_native.h:121:12: warning: nested extern dec=
laration of 'xenforeignmemory_map' [-Wnested-externs]
/Qc6f3cbca32/include/hw/xen/xen_native.h:121:12: warning: return makes poin=
ter from integer without a cast [-Wint-conversion]
     return xenforeignmemory_map(h, dom, prot, pages, arr, err);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../hw/xen/xen-operations.c: At top level:
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
../hw/xen/xen-operations.c:229:57: error: unknown type name 'xfn_pfn_t'; di=
d you mean 'xen_pfn_t'?
                                           size_t pages, xfn_pfn_t *pfns,
                                                         ^~~~~~~~~
                                                         xen_pfn_t
../hw/xen/xen-operations.c:262:12: error: 'libxenforeignmem_backend_map' un=
declared here (not in a function); did you mean 'libxenforeignmem_backend_u=
nmap'?
     .map =3D libxenforeignmem_backend_map,
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
            libxenforeignmem_backend_unmap
ninja: build stopped: subcommand failed.
make[1]: *** [Makefile:165: run-ninja] Error 1

--Sig_/J8xZ3FGht6cBF6IZ64TOzHP
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmQ2juIACgkQ86SN7mm1
DoBneA//bLUqkWNtMkEvqZQwYEhTWvsWPDmyEcS/udo8IfJ8jvAqDvUkCtLs/3sX
sp8+zEkpcCfGQqRZodOIhKchWv2Y0bC39XpA5F8i6QBFfnkobAnVX0hRINg/bBP/
31Pd/XEEpCbS94dz0ZQro5ezgLaLJtsnm3Yt6AaeZkKYhDcWymKbD3FmCclYnIQ+
594NVfkc0yvQrGMaQaFeUYJG0ZcFxeTEc5mhEzRNcz7d/JcEa1mE5vPJJ+KrdwDL
uTwW5G5neR6ioccZToOn3KqKpUyYQdl0kWyzsKXczYEp3pVsEcvLuExDmY0nCENU
T+nUSJ8FEXP+y2kvqCU3Pu2q0Vbm3fnScu5B6egIbTHSVsdVmRpJdpbbCJlPR5Cc
jZRsmlJMs7NKF81+aaYEKujwo23SOfo46eB5CiP4uUehifYktRUTFPKPah1eSXPZ
Guf58D1SyooCZhVY+aGZQYoidxycMc4i+z59LbcG6oMQwI6R1lLNgIeyetNG+s9U
5ZfbpH+TA4RK3lwM++Es+GZbxZXZOFrIQ3GIJdoyA4XSIJpFWwDYVvIWrgjoVyRk
kE8wSBk4bTZEsfzhW6x88S843VMtbesks4569BfvSWSk4dD6nByeOTpTV/FKU60P
LJI/8walgZ31r0M77FyaIgdWOId+1QU16eTxP5Bm7vDAYEO82qo=
=KEbe
-----END PGP SIGNATURE-----

--Sig_/J8xZ3FGht6cBF6IZ64TOzHP--

