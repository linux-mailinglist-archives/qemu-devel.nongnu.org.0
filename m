Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CF635F033
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:58:00 +0200 (CEST)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWbLT-0007vw-73
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWbJK-00073n-3b
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:55:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:37384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWbJH-0000ol-MZ
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:55:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lWbJF-0000Kk-J7
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 08:55:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 76A062E8162
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 08:55:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Apr 2021 08:49:07 -0000
From: Igor <1923497@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ebdavison imammedo
X-Launchpad-Bug-Reporter: Ed Davison (ebdavison)
X-Launchpad-Bug-Modifier: Igor (imammedo)
References: <161825934506.9582.2393035423485633300.malonedeb@chaenomeles.canonical.com>
 <161834938509.17765.14119628731216209208.malone@wampee.canonical.com>
Message-Id: <20210414104907.62985c51@redhat.com>
Subject: Re: [Bug 1923497] Re: bios_linker_loader_add_checksum: Assertion
 `start_offset < file->blob->len' failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9327c982b35e4a485a3c716663ed8345e279c16e"; Instance="production"
X-Launchpad-Hash: 83ab7519efaee6257cbc16d58550a62dc19b3b0f
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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

On Tue, 13 Apr 2021 21:29:45 -0000
Ed Davison <1923497@bugs.launchpad.net> wrote:

> Hmmm.  Well, I don't know what the command line was.  I use Virtual
> Machine Manager (virt-manager.org) for my interface to the VM and it
> does the startup.  The error shows up when I start the VM.
In this case you should be able to attach domain xml. (View->Details->Overv=
iew->XML)

Also try and see if the following patch helps:
https://lore.kernel.org/qemu-devel/20210413160834-mutt-send-email-mst@kerne=
l.org/T/#md70161e63276e9d5b6fd50fd835d2e62895810b8

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

