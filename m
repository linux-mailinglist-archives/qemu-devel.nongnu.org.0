Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A4E200D49
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 16:57:37 +0200 (CEST)
Received: from localhost ([::1]:56782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmISW-00070x-MB
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 10:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jmIQm-0005Jy-Fu
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:55:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:47684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jmIQk-0004T1-BC
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:55:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jmIQi-0000rI-7d
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 14:55:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2DECC2E8072
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 14:55:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2020 14:46:08 -0000
From: Christian Schoenebeck <1884169@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Opinion; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: judahh schoenebeck
X-Launchpad-Bug-Reporter: Judah Holanda Correia Lima (judahh)
X-Launchpad-Bug-Modifier: Christian Schoenebeck (schoenebeck)
References: <159252498136.16858.459210330047675680.malonedeb@chaenomeles.canonical.com>
Message-Id: <159257796905.17037.4695605909860910581.malone@chaenomeles.canonical.com>
Subject: [Bug 1884169] Re: There is no option group 'fsdev' for OSX
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: bf26f02b72133060bec9dbe392ff9d7f2352d47d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 10:55:44
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1884169 <1884169@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That's the behaviour on macOS that I would expect ATM. So it's not a
bug.

Your macOS version was compiled without virtfs support, that's why qemu
does not even offer you these options.

Even though 9P is a network protocol, you still need support by host OS
and guest OS for some kind of communication channel between host and
guest. Currently 9pfs in qemu supports either virtio (Linux KVM host <->
Linux guest) or Xen as communication channel. For macOS so far nobody
bothered to implement a communication driver for qemu 9pfs yet.

** Changed in: qemu
       Status: New =3D> Opinion

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884169

Title:
  There is no option group 'fsdev' for OSX

Status in QEMU:
  Opinion

Bug description:
  When I try to use -fsoption on OSX I receive this error:

  -fsdev local,security_model=3Dmapped,id=3Dfsdev0,path=3Ddevel/dmos-exampl=
e:
  There is no option group 'fsdev'

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884169/+subscriptions

