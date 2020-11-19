Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB832B9883
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:49:48 +0100 (CET)
Received: from localhost ([::1]:54392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfn7z-0003ng-DX
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfn4F-0000Eb-7Z
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:45:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:36486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfn4A-0000Dk-Nz
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:45:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfn48-0007qM-O8
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:45:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B5D562E8041
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:45:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2020 16:32:54 -0000
From: Thomas Huth <1524637@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: qhjin-dev th-huth
X-Launchpad-Bug-Reporter: Qinghua Jin (qhjin-dev)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20151210072444.12285.63754.malonedeb@chaenomeles.canonical.com>
Message-Id: <160580357415.24625.4545626318093867942.malone@wampee.canonical.com>
Subject: [Bug 1524637] Re: system_powerdown/system_reset not working when exec
 stop on hmp
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: ea830e1360930ace8881d1c1709406f46e3dc8ba
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
Reply-To: Bug 1524637 <1524637@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking through old bug tickets ... I don't think this was really a bug.
If you stop your guest, of course the guest operating system can not
powerdown anymore. It should powerdown once you resume your guest with
"cont".

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1524637

Title:
  system_powerdown/system_reset not working when exec stop on hmp

Status in QEMU:
  Invalid

Bug description:
  system_powerdown/system_reset stops working in qemu for centos kernels
  if KVM is enabled.

  qemu versioin: 2.4
  linux kernel versioin: 4.2.5

  How to reproduce:

  1. qemu-system-x86_64 -enable-kvm -drive if=3Dnone,id=3Ddrive0,file=3D/me=
dia/sda5/image/fc21/fc21.raw -device virtio-blk-pci,drive=3Ddrive0,iothread=
=3Diothread0 -machine smm=3Doff -object iothread,id=3Diothread0 -monitor st=
dio
  2. Enter stop in the qemu console, we can see the vm is stopped.
  3. Enter system_powerdown in the qemu console
  4. Nothing happens.

  Can you please give a prompt or something else when the vm isn't
  allowed to powerdown or reset?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1524637/+subscriptions

