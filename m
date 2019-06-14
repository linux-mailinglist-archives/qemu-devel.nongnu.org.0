Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E64946704
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 20:05:12 +0200 (CEST)
Received: from localhost ([::1]:53950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbqZb-0005DQ-Ay
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 14:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59214)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hbpsW-0007ct-GQ
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:20:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hbpsU-00037r-FX
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:20:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:35138)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hbpsS-00035L-F6
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:20:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hbpsR-0007yj-0h
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 17:20:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DC7702E802E
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 17:20:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Jun 2019 17:13:52 -0000
From: Michal Suchanek <hramrach@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hramrach
X-Launchpad-Bug-Reporter: Michal Suchanek (hramrach)
X-Launchpad-Bug-Modifier: Michal Suchanek (hramrach)
References: <156053202418.26991.16452462538743379773.malonedeb@chaenomeles.canonical.com>
Message-Id: <156053243294.27569.11537239172495364383.malone@chaenomeles.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18981";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: ed75bb7c6746a1f78c1f58b47c0cac4f4fd38d54
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1832877] Re: qemu-bridge-helper undocumented and
 broken
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

Also this is what bridge.conf contains:

# Access control file for qemu bridge helper
# Syntax consists of:
#   # comment (ignored)
#   allow all
#   allow <bridge_name>
#   deny all
#   deny <bridge_name>
#   include /path/to/additional/ACL/file
# Users are blacklisted by default and 'deny' takes precedence over 'allow'.
# Including additional ACL files allows file access permissions to be used =
as
# a component of the policy to allow access or deny access to specific brid=
ges.

How are users specified? Or is the mention of users bogus?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1832877

Title:
  qemu-bridge-helper undocumented and broken

Status in QEMU:
  New

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

