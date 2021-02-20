Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F503206C0
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 20:07:14 +0100 (CET)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDXaz-0005ew-Ux
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 14:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lDXZQ-00056H-28
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 14:05:36 -0500
Received: from indium.canonical.com ([91.189.90.7]:56094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lDXZO-0008P8-5X
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 14:05:35 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lDXZN-0002UT-4x
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 19:05:33 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0E08B2E8100
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 19:05:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Feb 2021 18:57:29 -0000
From: Ven Karri <1916344@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: libslirp mac networking osx podman qemu slirp user-mode
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: imperialguy
X-Launchpad-Bug-Reporter: Ven Karri (imperialguy)
X-Launchpad-Bug-Modifier: Ven Karri (imperialguy)
References: <161384672086.17995.1360895646378656233.malonedeb@wampee.canonical.com>
Message-Id: <161384745030.12105.8859107143224148357.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1916344] Re: User mode networking not working properly on QEMU
 on Mac OS X host
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bbfee60eef9f7fd8d30b24b3f53e75656e4d5fb0"; Instance="production"
X-Launchpad-Hash: 3284178e8b776009e7fc1fa09f4e6fbb648ab06c
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
Reply-To: Bug 1916344 <1916344@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Description changed:

  Steps to reproduce:
  =

  1. Install QEMU using homebrew on Mac OS X (I used Big Sur)
- 2. Spin up a guest VM (say) Cent OS8 using user mode networking.
+ 2. Spin up a guest VM (say) Cent OS 8 using user mode networking.
  3. Install podman inside the guest
  4. Run podman pull alpine
  =

  The result is:
  =

  [root@localhost ~]# podman pull alpine
  Resolved "alpine" as an alias (/etc/containers/registries.conf.d/shortnam=
es.conf)
  Trying to pull docker.io/library/alpine:latest...
  Getting image source signatures
  Copying blob ba3557a56b15 [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] 2.7M=
iB / 2.7MiB
  =C2=A0=C2=A0unexpected EOF
  Error: Error writing blob: error storing blob to file "/var/tmp/storage85=
1171596/1": error happened during read: unexpected EOF
  =

  This is happening because QEMU is telling the guest that the TCP
  connection is closed even before reading all the data from the host
  socket and forwarding it to the guest.
  =

  This issue doesn't happen on a Linux host. So, that tells me that this
  has something to do with QEMU installation on Mac OS X.
  =

  This could be a slirp related issue. So, QEMU/slirp may need to work
  together on fixing this. Here's the link to the libslirp issue:
  =

  https://gitlab.freedesktop.org/slirp/libslirp/-/issues/35

** Tags added: libslirp

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916344

Title:
  User mode networking not working properly on QEMU on Mac OS X host

Status in QEMU:
  New

Bug description:
  Steps to reproduce:

  1. Install QEMU using homebrew on Mac OS X (I used Big Sur)
  2. Spin up a guest VM (say) Cent OS 8 using user mode networking.
  3. Install podman inside the guest
  4. Run podman pull alpine

  The result is:

  [root@localhost ~]# podman pull alpine
  Resolved "alpine" as an alias (/etc/containers/registries.conf.d/shortnam=
es.conf)
  Trying to pull docker.io/library/alpine:latest...
  Getting image source signatures
  Copying blob ba3557a56b15 [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] 2.7M=
iB / 2.7MiB
  =C2=A0=C2=A0unexpected EOF
  Error: Error writing blob: error storing blob to file "/var/tmp/storage85=
1171596/1": error happened during read: unexpected EOF

  This is happening because QEMU is telling the guest that the TCP
  connection is closed even before reading all the data from the host
  socket and forwarding it to the guest.

  This issue doesn't happen on a Linux host. So, that tells me that this
  has something to do with QEMU installation on Mac OS X.

  This could be a slirp related issue. So, QEMU/slirp may need to work
  together on fixing this. Here's the link to the libslirp issue:

  https://gitlab.freedesktop.org/slirp/libslirp/-/issues/35

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1916344/+subscriptions

