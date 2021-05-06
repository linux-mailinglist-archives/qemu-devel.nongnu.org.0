Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938AF374F51
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 08:24:57 +0200 (CEST)
Received: from localhost ([::1]:33442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leXRO-0004Dc-Si
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 02:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leXNZ-0001c7-Jw
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:20:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:45884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leXNX-00074K-Ed
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:20:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leXNV-0000L1-J0
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:20:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7A88A2E8192
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 06:20:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 06:14:01 -0000
From: Thomas Huth <1865248@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adrelanos th-huth
X-Launchpad-Bug-Reporter: Patrick Schleizer (adrelanos)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158295716251.12323.9371566486970829687.malonedeb@soybean.canonical.com>
Message-Id: <162028164185.14342.4082457235438579809.malone@soybean.canonical.com>
Subject: [Bug 1865248] Re: bundle QEMU installer with a QEMU GUI (graphical
 user interface) such as Virt Manager
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 9b58c7c8ea531f55ba23211e9bae99ae2e5d6248
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
Reply-To: Bug 1865248 <1865248@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, but I don't think that any of the current QEMU project members
has plans to work on such a bundle. This requires a new contributor to
step up and do the job.

** Changed in: qemu
       Status: New =3D> Won't Fix

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1865248

Title:
  bundle QEMU installer with a QEMU GUI (graphical user interface) such
  as Virt Manager

Status in QEMU:
  Won't Fix

Bug description:
  For a better out of the box user experience on the Windows platform it
  would be nice if a QEMU GUI would be by installed by the same QEMU
  installer. Currently it is required to first install QEMU and then
  install a QEMU GUI.

  I don't know all QEMU GUIs but looks like Virt Manager is a decent
  QEMU GUI and still maintained.

  Virt Manager is also available for Windows.

  https://serverfault.com/questions/340949/is-there-a-way-to-run-virt-
  manager-on-windows

  However as per these instructions it is difficult (many steps) for
  laymen to install Virt Manager on Windows (cygwin...).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1865248/+subscriptions

