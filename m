Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12448438E66
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 06:32:34 +0200 (CEST)
Received: from localhost ([::1]:45452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1merey-00021X-51
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 00:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1merYh-0000Nu-8E
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:26:03 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:40712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1merYd-0008RV-UQ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:26:02 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id B204F40037
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 04:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1635135953;
 bh=HyiKjyKv93gMQRPWdJgC+RwAVNIo1CaSl/CL5DWDQc8=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=IY5QwlxdF0qVK8AJ12nhHgMgWKvmOfuJqKpqN0ae7mJdoBlmYHdOPyWnWBG1mzWFG
 1o3H3fxywfGwQB8DqtCjWPfEGhvPijdfMdr45rxma9KJ88x5vmbj4CWzWlNimA1YUZ
 zyzCu8TigtRwzUOeVuTfGSCCrgzPy5mPQFfrw1pG3QeOVGgPYzRp0ErB6Mxd3PIkUk
 DvNbEAulL5mcipCQUJw1JrdhmFOfY1QP4+OFYoV2Toa9Kup9YzQQiGBKwuIPmYR56L
 CRljWZpox1yET+WF8xJz44bu5ashhLuoZPMiw+ZxREo+/9GLVaqLxUIZLAVorUFJ+V
 vk5ihopzvu3Pw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F2F912E81F1
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 04:25:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 Oct 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1761798@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=nova; status=Expired; importance=Medium; assignee=None;
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: libvirt live-migration
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: balazs-gibizer cassano dgilbert-h dsutyagin
 janitor kashyapc melwitt mriedem sean-k-mooney th-huth
X-Launchpad-Bug-Reporter: Matt Riedemann (mriedem)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152303245198.3233.1033096993665779324.malonedeb@wampee.canonical.com>
Message-Id: <163513543728.17525.16019214694643371337.malone@loganberry.canonical.com>
Subject: [Bug 1761798] Re: live migration intermittently fails in CI with "VQ
 0 size 0x80 Guest index 0x12c inconsistent with Host index 0x134: delta
 0xfff8"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="077cd577c00fa794e72ab856f950ae412860db5f"; Instance="production"
X-Launchpad-Hash: bd4727026864aae03b1166274b56fc4d0ab117ac
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1761798 <1761798@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for OpenStack Compute (nova) because there has been no activity
for 60 days.]

** Changed in: nova
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1761798

Title:
  live migration intermittently fails in CI with "VQ 0 size 0x80 Guest
  index 0x12c inconsistent with Host index 0x134: delta 0xfff8"

Status in OpenStack Compute (nova):
  Expired
Status in QEMU:
  Expired

Bug description:
  Seen here:

  http://logs.openstack.org/37/522537/20/check/legacy-tempest-dsvm-
  multinode-live-
  migration/8de6e74/logs/subnode-2/libvirt/qemu/instance-00000002.txt.gz

  2018-04-05T21:48:38.205752Z qemu-system-x86_64: -chardev pty,id=3Dcharser=
ial0,logfile=3D/dev/fdset/1,logappend=3Don: char device redirected to /dev/=
pts/0 (label charserial0)
  warning: TCG doesn't support requested feature: CPUID.01H:ECX.vmx [bit 5]
  2018-04-05T21:48:43.153268Z qemu-system-x86_64: VQ 0 size 0x80 Guest inde=
x 0x12c inconsistent with Host index 0x134: delta 0xfff8
  2018-04-05T21:48:43.153288Z qemu-system-x86_64: Failed to load virtio-blk=
:virtio
  2018-04-05T21:48:43.153292Z qemu-system-x86_64: error while loading state=
 for instance 0x0 of device '0000:00:04.0/virtio-blk'
  2018-04-05T21:48:43.153347Z qemu-system-x86_64: load of migration failed:=
 Operation not permitted
  2018-04-05 21:48:43.198+0000: shutting down, reason=3Dcrashed

  And in the n-cpu logs on the other host:

  http://logs.openstack.org/37/522537/20/check/legacy-tempest-dsvm-
  multinode-live-migration/8de6e74/logs/screen-n-
  cpu.txt.gz#_Apr_05_21_48_43_257541

  There is a related Red Hat bug:

  https://bugzilla.redhat.com/show_bug.cgi?id=3D1450524

  The CI job failures are at present using the Pike UCA:

  ii  libvirt-bin                         3.6.0-1ubuntu6.2~cloud0

  ii  qemu-system-x86                     1:2.10+dfsg-0ubuntu3.5~cloud0

To manage notifications about this bug go to:
https://bugs.launchpad.net/nova/+bug/1761798/+subscriptions


