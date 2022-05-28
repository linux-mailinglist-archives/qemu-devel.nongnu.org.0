Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1F7536C0B
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:45:57 +0200 (CEST)
Received: from localhost ([::1]:52842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nut1A-0001SZ-5E
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nusx5-0007my-1R
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:41:43 -0400
Received: from mout.gmx.net ([212.227.15.15]:36355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nusx1-0006lY-Li
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653730896;
 bh=JYtAlOLmaih7hGbg+Gd5FRpraj7Tol897LEhZkZ3LMI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=DI+p8g4NaFba7NuOMY7jOXm2vGmfvNJycHIx2zrOVb6MDtlDx1wuZ9yh0mDJWy+oG
 worlmFqk9+zM0HDO9lSNCUPpfzYVkQHZsjEUC/mEXK6M8GlMZ+IwgSlovY3w17dub8
 Sga0/nIP6SVDKWT/TPjF/VjPgMr8ytxYC7M3uKmI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.176.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MowKi-1nTlg142ec-00qUKf; Sat, 28
 May 2022 11:41:36 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v2 2/3] hppa: Sync contents of hppa_hardware.h header file
 with SeaBIOS-hppa
Date: Sat, 28 May 2022 11:41:33 +0200
Message-Id: <20220528094134.16513-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220528094134.16513-1-deller@gmx.de>
References: <20220528094134.16513-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7PShTDDwmDOQnGWS2MaEM1UGtvkPAT6n/oq7gox5qjObOdmVD/u
 sSMk4+9g55rF9MhThJM9/9oJ1pS/B58SHu3uirJt6VuNW8iE7ACq0E5UoWcmoYyBEY6wdan
 Kgs6rkf7ZxSguyr4RWm43w5FA6EaASqU8Dh2YRXOIB+6b5PppywcRTfkCluwd+VaKRqZQ2m
 Ehsu5g2kCTMdfFexSr11w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DhRqcJSBQDM=:pYHC4qfSBa8vi/eI5KwJvr
 pUTWozyDjeIZSIWieel5Lo3qN6BbyFg3j870SXnKJhH3CN9+y3ejtGoPnggqtT4/oVuK+Jqe0
 xOB3S0NpgPeU8z0FPMBGCLUlcoo0AKT4tfGsBiwh8D8GCpugSue/lwfvvxpZnUmVxoYBSc+hb
 ZsC8GKsvMIL06OTcf49YAYrRWUrZHU7oJSC5MMBS0/tsREi8WpQP3pyUej7ONuCLHMN3pGSVc
 6WBB6dTvbrdoQRyfL1UVx0h+mEa3jtPakoX5KOnZgK7pVIcP4loCh3uZanXtVBhA6lvjrA70o
 HBXcCjKnAypU1aDWb1GYsbUQrVQUkuHfTub1JJpP8zeoa5hEpJOczb1TcqW5TJCTjzVK6PSqP
 YQ45W/hvSWb8G6BxiYMGBpw+9E9UGblD+exFYgeWTG6EdU44fkcagf3SU/1Fy1+CBGZPv0DiU
 rC1eMONqWEfuLFbuIrhWWY5S23rrwhxX61qMkth9BvRMnhAYcBJtkPKWtRJal+i4vAQvu7Gvq
 TIeA7p/NOhdpKx+LcQjitTWgLpu5uXY6QXozEmmzjV9BoHVZyaVDQaflc/Qqvh5hnB8aTNeVs
 WKwhMPnqpvV0elNwp2DD47aGsXhrza0FZJOsOz1sLmN849+jp8XD0QFvHm4P2raUw899XJYSQ
 WlB35gkneRuKeAHcMErXNs9y6RAtEJ4t/irVHD5Gu1gE5NOFOjPA1qGZbeVzr9AOSfC/PEN1H
 aV9wMCkz49vOEwTy1yrueZsa5GSwY7FLgZG/QzVg4wBQBBJTaM2vxB0AxL7dxu9XOL/HlSIgc
 Vi50hgU5UeA2rKemXzXKkSdvb63mI7Dv9dnXOxA6jPV6FC6UaJhsY6cfTzJrCDNMt9Ms83hlu
 BfMVJlgK3Lu8R2gdd535NelK78JP1rE+hcEzTH5hQZ8Lu1kooi7MFV5L1hDuTJAueLyP+fdE+
 lSbclgKAS1YRIDGhz9DYsWOzth3YiewugCF767CFynJPYjAkNs1ZHJoGeFD3b6rSLLwGcbVR1
 mlpQOlJ2n4KvjcaO7fqVHg9pVcVLY4vHOWBqwkoWPtyfItC/A3IbXHGoLZQbkUlUnE36U8Ie9
 hcLvng+KHxLVi6gGcWleiodtCnLywnMo6AGpaZ0J0bTpmfFmVouxXLvkg==
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
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

The hppa_hardware.h header file holds many constants for addresses and
offsets which are needed while building the firmware (SeaBIOS-hppa) and
while setting up the virtual machine in QEMU.

That's why this header file needs to be in sync between both source code
repositories. This patch adds a comment mentioning this dependency at
the top of this file and restores some DINO relevant offsets.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 hw/hppa/hppa_hardware.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/hppa/hppa_hardware.h b/hw/hppa/hppa_hardware.h
index 8b6b9222cb..37bafff1ed 100644
=2D-- a/hw/hppa/hppa_hardware.h
+++ b/hw/hppa/hppa_hardware.h
@@ -1,4 +1,5 @@
 /* HPPA cores and system support chips.  */
+/* Be aware: QEMU and seabios-hppa repositories share this files as-is. *=
/

 #ifndef HW_HPPA_HPPA_HARDWARE_H
 #define HW_HPPA_HPPA_HARDWARE_H
@@ -30,6 +31,11 @@
 #define PCI_HPA         DINO_HPA        /* PCI bus */
 #define IDE_HPA         0xf9000000      /* Boot disc controller */

+/* offsets to DINO HPA: */
+#define DINO_PCI_ADDR           0x064
+#define DINO_CONFIG_DATA        0x068
+#define DINO_IO_DATA            0x06c
+
 #define PORT_PCI_CMD    (PCI_HPA + DINO_PCI_ADDR)
 #define PORT_PCI_DATA   (PCI_HPA + DINO_CONFIG_DATA)

=2D-
2.35.3


