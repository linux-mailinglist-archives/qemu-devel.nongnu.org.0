Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609EC375F08
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 05:12:33 +0200 (CEST)
Received: from localhost ([::1]:45708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lequm-0002Zu-Eb
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 23:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leqo9-0003tl-M3
 for qemu-devel@nongnu.org; Thu, 06 May 2021 23:05:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:59072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leqo6-0007vr-IN
 for qemu-devel@nongnu.org; Thu, 06 May 2021 23:05:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leqo5-0003Xc-97
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 03:05:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3E6DE2E8135
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 03:05:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 02:59:14 -0000
From: Thomas Huth <1886155@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jwakely mliska th-huth
X-Launchpad-Bug-Reporter: Martin Liska (mliska)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159376359338.16005.10195773015354828175.malonedeb@soybean.canonical.com>
Message-Id: <162035635462.15157.418952714565657422.malone@soybean.canonical.com>
Subject: =?utf-8?q?=5BBug_1886155=5D_Re=3A_error=3A_argument_2_of_=E2=80=98?=
 =?utf-8?b?X19hdG9taWNfbG9hZOKAmSBkaXNjYXJkcyDigJhjb25zdOKAmSBxdWFsaWZpZXI=?=
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: eff0770cc1813521c771d6635b04a9abaa7b9a3b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system (but you won't be the reporter of the bug
in the new system and thus won't get notified on changes anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1886155

Title:
  error: argument 2 of =E2=80=98__atomic_load=E2=80=99 discards =E2=80=98co=
nst=E2=80=99 qualifier

Status in QEMU:
  Incomplete

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

