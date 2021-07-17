Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BAD3CC6A2
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:26:05 +0200 (CEST)
Received: from localhost ([::1]:54960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4sl2-0005QZ-CE
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <intermediadc@hotmail.com>)
 id 1m4siD-0008Ar-3u; Sat, 17 Jul 2021 18:23:09 -0400
Received: from mail-vi1eur05olkn2105.outbound.protection.outlook.com
 ([40.92.90.105]:11233 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <intermediadc@hotmail.com>)
 id 1m4si8-0004Uw-P9; Sat, 17 Jul 2021 18:23:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdVuITiplXrkqU9guGCcWZMyUaVT8mqVF8ewYFqWbUdYQBIG/DnRKBLvBDigSuN04ph+UBCsUad+C/KKPWgDOoeH/nw6BhfEicw/I+3zT4hDpte0jiyDxs2Ng+twA3j0IU5wYIZQAOjDO62VzAB01Eo+vDh3RpqbQOEX9vl5j0N3Pn0VrFEWTAed1On5l3HNS+4P8mfA4F7HBna6WqESpc70jSUiuTHLCnJca93koIVnwmtPGphlit0kd1oGHSr+mT8xmi5FjX57r7hbOJbnhAqObdWVqhvBXi19KWE+4Iidx3uqoX4xQg8nWu7mc9j5zhrQh6wNRUvflzuxeL2bJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIEOi2+8SNgoJv22P2rqCzSsgQRfqtq0ZQLGqSXeQV8=;
 b=E2jzBh40nyBSDhZpouO13ds8dpnFrhkC4La6XkoBR5GR0Ng2ST8MmR+C5a1EzAuPvImL3iTr7keDyGHl7Qg3gsadSFe/bnv66jRpZChhbmTCz9Hxx8tCIcfpj0nha3E8FttgoOBcbbRAep67FkjV2aVUstZbubaMHYfXqAuxa3vVtPNDpfp9yh5SDbwjL0bmk796KFbWsifXK0PfiYrjFSXUP1eKvsb5B1bn8bmtzJZT7KBEkABbWsrCrKqgvizt03g7Vdsh8y5W4j8mOhLEX2mDkzci9EulHBkF6RKwpW0U4N9A/KlgqvD95o/HsInSW1KcfmrOwGrgSDBFDOeJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIEOi2+8SNgoJv22P2rqCzSsgQRfqtq0ZQLGqSXeQV8=;
 b=V+eddllB+444clr6LRsej4JPAH4ko1r7GvrTQumYpme/3A+GqTKrjkLxbBbegf3R3liv53WGpDm8OO8PfN5Q3UmborV5DsbrR4WONdjIALIStQkxkmdiqCG0zQt2Heme7aCkKhdMR8/Zz5b3/sx8AQMJ7ELXZlFr+T34j0ME2XYjCh8U79z76Ynof6ZGSlim5dxPcyIuZuJ9Til+okto3YlssXrCzygfcMBlu84Od2dk0X3MnxfcxopaWvFXVCyegT/Y986dYODdsVKUbUHskTazwa36vcoh0Yi6XvlFPTO0CV/5F08ns4O9knDOIXu86H1Wr/qJ4E80tDOoMOdeeQ==
