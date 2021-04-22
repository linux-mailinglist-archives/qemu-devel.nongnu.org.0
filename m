Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB13E367945
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 07:28:55 +0200 (CEST)
Received: from localhost ([::1]:35524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZRtW-0002n2-TA
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 01:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRpf-00084T-NT
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:24:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:49608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRpd-0001FX-53
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 01:24:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZRpb-0002Sj-Gh
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:24:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7CE6D2E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 05:24:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 05:11:23 -0000
From: Thomas Huth <1587211@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: seabios
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hendersa th-huth
X-Launchpad-Bug-Reporter: Andrew Henderson (hendersa)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160531022309.17459.89128.malonedeb@soybean.canonical.com>
Message-Id: <161906828320.23516.11983669933160093499.malone@gac.canonical.com>
Subject: [Bug 1587211] Re: qemu-system-i386/x86_64 crash with 1 MB guest RAM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 7b5ec0a4cecdadc428d17871c427f1d89c53fd51
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1587211 <1587211@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1587211

Title:
  qemu-system-i386/x86_64 crash with 1 MB guest RAM

Status in QEMU:
  Incomplete

Bug description:
  When launching qemu-system-i386 or qemu-system-x86_64 with 1 MB of RAM
  allocated to the guest (-m 1) and no guest image specified, QEMU will
  crash while trying to "execute code outside of RAM or ROM" after
  approximately 10 minutes. I discovered this while using QEMU 2.5.0,
  but I verified that it also occurs with 2.5.1.1 and the latest source
  available in git (2.6.50, commit
  d6550e9ed2e1a60d889dfb721de00d9a4e3bafbe). I built all of these
  different versions of QEMU on the same 64-bit Ubuntu 14.04.3 host
  using the distro's default GCC 4.8.4.

  Two observations:

  1. This only occurs when allocating 1 MB of RAM to the guest. When I
  allocate 2 MB, this does not happen. I tried running both i386/x86_64
  QEMUs for hours with 2 MB and didn't observe this crash.

  2. This may be a SeaBIOS bug, as there is no guest code to execute.
  After enabling the SeaBIOS debug at the ISA 0x402 port and redirecting
  it to stdio, the last SeaBIOS state transition reported ("Booting from
  ROM... Booting from c980:0361") occurs immediately at QEMU startup
  with no further logging messages seen prior to the crash ten minutes
  later. My captured SeaBIOS debug output is here:
  http://pastebin.com/GXm2L44E

  To reproduce, use the following command lines:

  ./i386-softmmu/qemu-system-i386 -display none -m 1 -monitor stdio
  ./x86_64-softmmu/qemu-system-x86_64 -display none -m 1 -monitor stdio

  For both 32/64-bit QEMUs, the output is the same. After running for
  about 10 minutes (I've seen it take between 7m 15s (v2.5.1.1) to 10m
  25s (v2.6.50) of runtime to occur by using the "time" command), the
  following output is shown:

  --- OUTPUT BEGINS ---
  e1000: Reading register at offset: 0x00002410. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002410. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002410. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002410. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002418. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002418. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002418. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002418. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002420. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002420. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002420. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002420. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002428. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002428. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002428. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002428. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002430. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002430. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002430. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00002430. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003410. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003410. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003410. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003410. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003418. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003418. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003418. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003418. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003420. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003420. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003420. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003420. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003428. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003428. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003428. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003428. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003430. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003430. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003430. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00003430. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00010000. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00010000. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00010000. It is not fully implemente=
d.
  e1000: Reading register at offset: 0x00010000. It is not fully implemente=
d.
  qemu: fatal: Trying to execute code outside RAM or ROM at 0x000a0063

  EAX=3D00100000 EBX=3D00000018 ECX=3D00002c06 EDX=3D0009cde0
  ESI=3D000caa20 EDI=3D00100000 EBP=3Dffffffff ESP=3D00007bcc
  EIP=3D000038e3 EFL=3D00000046 [---Z-P-] CPL=3D0 II=3D0 A20=3D1 SMM=3D0 HL=
T=3D0
  ES =3D0000 00000000 ffffffff 00cf9300
  CS =3D9c78 0009c780 ffffffff 008f9b00
  SS =3D0000 00000000 ffffffff 008f9300
  DS =3D9cf3 0009cf30 ffffffff 00cf9300
  FS =3D0000 00000000 ffffffff 00cf9300
  GS =3D0000 00000000 ffffffff 00cf9300
  LDT=3D0000 00000000 0000ffff 00008200
  TR =3D0000 00000000 0000ffff 00008b00
  GDT=3D     00000000 00000000
  IDT=3D     00000000 000003ff
  CR0=3D00000010 CR2=3D00000000 CR3=3D00000000 CR4=3D00000000
  DR0=3D00000000 DR1=3D00000000 DR2=3D00000000 DR3=3D00000000 =

  DR6=3Dffff0ff0 DR7=3D00000400
  CCS=3D000000c2 CCD=3D00002c06 CCO=3DCLR     =

  EFER=3D0000000000000000
  FCW=3D037f FSW=3D0000 [ST=3D0] FTW=3D00 MXCSR=3D00001f80
  FPR0=3D0000000000000000 0000 FPR1=3D0000000000000000 0000
  FPR2=3D0000000000000000 0000 FPR3=3D0000000000000000 0000
  FPR4=3D0000000000000000 0000 FPR5=3D0000000000000000 0000
  FPR6=3D0000000000000000 0000 FPR7=3D0000000000000000 0000
  XMM00=3D00000000000000000000000000000000 XMM01=3D000000000000000000000000=
00000000
  XMM02=3D00000000000000000000000000000000 XMM03=3D000000000000000000000000=
00000000
  XMM04=3D00000000000000000000000000000000 XMM05=3D000000000000000000000000=
00000000
  XMM06=3D00000000000000000000000000000000 XMM07=3D000000000000000000000000=
00000000
  --- OUTPUT ENDS ---

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1587211/+subscriptions

