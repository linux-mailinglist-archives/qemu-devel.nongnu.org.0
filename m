Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF0242B3C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 17:48:17 +0200 (CEST)
Received: from localhost ([::1]:33276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb5U0-0003ft-Sk
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 11:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42227)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hb5Rb-0002oI-Sv
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 11:45:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hb5Ra-0001MQ-3K
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 11:45:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:49786)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hb5RZ-0001J5-QQ
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 11:45:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hb5RW-0002n9-LP
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 15:45:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2A83A2E80CC
 for <qemu-devel@nongnu.org>; Wed, 12 Jun 2019 15:45:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Jun 2019 15:35:19 -0000
From: DDoSolitary <DDoSolitary@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: ppc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ddosolitary pmaydell
X-Launchpad-Bug-Reporter: DDoSolitary (ddosolitary)
X-Launchpad-Bug-Modifier: DDoSolitary (ddosolitary)
References: <155137392124.31316.11495671074765014993.malonedeb@wampee.canonical.com>
Message-Id: <156035371999.16454.7681216624954837947.malone@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18978";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 5a678f8d1d8815a6351b310d286246811aa6dc0f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1818122] Re: QEMU 3.1 makes libxslt to crash on
 ppc64
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
Reply-To: Bug 1818122 <1818122@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

@pmaydell
I'm willing to test. However, I encountered another bug introduced in 4.0 w=
hich even prevents me from installing xmlto. I'll preparing a bug report an=
d will post it soon.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1818122

Title:
  QEMU 3.1 makes libxslt to crash on ppc64

Status in QEMU:
  New

Bug description:
  Host: clean Ubuntu Disco with QEMU 3.1

  Guest: Alpine Linux edge with xmlto

  Steps to set up guest:
  curl -O http://dl-cdn.alpinelinux.org/alpine/edge/releases/ppc64le/netboo=
t/vmlinuz-vanilla
  curl -O http://dl-cdn.alpinelinux.org/alpine/edge/releases/ppc64le/netboo=
t/initramfs-vanilla
  qemu-system-ppc64 -m 1G -kernel vmlinuz-vanilla -initrd initramfs-vanilla=
 -append "console=3Dhvc0 ip=3Ddhcp alpine_repo=3Dhttp://dl-cdn.alpinelinux.=
org/alpine/edge/main/ modloop=3Dhttp://dl-cdn.alpinelinux.org/alpine/edge/r=
eleases/ppc64le/netboot/modloop-vanilla" -device virtio-rng-pci -nographic
  This brings up an VM with an in-memory Alpine Linux.

  Steps to reproduce:
  Login as root and execute the following commands.
  apk add xmlto
  ntpd -nqp time.google.com // For TLS OCSP
  wget https://ddosolitary.org/manpage-base.xsl
  wget https://ddosolitary.org/shadowsocks-libev.xml
  xmlto -m manpage-base.xsl man shadowsocks-libev.xml
  The downloaded files are from this project: https://github.com/shadowsock=
s/shadowsocks-libev The former is directly taken from the "doc" directory a=
nd the latter is an intermediate build output generated by asciidoc from do=
c/shadowsocks-libev.asciidoc

  Expected behavior: The command silently succeeds producing
  shadowsocks-libev.8

  Actual behavior: =

  runtime error: file file:///usr/share/xml/docbook/xsl-stylesheets-1.79.1/=
manpages/tbl.xsl line 450 element text
  xsltApplySequenceConstructor: A potential infinite template recursion was=
 detected.
  You can adjust xsltMaxDepth (--maxdepth) in order to raise the maximum nu=
mber of nested template calls and variables/params (currently set to 3000).
  Templates:
  #0 name process.colspan
  #1 name process.colspan
  #2 name process.colspan
  #3 name process.colspan
  #4 name process.colspan
  #5 name process.colspan
  #6 name process.colspan
  #7 name process.colspan
  #8 name process.colspan
  #9 name process.colspan
  #10 name process.colspan
  #11 name process.colspan
  #12 name process.colspan
  #13 name process.colspan
  #14 name process.colspan
  Variables:
  #0
  type
  colspan
  #1
  colspan
  #2
  type
  colspan
  #3
  colspan
  #4
  type
  colspan
  #5
  colspan
  #6
  type
  colspan
  #7
  colspan
  #8
  type
  colspan
  #9
  colspan
  #10
  type
  colspan
  #11
  colspan
  #12
  type
  colspan
  #13
  colspan
  #14
  type
  colspan
  error: file /root/shadowsocks-libev.xml
  xsltRunStylesheet : run failed

  Note:
  I tried increasing --maxdepth as suggested in the error output but that w=
ill result in a segfault.
  This error doesn't occur with an older QEMU (I tested QEMU 2.12 on Ubuntu=
 Cosmic) or different architectures on QEMU 3.1 (I tested x86, x86_64, arm,=
 aarch64, s390x). Also it didn't help to use an older Alpine Linux (I teste=
d v3.8). So I think it is caused by a bug in QEMU rather than the distro/pa=
ckage.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1818122/+subscriptions

