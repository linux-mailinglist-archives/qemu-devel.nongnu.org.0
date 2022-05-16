Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D778552873F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:39:29 +0200 (CEST)
Received: from localhost ([::1]:39392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqbsc-0000Qy-Vv
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbir-00038D-1Q
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:21 -0400
Received: from mout.gmx.net ([212.227.17.20]:47197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbip-0004w2-CL
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652711348;
 bh=qqRk+pTcekvEc0V91PCnQozwBwYigA44RqU9Oav2lbI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=W7nUKjJiFJP2UHZQ9HPTh15w7G7u9NsSQPCa2aWNHXqMRCwTI3RuQvkBHSI5vKCxm
 kx5NQf4X+gd5YOV+7nNm+lkQADsWSLoVWx8oqwsfHpxF9O5l6hjgBEx/TfdYHzj1zm
 6xzRH7pRt2DPEIzg2h1EL+wzSNNH3gTx/9QwoYcU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VD8-1nnvri1bII-016tV4; Mon, 16
 May 2022 16:29:08 +0200
From: Helge Deller <deller@gmx.de>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Helge Deller <deller@gmx.de>,
	Stefano Repici <rs.rdp@zoho.eu>
Subject: [PATCH v2 0/7] hppa: Artist graphics driver fixes for HP-UX and
 keyboard fix in firmware boot console
Date: Mon, 16 May 2022 16:29:00 +0200
Message-Id: <20220516142907.32827-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Gg8MuWSf+M8aMztsx14FkhA7KWnsGiIp4Wmwuyl/QqI65Ew66T6
 cry5s6SOv2ScMTK+wkLEx5GDFp6aBKDVsbCr8sZlAm5sMqXgDZs1km715LCMoFC8VD52iyJ
 t6nRdeBl/gdctjA74YvmQnbL6M06OoIfolkhLTrZPww6ajG3yqmcX738vcI6nByZbjlRYX4
 aP/oTbQELPHRTH9yxfRFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P9w4PvgzdJg=:4YPVVelvg/7R3ICDFX2yGg
 Ysjv08VvPMtYxu9bx2nrb15RW67PAA5z0tErnOAvCbDeNA535kkmFloIjye5zkdq01taQcMuo
 6/aW0iNp0kryfpA3q9ZmqiVZk22XrXxZvmRlhgf2H0CmHU5dE3abVIg/T1Mzr5wAdR7pW6viR
 lPwlc4nqBGUe1dmSnB3m2wOps+sT4BPhshqslVwSgvZupZDuZhuoVTNvCJi06ZsNPwDCT0AQX
 ekt4Yol90DeYycJgsbdDuezb6NkAEGVTHrM20FYpXWGwIkGW8takW3yydg1FX7ApDlw+O/VmQ
 TIoKitCtpb0pCbiBp16C52pp1DM8jTi9AoDP1jBaAH5bOu/3FUN4myLDQfIwj6BpaHKbhJdam
 xtIX8zi8DTLwgPr9j1XD/BiOai4eTobGQRCRMno8nwV/epI+FKR9j+QWC+Uv2A0ovGnXz8yYl
 H7FWqkNuCS/rclBsVBdBBy3c1K5ODBukQSgNlvAdpopKJ/NfLeMPIMLFxuI1zxQUMbKRsU+8+
 46+O8jvrzBv1kLlEJOBPT2R9RLYEpXNu5g1aJa6K/Ut0zlqLELbVR+f1xT4gCaFRB1SJHm1RS
 AwJfof4bW14hG00GBqdXw+1SQKC5hVpSgh2eoJFV5aFeNn98evax6IEntVILYiWO/abPJgz5Z
 EAlOMQbT4kJNnnlsefLV62bWm3ZB2NG+EQfidxd88vFxdnNy48dqop8AZFzxwdHWE56TW8AP4
 c6xJ7PGerOsH3vW6YtFM+C42A8JQYNWw9pX8sK+59XydTnaHh0kS0E8ifbWUEnDxyny8vK0sz
 LyOtUWYejgTP+jpwB45WDK9LG+YTRlErAEWf7eFnEgrgM9EoNbB0AcuQKh8U+a7lPbBqzovWK
 YOQtjuY0QytXflLE78+SUw2xD3BJs4/0mhya/Lo9d9TUUbyAARWpqD3tCLJPgGhFKVn+62E4r
 WsSU0ZJAmP8djyAdwoSDd4EUVqhP4yvqHrhMxnxT3FSyzU6TGy/RdTT6YIRU+jfsPBAkagMAK
 Pyq6BYrNUWnXfC+xMgJmPQk349caWN0sh71KKnesxSWtT4ytX7AG+O56wfh0uHU4Ymu3h/oWn
 PZRq3k52XhnOCHzbqyJSL/BU/LMNA2gsbgF
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
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

 hw/display/artist.c       | 167 ++++++++++++++++++++++++++++----------
 pc-bios/hppa-firmware.img | Bin 701964 -> 719040 bytes
 roms/seabios-hppa         |   2 +-
 3 files changed, 125 insertions(+), 44 deletions(-)

=2D-
2.35.3


