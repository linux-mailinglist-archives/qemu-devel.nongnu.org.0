Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC692BBFEE
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 15:35:31 +0100 (CET)
Received: from localhost ([::1]:45872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgTz8-0003ls-Ja
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 09:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgTpc-0007Yq-T1
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:25:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:56350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgTpY-0004Ly-Cd
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 09:25:40 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgTpW-0004El-08
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 14:25:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EF7FF2E813A
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 14:25:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 14:18:49 -0000
From: Thomas Huth <1754656@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Wishlist; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: etosan
X-Launchpad-Bug-Reporter: =?utf-8?b?TWFydGluICJldG8iICBNacWhw7p0aCAoZXRv?=
 =?utf-8?q?san=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152060087104.31174.3517029871758682734.malonedeb@wampee.canonical.com>
Message-Id: <160596833024.25856.14855508449619160357.launchpad@wampee.canonical.com>
Subject: [Bug 1754656] Re: Please solve graceful (ACPI) poweroff issue,
 using signals, most importantly SIGTERM
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: a22bc566a6a628cd0628b6774db09ea1280f576b
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
Reply-To: Bug 1754656 <1754656@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
   Importance: Undecided =3D> Wishlist

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1754656

Title:
  Please solve graceful (ACPI) poweroff issue, using signals, most
  importantly SIGTERM

Status in QEMU:
  New

Bug description:
  Version:

  QEMU emulator version 2.11.1

  Introduction:

  This is call for action to get attention of somebody in QEMU
  project/organization, who is capable of actually doing something about
  this pressing issue. This might be TLDR for some, but that's only
  because of the complexity of the issue. Please read this with open
  mind.

  Problem:

  As QEMU users, we need (it is a requirement) to have some mechanism in
  place, to somehow convert simple POSIX signal sent form host, into
  graceful ACPI shutdown of the guest. This signal, due various
  historical reasons and daemon design, must be SIGTERM foremost.

  Status quo:

  After wading through mailing lists and bug tracker I concluded that
  this is "political" problem and I am in search of somebody, a
  "politician" within QEMU project, who will help us reach conclusion to
  this problem.

  First I will present analysis of the situation, and then propose some
  suggestions for solutions.

  Even then, any of these proposals might be, potentially, seen as
  problematic in eyes of QEMU maintainers, developers, dictators, long
  term users or their dogs.

  That's why we need somebody willing, "higher up the chain" or
  whatever, to orchestrate discussion so that we can actually reach
  consensus in the matter, solution that is acceptable to **everyone**.

  Analysis:

  Each QEMU emulated virtual machine (vm), running in the host system,
  is represented by single qemu-* process (followed by several threads).
  Thus for all intents and purposes, any such instantiated vm, must be
  seen as it's own, separate, daemon.

  I repeat running qemu-* vm **is a daemon**.

  QEMU provides incredible IO redirection capabilities, so we don't need
  to get into issues of logging, console and monitor redirections and
  such, as this is already a (perfectly) solved problem.

  What we cannot currently do, at least easily, reliably and simply, is
  to shutdown guest gracefully from "outside".

  That is not a problem for those of us, who use some kind of higher
  level orchestrator (I think one of them is virsh, but this is not
  important in this matter) that takes care of this by communicating
  with QEMU directly (I guess this is done by sending commands to
  internal monitor by pipe (or socket) held open by mentioned
  orchestrator).

  However it is a problem for those of us, who run qemu-* processes bare
  or supervised.

  Let's say I, as administrator, want to implement vm instance as supervise=
d service.
  I can use any supervisor for that, systemd even. Let us not get into into=
 supervisor wars.

  At basic level almost all supervisors are similar. Supervisor usually
  is yet another process, that "leads" the qemu-* one.

  In case of systemd it is PID1, but in case of other supervision
  schemes, like daemontools, runit, s6 or nosh, it is separate
  '*supervise' process instead.

  When such supervisor is tearing down the service,
  "leading"/supervising, parent will send SIGTERM to it's child qemu-*
  process.

  This behaviour is almost universal among all supervisors. This due the
  fact, that it is customary for daemons to cease all operations and
  exit cleanly when receiving SGITERM signal. If daemon child fails to
  exit within configurable timeframe, supervisor deals with it by the
  means of SIGKILL.

  As such, one would expect, similarly, for qemu-* process to send ACPI
  shutdown event to guest internally (roughly equivalent to
  'system_powerdown' monitor command) on SIGTERM reception.

  But this is not what happens!

  Instead, qemu-* just flushes pending IO and kills the guest instantly.

  Then, on next vm "boot", guest detects this as power failure event,
  and performs fsck checks and other things, it is supposed to do in
  case of power failure. We are not mentioning possible data loss that
  might have happened due to this behavior, either.

  Some supervisors (like systemd for example) might provide feature to
  change "termiante operations" signal to something else like SIGTERM,
  but that is not universal supervisor feature by any means. Default
  action for any proper daemon is to cleanly terminate on SIGTERM.

  That is why we need ability to somehow instruct QEMU to **always**
  perform graceful ACPI shutdown on SIGTERM.

  Potential reply to this bug saying that one should send
  'system_powerdown' over monitor connection won't fly!

  As it is not always possible (nor required) to hook into supervisor's
  signal processing (main reason being intentional supervisor simplicity
  in search of extreme reliability, and de facto standardized behavior
  of daemons to exit cleanly on SIGTERM).

  More over, in situations like machine reboot, most supervisors won't
  play around with signal remapping, they will simply send out SIGTERM
  to all supervised processes. We want our qemu-* instances to come up
  undamaged from such action (on next host reboot) and not have them
  stuck in fscks (or worse - ending up damaged) .

  If this can be extended further, inside QEMU, with internal signal to
  action remapping, the better, but supporting graceful shutdown on
  SIGTERM is hard requirement.

  Proposed solutions:

  0. modify QEMU so that it emits ACPI shutdown event equivalent to 'system=
_powerdown' monitor command by default
     - this seems to be a "no go", with backwards compat. and "current user=
s expectations" =

       cited as the reasons
     - I won't go into a fact that QEMU changed option handling without BOL=
D notice few times

  1. add single switch '-graceful-shutdown-on-sgiterm'
     - this was rejected when person tried to submit patch implementing som=
ething similar =

       to what I am requesting, only bound to SIGHUP
     - that person (implementing graceful poweroff on SIGHUP) was wrong, al=
most no =

       supervision scheme in existence sends out SIGHUP on service terminat=
ion request, =

       although all supervisors are able to send out SIGHUP when instructed
     - in daemons SIGHUP is usually reserved for "daemon reload" which can =
be interpreted
       like "reboot" in QEMU context
     - if we see qemu-* proces for what it is, a daemon, it must react prop=
erly to SIGTERM foremost

  2. add ability to map internal monitor action commands to few signals lik=
e SIGTERM, SIGHUP, SIGINTR, SIGUSR1, SIGUSR2, SIGALARM etc
     - this seems like best solution to me, that allows us to satisfy both =

       backwards compat. and "current users" requirement, yet allows us =

       to use qemu-* with proper supervision, and it even adds something ex=
tra =

       (I know some of these signals are used internally by QEMU)
     - QEMU already has options parsing infrastructure in place to handle t=
his nicely, something like:
       : -signal SIGTERM,monitorcommand=3Dsystem_powerdown -signal SIGHUP,m=
onitorcommand=3Dsystem_reset
       would be great in this case

  3. add ability to map signals to executable scripts
     - with this scheme QEMU would spawn child on signal reception, and thi=
s =

       script would then be used to perform the action
     - this solution is most complex, most convoluted and most "flexible"
     - for example with definition like this:
       :  -signal SIGTERM,script=3Dsignals/sigterm
       qemu would perform this sequence of tasks:
         - on SIGTERM qemu-* would spawn child script ./signals/sigterm
           - this script would then pull out monitor fd descriptor from som=
e kind of fd holder
           - would write 'system_powerdown' command into monitor fd and ter=
minate
         - qemu-* would then read the command from monitor
         - qemu-* would then interpret read-in command and gracefully termi=
nate
     - option parsing infrastructure is in place and QEMU is able to spawn =
and reap it's own children
       which is proven by network up/down scripts
      =


  Of these, it seems that 0. and 1. are simplest to implement, yet
  "politically" unimplementable.

  More over QEMU people seem to be hard set on SIGTERM meaning "killing
  unresponsive guest".

  2. seems like most reasonable proposal that has potential to make
  everyone happy. It is also most reliable because internal QEMU command
  dispatch would have least chances to fail.

  3. is most flexible and can also be combined with 2. Reliability wise,
  there is slight chance signal handling script will fail to execute,
  leaving qemu-* at the mercy of supervisor (timeouted SIGKILL).

  Both 2 and 3 should probably provide configurable timeout after which
  QEMU would perform default action (eg. as it does now).

  Conclusion:

  I hope QEMU project members understand severity of the issue and are
  open to listed solutions. It might be that proposed solutions don't
  match QEMU project "spirit" perfectly. If so, I urge people capable of
  resolving this, to propose their versions.

  The fact is, that with proliferation of systemd, popularity of
  alternative supervisors is on the rise as well, but even under
  systemd, unintuitive handling of SIGTERM by bare QEMU processes is a
  problem.

  Further Reading:

  https://patchwork.kernel.org/patch/9626293/

   - Daniel P. Berrange says:
     "Because QEMU already designate that as doing an immediate stop - ie i=
t'll
      allow QEMU block layer to flush pending I/O, but it will not wait for=
 the
      guest to shutdown.  If we change that behaviour we'll break anyone who
      is already relying on SIGHUP - qemu might never exit at all if the gu=
est
      ignores the ACPI request"

   - this behaviour is incorrect if we perceive qemu-* process as daemon, p=
roper,
     yet it is, supposedly, entrenched in QEMU userbase
   - signals remapping capability would allow us to keep the "old" behavior=
 for entrenched users
     while it would allow administrators and orchestrator writers to select=
 signal disposition =

     they actually need

  https://bugs.launchpad.net/qemu/+bug/1217339 =

  and =

  https://lists.nongnu.org/archive/html/qemu-devel/2017-03/msg03039.html

   - on my QEMU version of 2.11.1 SIGTERM just kills the guest without prop=
er shutdown
     - although thread says exit is graceful
   - dicussion is problematic in several ways:
     - SIGTERM is not intended to "terminate unresponsive guest" eg "termin=
ate daemon uncleanly"
       in any sane daemon in existence
       - it means "terminate gracefully"
       - if "terminate unresponsive guest" was true meaning of SIGTERM, dat=
abases like =

         mariadb or postgers would kill themselves on SIGTERM, leaving data=
 in =

         inconsistent state, which they, of course, do not!
     - some kind of "signal tapping" similar to "port tapping" is suggested
       - this is non-obvious and error prone and nonstandard (no normal sup=
ervisor =

         will play such signal tapping games)
       - signal remapping makes more sense in this regard

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1754656/+subscriptions

