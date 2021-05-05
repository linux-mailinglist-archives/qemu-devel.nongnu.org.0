Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676573739C2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:59:20 +0200 (CEST)
Received: from localhost ([::1]:54214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGBT-0000Kp-Fc
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leG8C-0003KZ-5r
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:55:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:57688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leG8A-0002Dc-0K
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:55:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leG87-0005Dz-Sq
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:55:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D27FA2E818F
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:55:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:46:17 -0000
From: Thomas Huth <1832877@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hramrach th-huth
X-Launchpad-Bug-Reporter: Michal Suchanek (hramrach)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156053202418.26991.16452462538743379773.malonedeb@chaenomeles.canonical.com>
Message-Id: <162021517763.32131.17235919821739898274.malone@chaenomeles.canonical.com>
Subject: [Bug 1832877] Re: qemu-bridge-helper undocumented and broken
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 44993582a219e7affb5cf92533c0c5854b9b4e16
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
Reply-To: Bug 1832877 <1832877@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/177


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #177
   https://gitlab.com/qemu-project/qemu/-/issues/177

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1832877

Title:
  qemu-bridge-helper undocumented and broken

Status in QEMU:
  Expired

Bug description:
  qemu output:

  access denied by acl file
  qemu-system-ppc64: bridge helper failed

  Option description:

        -netdev bridge,id=3Did[,br=3Dbridge][,helper=3Dhelper]
             Connect a host TAP network interface to a host bridge device.

             Use the network helper helper to configure the TAP interface a=
nd attach it to the bridge. The default network
             helper executable is /path/to/qemu-bridge-helper and the defau=
lt bridge device is br0.

             Examples:

                     #launch a QEMU instance with the default network helpe=
r to
                     #connect a TAP device to bridge br0
                     qemu-system-i386 linux.img -netdev bridge,id=3Dn1 -dev=
ice virtio-net,netdev=3Dn1


                     #launch a QEMU instance with the default network helpe=
r to
                     #connect a TAP device to bridge qemubr0
                     qemu-system-i386 linux.img -netdev bridge,br=3Dqemubr0=
,id=3Dn1 -device virtio-net,netdev=3Dn1

  =

  What is the acl file? What is the interface to qemu-bridge-helper?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1832877/+subscriptions

