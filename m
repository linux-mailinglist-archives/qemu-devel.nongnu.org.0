Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD9C318D23
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 15:20:31 +0100 (CET)
Received: from localhost ([::1]:57754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACpa-0003xP-OG
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 09:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACl1-0006YA-SM
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:48 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lACkf-00076J-CV
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 09:15:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id a16so6025327wmm.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 06:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/q6QTfiiOxA3oY14+4dd/XG0OuRlBQOoQGLBGtVV1NU=;
 b=LTLXxVsQea7Bwumij9ZCPhZWWihDB7JxfVYdK40vFrhv8hsLJBYK2TxkzOSxROsWLg
 eha77Qauv509mfO1/+cqyd9e3Tw0B5FSo/7n+boO6MmUC5Jfz97UUhN8sNUje2UPeLU1
 pu/88scVSKZ5kymsbzkYwJtydNn5mwWHITtPMsNV8fo1KVJ+xvOOONuRLpkmWzFgVyIw
 yTIZ0R3WuiN5dn30McldkH7uHrTVus2nYIUDHT3Hjhu1Y/Sc1Oo9jOoHhL9LHTekyY4M
 XjLjBjtqWRwgD19wEZh/4BOFT49mzCR3p2U/MzFeFvPvgdPEj5VNG5+k/Rw+bLNlMIbf
 4dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/q6QTfiiOxA3oY14+4dd/XG0OuRlBQOoQGLBGtVV1NU=;
 b=IysGjl3CxxvDp3WeBuSePH/kBXEd8JyVyWeKtCLOpUe+x7spUecrATrwn3+g4xBhM0
 +67a5yltwHdwx9PtmKdOfdbd6MzrtB06FDZFpi1V952zK5LvVo2T8Qqakbrpt9mQ1r7k
 1ONBBh7T5gb8dpQwN5eUUk6MP08KUTQD/1aSz7cmr1D3YDVUCvDkHajbQbYttnbR/ESm
 TBMsIhrGcI+PUJC8bfs4DYltVYAJ/46GYwLWjw+ZjNngDn0tRTsQ/D5rBYhEZVd0fEUd
 ZMwKcEUGWyfGdQyVCvsPismNxG6dsbaCuFk5eIIuRsknRJbIv696fuIGsJNEkEuExZt0
 I+vQ==
X-Gm-Message-State: AOAM533bz2oghieAruZouEPYoaNRC9VJd7n7VBmPvh5HCaSudG0vcKft
 UmVVE+BjDN7McYPi03G0uyQtjHVOmzDX6w==
X-Google-Smtp-Source: ABdhPJzMN0WzZgW4ql2S4lKFhKqIVlfq6nvTja50Yi2wnboNmZH5jVf0GUtcyEe0K9rYPZKL9+922g==
X-Received: by 2002:a1c:8096:: with SMTP id b144mr5604040wmd.169.1613052923456; 
 Thu, 11 Feb 2021 06:15:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5223291wrv.20.2021.02.11.06.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:15:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 7/9] hw/display/pxa2xx: Apply brace-related coding style fixes
 to template header
Date: Thu, 11 Feb 2021 14:15:13 +0000
Message-Id: <20210211141515.8755-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211141515.8755-1-peter.maydell@linaro.org>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to move code from the template header into pxa2xx_lcd.c.
Before doing that, make coding style fixes so checkpatch doesn't
complain about the patch which moves the code. This commit fixes
missing braces in the SKIP_PIXEL() macro definition and in if()
statements.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


