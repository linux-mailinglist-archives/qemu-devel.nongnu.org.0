Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26383759E4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 19:58:40 +0200 (CEST)
Received: from localhost ([::1]:42648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leiGl-0002Ee-DS
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 13:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lei98-000632-RT
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:50:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:41744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lei95-0004ei-B4
 for qemu-devel@nongnu.org; Thu, 06 May 2021 13:50:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lei91-0003ko-Jf
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 17:50:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8F5D72E8187
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 17:50:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 17:41:52 -0000
From: Peter Maydell <1878348@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange christophe-lyon laurent-vivier philmd
 pmaydell th-huth
X-Launchpad-Bug-Reporter: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <158935359452.19393.4863679569975227091.malonedeb@chaenomeles.canonical.com>
Message-Id: <162032291222.3969.14105578243290533743.malone@gac.canonical.com>
Subject: [Bug 1878348] Re: --static build fails in v5.0 (since
 5010cec2bc87dafab39b3913c8ca91f88df9c540)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 7226ab030b765e07f49648fee5ee3bfd117de2aa
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
Reply-To: Bug 1878348 <1878348@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FWIW, a configure line that works for me for static system-emulation
builds on Ubuntu 18.04 with QEMU 6.0 is:

'../../configure' '--target-list=3Darm-softmmu' '--enable-debug' '--
static' '--disable-tools' '--disable-sdl' '--disable-gtk' '--disable-
vnc' '--disable-virtfs' '--disable-attr' '--disable-libiscsi'
'--disable-libnfs' '--disable-libusb' '--disable-opengl' '--disable-
numa' '--disable-usb-redir' '--disable-bzip2' '--audio-drv-list=3D'
'--disable-guest-agent' '--disable-vte' '--disable-mpath' '--disable-
libudev' '--disable-vhost-user' '--disable-curl'

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1878348

Title:
  --static build fails in v5.0 (since
  5010cec2bc87dafab39b3913c8ca91f88df9c540)

Status in QEMU:
  Fix Released

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

