Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E94C4372B9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 09:26:58 +0200 (CEST)
Received: from localhost ([::1]:39818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdox7-0006R0-Jz
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 03:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdoni-0000xZ-PV
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:14 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:47901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mdong-0003If-4d
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 03:17:14 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N9MYu-1mjMi81Bqu-015G9q; Fri, 22
 Oct 2021 09:17:08 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] q800: move VIA1 IRQ from level 1 to level 6
Date: Fri, 22 Oct 2021 09:16:58 +0200
Message-Id: <20211022071705.471954-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022071705.471954-1-laurent@vivier.eu>
References: <20211022071705.471954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:w3YxJZTldH0m1Nv+6KJvNRJNTdFv/fmiJZaHWmS7qy046Zcr2DK
 XDAu2iZYEGhGDxxrkG8KztMfA7H2+xnWU/yJyM8S7nhltc0lXBV8FdkGhoyDqwRm4ym/gwb
 rOGbrgN2iLvPVXYaqi7XcUu8Eaur6NyanAxUIRZjk81UIS8DSlNBVx+u99U8il5LrEZX5Yb
 HmRvQBMkiMDeOvtkq53aQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3nBmAuPvvOU=:LMx04FS5/NqLt3I2gwxIDV
 mkrH8ZXXtZKwzfk7RdiijjXBl3U0XT/HAqCI4MWguGFGC5yc9Xzhr/ItVgHR/3ia4/t3ehijY
 G7yMoIsRDwdi3CnLl9lpCulAlGa744vO8mCFAGaz8uB57jvwGGSSSoAjK5pFEZIJiTav2tVRp
 x06PO6x82KUmHnZ2JnR8mPpY8y2HBH1NRjfxf56LsQUav0CtfF53Xinaa9Ym6J/bFlfbgNSFq
 W4ioVvVbpabMkaTQAoOIVA5SqlJvbf/ggP7a/oTABn1amxAfjOMlV4t2eDlTIlSikcu2ZAPat
 t05toFLDvkdaqggMEMZDftNDyvIVs0uGiRVwLQa5zGiwXiDFUEyxRUgOqHKmnNUYwvxnrRDU9
 YRceFo5xKavv9FjxuUnznES2yeHERM30MYtG95fSbxng+jHFezYx33uNfqgAUIshAqEcA2WjW
 kor9gbe7Ti5HSVXosEVwdxex8kNxcEWM1XZtcnnWmJwt/5LEZ5GDAqjMYt739S9wQmOJA0lhe
 MocImSHFremA7Muno2exSIC7/fHucyQEdYSWmTfbDzv05S0Z0s9XyFXqvnIXlOCELy/LorF2P
 K/88C3nCiqHzzV3B4tbHJwdChs+zrMa0wM3WP7yltwTQ/eTNVj9wn4gmZg/E4I6Ko5ZW3GzzI
 vYew4Suo0ItY9tReAirczum5STIYIk1ATWoJEfZMUwA+21BiYr8OLNnC9apKLPFwg3HE=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

On a Quadra 800 machine Linux sets via_alt_mapping to 1 and clears port B bit 6 to
ensure that the VIA1 IRQ is delivered at level 6 rather than level 1. Even though
QEMU doesn't yet emulate this behaviour, Linux still installs the VIA1 level 1 IRQ
handler regardless of the value of via_alt_mapping which is why the kernel has been
able to boot until now.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211020134131.4392-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index fd4855047e3f..15f3067811e1 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -284,7 +284,7 @@ static void q800_init(MachineState *machine)
     sysbus = SYS_BUS_DEVICE(via1_dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
     sysbus_mmio_map(sysbus, 1, VIA_BASE);
-    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 0));
+    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 5));
 
     adb_bus = qdev_get_child_bus(via1_dev, "adb.0");
     dev = qdev_new(TYPE_ADB_KEYBOARD);
-- 
2.31.1


