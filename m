Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13C23CC5FD
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:56:45 +0200 (CEST)
Received: from localhost ([::1]:59368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4qQX-0002Ji-0v
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m4qPb-0001UB-V3; Sat, 17 Jul 2021 15:55:47 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:17318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m4qPY-0006nk-RJ; Sat, 17 Jul 2021 15:55:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F045C74570C;
 Sat, 17 Jul 2021 21:55:39 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 67F2474570B; Sat, 17 Jul 2021 21:55:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 65DAB7456B7;
 Sat, 17 Jul 2021 21:55:38 +0200 (CEST)
Date: Sat, 17 Jul 2021 21:55:38 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: luigi burdo <intermediadc@hotmail.com>
Subject: Re: R: [PULL 0/3] ppc-for-6.1 queue 20210713
In-Reply-To: <AM7PR03MB65797B7495CACEE7AA4C70A0C8109@AM7PR03MB6579.eurprd03.prod.outlook.com>
Message-ID: <ff76ae6-28a7-7139-9c58-ed507f438d89@eik.bme.hu>
References: <20210713020736.28960-1-david@gibson.dropbear.id.au>
 <AM7PR03MB65797B7495CACEE7AA4C70A0C8109@AM7PR03MB6579.eurprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-365948322-1626551738=:7381"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "groug@kaod.org" <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-365948322-1626551738=:7381
Content-Type: text/plain; charset=Windows-1252; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 17 Jul 2021, luigi burdo wrote:
> Hi
> i small report
> im try to build last relesase on a PowerMac G5 quad on debian sid PPC64 but ld exit with an error:

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
> [3864/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o
> FAILED: libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o
> cc -Ilibqemu-mipsel-softmmu.fa.p -I. -I.. -Itarget/mips -I../target/mips -I../capstone/include/capstone -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/pixman-1 -I/usr/include/glib-2.0 -I/usr/lib/powerpc64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto -pipe -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem /home/gigi/src/tags/ppc-for-6.1-20210713/linux-headers -isystem linux-headers -iquote . -iquote /home/gigi/src/tags/ppc-for-6.1-20210713 -iquote /home/gigi/src/tags/ppc-for-6.1-20210713/include -iquote /home/gigi/src/tags/ppc-for-6.1-20210713/disas/libvixl -iquote /home/gigi/src/tags/ppc-for-6.1-20210713/tcg/ppc -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempt
 y-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE -isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET="mipsel-softmmu-config-target.h"' '-DCONFIG_DEVICES="mipsel-softmmu-config-devices.h"' -MD -MQ libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o -MF libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o.d -o libqemu-mipsel-softmmu.fa.p/target_mips_tcg_msa_helper.c.o -c ../target/mips/tcg/msa_helper.c
> during RTL pass: sched1
> ../target/mips/tcg/msa_helper.c: In function ‘helper_msa_fmin_df’:
> ../target/mips/tcg/msa_helper.c:7536:1: internal compiler error: Errore di segmentazione
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
> [3869/9215] Compiling C object libqemu-mipsel-softmmu.fa.p/target_mips_tcg_translate.c.o
> ninja: build stopped: subcommand failed.
>
> Ciao
> Luigi
> ________________________________
> Da: Qemu-ppc <qemu-ppc-bounces+intermediadc=hotmail.com@nongnu.org> per conto di David Gibson <david@gibson.dropbear.id.au>
> Inviato: martedì 13 luglio 2021 04:07
> A: peter.maydell@linaro.org <peter.maydell@linaro.org>; groug@kaod.org <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org <qemu-ppc@nongnu.org>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>; David Gibson <david@gibson.dropbear.id.au>
> Oggetto: [PULL 0/3] ppc-for-6.1 queue 20210713
>
> The following changes since commit 57e28d34c0cb04abf7683ac6a12c87ede447c320:
>
>  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210708' into staging (2021-07-12 19:15:11 +0100)
>
> are available in the Git repository at:
>
>  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210713
>
> for you to fetch changes up to c785a40179b10ce2d7a4afdb04f63c98d53a1756:
>
>  mv64361: Remove extra break from a switch case (2021-07-13 10:12:17 +1000)
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
--3866299591-365948322-1626551738=:7381--

