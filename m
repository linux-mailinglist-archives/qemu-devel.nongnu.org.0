Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119C23776F3
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:17:04 +0200 (CEST)
Received: from localhost ([::1]:50544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfkEx-000421-5a
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkDc-0003K5-1i
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:15:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:52420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkDW-0002yx-Ex
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:15:38 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfkDU-0003mV-RI
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:15:32 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C1BB22E8135
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:15:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 14:06:19 -0000
From: Thomas Huth <1895399@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hcoin stefanha th-huth
X-Launchpad-Bug-Reporter: Harry Coin (hcoin)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159992963448.16886.7579356964954187024.malonedeb@soybean.canonical.com>
Message-Id: <162056917964.7198.9874801776205683673.malone@gac.canonical.com>
Subject: [Bug 1895399] Re: Docfix: add missing virtiofsd cache default 'auto'
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 23283e9404c67163d774252374ee5b6c63578592
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1895399 <1895399@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix had been included here:
https://gitlab.com/qemu-project/qemu/-/commit/f1303afe222759105f

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895399

Title:
  Docfix: add missing virtiofsd cache default 'auto'

Status in QEMU:
  Fix Released

Bug description:
  The usage command line for virtiofsd has:

  void fuse_cmdline_help(void)
  {
      printf("    -h   --help                print help\n"
  ...
             "    -o cache=3D<mode>            cache mode. could be one of =
\"auto, "
             "always, none\"\n"
             "                               default: auto\n"

  =

  But the default: auto info is missing from the man page.  I suggest this =
patch:

  --- docs/tools/virtiofsd.rst    2020-09-10 18:07:45.380430677 -0500
  +++ /tmp/virtiofsd.rst  2020-09-12 11:48:10.440815204 -0500
  @@ -106,6 +106,7 @@
     forbids the FUSE client from caching to achieve best coherency at the =
cost of
     performance.  ``auto`` acts similar to NFS with a 1 second metadata ca=
che
     timeout.  ``always`` sets a long cache lifetime at the expense of cohe=
rency.
  +  The default is ``auto``.
   =

   Examples
   --------

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1895399/+subscriptions

