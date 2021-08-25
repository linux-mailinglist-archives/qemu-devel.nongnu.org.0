Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1864F3F7042
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:18:44 +0200 (CEST)
Received: from localhost ([::1]:58026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInBL-0006FO-5a
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mIn8b-000842-KK
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:15:53 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:41998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mIn8Y-000464-S6
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:15:53 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 0AA933F796
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629875747;
 bh=wZo7hnF7FIp398/dvQLLEMAO/sSd6OzR8kGgHb1v0lo=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=IUIPaZXVsnKQLuWP6y2e9ea8kiQaj9/QQNx2iPLdW9GjUxeWDVzR+6dKKtAmor4Xg
 SdphTpVN/T1pF37UU4HkxqVOrHseDcbDEEGTgFsFu/O42BbsfZdylyXt3O4Pj6pOnW
 OEK+uFUsR68224XMyv7JRAV3A839C5rL64EmMZrqYIyEMYlD2pt/KzOyu2Jwvo7Sbe
 VOXmG+entbMsEt+DvSKb4tf7gCZ7H23NAe9K9GPpcIZYyvN36WLE69tu9rjE6TTks9
 ECR/lGpcbskMAtbAuMsBSGa9zv/2LuDf7pvnaSVXnAa+EmvxytaF3grUaY/uCskHSc
 /Ji+TCmSjFlmg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 301CC2E81DE
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:15:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:09:01 -0000
From: Thomas Huth <1914870@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd th-huth
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161262934089.14056.18327208796436481224.malonedeb@soybean.canonical.com>
Message-Id: <162987534212.10640.14466425077655483081.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1914870] Re: libvixl compilation failure on Debian unstable
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 0c62138ed7a73450ad2bbcd5c6cfac3912199c0a
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1914870 <1914870@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914870

Title:
  libvixl compilation failure on Debian unstable

Status in QEMU:
  Fix Released

Bug description:
  As of commit 0e324626306:

  $ lsb_release -d
  Description:    Debian GNU/Linux bullseye/sid

  Project version: 5.2.50
  C compiler for the host machine: cc (gcc 10.2.1 "cc (Debian 10.2.1-6) 10.=
2.1 20210110")
  C linker for the host machine: cc ld.bfd 2.35.1
  C++ compiler for the host machine: c++ (gcc 10.2.1 "c++ (Debian 10.2.1-6)=
 10.2.1 20210110")
  C++ linker for the host machine: c++ ld.bfd 2.35.1

  [6/79] Compiling C++ object libcommon.fa.p/disas_libvixl_vixl_utils.cc.o
  FAILED: libcommon.fa.p/disas_libvixl_vixl_utils.cc.o=20
  c++ -Ilibcommon.fa.p -I. -I.. -Iqapi -Itrace -Iui/shader -I/usr/include/c=
apstone -I/usr/include/glib-2.0 -I/usr/lib/hppa-linux-gnu/glib-2.0/include =
-fdiagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Wnon-virtual-dtor -We=
rror -std=3Dgnu++11 -O2 -g -isystem /home/philmd/qemu/linux-headers -isyste=
m linux-headers -iquote . -iquote /home/philmd/qemu -iquote /home/philmd/qe=
mu/include -iquote /home/philmd/qemu/disas/libvixl -iquote /home/philmd/qem=
u/tcg/hppa -iquote /home/philmd/qemu/accel/tcg -pthread -D__STDC_LIMIT_MACR=
OS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -U_FORTIFY_SOURCE -D_FOR=
TIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE =
-Wundef -Wwrite-strings -fno-strict-aliasing -fno-common -fwrapv -Wtype-lim=
its -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty=
-body -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno=
-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fPIE -MD -MQ li=
bcommon.fa.p/disas_libvixl_vixl_utils.cc.o -MF libcommon.fa.p/disas_libvixl=
_vixl_utils.cc.o.d -o libcommon.fa.p/disas_libvixl_vixl_utils.cc.o -c ../di=
sas/libvixl/vixl/utils.cc
  In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
                   from ../disas/libvixl/vixl/utils.cc:27:
  /usr/include/string.h:36:43: error: missing binary operator before token =
"("
     36 | #if defined __cplusplus && (__GNUC_PREREQ (4, 4) \
        |                                           ^
  /usr/include/string.h:53:62: error: missing binary operator before token =
"("
     53 | #if defined __USE_MISC || defined __USE_XOPEN || __GLIBC_USE (ISO=
C2X)
        |                                                              ^
  /usr/include/string.h:165:21: error: missing binary operator before token=
 "("
    165 |      || __GLIBC_USE (LIB_EXT2) || __GLIBC_USE (ISOC2X))
        |                     ^
  /usr/include/string.h:174:43: error: missing binary operator before token=
 "("
    174 | #if defined __USE_XOPEN2K8 || __GLIBC_USE (LIB_EXT2) || __GLIBC_U=
SE (ISOC2X)
        |                                           ^
  /usr/include/string.h:492:19: error: missing binary operator before token=
 "("
    492 | #if __GNUC_PREREQ (3,4)
        |                   ^
  In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
                   from ../disas/libvixl/vixl/utils.cc:27:
  /usr/include/string.h:28:1: error: =E2=80=98__BEGIN_DECLS=E2=80=99 does n=
ot name a type
     28 | __BEGIN_DECLS
        | ^~~~~~~~~~~~~
  In file included from /home/philmd/qemu/disas/libvixl/vixl/utils.h:30,
                   from ../disas/libvixl/vixl/utils.cc:27:
  /usr/include/string.h:44:8: error: =E2=80=98size_t=E2=80=99 has not been =
declared
     44 |        size_t __n) __THROW __nonnull ((1, 2));
        |        ^~~~~~
  /usr/include/string.h:44:20: error: expected initializer before =E2=80=98=
__THROW=E2=80=99
     44 |        size_t __n) __THROW __nonnull ((1, 2));
        |                    ^~~~~~~
  /usr/include/string.h:47:56: error: =E2=80=98size_t=E2=80=99 has not been=
 declared
     47 | extern void *memmove (void *__dest, const void *__src, size_t __n)
        |                                                        ^~~~~~
  /usr/include/string.h:48:6: error: expected initializer before =E2=80=98_=
_THROW=E2=80=99
     48 |      __THROW __nonnull ((1, 2));
        |      ^~~~~~~
  /usr/include/string.h:61:42: error: =E2=80=98size_t=E2=80=99 has not been=
 declared
     61 | extern void *memset (void *__s, int __c, size_t __n) __THROW __no=
nnull ((1));
        |                                          ^~~~~~

  Is there a package dependency missing?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914870/+subscriptions


