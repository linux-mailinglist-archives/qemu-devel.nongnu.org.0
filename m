Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F3728E42A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 18:16:48 +0200 (CEST)
Received: from localhost ([::1]:40844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSjSJ-0008Gc-R6
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 12:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kSjHf-0002Ef-Q4
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 12:05:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:41530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kSjHb-0001mg-EQ
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 12:05:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kSjHW-000345-Bj
 for <qemu-devel@nongnu.org>; Wed, 14 Oct 2020 16:05:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5609F2E80ED
 for <qemu-devel@nongnu.org>; Wed, 14 Oct 2020 16:05:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2020 15:54:54 -0000
From: Daniele <1899733@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: gpu hdmi passthrough
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ghost82
X-Launchpad-Bug-Reporter: Daniele (ghost82)
X-Launchpad-Bug-Modifier: Daniele (ghost82)
References: <160265584613.29124.17763371645381472400.malonedeb@gac.canonical.com>
Message-Id: <160269089440.3027.2671956374101869995.malone@soybean.canonical.com>
Subject: [Bug 1899733] Re: Qemu 5.1.0-1 GPU passthrough - MacOS vm starts only
 if hdmi is attached
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="781851f4dc11c93bc506eb54e6a0d35c919a1ce6"; Instance="production"
X-Launchpad-Hash: 8cfd639d937c040c0316c02fe31236e8f3220f30
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 10:55:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1899733 <1899733@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, this is invalid, not related to qemu, the root of the issue is
with OVMF_CODE.fd and OVMF_VARS.fd from v. 202005 or v. 202008 stable.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1899733

Title:
  Qemu 5.1.0-1 GPU passthrough - MacOS vm starts only if hdmi is
  attached

Status in QEMU:
  Invalid

Bug description:
  Hi,
  I have a macOS 10.15.7 vm with GPU passthrough (NVIDIA GTX Titan Black), =
libvirt xml has path to vbios too.
  Qemu 5.1.0-1 with libvirt 6.5.0-2 are installed in manjaro architect 20.1=
.1 (two kernels tried: 5.4.67 LTS and 5.8.11 stable, no difference).
  I have two monitors, one with hdmi and one with vga inputs.
  Usually the gpu is connected to one monitor with hdmi, the other one with=
 DVI (on gpu)-->vga adapter, so:
  1st monitor: hdmi-->hdmi
  2nd monitor: DVI-->vga adapter-->vga

  With this setup, launching "virsh start Catalina" has no problem.

  If I detach the hdmi cable from monitor 1, I cannot start qemu anymore: t=
he 2nd monitor turns black, it doesn't seem it has "no-signal", but only a =
black screen with the power led blinking (usually a window on the monitor f=
loats around with "no signal" displayed when there is no signal to monitor).
  I say "qemu doesn't start" because in /var/log/libvirt/qemu/Catalina.log =
there's no trace.

  Detaching hdmi works with qemu 4.2 and libvirt 5.10, so this could be
  related to qemu update.

  Apologize, I know there aren't much information here, if someone can
  guide me to test the issue I would be grateful.

  Thanks for your attention

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1899733/+subscriptions

