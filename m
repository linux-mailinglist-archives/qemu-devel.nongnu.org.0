Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820F724619B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 10:59:01 +0200 (CEST)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7ayq-0004Xg-Hs
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 04:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k7aqm-0006Og-1c
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 04:50:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:52706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k7aqj-0004vE-89
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 04:50:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k7aqh-0004ds-4E
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 08:50:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D521B2E80E9
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 08:50:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2020 08:40:44 -0000
From: "Tony.LI" <1890545@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee bigboy0822 laurent-vivier pmaydell
X-Launchpad-Bug-Reporter: Tony.LI (bigboy0822)
X-Launchpad-Bug-Modifier: Tony.LI (bigboy0822)
References: <159670025270.3099.13280483088179052036.malonedeb@gac.canonical.com>
Message-Id: <159765364454.24476.11001827705181902094.malone@wampee.canonical.com>
Subject: [Bug 1890545] Re: (ARM64) qemu-x86_64+schroot(Debian bullseye) can't
 run chrome and can't load HTML
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6d0b96812d8def2ca0ffcc25cb4d200f2f30aeb";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 3bd71d39c8bacd32c96966ac6025975477817fc4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 04:50:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi,I have add QEMU_IFLA_INFO_KIND nested type for sit.But I still can't ope=
n Google browser.
And there are still the following errors:

qemu: uncaught target signal 5 (Trace/breakpoint trap) - core dumped
qemu: uncaught target signal 5 (Trace/breakpoint trap) - core dumped
[1661:1661:0806/074307.502638:ERROR:nacl_fork_delegate_linux.cc(323)] Bad N=
aCl helper startup ack (0 bytes)
[1664:1664:0806/074307.504159:ERROR:nacl_fork_delegate_linux.cc(323)] Bad N=
aCl helper startup ack (0 bytes)
qemu: uncaught target signal 5 (Trace/breakpoint trap) - core dumped
qemu: uncaught target signal 5 (Trace/breakpoint trap) - core dumped
qemu: unknown option 'type=3Dutility'
[1637:1680:0806/074313.598432:FATAL:gpu_data_manager_impl_private.cc(439)] =
GPU process isn't usable. Goodbye.
qemu: uncaught target signal 5 (Trace/breakpoint trap) - core dumped
Trace/breakpoint trap

Qemu get the signal(INT3).
What causes this signal???

I don't know how to debug. When I block the operation of int3 in QEMU,
it has the following error:

qemu: 0x4004bc7855: unhandled CPU exception 0x3 - aborting
RAX=3D953ad79643deb400 RBX=3D0000007fa1203140 RCX=3D953ad79643deb400 RDX=3D=
000000400863f1d8
RSI=3D0000004000b33f18 RDI=3D000000000000000e RBP=3D000000400863f590 RSP=3D=
000000400863f3c0
R8 =3D0000000000000000 R9 =3D0000000000000001 R10=3D0000000000000000 R11=3D=
000000400aa153c0
R12=3D000000400863f5a0 R13=3D0000000000000000 R14=3D0000007fa1218e10 R15=3D=
000000400863f5a0
RIP=3D0000004004bc7855 RFL=3D00000246 [---Z-P-] CPL=3D3 II=3D0 A20=3D1 SMM=
=3D0 HLT=3D0
ES =3D0000 0000000000000000 00000000 00000000
CS =3D0033 0000000000000000 ffffffff 00effb00 DPL=3D3 CS64 [-RA]
SS =3D002b 0000000000000000 ffffffff 00cff300 DPL=3D3 DS   [-WA]
DS =3D0000 0000000000000000 00000000 00000000
FS =3D0000 000000400c0c3840 00000000 00000000
GS =3D0000 0000000000000000 00000000 00000000
LDT=3D0000 0000000000000000 0000ffff 00008200 DPL=3D0 LDT
TR =3D0000 0000000000000000 0000ffff 00008b00 DPL=3D0 TSS64-busy
GDT=3D     000000400866f000 0000007f
IDT=3D     000000400866e000 F000001ff
CR0=3D80010001 CR2=3D0000000000000000 CR3=3D0000000000000000 CR4=3D00000220
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000 DR3=3D=
0000000000000000 =

DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
EFER=3D0000000000000500

Is it possible that the CPU of arm does not support certain instructions?Bu=
t=EF=BC=8CI don't know.
Who can give me some advice?
Thank you=EF=BC=81

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

