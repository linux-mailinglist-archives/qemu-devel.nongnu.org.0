Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B16651A433
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 17:39:15 +0200 (CEST)
Received: from localhost ([::1]:58344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmH5u-00019t-2L
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 11:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmH48-0007Zw-FP
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:37:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmH46-0008S4-UY
 for qemu-devel@nongnu.org; Wed, 04 May 2022 11:37:24 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmH39-0004bM-8c; Wed, 04 May 2022 16:36:27 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: deller@gmx.de,
	svens@stackframe.org,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 16:37:06 +0100
Message-Id: <20220504153708.10352-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504153708.10352-1-mark.cave-ayland@ilande.co.uk>
References: <20220504153708.10352-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 1/3] artist: checkpatch and newline style fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Ensure that subsequent patches do not cause checkpatch to fail and also tidy up
extra/missing newlines.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/display/artist.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 8e121bb0b4..be92113494 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -211,8 +211,9 @@ static void artist_invalidate_lines(struct vram_buffer *buf,
     int start = starty * buf->width;
     int size;
 
-    if (starty + height > buf->height)
+    if (starty + height > buf->height) {
         height = buf->height - starty;
+    }
 
     size = height * buf->width;
 
@@ -321,8 +322,9 @@ static void artist_get_cursor_pos(ARTISTState *s, int *x, int *y)
     }
 
     lx = artist_get_x(s->cursor_pos);
-    if (lx < offset)
+    if (lx < offset) {
         offset = lx;
+    }
     *x = (lx - offset) / 2;
 
     *y = 1146 - artist_get_y(s->cursor_pos);
@@ -343,6 +345,7 @@ static void artist_get_cursor_pos(ARTISTState *s, int *x, int *y)
 static void artist_invalidate_cursor(ARTISTState *s)
 {
     int x, y;
+
     artist_get_cursor_pos(s, &x, &y);
     artist_invalidate_lines(&s->vram_buffer[ARTIST_BUFFER_AP],
                             y, s->cursor_height);
@@ -470,10 +473,9 @@ static void draw_line(ARTISTState *s,
 
     if ((x1 >= buf->width && x2 >= buf->width) ||
         (y1 >= buf->height && y2 >= buf->height)) {
-	return;
+        return;
     }
 
-
     if (update_start) {
         s->vram_start = (x2 << 16) | y2;
     }
@@ -553,15 +555,15 @@ static void draw_line(ARTISTState *s,
         x++;
     } while (x <= x2 && (max_pix == -1 || --max_pix > 0));
 
-    if (c1)
+    if (c1) {
         artist_invalidate_lines(buf, x1, x2 - x1);
-    else
+    } else {
         artist_invalidate_lines(buf, y1 > y2 ? y2 : y1, x2 - x1);
+    }
 }
 
 static void draw_line_pattern_start(ARTISTState *s)
 {
-
     int startx = artist_get_x(s->vram_start);
     int starty = artist_get_y(s->vram_start);
     int endx = artist_get_x(s->blockmove_size);
@@ -574,7 +576,6 @@ static void draw_line_pattern_start(ARTISTState *s)
 
 static void draw_line_pattern_next(ARTISTState *s)
 {
-
     int startx = artist_get_x(s->vram_start);
     int starty = artist_get_y(s->vram_start);
     int endx = artist_get_x(s->blockmove_size);
@@ -589,7 +590,6 @@ static void draw_line_pattern_next(ARTISTState *s)
 
 static void draw_line_size(ARTISTState *s, bool update_start)
 {
-
     int startx = artist_get_x(s->vram_start);
     int starty = artist_get_y(s->vram_start);
     int endx = artist_get_x(s->line_size);
@@ -600,7 +600,6 @@ static void draw_line_size(ARTISTState *s, bool update_start)
 
 static void draw_line_xy(ARTISTState *s, bool update_start)
 {
-
     int startx = artist_get_x(s->vram_start);
     int starty = artist_get_y(s->vram_start);
     int sizex = artist_get_x(s->blockmove_size);
@@ -650,7 +649,6 @@ static void draw_line_xy(ARTISTState *s, bool update_start)
 
 static void draw_line_end(ARTISTState *s, bool update_start)
 {
-
     int startx = artist_get_x(s->vram_start);
     int starty = artist_get_y(s->vram_start);
     int endx = artist_get_x(s->line_end);
@@ -835,6 +833,7 @@ static void artist_vram_write(void *opaque, hwaddr addr, uint64_t val,
                               unsigned size)
 {
     ARTISTState *s = opaque;
+
     s->vram_char_y = 0;
     trace_artist_vram_write(size, addr, val);
     vram_bit_write(opaque, addr, 0, val, size);
@@ -1244,7 +1243,6 @@ static void artist_update_display(void *opaque)
     DisplaySurface *surface = qemu_console_surface(s->con);
     int first = 0, last;
 
-
     framebuffer_update_display(surface, &s->fbsection, s->width, s->height,
                                s->width, s->width * 4, 0, 0, artist_draw_line,
                                s, &first, &last);
@@ -1258,6 +1256,7 @@ static void artist_invalidate(void *opaque)
 {
     ARTISTState *s = ARTIST(opaque);
     struct vram_buffer *buf = &s->vram_buffer[ARTIST_BUFFER_AP];
+
     memory_region_set_dirty(&buf->mr, 0, buf->size);
 }
 
-- 
2.20.1


