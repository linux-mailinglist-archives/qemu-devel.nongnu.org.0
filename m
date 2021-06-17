Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC40B3AAE75
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 10:08:16 +0200 (CEST)
Received: from localhost ([::1]:33364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltn4R-00043m-NG
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 04:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ltn36-0002in-GY
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 04:06:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:51308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ltn34-0000JX-Q3
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 04:06:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1ltn30-0000AD-QT
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:06:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4FFC72E81AE
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:06:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Jun 2021 07:50:37 -0000
From: Thomas Huth <206818@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemulator;
 component=universe; status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: apport-crash
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: peter-44
X-Launchpad-Bug-Reporter: =?utf-8?q?Peter_H=C3=BCrlimann_=28peter-44=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
X-Launchpad-Bug-Duplicate: 132720
References: <20080325213823.17146.76975.malonedeb@gandwana.canonical.com>
Message-Id: <162391623798.17058.5601471997211864753.launchpad@gac.canonical.com>
Subject: [Bug 206818] Re: qemulator.py crashed with IndexError in
 on_comboboxMachinetype_changed()
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 4c44e36f662cc2dea918ac25aa4c863cb17a01fc
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
Reply-To: Bug 206818 <206818@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 132720 ***
    https://bugs.launchpad.net/bugs/132720

** No longer affects: qemu

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/206818

Title:
  qemulator.py crashed with IndexError in
  on_comboboxMachinetype_changed()

Status in qemulator package in Ubuntu:
  New

Bug description:
  Binary package hint: qemulator

  Hy

  I simply opened qemulator and than qemulator crashed said the bug report =
utility
  but qemulator was open and work .

  i dont know were the error is but i will report it anyway .

  sorry for my inexperience

  I use:
  	Ubuntu hardy (development branch)
  Release:	8.04

  qemulator version 0.5-3

  regards peter

  ProblemType: Crash
  Architecture: i386
  Date: Tue Mar 25 22:27:24 2008
  DistroRelease: Ubuntu 8.04
  ExecutablePath: /usr/share/qemulator/qemulator.py
  InterpreterPath: /usr/bin/python2.5
  NonfreeKernelModules: nvidia
  Package: qemulator 0.5-3
  PackageArchitecture: all
  ProcCmdline: python /usr/bin/qemulator
  ProcEnviron:
   PATH=3D/home/username/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/=
bin:/sbin:/bin:/usr/games
   LANG=3Den_US.UTF-8
   SHELL=3D/bin/bash
  PythonArgs: ['/usr/bin/qemulator']
  SourcePackage: qemulator
  Title: qemulator.py crashed with IndexError in on_comboboxMachinetype_cha=
nged()
  Traceback:
   Traceback (most recent call last):
     File "/usr/share/qemulator/qml_machinesetup.py", line 661, in on_combo=
boxMachinetype_changed
       row =3D model[active]
   IndexError: could not find tree path
  Uname: Linux 2.6.24-12-386 i686
  UserGroups: adm admin audio cdrom dialout dip fax floppy lpadmin netdev p=
lugdev powerdev sambashare scanner tape video

To manage notifications about this bug go to:
https://bugs.launchpad.net/ubuntu/+source/qemulator/+bug/206818/+subscripti=
ons

