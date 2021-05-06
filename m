Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3AD374F4C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 08:19:16 +0200 (CEST)
Received: from localhost ([::1]:51698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leXLv-0007zc-Iy
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 02:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leXIf-00062Q-68
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:15:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:44910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leXId-0004Cy-8g
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:15:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leXIb-0007ln-6x
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:15:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 323752E8136
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 06:15:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 06:08:32 -0000
From: Thomas Huth <1865252@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Won't Fix; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request haxm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adrelanos th-huth
X-Launchpad-Bug-Reporter: Patrick Schleizer (adrelanos)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158295831762.11832.17275327924748594060.malonedeb@wampee.canonical.com>
Message-Id: <162028131225.32079.4810967665842188713.malone@chaenomeles.canonical.com>
Subject: [Bug 1865252] Re: QEMU Windows Portable Version (with HAXM
 accelerator and QEMU GUI)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: ef5f37498e2d328df9d905351128920ff73c9be0
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
Reply-To: Bug 1865252 <1865252@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU, like most open source projects, relies on contributors who have
motivation, skills and available time to work on implementing particular
features. They naturally tend to focus on features that result in the
greatest benefit to their own use cases. I'm sorry, but as far as I know
there is currently nobody working on such a topic, and opening a ticket
like this won't make it happen without some new contributor to step up
to do the job. Thus I'm closing this ticket now. Feel free to re-open if
you know someone who could contribute this feature.

** Changed in: qemu
       Status: New =3D> Won't Fix

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1865252

Title:
  QEMU Windows Portable Version (with HAXM accelerator and QEMU GUI)

Status in QEMU:
  Won't Fix

Bug description:
  Please consider providing a QEMU Windows portable [1] [2] [3] version
  on official qemu.org.

  Reasons:

  * This would improve usability, the out of the box user experience of lay=
men (non-technical) users.
  * Linux distributions could add the QEMU Windows portable to their instal=
ler / live ISO images (and the DVD's autorun.inf). Users who are still runn=
ing on the Windows platform could be having an easy path to try out a Linux=
 distribution by running int inside QEMU. I've seen that in many some years=
 ago. Was running Windows. Just open the DVD drive in Windows explorer, dou=
ble click and QEMU (shipped with the ISO) booted the ISO.

  Ideally EMU Windows portable version would be bundled with:

  * the [QEMU HAXM accelerator] by default. Related ticket: [5]
  * a QEMU GUI by default. Related ticket: [6]

  =

  [1] When I say "Windows Portable" I mean "USB portable". [4]

  [2] A compress archive (zip or so) which after extraction can be
  executed without further installation / setup required. As far I know
  [https://portableapps.com portableapps.com] is the most popular
  project of that kind.

  [3] QEMU might already be portable or mostly portable. See:

  * https://portableapps.com/search/node/QEMU
  * https://www.google.com/search?hl=3Den&q=3Dsite%3Aportableapps.com%20QEM=
U%20portable
  * https://www.portablefreeware.com/?id=3D640
  * https://willhaley.com/blog/simple-portable-linux-qemu-vm-usb/

  But not sure above projects are still maintained. Would be certainly
  better if official qemu.org would be providing a QEMU Windows portable
  version.

  [4] Or more generally "can be run on any external storage medium on
  any Windows [10] computer.

  [5] https://bugs.launchpad.net/qemu/+bug/1864955

  [6] https://bugs.launchpad.net/qemu/+bug/1865248

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1865252/+subscriptions

