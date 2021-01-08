Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E9B2EEC88
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:35:17 +0100 (CET)
Received: from localhost ([::1]:47346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjUa-0005k1-Ie
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLt-0001Qa-7a
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:17 -0500
Received: from indium.canonical.com ([91.189.90.7]:56314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLp-0003hY-Vd
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:16 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxjLb-0004CY-P3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:25:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8A7D22E8147
 for <qemu-devel@nongnu.org>; Fri,  8 Jan 2021 04:25:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jan 2021 04:17:28 -0000
From: Launchpad Bug Tracker <1644754@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dominik-csapak janitor th-huth
X-Launchpad-Bug-Reporter: flumm (dominik-csapak)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20161125090323.28092.26978.malonedeb@soybean.canonical.com>
Message-Id: <161007944834.27824.13532360888802709707.malone@loganberry.canonical.com>
Subject: [Bug 1644754] Re: gluster partial reads refusal conflicts with qcow2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: 147cbe0bdadd86a738b3f21c707a1d103e41d864
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1644754 <1644754@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1644754

Title:
  gluster partial reads refusal conflicts with qcow2

Status in QEMU:
  Expired

Bug description:
  there is an inconsistency in how qemu creates qcow2 files, which
  causes an error in the gluster (and possibly other block drivers)

  the problem is that the gluster backend expects the filesize to be 512
  byte aligned, which is not the case anymore since 2.7.0 when using the
  file backend for qcow2 files with a backing file

  the error is then
  Could not open 'gluster://gluster01/gv0/bar2.qcow2': Could not read L1 ta=
ble: Input/output error

  steps to reproduce:

   * create a.qcow2
   * create b.qcow2 with a.qcow2 as base via filesystem (without gluster)
     b.qcow2 filesize is not a multiple of 512 bytes
   * move both files to a gluster share
   * access to b.qcow2 via gluster block driver fails

  example:

  have a gluster server at 'gluster01' with a volume 'gv0' (gluster
  versions tested: 3.7.15,3.8.5,3.8.5)

  root@pc:~# mount -t glusterfs gluster01:/gv0 /mnt/gluster
  root@pc:~# qemu-img create -f qcow2 gluster://gluster01/gv0/foo.qcow2 100M
  Formatting 'gluster://gluster01/gv0/foo.qcow2', fmt=3Dqcow2 size=3D104857=
600 encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bit=
s=3D16
  root@pc:~# qemu-img info /mnt/gluster/foo.qcow2 =

  image: /mnt/gluster/foo.qcow2
  file format: qcow2
  virtual size: 100M (104857600 bytes)
  disk size: 193K
  cluster_size: 65536
  Format specific information:
      compat: 1.1
      lazy refcounts: false
      refcount bits: 16
      corrupt: false
  root@pc:~# qemu-img info gluster://gluster01/gv0/foo.qcow2
  image: gluster://gluster01/gv0/foo.qcow2
  file format: qcow2
  virtual size: 100M (104857600 bytes)
  disk size: 193K
  cluster_size: 65536
  Format specific information:
      compat: 1.1
      lazy refcounts: false
      refcount bits: 16
      corrupt: false
  root@pc:~# qemu-img create -f qcow2 -b foo.qcow2 gluster://gluster01/gv0/=
bar.qcow2
  Formatting 'gluster://gluster01/gv0/bar.qcow2', fmt=3Dqcow2 size=3D104857=
600 backing_file=3Dfoo.qcow2 encryption=3Doff cluster_size=3D65536 lazy_ref=
counts=3Doff refcount_bits=3D16
  root@pc:~# qemu-img info /mnt/gluster/bar.qcow2
  image: /mnt/gluster/bar.qcow2
  file format: qcow2
  virtual size: 100M (104857600 bytes)
  disk size: 193K
  cluster_size: 65536
  backing file: foo.qcow2 (actual path: /mnt/gluster/foo.qcow2)
  Format specific information:
      compat: 1.1
      lazy refcounts: false
      refcount bits: 16
      corrupt: false
  root@pc:~# qemu-img info gluster://gluster01/gv0/bar.qcow2
  image: gluster://gluster01/gv0/bar.qcow2
  file format: qcow2
  virtual size: 100M (104857600 bytes)
  disk size: 193K
  cluster_size: 65536
  backing file: foo.qcow2 (actual path: gluster://gluster01/gv0/foo.qcow2)
  Format specific information:
      compat: 1.1
      lazy refcounts: false
      refcount bits: 16
      corrupt: false
  root@pc:~# qemu-img create -f qcow2 -b foo.qcow2 /mnt/gluster/bar2.qcow2
  Formatting '/mnt/gluster/bar2.qcow2', fmt=3Dqcow2 size=3D104857600 backin=
g_file=3Dfoo.qcow2 encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Do=
ff refcount_bits=3D16
  root@pc:~# qemu-img info /mnt/gluster/bar2.qcow2
  image: /mnt/gluster/bar2.qcow2
  file format: qcow2
  virtual size: 100M (104857600 bytes)
  disk size: 193K
  cluster_size: 65536
  backing file: foo.qcow2 (actual path: /mnt/gluster/foo.qcow2)
  Format specific information:
      compat: 1.1
      lazy refcounts: false
      refcount bits: 16
      corrupt: false
  root@pc:~# qemu-img info gluster://gluster01/gv0/bar2.qcow2
  qemu-img: Could not open 'gluster://gluster01/gv0/bar2.qcow2': Could not =
read L1 table: Input/output error
  root@pc:~# ls -l /mnt/gluster/
  total 578
  -rw-r--r-- 1 root root 196616 Nov 25 09:07 bar2.qcow2
  -rw------- 1 root root 197120 Nov 25 09:07 bar.qcow2
  -rw------- 1 root root 197120 Nov 25 09:06 foo.qcow2
  drwxr-xr-x 6 root root     46 Nov 24 16:51 images

  here you can see that the file created with directory path is not 512
  byte aligned, while the one created through the gluster api is

  also, when creating a qcow2 with the nfs block driver, the filesize is
  also a multiple of 512, but reading a non aligned file with nfs works
  however

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1644754/+subscriptions

