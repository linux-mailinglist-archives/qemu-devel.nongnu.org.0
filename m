Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515EB536C50
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 12:32:24 +0200 (CEST)
Received: from localhost ([::1]:54738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nutk6-0002dk-Rv
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 06:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nutgH-0000hZ-Ui
 for qemu-devel@nongnu.org; Sat, 28 May 2022 06:28:26 -0400
Received: from mout.gmx.net ([212.227.15.19]:35585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nutgF-0005XZ-P3
 for qemu-devel@nongnu.org; Sat, 28 May 2022 06:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1653733701;
 bh=HVeGaZxOwMZMwq+F5Uw7IpysG33MCuqrKyJv2V2kh5Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=I/vdKnG67nTPSTwgiXh2fGa/9k4Ijvc1pI6RU4ItGT1OUmgKf1Ey89fl0B3bVTId9
 M6Y0GExzt0agyUN0Nfx31nU6W/Yk2GYIPVqXBQcV7xcA4oYGgQha2cVxwQoeeqQ5x6
 rjG8guVACNLD8lcaeNIwK4RwS7Uscv+JXEx5CATA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.176.6]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeMj-1oH3FG1S4J-00Vdth; Sat, 28
 May 2022 12:28:21 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Cc: Sven Schnelle <svens@stackframe.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/3] hppa: Sync contents of hppa_hardware.h header file with
 SeaBIOS-hppa
Date: Sat, 28 May 2022 12:28:18 +0200
Message-Id: <20220528102819.21983-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220528102819.21983-1-deller@gmx.de>
References: <20220528102819.21983-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BfjhiBck267W7YqHJssJzUI+OwaFzIww4eZuT+ONcOgwC3vrDu+
 afgoDdanemYWnHWoXv3ImfXBd1wNNveMaZWM+2fE58O3gzhDvs+P7kwAgufl2z3tgNFEb+y
 d1H7fOlLGa8kbQzeMyd8jJAxvTbTleaBOGrmT9baT9ofR33EIOw73Q2Qk7s1GsnklJxhZwC
 kg11kqNKyRKYuvgE3F6gA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9FhMa07RZKs=:5J+MP0iOx6ACsK3iXLgYm1
 tYenWa22G1l1Vx+wFQN0EU536skQnHJ2KBApVnfcGkv40Wb7osCFu7FFE4mbMMDXeEMzmsdpF
 sTWPU6WfRED63K1LvKw7R543tiRX40k4UEQZKoBvgGi7rMUnvlI0bjv5UY/qir9E7aKSpyY71
 zLh1LkTxzc7Obh+gitl4GrkoCeWtGogT/6Q/PCLCSkGMw3oGpwTbyzgw7jJ7bFwKL4SamW8bx
 RekUwHVYv34zUqb5mw1fE5uizd9BU1mfsKhMDAlNqLI7kpLnQ1fevPCiL0mpScdmhRhRBDx86
 MRM4+hggmulIB48stZAxu6vNsrQTpAb+pFJfZUFGEbt3KtB7YfaJEqAkhjaJdiR7k/0iqh4Ph
 0Q7C9zyAk0ccJ4sZlOnOtEPAKCAwR+zLwe+JuwHko4ffeycaGrexHeO5nnNVTpxFB+BMPZB+t
 2nneT+ruQ17APzZ+LfQjanTYdlJ+E5XNzsozt8ZQqIKLC+/ruUp9HpaB7wBVw0pxDzoiqlH4V
 YNw9GqZF8ZLipnWm7sHW5ySuNwTRjWwilo1ctSKAUF5WSlHsw4K0JqG5DrGHhHq2eCHCINBxf
 E22qVDkxAk4G2rjKTGIuKW6RA81jKK4ih8dMLz7kx4VPdq1vsuwmrTRy9gAr4szd9afwaQSnj
 n21No8AvZ0gLEKh3Xzqh2MJRXZjo4QonvLegpRH1LPMl7emVHjnGmHPr+0hpOEGAyK2K0Jp6V
 tuiNfKlf3ORT2/x5RnH/GWgoB/ihOe6nIbTKZlwF2Gz7cGiCvMOUw69ESwJO35dS8ibvpSmsi
 WUjo9aWujU/LCkKAw3HMIhI5XiR/IB7s+gKdPkWzRJp9LecPmFpqeNE9CocLsvtjrufLl3fdX
 s0Btwc7f7pLvIfb5gZLLkow9+i4FRySyKQJVRnDu9DqD9ULmOKWoTS0kuBh0is1hMHvXN6bpM
 tziNfQZptm3uzn3wtz/SUvYM1vPAXaZZ7DSyNXPpMg9JUruWQl0CCR9lQJmGrBR+s6BS1PYpM
 8wXguJXiGxvsMCXx96Y72D5jFpRrS3rV+ooFhHItKOuXcVf043n/OW8xJiu2wubdupO/mympa
 1MDgdlT+jmj1Q1UYYfgaxtvtQpMr9N2mxbVXMTIBkX9/HjY0iNvUesiAw==
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

The hppa_hardware.h header file holds many constants for addresses and
offsets which are needed while building the firmware (SeaBIOS-hppa) and
while setting up the virtual machine in QEMU.

That's why this header file needs to be in sync between both source code
repositories. This patch adds a comment mentioning this dependency at
the top of this file and restores some DINO relevant offsets.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
=2D--
 hw/hppa/hppa_hardware.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/hppa/hppa_hardware.h b/hw/hppa/hppa_hardware.h
index 8b6b9222cb..3f7627b98f 100644
=2D-- a/hw/hppa/hppa_hardware.h
+++ b/hw/hppa/hppa_hardware.h
@@ -1,4 +1,5 @@
 /* HPPA cores and system support chips.  */
+/* Be aware: QEMU and seabios-hppa repositories share this file as-is. */

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


