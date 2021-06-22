Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1754D3AFC2B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 06:46:13 +0200 (CEST)
Received: from localhost ([::1]:51496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYIe-0004mC-2A
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 00:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4U-0003NL-7D
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:59094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4R-0000XZ-Fd
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:34 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvY4F-0003km-Gt
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7165C2E808D
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:33 -0000
From: Launchpad Bug Tracker <1538541@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange janitor kwolf-redhat th-huth xanclic
X-Launchpad-Bug-Reporter: Daniel Berrange (berrange)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160127125558.31349.12989.malonedeb@gac.canonical.com>
Message-Id: <162433545381.20423.2811035693286165952.malone@loganberry.canonical.com>
Subject: [Bug 1538541] Re: qcow2 rejects request to use preallocation with
 backing file
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 0886936ee6830067d24826cf434c84dd217d331b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1538541 <1538541@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1538541

Title:
  qcow2 rejects request to use preallocation with backing file

Status in QEMU:
  Expired

Bug description:
  The 'preallocation=3Dfull' option to qemu-img / qcow2 block driver
  instructs QEMU to fully allocate the host file to the maximum size
  needed by the logical disk size.

  $ qemu-img create -f qcow2 -o preallocation=3Dfull base.qcow2 200M
  Formatting 'base.qcow2', fmt=3Dqcow2 size=3D209715200 encryption=3Doff cl=
uster_size=3D65536 preallocation=3D'full' lazy_refcounts=3Doff refcount_bit=
s=3D16

  $ ls -alhs base.qcow2 =

  201M -rw-r--r--. 1 berrange berrange 201M Jan 27 12:49 base.qcow2

  =

  When specifying a backing file for the qcow2 file, however, it rejects th=
e preallocation request

  $ qemu-img create -f qcow2 -o preallocation=3Dfull,backing_file=3Dbase.qc=
ow2 front.qcow2 200M
  Formatting 'front.qcow2', fmt=3Dqcow2 size=3D209715200 backing_file=3D'ba=
se.qcow2' encryption=3Doff cluster_size=3D65536 preallocation=3D'full' lazy=
_refcounts=3Doff refcount_bits=3D16
  qemu-img: front.qcow2: Backing file and preallocation cannot be used at t=
he same time

  =

  It might seem like requesting full preallocation is redundant because mos=
t data associated with the image will be present in the backing file, as so=
 the top layer is unlikely to ever need the full preallocation.  Rejecting =
this, however, means it is not (officially) possible to reserve disk space =
for the top layer to guarantee that future copy-on-writes will never get EN=
OSPC.

  OpenStack in particular uses backing files with all images, in order
  to avoid the I/O overhead of copying the backing file contents into
  the per-VM disk image. It, however, still wants to have a guarantee
  that the per-VM image will never hit an ENOSPC scenario.

  Currently it has to hack around QEMU's refusal to allow backing_file +
  preallocation, by calling 'fallocate' on the qcow2 file after it has
  been created. This is an inexact fix though, because it doesn't take
  account of fact that qcow2 metadata can takes some MBs of space.

  Thus, it would like to see preallocation=3Dfull supported in combination
  with backing files.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1538541/+subscriptions

