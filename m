Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C155287E5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:03:55 +0200 (CEST)
Received: from localhost ([::1]:42172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcGI-0005yq-D5
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc3x-0005xE-DH
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:51:09 -0400
Received: from mout.gmx.net ([212.227.17.22]:38025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc2o-0008DL-UF
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652712577;
 bh=8Ig1WWgUNbE+7Ptzu8rRqx0U8j1NFRrTGiB3WbrQnt4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=bZjyY2uoormifNsawo/OavFHS9+l5WfC4GomDHNatAM3/e62SWWQXFpGzMYp3HqVO
 PCuwaqeFOfoM0/yastGZyQxLWhEZRLtRdxxUNTUoLH6g/jmtw74wEl1XGma2gBNYHL
 JtlmoOkx+DNAUk3Nc18dBndCDO9+e4SAwV+A/Ykk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm27-1o5jPX3S7n-00GJhJ; Mon, 16
 May 2022 16:49:36 +0200
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sven Schnelle <svens@stackframe.org>, qemu-devel@nongnu.org
Cc: Stefano Repici <rs.rdp@zoho.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 3/7] artist: Use human-readable variable names instead of
 reg_xxx
Date: Mon, 16 May 2022 16:49:30 +0200
Message-Id: <20220516144934.36273-4-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516144934.36273-1-deller@gmx.de>
References: <20220516144934.36273-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PIiR1L07hhrPlIsOodu0pUkqBIE3CulYKs85i26RcD1hzqilX4S
 SBzzQovJvnQ5xiLNoL8LCPfrfOtGbW/897IZzN9bAH8lIWhCJYlQs9faGUOA24poWByaq3S
 iE6cLhYX+QMgwEsQxhEJ0DWGouH5nW0An6WGvhUBmsWOyk+ouMs0abFs9DQlo7MxK0nOYwv
 YwhWgqo2sNSzUz3MpM2+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BPArpZH+eXQ=:Cd0liBrwPJEXdSulxOcqd1
 qYU72E0UcJNe+3eGJAdw5ynAgLSOpIEMTssrsVYAEPKkH0W6tT7B99MSMSfwnHLCEtkIRyLH+
 xsIdWfFGW8UWss4wVjkBoobEyUFFyUIAyq/eyvx5VbMGsLd6g9EqAUS2ofFy/Wx6P7PpQQrX/
 N5S1I1luyJ8vb0tVeopq5x4AY6W/+0BppOUtOiOQQhq4r27HBZne9Hqf9BUxccucAc13ZDH4q
 lkfRdjUKErGz5X0XDpTPF2x2hhuFoNf4PgZMUJqYKIctote+YDabbDmnI6a4Uh7R5662ccRWt
 bFAs37iHiLSebcpT6F4X6xbzHetW5GF39qXRdCNFCz9nutLPfPMrVPLC4Z/jxO4v9ARDn5gq8
 CTq0kcCyPUK1jXKrU8CUQeNQl8LTttwNfkKlJ60CehbQbH35GKDPSIGNNPmu9Be222FygMgfd
 K4WdYF5ZyV7Oe4JBNFvZ0pyw5aOLvpAIAW86mHFmIl4fG+qkAQ1sZWIa3ln4sha94tpMgnAFJ
 VgceTVFruNj2GsSg+er2T0NLeHJWPJETvKouldIaS4IV5QkbnVEbFy2V3Z+bnbMYS5dcgn7/b
 9K4Wh3GDfnz4Z7+8heZ0k96pFrs6h0RtIPfaEqy8foQgXBMXUfAzznPnZVhfkVZYYsAniWQ8G
 kRKEUq3pAyfza9mBAai3chTTakhArwTiACTL0iKgBb1bs/u+aeZEw/Ri05QiMP8EdxjNjsyql
 v3Y4AHkNvpcAwVVHBURbtiOb59imc02Sc9PwuYr2YOvlFVCwesdeRDo4PA+rxJCZ9pr8FhDg8
 qhYEp7KrddOdbfA+tJlzO6YXGyFmiZQgUh1TtIgdVzyqq203LTfTANLcunEjZUQ2dWswtPZ2o
 vnksRCG7gNJx148ziypjrSbOtcMUEn3OCP/7iWrkblX2vLhMuFTxbdtWa8D1R30cMFuawon73
 4oJReNyERGCamJ6j2/JmCoFqFNtptWiqJrm86AXpqjbF18+zdMRpebsw6ocrW0H0gzwiwvsfW
 V927/G0FJgBL8hWAJkavMJIW5cEa9fpTgKD+jur1cy651niN+NFhXaiMDeNVPsb0421uAmyow
 RR2yaytkB7CaBQ=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Convert the variable names of some registers to human-readable and
understandable names.

Signed-off-by: Helge Deller <deller@gmx.de>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
=2D--
 hw/display/artist.c | 72 ++++++++++++++++++++++++++++++---------------
 1 file changed, 49 insertions(+), 23 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 6333ee41db..c8b261a52e 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -81,9 +81,10 @@ struct ARTISTState {
     uint32_t plane_mask;

     uint32_t reg_100080;
-    uint32_t reg_300200;
-    uint32_t reg_300208;
-    uint32_t reg_300218;
+    uint32_t horiz_backporch;
+    uint32_t active_lines_low;
+    uint32_t misc_video;
+    uint32_t misc_ctrl;

     uint32_t dst_bm_access;
     uint32_t src_bm_access;
@@ -138,8 +139,14 @@ typedef enum {
     BG_COLOR =3D 0x118014,
     PLANE_MASK =3D 0x118018,
     IMAGE_BITMAP_OP =3D 0x11801c,
-    CURSOR_POS =3D 0x300100,
-    CURSOR_CTRL =3D 0x300104,
+    CURSOR_POS =3D 0x300100,      /* reg17 */
+    CURSOR_CTRL =3D 0x300104,     /* reg18 */
+    MISC_VIDEO =3D 0x300218,      /* reg21 */
+    MISC_CTRL =3D 0x300308,       /* reg27 */
+    HORIZ_BACKPORCH =3D 0x300200, /* reg19 */
+    ACTIVE_LINES_LOW =3D 0x300208,/* reg20 */
+    FIFO1 =3D 0x300008,           /* reg34 */
+    FIFO2 =3D 0x380008,
 } artist_reg_t;

 typedef enum {
@@ -177,12 +184,18 @@ static const char *artist_reg_name(uint64_t addr)
     REG_NAME(SRC_BM_ACCESS);
     REG_NAME(CURSOR_POS);
     REG_NAME(CURSOR_CTRL);
+    REG_NAME(HORIZ_BACKPORCH);
+    REG_NAME(ACTIVE_LINES_LOW);
+    REG_NAME(MISC_VIDEO);
+    REG_NAME(MISC_CTRL);
     REG_NAME(LINE_XY);
     REG_NAME(PATTERN_LINE_START);
     REG_NAME(LINE_SIZE);
     REG_NAME(LINE_END);
     REG_NAME(FONT_WRITE_INCR_Y);
     REG_NAME(FONT_WRITE_START);
+    REG_NAME(FIFO1);
+    REG_NAME(FIFO2);
     }
     return "";
 }
@@ -1028,16 +1041,20 @@ static void artist_reg_write(void *opaque, hwaddr =
addr, uint64_t val,
         combine_write_reg(addr, val, size, &s->transfer_data);
         break;

-    case 0x300200:
-        combine_write_reg(addr, val, size, &s->reg_300200);
+    case HORIZ_BACKPORCH:
+        combine_write_reg(addr, val, size, &s->horiz_backporch);
         break;

-    case 0x300208:
-        combine_write_reg(addr, val, size, &s->reg_300208);
+    case ACTIVE_LINES_LOW:
+        combine_write_reg(addr, val, size, &s->active_lines_low);
         break;

-    case 0x300218:
-        combine_write_reg(addr, val, size, &s->reg_300218);
+    case MISC_VIDEO:
+        combine_write_reg(addr, val, size, &s->misc_video);
+        break;
+
+    case MISC_CTRL:
+        combine_write_reg(addr, val, size, &s->misc_ctrl);
         break;

     case CURSOR_POS:
@@ -1122,12 +1139,11 @@ static uint64_t artist_reg_read(void *opaque, hwad=
dr addr, unsigned size)
     case 0x100000:
     case 0x300000:
     case 0x300004:
-    case 0x300308:
     case 0x380000:
         break;

-    case 0x300008:
-    case 0x380008:
+    case FIFO1:
+    case FIFO2:
         /*
          * FIFO ready flag. we're not emulating the FIFOs
          * so we're always ready
@@ -1135,16 +1151,25 @@ static uint64_t artist_reg_read(void *opaque, hwad=
dr addr, unsigned size)
         val =3D 0x10;
         break;

-    case 0x300200:
-        val =3D s->reg_300200;
+    case HORIZ_BACKPORCH:
+        val =3D s->horiz_backporch;
+        break;
+
+    case ACTIVE_LINES_LOW:
+        val =3D s->active_lines_low;
+        /* activeLinesLo for cursor is in reg20.b.b0 */
+        val |=3D ((s->height - 1) & 0xff);
         break;

-    case 0x300208:
-        val =3D s->reg_300208;
+    case MISC_VIDEO:
+        /* emulate V-blank */
+        val =3D s->misc_video ^ 0x00040000;
+        /* activeLinesHi for cursor is in reg21.b.b2 */
+        val |=3D ((s->height - 1) & 0xff00);
         break;

-    case 0x300218:
-        val =3D s->reg_300218;
+    case MISC_CTRL:
+        val =3D s->misc_ctrl;
         break;

     case 0x30023c:
@@ -1379,9 +1404,10 @@ static const VMStateDescription vmstate_artist =3D =
{
         VMSTATE_UINT32(cursor_width, ARTISTState),
         VMSTATE_UINT32(plane_mask, ARTISTState),
         VMSTATE_UINT32(reg_100080, ARTISTState),
-        VMSTATE_UINT32(reg_300200, ARTISTState),
-        VMSTATE_UINT32(reg_300208, ARTISTState),
-        VMSTATE_UINT32(reg_300218, ARTISTState),
+        VMSTATE_UINT32(horiz_backporch, ARTISTState),
+        VMSTATE_UINT32(active_lines_low, ARTISTState),
+        VMSTATE_UINT32(misc_video, ARTISTState),
+        VMSTATE_UINT32(misc_ctrl, ARTISTState),
         VMSTATE_UINT32(dst_bm_access, ARTISTState),
         VMSTATE_UINT32(src_bm_access, ARTISTState),
         VMSTATE_UINT32(control_plane, ARTISTState),
=2D-
2.35.3


