Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2A1403CA5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:39:52 +0200 (CEST)
Received: from localhost ([::1]:34464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzg0-0003ZD-2E
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbu-0003jz-0I
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:38 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:45137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNzbr-0003pJ-5q
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:35:37 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MLz3R-1mfnZk2X3J-00Hv7O; Wed, 08
 Sep 2021 17:35:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/12] mac_via: move q800 VIA1 timer variables to q800 VIA1
 VMStateDescription
Date: Wed,  8 Sep 2021 17:35:23 +0200
Message-Id: <20210908153529.453843-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908153529.453843-1-laurent@vivier.eu>
References: <20210908153529.453843-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ewZF2ORRbufnA7lHqAK+1c5tVQlQhRmIe4nNXrZEfdzOPuEPYMI
 62oS8G+zPQwpHCsWjyTXI8RYDhfF474lBsKvYuveAGLCS42eWddMkvpm2K5ynchphqXY3yJ
 tqZ9J5aoeWqJv4LawoWSuDOWsMI7BcCPspTtYY5tmyaqAL6+86Dxn6w6R846DZs/jlwHFyF
 kut4eR0WyMFjm2ZOAHXDA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/pOmEockyF4=:vsrI+kjJqAOxEoZPeJUvtm
 2STzrWBEKALWbS9YiCrtOPZ8BnlooJa9oZtQZmqaEPBggegdq6wca4fr62DW/zgbmyiaDcSX8
 bfd8Tzr9pi5nXAuiWONlKwE0p20n1CjhIzytLHvQpabdbFDgIUvDO6Pf0ZYagSfR+Dhl64B65
 NNybuJGHMTBiZGrpxkwc6fFtA+naLkhSqt2H10C3pJ0jAbU6ijUaVZPTYDHBzOg3ML51p6d3D
 B5MDMQ6e0dkFC/ipA1mII4AUTHKymQTh0+I/81Am74t2aGvTulM94L/To8VcJ3gONa1UyDD4d
 JvZqm8IUxZq9QucCVczcJLt5DTLIqb1CJPy1/RVPirf1QlhPa7dG8/qxcE4b6JntxZPJJJJek
 9Q5OZlKjTfQbWFoxedmGuzAiNiZ91cqb+PskmxTNm1axyxxKpjxa7MI3K1nmpooj13Hnm0EUs
 n3ih158L75elpxYLLmULtsdXPhr5sf7GMhmIdQiXR0taohHL/vVcg4OapEgfOlyXcmjBz22Uf
 BpQk5qrdCkT5eYPKlDdTelCeSNYx0UUjg5bmZ8FbL4+XiEqUn8lZK6c+mlJW5fEhx2/gK9Asp
 AC1mfbziV3lRYLf9u5SRRaqIeN9/xSowtQBbT1223zhn/sfBBdBM4mUl7wIUjzsDRM37TwvTl
 ll7lWvNecqFAArZHZKr9LiRLerz2wmT/GGRXwZlahWaNoA3Ih2a7L9pltdsAGHV/9Fg8SWw29
 Wlxgvpx2aVIftqk095q3QX2ICae17WvsqQgxKA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

These variables are already present in MOS6522Q800VIA1State and so it is just
the VMStateDescription move that is needed.

With this change the mac_via VMStateDescription is now empty and can be removed
completely.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210830102447.10806-7-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index b4a65480fdc8..47e221dd88cf 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1067,27 +1067,12 @@ static int via1_post_load(void *opaque, int version_id)
     return 0;
 }
 
-static const VMStateDescription vmstate_mac_via = {
-    .name = "mac-via",
-    .version_id = 2,
-    .minimum_version_id = 2,
-    .fields = (VMStateField[]) {
-        /* VIAs */
-        VMSTATE_TIMER_PTR(mos6522_via1.one_second_timer, MacVIAState),
-        VMSTATE_INT64(mos6522_via1.next_second, MacVIAState),
-        VMSTATE_TIMER_PTR(mos6522_via1.sixty_hz_timer, MacVIAState),
-        VMSTATE_INT64(mos6522_via1.next_sixty_hz, MacVIAState),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
 static void mac_via_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = mac_via_realize;
     dc->reset = mac_via_reset;
-    dc->vmsd = &vmstate_mac_via;
 }
 
 static TypeInfo mac_via_info = {
@@ -1150,6 +1135,11 @@ static const VMStateDescription vmstate_q800_via1 = {
         VMSTATE_BUFFER(adb_data_in, MOS6522Q800VIA1State),
         VMSTATE_BUFFER(adb_data_out, MOS6522Q800VIA1State),
         VMSTATE_UINT8(adb_autopoll_cmd, MOS6522Q800VIA1State),
+        /* Timers */
+        VMSTATE_TIMER_PTR(one_second_timer, MOS6522Q800VIA1State),
+        VMSTATE_INT64(next_second, MOS6522Q800VIA1State),
+        VMSTATE_TIMER_PTR(sixty_hz_timer, MOS6522Q800VIA1State),
+        VMSTATE_INT64(next_sixty_hz, MOS6522Q800VIA1State),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.31.1


