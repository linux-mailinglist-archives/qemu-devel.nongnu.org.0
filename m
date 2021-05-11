Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEED379F5C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:52:41 +0200 (CEST)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgLJw-0006tW-W7
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgLDM-0006fd-6n
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:45:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:33378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgLDK-0006Pa-08
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:45:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgLDI-0004Gp-7Q
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:45:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 36D8C2E8188
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:45:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:37:43 -0000
From: Thomas Huth <1859384@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm gic testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee alexlngw pmaydell th-huth
X-Launchpad-Bug-Reporter: Alex Longwall (alexlngw)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157887973843.5281.117317310678495552.malonedeb@gac.canonical.com>
Message-Id: <162071146337.10352.4105756069760687325.malone@chaenomeles.canonical.com>
Subject: [Bug 1859384] Re: arm gic: gic_acknowledge_irq doesn't clear line
 level for other cores for 1-n level-sensitive interrupts and
 gic_clear_pending uses GIC_DIST_TEST_MODEL (even on v2 where it always read 0
 - "N-N")
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 6ba2a3be34ae7588c99b3e57b1585c2a45f1a72e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1859384 <1859384@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/268


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #268
   https://gitlab.com/qemu-project/qemu/-/issues/268

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859384

Title:
  arm gic: gic_acknowledge_irq doesn't clear line level for other cores
  for 1-n level-sensitive interrupts and gic_clear_pending uses
  GIC_DIST_TEST_MODEL (even on v2 where it always read 0 - "N-N")

Status in QEMU:
  Expired

Bug description:
  For a 1-N interrupt (any SPI on the GICv2), as mandated by the TRM,
  only one CPU can acknowledge the IRQ until it becomes inactive.

  The TRM also mandates that SGIs and PPIs follow the N-N model and that
  SPIs follow the 1-N model.

  However this is not currently the case with QEMU. I have locally (no
  minimal test case) seen e.g. uart interrupts being acknowledged twice
  before having been deactivated (expected: irqId on one CPU and 1023 on
  the other instead).

  I have narrowed the issue down to the following:

  1) arm_gic_common_reset resets all irq_state[id] fields to 0. This
  means all IRQ will use the N-N model, and if s->revision !=3D
  REV_11MPCORE, then there's no way to set any interrupt to 1-N.

  If ""fixed"" locally with a hackjob, I still have the following trace:

  pl011_irq_state 534130.800 pid=3D2424 level=3D0x1
  gic_set_irq 2.900 pid=3D2424 irq=3D0x21 level=3D0x1 cpumask=3D0xff target=
=3D0xff
  gic_update_set_irq 3.300 pid=3D2424 cpu=3D0x0 name=3Dirq level=3D0x1
  gic_update_set_irq 4.200 pid=3D2424 cpu=3D0x1 name=3Dirq level=3D0x1
  gic_acknowledge_irq 539.400 pid=3D2424 s=3Dcpu cpu=3D0x1 irq=3D0x21
  gic_update_set_irq 269.800 pid=3D2424 cpu=3D0x0 name=3Dirq level=3D0x1
  gic_cpu_read 4.100 pid=3D2424 s=3Dcpu cpu=3D0x1 addr=3D0xc val=3D0x21
  gic_acknowledge_irq 15.600 pid=3D2424 s=3Dcpu cpu=3D0x0 irq=3D0x21
  gic_cpu_read 265.000 pid=3D2424 s=3Dcpu cpu=3D0x0 addr=3D0xc val=3D0x21
  pl011_write 1594.700 pid=3D2424 addr=3D0x44 value=3D0x50
  pl011_irq_state 2.000 pid=3D2424 level=3D0x0
  gic_set_irq 1.300 pid=3D2424 irq=3D0x21 level=3D0x0 cpumask=3D0xff target=
=3D0xff
  pl011_write 30.700 pid=3D2424 addr=3D0x38 value=3D0x0
  pl011_irq_state 1.200 pid=3D2424 level=3D0x0
  gic_cpu_write 110.600 pid=3D2424 s=3Dcpu cpu=3D0x0 addr=3D0x10 val=3D0x21
  gic_cpu_write 193.400 pid=3D2424 s=3Dcpu cpu=3D0x0 addr=3D0x1000 val=3D0x=
21
  pl011_irq_state 1169.500 pid=3D2424 level=3D0x0

  This is because:

  2) gic_acknowledge_irq calls gic_clear_pending which uses
  GIC_DIST_CLEAR_PENDING but this usually has no effect on level-
  sensitive interrupts.

  With this often being a no-op (ie. assuming ispendr was not written
  to), any 1-n level-sensitive interrupt is still improperly pending on
  all the other cores.

  (Also, I don't really know how the qemu thread model works, there
  might be race conditions in the acknowledgment logic if
  gic_acknowledge_irq is called by multiple threads, too.)

  Option used:
  -nographic -machine virt,virtualization=3Don,accel=3Dtcg,gic-version=3D2 =
-cpu cortex-a57 -smp 4 -m 1024
  -kernel whatever.elf -d unimp,guest_errors -semihosting-config enable,tar=
get=3Dnative
  -chardev stdio,id=3Duart -serial chardev:uart -monitor none
  -trace gic_update_set_irq -trace gic_acknowledge_irq -trace pl011_irq_sta=
te -trace pl011_write -trace gic_cpu_read -trace gic_cpu_write
  -trace gic_set_irq

  Commit used: dc65a5bdc9fa543690a775b50d4ffbeb22c56d6d "Merge remote-
  tracking branch 'remotes/dgibson/tags/ppc-for-5.0-20200108' into
  staging"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1859384/+subscriptions

