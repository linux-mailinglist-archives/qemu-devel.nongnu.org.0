Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355D32A71C2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 00:28:39 +0100 (CET)
Received: from localhost ([::1]:40172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaSCk-0003Yg-Ax
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 18:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kaS9x-0000Wr-JD
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 18:25:45 -0500
Received: from indium.canonical.com ([91.189.90.7]:41344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kaS9u-0003Xw-7R
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 18:25:45 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kaS9t-0002Sl-6D
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 23:25:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2AED32E8055
 for <qemu-devel@nongnu.org>; Wed,  4 Nov 2020 23:25:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2020 23:17:15 -0000
From: John Snow <1872237@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bcantrill jnsnow pmaydell
X-Launchpad-Bug-Reporter: Bryan Cantrill (bcantrill)
X-Launchpad-Bug-Modifier: John Snow (jnsnow)
References: <158663515939.5446.1890827991506574310.malonedeb@chaenomeles.canonical.com>
Message-Id: <160453183506.19046.7113797287300470819.malone@wampee.canonical.com>
Subject: [Bug 1872237] Re: SysTick reload behavior emulated incorrectly
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 33d2936226125b73c68b7f5d40f39294dc4fa130
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 17:35:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1872237 <1872237@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merged:
https://patchew.org/QEMU/20201015151829.14656-1-peter.maydell@linaro.org/

Commits: =

https://gitlab.com/qemu-project/qemu/-/commit/68d59c6d8d85ae176d3cb2cd20a48=
d6a090ba288
https://gitlab.com/qemu-project/qemu/-/commit/32bd322a0134ed89db00f2b9b3894=
982db3dedcb

** Changed in: qemu
       Status: In Progress =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1872237

Title:
  SysTick reload behavior emulated incorrectly

Status in QEMU:
  Fix Committed

Bug description:
  QEMU's emuation of SysTick on ARM is incorrect with respect to reload
  behavior.  This issue is described here, and also in a repository
  dedicated to the issue:

    https://github.com/oxidecomputer/qemu-systick-bug

  =

  (What follows is in Markdown, which I understand that Launchpad does
  not support; see the repository linked above for a rendering of it.)

  Take this Rust program:

  ```rust
  #![no_std]
  #![no_main]

  extern crate panic_semihosting;

  use cortex_m_rt::entry;
  use cortex_m_semihosting::hprintln;
  use cortex_m::peripheral::syst::SystClkSource;
  use cortex_m::peripheral::SYST;

  fn delay(syst: &mut cortex_m::peripheral::SYST, ms: u32)
  {
      /*
       * Configured for the LM3S6965, which has a default CPU clock of 12 M=
hz
       */
      let reload =3D 12_000 * ms;

      syst.set_reload(reload);
      syst.clear_current();
      syst.enable_counter();

      hprintln!("waiting for {} ms (SYST_CVR=3D{}) ...",
          ms, SYST::get_current()
      ).unwrap();

      while !syst.has_wrapped() {}

      hprintln!("  ... done (SYST_CVR=3D{})\n",
  SYST::get_current()).unwrap();

      syst.disable_counter();
  }

  #[entry]
  fn main() -> ! {
      let p =3D cortex_m::Peripherals::take().unwrap();
      let mut syst =3D p.SYST;

      syst.set_clock_source(SystClkSource::Core);

      loop {
          delay(&mut syst, 1000);
          delay(&mut syst, 100);
      }
  }
  ```

  This program should oscillate between waiting for one second and waiting
  for 100 milliseconds.  Under hardware, this is more or less what it does
  (depending on core clock frequency); e.g., from an STM32F4107 (connected =
via
  OCD and with semi-hosting enabled):

  ```
  waiting for 1000 ms (SYST_CVR=3D11999949) ...
    ... done (SYST_CVR=3D11999902)

  waiting for 100 ms (SYST_CVR=3D1199949) ...
    ... done (SYST_CVR=3D1199897)

  waiting for 1000 ms (SYST_CVR=3D11999949) ...
    ... done (SYST_CVR=3D11999885)

  waiting for 100 ms (SYST_CVR=3D1199949) ...
    ... done (SYST_CVR=3D1199897)

  waiting for 1000 ms (SYST_CVR=3D11999949) ...
    ... done (SYST_CVR=3D11999885)

  ```

  Under QEMU, however, its behavior is quite different:

  ```
  $ cargo run
      Finished dev [unoptimized + debuginfo] target(s) in 0.03s
       Running `qemu-system-arm -cpu cortex-m3 -machine lm3s6965evb -nograp=
hic -semihosting-config enable=3Don,target=3Dnative -kernel target/thumbv7m=
-none-eabi/debug/qemu-systick-bug`
  waiting for 1000 ms (SYST_CVR=3D11999658) ...
    ... done (SYST_CVR=3D11986226)

  waiting for 100 ms (SYST_CVR=3D0) ...
    ... done (SYST_CVR=3D1186560)

  waiting for 1000 ms (SYST_CVR=3D1185996) ...
    ... done (SYST_CVR=3D11997350)

  waiting for 100 ms (SYST_CVR=3D0) ...
    ... done (SYST_CVR=3D1186581)
  ```

  In addition to the values being strangely wrong, the behavior is wrong:
  the first wait correctly waits for 1000 ms -- but the subsequent wait
  (which should be for 100 ms) is in fact 1000 ms, and the next wait (which
  should be for 1000 ms) is in fact 100 ms.  (That is, it appears as if
  the periods of the two delays have been switched.)

  The problems is that the QEMU ARM emulation code does not reload SYST_CVR=
 from
  SYST_RVR if SYST_CSR.ENABLE is not set -- and moreover, that SYST_CVR is
  not reloaded from SYST_RVR even when SYST_CSR.ENABLE becomes set.  This is
  very explicit; from
  <a
  href=3D"https://github.com/qemu/qemu/blob/8bac3ba57eecc466b7e73dabf7d1932=
8a59f684e/hw/timer/armv7m_systick.c#L42-L60">hw/timer/armv7m_systick.c</a>:

  ```c
  static void systick_reload(SysTickState *s, int reset)
  {
      /* The Cortex-M3 Devices Generic User Guide says that "When the
       * ENABLE bit is set to 1, the counter loads the RELOAD value from the
       * SYST RVR register and then counts down". So, we need to check the
       * ENABLE bit before reloading the value.
       */
      trace_systick_reload();

      if ((s->control & SYSTICK_ENABLE) =3D=3D 0) {
          return;
      }

      if (reset) {
          s->tick =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
      }
      s->tick +=3D (s->reload + 1) * systick_scale(s);
      timer_mod(s->timer, s->tick);
  }
  ```

  The statement in the code is stronger than the statement in the
  <a href=3D"https://static.docs.arm.com/ddi0403/eb/DDI0403E_B_armv7m_arm.p=
df">ARMv7-M Architecture Reference Manual</a> (sec B3.3.1):

  > Writing to SYST_CVR clears both the register and the COUNTFLAG status
  > bit to zero. This causes the SysTick logic to reload SYST_CVR from SYST=
_RVR
  > on the next timer clock. A write to SYST_CVR does not trigger the
  > SysTick exception logic.

  Note that this does not mention the behavior on a write to SYST_CVR when
  SYST_CSR.ENABLE is not set -- and in particular, does *not* say that writ=
es to
  SYST_CVR will be ignored if SYST_CSR.ENABLE is not set.

  Section 3.3.1 does go on to say:

  > The SYST_CVR value is UNKNOWN on reset. Before enabling the SysTick cou=
nter,u
  > software must write the required counter value to SYST_RVR, and then wr=
ite
  > to SYST_CVR. This clears SYST_CVR to zero. When enabled, the counter =

  > reloads the value from SYST_RVR, and counts down from that value, rathe=
r]
  > than from an arbitrary value.

  (This is more or less what has been quoted in the implementation of
  `systick_reload`, above.)  This note does **not** say, however, that writ=
es
  to SYST_CVR will be discarded when not enabled, but rather that the count=
ing
  will only begin (and the value in SYST_RVR loaded or reloaded) when
  SYST_CSR.ENABLE becomes set.

  While QEMU's behavior does not match that of the hardware (and is therefo=
re
  at some level malfunctioning), there is additional behavior that is very
  clearly incorrect: once SYST_CSR.ENABLE is set, not only will SYST_CVR
  continue to return 0 (that is, the counter will not be enabled),
  SYST_CSR.COUNTFLAG will become set when the *old* value of SYST_RVR ticks
  have elapsed!  This is wrong in both regards: if SYST_CVR is not counting
  down, SYST_CSR.COUNTFLAG should never become set -- and it certainly
  shouldn't match a value of SYST_RVR that has been overwritten in the
  interim!

  In terms of fixing this, it's helpful to understand the
  <a
  href=3D"https://lists.gnu.org/archive/html/qemu-devel/2015-05/msg01217.ht=
