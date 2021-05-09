Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE48337775A
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:33:36 +0200 (CEST)
Received: from localhost ([::1]:37216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflR1-0000vM-QM
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflOI-0007qT-5s
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:30:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:56720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflOE-0005Sc-Rh
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:30:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lflOD-0002BB-Bx
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:30:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5945B2E8135
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:30:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:24:55 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1893744@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <159894711032.21231.11251207262387060665.malonedeb@chaenomeles.canonical.com>
Message-Id: <162057389603.6280.8788332995106726843.malone@gac.canonical.com>
Subject: [Bug 1893744] Re: meson: incomplete 'make help'
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 97d396bcfdaf5e415ec869f761930a6e73055627
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
Reply-To: Bug 1893744 <1893744@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'invalid' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/227


** Changed in: qemu
       Status: New =3D> Invalid

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #227
   https://gitlab.com/qemu-project/qemu/-/issues/227

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1893744

Title:
  meson: incomplete 'make help'

Status in QEMU:
  Invalid

Bug description:
  Since the meson switch, 'make help' doesn't list various targets.

  Diff before/after:

  ---
   Generic targets:
     all                            - Build all
     dir/file.o                     - Build specified target only
     install                        - Install QEMU
     ctags/TAGS                     - Generate tags file for editors
     cscope                         - Generate cscope index
  -
  -Architecture specific targets:
  -  aarch64-softmmu/all            - Build for aarch64-softmmu
  -  alpha-softmmu/all              - Build for alpha-softmmu
  -  arm-softmmu/all                - Build for arm-softmmu
  -  avr-softmmu/all                - Build for avr-softmmu
  -  cris-softmmu/all               - Build for cris-softmmu
  -  hppa-softmmu/all               - Build for hppa-softmmu
  -  i386-softmmu/all               - Build for i386-softmmu
  -  lm32-softmmu/all               - Build for lm32-softmmu
  -  m68k-softmmu/all               - Build for m68k-softmmu
  -  microblazeel-softmmu/all       - Build for microblazeel-softmmu
  -  microblaze-softmmu/all         - Build for microblaze-softmmu
  -  mips64el-softmmu/all           - Build for mips64el-softmmu
  -  mips64-softmmu/all             - Build for mips64-softmmu
  -  mipsel-softmmu/all             - Build for mipsel-softmmu
  -  mips-softmmu/all               - Build for mips-softmmu
  -  moxie-softmmu/all              - Build for moxie-softmmu
  -  nios2-softmmu/all              - Build for nios2-softmmu
  -  or1k-softmmu/all               - Build for or1k-softmmu
  -  ppc64-softmmu/all              - Build for ppc64-softmmu
  -  ppc-softmmu/all                - Build for ppc-softmmu
  -  riscv32-softmmu/all            - Build for riscv32-softmmu
  -  riscv64-softmmu/all            - Build for riscv64-softmmu
  -  rx-softmmu/all                 - Build for rx-softmmu
  -  s390x-softmmu/all              - Build for s390x-softmmu
  -  sh4eb-softmmu/all              - Build for sh4eb-softmmu
  -  sh4-softmmu/all                - Build for sh4-softmmu
  -  sparc64-softmmu/all            - Build for sparc64-softmmu
  -  sparc-softmmu/all              - Build for sparc-softmmu
  -  tricore-softmmu/all            - Build for tricore-softmmu
  -  unicore32-softmmu/all          - Build for unicore32-softmmu
  -  x86_64-softmmu/all             - Build for x86_64-softmmu
  -  xtensaeb-softmmu/all           - Build for xtensaeb-softmmu
  -  xtensa-softmmu/all             - Build for xtensa-softmmu
  -  aarch64_be-linux-user/all      - Build for aarch64_be-linux-user
  -  aarch64-linux-user/all         - Build for aarch64-linux-user
  -  alpha-linux-user/all           - Build for alpha-linux-user
  -  armeb-linux-user/all           - Build for armeb-linux-user
  -  arm-linux-user/all             - Build for arm-linux-user
  -  cris-linux-user/all            - Build for cris-linux-user
  -  hppa-linux-user/all            - Build for hppa-linux-user
  -  i386-linux-user/all            - Build for i386-linux-user
  -  m68k-linux-user/all            - Build for m68k-linux-user
  -  microblazeel-linux-user/all    - Build for microblazeel-linux-user
  -  microblaze-linux-user/all      - Build for microblaze-linux-user
  -  mips64el-linux-user/all        - Build for mips64el-linux-user
  -  mips64-linux-user/all          - Build for mips64-linux-user
  -  mipsel-linux-user/all          - Build for mipsel-linux-user
  -  mips-linux-user/all            - Build for mips-linux-user
  -  mipsn32el-linux-user/all       - Build for mipsn32el-linux-user
  -  mipsn32-linux-user/all         - Build for mipsn32-linux-user
  -  nios2-linux-user/all           - Build for nios2-linux-user
  -  or1k-linux-user/all            - Build for or1k-linux-user
  -  ppc64abi32-linux-user/all      - Build for ppc64abi32-linux-user
  -  ppc64le-linux-user/all         - Build for ppc64le-linux-user
  -  ppc64-linux-user/all           - Build for ppc64-linux-user
  -  ppc-linux-user/all             - Build for ppc-linux-user
  -  riscv32-linux-user/all         - Build for riscv32-linux-user
  -  riscv64-linux-user/all         - Build for riscv64-linux-user
  -  s390x-linux-user/all           - Build for s390x-linux-user
  -  sh4eb-linux-user/all           - Build for sh4eb-linux-user
  -  sh4-linux-user/all             - Build for sh4-linux-user
  -  sparc32plus-linux-user/all     - Build for sparc32plus-linux-user
  -  sparc64-linux-user/all         - Build for sparc64-linux-user
  -  sparc-linux-user/all           - Build for sparc-linux-user
  -  tilegx-linux-user/all          - Build for tilegx-linux-user
  -  x86_64-linux-user/all          - Build for x86_64-linux-user
  -  xtensaeb-linux-user/all        - Build for xtensaeb-linux-user
  -  xtensa-linux-user/all          - Build for xtensa-linux-user
  -
  -Helper targets:
  -  fsdev/virtfs-proxy-helper      - Build virtfs-proxy-helper
  -  scsi/qemu-pr-helper            - Build qemu-pr-helper
  -  qemu-bridge-helper             - Build qemu-bridge-helper
  -  vhost-user-gpu                 - Build vhost-user-gpu
  -  virtiofsd                      - Build virtiofsd
  -
  -Tools targets:
  -  qemu-ga                        - Build qemu-ga tool
  -  qemu-keymap                    - Build qemu-keymap tool
  -  elf2dmp                        - Build elf2dmp tool
  -  ivshmem-client                 - Build ivshmem-client tool
  -  ivshmem-server                 - Build ivshmem-server tool
  -  qemu-nbd                       - Build qemu-nbd tool
  -  qemu-storage-daemon            - Build qemu-storage-daemon tool
  -  qemu-img                       - Build qemu-img tool
  -  qemu-io                        - Build qemu-io tool
  -  qemu-edid                      - Build qemu-edid tool
  +  sparse                         - Run sparse on the QEMU source

   Cleaning targets:
     clean                          - Remove most generated files but keep
  the config
  @@ -105,7 +20,7 @@
     vm-help                        - Help about targets running tests
  inside VM

   Documentation targets:
  -  html info pdf txt              - Build documentation in specified form=
at
  +  html info pdf txt man          - Build documentation in specified form=
at

     make [targets]                 - (quiet build, default)
     make V=3D1 [targets]             - (verbose build)
  ---

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1893744/+subscriptions

