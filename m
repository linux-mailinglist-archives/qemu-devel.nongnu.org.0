Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CD33CC583
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 20:26:41 +0200 (CEST)
Received: from localhost ([::1]:57488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4p1M-0001Aa-34
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 14:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <intermediadc@hotmail.com>)
 id 1m4p0I-0000KD-F9; Sat, 17 Jul 2021 14:25:34 -0400
Received: from mail-oln040092068025.outbound.protection.outlook.com
 ([40.92.68.25]:50329 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <intermediadc@hotmail.com>)
 id 1m4p0G-0005SQ-9u; Sat, 17 Jul 2021 14:25:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pk4DKbr6CyLNcKiTD+M2DLYZXHD/WCLR7aqZ67Z0FKzGtrsvpE3aTbZISJKlu2G8zRm7DK/9nlBZa5o/bNcG5j4EdmcOxyawpvpWKdz3bmUN3w2RPxQ1GGuwMV5RKMY2BvOic11fIq41oSTt1GHSKvGqZR84NwPAf0M6HeZANnuDIOQNfgldS+fbGs6p9fBEXtvx6RUJTu1OwUea0n7k1fB4iE+zAdZIz+RNLsqP0odKO3/rx9uYoXi2KT/2YEhUKAOXO2/SY/EgkXeV0p028b4zTHqe2vjVfWR56hCqCa+fQ+v6cF03jxcaNSC6bs3dqpvMtKmhgw9YzuYZe0UwkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0qKu9XrhNHuWoL73v9gnTMmbDnTVgjgr2uR9wBlDpk=;
 b=AmAQjvoenPPsimRXgc1C9SvRHeXEWldjXmVF2B310+87qkxSThUWJ1A3u5cf55j6x9kVFoUij6FvHU+k4B7E8AYAnsFRg+oEWjk8VBCfNKKOPZh45q4Li3OrrefxDLfaseg3P2bevVOAobuvZqV7sMY/JZrvj6bH5ZagSNRb2TexYOVN/rqqeUfprAhQPFPsbI+EO1T9Sefgu6l9qi+hoOrzT2l575NSDni6oQypjv/ayRdWkypftCTNy788ppZBHWdjXHZ/oxmTSNAE/ChWB1WeML3UoMeNGk7442v/ZQ/Yc2+CgHNHFyfFnDmOZ81oY8xgnpX5JhZaTuUTl5pDLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0qKu9XrhNHuWoL73v9gnTMmbDnTVgjgr2uR9wBlDpk=;
 b=TB6TQkGRANxKSYejNgc/iZOLyU1akAEh1sIgetC2GSTky3m4zOTVjpoRUm8R+lzpJ230DB84c3g0f3giH3XCSurYuahnMacOgVkxQmRf75vOIaYaXvmApbYqhIQHr160OHMJ0nO8kwArIuWI5uQYim3sogfGnynnDh5c4eyVIDGY4NYUr6yAIgG8HKqKESZZwRYrl2R95PendG0yjGA+YdICVlpn744w2WdpUrjDOat0tNYtUFKNL3EW/fv+N0b0ldWsO5OGBZGN7kf1ZegTdFqv5sszYcWbug4a0yS8rSzZeIz6x6fVlh6Gofpa1hewHt6DAFHdqaUMDLIQ+JHQWg==
