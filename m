Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8E6372734
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:26:59 +0200 (CEST)
Received: from localhost ([::1]:52350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqOQ-0007d6-NE
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldqHo-0001sF-19
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:20:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:46978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldqHk-0003Ug-RG
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:20:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldqHj-0001Jj-OO
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 08:20:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B3A642E8060
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 08:20:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 08:04:49 -0000
From: Thomas Huth <1602247@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: luc-michel+ubuntuone pmaydell th-huth
X-Launchpad-Bug-Reporter: Luc Michel (luc-michel+ubuntuone)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160712124612.14797.69428.malonedeb@soybean.canonical.com>
Message-Id: <162011549007.12168.7253845003707471995.malone@soybean.canonical.com>
Subject: [Bug 1602247] Re: SIGSEGV when reading ARM GIC registers through GDB
 stub
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: f6ab4984bae5886479b02a1ef321f64b0a123c4f
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
Reply-To: Bug 1602247 <1602247@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/124


** Changed in: qemu
       Status: Confirmed =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #124
   https://gitlab.com/qemu-project/qemu/-/issues/124

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1602247

Title:
  SIGSEGV when reading ARM GIC registers through GDB stub

Status in QEMU:
  Expired

Bug description:
  When trying to access ARM GIC CPU registers through a target GDB
  connected to QEMU, QEMU crashes with a SIGSEGV.

  Reproducible on last master revision (74e1b78 at the time of writing):

  $ ./configure --target-list=3Darm-softmmu --python=3Dpython2 --enable-deb=
ug
  $ make
  $ gdb --args ./arm-softmmu/qemu-system-arm -M vexpress-a15 -smp 2 -s -S

  =

  Connect a gdb on the other side:
  $ arm-none-eabi-gdb
  (gdb) tar rem :1234
  Remote debugging using :1234
  0x00000000 in ?? ()
  (gdb) x /x 0x2c002000

  =

  QEMU crashes as it tries to access current_cpu->cpu_index while current_c=
pu is NULL:

  Thread 1 "qemu-system-arm" received signal SIGSEGV, Segmentation fault.
  0x0000555555a372cf in gic_get_current_cpu (s=3D0x555556a34f10) at hw/intc=
/arm_gic.c:53
  53	        return current_cpu->cpu_index;
  (gdb) p current_cpu
  $1 =3D (CPUState *) 0x0

  Backtrace:
  (gdb) bt
  #0  0x0000555555a372cf in gic_get_current_cpu (s=3D0x555556a34f10) at hw/=
intc/arm_gic.c:53
  #1  0x0000555555a3b0e3 in gic_thiscpu_read (opaque=3D0x555556a34f10, addr=
=3D0, data=3D0x7fffffffa0a8, size=3D4, attrs=3D...) at hw/intc/arm_gic.c:13=
40
  #2  0x00005555557ae2bb in memory_region_read_with_attrs_accessor (mr=3D0x=
555556a37a70, addr=3D0, value=3D0x7fffffffa208, size=3D4, shift=3D0, mask=
=3D4294967295, attrs=3D...) at /home/sekoia/devel/src/qemu/memory.c:461
  #3  0x00005555557ae7ac in access_with_adjusted_size (addr=3D0, value=3D0x=
7fffffffa208, size=3D4, access_size_min=3D1, access_size_max=3D4, access=3D=
0x5555557ae25f <memory_region_read_with_attrs_accessor>, mr=3D0x555556a37a7=
0, attrs=3D...)
      at /home/sekoia/devel/src/qemu/memory.c:591
  #4  0x00005555557b0de7 in memory_region_dispatch_read1 (mr=3D0x555556a37a=
70, addr=3D0, pval=3D0x7fffffffa208, size=3D4, attrs=3D...) at /home/sekoia=
/devel/src/qemu/memory.c:1187
  #5  0x00005555557b0e9d in memory_region_dispatch_read (mr=3D0x555556a37a7=
0, addr=3D0, pval=3D0x7fffffffa208, size=3D4, attrs=3D...) at /home/sekoia/=
devel/src/qemu/memory.c:1212
  #6  0x000055555576775b in address_space_read_continue (as=3D0x5555569c70b=
0, addr=3D738205696, attrs=3D..., buf=3D0x7fffffffb440 "", len=3D4, addr1=
=3D0, l=3D4, mr=3D0x555556a37a70) at /home/sekoia/devel/src/qemu/exec.c:2668
  #7  0x0000555555767929 in address_space_read_full (as=3D0x5555569c70b0, a=
