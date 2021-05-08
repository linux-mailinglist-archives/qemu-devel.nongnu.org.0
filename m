Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A069C37700D
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 08:22:25 +0200 (CEST)
Received: from localhost ([::1]:51392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfGM4-0004K1-Ks
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 02:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGFf-0005Xt-Sd
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:15:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:54740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfGFd-0004rE-5Q
 for qemu-devel@nongnu.org; Sat, 08 May 2021 02:15:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfGFb-0007SX-H2
 for <qemu-devel@nongnu.org>; Sat, 08 May 2021 06:15:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 780062E813A
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 06:15:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 May 2021 06:09:37 -0000
From: Thomas Huth <1894781@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake th-huth vklimovs
X-Launchpad-Bug-Reporter: Vjaceslavs Klimovs (vklimovs)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159953760175.19565.14791337348074084173.malonedeb@gac.canonical.com>
Message-Id: <162045417796.7349.10889262602403837862.malone@gac.canonical.com>
Subject: [Bug 1894781] Re: [Feature request] Provide a way to do TLS first in
 QEMU/NBD connections (not after NBD negotiation)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 136eaee033c7b621a5cab8cb94ae7cb11e2cd14c
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
Reply-To: Bug 1894781 <1894781@bugs.launchpad.net>
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

** Tags added: feature-request

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1894781

Title:
  [Feature request] Provide a way to do TLS first in QEMU/NBD
  connections (not after NBD negotiation)

Status in QEMU:
  Incomplete

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