Received: from AM7PR03MB6579.eurprd03.prod.outlook.com (2603:10a6:20b:1c3::22)
 by AM6PR03MB3926.eurprd03.prod.outlook.com (2603:10a6:20b:1c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Sat, 17 Jul
 2021 18:25:27 +0000
Received: from AM7PR03MB6579.eurprd03.prod.outlook.com
 ([fe80::edf6:af70:24e4:4e37]) by AM7PR03MB6579.eurprd03.prod.outlook.com
 ([fe80::edf6:af70:24e4:4e37%4]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 18:25:27 +0000
From: luigi burdo <intermediadc@hotmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "groug@kaod.org" <groug@kaod.org>
Subject: R: [PULL 0/3] ppc-for-6.1 queue 20210713
Thread-Topic: [PULL 0/3] ppc-for-6.1 queue 20210713
Thread-Index: AQHXd4vsuqOtcHULYEO3zuYAiDlsqqtHPJMq
Date: Sat, 17 Jul 2021 18:25:27 +0000
Message-ID: <AM7PR03MB65797B7495CACEE7AA4C70A0C8109@AM7PR03MB6579.eurprd03.prod.outlook.com>
References: <20210713020736.28960-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210713020736.28960-1-david@gibson.dropbear.id.au>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [JPH9EnDizDdnIi2zF5KjL/VbJwPc6rIND3zjesCn2y+guwk5BoDYRx5daYFskzN1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd812f22-35e8-41af-f57c-08d949504077
x-ms-traffictypediagnostic: AM6PR03MB3926:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fn6sSwKsJ2oYQOnUh7uYfLc3ph4NBLeE33rd2XC36xBJ+UJ8QfiwOZeS+S5E+ghTm0NxwegFW1noP7C/MDwMMSdSNpLjP7kXVQFxBeLEkmznc++BS5HmbhSt5aed+LghZfJ9ffyAA8HL0RKpWQHp2P7vjzrULVxODoaCpHCmgGub8Q0XJjEFQPiBhe5to9AdgUSciPmsCsD376ttn9qrnWDFqetYZZdu8jqjFn8RyVtQAU5kf7N1rH0sHl9rT37iQSQ5JZgYHJQA5x+HSYlKKg3ue481d3ydTD907XcUJsIDERtfExqkY958qNG7EO2eL70MmKSnjK0GMuXz2kXB8K6ZoqnevAU6ZPA1vuv8xDpY5eSvEEDCfxkHzAodhdzH+CdpFdsxTuWJdcDYZwwRYyqRsGOi8pPLCWcRqEN89EJdftqg7qVZcTKDcZupnM6MPz5KNWv4M+F3fn2u8dIprRjUa1NHOS0Wls3LyYSCXvM=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: YQhCfKiM5C40oB6f0aycdJlrUUcrG77YX0n37AIkmTM+VY17f7RzPSEYCjd2pq4l/VLYkNMWEdH194estSRO3+xRuxj5ZXGo1jiYeveGA51wiSsmY9LUVOyIHf3QgHjh9NbLmFcJ/6KMSDJz23i5zwpGVrRFCRACfsLqpM1DF6YSaCopZDry8NO9XMJ5R0CQlL2HJQdJgaFYL+ce15qtPA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_AM7PR03MB65797B7495CACEE7AA4C70A0C8109AM7PR03MB6579eurp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-e50d8.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6579.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bd812f22-35e8-41af-f57c-08d949504077
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2021 18:25:27.7161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3926
Received-SPF: pass client-ip=40.92.68.25;
 envelope-from=intermediadc@hotmail.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_AM7PR03MB65797B7495CACEE7AA4C70A0C8109AM7PR03MB6579eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi
i small report
im try to build last relesase on a PowerMac G5 quad on debian sid PPC64 but=
 ld exit with an error:


gigi@debian:~/src/tags/ppc-for-6.1-20210713/build$ ninja
[3864/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips_tcg_=
msa_helper.c.o
FAILED: libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o
cc -Ilibqemu-mipsel-softmmu.fa.p -I. -I.. -Itarget/mips -I../target/mips -I=
../capstone/include/capstone -Iqapi -Itrace -Iui -Iui/shader -I/usr/include=
/pixman-1 -I/usr/include/glib-2.0 -I/usr/lib/powerpc64-linux-gnu/glib-2.0/i=
nclude -fdiagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=3D=
gnu11 -O2 -g -isystem /home/gigi/src/tags/ppc-for-6.1-20210713/linux-header=
s -isystem linux-headers -iquote . -iquote /home/gigi/src/tags/ppc-for-6.1-=
20210713 -iquote /home/gigi/src/tags/ppc-for-6.1-20210713/include -iquote /=
home/gigi/src/tags/ppc-for-6.1-20210713/disas/libvixl -iquote /home/gigi/sr=
c/tags/ppc-for-6.1-20210713/tcg/ppc -pthread -U_FORTIFY_SOURCE -D_FORTIFY_S=
OURCE=3D2 -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -=
Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prot=
otypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wo=
ld-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-sel=
f -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpan=
sion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs -Wno-s=
hift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -isystem../li=
nux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"mipsel-s=
oftmmu-config-target.h"' '-DCONFIG_DEVICES=3D"mipsel-softmmu-config-devices=
.h"' -MD -MQ libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o -MF=
 libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o.d -o libqemu-mi=
psel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o -c ../target/mips/tcg/msa_=
helper.c
during RTL pass: sched1
../target/mips/tcg/msa_helper.c: In function =91helper_msa_fmin_df=92:
../target/mips/tcg/msa_helper.c:7536:1: internal compiler error: Errore di =
segmentazione
 7536 | }
      | ^
0x3fffa7b8e1c3 generic_start_main
../csu/libc-start.c:308
0x3fffa7b8e3d3 __libc_start_main
../sysdeps/unix/sysv/linux/powerpc/libc-start.c:98
Please submit a full bug report,
with preprocessed source if appropriate.
Please include the complete backtrace with any bug report.
See <file:///usr/share/doc/gcc-10/README.Bugs> for instructions.
[3869/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips_tcg_=
translate.c.o
ninja: build stopped: subcommand failed.

Ciao
Luigi
________________________________
Da: Qemu-ppc <qemu-ppc-bounces+intermediadc=3Dhotmail.com@nongnu.org> per c=
onto di David Gibson <david@gibson.dropbear.id.au>
Inviato: marted=EC 13 luglio 2021 04:07
A: peter.maydell@linaro.org <peter.maydell@linaro.org>; groug@kaod.org <gro=
ug@kaod.org>
Cc: qemu-ppc@nongnu.org <qemu-ppc@nongnu.org>; qemu-devel@nongnu.org <qemu-=
devel@nongnu.org>; David Gibson <david@gibson.dropbear.id.au>
Oggetto: [PULL 0/3] ppc-for-6.1 queue 20210713

The following changes since commit 57e28d34c0cb04abf7683ac6a12c87ede447c320=
:

  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210708' =
into staging (2021-07-12 19:15:11 +0100)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210713

for you to fetch changes up to c785a40179b10ce2d7a4afdb04f63c98d53a1756:

  mv64361: Remove extra break from a switch case (2021-07-13 10:12:17 +1000=
)

----------------------------------------------------------------
ppc patch queue 2021-07-13

I thought I'd sent the last PR before the 6.1 soft freeze, but
unfortunately I need one more.  This last minute one puts in a SLOF
update, along with a couple of bugfixes.

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

BALATON Zoltan (2):
      ppc/pegasos2: Allow setprop in VOF
      mv64361: Remove extra break from a switch case

 hw/pci-host/mv64361.c |   1 -
 hw/ppc/pegasos2.c     |  10 ++++++++++
 pc-bios/README        |   2 +-
 pc-bios/slof.bin      | Bin 968888 -> 991744 bytes
 roms/SLOF             |   2 +-
 5 files changed, 12 insertions(+), 3 deletions(-)


--_000_AM7PR03MB65797B7495CACEE7AA4C70A0C8109AM7PR03MB6579eurp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
Hi&nbsp;</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
i small report&nbsp;</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
im try to build last relesase on a PowerMac G5 quad on debian sid PPC64 but=
 ld exit with an error:</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
gigi@debian:~/src/tags/ppc-for-6.1-20210713/build$ ninja
<div>[3864/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips=
_tcg_msa_helper.c.o</div>
<div>FAILED: libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o </d=
iv>
<div>cc -Ilibqemu-mipsel-softmmu.fa.p -I. -I.. -Itarget/mips -I../target/mi=
ps -I../capstone/include/capstone -Iqapi -Itrace -Iui -Iui/shader -I/usr/in=
clude/pixman-1 -I/usr/include/glib-2.0 -I/usr/lib/powerpc64-linux-gnu/glib-=
2.0/include -fdiagnostics-color=3Dauto
 -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu11 -O2 -g -isystem /home/gigi/=
src/tags/ppc-for-6.1-20210713/linux-headers -isystem linux-headers -iquote =
. -iquote /home/gigi/src/tags/ppc-for-6.1-20210713 -iquote /home/gigi/src/t=
ags/ppc-for-6.1-20210713/include -iquote
 /home/gigi/src/tags/ppc-for-6.1-20210713/disas/libvixl -iquote /home/gigi/=
src/tags/ppc-for-6.1-20210713/tcg/ppc -pthread -U_FORTIFY_SOURCE -D_FORTIFY=
_SOURCE=3D2 -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE=
 -Wstrict-prototypes -Wredundant-decls
 -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-com=
mon -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -W=
format-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body =
-Wnested-externs -Wendif-labels
 -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dir=
s -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -isys=
tem../linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D&=
quot;mipsel-softmmu-config-target.h&quot;' '-DCONFIG_DEVICES=3D&quot;mipsel=
-softmmu-config-devices.h&quot;'
 -MD -MQ libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o -MF lib=
qemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o.d -o libqemu-mipsel=
-softmmu.fa.p/target_mips_tcg_msa_helper.c.o -c ../target/mips/tcg/msa_help=
er.c</div>
<div>during RTL pass: sched1</div>
<div>../target/mips/tcg/msa_helper.c: In function =91helper_msa_fmin_df=92:=
</div>
<div>../target/mips/tcg/msa_helper.c:7536:1: internal compiler error: Error=
e di segmentazione</div>
<div>&nbsp;7536 | }</div>
<div>&nbsp; &nbsp; &nbsp; | ^</div>
<div>0x3fffa7b8e1c3 generic_start_main</div>
<div>../csu/libc-start.c:308</div>
<div>0x3fffa7b8e3d3 __libc_start_main</div>
<div>../sysdeps/unix/sysv/linux/powerpc/libc-start.c:98</div>
<div>Please submit a full bug report,</div>
<div>with preprocessed source if appropriate.</div>
<div>Please include the complete backtrace with any bug report.</div>
<div>See &lt;file:///usr/share/doc/gcc-10/README.Bugs&gt; for instructions.=
</div>
<div>[3869/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips=
_tcg_translate.c.o</div>
<span>ninja: build stopped: subcommand failed.</span><br>
</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
Ciao&nbsp;</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
Luigi&nbsp;</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>Da:</b> Qemu-ppc &lt;qemu-ppc-b=
ounces+intermediadc=3Dhotmail.com@nongnu.org&gt; per conto di David Gibson =
&lt;david@gibson.dropbear.id.au&gt;<br>
<b>Inviato:</b> marted=EC 13 luglio 2021 04:07<br>
<b>A:</b> peter.maydell@linaro.org &lt;peter.maydell@linaro.org&gt;; groug@=
kaod.org &lt;groug@kaod.org&gt;<br>
<b>Cc:</b> qemu-ppc@nongnu.org &lt;qemu-ppc@nongnu.org&gt;; qemu-devel@nong=
nu.org &lt;qemu-devel@nongnu.org&gt;; David Gibson &lt;david@gibson.dropbea=
r.id.au&gt;<br>
<b>Oggetto:</b> [PULL 0/3] ppc-for-6.1 queue 20210713</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">The following changes since commit 57e28d34c0cb04a=
bf7683ac6a12c87ede447c320:<br>
<br>
&nbsp; Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210=
708' into staging (2021-07-12 19:15:11 +0100)<br>
<br>
are available in the Git repository at:<br>
<br>
&nbsp; <a href=3D"https://gitlab.com/dgibson/qemu.git">https://gitlab.com/d=
gibson/qemu.git</a> tags/ppc-for-6.1-20210713<br>
<br>
for you to fetch changes up to c785a40179b10ce2d7a4afdb04f63c98d53a1756:<br=
>
<br>
&nbsp; mv64361: Remove extra break from a switch case (2021-07-13 10:12:17 =
+1000)<br>
<br>
----------------------------------------------------------------<br>
ppc patch queue 2021-07-13<br>
<br>
I thought I'd sent the last PR before the 6.1 soft freeze, but<br>
unfortunately I need one more.&nbsp; This last minute one puts in a SLOF<br=
>
update, along with a couple of bugfixes.<br>
<br>
----------------------------------------------------------------<br>
Alexey Kardashevskiy (1):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pseries: Update SLOF firmware image<br>
<br>
BALATON Zoltan (2):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ppc/pegasos2: Allow setprop in VOF<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv64361: Remove extra break from a switch ca=
se<br>
<br>
&nbsp;hw/pci-host/mv64361.c |&nbsp;&nbsp; 1 -<br>
&nbsp;hw/ppc/pegasos2.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 10 ++++++++++<br>
&nbsp;pc-bios/README&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp=
; 2 +-<br>
&nbsp;pc-bios/slof.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 968888 -&gt; 991=
744 bytes<br>
&nbsp;roms/SLOF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;5 files changed, 12 insertions(+), 3 deletions(-)<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_AM7PR03MB65797B7495CACEE7AA4C70A0C8109AM7PR03MB6579eurp_--

