Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FE537D2C0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:18:20 +0200 (CEST)
Received: from localhost ([::1]:56766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtR6-0003mO-1Y
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgtK5-0002X4-2k
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:11:05 -0400
Received: from indium.canonical.com ([91.189.90.7]:33984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgtK1-0006xJ-8G
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:11:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgtJz-0000xS-JI
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 18:10:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6C7F42E8186
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 18:10:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 18:02:45 -0000
From: Thomas Huth <1913969@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth vklimovs
X-Launchpad-Bug-Reporter: Vjaceslavs Klimovs (vklimovs)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161213017826.4056.12759150225792580313.malonedeb@soybean.canonical.com>
Message-Id: <162084256604.7322.8477338491206073978.malone@gac.canonical.com>
Subject: [Bug 1913969] Re: unable to migrate non shared storage when TLS is
 used
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: ef250d063db3b56573d701646fa2c866fc8f2cb6
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
Reply-To: Bug 1913969 <1913969@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913969

Title:
  unable to migrate non shared storage when TLS is used

Status in QEMU:
  Incomplete

Bug description:
  Operating system: Gentoo
  Architecture: x86_64
  kernel version: 5.4.72, 5.10.11
  libvirt version: at least 6.9.0, 6.10.0, 7.0.0
  Hypervisor and version: qemu 5.1.0, 5.2.0

  With software versions described above and following configurations:
  libvirt:
  key_file =3D "/etc/ssl/libvirt/server.lan.key"
  cert_file =3D "/etc/ssl/libvirt/server.lan.crt"
  ca_file =3D "/etc/ssl/libvirt/ca.crt"
  log_filters=3D"3:remote 4:event 3:util.json 3:rpc 1:*"
  log_outputs=3D"1:file:/var/log/libvirt/libvirtd.log"
  qemu:
  default_tls_x509_cert_dir =3D "/etc/ssl/qemu"
  default_tls_x509_verify =3D 1
  migration with tls:
  virsh # migrate vm1 qemu+tls://server2.lan/system --persistent --undefine=
source --copy-storage-all --verbose --tls
  never succeeds. Progress stops typically at high progress amounts (95%-98=
%), and network traffic drastically drops as well (from 1 gbps+ to nothing)=
. domjobinfo progress also stops. Without --tls migrations succeed without =
issues without any other changes to hosts or configurations.

  Note: I reported this originally as libvirt bug:
  https://gitlab.com/libvirt/libvirt/-/issues/108.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913969/+subscriptions

