Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA92418B3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 11:06:46 +0200 (CEST)
Received: from localhost ([::1]:34996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5QF3-000329-3d
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 05:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k5QEB-0002bd-0f
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 05:05:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:48114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k5QE8-0006Nx-UP
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 05:05:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k5QE6-0003pw-RA
 for <qemu-devel@nongnu.org>; Tue, 11 Aug 2020 09:05:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C75922E808D
 for <qemu-devel@nongnu.org>; Tue, 11 Aug 2020 09:05:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Aug 2020 08:58:50 -0000
From: "Tony.LI" <1890545@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee bigboy0822 pmaydell
X-Launchpad-Bug-Reporter: Tony.LI (bigboy0822)
X-Launchpad-Bug-Modifier: Tony.LI (bigboy0822)
References: <159670025270.3099.13280483088179052036.malonedeb@gac.canonical.com>
Message-Id: <159713633047.21231.9338139093164603548.malone@chaenomeles.canonical.com>
Subject: [Bug 1890545] Re: (ARM64) qemu-x86_64+schroot(Debian bullseye) can't
 run chrome and can't load HTML
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6a138c03da9cc3e2e03f6dd3bbb4a615b0be6ec2";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 20a369a26c1dfbde3680083db24c0b9ab4836e71
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 04:25:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1890545 <1890545@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,Alex.It can't work.And I find some thing:

$ glxinfo | grep -i open

radeon: Failed to get PCI ID, error number -38
libGL error: failed to create dri screen
libGL error: failed to load driver: radeonsi
libGL error: failed to get magic
libGL error: failed to load driver: radeonsi
OpenGL vendor string: VMware, Inc.
OpenGL renderer string: Gallium 0.4 on llvmpipe (LLVM 3.9, 128 bits)
OpenGL core profile version string: 3.3 (Core Profile) Mesa 13.0.6
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 3.0 Mesa 13.0.6
OpenGL shading language version string: 1.30
OpenGL context flags: (none)
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.0 Mesa 13.0.6
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.00
OpenGL ES profile extensions:

So=EF=BC=8Ccould it be a problem with the PCI? I see a lot of questions abo=
ut
PCI when use qemu-system.But=EF=BC=8Cwhat should I do?And I use qemu-user l=
ike
qemu-x86_64-static.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1890545

Title:
  (ARM64) qemu-x86_64+schroot(Debian bullseye) can't run chrome and
  can't load HTML

Status in QEMU:
  New

Bug description:
  First I creat a file system that is debian(bullseye amd64)on arm64
  machine=EF=BC=8Cthen I download google-chrome=EF=BC=8Chowever, when I ran=
 Google
  browser, some errors occurred.

  $ google-chrome --no-sandbox
  or =

  $ qemu-x86_64-static google-chrome --no-sandbox

  qemu: uncaught target signal 5 (Trace/breakpoint trap) - core dumped
  qemu: uncaught target signal 5 (Trace/breakpoint trap) - core dumped
  [1661:1661:0806/074307.502638:ERROR:nacl_fork_delegate_linux.cc(323)] Bad=
 NaCl helper startup ack (0 bytes)
  [1664:1664:0806/074307.504159:ERROR:nacl_fork_delegate_linux.cc(323)] Bad=
 NaCl helper startup ack (0 bytes)
  qemu: uncaught target signal 5 (Trace/breakpoint trap) - core dumped
  qemu: uncaught target signal 5 (Trace/breakpoint trap) - core dumped
  [1637:1678:0806/074308.337567:ERROR:file_path_watcher_linux.cc(315)] inot=
ify_init() failed: Function not implemented (38)
  Fontconfig warning: "/etc/fonts/fonts.conf", line 100: unknown element "b=
lank"
  qemu: unknown option 'type=3Dutility'
  [1637:1680:0806/074313.598432:FATAL:gpu_data_manager_impl_private.cc(439)=
] GPU process isn't usable. Goodbye.
  qemu: uncaught target signal 5 (Trace/breakpoint trap) - core dumped
  Trace/breakpoint trap

  Why?
  And then I run firefox,it can be opened, but it can't load any web pages =
and HTML.
  I really need help=EF=BC=81
  Thank.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1890545/+subscriptions

