Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8E1524138
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 01:54:09 +0200 (CEST)
Received: from localhost ([::1]:33838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1now9f-0005Bw-N4
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 19:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1now6s-0002X6-V4
 for qemu-devel@nongnu.org; Wed, 11 May 2022 19:51:14 -0400
Received: from mout.gmx.net ([212.227.17.20]:37859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1now6p-0007T9-NA
 for qemu-devel@nongnu.org; Wed, 11 May 2022 19:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652313055;
 bh=SEtWh9RP//uT0KBqZe3pdI9ZZ4I4FVDLeSw4FQxo8Ak=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=EvY+DWZ2xZ3SRxf0VUCCTad/AmOaXMuvXAEj1O4jcyoK3n3OkGv+wU3eFfwBPGEKA
 K+ANHHjbY1645iu45RFs9/Mqk3DG8lxJa+3A6vMSrNA1e9hhT647y4tDbVwg2/7KcG
 1B/e5u/+ZZyXrp52MZVz4TRsHAQb0moQfnaWsU5M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.141.127]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2f5T-1nmSC802jX-004EQd; Thu, 12
 May 2022 01:50:55 +0200
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 0/6] hppa: Artist graphics driver fixes for HP-UX
Date: Thu, 12 May 2022 01:50:48 +0200
Message-Id: <20220511235054.185435-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1GByOu59JJev7wQTthBycm3+KCeXCz9ZsHRo2/cJ27b8Y2Ovjs7
 z4ciZsZ/sGJq32g5NfYdtbIi3OIRRV/4jvR6pAGVjR35K258FaFm5d5fBaNIt4icMIbQdl/
 O93JYku/7+nnBT92NnRmSjhMYk0HaAL5Ym97PXuTah/VVa1E5sf6MaUeJpA8LZdcYrAkMX/
 k1mrUR4PECWNkRrQKfweA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6NQD0WxlEjs=:oa4J6MOH7zqYd41ungrT9d
 aQKDimhcXTwi4hLvqZmBRLLIBflHaM6MQV/EeLh4FPisi1mi9Xpbx7P5PxciU/bC0vk/BYyxT
 LcI+eXEfEo7pITjSYHU+3P3+VyEDZBcNFNhKbClrYVbZdALRzotQ8ZIAkjvOxUsehkF4vPcCo
 ayOb9O3yr5UU1tHjwM5uByrNi/WmvvnXUn8RdaQKxsQA4dIaLJq+7aK+BRdBjPAdaIugdar7o
 WyQ330QSlIl5hiktpBnqMYdTJ3ftHg24a1Eu/J8zzrEvez/wjLoOmgArId2f4ORgOsewnEjV7
 E9uNWd9ZTCKjgr2c2teBEQl9IBZnvC7MIJv6NtmvLuUxb4Z7Cqgit+/g34RbnvMwdkc/BEem3
 YZacX1oL8oyteSTQIXYN2ZRFm4r5ioOVLrD7vjrIw099t383YKl7y3hzXonoC0f4XLk7D4rxd
 +zSRNQQF5Ewf+CA/4N3BJoGT8iwHEidHzSZBd6QXykpXIQE7iA4K1X/FU8rhwp+BsXZwm8UcB
 YRxME8MMoz/giQsX3R4Xcuu0cAq7vVujaiMx93XX2IJ3XT1iApxMlLkDawa5YCaZ/0C+Wox9M
 kqIzcS+7Xn6vxg6kix4VZkUW++YJkOhzwRefPabRI/q2YxoK0XJENM9ubm81atw18r4NlYs+/
 w2TO1UN0qFyvFfgEX3dSzhsFzWu8WvQFl6pG155uJvrIIowaX5yV46fqI7ZJ8KG+19B1Hltg+
 JaZGeSCajKvRwznX5TrthYj7meE32PIstXIHa6G7D5M2VQpctCxCutAtvXeDf+KdEh6y/shjj
 yhRvLV5ywYRMxeQDZIYj+ndUQwl7qhbZ4Ym1LwzEUs6LhCDfSyDBWS5w0LUvh15ukLyWeoN51
 n0ntPb7vZ/1uhIDS3wuEhMfmda9A/0nBxaEadJuSDVMFAXW7Suiy4TrrA8clDW71zzBIsFuXL
 oJrd75kmAmO02ifJ6PhGFDhvG0l/R5gAi9bPBi9Vy2TvOn568aAZw/+d5PPVJYGvXdKAZS2cK
 SGP23rMdNyqMBDqLXHz3e7d+IolJ4kEoxGwMYr3Ph6ojK8ATCiias7wUJVYIxfvSJiNHo9vZk
 lEITL4lkF7Lpnc=
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

This series adds additional HP fonts to the SeaBIOS-hppa firmware.

And in the qemu artist graphics driver it:
- fixes the vertical postioning of the X11 cursor with HP-UX
- allows X11 to blank the screen (e.g. screensaver)
- allows the X11 driver to turn the X11 cursor on/off

Signed-off-by: Helge Deller <deller@gmx.de>

Helge Deller (6):
  seabios-hppa: Update SeaBIOS-hppa to VERSION 4
  artist: Introduce constant for max cursor size
  artist: Use human-readable variable names instead of reg_xxx
  artist: Fix vertical X11 cursor position in HP-UX
  artist: Allow to turn cursor on or off
  artist: Emulate screen blanking

 hw/display/artist.c       | 134 +++++++++++++++++++++++++++++---------
 pc-bios/hppa-firmware.img | Bin 701964 -> 715240 bytes
 roms/seabios-hppa         |   2 +-
 3 files changed, 106 insertions(+), 30 deletions(-)

=2D-
2.35.3


