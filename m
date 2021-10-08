Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5D7426A54
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:58:36 +0200 (CEST)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYoWJ-0000HL-Kp
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJo-0006PM-Pr
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:40 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:45323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJi-00072i-7n
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:40 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N2lzA-1ml4Ll0joS-0139jC; Fri, 08
 Oct 2021 13:45:21 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] macfb: fix invalid object reference in
 macfb_common_realize()
Date: Fri,  8 Oct 2021 13:45:08 +0200
Message-Id: <20211008114518.757615-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008114518.757615-1-laurent@vivier.eu>
References: <20211008114518.757615-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZHt51d+LxgmjezZkjI8FOq+6UScoPtk0HBv16HnD30+HDt6jLrW
 Nw+54Je/+eoATco1G/jG8ifvirUppYM2opqhZVtF/DOhYT8tHxCf1W5WGoY2SXQAtI/U5qR
 EeIGxlS7iFAyx9MkhzERV6uxA1s8LKHhILdd5AqV7tw6FAS2tAnlZUjmMZLBqJO0ZPnwFBN
 CG0jaeId5j/3nitQ4JVdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tpyvMbSZOrw=:2u3IvYVpNyfShpWhpFxWP9
 VEVlJELHeUSlCPq2jQoJJAhgoLIqVFtszzZSiBVQVUAMTaTliL5DK4RRWBgf7el6KwjkUkAgd
 up7H43uhCc/Ffd0AWo0Wa9J9PvF4Mo/qDtMzunpBC5x6Qf3/2TNASnGSo51NHSgT18g0bNOyI
 asiRlz0o5TNue+eyJfjvGPpzMsjohhEO+iZAnjT+nDALJ5/vPIbLV2FXufkexbw9RP9ayh3sz
 oHR8JirPt1Edc88dWa6aOwMLxnoH6pt2s5YX4mvmVT70N2y5l+e5u6NCsFjLwK78dD52vbkri
 3hhsONQ49WQsuLUR4qwADWmSxKQ6JkdHMa4Kkk6XWS9uJmsNIlPVG1A17VHThAaVAbTSYBUV5
 QDe3JxRR9BSpVLl/uojY6JhQltA/ymZFWko7ihBumxXxttjSMkvOniDdiXxnhlXAMF7KBkYLA
 04Fyem9I45lf6+DvaZK6DI7PsfIVkF1IzyXqtWsEAAvoYlOfgAcV3rwvnHMQpEHMEEiHCMi/r
 yYsySjMJ0oJOTGBs+c8ukVQIxf/1+HWY4R3eNUNSNzQgmMCAh3yPiFfZHc8+FYaJM+kHlrSU8
 clXXpf6Ci6W28hNYTIUwqUErm0ChzbYl5I+28Jd76d1Y7XCawOCyuPtjNnuncHUAnlmb8bAM4
 9M/ErC64H9+OXyCmfQ68Te3Eqs31TnaB2+BhiUVTuJKbLdRw6j4T3Gmi78rM5xhIGU+FzYIY8
 azolPjhOEDRx01ZxV6EkNPtuk9bCxymJpCGLzQ==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

During realize memory_region_init_ram_nomigrate() is used to initialise the RAM
memory region used for the framebuffer but the owner object reference is
incorrect since MacFbState is a typedef and not a QOM type.

Change the memory region owner to be the corresponding DeviceState to fix the
issue and prevent random crashes during macfb_common_realize().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 8ac919a0654 ("hw/m68k: add Nubus macfb video card")
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211007221253.29024-4-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 2ec25c5d6f7a..b363bab8896a 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -365,7 +365,7 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
     memory_region_init_io(&s->mem_ctrl, OBJECT(dev), &macfb_ctrl_ops, s,
                           "macfb-ctrl", 0x1000);
 
-    memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(s), "macfb-vram",
+    memory_region_init_ram_nomigrate(&s->mem_vram, OBJECT(dev), "macfb-vram",
                                      MACFB_VRAM_SIZE, &error_abort);
     s->vram = memory_region_get_ram_ptr(&s->mem_vram);
     s->vram_bit_mask = MACFB_VRAM_SIZE - 1;
-- 
2.31.1