ml">context
  around this change</a>:

  > Consider the following pseudo code to configure SYSTICK (The
  > recommended programming sequence from "the definitive guide to the
  > arm cortex-m3"):
  >    SYSTICK Reload Value Register =3D 0xffff
  >    SYSTICK Current Value Register =3D 0
  >    SYSTICK Control and Status Register =3D 0x7
  >
  > The pseudo code "SYSTICK Current Value Register =3D 0" leads to invoking
  > systick_reload(). As a consequence, the systick.tick member is updated
  > and the systick timer starts to count down when the ENABLE bit of
  > SYSTICK Control and Status Register is cleared.
  >
  > The worst case is that: during the system initialization, the reset
  > value of the SYSTICK Control and Status Register is 0x00000000. =

  > When the code "SYSTICK Current Value Register =3D 0" is executed, the
  > systick.tick member is accumulated with "(s->systick.reload + 1) *
  > systick_scale(s)". The systick_scale() gets the external_ref_clock
  > scale because the CLKSOURCE bit of the SYSTICK Control and Status
  > Register is cleared. This is the incorrect behavior because of the
  > code "SYSTICK Control and Status Register =3D 0x7". Actually, we want
  > the processor clock instead of the external reference clock.
  >
  > This incorrect behavior defers the generation of the first interrupt. =

  >
  > The patch fixes the above-mentioned issue by setting the systick.tick
  > member and modifying the systick timer only if the ENABLE bit of
  > the SYSTICK Control and Status Register is set.
  >
  > In addition, the Cortex-M3 Devices Generic User Guide mentioned that
  > "When ENABLE is set to 1, the counter loads the RELOAD value from the
  > SYST RVR register and then counts down". This patch adheres to the
  > statement of the user guide.

  This fix is simply incorrect -- or at the least, incomplete:
  a write to SYST_CVR must clear any cached state
  such that a subsequent write to SYST_CSR.ENABLE will correctly cause
  a reload.  Here is a diff that solves the problem without re-introducing
  the behavior that the original fix was trying to correct:

  ```diff
  diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
  index 74c58bcf24..3f7b267c2d 100644
  --- a/hw/timer/armv7m_systick.c
  +++ b/hw/timer/armv7m_systick.c
  @@ -181,6 +181,15 @@ static MemTxResult systick_write(void *opaque, hwadd=
r addr,
           break;
       case 0x8: /* SysTick Current Value.  Writes reload the timer.  */
           systick_reload(s, 1);
  +
  +        if ((s->control & SYSTICK_ENABLE) =3D=3D 0) {
  +            /*
  +             * If we're not enabled, explicitly clear our tick value to
  +             * assure that when we do become enabled, we correctly reloa=
d.
  +             */
  +            s->tick =3D 0;
  +        }
  +
           s->control &=3D ~SYSTICK_COUNTFLAG;
           break;
       default:
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1872237/+subscriptions

