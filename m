Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740256BC3F5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 03:46:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcdcR-0007Lv-2e; Wed, 15 Mar 2023 22:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1pcdcM-0007Kt-DK
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 22:45:26 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1pcdcJ-0006x7-ET
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 22:45:25 -0400
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 35FEC4291A
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 02:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1678934715;
 bh=vnquEwRp1uC6PAADzt32Qf9dXHE4mkpHz8QqD2xeQ6A=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=kBfQhSQG+mVgVvIaXOKlyHvzTsy1+ybeDP2WescGLxe0bEN9lvQteBNIbSqpSPDwy
 L1yw6Fxi8RRl1krr6xEA1HXdnEFrYgCySol8u5ba/hqj0nl/UPOxgD82mLgfa0e2LK
 OCTce4qYou6GiyFmkBgxcetRN2chhDQDXMDtLlGh/HQ2r+klbo6/KIdjezuuu7xIpc
 1IXtkvXbtTlmOJdNWoOo+r6efamuvUkDa3WvvGdf1khL33wOZXMR28Zjqs7gt25MSK
 yws+k7jqpTkNJ6YM8MwgnbCNPfd0v9f9WZ01TRxqAQhlSntQbR+zoVDetPDGsnFu96
 E/IejPVfAaFHQ==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 53A533F3E3
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 02:45:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Mar 2023 02:39:52 -0000
From: Anthony Kamau <1703506@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ak-launchpad amnevar babumoger ehabkost imatimba
 janitor ptx0 rs-databay ryzen27 scix th-huth
X-Launchpad-Bug-Reporter: A S (scix)
X-Launchpad-Bug-Modifier: Anthony Kamau (ak-launchpad)
References: <149974876377.6612.10329067332937096720.malonedeb@gac.canonical.com>
Message-Id: <167893439292.1731.13527125818751083837.malone@daniels.canonical.com>
Subject: [Bug 1703506] Re: SMT not supported by QEMU on AMD Ryzen CPU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="997ba17554f0ee82f56d9282fce82d3e09a43780"; Instance="production"
X-Launchpad-Hash: 3dfb7dfbb3b2cd285a3b54873f207a80ab816686
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1703506 <1703506@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I was able to avoid rebooting after following @Andrii's instructions -
https://bugs.launchpad.net/qemu/+bug/1703506/comments/19 - above:

systemctl stop libvirtd libvirtd-admin.socket libvirtd-ro.socket libvirtd.s=
ocket
sudo modprobe -r kvm_intel kvm
systemctl start libvirtd libvirtd-admin.socket libvirtd-ro.socket libvirtd.=
socket

These instructions to avoid rebooting might not work for those using a
non-Intel CPU as you'll have a different kernel module.  You can check
by running `lsmod | grep kvm`.

Cheers,
ak.

System info:
# inxi -CMz
Machine:
  Type: Laptop System: Dell product: Precision M6700 v: 01 serial: <filter>
  Mobo: Dell model: 0JWMFY v: A00 serial: <filter> UEFI: Dell v: A20 date: =
11/30/2018
CPU:
  Info: quad core model: Intel Core i7-3840QM bits: 64 type: MT MCP cache: =
L2: 1024 KiB
  Speed (MHz): avg: 3607 min/max: 1200/3800 cores: 1: 3588 2: 3615 3: 3638 =
4: 3588 5: 3588
    6: 3638 7: 3617 8: 3588

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1703506

Title:
  SMT not supported by QEMU on AMD Ryzen CPU

Status in QEMU:
  Expired

Bug description:
  HyperThreading/SMT is supported by AMD Ryzen CPUs but results in this
  message when setting the topology to threads=3D2:

  qemu-system-x86_64: AMD CPU doesn't support hyperthreading. Please
  configure -smp options properly.

  Checking in a Windows 10 guest reveals that SMT is not enabled, and
  from what I understand, QEMU converts the topology from threads to
  cores internally on AMD CPUs. This appears to cause performance
  problems in the guest perhaps because programs are assuming that these
  threads are actual cores.

  Software: Linux 4.12, qemu 2.9.0 host with KVM enabled, Windows 10 pro
  guest

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1703506/+subscriptions


