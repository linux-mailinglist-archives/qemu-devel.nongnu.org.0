Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07C81A49A2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Apr 2020 20:02:10 +0200 (CEST)
Received: from localhost ([::1]:37622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMxyj-000430-H7
	for lists+qemu-devel@lfdr.de; Fri, 10 Apr 2020 14:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51988)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jMxxa-0003Kk-J1
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 14:01:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jMxxY-0007lb-R4
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 14:00:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:35744)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jMxxY-0007kd-LK
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 14:00:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jMxxW-0007sO-R2
 for <qemu-devel@nongnu.org>; Fri, 10 Apr 2020 18:00:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C1F1D2E8024
 for <qemu-devel@nongnu.org>; Fri, 10 Apr 2020 18:00:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Apr 2020 17:42:53 -0000
From: =?utf-8?q?Stig-=C3=98rjan_Smelror?= <1872113@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kekepower
X-Launchpad-Bug-Reporter: =?utf-8?q?Stig-=C3=98rjan_Smelror_=28kekepower=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Stig-=C3=98rjan_Smelror_=28kekepower=29?=
Message-Id: <158654057369.6269.6354060003943218170.malonedeb@chaenomeles.canonical.com>
Subject: [Bug 1872113] [NEW] qemu docs fails to build with Sphinx 3.0.x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 6201c602b2f1b948f9c559971efdff908f5427cc
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1872113 <1872113@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

We've just updated Sphinx to version 3.0.1 and qemu fails to build the
docs with this version.

Here's the relevant section in the build log.

CONFDIR=3D"/etc/qemu" /usr/bin/sphinx-build-3  -W -b html -D version=3D4.2.=
92 -D release=3D"4.2.92 (qemu-5.0.0-0.rc2.0.1.mga8)" -d .doctrees/devel-htm=
l /home/iurt/rpmbuild/BUILD/qemu-5.0.0-rc2/docs/devel docs/devel
Running Sphinx v3.0.1
making output directory... done
building [mo]: targets for 0 po files that are out of date
building [html]: targets for 14 source files that are out of date
updating environment: [new config] 14 added, 0 changed, 0 removed
reading sources... [  7%] bitops
reading sources... [ 14%] decodetree
reading sources... [ 21%] index
reading sources... [ 28%] kconfig
reading sources... [ 35%] loads-stores
reading sources... [ 42%] memory
reading sources... [ 50%] migration
reading sources... [ 57%] reset
reading sources... [ 64%] s390-dasd-ipl
reading sources... [ 71%] secure-coding-practices
reading sources... [ 78%] stable-process
reading sources... [ 85%] tcg
reading sources... [ 92%] tcg-plugins
reading sources... [100%] testing

Warning, treated as error:
/home/iurt/rpmbuild/BUILD/qemu-5.0.0-rc2/docs/../include/exec/memory.h:3:Ty=
pe must be either just a name or a typedef-like declaration.
If just a name:
=C2=A0=C2=A0Error in declarator or parameters
=C2=A0=C2=A0Invalid C declaration: Expected identifier in nested name, got =
keyword: struct [error at 6]
=C2=A0=C2=A0=C2=A0=C2=A0struct MemoryListener
=C2=A0=C2=A0=C2=A0=C2=A0------^
If typedef-like declaration:
=C2=A0=C2=A0Error in declarator or parameters
=C2=A0=C2=A0Invalid C declaration: Expected identifier in nested name. [err=
or at 21]
=C2=A0=C2=A0=C2=A0=C2=A0struct MemoryListener
=C2=A0=C2=A0=C2=A0=C2=A0---------------------^

make: *** [Makefile:1095: docs/devel/index.html] Error 2
make: *** Waiting for unfinished jobs....

I found this commit for memory.h that includes the section that faults.
https://github.com/qemu/qemu/commit/5d248213180749e674fbccbacc6ee9c38499abb=
3#diff-d892cbf314945b44699534cc1de4ebbd

You can see the whole build log here.
https://pkgsubmit.mageia.org/uploads/failure/cauldron/core/release/20200410=
161120.tv.duvel.699/log/qemu-5.0.0-0.rc2.0.1.mga8/build.0.20200410161338.log

System: Mageia Cauldron

** Affects: qemu
     Importance: Undecided
         Status: New

** Description changed:

  We've just updated Sphinx to version 3.0.1 and qemu fails to build the
  docs with this version.
  =

  Here's the relevant section in the build log.
  =

- CONFDIR=3D"/etc/qemu" /usr/bin/sphinx-build-3  -W -b html -D version=3D4.=
2.92 -D release=3D"4.2.92 (qemu-5.0.0-0.rc2.0.1.mga8)" -d .doctrees/devel-h=
tml /home/iurt/rpmbuild/BUILD/qemu-5.0.0-rc2/docs/devel docs/devel =

+ CONFDIR=3D"/etc/qemu" /usr/bin/sphinx-build-3  -W -b html -D version=3D4.=
2.92 -D release=3D"4.2.92 (qemu-5.0.0-0.rc2.0.1.mga8)" -d .doctrees/devel-h=
tml /home/iurt/rpmbuild/BUILD/qemu-5.0.0-rc2/docs/devel docs/devel
  Running Sphinx v3.0.1
  making output directory... done
  building [mo]: targets for 0 po files that are out of date
  building [html]: targets for 14 source files that are out of date
  updating environment: [new config] 14 added, 0 changed, 0 removed
  reading sources... [  7%] bitops
  reading sources... [ 14%] decodetree
  reading sources... [ 21%] index
  reading sources... [ 28%] kconfig
  reading sources... [ 35%] loads-stores
  reading sources... [ 42%] memory
  reading sources... [ 50%] migration
  reading sources... [ 57%] reset
  reading sources... [ 64%] s390-dasd-ipl
  reading sources... [ 71%] secure-coding-practices
  reading sources... [ 78%] stable-process
  reading sources... [ 85%] tcg
  reading sources... [ 92%] tcg-plugins
  reading sources... [100%] testing
  =

