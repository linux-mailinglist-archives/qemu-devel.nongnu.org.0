Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB982B0D0A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:54:12 +0100 (CET)
Received: from localhost ([::1]:58248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHjX-0004u7-FW
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdHgC-0001rB-L2
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:50:44 -0500
Received: from indium.canonical.com ([91.189.90.7]:58308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdHgA-0002fJ-LA
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:50:44 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdHg7-0002rz-GI
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 18:50:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 794442E811E
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 18:50:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 18:41:18 -0000
From: Thomas Huth <1793016@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: saint42 th-huth xanclic
X-Launchpad-Bug-Reporter: simon (saint42)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153721551557.8547.1211533042548718556.malonedeb@chaenomeles.canonical.com>
Message-Id: <160520647881.4455.5596569562364935062.malone@soybean.canonical.com>
Subject: [Bug 1793016] Re: vmdk to cqow2 invalid VMDK image descriptor
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: 7735309824024f0670a05f4cc1fb3b132f308004
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:20:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1793016 <1793016@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm closing this ticket since it was likely just a wrong file extension
... if you disagree, feel free to open the ticket again.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1793016

Title:
  vmdk to cqow2 invalid VMDK image descriptor

Status in QEMU:
  Invalid

Bug description:
  Greetings,

  CentOS 7.5.1804
  Linux 3.10.0-862.11.6.el7.x86_64 =

  qemu-img version 3.0.50 (v3.0.0-614-g19b599f)

  When trying to convert a vmdk flat file to qcow2 format, I get the follow=
ing error message:
  qemu-img: Could not open './sk-R12-flat.vmdk': invalid VMDK image descrip=
tor

  The command line used is
  root@s11kvm:/home/goinfre> qemu-img convert -f vmdk -O qcow2 ./sk-R12-fla=
t.vmdk ./sk-R12-flat.qcow2

  =

  "file sk-R12-flat.vmdk" returns:
  sk-R12-flat.vmdk: x86 boot sector;
  GRand Unified Bootloader, stage1 version 0x3, boot drive 0x80, 1st sector=
 stage2 0x40, GRUB version 0.97;
  partition 1: ID=3D0x63, active, starthead 1, startsector 63, 16002 sector=
s; =

  partition 2: ID=3D0x83, starthead 0, startsector 16065, 3084480 sectors; =

  partition 3: ID=3D0x83, starthead 0, startsector 3100545, 3084480 sectors=
; =

  partition 4: ID=3D0x5, starthead 0, startsector 6185025, 161581770 sector=
s, code offset 0x48

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1793016/+subscriptions

