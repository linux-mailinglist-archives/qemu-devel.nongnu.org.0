Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDE2367A85
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:04:43 +0200 (CEST)
Received: from localhost ([::1]:60146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTOF-0001Ke-0t
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTKe-0005aP-Hd
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:01:00 -0400
Received: from indium.canonical.com ([91.189.90.7]:33644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTKc-00038u-Re
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:01:00 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZTKb-0002dd-EV
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:00:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 67E4F2E806F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:00:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 06:53:49 -0000
From: Thomas Huth <1833871@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: darkdragon-001
X-Launchpad-Bug-Reporter: Dark Dragon (darkdragon-001)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156131891438.18960.11146618661074230951.malonedeb@chaenomeles.canonical.com>
Message-Id: <161907443072.9771.1055874040014496175.launchpad@wampee.canonical.com>
Subject: [Bug 1833871] Re: qemu-img convert file.vmdk: Invalid footer
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: a3cb9fdf6dc8c1892cffa9f5c15d46a64c1e8f01
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
Reply-To: Bug 1833871 <1833871@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1833871

Title:
  qemu-img convert file.vmdk: Invalid footer

Status in QEMU:
  Invalid

Bug description:
  Steps to reproduce
  - Open ESXi 6.5 Web UI
  - Export OVF
  - qemu-img convert disk.vmdk disk.qcow2

  Error:

      qemu-img: Could not open './disk-1.vmdk': Invalid footer

  I found another person having this problem here:
  https://forum.proxmox.com/threads/error-converting-vmdk-file-to-qcow2-fil=
e.38264/
  As I guess from the answer, the guy went over to manually copy the flat f=
ile from the datastore instead of using the ovf-exported file.

  Nevertheless, I think this bug should be investigated further and
  closed. Probably it is just some metadata issue and should not be too
  hard to fix once the root of the problem is found.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1833871/+subscriptions

