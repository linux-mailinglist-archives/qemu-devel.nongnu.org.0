Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962DD3C695E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 06:29:51 +0200 (CEST)
Received: from localhost ([::1]:46978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3A3K-00067O-Jt
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 00:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39za-0006A1-4Y
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:25:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:40660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m39zX-0008RK-RX
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 00:25:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m39zU-0003eH-93
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 88B1D2E817D
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 04:25:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Jul 2021 04:17:22 -0000
From: Launchpad Bug Tracker <1915682@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: i386
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dniggema janitor th-huth
X-Launchpad-Bug-Reporter: Dirk A Niggemann (dniggema)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161335852512.21767.9269376658096381420.malonedeb@wampee.canonical.com>
Message-Id: <162614984276.15811.11526978491930854874.malone@loganberry.canonical.com>
Subject: [Bug 1915682] Re: i386-linux-user wine exception regression tests fail
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: a347662d590b37028e4dbbf5a53ec07221cff255
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
Reply-To: Bug 1915682 <1915682@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915682

Title:
  i386-linux-user wine exception regression tests fail

Status in QEMU:
  Expired

Bug description:
  When trying to run wine (latest devel from git) regression tests for
  ntdll in a statically linked qemu-i386 (commit
  392b9a74b9b621c52d05e37bc6f41f1bbab5c6f8) on arm32 (raspberry pi 4) in
  a debian buster chroot, the exception tests fail at the first test
  with an infinite exception loop.

  WINEDEBUG=3D+seh wine wine/dlls/ntdll/tests/ntdll_test.exe exception

  =

  Working x86_64 system running 32-bit code

  0024:warn:seh:dispatch_exception EXCEPTION_ACCESS_VIOLATION exception (co=
de=3Dc0000005) raised
  0024:trace:seh:dispatch_exception  eax=3D00000000 ebx=3D7ffc2000 ecx=3D00=
4e0ef4 edx=3D003c0004 esi=3D003c0000 edi=3D00000000
  0024:trace:seh:dispatch_exception  ebp=3D0085fa08 esp=3D0085f9ac cs=3D002=
3 ds=3D002b es=3D002b fs=3D0063 gs=3D006b flags=3D00010246
  0024:trace:seh:call_vectored_handlers calling handler at 7B00B460 code=3D=
c0000005 flags=3D0
  0024:trace:seh:call_vectored_handlers handler at 7B00B460 returned 0
  0024:trace:seh:call_stack_handlers calling handler at 004178B0 code=3Dc00=
00005 flags=3D0
  0024:trace:seh:call_stack_handlers handler at 004178B0 returned 0
  0024:trace:seh:dispatch_exception  call_stack_handlers continuing
  0024:trace:seh:NtGetContextThread 0xfffffffe: dr0=3D42424240 dr1=3D000000=
00 dr2=3D126bb070 dr3=3D0badbad0 dr6=3D00000000 dr7=3Dffff0115

  =

  Non-working qemu

  0024:warn:seh:dispatch_exception EXCEPTION_ACCESS_VIOLATION exception (co=
de=3Dc0000005) raised
  0024:trace:seh:dispatch_exception  eax=3D00000000 ebx=3D3ffe2000 ecx=3D00=
4e0ef4 edx=3D003c0004 esi=3D003c0000 edi=3D00000000
  0024:trace:seh:dispatch_exception  ebp=3D0085fa08 esp=3D0085f9ac cs=3D002=
3 ds=3D002b es=3D002b fs=3D003b gs=3D0033 flags=3D00000246
  0024:trace:seh:call_vectored_handlers calling handler at 7B00B460 code=3D=
c0000005 flags=3D0
  0024:trace:seh:call_vectored_handlers handler at 7B00B460 returned 0
  0024:trace:seh:call_stack_handlers calling handler at 004178B0 code=3Dc00=
00005 flags=3D0
  0024:trace:seh:call_stack_handlers handler at 004178B0 returned 0
  0024:trace:seh:dispatch_exception  call_stack_handlers continuing
  0024:trace:seh:dispatch_exception  call_stack_handlers ret status =3D 0
  0024:trace:seh:dispatch_exception code=3D0 flags=3D1 addr=3D7BC2389C ip=
=3D7bc2389c tid=3D0024

  The non-working verion is never managing to set the CPU context using
  NtContinue/SetContextThread back to the correct running thread stack
  and IP. It executes as if the context restore just returns to the
  function that called NtContinue() (dispatch_exception(), not the
  function that raised the exception or one of its parent exception
  handlers).

  It looks like NtSetContextThread(), specifically the asm function
  set_full_cpu_context() is being handled incorrectly.

  wine code below. note interesting use of iret with no previous
  interrupt call. The exception handler is called with a jmp.

  /***********************************************************************
   *           set_full_cpu_context
   *
   * Set the new CPU context.
   */
  extern void set_full_cpu_context( const CONTEXT *context );
  __ASM_GLOBAL_FUNC( set_full_cpu_context,
                     "movl $0,%fs:0x1f8\n\t"     /* x86_thread_data()->sysc=
all_frame =3D NULL */
                     "movl 4(%esp),%ecx\n\t"
                     "movw 0x8c(%ecx),%gs\n\t"  /* SegGs */
                     "movw 0x90(%ecx),%fs\n\t"  /* SegFs */
                     "movw 0x94(%ecx),%es\n\t"  /* SegEs */
                     "movl 0x9c(%ecx),%edi\n\t" /* Edi */
                     "movl 0xa0(%ecx),%esi\n\t" /* Esi */
                     "movl 0xa4(%ecx),%ebx\n\t" /* Ebx */
                     "movl 0xb4(%ecx),%ebp\n\t" /* Ebp */
                     "movw %ss,%ax\n\t"
                     "cmpw 0xc8(%ecx),%ax\n\t"  /* SegSs */
                     "jne 1f\n\t"
                     /* As soon as we have switched stacks the context stru=
cture could
                      * be invalid (when signal handlers are executed for e=
xample). Copy
                      * values on the target stack before changing ESP. */
                     "movl 0xc4(%ecx),%eax\n\t" /* Esp */
                     "leal -4*4(%eax),%eax\n\t"
                     "movl 0xc0(%ecx),%edx\n\t" /* EFlags */
                     ".byte 0x36\n\t"
                     "movl %edx,3*4(%eax)\n\t"
                     "movl 0xbc(%ecx),%edx\n\t" /* SegCs */
                     ".byte 0x36\n\t"
                     "movl %edx,2*4(%eax)\n\t"
                     "movl 0xb8(%ecx),%edx\n\t" /* Eip */
                     ".byte 0x36\n\t"
                     "movl %edx,1*4(%eax)\n\t"
                     "movl 0xb0(%ecx),%edx\n\t" /* Eax */
                     ".byte 0x36\n\t"
                     "movl %edx,0*4(%eax)\n\t"
                     "pushl 0x98(%ecx)\n\t"     /* SegDs */
                     "movl 0xa8(%ecx),%edx\n\t" /* Edx */
                     "movl 0xac(%ecx),%ecx\n\t" /* Ecx */
                     "popl %ds\n\t"
                     "movl %eax,%esp\n\t"
                     "popl %eax\n\t"
                     "iret\n"
                     /* Restore the context when the stack segment changes.=
 We can't use
                      * the same code as above because we do not know if th=
e stack segment
                      * is 16 or 32 bit, and 'movl' will throw an exception=
 when we try to
                      * access memory above the limit. */
                     "1:\n\t"
                     "movl 0xa8(%ecx),%edx\n\t" /* Edx */
                     "movl 0xb0(%ecx),%eax\n\t" /* Eax */
                     "movw 0xc8(%ecx),%ss\n\t"  /* SegSs */
                     "movl 0xc4(%ecx),%esp\n\t" /* Esp */
                     "pushl 0xc0(%ecx)\n\t"     /* EFlags */
                     "pushl 0xbc(%ecx)\n\t"     /* SegCs */
                     "pushl 0xb8(%ecx)\n\t"     /* Eip */
                     "pushl 0x98(%ecx)\n\t"     /* SegDs */
                     "movl 0xac(%ecx),%ecx\n\t" /* Ecx */
                     "popl %ds\n\t"
                     "iret" )

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915682/+subscriptions