Received: from AM7PR03MB6579.eurprd03.prod.outlook.com (2603:10a6:20b:1c3::22)
 by AM6PR03MB5494.eurprd03.prod.outlook.com (2603:10a6:20b:da::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Sat, 17 Jul
 2021 22:23:01 +0000
Received: from AM7PR03MB6579.eurprd03.prod.outlook.com
 ([fe80::edf6:af70:24e4:4e37]) by AM7PR03MB6579.eurprd03.prod.outlook.com
 ([fe80::edf6:af70:24e4:4e37%4]) with mapi id 15.20.4331.031; Sat, 17 Jul 2021
 22:23:01 +0000
From: luigi burdo <intermediadc@hotmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: R: R: [PULL 0/3] ppc-for-6.1 queue 20210713
Thread-Topic: R: [PULL 0/3] ppc-for-6.1 queue 20210713
Thread-Index: AQHXd4vsuqOtcHULYEO3zuYAiDlsqqtHPJMqgABfwgCAACg35A==
Date: Sat, 17 Jul 2021 22:23:01 +0000
Message-ID: <AM7PR03MB6579C268B41036A07A86A194C8109@AM7PR03MB6579.eurprd03.prod.outlook.com>
References: <20210713020736.28960-1-david@gibson.dropbear.id.au>
 <AM7PR03MB65797B7495CACEE7AA4C70A0C8109@AM7PR03MB6579.eurprd03.prod.outlook.com>,
 <ff76ae6-28a7-7139-9c58-ed507f438d89@eik.bme.hu>
In-Reply-To: <ff76ae6-28a7-7139-9c58-ed507f438d89@eik.bme.hu>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [yMOr6Aw95L9v3K+BLxabl4/PciHWe8TqiLgMsxLIX+K3L85Tjz1kyqvwyhOEMbsV]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6aedf37-1f9f-4ce2-918d-08d949717072
x-ms-traffictypediagnostic: AM6PR03MB5494:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0HwxoK6W8UTnrzwY3snjooChoCxt1tW+DxGmcq+M/YOsb3GeizsCag/J3lebBpeZsl+hmDrnJVT5ijkvnBWUS8Q7kZ2uN2z2bf8+H/ADcLG1o4rjuB47gU7oFH3KMzztD7wtycZkqv00N3GTpa/FDYrGtTc6lRPYnUYgXuJJD/0HQwn14GmR0ftu47Jjra2BZC2Lgm5ublGo/zgftT3vGnq7zZP7tlwkzJSuXXGLWEkXdTB/30Vjn+nxuGnW2D4boK4ZY8N0LKa6G9/d0iM68ljUjDjIYff4sHDjBPYteMBvosIeED96+YnAiZbeTwE7Lfeik4bmiUWl7HRntmwHV4yt8NN8gzjJ+4ByWCsyEX9OIY02YHR17dV6nKKaLQyDlzoWN1z4FrnS/xfKubxdFaMvMc3YoCy/YATah6wuXuPnYqfX7DaBV0zc0uJ6ruKM1MGoGaokdFSod2ij0cmByRjetXkKyTiLPQC64/eeRPA=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: OSCtuVlTAxeecUmQUlqJJXS0EeG2F6qmNP427pLKtm7x3hn4esFNQUi/lg0RqeJmjwGCAtX5JV+e90r24e6UjwJBEceQSFXGJiv89MFDsyueAlUq51d6NYk0NCu4QvX5Xv3GtsDZlKaXlLKgWehpw4KUBE35gg8tw4J7hQcEfE77jwUaxF1FxiQOqmO9mHRUA/oWrBJMD98JYtYlV3PpOw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_AM7PR03MB6579C268B41036A07A86A194C8109AM7PR03MB6579eurp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-3174-20-msonline-outlook-e50d8.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6579.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e6aedf37-1f9f-4ce2-918d-08d949717072
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2021 22:23:01.5279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5494
Received-SPF: pass client-ip=40.92.90.105;
 envelope-from=intermediadc@hotmail.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "groug@kaod.org" <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_AM7PR03MB6579C268B41036A07A86A194C8109AM7PR03MB6579eurp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Zoltan can be the gcc, in past on ppc we face the same kind of issue.
 i will ask some other guys in the debian ppc ML if can try to build qemu a=
nd see if they have the same issue. in positive case we will report to the =
mantainer.
Thanks
Luigi

________________________________
Da: BALATON Zoltan <balaton@eik.bme.hu>
Inviato: sabato 17 luglio 2021 21:55
A: luigi burdo <intermediadc@hotmail.com>
Cc: David Gibson <david@gibson.dropbear.id.au>; peter.maydell@linaro.org <p=
eter.maydell@linaro.org>; groug@kaod.org <groug@kaod.org>; qemu-ppc@nongnu.=
org <qemu-ppc@nongnu.org>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>
Oggetto: Re: R: [PULL 0/3] ppc-for-6.1 queue 20210713

On Sat, 17 Jul 2021, luigi burdo wrote:
> Hi
> i small report
> im try to build last relesase on a PowerMac G5 quad on debian sid PPC64 b=
ut ld exit with an error:

Looks like it's gcc that crashes not ld. If you're sure it's not a
hardware problem this may be a gcc bug. Sometimes big compile jobs can
break if a machine is not stable but if it always fails at the same place
and does not fail when compiling something else like a Linux kernel then
it's more likely to be an actual bug. That function has some crazy use of
macros so maybe it's exposing some bug in gcc. You could restrict what
targets you build with --target-list configure option of QEMU if you don't
actually need mips (compiling will be faster if you only build the targets
you need) or you can try with clang if available in your distro to check
if that works better. If this can be consistently reproduced you could try
reporting it to gcc as the error message suggests. Probably not much QEMU
can do about it.

Regards,
BALATON Zoltan

> gigi@debian:~/src/tags/ppc-for-6.1-20210713/build$ ninja
> [3864/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips_tc=
g_msa_helper.c.o
> FAILED: libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o
> cc -Ilibqemu-mipsel-softmmu.fa.p -I. -I.. -Itarget/mips -I../target/mips =
-I../capstone/include/capstone -Iqapi -Itrace -Iui -Iui/shader -I/usr/inclu=
de/pixman-1 -I/usr/include/glib-2.0 -I/usr/lib/powerpc64-linux-gnu/glib-2.0=
/include -fdiagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=
=3Dgnu11 -O2 -g -isystem /home/gigi/src/tags/ppc-for-6.1-20210713/linux-hea=
ders -isystem linux-headers -iquote . -iquote /home/gigi/src/tags/ppc-for-6=
.1-20210713 -iquote /home/gigi/src/tags/ppc-for-6.1-20210713/include -iquot=
e /home/gigi/src/tags/ppc-for-6.1-20210713/disas/libvixl -iquote /home/gigi=
/src/tags/ppc-for-6.1-20210713/tcg/ppc -pthread -U_FORTIFY_SOURCE -D_FORTIF=
Y_SOURCE=3D2 -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURC=
E -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-p=
rototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration =
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-=
self -Wignored-qualifiers -Wempt
 y-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-f=
allthrough=3D2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psa=
bi -fstack-protector-strong -fPIE -isystem../linux-headers -isystemlinux-he=
aders -DNEED_CPU_H '-DCONFIG_TARGET=3D"mipsel-softmmu-config-target.h"' '-D=
CONFIG_DEVICES=3D"mipsel-softmmu-config-devices.h"' -MD -MQ libqemu-mipsel-=
softmmu.fa.p/target_mips_tcg_msa_helper.c.o -MF libqemu-mipsel-softmmu.fa.p=
/target_mips_tcg_msa_helper.c.o.d -o libqemu-mipsel-softmmu.fa.p/target_mip=
s_tcg_msa_helper.c.o -c ../target/mips/tcg/msa_helper.c
> during RTL pass: sched1
> ../target/mips/tcg/msa_helper.c: In function =91helper_msa_fmin_df=92:
> ../target/mips/tcg/msa_helper.c:7536:1: internal compiler error: Errore d=
i segmentazione
> 7536 | }
>      | ^
> 0x3fffa7b8e1c3 generic_start_main
> ../csu/libc-start.c:308
> 0x3fffa7b8e3d3 __libc_start_main
> ../sysdeps/unix/sysv/linux/powerpc/libc-start.c:98
> Please submit a full bug report,
> with preprocessed source if appropriate.
> Please include the complete backtrace with any bug report.
> See <file:///usr/share/doc/gcc-10/README.Bugs> for instructions.
> [3869/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips_tc=
g_translate.c.o
> ninja: build stopped: subcommand failed.
>
> Ciao
> Luigi
> ________________________________
> Da: Qemu-ppc <qemu-ppc-bounces+intermediadc=3Dhotmail.com@nongnu.org> per=
 conto di David Gibson <david@gibson.dropbear.id.au>
> Inviato: marted=EC 13 luglio 2021 04:07
> A: peter.maydell@linaro.org <peter.maydell@linaro.org>; groug@kaod.org <g=
roug@kaod.org>
> Cc: qemu-ppc@nongnu.org <qemu-ppc@nongnu.org>; qemu-devel@nongnu.org <qem=
u-devel@nongnu.org>; David Gibson <david@gibson.dropbear.id.au>
> Oggetto: [PULL 0/3] ppc-for-6.1 queue 20210713
>
> The following changes since commit 57e28d34c0cb04abf7683ac6a12c87ede447c3=
20:
>
>  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210708'=
 into staging (2021-07-12 19:15:11 +0100)
>
> are available in the Git repository at:
>
>  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210713
>
> for you to fetch changes up to c785a40179b10ce2d7a4afdb04f63c98d53a1756:
>
>  mv64361: Remove extra break from a switch case (2021-07-13 10:12:17 +100=
0)
>
> ----------------------------------------------------------------
> ppc patch queue 2021-07-13
>
> I thought I'd sent the last PR before the 6.1 soft freeze, but
> unfortunately I need one more.  This last minute one puts in a SLOF
> update, along with a couple of bugfixes.
>
> ----------------------------------------------------------------
> Alexey Kardashevskiy (1):
>      pseries: Update SLOF firmware image
>
> BALATON Zoltan (2):
>      ppc/pegasos2: Allow setprop in VOF
>      mv64361: Remove extra break from a switch case
>
> hw/pci-host/mv64361.c |   1 -
> hw/ppc/pegasos2.c     |  10 ++++++++++
> pc-bios/README        |   2 +-
> pc-bios/slof.bin      | Bin 968888 -> 991744 bytes
> roms/SLOF             |   2 +-
> 5 files changed, 12 insertions(+), 3 deletions(-)
>
>

--_000_AM7PR03MB6579C268B41036A07A86A194C8109AM7PR03MB6579eurp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Hi Zoltan can be the gcc, in past on ppc we face the same kind of issue.</d=
iv>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
&nbsp;i will ask some other guys in the debian ppc ML if can try to build q=
emu and see if they have the same issue. in positive case we will report to=
 the mantainer.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Thanks</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Luigi</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>Da:</b> BALATON Zoltan &lt;bala=
ton@eik.bme.hu&gt;<br>
<b>Inviato:</b> sabato 17 luglio 2021 21:55<br>
<b>A:</b> luigi burdo &lt;intermediadc@hotmail.com&gt;<br>
<b>Cc:</b> David Gibson &lt;david@gibson.dropbear.id.au&gt;; peter.maydell@=
linaro.org &lt;peter.maydell@linaro.org&gt;; groug@kaod.org &lt;groug@kaod.=
org&gt;; qemu-ppc@nongnu.org &lt;qemu-ppc@nongnu.org&gt;; qemu-devel@nongnu=
.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Oggetto:</b> Re: R: [PULL 0/3] ppc-for-6.1 queue 20210713</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Sat, 17 Jul 2021, luigi burdo wrote:<br>
&gt; Hi<br>
&gt; i small report<br>
&gt; im try to build last relesase on a PowerMac G5 quad on debian sid PPC6=
4 but ld exit with an error:<br>
<br>
Looks like it's gcc that crashes not ld. If you're sure it's not a <br>
hardware problem this may be a gcc bug. Sometimes big compile jobs can <br>
break if a machine is not stable but if it always fails at the same place <=
br>
and does not fail when compiling something else like a Linux kernel then <b=
r>
it's more likely to be an actual bug. That function has some crazy use of <=
br>
macros so maybe it's exposing some bug in gcc. You could restrict what <br>
targets you build with --target-list configure option of QEMU if you don't =
<br>
actually need mips (compiling will be faster if you only build the targets =
<br>
you need) or you can try with clang if available in your distro to check <b=
r>
if that works better. If this can be consistently reproduced you could try =
<br>
reporting it to gcc as the error message suggests. Probably not much QEMU <=
br>
can do about it.<br>
<br>
Regards,<br>
BALATON Zoltan<br>
<br>
&gt; gigi@debian:~/src/tags/ppc-for-6.1-20210713/build$ ninja<br>
&gt; [3864/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips=
_tcg_msa_helper.c.o<br>
&gt; FAILED: libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o<br>
&gt; cc -Ilibqemu-mipsel-softmmu.fa.p -I. -I.. -Itarget/mips -I../target/mi=
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
format-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempt<br>
&nbsp;y-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimpli=
cit-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wn=
o-psabi -fstack-protector-strong -fPIE -isystem../linux-headers -isystemlin=
ux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D&quot;mipsel-softmmu-config-targ=
et.h&quot;'
 '-DCONFIG_DEVICES=3D&quot;mipsel-softmmu-config-devices.h&quot;' -MD -MQ l=
ibqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o -MF libqemu-mipse=
l-softmmu.fa.p/target_mips_tcg_msa_helper.c.o.d -o libqemu-mipsel-softmmu.f=
a.p/target_mips_tcg_msa_helper.c.o -c ../target/mips/tcg/msa_helper.c<br>
&gt; during RTL pass: sched1<br>
&gt; ../target/mips/tcg/msa_helper.c: In function =91helper_msa_fmin_df=92:=
<br>
&gt; ../target/mips/tcg/msa_helper.c:7536:1: internal compiler error: Error=
e di segmentazione<br>
&gt; 7536 | }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | ^<br>
&gt; 0x3fffa7b8e1c3 generic_start_main<br>
&gt; ../csu/libc-start.c:308<br>
&gt; 0x3fffa7b8e3d3 __libc_start_main<br>
&gt; ../sysdeps/unix/sysv/linux/powerpc/libc-start.c:98<br>
&gt; Please submit a full bug report,<br>
&gt; with preprocessed source if appropriate.<br>
&gt; Please include the complete backtrace with any bug report.<br>
&gt; See &lt;<a href=3D"file:///usr/share/doc/gcc-10/README.Bugs">file:///u=
sr/share/doc/gcc-10/README.Bugs</a>&gt; for instructions.<br>
&gt; [3869/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips=
_tcg_translate.c.o<br>
&gt; ninja: build stopped: subcommand failed.<br>
&gt;<br>
&gt; Ciao<br>
&gt; Luigi<br>
&gt; ________________________________<br>
&gt; Da: Qemu-ppc &lt;qemu-ppc-bounces+intermediadc=3Dhotmail.com@nongnu.or=
g&gt; per conto di David Gibson &lt;david@gibson.dropbear.id.au&gt;<br>
&gt; Inviato: marted=EC 13 luglio 2021 04:07<br>
&gt; A: peter.maydell@linaro.org &lt;peter.maydell@linaro.org&gt;; groug@ka=
od.org &lt;groug@kaod.org&gt;<br>
&gt; Cc: qemu-ppc@nongnu.org &lt;qemu-ppc@nongnu.org&gt;; qemu-devel@nongnu=
.org &lt;qemu-devel@nongnu.org&gt;; David Gibson &lt;david@gibson.dropbear.=
id.au&gt;<br>
&gt; Oggetto: [PULL 0/3] ppc-for-6.1 queue 20210713<br>
&gt;<br>
&gt; The following changes since commit 57e28d34c0cb04abf7683ac6a12c87ede44=
7c320:<br>
&gt;<br>
&gt;&nbsp; Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-2=
0210708' into staging (2021-07-12 19:15:11 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;&nbsp; <a href=3D"https://gitlab.com/dgibson/qemu.git">https://gitlab.c=
om/dgibson/qemu.git</a> tags/ppc-for-6.1-20210713<br>
&gt;<br>
&gt; for you to fetch changes up to c785a40179b10ce2d7a4afdb04f63c98d53a175=
6:<br>
&gt;<br>
&gt;&nbsp; mv64361: Remove extra break from a switch case (2021-07-13 10:12=
:17 +1000)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; ppc patch queue 2021-07-13<br>
&gt;<br>
&gt; I thought I'd sent the last PR before the 6.1 soft freeze, but<br>
&gt; unfortunately I need one more.&nbsp; This last minute one puts in a SL=
OF<br>
&gt; update, along with a couple of bugfixes.<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Alexey Kardashevskiy (1):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pseries: Update SLOF firmware image<br>
&gt;<br>
&gt; BALATON Zoltan (2):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ppc/pegasos2: Allow setprop in VOF<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv64361: Remove extra break from a switc=
h case<br>
&gt;<br>
&gt; hw/pci-host/mv64361.c |&nbsp;&nbsp; 1 -<br>
&gt; hw/ppc/pegasos2.c&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 10 ++++++++++<br>
&gt; pc-bios/README&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 +-<br>
&gt; pc-bios/slof.bin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | Bin 968888 -&gt; 9917=
44 bytes<br>
&gt; roms/SLOF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&gt; 5 files changed, 12 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt;</div>
</span></font></div>
</div>
</body>
</html>

--_000_AM7PR03MB6579C268B41036A07A86A194C8109AM7PR03MB6579eurp_--

