Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FA83BC5A0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:39:20 +0200 (CEST)
Received: from localhost ([::1]:56988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0crf-0008AV-Sc
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfj-0000dX-TT
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:52884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfi-0003Tx-2u
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfT-0004xG-14
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 70BD42E8443
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:24 -0000
From: Launchpad Bug Tracker <1868055@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eastson83 janitor laurent-vivier pmaydell th-huth
X-Launchpad-Bug-Reporter: Dongwhan Kim (eastson83)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158460432256.11238.315491712700748145.malonedeb@soybean.canonical.com>
Message-Id: <162554504468.7821.6414129670403108523.malone@loganberry.canonical.com>
Subject: [Bug 1868055] Re: cannot run golang app with docker,
 version 17.09.1-ce, disabling core 0 and qemu-arm, version 2.7.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: b395591a19d733896269208b5bfcd6d7a11b4217
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
Reply-To: Bug 1868055 <1868055@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1868055

Title:
  cannot run golang app with docker, version 17.09.1-ce, disabling core
  0 and qemu-arm, version 2.7.

Status in QEMU:
  Expired

Bug description:
  Hello!
  I figure out that sometimes simple go application is not working.
  I am using docker + qemu-arm + go( for armv7l).

  These are version info below.

  root@VDBS1535:~# docker -v
  Docker version 17.09.1-ce, build 19e2cf6

  bash-3.2# qemu-arm --version
  qemu-arm version 2.7.0, Copyright (c) 2003-2016 Fabrice Bellard and the Q=
EMU Project developers

  $ go version
  go version go1.12.6 linux/arm
  $ go env
  GOARCH=3D"arm"
  GOBIN=3D""
  GOCACHE=3D"/home/quickbuild/.cache/go-build"
  GOEXE=3D""
  GOFLAGS=3D""
  GOHOSTARCH=3D"arm"
  GOHOSTOS=3D"linux"
  GOOS=3D"linux"
  GOPATH=3D"/home/quickbuild/go"
  GOPROXY=3D""
  GORACE=3D""
  GOROOT=3D"/usr/lib/golang"
  GOTMPDIR=3D""
  GOTOOLDIR=3D"/usr/lib/golang/pkg/tool/linux_arm"
  GCCGO=3D"gccgo"
  GOARM=3D"7"
  CC=3D"gcc"
  CXX=3D"g++"
  CGO_ENABLED=3D"1"
  GOMOD=3D""
  CGO_CFLAGS=3D"-g -O2"
  CGO_CPPFLAGS=3D""
  CGO_CXXFLAGS=3D"-g -O2"
  CGO_FFLAGS=3D"-g -O2"
  CGO_LDFLAGS=3D"-g -O2"
  PKG_CONFIG=3D"pkg-config"
  GOGCCFLAGS=3D"-fPIC -marm -pthread -fmessage-length=3D0 -fdebug-prefix-ma=
p=3D/tmp/go-build242285369=3D/tmp/go-build -gno-record-gcc-switches"

  This issue is come only when I disable core 0 using a command below.
  please check "--cpuset-cpus=3D1-55" option.

  sudo docker run --privileged -d -i -t --cpuset-cpus=3D1-55 --mount
  type=3Dbind,source=3D"/home/dw83kim/mnt",destination=3D"/mnt" --network h=
ost
  --name=3D"ubuntu_core1" ubuntu:xenial-20200212

  =

  This is what I have tested in the environment above.

  package main
  func main(){
      for i:=3D0; i<1000; i++ {
          println("Hello world")
      }
  }

  This is one of the error logs have faced sometimes not always.

  bash-3.2# go run test.go
  fatal error: schedule: holding locks
  panic during panic
  SIGILL: illegal instruction
  PC=3D0xc9ec4c m=3D3 sigcode=3D2

  goroutine 122 [runnable]:
  qemu: uncaught target signal 11 (Segmentation fault) - core dumped
  Segmentation fault (core dumped)
  bash-3.2#

  Please check it.
  Thanks in advance.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1868055/+subscriptions

