Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17400338FF9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:26:13 +0100 (CET)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKik0-0006Rb-19
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiDL-0003CO-Us
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:27 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD3-00026d-Qp
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:27 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l12so4856296wry.2
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6mbcCb64/Ioa4zGzYL/tY04iMJVXGZTPBkpVRVgQQVg=;
 b=xodneMaizZonpp5KV2O79IUAJUd175p21QONFwRRG0xA7l0vA4+JE2cM52woLt19n0
 2f0qvPHiQ8sAZpnLT36hiUd2oBPCa/Fy88MPIdlxrZ35aErmuWjQnBJaUgYfQ9XKwh7Z
 WInvUq7ArzcZU2MuDa65s4B9opXekvuckc7U/z84Eo/XFt8AAktUtDKCJoY6vtvRpLd9
 xVF+JYh/MyE+JBnmQ4Xcc/ptYP09nSMH5wxukM1vgPh+4H27rN4J18Mk4KFJSfzIXdqs
 Kzs23EyWC260E5rLfTYD1SnYas/ISCgY4lqW/4djxrArriZ4UASAnKGGpIYw3eRzuZ0o
 VNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6mbcCb64/Ioa4zGzYL/tY04iMJVXGZTPBkpVRVgQQVg=;
 b=Qa82oJiCeB1EHgKpTnNwkEkI0xm+bCW+wmSNuJCBFUPzyQ97in2UsLI4xQQPNi+Zp9
 JBivHiFRqwfStWFSf2xtd5VdsOc3zJONHiobKom/kTyqqD7mocI3oVe5EJq8Bjhu/f7z
 0mxBkzqKN6mxJwyIaM1KdEPtFQCMP9vrnKV/AVZ1QYIOpjPjAmLCV10lN0uaMCG1thSX
 vXz9a7KCogrXhuixkjkkkhADocauER2vGdqSKjKg7HIXxLZfSR1lr5vwJcdWLxeXufoP
 sK6HBfatIyjeO0CKFhZiehgZjbgTcaF8p9JQ7KDBM/+VVef96d07OCdd/rD0a1L8rHUS
 v1Vw==
X-Gm-Message-State: AOAM532yCC/kPxVQjMoKTAY+lfzLjtU8FfXtgl7UOoqT7N0sjtJ/9HOo
 2Osv8/yz2IaAnMgW7IHnpbrUqXGD2sxtPX+r
X-Google-Smtp-Source: ABdhPJygqdysWQD9pB77Fih9Vz2bIzBwpEx44NYYw3rJprSKmVAyJVF2Jwel8F2hdDStKgB9igUyTw==
X-Received: by 2002:adf:f8cd:: with SMTP id f13mr13700781wrq.27.1615557128403; 
 Fri, 12 Mar 2021 05:52:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.52.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:52:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/39] hw/display/pxa2xx: Apply brace-related coding style
 fixes to template header
Date: Fri, 12 Mar 2021 13:51:38 +0000
Message-Id: <20210312135140.1099-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to move code from the template header into pxa2xx_lcd.c.
Before doing that, make coding style fixes so checkpatch doesn't
complain about the patch which moves the code. This commit fixes
missing braces in the SKIP_PIXEL() macro definition and in if()
statements.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210211141515.8755-8-peter.maydell@linaro.org
---
 hw/display/pxa2xx_template.h | 47 +++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/hw/display/pxa2xx_template.h b/hw/display/pxa2xx_template.h
index 711fd9994e2..1c13d3ac007 100644
--- a/hw/display/pxa2xx_template.h
+++ b/hw/display/pxa2xx_template.h
@@ -9,7 +9,7 @@
  * Framebuffer format conversion routines.
  */
 
-# define SKIP_PIXEL(to)		to += deststep
+# define SKIP_PIXEL(to) do { to += deststep; } while (0)
 # define COPY_PIXEL(to, from)    \
     do {                         \
         *(uint32_t *) to = from; \
@@ -142,10 +142,11 @@ static void pxa2xx_draw_line16t(void *opaque,
         data >>= 5;
         r = (data & 0x1f) << 3;
         data >>= 5;
-        if (data & 1)
+        if (data & 1) {
             SKIP_PIXEL(dest);
-        else
+        } else {
             COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
         data >>= 1;
         b = (data & 0x1f) << 3;
         data >>= 5;
@@ -153,10 +154,11 @@ static void pxa2xx_draw_line16t(void *opaque,
         data >>= 5;
         r = (data & 0x1f) << 3;
         data >>= 5;
-        if (data & 1)
+        if (data & 1) {
             SKIP_PIXEL(dest);
-        else
+        } else {
             COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
         width -= 2;
         src += 4;
     }
@@ -248,10 +250,11 @@ static void pxa2xx_draw_line19(void *opaque,
         data >>= 6;
         r = (data & 0x3f) << 2;
         data >>= 6;
-        if (data & 1)
+        if (data & 1) {
             SKIP_PIXEL(dest);
-        else
+        } else {
             COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
         width -= 1;
         src += 4;
     }
@@ -281,10 +284,11 @@ static void pxa2xx_draw_line19p(void *opaque,
         data[0] >>= 6;
         r = (data[0] & 0x3f) << 2;
         data[0] >>= 6;
-        if (data[0] & 1)
+        if (data[0] & 1) {
             SKIP_PIXEL(dest);
-        else
+        } else {
             COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
         data[0] >>= 6;
         b = (data[0] & 0x3f) << 2;
         data[0] >>= 6;
@@ -292,10 +296,11 @@ static void pxa2xx_draw_line19p(void *opaque,
         data[1] >>= 4;
         r = (data[1] & 0x3f) << 2;
         data[1] >>= 6;
-        if (data[1] & 1)
+        if (data[1] & 1) {
             SKIP_PIXEL(dest);
-        else
+        } else {
             COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
         data[1] >>= 6;
         b = (data[1] & 0x3f) << 2;
         data[1] >>= 6;
@@ -303,10 +308,11 @@ static void pxa2xx_draw_line19p(void *opaque,
         data[1] >>= 6;
         r = ((data[2] & 0x3) << 6) | (data[1] << 2);
         data[2] >>= 2;
-        if (data[2] & 1)
+        if (data[2] & 1) {
             SKIP_PIXEL(dest);
-        else
+        } else {
             COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
         data[2] >>= 6;
         b = (data[2] & 0x3f) << 2;
         data[2] >>= 6;
@@ -314,10 +320,11 @@ static void pxa2xx_draw_line19p(void *opaque,
         data[2] >>= 6;
         r = data[2] << 2;
         data[2] >>= 6;
-        if (data[2] & 1)
+        if (data[2] & 1) {
             SKIP_PIXEL(dest);
-        else
+        } else {
             COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
         width -= 4;
     }
 }
@@ -359,10 +366,11 @@ static void pxa2xx_draw_line24t(void *opaque,
         data >>= 8;
         r = data & 0xff;
         data >>= 8;
-        if (data & 1)
+        if (data & 1) {
             SKIP_PIXEL(dest);
-        else
+        } else {
             COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
         width -= 1;
         src += 4;
     }
@@ -384,10 +392,11 @@ static void pxa2xx_draw_line25(void *opaque,
         data >>= 8;
         r = data & 0xff;
         data >>= 8;
-        if (data & 1)
+        if (data & 1) {
             SKIP_PIXEL(dest);
-        else
+        } else {
             COPY_PIXEL(dest, rgb_to_pixel32(r, g, b));
+        }
         width -= 1;
         src += 4;
     }
-- 
2.20.1


