Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E6514028C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 04:51:56 +0100 (CET)
Received: from localhost ([::1]:52132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isIfr-00066K-EB
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 22:51:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32811)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty@apple.com>) id 1isIf3-0005fy-Ov
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 22:51:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty@apple.com>) id 1isIf2-0001et-Ae
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 22:51:05 -0500
Received: from ma1-aaemail-dr-lapp02.apple.com ([17.171.2.68]:36008)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dirty@apple.com>) id 1isIf2-0001bE-2W
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 22:51:04 -0500
Received: from pps.filterd (ma1-aaemail-dr-lapp02.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp02.apple.com (8.16.0.27/8.16.0.27) with SMTP id
 00H3l1um034979; Thu, 16 Jan 2020 19:51:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=sender : from : to :
 cc : subject : date : message-id : mime-version :
 content-transfer-encoding; s=20180706;
 bh=ysTX6Ekj3TXjwkEhy4GXIR9bRZ+TBaG8togQR/xp6qo=;
 b=VENaEz4HV0Hh6a1fWakM7J7HMBjGzHQzzZJNv0n9kjoBRPG+ftU8Z9NxAn7c8Kh/ocPn
 rLF9aUsbprI8wFLO3LV338hMN/9X2JZfRv2uvXtYsq9R57AnJ+e46y9DvLJVKGxwC4k2
 hMjAZZL11NXC9JsmAZphT2N6J4ThUYkq/cA/UWxb2K+fSc1H+fN3haqeLzcsHRxzm3SQ
 bYc3Pdp3DQ6IrcVumH0YPR2iUn1ithwPPirSu+NfSKWkNT1SgUZ3LR7A6xFprGuh9SSh
 jWNRPeBv/SBAfPd9X9Gm7/q3k6IgucsZ4ELFi4sT5CpRA9LezpYT1ekxslfMMXkmiKiB Lg== 
Received: from mr2-mtap-s02.rno.apple.com (mr2-mtap-s02.rno.apple.com
 [17.179.226.134])
 by ma1-aaemail-dr-lapp02.apple.com with ESMTP id 2xfbwyt3ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 16 Jan 2020 19:51:02 -0800
Received: from nwk-mmpp-sz09.apple.com
 (nwk-mmpp-sz09.apple.com [17.128.115.80]) by mr2-mtap-s02.rno.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPS id <0Q4800GMZG11RY00@mr2-mtap-s02.rno.apple.com>; Thu,
 16 Jan 2020 19:51:01 -0800 (PST)
Received: from process_milters-daemon.nwk-mmpp-sz09.apple.com by
 nwk-mmpp-sz09.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) id <0Q4800K00FPA4400@nwk-mmpp-sz09.apple.com>; Thu,
 16 Jan 2020 19:51:01 -0800 (PST)
X-Va-A: 
X-Va-T-CD: c56cc4374afe9162bf6a337f3d661529
X-Va-E-CD: 99bdbdec4301a27ac1e175977a8bf22e
X-Va-R-CD: f8563a530fcb0f46f1d9cbaba620e3ac
X-Va-CD: 0
X-Va-ID: 59a1635c-034d-4505-9732-fad6544c7c9b
X-V-A: 
X-V-T-CD: c56cc4374afe9162bf6a337f3d661529
X-V-E-CD: 99bdbdec4301a27ac1e175977a8bf22e
X-V-R-CD: f8563a530fcb0f46f1d9cbaba620e3ac
X-V-CD: 0
X-V-ID: 6d42505b-3fa0-4094-9881-21d892bc15aa
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2020-01-16_06:,, signatures=0
Received: from pontoon.com (unknown [17.234.88.206]) by nwk-mmpp-sz09.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPSA id <0Q4800JHHG0Y7Q70@nwk-mmpp-sz09.apple.com>; Thu,
 16 Jan 2020 19:50:59 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com
Subject: [PATCH v1] vnc: fix VNC artifacts
Date: Thu, 16 Jan 2020 19:50:58 -0800
Message-id: <7cb1f22ef8d575238c84f091f03dee8e7fedb78d.1579232679.git.dirty@apple.com>
X-Mailer: git-send-email 2.24.0
MIME-version: 1.0
Content-transfer-encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2020-01-16_06:, , signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 17.171.2.68
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Cameron Esfahani <dirty@apple.com>
From: Cameron Esfahani via <qemu-devel@nongnu.org>

