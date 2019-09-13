Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346E4B23C6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 18:01:26 +0200 (CEST)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8o0i-0001Eh-AG
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 12:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1i8nqS-0008MM-5j
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 11:50:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1i8nqQ-0001L5-UL
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 11:50:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:57974)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1i8nqQ-0001Kk-PG
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 11:50:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1i8nqO-0005w6-Cs
 for <qemu-devel@nongnu.org>; Fri, 13 Sep 2019 15:50:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5D8352E807E
 for <qemu-devel@nongnu.org>; Fri, 13 Sep 2019 15:50:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Sep 2019 15:45:08 -0000
From: John Snow <1843852@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee jnsnow
X-Launchpad-Bug-Reporter: John Snow (jnsnow)
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <156833045171.17307.14707838609727225916.malonedeb@gac.canonical.com>
Message-Id: <ba6ccb1b-e0f8-da9e-f010-b89712f8769b@redhat.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19048";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: d2efd3ca96dd52b4e38082ec683ad09a05ce84f0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: Re: [Qemu-devel] [Bug 1843852] Re: QEMU does not express a
 dependency on perl-Test-Harness
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
Reply-To: Bug 1843852 <1843852@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/19 11:06 AM, Paolo Bonzini wrote:
> On 13/09/19 16:56, John Snow wrote:
>>
>>
>> On 9/13/19 4:33 AM, Alex Benn=C3=A9e wrote:
>>> Given we require python perhaps the simplest solution would be to re-
>>> write the tap-driver as a python script rather than adding another
>>> configure check?
>>
>> Seems a shame to need to after Paolo *just* introduced this perl script
>> late last year in 9df43317b82; it looks well-written as far as perl goes.
> =

> Also because I didn't write it most of it (rather, it comes from
> Automake).  The new dependency was even documented in the release notes:
> =

>   Running the QEMU testsuite now requires the Perl Test::Harness module.
>   Most Linux and BSD distributions however install it by default
>   together with Perl.
> =


Yeah, let's just add a warning(?) to the configure check that you'll be
unable to run `make check` if you're missing this dependency. Easier
than re-writing.

--js

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1843852

Title:
  QEMU does not express a dependency on perl-Test-Harness

Status in QEMU:
  New

Bug description:
  This is a minor thing; in Fedora you can install most of the developer
  dependencies by issuing something like `dnf builddep qemu-kvm` and
  this takes care of just about everything such that you can run
  ./configure and make.

  For "make check" though, configure doesn't catch that you'll need
  perl-Test-Harness; so it fails halfway through the check routine, and
  you'll see this:

  ```
  Can't locate TAP/Parser.pm in @INC (you may need to install the TAP::Pars=
er module) (@INC contains: /usr/local/lib64/perl5 /usr/local/share/perl5 /u=
sr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /u=
sr/share/perl5) at ./scripts/tap-driver.pl line 30.
  BEGIN failed--compilation aborted at ./scripts/tap-driver.pl line 30.
  make: *** [/home/jhuston/src/qemu/tests/Makefile.include:905: check-unit]=
 Error 2
  ```

  I'm not sure how we should express this dependency; it shouldn't be a
  requirement for building, but it IS a dependency for testing. We
  probably ought not let users skip the qapi tests just because they
  don't have the perl requirement met.

  (And, separately, the Fedora package should list this as a builddep,
  but that's not an issue for here.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1843852/+subscriptions

