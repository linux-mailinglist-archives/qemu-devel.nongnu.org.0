Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2617440A78
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:14:13 +0200 (CEST)
Received: from localhost ([::1]:46774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgrvo-0004Z4-TA
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpT-0003P8-9d
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:39 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrpQ-0004qk-Fp
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id b12so17189630wrh.4
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BRulZAdBC/r5rGoabCC9Ba36MbUQeJeiEdfJePb3x3M=;
 b=BmKMegMYz9XTjGYKbY+BckxOzozniMrj0jdle8UirkPkX7YilWulmgGWEf2ZiEvQEd
 qoWm8s6WdKbY8G2FgWNLpaWCBRn1aJbPoK1CBCiMqpavj+MFOBP4c7hS4j7MkDQ/5hRD
 piQcEhXl9jnCS+0Fw1Y1ZlxNOaEJSeSQRdFtY0ZDAmty3e837D3wtMvIWARMonUBFeM6
 6ZlGHLVxbEFX4fJsjaKp1QFkZSCbqIkSdcpTKSSEeNfBxITxVQcrFAVQMJtzukV1z/IT
 I+LPwwI7B0hozD2+Z9Yi0cI/KXrBBTC/61v5TtAxLKpF/W5oPFveIYvZqfnfSwiDrnX4
 LSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BRulZAdBC/r5rGoabCC9Ba36MbUQeJeiEdfJePb3x3M=;
 b=KHICoJyWF76x8NfteBjALL0+xXi8/d7Q77Q0Ukjgnw3DrduZZw1vIh4oBHmmsql/jW
 CAw3HQHyzf/kWxSbViFD4AlXivAsZItw6OXt3qwTIF7GkHFzqTxK1T3Vl+Kk+Et0AcUW
 fV+ifcO/gl5JLEfZi1/SUIllRf71II7wLgMjk1KQqnQNthXWHq/ulM9GY2r1x7lVY+2e
 To+GWd6o/532C11+C3uTND06rMwMKZ2GCwnJDgxFPWaz2rX03jUvjYcXxONNlhp3btg3
 BNGqiLeAuQZMlPXaGqLhhW0pfJJqu3dOXouqCEWIFffNIpUhyKOHahU6CIT+nYaQ0RsS
 7M5w==
X-Gm-Message-State: AOAM530w0gKpIpbsOSicdzdziMMruJov4oDcNeTLPculJ930zwpFbMIX
 CrtXbgTiVJv2yJNXtqUI8RYIu1flXIM=
X-Google-Smtp-Source: ABdhPJxzrgN7KbWM6wcmVs6IPPGVrbek4I9ltHcydnenCSr7VMuVCkuiCQLxmyj1Ea4XqvtGbFhjYA==
X-Received: by 2002:adf:a1cc:: with SMTP id v12mr23795488wrv.48.1635613655036; 
 Sat, 30 Oct 2021 10:07:35 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 l2sm10526920wrs.90.2021.10.30.10.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/30] hw/intc/sh_intc: Turn some defines into an enum
Date: Sat, 30 Oct 2021 19:06:01 +0200
Message-Id: <20211030170615.2636436-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Turn the INTC_MODE defines into an enum and clean up the function
returning these to make it clearer by removing nested ifs and
superfluous parenthesis. The one remaining #define is a flag which is
moved further apart by changing its value from 8 to 0x80 to leave some
spare bits as this is or-ed with the enum value at some places.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <4adf4e1ac9d2e728e5a536c69e310d77f0c4455a.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index a98953d665f..f0ef83124e3 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -100,33 +100,26 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
     abort();
 }
 
-#define INTC_MODE_NONE       0
-#define INTC_MODE_DUAL_SET   1
-#define INTC_MODE_DUAL_CLR   2
-#define INTC_MODE_ENABLE_REG 3
-#define INTC_MODE_MASK_REG   4
-#define INTC_MODE_IS_PRIO    8
+typedef enum {
+    INTC_MODE_NONE,
+    INTC_MODE_DUAL_SET,
+    INTC_MODE_DUAL_CLR,
+    INTC_MODE_ENABLE_REG,
+    INTC_MODE_MASK_REG,
+} SHIntCMode;
+#define INTC_MODE_IS_PRIO 0x80
 
-static unsigned int sh_intc_mode(unsigned long address,
-                                 unsigned long set_reg, unsigned long clr_reg)
+static SHIntCMode sh_intc_mode(unsigned long address, unsigned long set_reg,
+                               unsigned long clr_reg)
 {
-    if ((address != A7ADDR(set_reg)) &&
-        (address != A7ADDR(clr_reg)))
+    if (address != A7ADDR(set_reg) && address != A7ADDR(clr_reg)) {
         return INTC_MODE_NONE;
-
+    }
     if (set_reg && clr_reg) {
-        if (address == A7ADDR(set_reg)) {
-            return INTC_MODE_DUAL_SET;
-        } else {
-            return INTC_MODE_DUAL_CLR;
-        }
-    }
-
-    if (set_reg) {
-        return INTC_MODE_ENABLE_REG;
-    } else {
-        return INTC_MODE_MASK_REG;
+        return address == A7ADDR(set_reg) ?
+               INTC_MODE_DUAL_SET : INTC_MODE_DUAL_CLR;
     }
+    return set_reg ? INTC_MODE_ENABLE_REG : INTC_MODE_MASK_REG;
 }
 
 static void sh_intc_locate(struct intc_desc *desc,
@@ -137,7 +130,8 @@ static void sh_intc_locate(struct intc_desc *desc,
                            unsigned int *width,
                            unsigned int *modep)
 {
-    unsigned int i, mode;
+    SHIntCMode mode;
+    unsigned int i;
 
     /* this is slow but works for now */
 
-- 
2.31.1


