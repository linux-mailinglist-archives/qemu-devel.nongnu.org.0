Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E97373E6E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 17:23:31 +0200 (CEST)
Received: from localhost ([::1]:42980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leJN3-0001Os-Kx
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 11:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJKn-0008T8-8K
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:21:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:44608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leJKf-0008Fk-E6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 11:21:07 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leJKb-0003UV-3m
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 15:20:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 16FDB2E8196
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 15:20:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 15:14:52 -0000
From: Thomas Huth <1909770@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: cris linux-user
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: on7wpi pmaydell th-huth
X-Launchpad-Bug-Reporter: ON7WPI (on7wpi)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160943407589.12883.6323653042448683983.malonedeb@chaenomeles.canonical.com>
Message-Id: <162022769247.582.11831303209953477814.malone@chaenomeles.canonical.com>
Subject: [Bug 1909770] Re: qemu-cris segfaults upon loading userspace binary
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: bd5fefd96992a0f2b9f779f7eda2b4310a3a4e0d
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
Reply-To: Bug 1909770 <1909770@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, thanks for the confirmation!

** Changed in: qemu
       Status: Expired =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909770

Title:
  qemu-cris segfaults upon loading userspace binary

Status in QEMU:
  Fix Released

Bug description:
  I am on commit 65a3c5984074313602fb5f61cc5f464abfb020c7 (latest as far
  as I know). I compiled qemu with --enable-debug.

  I'm trying to run a userspace CRIS binary (`./qemu-cris -cpu crisv10
  ./basic`), but this segfaults. When opening the coredump in gdb, I get

  gdb-peda$ bt
  #0  0x00007f272a2e1ee1 in __memset_avx2_erms () from /usr/lib/libc.so.6
  #1  0x0000564a2f7bcda7 in zero_bss (elf_bss=3D0x82134, last_bss=3D0x84000=
, =

      prot=3D0x3) at ../linux-user/elfload.c:1865
  #2  0x0000564a2f7bff65 in load_elf_image (
      image_name=3D0x7fffe9f5703d "./basic", image_fd=3D0x3, =

      info=3D0x7fffe9f547c0, pinterp_name=3D0x7fffe9f545b0, =

      bprm_buf=3D0x7fffe9f54920 "\177ELF\001\001\001")
      at ../linux-user/elfload.c:2801
  #3  0x0000564a2f7c0a12 in load_elf_binary (bprm=3D0x7fffe9f54920, =

      info=3D0x7fffe9f547c0) at ../linux-user/elfload.c:3104
  #4  0x0000564a2f81f290 in loader_exec (fdexec=3D0x3, =

      filename=3D0x7fffe9f5703d "./basic", argv=3D0x564a2f9f3cc0, =

      envp=3D0x564a2fa12600, regs=3D0x7fffe9f54860, infop=3D0x7fffe9f547c0, =

      bprm=3D0x7fffe9f54920) at ../linux-user/linuxload.c:147
  #5  0x0000564a2f7c4f9f in main (argc=3D0x4, argv=3D0x7fffe9f54e78, =

      envp=3D0x7fffe9f54ea0) at ../linux-user/main.c:808
  #6  0x00007f272a1a4152 in __libc_start_main () from /usr/lib/libc.so.6
  #7  0x0000564a2f786cee in _start ()

  Or as a full backtrace:
  gdb-peda$ bt full
  #0  0x00007f272a2e1ee1 in __memset_avx2_erms () from /usr/lib/libc.so.6
  No symbol table info available.
  #1  0x0000564a2f7bcda7 in zero_bss (elf_bss=3D0x82134, last_bss=3D0x84000=
, =

      prot=3D0x3) at ../linux-user/elfload.c:1865
          host_start =3D 0x92134
          host_map_start =3D 0x93000
          host_end =3D 0x94000
  #2  0x0000564a2f7bff65 in load_elf_image (
      image_name=3D0x7fffe9f5703d "./basic", image_fd=3D0x3, =

      info=3D0x7fffe9f547c0, pinterp_name=3D0x7fffe9f545b0, =

      bprm_buf=3D0x7fffe9f54920 "\177ELF\001\001\001")
      at ../linux-user/elfload.c:2801
          vaddr =3D 0x82134
          vaddr_em =3D 0x82140
          vaddr_len =3D 0x2000
          vaddr_po =3D 0x134
          vaddr_ps =3D 0x82000
          vaddr_ef =3D 0x82134
          elf_prot =3D 0x3
          eppnt =3D 0x7fffe9f54974
          ehdr =3D 0x7fffe9f54920
          phdr =3D 0x7fffe9f54954
          load_addr =3D 0x80000
          load_bias =3D 0x0
          loaddr =3D 0x80000
          hiaddr =3D 0x1082140
          error =3D 0x80000
          i =3D 0x1
          retval =3D 0x273d2e9c
          prot_exec =3D 0x4
          err =3D 0x0
          __func__ =3D "load_elf_image"
  #3  0x0000564a2f7c0a12 in load_elf_binary (bprm=3D0x7fffe9f54920, =

      info=3D0x7fffe9f547c0) at ../linux-user/elfload.c:3104
          interp_info =3D {
            load_bias =3D 0x0,
            load_addr =3D 0x0,
            start_code =3D 0x0,
            end_code =3D 0x0,
            start_data =3D 0x0,
            end_data =3D 0x0,
            start_brk =3D 0x0,
            brk =3D 0x0,
            reserve_brk =3D 0x0,
            start_mmap =3D 0x0,
            start_stack =3D 0x0,
            stack_limit =3D 0x0,
            entry =3D 0x0,
            code_offset =3D 0x0,
            data_offset =3D 0x0,
            saved_auxv =3D 0x0,
            auxv_len =3D 0x0,
            arg_start =3D 0x0,
            arg_end =3D 0x0,
            arg_strings =3D 0x0,
            env_strings =3D 0x0,
            file_string =3D 0x0,
            elf_flags =3D 0x0,
            personality =3D 0x0,
            alignment =3D 0x0,
            loadmap_addr =3D 0x0,
            nsegs =3D 0x0,
            loadsegs =3D 0x0,
            pt_dynamic_addr =3D 0x0,
            interpreter_loadmap_addr =3D 0x0,
            interpreter_pt_dynamic_addr =3D 0x0,
            other_info =3D 0x0,
            note_flags =3D 0x0
          }
          elf_ex =3D {
            e_ident =3D "|\214\t1\000\000\000\000\262\002\356_\000\000\000",
            e_type =3D 0x8c7c,
            e_machine =3D 0x3109,
            e_version =3D 0x0,
            e_entry =3D 0x5fee02b2,
            e_phoff =3D 0x0,
            e_shoff =3D 0x31098c7c,
            e_flags =3D 0x0,
            e_ehsize =3D 0x0,
            e_phentsize =3D 0x0,
            e_phnum =3D 0x0,
            e_shentsize =3D 0x0,
            e_shnum =3D 0x0,
            e_shstrndx =3D 0x0
          }
          elf_interpreter =3D 0x0
          scratch =3D 0x7f272a358021 <read+97> "H\213D$\bH\203\304(\303\017=
\037D"
  #4  0x0000564a2f81f290 in loader_exec (fdexec=3D0x3, =

      filename=3D0x7fffe9f5703d "./basic", argv=3D0x564a2f9f3cc0, =

      envp=3D0x564a2fa12600, regs=3D0x7fffe9f54860, infop=3D0x7fffe9f547c0, =

      bprm=3D0x7fffe9f54920) at ../linux-user/linuxload.c:147
          retval =3D 0x400
  #5  0x0000564a2f7c4f9f in main (argc=3D0x4, argv=3D0x7fffe9f54e78, =

      envp=3D0x7fffe9f54ea0) at ../linux-user/main.c:808
          regs1 =3D {
            orig_r10 =3D 0x0,
            r0 =3D 0x0,
            r1 =3D 0x0,
            r2 =3D 0x0,
            r3 =3D 0x0,
            r4 =3D 0x0,
            r5 =3D 0x0,
            r6 =3D 0x0,
            r7 =3D 0x0,
            r8 =3D 0x0,
            r9 =3D 0x0,
            r10 =3D 0x0,
            r11 =3D 0x0,
            r12 =3D 0x0,
            r13 =3D 0x0,
            acr =3D 0x0,
            srs =3D 0x0,
            mof =3D 0x0,
            spc =3D 0x0,
            ccs =3D 0x0,
            srp =3D 0x0,
            erp =3D 0x0,
            exs =3D 0x0,
            eda =3D 0x0
          }
          regs =3D 0x7fffe9f54860
          info1 =3D {
            load_bias =3D 0x0,
            load_addr =3D 0x80000,
            start_code =3D 0x80000,
            end_code =3D 0x80133,
            start_data =3D 0xffffffff,
            end_data =3D 0x0,
            start_brk =3D 0x0,
            brk =3D 0x80133,
            reserve_brk =3D 0x1000000,
            start_mmap =3D 0x80000000,
            start_stack =3D 0x0,
            stack_limit =3D 0x0,
            entry =3D 0x80106,
            code_offset =3D 0x0,
            data_offset =3D 0x0,
            saved_auxv =3D 0x0,
            auxv_len =3D 0x0,
            arg_start =3D 0x0,
            arg_end =3D 0x0,
            arg_strings =3D 0x0,
            env_strings =3D 0x0,
            file_string =3D 0x0,
            elf_flags =3D 0x0,
            personality =3D 0x0,
            alignment =3D 0x2000,
            loadmap_addr =3D 0x0,
            nsegs =3D 0x2,
            loadsegs =3D 0x0,
            pt_dynamic_addr =3D 0x0,
            interpreter_loadmap_addr =3D 0x0,
            interpreter_pt_dynamic_addr =3D 0x0,
            other_info =3D 0x0,
            note_flags =3D 0x0
          }
          info =3D 0x7fffe9f547c0
          bprm =3D {
            buf =3D "\177ELF\001\001\001\000\000\000\000\000\000\000\000\00=
0\002\000L\000\001\000\000\000\006\001\b\000\064\000\000\000\264\006\000\00=
0\000\000\000\000\064\000 \000\003\000(\000\016\000\r\000\001\000\000\000\0=
00\000\000\000\000\000\b\000\000\000\b\000\063\001\000\000\063\001\000\000\=
005\000\000\000\000 \000\000\001\000\000\000\064\001\000\000\064!\b\000\064=
!\b\000\000\000\000\000\f\000\000\000\006\000\000\000\000 \000\000\004\000\=
000\000\224\000\000\000\224\000\b\000\224\000\b\000$\000\000\000$\000\000\0=
00\004\000\000\000\004\000\000\000\004\000\000\000\024\000\000\000\003\000\=
000\000GNU\000PH\017'i\204\231\070e\000\247\376\211\230\236\336Nf7\372\204\=
342\356\213n\206\214\342\374\201\352\253\370\201\353\273"...,
            p =3D 0x0,
            fd =3D 0x3,
            e_uid =3D 0x3e8,
            e_gid =3D 0x3d9,
            argc =3D 0x1,
            envc =3D 0x43,
            argv =3D 0x564a2f9f3cc0,
            envp =3D 0x564a2fa12600,
            filename =3D 0x7fffe9f5703d "./basic",
            core_dump =3D 0x0
          }
          ts =3D 0x564a2fa25400
          env =3D 0x564a2fa24a08
          cpu =3D 0x564a2fa1c730
          optind =3D 0x3
          target_environ =3D 0x564a2fa12600
          wrk =3D 0x7fffe9f550b8
          target_argv =3D 0x564a2f9f3cc0
          target_argc =3D 0x1
          i =3D 0x1
          ret =3D 0x7fff
          execfd =3D 0x3
          log_mask =3D 0x0
          max_reserved_va =3D 0xffffe000
  #6  0x00007f272a1a4152 in __libc_start_main () from /usr/lib/libc.so.6
  No symbol table info available.
  #7  0x0000564a2f786cee in _start ()
  No symbol table info available.

  =

  The binary itself is just a basic binary that prints "hello\n" to stdout.=
 I have attached it.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1909770/+subscriptions

