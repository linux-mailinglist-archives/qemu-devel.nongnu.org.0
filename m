Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACFD52BFBF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:25:33 +0200 (CEST)
Received: from localhost ([::1]:38732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMUO-0003TP-9K
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNE-0003jS-Gv
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:09 -0400
Received: from mout.gmx.net ([212.227.17.21]:45295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNC-0004Lo-GZ
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652890679;
 bh=515iPyuib44qiIORqPFpScFg3mZlZJlcueWk2kj4tkI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=XrOkU3d73HVcleJQX7o8i7ygiecTlazKrcYJ8UMlPNdEjmNNIsLKd8oF0RDJfXdin
 F53hH8eC0MFOyicEAR2s9qTitJoc/0SW+fuBJTNdbv+DK+BbTcKykN+I2LJOLhCKlI
 JXaKeuYfzDdaoC+Sb4qBO1jp70sWH3m57Br22GvA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.138.233]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sit-1noY7k0P2V-018Lwm; Wed, 18
 May 2022 18:17:59 +0200
From: Helge Deller <deller@gmx.de>
To: Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Helge Deller <deller@gmx.de>
Subject: [PULL 0/7] Artist cursor fix final patches
Date: Wed, 18 May 2022 18:17:51 +0200
Message-Id: <20220518161758.49036-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:z6hkTcnp6z26piSY0FCRjIqSNUjIDkbaM+nk0B4FSpnkPkWXiQg
 DryHMsH9xTN/bPQJZ7ciqkXJi4gz1sOSQbXabEmfigEoqOvjHhytaaDeCwkzThmy1qNMqAb
 kJn41ojiWgd8JKW8CcGRBEpEf+D7mZyuOQv6fxbmLtUCxKeBwhFklLz6BQQCo8tF6FCk0N/
 i6/smyZiBlam5SJPUVzWQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AotnITw5J4o=:i3+6dNUTW6d1FVD9S9Nt6Q
 /YjIxZ03IaH3W4Fp43A/06mn79mfho6YYo3WVcp+qbP20G+mo3Z1hl3cCmc6UJVzLvVK2U9L4
 a/lMhb3M1J8dpf+a9RmMvb7Ovnb9X0WZDfiKCxpalbEh2XxI5EujEwDRCP9Gh99FAbhMQ6s2M
 uyXXBkJvKWbfUEft6vqa9m3L3oCUO2cRjSVNYq0stBLEvFAcWt77YvIcsBSDjlbYo68Hu0GfD
 Phl1ZBIAcYeYOzRxYi4SFyQFBzOLnY9nvVKa4R/uAzjcQkacxt1FnM2eEs0Sno+7UcP9++0Sj
 5mKqPscxgBw/yTv1Fu7OYyV6nSXCyfasgPD7YuDp2tYNbgUgdIMXBCtL2//NPrvxlaHYL5fyX
 FdNtXSK0sUxFR4HNcBwj/McEewH/rwDvI9xhJD5TieRj6DhqKZV9hcrowIMZFWV83aMbncaPC
 oETG8rvfEwKyvAEgTRx8ori/4qqt3IcaHfTMpXOfL8xqHWU6MHQJFphI2ObUJVCf/D8+cIYtU
 8LBc9U6A0Wr9iO6OZFSNx++n/LyRiEqRriunTTcdK36pyP8YCV+ueqvQ4+aZgEZuTOZcXCdsz
 XnGjcuWH8vCl1hyY/H6a+bFHXEt/SgvCabqyCfBIkRVWBXkl96zztBzbB06ef/D36qVEqtjKF
 1oGkohaL5uDWLarcGbHaesM7rKLfl9YuoIXUR3n04dzDW66XEVs4b7bmoQG1sB1AOKobOR3dm
 0rXJANpYXT9z7XDbBI4ING3AwsrUg5w2OdIMZZUawEEmNrt0+1AjJQanittku/CPXpiqzgTgE
 QOfQK6Tl2tH/7GHn7Jlo9bX5+x1utQzfQu+TNPWWC2q28ckhYkB+jNIz8kiMPvIWD4L/OX+YW
 gVESt2500IPOec6eN2eRqHAYEq8XTmo8mUv4NfD9bZmxqkR9aPU1ozhpWDEa4bDI7GYoVsVae
 JpDttKElTntTxw+N0QhPTXyOjl3tgDkCvj+8b8rt+ItpvFVGmyYJnK+3F3x+vx7P6iiFjcTDV
 EUbIc5PsYLkPKKzXqTBLGHivhpVyuXHfNCk3xDbRdelDw6b7ZEHfryPJVgUXteqaA94zfLZ6y
 R/aHCJjrwY+/MMqCQALc6D2kslHsaLRkMwaBwCYPDQNohNTu69aaG61EA==
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 178bacb66d98d9ee7a702b9f2a4dfcd88b72a9a=
b:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into =
staging (2022-05-09 11:07:04 -0700)

are available in the Git repository at:

  https://github.com/hdeller/qemu-hppa.git tags/artist-cursor-fix-final-pu=
ll-request

for you to fetch changes up to 9ef2c6b4ab9a430ee230ee305b6994d7eae86fe7:

  artist: Fix X cursor position calculation in X11 (2022-05-16 16:46:25 +0=
200)

=2D---------------------------------------------------------------
hppa: Artist graphics driver fixes for HP-UX and keyboard fix in firmware =
boot console

This series updates the SeaBIOS-hppa firmware to version 5, in which addit=
ional
HP fonts were added to the firmware and the firmware boot console was fixe=
d to
accept input from the emulated PS/2 keyboard when running in graphical mod=
e
(serial console was working before already). To test use the "-boot menu=
=3Don"
qemu option.

The artist graphics card driver got various fixes when running the X11-Win=
dows
on HP-UX:
- fixes the horizontal and vertical postioning of the X11 cursor with HP-U=
X
- allows X11 to blank the screen (e.g. screensaver)
- allows the X11 driver to turn the X11 cursor on/off

Signed-off-by: Helge Deller <deller@gmx.de>

=2D-
Changes compared to version 2 of this series:
- Fixed style issues in the X-cursor positioning patch (noticed by Mark Ca=
ve-Ayland)

Changes compared to version 1 of this series:
- Added some Acked-by's from Mark Cave-Ayland <mark.cave-ayland@ilande.co.=
uk>
- SeaBIOS-hppa v5 instead of v4 (PS/2 keyboard now works in boot console)
- integrated artist X11 X-cusor positioning fix (which was sent serperatel=
y before)

=2D-
This series should apply cleanly on git head and can be pulled for testing
from: https://github.com/hdeller/qemu-hppa.git   artist-cursor-fix-final

=2D---------------------------------------------------------------

Helge Deller (7):
  seabios-hppa: Update SeaBIOS-hppa to VERSION 5
  artist: Introduce constant for max cursor size
  artist: Use human-readable variable names instead of reg_xxx
  artist: Fix vertical X11 cursor position in HP-UX
  artist: Allow to turn cursor on or off
  artist: Emulate screen blanking
  artist: Fix X cursor position calculation in X11

 hw/display/artist.c       | 168 ++++++++++++++++++++++++++++----------
 pc-bios/hppa-firmware.img | Bin 701964 -> 719040 bytes
 roms/seabios-hppa         |   2 +-
 3 files changed, 126 insertions(+), 44 deletions(-)

=2D-
2.35.3


