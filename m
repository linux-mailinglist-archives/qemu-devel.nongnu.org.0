Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C6A1C70AC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 14:47:16 +0200 (CEST)
Received: from localhost ([::1]:53644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWJSF-0007UW-6D
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 08:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jWJR8-000727-0x
 for qemu-devel@nongnu.org; Wed, 06 May 2020 08:46:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:34520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jWJR6-0003vT-Pc
 for qemu-devel@nongnu.org; Wed, 06 May 2020 08:46:05 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jWJR3-0000qy-9s
 for <qemu-devel@nongnu.org>; Wed, 06 May 2020 12:46:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 64B5A2E8133
 for <qemu-devel@nongnu.org>; Wed,  6 May 2020 12:45:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 06 May 2020 12:34:12 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1877052@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paelzer weller-andreas-weller
X-Launchpad-Bug-Reporter: Andreas Weller (weller-andreas-weller)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
 =?utf-8?q?=29?=
References: <158875190128.5304.17617014708809905297.malonedeb@soybean.canonical.com>
Message-Id: <158876845224.12738.1330753240934953846.malone@gac.canonical.com>
Subject: [Bug 1877052] Re: KVM Win 10 guest pauses after kernel upgrade
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fbdff7602bd10fb883bf7e2ddcc7fd5a16f60398";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: d94db5c2a41e6259f26fdaf9a213fd05cc1517a5
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/06 08:46:02
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
Reply-To: Bug 1877052 <1877052@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Note: might be related (or not) to bug 1866870
Let's analyze as independent and dup if it turns out to be a dup.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877052

Title:
  KVM Win 10 guest pauses after kernel upgrade

Status in QEMU:
  New
Status in qemu package in Ubuntu:
  New

Bug description:
  Hello!
  Unfortunately the bug has apparently reappeared. I have a Windows 10 runn=
ing in a VM, which after my today's "apt upgrade" goes into pause mode afte=
r a few seconds of running time.

  Until yesterday it used to work and I was able to boot the VM. During
  the kernel update (from 5.4.0-28.33 to 5.4.0-29.34) the VM was active
  and then went into pause mode. Even after a reboot of my host system
  the problem still persists: the VM boots for a few seconds and then
  switches to pause mode.

  Current Kernel: Linux andreas-laptop 5.4.0-29-generic #33-Ubuntu SMP
  Wed Apr 29 14:32:27 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

  Maybe relevant logfile lines:
  2020-05-06T07:46:42.857574Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
  2020-05-06T07:46:42.857718Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
  2020-05-06T07:46:42.860567Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(48FH).vmx-exit-load-perf-global-ctrl [bit 12]
  2020-05-06T07:46:42.860582Z qemu-system-x86_64: warning: host doesn't sup=
port requested feature: MSR(490H).vmx-entry-load-perf-global-ctrl [bit 13]
  2020-05-06T07:47:22.901057Z qemu-system-x86_64: terminating on signal 15 =
from pid 1593 (/usr/sbin/libvirtd)
  2020-05-06 07:47:23.101+0000: shutting down, reason=3Ddestroyed


  Kind regards,
  =C2=A0=C2=A0=C2=A0Andreas

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877052/+subscriptions