ddr=3D738205696, attrs=3D..., buf=3D0x7fffffffb440 "", len=3D4) at /home/se=
koia/devel/src/qemu/exec.c:2725
  #8  0x00005555557679eb in address_space_read (len=3D4, buf=3D0x7fffffffb4=
40 "", attrs=3D..., addr=3D738205696, as=3D0x5555569c70b0) at /home/sekoia/=
devel/src/qemu/include/exec/memory.h:1476
  #9  address_space_rw (as=3D0x5555569c70b0, addr=3D738205696, attrs=3D...,=
 buf=3D0x7fffffffb440 "", len=3D4, is_write=3Dfalse) at /home/sekoia/devel/=
src/qemu/exec.c:2739
  #10 0x000055555576988f in cpu_memory_rw_debug (cpu=3D0x5555568a3d00, addr=
=3D738205696, buf=3D0x7fffffffb440 "", len=3D4, is_write=3D0) at /home/seko=
ia/devel/src/qemu/exec.c:3653
  #11 0x00005555557a3db3 in target_memory_rw_debug (cpu=3D0x5555568a3d00, a=
ddr=3D738205696, buf=3D0x7fffffffb440 "", len=3D4, is_write=3Dfalse) at /ho=
me/sekoia/devel/src/qemu/gdbstub.c:54
  #12 0x00005555557a53f5 in gdb_handle_packet (s=3D0x55555722c530, line_buf=
=3D0x55555722c54c "m2c002000,4") at /home/sekoia/devel/src/qemu/gdbstub.c:9=
68
  #13 0x00005555557a6b84 in gdb_read_byte (s=3D0x55555722c530, ch=3D52) at =
/home/sekoia/devel/src/qemu/gdbstub.c:1458
  #14 0x00005555557a6ca4 in gdb_chr_receive (opaque=3D0x0, buf=3D0x7fffffff=
c590 "$m2c002000,4#84c8ead:arm-neon.xml:7fd,802#4c;qRelocInsn+;fork-events+=
;vfork-events+;exec-events+;vContSupported+;QThreadEvents+;no-resumed+#df",=
 size=3D15)
      at /home/sekoia/devel/src/qemu/gdbstub.c:1666
  #15 0x000055555591c562 in qemu_chr_be_write_impl (s=3D0x555557226e20, buf=
=3D0x7fffffffc590 "$m2c002000,4#84c8ead:arm-neon.xml:7fd,802#4c;qRelocInsn+=
;fork-events+;vfork-events+;exec-events+;vContSupported+;QThreadEvents+;no-=
resumed+#df", =

      len=3D15) at qemu-char.c:387
  #16 0x000055555591c5c0 in qemu_chr_be_write (s=3D0x555557226e20, buf=3D0x=
7fffffffc590 "$m2c002000,4#84c8ead:arm-neon.xml:7fd,802#4c;qRelocInsn+;fork=
-events+;vfork-events+;exec-events+;vContSupported+;QThreadEvents+;no-resum=
ed+#df", len=3D15)
      at qemu-char.c:399
  #17 0x00005555559207f3 in tcp_chr_read (chan=3D0x555556e52ff0, cond=3DG_I=
O_IN, opaque=3D0x555557226e20) at qemu-char.c:2893
  #18 0x0000555555c4a9b7 in qio_channel_fd_source_dispatch (source=3D0x5555=
57226ca0, callback=3D0x55555592069d <tcp_chr_read>, user_data=3D0x555557226=
e20) at io/channel-watch.c:84
  #19 0x00007fffed977c8a in g_main_context_dispatch () from /usr/lib/libgli=
b-2.0.so.0
  #20 0x0000555555bbf711 in glib_pollfds_poll () at main-loop.c:213
  #21 0x0000555555bbf7ec in os_host_main_loop_wait (timeout=3D29744918) at =
main-loop.c:258
  #22 0x0000555555bbf899 in main_loop_wait (nonblocking=3D0) at main-loop.c=
:506
  #23 0x0000555555929cd2 in main_loop () at vl.c:1908
  #24 0x00005555559315b7 in main (argc=3D8, argv=3D0x7fffffffdae8, envp=3D0=
x7fffffffdb30) at vl.c:4604

  Note that this bug is triggered only when the number of simulated CPUs
  is greater than 1.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1602247/+subscriptions