Remove VNC optimization to reencode framebuffer update as raw if it's
smaller than the default encoding.  QEMU's implementation was naive and
didn't account for the ZLIB z_stream mutating with each compression.  Just
saving and restoring the output buffer offset wasn't sufficient to "rewind"
the previous encoding.  Considering that ZRLE is never larger than raw and
even though ZLIB can occasionally be fractionally larger than raw, the
overhead of implementing this optimization correctly isn't worth it.

In my investigation, ZRLE always compresses better than ZLIB so
prioritize ZRLE over ZLIB, even if the client hints that ZLIB is
preferred.

Fixes: <de3f7de7f4e257> ("vnc: allow fall back to RAW encoding")
Signed-off-by: Cameron Esfahani <dirty@apple.com>
---
 ui/vnc-enc-zrle.c |  4 ++--
 ui/vnc.c          | 30 +++++++++++-------------------
 2 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/ui/vnc-enc-zrle.c b/ui/vnc-enc-zrle.c
index 17fd28a2e2..b4f71e32cf 100644
--- a/ui/vnc-enc-zrle.c
+++ b/ui/vnc-enc-zrle.c
@@ -98,8 +98,8 @@ static int zrle_compress_data(VncState *vs, int level)
     /* set pointers */
     zstream->next_in = vs->zrle->zrle.buffer;
     zstream->avail_in = vs->zrle->zrle.offset;
-    zstream->next_out = vs->zrle->zlib.buffer + vs->zrle->zlib.offset;
-    zstream->avail_out = vs->zrle->zlib.capacity - vs->zrle->zlib.offset;
+    zstream->next_out = vs->zrle->zlib.buffer;
+    zstream->avail_out = vs->zrle->zlib.capacity;
     zstream->data_type = Z_BINARY;
 
     /* start encoding */
diff --git a/ui/vnc.c b/ui/vnc.c
index 4100d6e404..f085e1b747 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -898,8 +898,6 @@ int vnc_raw_send_framebuffer_update(VncState *vs, int x, int y, int w, int h)
 int vnc_send_framebuffer_update(VncState *vs, int x, int y, int w, int h)
 {
     int n = 0;
-    bool encode_raw = false;
-    size_t saved_offs = vs->output.offset;
 
     switch(vs->vnc_encoding) {
         case VNC_ENCODING_ZLIB:
@@ -922,24 +920,11 @@ int vnc_send_framebuffer_update(VncState *vs, int x, int y, int w, int h)
             n = vnc_zywrle_send_framebuffer_update(vs, x, y, w, h);
             break;
         default:
-            encode_raw = true;
+            vnc_framebuffer_update(vs, x, y, w, h, VNC_ENCODING_RAW);
+            n = vnc_raw_send_framebuffer_update(vs, x, y, w, h);
             break;
     }
 
-    /* If the client has the same pixel format as our internal buffer and
-     * a RAW encoding would need less space fall back to RAW encoding to
-     * save bandwidth and processing power in the client. */
-    if (!encode_raw && vs->write_pixels == vnc_write_pixels_copy &&
-        12 + h * w * VNC_SERVER_FB_BYTES <= (vs->output.offset - saved_offs)) {
-        vs->output.offset = saved_offs;
-        encode_raw = true;
-    }
-
-    if (encode_raw) {
-        vnc_framebuffer_update(vs, x, y, w, h, VNC_ENCODING_RAW);
-        n = vnc_raw_send_framebuffer_update(vs, x, y, w, h);
-    }
-
     return n;
 }
 
@@ -2087,8 +2072,15 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
             break;
 #endif
         case VNC_ENCODING_ZLIB:
-            vs->features |= VNC_FEATURE_ZLIB_MASK;
-            vs->vnc_encoding = enc;
+            /*
+             * VNC_ENCODING_ZRLE compresses better than VNC_ENCODING_ZLIB.
+             * So prioritize ZRLE, even if the client hints that it prefers
+             * ZLIB.
+             */
+            if ((vs->features & VNC_FEATURE_ZRLE_MASK) == 0) {
+                vs->features |= VNC_FEATURE_ZLIB_MASK;
+                vs->vnc_encoding = enc;
+            }
             break;
         case VNC_ENCODING_ZRLE:
             vs->features |= VNC_FEATURE_ZRLE_MASK;
-- 
2.24.0


