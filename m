Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96395287D2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:01:46 +0200 (CEST)
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcED-0000gI-94
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc3f-0005q5-E8
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:50:53 -0400
Received: from mout.gmx.net ([212.227.17.21]:41005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc2o-0008D6-U6
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652712575;
 bh=ZLQfRjcLZENeyIrPuhl8M+S4x9l1VC2wus+y3GGFB6M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=GR9bEkVCABvJotV+0IVk/wccsuhC18s/SL7nKapINHU6VX40zRq+cVjLx1CwbAl80
 ezFN1URICxcYFPhHWOpw2Rb4tR97XFEbq5AL6EaCNcunXvTxgVeAw/71H40nZ40cCF
 o0bzV8goVVhsez5R1ljwRe6Ms4X1Od7ojWSQjlIo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIx3C-1o9nqX19bu-00KOAC; Mon, 16
 May 2022 16:49:35 +0200
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sven Schnelle <svens@stackframe.org>, qemu-devel@nongnu.org
Cc: Stefano Repici <rs.rdp@zoho.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 0/7] hppa: Artist graphics driver fixes for HP-UX and
 keyboard fix in firmware boot console
Date: Mon, 16 May 2022 16:49:27 +0200
Message-Id: <20220516144934.36273-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y9wjHoHCM+N7V5uL2h/FTFNgexb10e0nS50KlQx3UOVFpfwboMH
 l93FGgn4lvhUGHb9x4rMZU9TgF85yHpLwn9bGAwWALZHqIsRSoUN5WeMZv6j90/KPeCEYRZ
 +ttsLWA622E0eORZdXnHouXvwQyvQlkYve5Hfh9NfSLSx6zbmxuKm+Gh/XCaruGwfHHoDwA
 yT7x/IFfhKDWRdDhHtlUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mum3qrzxbpc=:wu6O/S2y/o4Ku/RSiKPu+W
 /zXC6B2QVZkgKTQy2w0PPbmUAf1FpxufyD/TL2rrzbRsphvpgmEP98HEQpA6+be8AsdQTLHc0
 39bL2Ow5rxxo50htFPi0LW8CHyVZdoy7luyZmG0Gp0KM0UgXdLvEMLMIRRjwNd2NK4jOIeuUX
 CoFeXCzacd6VaqM3C6mfJl29IwrDu6IYQMbPzppNnGgvKBi89fQ5ZQyPOIlz4CGU5U86KWvdW
 Lf1zhIwYZqIqUm9vPmXogpF+afByS/Nwg/NhJkz9asmqay0ECABgXNZNpaUKLh5/FKiFXocEB
 sU3VzJ+yLCKMb1+b6vwhop3lwD4o2wPoIisIIcHFN1wXQBd3jw3d/nzOqiuXQLbOdFjB9S9Vb
 ojud8E80lhAnB34AdrviNjGg2bWl5uq6vlaudnwfif+nkaMUTWEnvLuXN4sSDb3+bvQNsKkfp
 +ONMfpW8WcgQj2S6eqq0ZUjQ4YdiFsujqI+P/RQM81WO0pMlm+plhxP/JXZi0dNmV5VeT6l8z
 WipOHby83WM8QXfDOmi74Q24bufBO6mZSwBeiXhI4C06h4vS2zkAoZEoICx7ozDLxlKm2Z+qz
 MdY1MjWpk3OqxQopG5ny7IK+PxpBJKjFcTtFIGdjE3URfxde4Zj4kXdvfi3ZtDJvmr7FiQJtr
 uYcpgADBlTaiBqSCm2+cqM2VGV6fnE4oaI9+odNYs6HEaFQa/569iTrBLf/UumWS0grDpxUrg
 19xjz73rXcT7yXynGElpzMO6ApSSgibloFrvBosSlXMk7ctR25JVlvOhHupCXq2l6nswNDyhR
 MmH93VwSnXTGKv8PQx4420lGSAbyuydykarS/ZGvX8Y+vh3WIafugGp4KqfI5ExO3xgIjx6JH
 pdhidLMz1ul/RtqCCmucvnzDRLGErNrJLQVFeKSqOLhMZmAQIHRZAN3M3ZXlZfcaUAhL+pd8/
 4Qaxht6rybmnouXjm4o8AKb/zATpqxbt8o7/+F7sKZnv4dBwz51aY3Ju5snSSgFP0MdtF8T2M
 gxe9I/3dzc7JnHqxzfgUQ3JSA/0XJdwHLbC22Ey5/oVFNtNzsgZo06RSh4xXRxs8XCHHSUKAD
 QTnKjn5L3nMN3c=
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, SPOOFED_FREEMAIL=1.522,
 T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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


