Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAC5377758
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:31:20 +0200 (CEST)
Received: from localhost ([::1]:34742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflOp-0007YC-NG
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflEd-0006DI-9m
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:20:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:56350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflEX-0007e5-5e
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:20:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lflEU-0001bL-Rp
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:20:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CF2972E8187
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:20:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:11:33 -0000
From: Thomas Huth <1831225@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bonzini dgilbert-h dionbosschieter frank9999
 jpmenil th-huth
X-Launchpad-Bug-Reporter: Dion Bosschieter (dionbosschieter)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155929929657.13088.9555373471112683391.malonedeb@soybean.canonical.com>
Message-Id: <162057309324.2575.18284454577796751043.malone@wampee.canonical.com>
Subject: [Bug 1831225] Re: guest migration 100% cpu freeze bug
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 96704f0b358a6e2a7d5482a5b46234432787d481
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
Reply-To: Bug 1831225 <1831225@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/223


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #223
   https://gitlab.com/qemu-project/qemu/-/issues/223

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1831225

Title:
  guest migration 100% cpu freeze bug

Status in QEMU:
  Expired

Bug description:
  # Investigate migration cpu hog(100%) bug

  I have some issues when migrating from kernel 4.14.63 running qemu 2.11.2=
 to kernel 4.19.43 running qemu 2.11.2.
  The hypervisors are running on debian jessie with libvirt v5.3.0.
  Linux, libvirt and qemu are all custom compiled.

  I migrated around 10.000 vms and every once in a while a vm is stuck
  at 100% cpu after what we can see right now is that the target
  hypervisor runs on linux 4.19.53. This happened with 4 vms so far. It
  is not that easy to debug, we found this out pretty quickly because we
  are running monitoring on frozen vms after migrations.

  Last year we were having the same "kind of" bug https://bugs.launchpad.ne=
t/qemu/+bug/1775555 when trying to upgrade qemu 2.6 to 2.11.
  This bug was fixed after applying the following patch: http://lists.nongn=
u.org/archive/html/qemu-devel/2018-04/msg00820.html

  This patch is still applied as you can see because of the available pre_l=
oad var on the kvmclock_vmsd struct:
  (gdb) ptype kvmclock_vmsd
  type =3D const struct VMStateDescription {
      const char *name;
      int unmigratable;
      int version_id;
      int minimum_version_id;
      int minimum_version_id_old;
      MigrationPriority priority;
      LoadStateHandler *load_state_old;
      int (*pre_load)(void *);                                             =
   =

      int (*post_load)(void *, int);
      int (*pre_save)(void *);
      _Bool (*needed)(void *);
      VMStateField *fields;
      const VMStateDescription **subsections;
  }

  I attached gdb to a vcpu thread of one stuck vm, and a bt showed the foll=
owing info:
  Thread 4 (Thread 0x7f3a431a4700 (LWP 37799)):
  #0  0x00007f3a576f5017 in ioctl () at ../sysdeps/unix/syscall-template.S:=
84
  #1  0x000055d84d15de57 in kvm_vcpu_ioctl (cpu=3Dcpu@entry=3D0x55d84fca78d=
0, type=3Dtype@entry=3D44672) at /home/dbosschieter/src/qemu-pkg/src/accel/=
kvm/kvm-all.c:2050
  #2  0x000055d84d15dfc6 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x55d84fca78d0)=
 at /home/dbosschieter/src/qemu-pkg/src/accel/kvm/kvm-all.c:1887
  #3  0x000055d84d13ab64 in qemu_kvm_cpu_thread_fn (arg=3D0x55d84fca78d0) a=
t /home/dbosschieter/src/qemu-pkg/src/cpus.c:1136
  #4  0x00007f3a579ba4a4 in start_thread (arg=3D0x7f3a431a4700) at pthread_=
create.c:456
  #5  0x00007f3a576fcd0f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:97

  Thread 3 (Thread 0x7f3a439a5700 (LWP 37798)):
  #0  0x00007f3a576f5017 in ioctl () at ../sysdeps/unix/syscall-template.S:=
84
  #1  0x000055d84d15de57 in kvm_vcpu_ioctl (cpu=3Dcpu@entry=3D0x55d84fc5cbb=
0, type=3Dtype@entry=3D44672) at /home/dbosschieter/src/qemu-pkg/src/accel/=
kvm/kvm-all.c:2050
  #2  0x000055d84d15dfc6 in kvm_cpu_exec (cpu=3Dcpu@entry=3D0x55d84fc5cbb0)=
 at /home/dbosschieter/src/qemu-pkg/src/accel/kvm/kvm-all.c:1887
  #3  0x000055d84d13ab64 in qemu_kvm_cpu_thread_fn (arg=3D0x55d84fc5cbb0) a=
t /home/dbosschieter/src/qemu-pkg/src/cpus.c:1136
  #4  0x00007f3a579ba4a4 in start_thread (arg=3D0x7f3a439a5700) at pthread_=
create.c:456
  #5  0x00007f3a576fcd0f in clone () at ../sysdeps/unix/sysv/linux/x86_64/c=
