Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9823233E089
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:32:00 +0100 (CET)
Received: from localhost ([::1]:56800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHIF-0000ir-N2
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3U-0006hu-Rw
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:44 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:60999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3Q-0003xG-EW
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:44 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MDhpZ-1lWQBl08Gd-00Aq8y; Tue, 16 Mar 2021 22:16:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] mac_via: fix up adb_via_receive() trace events
Date: Tue, 16 Mar 2021 22:16:26 +0100
Message-Id: <20210316211631.107417-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210316211631.107417-1-laurent@vivier.eu>
References: <20210316211631.107417-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RqkzY2UO+eeyo6LUXWcwef52WykYXSf3e8jajeY8v+hw/SXfDhv
 CpKUiwC5WSXS+A96hnJN7thwpOCM9uJ9T8tQWAGaKXaQ8+qm8BmPvzSlMRPTOBaigm0/M0V
 MG4wPUkSsypgFuVtlGBkfpqreTnmmPjEDMYIuMqVkJIJg6ObgHi17aQdLmC+j9X76kStGJ4
 +TEAmKWNhyZllosVoruQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hd5sFF52uR8=:5Dc+ie6UxHtUmtNWlkgGe4
 X3Z/DntkKWCHa4/Pby/ol2r0+8tA32dtfbri8q6nIFtLOANuq0C0P1OLSjfl6z8hPzqbzVQxS
 I2ToHdW8ZOnlnCMTesKPYX8xLHiiEWU0w1mfZQ0sHjhYp8QyZ4UUCAPQMZpM/ct0CUPtfecV/
 IxFEMaf5t8FVTGvdwoO9mC3Ujzjsp1BkkZ/BXLz+jNYWn6UUW/GSYBHQLmog7/q36l4K1LrSN
 XHROH+dldd958MkmOHk7pCF0Na5mfMzVAPvlosEfxitwQsZJK1DBCVtNRnW1Pzxg7FzYqfT6a
 L38QxbDxBdDbOUiP2miuz+UtcHjZcLZzvLdOa4u4nL6qE21loCoNlKjgL9tDjpStv7TXNDbKx
 vnJZVPaxIAigegTOnldOVaZMMUZAJqTZvfvzPag2D006znUobC5QbYPA8j5+t665XoGjR6mjH
 WIPefpO/uw==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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

The use of the post-increment operator on adb_data_in_index meant that the
trace-event was accidentally displaying the next byte in the incoming ADB
data buffer rather than the current byte.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210311100505.22596-3-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index ca2f939dd588..0a25de577cf9 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -816,33 +816,37 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
         switch (s->adb_data_in_index) {
         case 0:
             /* First EVEN byte: vADBInt indicates bus timeout */
-            trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
-                                   *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
-                                   adb_bus->status, s->adb_data_in_index,
-                                   s->adb_data_in_size);
-
-            *data = s->adb_data_in[s->adb_data_in_index++];
+            *data = s->adb_data_in[s->adb_data_in_index];
             if (adb_bus->status & ADB_STATUS_BUSTIMEOUT) {
                 ms->b &= ~VIA1B_vADBInt;
             } else {
                 ms->b |= VIA1B_vADBInt;
             }
-            break;
 
-        case 1:
-            /* First ODD byte: vADBInt indicates SRQ */
             trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
                                    *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
                                    adb_bus->status, s->adb_data_in_index,
                                    s->adb_data_in_size);
 
-            *data = s->adb_data_in[s->adb_data_in_index++];
+            s->adb_data_in_index++;
+            break;
+
+        case 1:
+            /* First ODD byte: vADBInt indicates SRQ */
+            *data = s->adb_data_in[s->adb_data_in_index];
             pending = adb_bus->pending & ~(1 << (s->adb_autopoll_cmd >> 4));
             if (pending) {
                 ms->b &= ~VIA1B_vADBInt;
             } else {
                 ms->b |= VIA1B_vADBInt;
             }
+
+            trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
+                                   *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
+                                   adb_bus->status, s->adb_data_in_index,
+                                   s->adb_data_in_size);
+
+            s->adb_data_in_index++;
             break;
 
         default:
@@ -852,14 +856,9 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
              * end of the poll reply, so provide these extra bytes below to
              * keep it happy
              */
-            trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
-                                   *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
-                                   adb_bus->status, s->adb_data_in_index,
-                                   s->adb_data_in_size);
-
             if (s->adb_data_in_index < s->adb_data_in_size) {
                 /* Next data byte */
-                *data = s->adb_data_in[s->adb_data_in_index++];
+                *data = s->adb_data_in[s->adb_data_in_index];
                 ms->b |= VIA1B_vADBInt;
             } else if (s->adb_data_in_index == s->adb_data_in_size) {
                 if (adb_bus->status & ADB_STATUS_BUSTIMEOUT) {
@@ -869,7 +868,6 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
                     /* Return 0x0 after reply */
                     *data = 0;
                 }
-                s->adb_data_in_index++;
                 ms->b &= ~VIA1B_vADBInt;
             } else {
                 /* Bus timeout (no more data) */
@@ -878,6 +876,15 @@ static void adb_via_receive(MacVIAState *s, int state, uint8_t *data)
                 adb_bus->status = 0;
                 adb_autopoll_unblock(adb_bus);
             }
+
+            trace_via1_adb_receive(state == ADB_STATE_EVEN ? "EVEN" : " ODD",
+                                   *data, (ms->b & VIA1B_vADBInt) ? "+" : "-",
+                                   adb_bus->status, s->adb_data_in_index,
+                                   s->adb_data_in_size);
+
+            if (s->adb_data_in_index <= s->adb_data_in_size) {
+                s->adb_data_in_index++;
+            }
             break;
         }
 
-- 
2.30.2


