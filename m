Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEAB34C954
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 10:32:40 +0200 (CEST)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQnKB-0001ps-2o
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 04:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lQnIZ-000171-3F
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 04:30:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:34056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lQnIW-0007uo-NG
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 04:30:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lQnIU-0004yz-HI
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 08:30:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7CCF72E8166
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 08:30:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Mar 2021 08:21:45 -0000
From: Madgemade <1639394@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jnsnow madgemade-v xtrondo
X-Launchpad-Bug-Reporter: xtrondo (xtrondo)
X-Launchpad-Bug-Modifier: Madgemade (madgemade-v)
References: <20161105021624.30133.98019.malonedeb@wampee.canonical.com>
Message-Id: <161700610570.662.11916411854466896796.malone@soybean.canonical.com>
Subject: [Bug 1639394] Re: Unable to boot Solaris 8/9 x86 under Fedora 24
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="21fefc602783aa4ba863a4a6c29d38d788ce04ad"; Instance="production"
X-Launchpad-Hash: bf47d9fe25e677f789d85d2ac9d1e831a02ca78e
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
Reply-To: Bug 1639394 <1639394@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I also have this problem. On both QEMU 5.2.0 and QEMU 3.1. The situation is=
 still the same as the original report.
For Solaris 8 the following configuration causes an error when the installe=
r attempts to boot:
-m 256M -display gtk -monitor stdio -hda Sol8.qcow2 -cdrom sol8_x86_install=
.ISO -boot d -machine pc
The error is given as "prom_panic: Could not mount filesystem", the same as=
 reported originally. It does this even when "hda" is not specified.
I can get into the installer by using SCSI devices instead (as alluded to o=
riginally) but the SCSI devices are not detected correctly by the installer=
 and it cannot find the boot media.
A slightly different problem occurs with Solaris 7. This configuration (onl=
y CDROM) allows the installer to run and it detects the CDROM media correct=
ly: -m 256M -display gtk -monitor stdio -boot a -fda sol-7_boot.img -cdrom =
sol-7.iso
But when a "hda" hard disk device is introduced the installer does not load=
, instead hanging on the first stage (where Solaris 8 installer gives the e=
rror).
To ensure the ISO was not corrupted or similar I used VirtualBox which work=
s as expected.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1639394

Title:
  Unable to boot Solaris 8/9 x86 under Fedora 24

Status in QEMU:
  Expired

Bug description:
  qemu-system-x86_64 -version
  QEMU emulator version 2.6.2 (qemu-2.6.2-4.fc24), Copyright (c) 2003-2008 =
Fabrice Bellard

  Try several ways without success, I think it was a regression because pro=
blem seems to be related with ide fixed on 0.6.0:
  - int13 CDROM BIOS fix (aka Solaris x86 install CD fix)
  - int15, ah=3D86 BIOS fix (aka Solaris x86 hardware probe hang up fix)

  Solaris 10/11 works without a problem, also booting with "scsi" will
  circumvent initial problem, but later found problems related with
  "scsi" cdrom boot and also will not found the "ide" disk device.

  =

  qemu-system-i386 -m 712 -drive file=3D/dev/Virtual_hdd/beryllium0,format=
=3Draw -cdrom /repo/Isos/sol-9_905_x86.iso

  SunOS Secondary Boot version 3.00

  prom_panic: Could not mount filesystem.
  Entering boot debugger:
  [136419]

  =

  Regards,
  \\CA,

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1639394/+subscriptions