lone.S:97

  The ioctl call is a ioctl(18, KVM_RUN and it looks like it is looping
  inside the vm itself.

  I saved the state of the VM (with `virsh save`) after I found it was hang=
ing on its vcpu threads. Then I restored this vm on a test environment runn=
ing the same kernel, QEMU and libvirt version). After the restore the VM st=
ill was haning at 100% cpu usage on all the vcpus.
  I tried to use the perf kvm guest option to trace the guest vm with a cop=
y of the kernel, modules and kallsyms files from inside the guest vm and I =
got to the following perf stat:

   Event                                         Total %Total CurAvg/s
   kvm_entry                                   5198993   23.1   277007
   kvm_exit                                    5198976   23.1   277006
   kvm_apic                                    1732103    7.7    92289
   kvm_msr                                     1732101    7.7    92289
   kvm_inj_virq                                1731904    7.7    92278
   kvm_eoi                                     1731900    7.7    92278
   kvm_apic_accept_irq                         1731900    7.7    92278
   kvm_hv_timer_state                          1731780    7.7    92274
   kvm_pv_eoi                                  1731701    7.7    92267
   kvm_ple_window                                   36    0.0        2
   Total                                      22521394         1199967

  We tried to run the crash tool against a dump of guest vm memory and that=
 gave us the following backtrace:
  crash> bt
  PID: 0      TASK: ffffffff81610040  CPU: 0   COMMAND: "swapper/0"
      [exception RIP: native_read_tsc+2]
      RIP: ffffffff810146a9  RSP: ffff88003fc03df0  RFLAGS: 00000046
      RAX: 000000008762c0fa  RBX: ffff88003fc13680  RCX: 0000000000000001
      RDX: 0000000000fe4871  RSI: 0000000000000000  RDI: ffff88003fc13603
      RBP: 000000000003052c   R8: 0000000000000200   R9: ffffffff8169b180
      R10: 0000000000000020  R11: 0000000000000005  R12: 006a33290b40455c
      R13: 00000000df1fd292  R14: 000000002ca284ff  R15: 00fe485f3febe21a
      CS: 0010  SS: 0018
   #0 [ffff88003fc03df0] pvclock_clocksource_read at ffffffff8102cbb3
   #1 [ffff88003fc03e40] kvm_clock_read at ffffffff8102c2c9
   #2 [ffff88003fc03e50] timekeeping_get_ns at ffffffff810691b0
   #3 [ffff88003fc03e60] ktime_get at ffffffff810695c8
   #4 [ffff88003fc03e90] sched_rt_period_timer at ffffffff8103e4f5
   #5 [ffff88003fc03ee0] __run_hrtimer at ffffffff810652d3
   #6 [ffff88003fc03f20] hrtimer_interrupt at ffffffff81065abd
   #7 [ffff88003fc03f90] smp_apic_timer_interrupt at ffffffff81024ba8
   #8 [ffff88003fc03fb0] apic_timer_interrupt at ffffffff813587e2
  --- <IRQ stack> ---
   #9 [ffffffff81601e98] apic_timer_interrupt at ffffffff813587e2
      [exception RIP: native_safe_halt+2]
      RIP: ffffffff8102c360  RSP: ffffffff81601f40  RFLAGS: 00010246
      RAX: 0000000000000000  RBX: ffffffff81601fd8  RCX: 00000000ffffffff
      RDX: 00000000ffffffff  RSI: 0000000000000000  RDI: 0000000000000001
      RBP: 0000000000000000   R8: 0000000000000000   R9: 0000000000000000
      R10: 0000000000000020  R11: 0000000000000005  R12: ffffffff816f5d80
      R13: ffffffffffffffff  R14: 000000000008c800  R15: 0000000000000000
      ORIG_RAX: ffffffffffffff10  CS: 0010  SS: 0018
  #10 [ffffffff81601f40] default_idle at ffffffff81014c35
  #11 [ffffffff81601f50] cpu_idle at ffffffff8100d258

  So it seems like the vm is reading its clock constantly trying to
  catch up some time after the migration.

  Last time it was a bug that was only triggered on newer Gold cpu
  hardware, but this time we also see this coming back on older Intel E5
  cpus we tried to reproduce with a migrate loop of 3 days times between
  kernel 4.14.63 and 4.19.43 but this gave us no results.

  The vms were running ubuntu 14.04, centos 7, debian 7, debian 8 these
  vms are running linux kernel 3.*.

  The thing is that we are out of ideas for reproducing this, it seems
  like it the same kind of bug we are hitting, just like last time the
  vm is basically only trying to read the clock. Perhaps we can try to
  read the clock data and also try to read what the guest is actually
  waiting for, which value of the counter does it want to reach.

  I am not sure how to pinpoint the cause of this issue, I would like some =
help and possible some extra tips on debugging.
  We are able to read the guests kernel which makes it a bit easier to debu=
g, reproducing and finding the source of the problem is still something we =
are trying to figure out.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1831225/+subscriptions

