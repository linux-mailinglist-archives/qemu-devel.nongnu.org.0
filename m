Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A23375B7E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:13:20 +0200 (CEST)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejR2-00019B-0A
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lejJj-0004g0-HN
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:05:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:49600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lejJe-0001OS-47
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:05:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lejJc-0005dr-Lk
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 19:05:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9B00A2E8139
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 19:05:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 19:00:36 -0000
From: Ed Davison <1923497@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ebdavison imammedo
X-Launchpad-Bug-Reporter: Ed Davison (ebdavison)
X-Launchpad-Bug-Modifier: Ed Davison (ebdavison)
References: <161825934506.9582.2393035423485633300.malonedeb@chaenomeles.canonical.com>
Message-Id: <162032763647.3221.15478121272816452763.malone@gac.canonical.com>
Subject: [Bug 1923497] Re: bios_linker_loader_add_checksum: Assertion
 `start_offset < file->blob->len' failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: d992b1b9e36bb4d1a4a65a1db0e381bcf605d597
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
Reply-To: Bug 1923497 <1923497@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I guess I should say, you may close the bug.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1923497

Title:
  bios_linker_loader_add_checksum: Assertion `start_offset <
  file->blob->len' failed

Status in QEMU:
  New

Bug description:
  Trying boot/start a Windows 10 VM.  Worked until recently when this
  error started showing up.

  I have the following installed on Fedora 33:
  qemu-kvm-5.1.0-9.fc33.x86_64

  This is the error:

  Error starting domain: internal error: process exited while connecting
  to monitor: qemu-system-x86_64:
  /builddir/build/BUILD/qemu-5.1.0/hw/acpi/bios-linker-loader.c:239:
  bios_linker_loader_add_checksum: Assertion `start_offset <
  file->blob->len' failed.

  Traceback (most recent call last):
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 65, in cb_=
wrapper
      callback(asyncjob, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/asyncjob.py", line 101, in tm=
pcb
      callback(*args, **kwargs)
    File "/usr/share/virt-manager/virtManager/object/libvirtobject.py", lin=
e 57, in newfn
      ret =3D fn(self, *args, **kwargs)
    File "/usr/share/virt-manager/virtManager/object/domain.py", line 1329,=
 in startup
      self._backend.create()
    File "/usr/lib64/python3.9/site-packages/libvirt.py", line 1234, in cre=
ate
      if ret =3D=3D -1: raise libvirtError ('virDomainCreate() failed', dom=
=3Dself)
  libvirt.libvirtError: internal error: process exited while connecting to =
monitor: qemu-system-x86_64: /builddir/build/BUILD/qemu-5.1.0/hw/acpi/bios-=
linker-loader.c:239: bios_linker_loader_add_checksum: Assertion `start_offs=
et < file->blob->len' failed.

  I see this were referenced in a patch from some time ago and
  supposedly fixed.  Here is the patch info I was able to find:

  http://next.patchew.org/QEMU/1515677902-23436-1-git-send-email-
  peter.maydell@linaro.org/1515677902-23436-10-git-send-email-
  peter.maydell@linaro.org/

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1923497/+subscriptions

