Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE93BB735
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 08:32:28 +0200 (CEST)
Received: from localhost ([::1]:35480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0I9b-00047D-Gj
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 02:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0I89-0002kI-AH
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:30:57 -0400
Received: from indium.canonical.com ([91.189.90.7]:37984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0I86-0000Y0-PA
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 02:30:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0I81-0003ed-V8
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:30:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7F9E12E8197
 for <qemu-devel@nongnu.org>; Mon,  5 Jul 2021 06:30:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Jul 2021 06:20:29 -0000
From: Thomas Huth <1770417@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Incomplete; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paelzer th-huth vdrok
X-Launchpad-Bug-Reporter: Vladyslav Drok (vdrok)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152596210054.26788.14569755785770428905.malonedeb@chaenomeles.canonical.com>
Message-Id: <162546603099.32275.11768406542921532045.launchpad@soybean.canonical.com>
Subject: [Bug 1770417] Re: Qemu can not parse long fqdns during drive-mirror
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 122942e8994a023adce9c53f270ca588bd450e13
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1770417 <1770417@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu (Ubuntu)
       Status: Confirmed =3D> Incomplete

** Bug watch removed: Red Hat Bugzilla #1568939
   https://bugzilla.redhat.com/show_bug.cgi?id=3D1568939

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1770417

Title:
  Qemu can not parse long fqdns during drive-mirror

Status in QEMU:
  Incomplete
Status in qemu package in Ubuntu:
  Incomplete

Bug description:
  During migration of an openstack booted instance, I got the following
  error:

  Apr 12 10:55:22 cmp1 libvirtd[4133]: 2018-04-12 10:55:22.133+0000:
  4139: error : qemuMonitorJSONCheckError:392 : internal error: unable
  to execute QEMU command 'drive-mirror': error parsing address 'cmp0
  .sandriichenko-deploy-heat-virtual-mcp-pike-ovs-76.bud-mk.local:49153'

  A bit more info in libvirt bug
  https://bugzilla.redhat.com/show_bug.cgi?id=3D1568939

  To reproduce it with qemu only, I followed the guide at
  https://github.com/qemu/qemu/blob/master/docs/interop/live-block-
  operations.rst#id21. On dest and source compute nodes, I launched an
  instance:

  qemu-system-x86_64 -display none -nodefconfig -M q35 -nodefaults -m
  512 -blockdev node-name=3Dnode-
  TargetDisk,driver=3Dqcow2,file.driver=3Dfile,file.node-
  name=3Dfile,file.filename=3D./test-instance-mirror.qcow2 -device virtio-
  blk,drive=3Dnode-TargetDisk,id=3Dvirtio0 -S -monitor stdio -qmp unix
  :./qmp-sock,server,nowait -incoming tcp:localhost:6666

  Then on dest node I launched nbd server:

  (qemu) nbd_server_start cmp0:49153
  (qemu) nbd_server_add -w node-TargetDisk

  On the source node:

  (qemu) drive_mirror -n  node-TargetDisk nbd:cmp0.vdrok-deploy-heat-virtua=
l-mcp-pike-ovs-foobarbuzz.bud-mk.local:49153:exportname=3Dnode-TargetDisk
  error parsing address 'cmp0.vdrok-deploy-heat-virtual-mcp-pike-ovs-foobar=
buzz.bud-mk.local:49153'

  When using short host name instead of FQDN address seems to be parsed
  fine:

  (qemu) drive_mirror -n  node-TargetDisk nbd:cmp0:49153:exportname=3Dnode-=
TargetDisk qcow2
  Image is not in qcow2 format

  (not sure why it is not a qcow2 format, as I have qcow2 image with raw
  backing file, but this is unrelated)

  QEMU version is 2.11.1 from bionic

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1770417/+subscriptions