- =

  Warning, treated as error:
  /home/iurt/rpmbuild/BUILD/qemu-5.0.0-rc2/docs/../include/exec/memory.h:3:=
Type must be either just a name or a typedef-like declaration.
  If just a name:
-   Error in declarator or parameters
-   Invalid C declaration: Expected identifier in nested name, got keyword:=
 struct [error at 6]
-     struct MemoryListener
-     ------^
+ =C2=A0=C2=A0Error in declarator or parameters
+ =C2=A0=C2=A0Invalid C declaration: Expected identifier in nested name, go=
t keyword: struct [error at 6]
+ =C2=A0=C2=A0=C2=A0=C2=A0struct MemoryListener
+ =C2=A0=C2=A0=C2=A0=C2=A0------^
  If typedef-like declaration:
-   Error in declarator or parameters
-   Invalid C declaration: Expected identifier in nested name. [error at 21]
-     struct MemoryListener
-     ---------------------^
+ =C2=A0=C2=A0Error in declarator or parameters
+ =C2=A0=C2=A0Invalid C declaration: Expected identifier in nested name. [e=
rror at 21]
+ =C2=A0=C2=A0=C2=A0=C2=A0struct MemoryListener
+ =C2=A0=C2=A0=C2=A0=C2=A0---------------------^
  =

  make: *** [Makefile:1095: docs/devel/index.html] Error 2
  make: *** Waiting for unfinished jobs....
  =

  I found this commit for memory.h that includes the section that faults.
  https://github.com/qemu/qemu/commit/5d248213180749e674fbccbacc6ee9c38499a=
bb3#diff-d892cbf314945b44699534cc1de4ebbd
  =

- You can see the whol build log here.
+ You can see the whole build log here.
  https://pkgsubmit.mageia.org/uploads/failure/cauldron/core/release/202004=
10161120.tv.duvel.699/log/qemu-5.0.0-0.rc2.0.1.mga8/build.0.20200410161338.=
log
  =

  System: Mageia Cauldron

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1872113

Title:
  qemu docs fails to build with Sphinx 3.0.x

Status in QEMU:
  New

Bug description:
  We've just updated Sphinx to version 3.0.1 and qemu fails to build the
  docs with this version.

  Here's the relevant section in the build log.

  CONFDIR=3D"/etc/qemu" /usr/bin/sphinx-build-3  -W -b html -D version=3D4.=
2.92 -D release=3D"4.2.92 (qemu-5.0.0-0.rc2.0.1.mga8)" -d .doctrees/devel-h=
tml /home/iurt/rpmbuild/BUILD/qemu-5.0.0-rc2/docs/devel docs/devel
  Running Sphinx v3.0.1
  making output directory... done
  building [mo]: targets for 0 po files that are out of date
  building [html]: targets for 14 source files that are out of date
  updating environment: [new config] 14 added, 0 changed, 0 removed
  reading sources... [  7%] bitops
  reading sources... [ 14%] decodetree
  reading sources... [ 21%] index
  reading sources... [ 28%] kconfig
  reading sources... [ 35%] loads-stores
  reading sources... [ 42%] memory
  reading sources... [ 50%] migration
  reading sources... [ 57%] reset
  reading sources... [ 64%] s390-dasd-ipl
  reading sources... [ 71%] secure-coding-practices
  reading sources... [ 78%] stable-process
  reading sources... [ 85%] tcg
  reading sources... [ 92%] tcg-plugins
  reading sources... [100%] testing

  Warning, treated as error:
  /home/iurt/rpmbuild/BUILD/qemu-5.0.0-rc2/docs/../include/exec/memory.h:3:=
Type must be either just a name or a typedef-like declaration.
  If just a name:
  =C2=A0=C2=A0Error in declarator or parameters
  =C2=A0=C2=A0Invalid C declaration: Expected identifier in nested name, go=
t keyword: struct [error at 6]
  =C2=A0=C2=A0=C2=A0=C2=A0struct MemoryListener
  =C2=A0=C2=A0=C2=A0=C2=A0------^
  If typedef-like declaration:
  =C2=A0=C2=A0Error in declarator or parameters
  =C2=A0=C2=A0Invalid C declaration: Expected identifier in nested name. [e=
rror at 21]
  =C2=A0=C2=A0=C2=A0=C2=A0struct MemoryListener
  =C2=A0=C2=A0=C2=A0=C2=A0---------------------^

  make: *** [Makefile:1095: docs/devel/index.html] Error 2
  make: *** Waiting for unfinished jobs....

  I found this commit for memory.h that includes the section that faults.
  https://github.com/qemu/qemu/commit/5d248213180749e674fbccbacc6ee9c38499a=
bb3#diff-d892cbf314945b44699534cc1de4ebbd

  You can see the whole build log here.
  https://pkgsubmit.mageia.org/uploads/failure/cauldron/core/release/202004=
10161120.tv.duvel.699/log/qemu-5.0.0-0.rc2.0.1.mga8/build.0.20200410161338.=
log

  System: Mageia Cauldron

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1872113/+subscriptions

