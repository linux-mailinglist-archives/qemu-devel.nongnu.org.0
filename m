Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D19C536C54
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 12:38:26 +0200 (CEST)
Received: from localhost ([::1]:59964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nutpw-0006KZ-L7
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 06:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nutgI-0000ha-Aq
 for qemu-devel@nongnu.org; Sat, 28 May 2022 06:28:26 -0400
Received: from mout.gmx.net ([212.227.15.19]:42595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nutgG-0005Xb-3T
 for qemu-devel@nongnu.org; Sat, 28 May 2022 06:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653733700;
 bh=n5MKBff6jaNg4gy7HPL1KKwf6y5HhmUMzzvredwSUds=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=NDibqGuqONP3gtR46eE5DpVR4qv7aNJnhR6KRVA35GuIxT+naY0pa+wyaN+JJADg2
 DCkfI3/bvEh0HcdekGf7f6xZrLvrpcme7Bh3Kh5V6lEFfuGC6M4n2aRefnaJ9zTY/S
 sSBKoRAi8kqDlKilquQeXNadknIdfCq04Qj8h/HA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.176.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGRA-1oE5Du1pAM-00JHxU; Sat, 28
 May 2022 12:28:20 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Cc: Sven Schnelle <svens@stackframe.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 0/3] Hppa serial fix patches
Date: Sat, 28 May 2022 12:28:16 +0200
Message-Id: <20220528102819.21983-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OpKthOCbbXDv0uH/KH3pFCDdqkX3uJ5WgNBC2ZJJ6t0I1Rz6ad+
 MboaSgngGXJJ2Rz80ZUZciBXuNnYS64DX5MkhFiZbonLnuO3j7cgu6HMOZQG7T3I1nFfw/1
 y73yo+MjLP8A8J7ElDqMvtuXw0JdBWHKXEtS3Q0wdSjCCGsNG4y3i8flvplUOF2q8Qvtmqd
 cWIfdybngkwCdQ7gR7AIw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o9HFsAaQHrc=:rgzgRbmhzgunSebqAOAMXJ
 1GSSYHiAh3xXO0dSZZeDqM/Kt971AeEFtSEoUdLCwjqo3XFk0bY6KZLQzD76M/0hmbnuSfADP
 VNygVRTCnsyW2aBy9ZT4swOGCEjyJM1XrIVz22e6LJez/JUz5SNPDXuZLb4qg1WJWoF/uiQWD
 zutLq3MXPCmWy+mKs0f8oRE+7571vMj/RqvVcLQoCBmx7jDRCDnN1mrDVipB/0J95ibA2sOCK
 zcyCA3S3qMUOLGwQGeLi/MsdY+X3i282dU/n2gMBgbzH15Bt37/+2tHLz/LiLycKSONkKE9Jq
 y/OKLkRaFrhlo6iqcQPuKq25W8TrDdcWEBwLEZsP4gsicC2ISNIc4GPHzqC1JPTJw2N+3ADkT
 syc72yCg/DU2kamOx/10+FyTc4CZLSE/f6WlLwdbjt/dLKqoQvm//YSWGJHHRfziUC96TD9xs
 x3mBFU2Cla/P5L7GUYg3xVYsZ54c+kXc4hoVFDXvIH5wol9f010HcZVmTOMhePtAKSGQGttWx
 GR/Dyrqp97GfdGg6m87kXr6KIvecRq5yJRML4e6pRabXZiuP2hEikNjBktSukclxNkkG66MQR
 pccHTbAPnSwezvojvpjIc//bFcUuMXAEylMoXRa0Lpw0Hd0ENUB94DAfElhsdYMFQyzCtI86H
 YGQThZb+HgbGcPl0jVTvbgBXghfY3tE2n55XL1+tWxQxpQYcVNpLohzgZlTysompVPFXtJEK1
 xBFzMhYnZ0PdgZwP+i/0b1VLUTqtZ8iLbUzv1aBfPDNDamVrQQsnMgDi2feKirqv5KjNb/uYK
 //2rdcCqCmi3PNM6GyWyhKMOkR7SRHimQQbvBrQKUifMMLsFemDZ34ejGkzfqERbopyq+bMpA
 wZv+sL12acCl/IXSX3xbI0cCHKg5mNZ52jMG2mhLXFGv3jI+dY63hXwJYwaTTU2nL+5szlOK+
 JFqs8lJ2HfvD0UTZlP2tkthNzPxxykaRNZdzb/z9kdU+O+Hgl7Vbe26pZfQ9KgCXeRFGM+LTg
 +C5P8vPUyPIpoUBz6fDIbDECyvvV2AE6Xo6QrDMqc32ze2VCntFod5C34cg2wpsi6mLXujJ9V
 sMCrwn1k6VW+pyLrcMmuy02frvrHMRPG9on
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
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

The following changes since commit 58b53669e87fed0d70903e05cd42079fbbdbc19=
5:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging=
 (2022-05-25 13:46:29 -0700)

are available in the Git repository at:

  https://github.com/hdeller/qemu-hppa.git tags/hppa-serial-fix-pull-reque=
st

for you to fetch changes up to 5079892df5f113c7f2b77f53bf7663f6c7bc6be9:

  hppa: Fix serial port assignments and pass-through (2022-05-28 12:25:42 =
+0200)

=2D---------------------------------------------------------------
hppa: Fix serial port pass-through

This series fixes the SeaBIOS-hppa firmware and the serial ports setup cod=
e in
qemu so that it reflects the real hardware and allows serial port pass-thr=
ough
from the host to guests.

Tested with Linux guests.

v2: Changes suggested by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
- Split out hppa_hardware.h restoration to an own patch
- Drop unneccesary checks for serial_hd(x)

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

=2D---------------------------------------------------------------

Helge Deller (3):
  New SeaBIOS-hppa version 6
  hppa: Sync contents of hppa_hardware.h header file with SeaBIOS-hppa
  hppa: Fix serial port assignments and pass-through

 hw/hppa/hppa_hardware.h   |  10 ++++++++--
 hw/hppa/machine.c         |  22 ++++++++--------------
 pc-bios/hppa-firmware.img | Bin 719040 -> 719368 bytes
 roms/seabios-hppa         |   2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

=2D-
2.35.3


