Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096A4426A27
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:51:12 +0200 (CEST)
Received: from localhost ([::1]:53244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYoP9-0002CD-1I
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJa-0006FK-1f
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:26 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:41899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJW-0006vb-E0
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:24 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MXGes-1mGhLC0TCY-00Ykf6; Fri, 08
 Oct 2021 13:45:20 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/13] macfb: handle errors that occur during realize
Date: Fri,  8 Oct 2021 13:45:06 +0200
Message-Id: <20211008114518.757615-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008114518.757615-1-laurent@vivier.eu>
References: <20211008114518.757615-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jXSR2tl6XeQCaVMLGmYv7eIEdZkbzU6Prx4qMAgHWjReKdBO37M
 YWmv2u/D0AdBOFQxF4m183JKJ31a+tiugi/WpafU5R5ndum4+G/pzHdO+BKcOU9qCv1E9Tr
 RU0hh/XMvhQyzLUX8jjh2CB1+jX7tQgPxhkEZYtwANIihnWYypl6xh32RxLvrSToZ+ABVH0
 71BGtJjZ8ilwiuQTD9YEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hWsWAxG7GyA=:ZAIvpSRbFRvHW9GqGtUyZe
 Oie3lfRleuXCD/pE0sEc8eRCL0pP+fFSSbErHJ8CKu49bPuaCbn7kZkpvMTG1qAJfBjO8TpO9
 aYjp070AWDelEgKNAtLtcHvUiUfyVy2WNCNKensBKG3tZ7oZAaSuo0UsZJZ1STrb1sPZP5HCe
 YvHkcz/d9N4qio4PkmSipb55tU1OxZeb+ORLjyO+KPUSVSAFR8SUYof+MViKqDupaY2GLV8wt
 MLw2aKS2c62EepwpfYXpDzvgApKsUWLeqFKFK7A9Abo8Fy6Cv8YStQDDyaZUEHkl8w6hLH94X
 LXC1LckZo7jsJ48EiWgzWCcq6UKYlqijTnBo6/fflHXwRq9G2LbDUU0VOkx/iR7GpK5wwHj5R
 YaI4qozqiyEBs79nUBSiBxsUEicrmcnRI3ZZTNQ78B85f1tz6M8KstYaUC5cQr0U8rIneIfw4
 8WsjHAjbFV3lPQjgcWA9ItR6ZTIcUDFYWlYh5wqyKbAaRv1YJXXW/hD68BsdQyKAWGor2nBAI
 8FTOo5caD0zrED4jmoeqMRvYDuEq20T3UXeV3uBbDG4pGxIF4PEm7rT342CUgJsyOkIR/z9dk
 Rz13eoqwYUOlU/kP2FshXoZQtm3PGicxu3fMrB+fIfweYkkZgoDGUowxFEkDpb8bP5x8V8U6u
 uai33MUJr2DsqzmFqE1dlLIhS7lmX2gRpXfQBIqt2iXPqiEmaZuzszxd0nlISlVVqKtf8EnRm
 Pb5EWd4Kvsy70fBvhK4StgRGqRb+7NjcUckg/Q==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Make sure any errors that occur within the macfb realize chain are detected
and handled correctly to prevent crashes and to ensure that error messages are
reported back to the user.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211007221253.29024-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 76808b69ccc8..2b747a8de8a1 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -379,6 +379,10 @@ static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
     MacfbState *ms = &s->macfb;
 
     macfb_common_realize(dev, ms, errp);
+    if (*errp) {
+        return;
+    }
+
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_ctrl);
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_vram);
 }
@@ -391,8 +395,15 @@ static void macfb_nubus_realize(DeviceState *dev, Error **errp)
     MacfbState *ms = &s->macfb;
 
     ndc->parent_realize(dev, errp);
+    if (*errp) {
+        return;
+    }
 
     macfb_common_realize(dev, ms, errp);
+    if (*errp) {
+        return;
+    }
+
     memory_region_add_subregion(&nd->slot_mem, DAFB_BASE, &ms->mem_ctrl);
     memory_region_add_subregion(&nd->slot_mem, VIDEO_BASE, &ms->mem_vram);
 }
-- 
2.31.1


