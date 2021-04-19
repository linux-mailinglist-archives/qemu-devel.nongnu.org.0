Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49379363E50
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:13:50 +0200 (CEST)
Received: from localhost ([::1]:58458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYPyW-00057c-Oq
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYPvq-0004Ed-My
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 05:11:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:41694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYPvo-0001Dh-Hd
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 05:11:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYPvm-0007C8-Gr
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:10:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7C9782E8157
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:10:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Apr 2021 09:05:34 -0000
From: Ricky Tigg <1924987@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: tigg
X-Launchpad-Bug-Reporter: Ricky Tigg (tigg)
X-Launchpad-Bug-Modifier: Ricky Tigg (tigg)
Message-Id: <161882313513.2580.5040892945774329423.malonedeb@gac.canonical.com>
Subject: [Bug 1924987] [NEW] Storage | Two decimal digits precision
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="26785e5a6adccabf68a42300ea7053912615013e"; Instance="production"
X-Launchpad-Hash: d415e5972d7a127e0ec3b4bf48faa881d0fe6d8d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1924987 <1924987@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Tested on: Fedora 34; Component: qemu-img-5.2.0-5.fc34.1.x86_64

Hello. A two decimal digits precision is most appropriated on systems
whose storage capacities have to be saved. That is one of the reason why
such precision is supported in the context of creation of virtual
machines in several Unix/Linux virtualization platforms; virt-manager is
one of them. That last exhibits virtual disks size values with such
precision =E2=80=93 128.00 GiB =E2=80=93 nevertheless it lacks yet a mention
illustrating physical disks size values.

Storage values exhibited in qemu-img and virt-manager are already
according to a clear format; thus, values are not attached to their
measure units (#value# #units#).

$ qemu-img info ~/.local/share/libvirt/images/fedora_default.img | sed -n '=
2,4p'
file format: qcow2
virtual size: 128 GiB (137438953472 bytes)
disk size: 147 MiB

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1924987

Title:
  Storage | Two decimal digits precision

Status in QEMU:
  New

Bug description:
  Tested on: Fedora 34; Component: qemu-img-5.2.0-5.fc34.1.x86_64

  Hello. A two decimal digits precision is most appropriated on systems
  whose storage capacities have to be saved. That is one of the reason
  why such precision is supported in the context of creation of virtual
  machines in several Unix/Linux virtualization platforms; virt-manager
  is one of them. That last exhibits virtual disks size values with such
  precision =E2=80=93 128.00 GiB =E2=80=93 nevertheless it lacks yet a ment=
ion
  illustrating physical disks size values.

  Storage values exhibited in qemu-img and virt-manager are already
  according to a clear format; thus, values are not attached to their
  measure units (#value# #units#).

  $ qemu-img info ~/.local/share/libvirt/images/fedora_default.img | sed -n=
 '2,4p'
  file format: qcow2
  virtual size: 128 GiB (137438953472 bytes)
  disk size: 147 MiB

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1924987/+subscriptions

