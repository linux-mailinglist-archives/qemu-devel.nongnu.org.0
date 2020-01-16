Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F913DDAE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 15:41:59 +0100 (CET)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is6LO-0006bQ-EJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 09:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49175)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1is5rF-0005qF-6k
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 09:10:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1is5rD-0003sh-Qp
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 09:10:49 -0500
Received: from indium.canonical.com ([91.189.90.7]:48352)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1is5rD-0003sC-LA
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 09:10:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1is5rC-00070b-AQ
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 14:10:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 466DD2E80C0
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 14:10:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jan 2020 13:59:26 -0000
From: pevogam <plamen@pevogam.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 5-plamen
X-Launchpad-Bug-Reporter: pevogam (5-plamen)
X-Launchpad-Bug-Modifier: pevogam (5-plamen)
Message-Id: <157918316689.4864.12553262908100217782.malonedeb@wampee.canonical.com>
Subject: [Bug 1859989] [NEW] qemu-img has broken output with large snapshot
 names
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f1052173880d8dae43faa7c2fc45da1b42227143";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: cadd867df627f96f1f4e3368e42f5e1975a59c16
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
X-Mailman-Approved-At: Thu, 16 Jan 2020 09:38:36 -0500
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
Reply-To: Bug 1859989 <1859989@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

On Qemu 4.1.1 the output of snalshots breaks if the chosen state name is
too long:

```
# qemu-img snapshot -l /mnt/local/some_image.qcow2
Snapshot list:
ID        TAG                 VM SIZE                DATE       VM CLOCK
1         online_provider_with_dhcp747 MiB 2020-01-15 12:05:01   00:00:45.8=
73
```

Prior to 4.1.1 this used to work with extra tabs for the VM SIZE values.
The collision is also disabling us from using a regex on top of this
input to detect the snapshot.

** Affects: qemu
     Importance: Undecided
         Status: New

** Summary changed:

- qemu-img has broken input on large snapshot name
+ qemu-img has broken output on large snapshot name

** Summary changed:

- qemu-img has broken output on large snapshot name
+ qemu-img has broken output with large snapshot names

** Description changed:

- On Qemu 4.1.1 the output of snalshots breaks if the chosen state name is
+ On Qemu 4.1.1 the output of snapshots breaks if the chosen state name is
  too long:
  =

  # qemu-img snapshot -l /mnt/local/some_image.qcow2
  Snapshot list:
  ID        TAG                 VM SIZE                DATE       VM CLOCK
  1         online_provider_with_dhcp747 MiB 2020-01-15 12:05:01   00:00:45=
.873
  =

  Prior to 4.1.1 this used to work with extra tabs for the VM SIZE values.
  The collision is also disabling us from using a regex on top of this
  input to detect the snapshot.

** Description changed:

  On Qemu 4.1.1 the output of snapshots breaks if the chosen state name is
  too long:
  =

  # qemu-img snapshot -l /mnt/local/some_image.qcow2
  Snapshot list:
  ID        TAG                 VM SIZE                DATE       VM CLOCK
  1         online_provider_with_dhcp747 MiB 2020-01-15 12:05:01   00:00:45=
.873
  =

- Prior to 4.1.1 this used to work with extra tabs for the VM SIZE values.
- The collision is also disabling us from using a regex on top of this
- input to detect the snapshot.
+ Prior to 4.1.1, this used to work with extra tabs for the VM SIZE
+ values. The collision is also disabling us from using a regex on top of
+ this input to detect the snapshot unless we forbid numbers in the
+ snapshot name.

** Description changed:

- On Qemu 4.1.1 the output of snapshots breaks if the chosen state name is
+ On Qemu 4.1.1 the output of snalshots breaks if the chosen state name is
  too long:
  =

+ ```
  # qemu-img snapshot -l /mnt/local/some_image.qcow2
  Snapshot list:
  ID        TAG                 VM SIZE                DATE       VM CLOCK
  1         online_provider_with_dhcp747 MiB 2020-01-15 12:05:01   00:00:45=
.873
+ ```
  =

- Prior to 4.1.1, this used to work with extra tabs for the VM SIZE
- values. The collision is also disabling us from using a regex on top of
- this input to detect the snapshot unless we forbid numbers in the
- snapshot name.
+ Prior to 4.1.1 this used to work with extra tabs for the VM SIZE values.
+ The collision is also disabling us from using a regex on top of this
+ input to detect the snapshot.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859989

Title:
  qemu-img has broken output with large snapshot names

Status in QEMU:
  New

Bug description:
  On Qemu 4.1.1 the output of snalshots breaks if the chosen state name
  is too long:

  ```
  # qemu-img snapshot -l /mnt/local/some_image.qcow2
  Snapshot list:
  ID        TAG                 VM SIZE                DATE       VM CLOCK
  1         online_provider_with_dhcp747 MiB 2020-01-15 12:05:01   00:00:45=
.873
  ```

  Prior to 4.1.1 this used to work with extra tabs for the VM SIZE
  values. The collision is also disabling us from using a regex on top
  of this input to detect the snapshot.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859989/+subscriptions

