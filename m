Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531C24009C1
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 06:27:35 +0200 (CEST)
Received: from localhost ([::1]:34312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMNHB-0005T5-Sf
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 00:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mMNFj-00046a-St
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 00:26:03 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:37570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mMNFg-00084B-KA
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 00:26:03 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 4CFC540519
 for <qemu-devel@nongnu.org>; Sat,  4 Sep 2021 04:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1630729548;
 bh=tm7XuJrNziC5/0PTzyoyXIkxnGwSpX7u084FsZW3JhU=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=NRszFQCunsQQerTkzx8GqCg4NsOxkLvSuG9VNnQQXiddc5mEz2IGK/1esHilffs45
 OPkfNoZR6QZge9bpbAxvyz2h+bOi99vc0jqLKfBT+4+9VU4ajr6jgWYKlu8eVfYMLQ
 WIba2Kcv3I6xNKw8qupHGE1ZlDBwPS8tct8GqK7ebAUNb5WPp2U4IbClI8lwEufv+2
 EA1p8eXN2Dj8zVaTJMbAKB9bmEugqwYJkASNw1W3PGOGw+cunXuXnUXMP2cwbK6BX4
 bpysBfWLFuDkRxdmkwAGqA0HSVE8LK8f/tTzNH+u+Fd8KlhrQ2nxU97rNTu/KCb24N
 81LxbOTHTSE1Q==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F36BF2E81DF
 for <qemu-devel@nongnu.org>; Sat,  4 Sep 2021 04:25:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Sep 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1770417@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Expired; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor paelzer th-huth vdrok
X-Launchpad-Bug-Reporter: Vladyslav Drok (vdrok)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152596210054.26788.14569755785770428905.malonedeb@chaenomeles.canonical.com>
Message-Id: <163072903798.31763.16827496024186824490.malone@loganberry.canonical.com>
Subject: [Bug 1770417] Re: Qemu can not parse long fqdns during drive-mirror
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e03bf5183af335943ccf1ef70ad0534f46a635c6"; Instance="production"
X-Launchpad-Hash: 4918117c345c0e16a9901d7800b7b95d5639d860
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1770417

Title:
  Qemu can not parse long fqdns during drive-mirror

Status in QEMU:
  Expired
Status in qemu package in Ubuntu:
  Expired

Bug description:
  During migration of an openstack booted instance, I got the following
  error:

  Apr 12 10:55:22 cmp1 libvirtd[4133]: 2018-04-12 10:55:22.133+0000:
  4139: error : qemuMonitorJSONCheckError:392 : internal error: unable
  to execute QEMU command 'drive-mirror': error parsing address
  'cmp0.sandriichenko-deploy-heat-virtual-mcp-pike-ovs-76.bud-
  mk.local:49153'

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
  blk,drive=3Dnode-TargetDisk,id=3Dvirtio0 -S -monitor stdio -qmp
  unix:./qmp-sock,server,nowait -incoming tcp:localhost:6666

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


