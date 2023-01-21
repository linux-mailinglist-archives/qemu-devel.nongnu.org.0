Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA72367696C
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 21:39:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJKch-0002uu-5Y; Sat, 21 Jan 2023 15:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pJKce-0002u8-Lc; Sat, 21 Jan 2023 15:37:56 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pJKcb-0007n6-L5; Sat, 21 Jan 2023 15:37:56 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 548D67470AE;
 Sat, 21 Jan 2023 21:35:28 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2EB007470AC; Sat, 21 Jan 2023 21:35:28 +0100 (CET)
Message-Id: <58f599387dd0739ea1880bfb678872c0be26bf1b.1674333199.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1674333199.git.balaton@eik.bme.hu>
References: <cover.1674333199.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 2/3] hw/display/sm501: Remove unneeded casts from void pointer
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Date: Sat, 21 Jan 2023 21:35:28 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is not needed in C.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 0cbd1fecd5..1e17072452 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -868,7 +868,7 @@ static void sm501_2d_operation(SM501State *s)
 static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
                                          unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
     uint32_t ret = 0;
 
     switch (addr) {
@@ -928,7 +928,7 @@ static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
 static void sm501_system_config_write(void *opaque, hwaddr addr,
                                       uint64_t value, unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
 
     trace_sm501_system_config_write((uint32_t)addr, (uint32_t)value);
     switch (addr) {
@@ -996,7 +996,7 @@ static const MemoryRegionOps sm501_system_config_ops = {
 
 static uint64_t sm501_i2c_read(void *opaque, hwaddr addr, unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
     uint8_t ret = 0;
 
     switch (addr) {
@@ -1023,7 +1023,7 @@ static uint64_t sm501_i2c_read(void *opaque, hwaddr addr, unsigned size)
 static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
                             unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
 
     trace_sm501_i2c_write((uint32_t)addr, (uint32_t)value);
     switch (addr) {
@@ -1092,7 +1092,7 @@ static const MemoryRegionOps sm501_i2c_ops = {
 
 static uint32_t sm501_palette_read(void *opaque, hwaddr addr)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
 
     trace_sm501_palette_read((uint32_t)addr);
 
@@ -1106,7 +1106,7 @@ static uint32_t sm501_palette_read(void *opaque, hwaddr addr)
 static void sm501_palette_write(void *opaque, hwaddr addr,
                                 uint32_t value)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
 
     trace_sm501_palette_write((uint32_t)addr, value);
 
@@ -1121,7 +1121,7 @@ static void sm501_palette_write(void *opaque, hwaddr addr,
 static uint64_t sm501_disp_ctrl_read(void *opaque, hwaddr addr,
                                      unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
     uint32_t ret = 0;
 
     switch (addr) {
@@ -1234,7 +1234,7 @@ static uint64_t sm501_disp_ctrl_read(void *opaque, hwaddr addr,
 static void sm501_disp_ctrl_write(void *opaque, hwaddr addr,
                                   uint64_t value, unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
 
     trace_sm501_disp_ctrl_write((uint32_t)addr, (uint32_t)value);
     switch (addr) {
@@ -1379,7 +1379,7 @@ static const MemoryRegionOps sm501_disp_ctrl_ops = {
 static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
                                      unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
     uint32_t ret = 0;
 
     switch (addr) {
@@ -1457,7 +1457,7 @@ static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
 static void sm501_2d_engine_write(void *opaque, hwaddr addr,
                                   uint64_t value, unsigned size)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
 
     trace_sm501_2d_engine_write((uint32_t)addr, (uint32_t)value);
     switch (addr) {
@@ -1644,7 +1644,7 @@ static void draw_hwc_line_32(uint8_t *d, const uint8_t *s, int width,
 
 static void sm501_update_display(void *opaque)
 {
-    SM501State *s = (SM501State *)opaque;
+    SM501State *s = opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
     DirtyBitmapSnapshot *snap;
     int y, c_x = 0, c_y = 0;
-- 
2.30.6


