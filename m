Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480131D48FD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 11:03:09 +0200 (CEST)
Received: from localhost ([::1]:55632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZWFI-0003Lz-Am
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 05:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jZWDi-0002CW-L9
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:01:30 -0400
Received: from indium.canonical.com ([91.189.90.7]:33402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jZWDh-0000In-De
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:01:30 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jZWDe-0002Ne-5k
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 09:01:26 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7E9262E810A
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 09:01:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2020 08:48:53 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1878348@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange christophe-lyon laurent-vivier philmd
 pmaydell
X-Launchpad-Bug-Reporter: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <158935359452.19393.4863679569975227091.malonedeb@chaenomeles.canonical.com>
Message-Id: <158953253307.31625.13760027279797418905.malone@chaenomeles.canonical.com>
Subject: [Bug 1878348] Re: --static build fails in v5.0 (since
 5010cec2bc87dafab39b3913c8ca91f88df9c540)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0385b538081bc4718df6fb844a3afc89729c94ce";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 42ac6ee138775e277561a08ba3ce2dd21a274f76
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 04:30:58
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1878348 <1878348@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the record, previous attempt to fix:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg624142.html
and identical conclusion:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg624164.html

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878348

Title:
  --static build fails in v5.0 (since
  5010cec2bc87dafab39b3913c8ca91f88df9c540)

Status in QEMU:
  New

Bug description:
  Hi,

  Since commit 5010cec2bc87dafab39b3913c8ca91f88df9c540, building qemu
  fails when configured with --static (eg ../configure --target-
  list=3Dx86_64-softmmu,x86_64-linux-user --enable-debug --static).

  On ubuntu 16.04, it fails to find -lffi and -lselinux.

  After I apt-get install libffi-dev libselinux1-dev, the build still fails:
  ../backends/dbus-vmstate.o: In function `_nocheck__trace_dbus_vmstate_pre=
_save':
  /home/christophe.lyon/src/qemu/build-static/backends/trace.h:29: undefine=
d reference to `_TRACE_DBUS_VMSTATE_PRE_SAVE_DSTATE'
  ../backends/dbus-vmstate.o: In function `_nocheck__trace_dbus_vmstate_pos=
t_load':
  /home/christophe.lyon/src/qemu/build-static/backends/trace.h:52: undefine=
d reference to `_TRACE_DBUS_VMSTATE_POST_LOAD_DSTATE'
  ../backends/dbus-vmstate.o: In function `_nocheck__trace_dbus_vmstate_loa=
ding':
  /home/christophe.lyon/src/qemu/build-static/backends/trace.h:75: undefine=
d reference to `_TRACE_DBUS_VMSTATE_LOADING_DSTATE'
  ../backends/dbus-vmstate.o: In function `_nocheck__trace_dbus_vmstate_sav=
ing':
  /home/christophe.lyon/src/qemu/build-static/backends/trace.h:98: undefine=
d reference to `_TRACE_DBUS_VMSTATE_SAVING_DSTATE'
  collect2: error: ld returned 1 exit status

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1878348/+subscriptions

