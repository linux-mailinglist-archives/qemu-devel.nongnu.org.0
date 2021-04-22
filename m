Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E16367B01
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:23:52 +0200 (CEST)
Received: from localhost ([::1]:39242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTgm-00088M-1D
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTdt-0006Ge-Af
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:20:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:37150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZTdq-0006Q1-9U
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:20:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZTdp-0004zd-3t
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:20:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 106AE2E8161
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:20:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 07:13:02 -0000
From: Thomas Huth <1838066@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: sdaoden th-huth xanclic
X-Launchpad-Bug-Reporter: Steffen (Daode) Nurpmeso (sdaoden)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <156416003866.5869.12093759540682814562.malonedeb@soybean.canonical.com>
Message-Id: <161907558224.6193.10577366115795653939.malone@chaenomeles.canonical.com>
Subject: [Bug 1838066] Re: unexpected error: raw_reconfigure_getfd():
 qemu-system-x86_64: Could not reopen file
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: e7372b61177199b61222da7cd27688dfbb8c979c
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
Reply-To: Bug 1838066 <1838066@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assuming this has been fixed according to Max' comment. If not, please
re-open.

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838066

Title:
  unexpected error: raw_reconfigure_getfd(): qemu-system-x86_64: Could
  not reopen file

Status in QEMU:
  Fix Released

Bug description:
    Unexpected error in raw_reconfigure_getfd() at block/file-posix.c:923:
    qemu-system-x86_64: Could not reopen file: Permission denied
    Aborted

  Is what i sometimes (only) get, mostly for Linux guests i'd say (Arch jus=
t a few moments ago).
  This is on CRUX-Linux, thus a self-compiled qemu 4.0.0 with default recip=
e, without special compiler flags (-O2 -march=3Dx86-64 -pipe) on an Intel i=
5 laptop.
  But what i do is running this via sudo:

       sudo=3D'sudo --preserve-env=3DVMNAME,VMADDR' runas=3D'-runas vm -chr=
oot .'
    fi

    VMADDR=3D$addr VMNAME=3D$vmname
    export VMADDR VMNAME
    eval exec $sudo qemu-system-x86_64 -name $vmname $runas \
        $host $accel $display $net $vmcustom $vmimg $redir

  the last run ends up like (via sudo)

    qemu-system-x86_64 -name arch-2019 -runas vm -chroot . -cpu host -m
  size=3D1984 -smp cpus=3D2 -enable-kvm -accel accel=3Dkvm,thread=3Dmulti
  -display curses -net nic,netdev=3Dnet0,macaddr=3D..  -netdev
  tap,id=3Dnet0,script=3D./.ifup.sh,downscript=3D./.ifdown.sh,ifname=3Dvm_a=
rch-2019

  vm is a user effectively living in the chroot only without any rights any=
where.
  Hope this helps, thanks a lot for qemu!!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838066/+subscriptions

