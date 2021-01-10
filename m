Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2B42F0514
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:29:51 +0100 (CET)
Received: from localhost ([::1]:52832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kySMQ-0004Jp-Rp
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIk-0007lH-N2
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:40376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIh-0000fx-OR
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:02 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySIf-0000E0-Eo
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1D8752E8147
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:36 -0000
From: Launchpad Bug Tracker <1763536@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: djlwilder janitor mopsfelder pmaydell th-huth
X-Launchpad-Bug-Reporter: David Wilder (djlwilder)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152357545161.20027.863482450235173908.malonedeb@gac.canonical.com>
Message-Id: <161025225641.18863.16370190760845402196.malone@loganberry.canonical.com>
Subject: [Bug 1763536] Re: go build fails under qemu-ppc64le-static (qemu-user)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 7869f1243cd8127cf24facf493c03eb69626718f
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
Reply-To: Bug 1763536 <1763536@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1763536

Title:
  go build fails under qemu-ppc64le-static (qemu-user)

Status in QEMU:
  Expired

Bug description:
  I am using qemu-user (built static) in a docker container environment.
  When running multi-threaded go commands in the container (go build for
  example) the process may hang, report segfaults or other errors.  I
  built qemu-ppc64le from the upstream git (master).

  I see the problem running on a multi core system with Intel i7 processors.
  # cat /proc/cpuinfo | grep "model name"
  model name	: Intel(R) Core(TM) i7-2760QM CPU @ 2.40GHz
  model name	: Intel(R) Core(TM) i7-2760QM CPU @ 2.40GHz
  model name	: Intel(R) Core(TM) i7-2760QM CPU @ 2.40GHz
  model name	: Intel(R) Core(TM) i7-2760QM CPU @ 2.40GHz
  model name	: Intel(R) Core(TM) i7-2760QM CPU @ 2.40GHz
  model name	: Intel(R) Core(TM) i7-2760QM CPU @ 2.40GHz
  model name	: Intel(R) Core(TM) i7-2760QM CPU @ 2.40GHz
  model name	: Intel(R) Core(TM) i7-2760QM CPU @ 2.40GHz

  Steps to reproduce:
  1) Build qemu-ppc64le as static and copy into docker build directory name=
d it qemu-ppc64le-static.

  2) Add hello.go to docker build dir.

  package main
  import "fmt"
  func main() {
  	fmt.Println("hello world")
  }

  3) Create the Dockerfile from below:

  FROM ppc64le/golang:1.10.1-alpine3.
  COPY qemu-ppc64le-static /usr/bin/
  COPY hello.go /go

  4) Build container
  $ docker build -t qemutest -f Dockerfile ./go =


  5) Run test
  $ docker run -it qemutest

  /go # /usr/bin/qemu-ppc64le-static --version
  qemu-ppc64le version 2.11.93 (v2.12.0-rc3-dirty)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  /go # go version
  go version go1.10.1 linux/ppc64le

  /go # go build hello.go
  fatal error: fatal error: stopm holding locksunexpected signal during run=
time execution

  panic during panic
  [signal SIGSEGV: segmentation violation code=3D0x1 addr=3D0x0 pc=3D0x1003=
528c]

  runtime stack:
  runtime: unexpected return pc for syscall.Syscall6 called from 0xc42007f5=
00
  stack: frame=3D{sp:0xc4203be840, fp:0xc4203be860} stack=3D[0x4000b7ecf0,0=
x4000b928f0)

  syscall.Syscall6(0x100744e8, 0x3d, 0xc42050c140, 0x20, 0x18, 0x10422b80, =
0xc4203be968[signal , 0x10012d88SIGSEGV: segmentation violation, 0xc4205940=
00 code=3D, 0x00x1 addr=3D0x0 pc=3D0x1003528c)
  ]

  runtime stack:
  	/usr/local/go/src/syscall/asm_linux_ppc64x.s:61runtime.throw(0x10472d19,=
 0x13)
   +	/usr/local/go/src/runtime/panic.go:0x6c616 +0x68

  =

  runtime.stopm()
  	/usr/local/go/src/runtime/proc.go:1939goroutine  +10x158
   [runtime.exitsyscall0semacquire(0xc42007f500)
  	/usr/local/go/src/runtime/proc.go:3129 +]:
  0x130
  runtime.mcall(0xc42007f500)
  	/usr/local/go/src/runtime/asm_ppc64x.s:183 +0x58sync.runtime_Semacquire
  (0xc4201fab1c)
  	/usr/local/go/src/runtime/sema.go:56 +0x38

  ----
  Note the results may differ between attempts,  hangs and other faults som=
etimes happen.
  ----
  If I run "go: single threaded I don't see the problem, for example:

  /go # GOMAXPROCS=3D1 go build -p 1 hello.go =

  /go # ./hello
  hello world

  I see the same issue with arm64.  I don't think this is a go issue,
  but don't have a real evidence to prove that.  This problem looks
  similar to other problem I have seen reported against qemu running
  multi-threaded applications.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1763536/+subscriptions

