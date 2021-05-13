Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2672E37F818
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:42:01 +0200 (CEST)
Received: from localhost ([::1]:54226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAf6-0007GI-FI
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAPb-00067p-Nf
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:25:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:44676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAPY-00044U-9L
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:25:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhAPU-0007OO-HN
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:25:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7E9472E8195
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:25:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 12:16:08 -0000
From: Thomas Huth <1894781@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake th-huth vklimovs
X-Launchpad-Bug-Reporter: Vjaceslavs Klimovs (vklimovs)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159953760175.19565.14791337348074084173.malonedeb@gac.canonical.com>
Message-Id: <162090816840.7541.2519972968225463578.malone@gac.canonical.com>
Subject: [Bug 1894781] Re: [Feature request] Provide a way to do TLS first in
 QEMU/NBD connections (not after NBD negotiation)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 36f83f70e1840351624d7d4521aed5908614b5ef
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
Reply-To: Bug 1894781 <1894781@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/282


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #282
   https://gitlab.com/qemu-project/qemu/-/issues/282

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894781

Title:
  [Feature request] Provide a way to do TLS first in QEMU/NBD
  connections (not after NBD negotiation)

Status in QEMU:
  Expired

Bug description:
  (following from
  https://gitlab.com/libvirt/libvirt/-/issues/68#note_400960567)

  As is very well explained in https://www.berrange.com/posts/2016/04/05
  /improving-qemu-security-part-5-tls-support-for-nbd-server-client/,
  and easily confirmed with captures, NBD stream starts in cleartext and
  upgrades to TLS inline (similar to STARTTLS mechanism). As a
  rationale, it is stated that this provides better error messages for
  the user of NBD.

  However, this approach has downsides:

  1) Clear indication to a network observer that NBD (and therefore likely =
qemu/libvirt) is used. In contrast, TLS1.3 hides even the SNI of the server=
s (ESNI, https://blog.cloudflare.com/encrypted-sni/).
  2) Potential for bugs in NBD protocol negotiation code. That code just st=
atistically, likely less looked at code than gnutls. This is not a reflecti=
on on NBD code quality, just the fact that TLS code does receive a bit more=
 scrutiny. =

  3) Inability to inspect TLS listener interface for compliance, e.g. with =
a security scanner. Making sure TLS listeners only select certain ciphersui=
ts is a requirement of some compliance regimes. =


  I think it's fully possible to satisfy the original requirement of
  good error messages as well, detecting that the other end is
  initiating TLS connection.

  It's very unlikely that it's currently sae to recommend to run QEMU
  migration stream over a hostile network, but it should be possible to
  do with TLS only option.

  Solution to this, just like in the case of SMTP, is to provide TLS
  only option (no initial cleartext at all) for QEMU migration, which
  hopefully it not a large addition.

  Thank you for your consideration!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1894781/+subscriptions

