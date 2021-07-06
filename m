Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF47B3BC57D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:29:42 +0200 (CEST)
Received: from localhost ([::1]:45510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ciL-0007CH-OH
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cf5-0007US-5m
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:19 -0400
Received: from indium.canonical.com ([91.189.90.7]:50940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cf3-00036a-9l
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:18 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cey-0004wn-NV
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:13 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 907702E81E1
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:25:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:54 -0000
From: Launchpad Bug Tracker <1886155@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jwakely mliska th-huth
X-Launchpad-Bug-Reporter: Martin Liska (mliska)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <159376359338.16005.10195773015354828175.malonedeb@soybean.canonical.com>
Message-Id: <162554507505.7821.4515058352121411619.malone@loganberry.canonical.com>
Subject: =?utf-8?q?=5BBug_1886155=5D_Re=3A_error=3A_argument_2_of_=E2=80=98?=
 =?utf-8?b?X19hdG9taWNfbG9hZOKAmSBkaXNjYXJkcyDigJhjb25zdOKAmSBxdWFsaWZpZXI=?=
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 73a1839c5703dcc088fc716fbf9fe3dd627025a2
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1886155 <1886155@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886155

Title:
  error: argument 2 of =E2=80=98__atomic_load=E2=80=99 discards =E2=80=98co=
nst=E2=80=99 qualifier

Status in QEMU:
  Expired

Bug description:
  GCC 11 reports the following errors:

  [  125s] In file included from /home/abuild/rpmbuild/BUILD/qemu-5.0.0/inc=
lude/qemu/seqlock.h:17,
  [  125s]                  from /home/abuild/rpmbuild/BUILD/qemu-5.0.0/inc=
lude/qemu/qht.h:10,
  [  125s]                  from /home/abuild/rpmbuild/BUILD/qemu-5.0.0/uti=
l/qht.c:69:
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c: In function '=
qht_do_lookup':
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:153=
:5: error: argument 2 of '__atomic_load' discards 'const' qualifier [-Werro=
r=3Dincompatible-pointer-types]
  [  125s]   153 |     __atomic_load(ptr, valptr, __ATOMIC_RELAXED);       \
  [  125s]       |     ^~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:161=
:5: note: in expansion of macro 'atomic_rcu_read__nocheck'
  [  125s]   161 |     atomic_rcu_read__nocheck(ptr, &_val);             \
  [  125s]       |     ^~~~~~~~~~~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c:499:27: note: =
in expansion of macro 'atomic_rcu_read'
  [  125s]   499 |                 void *p =3D atomic_rcu_read(&b->pointers=
[i]);
  [  125s]       |                           ^~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:153=
:5: error: argument 2 of '__atomic_load' discards 'const' qualifier [-Werro=
r=3Dincompatible-pointer-types]
  [  125s]   153 |     __atomic_load(ptr, valptr, __ATOMIC_RELAXED);       \
  [  125s]       |     ^~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:161=
:5: note: in expansion of macro 'atomic_rcu_read__nocheck'
  [  125s]   161 |     atomic_rcu_read__nocheck(ptr, &_val);             \
  [  125s]       |     ^~~~~~~~~~~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c:506:13: note: =
in expansion of macro 'atomic_rcu_read'
  [  125s]   506 |         b =3D atomic_rcu_read(&b->next);
  [  125s]       |             ^~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c: In function '=
qht_lookup_custom':
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:153=
:5: error: argument 2 of '__atomic_load' discards 'const' qualifier [-Werro=
r=3Dincompatible-pointer-types]
  [  125s]   153 |     __atomic_load(ptr, valptr, __ATOMIC_RELAXED);       \
  [  125s]       |     ^~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:161=
:5: note: in expansion of macro 'atomic_rcu_read__nocheck'
  [  125s]   161 |     atomic_rcu_read__nocheck(ptr, &_val);             \
  [  125s]       |     ^~~~~~~~~~~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c:534:11: note: =
in expansion of macro 'atomic_rcu_read'
  [  125s]   534 |     map =3D atomic_rcu_read(&ht->map);
  [  125s]       |           ^~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c: In function '=
qht_statistics_init':
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:153=
:5: error: argument 2 of '__atomic_load' discards 'const' qualifier [-Werro=
r=3Dincompatible-pointer-types]
  [  125s]   153 |     __atomic_load(ptr, valptr, __ATOMIC_RELAXED);       \
  [  125s]       |     ^~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:161=
:5: note: in expansion of macro 'atomic_rcu_read__nocheck'
  [  125s]   161 |     atomic_rcu_read__nocheck(ptr, &_val);             \
  [  125s]       |     ^~~~~~~~~~~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c:907:11: note: =
in expansion of macro 'atomic_rcu_read'
  [  125s]   907 |     map =3D atomic_rcu_read(&ht->map);
  [  125s]       |           ^~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:153=
:5: error: argument 2 of '__atomic_load' discards 'const' qualifier [-Werro=
r=3Dincompatible-pointer-types]
  [  125s]   153 |     __atomic_load(ptr, valptr, __ATOMIC_RELAXED);       \
  [  125s]       |     ^~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/include/qemu/atomic.h:161=
:5: note: in expansion of macro 'atomic_rcu_read__nocheck'
  [  125s]   161 |     atomic_rcu_read__nocheck(ptr, &_val);             \
  [  125s]       |     ^~~~~~~~~~~~~~~~~~~~~~~~
  [  125s] /home/abuild/rpmbuild/BUILD/qemu-5.0.0/util/qht.c:941:21: note: =
in expansion of macro 'atomic_rcu_read'
  [  125s]   941 |                 b =3D atomic_rcu_read(&b->next);
  [  125s]       |                     ^~~~~~~~~~~~~~~

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1886155/+subscriptions

