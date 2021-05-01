Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06AF370675
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 10:47:38 +0200 (CEST)
Received: from localhost ([::1]:33262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lclHl-0006EQ-NM
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 04:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lclFr-0005nG-G4
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:45:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:45656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lclFp-0003oF-Fx
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:45:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lclFn-0005xI-0v
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 08:45:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EAD7B2E815C
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 08:45:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 08:38:25 -0000
From: Thomas Huth <1882787@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: audio subsystem voice
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: malib69055 th-huth
X-Launchpad-Bug-Reporter: malib69055 (malib69055)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159171229296.18905.15367974946504993001.malonedeb@chaenomeles.canonical.com>
Message-Id: <161985830531.9900.5901159522271009452.malone@gac.canonical.com>
Subject: [Bug 1882787] Re: AUD_set_volume_out takes SWVoiceOut as parameter,
 but controls HWVoiceOut
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 77acab390ee25b8201e65cd3a0fbe2356a354d6b
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
Reply-To: Bug 1882787 <1882787@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/74


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #74
   https://gitlab.com/qemu-project/qemu/-/issues/74

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1882787

Title:
  AUD_set_volume_out takes SWVoiceOut as parameter, but controls
  HWVoiceOut

Status in QEMU:
  Expired

Bug description:
  There was a change in
  https://github.com/qemu/qemu/commit/571a8c522e0095239598347ac0add93337c1e=
0bf
  #diff-230ab01fa7fb1668a1e9183241115cb0R1852-R1853 (audio/audio.c)
  which breaks audio output on devices which have multiple software
  voices on the same hardware voice.

  When multiple software voices use the same hardware voice, then
  setting a volume / mute for any of the software voices, will affect
  all other software voices, too.

  I'm not sure if such a use-case exists in QEMU; however, it does exist in=
 my fork.
  It's also easy to see that this is a bug in the QEMU audio subsystem.

  The API (and broken function) for this is:

  ```
      void AUD_set_volume_out (SWVoiceOut *sw, int mute, uint8_t lvol, uint=
8_t rvol)
  ```

  So this is supposed to modify the SWVoiceOut.

  However, if the backend supports `pcm_ops->volume_out` this does not
  work as expected. It's always as if you had called:

  ```
      void AUD_set_volume_out (HWVoiceOut *hw, int mute, uint8_t lvol, uint=
8_t rvol)
  ```

  *(Note how this modifies the hardware voice)*

  =

  In my specific use case, I have 2 outputs (digital and analog audio on AC=
97), and I want to mute the digital audio output, but I still need to keep =
the voice activated for timing.
  However, if I mute the digital audio SWVoiceOut, it will also affect the =
other SWVoiceOut (for analog audio) on the same HWVoiceOut.

  ---

  Old code - if the hardware supports volume changes, it will receive
  the software voice which should be modified, so changes can be
  restricted to that one voice:

  ```
          HWVoiceOut *hw =3D sw->hw;
          [...]
          if (hw->pcm_ops->ctl_out) {
              hw->pcm_ops->ctl_out (hw, VOICE_VOLUME, sw);
          }
  ```

  New code - the hardware backend will have no way to differentiate
  software voices; so any change will affect all voices. The volume
  which was set last on any sw voice will set a global volume / mute for
  all voices on the hardware backend:

  ```
          HWVoiceOut *hw =3D sw->hw;
          [...]
          if (hw->pcm_ops->volume_out) {
              hw->pcm_ops->volume_out(hw, &sw->vol);
          }
  ```

  The old interface was already broken with some (all?) backends, because t=
hey ignored the software voice, but at least the design made sense.
  However, the new design is fundamentally broken because it doesn't even t=
ell the backend which voice is supposed to be modified.

  ---

  Bug was introduced in cecc1e79bf9ad9a0e2d3ce513d4f71792a0985f6
  The affected code was touched since then, but still remains in 49ee115552=
62a256afec592dfed7c5902d5eefd2

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1882787/+subscriptions

