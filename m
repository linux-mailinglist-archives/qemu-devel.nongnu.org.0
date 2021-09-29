Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A4F41C1D1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:41:32 +0200 (CEST)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVW5j-00016K-CX
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtX-0001t5-UN
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:55 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:58835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtS-0005kz-JO
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:55 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MdvVu-1n4Iwo3wJS-00b1Gv; Wed, 29
 Sep 2021 11:28:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/20] macfb: don't register declaration ROM
Date: Wed, 29 Sep 2021 11:28:32 +0200
Message-Id: <20210929092843.2686234-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fO1KF190X96L4f9TCNnSKpiiox6qocmaX3JdYeq6Z4r3OJHIKjw
 VkLFG0NEZb3W4RapbqA0OCSdKqmJvTaF7FFoof08H420ahrh/zFCMHAJ6UWk0c+0MXGSzC/
 vW/m7K5q6UgXdT8MIFS+jfKibvT4oDgegtny0klJXv7ZvCEbhLMkDxsXZYZ++UbNlFYpPig
 OY72USbBwZ8FurUa3spig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6fdveRv+GOI=:LMYhG5YDCxpj6AB9ilvRv3
 tNJKULMUs1iZrc9pCwAL8TJQ/ouAt/W5WnKkjSa1TD7mb1AIx8sJT7ZSc0S/PwlQ43ZRy8c88
 X1U3lo1paQ5vU52SMWXafGRsqsjjT6SPxcqndOnsR7Q6F+dpIjYRTJyCcx3FcICUcaASUFe0c
 luqM91cr1N4DZDFQPQAbuPOsoyvJiE4wEC2LW80auWrGeGsX+8mlif79JLEP0tqT04Jrs2jsr
 rYgotVmXpLc+U/LIoETQdydLeGx+5TGpx+J5UtA1ast/5uU0aGAsuFy9q5y4sq1nWx6WU8YXn
 TRhip/lfCvZ8hy9zfK8ex0dNyRtukt8mqHqzgV/N0HnmN2VUgvzpDZbJZtWhxajxzXMOm+Qou
 Ojw177fuK4mQ39kQSEwCikY67wxak+wL/xzvYKOjVKfDj76BK8NjBlX5MnpU4/6Q+qUqniAfn
 /mifTmaRdU0MtFQCJUsUWtJf3S3WhQAloVKP4nKQ6g/d4qkzbrXZNwRrAgxIjiCabItonAqDe
 jJzds/ttLPWN6acMpEmEnStMBhGZmAvz1u81DUXFLkVM8vgx112aFk8tx4NfNKgTn1chIKrpy
 y4zt/UGmRh+dyG5kdQl69ywjORKZHvKl+wYtzI5rZofoLamFXRJY+aFFuTSUx0CW+Lvzfrns+
 0aLqGLa4JshrLDFc+ASoz9d58OjVi6yBVnme1dQreviZcYvENcjxMDxIygBQFltjdR3AkaylY
 y8lWP0CQOOROLt6Wi8MZWn3wYbaSsTyYR0h4Lg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
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

The macfb device is an on-board framebuffer and so is initialised by the
system declaration ROM included within the MacOS toolbox ROM.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-10-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index d8183b9bbde6..76808b69ccc8 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -383,10 +383,6 @@ static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_vram);
 }
 
-const uint8_t macfb_rom[] = {
-    255, 0, 0, 0,
-};
-
 static void macfb_nubus_realize(DeviceState *dev, Error **errp)
 {
     NubusDevice *nd = NUBUS_DEVICE(dev);
@@ -399,8 +395,6 @@ static void macfb_nubus_realize(DeviceState *dev, Error **errp)
     macfb_common_realize(dev, ms, errp);
     memory_region_add_subregion(&nd->slot_mem, DAFB_BASE, &ms->mem_ctrl);
     memory_region_add_subregion(&nd->slot_mem, VIDEO_BASE, &ms->mem_vram);
-
-    nubus_register_rom(nd, macfb_rom, sizeof(macfb_rom), 1, 9, 0xf);
 }
 
 static void macfb_sysbus_reset(DeviceState *d)
-- 
2.31.1


