Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC9D410F9C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:47:00 +0200 (CEST)
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSD4t-0007uY-9N
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSCz9-0001T1-VD
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:41:03 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSCz7-0004RJ-8I
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:41:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id w17so18721300wrv.10
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 23:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EcOr1QmO1S16fr4fOEvRxqFLTXjTaCedzwKUta20dVg=;
 b=M645RUxHr+fjF2Oxsz/54Ni4G92bdFpLctuYWDoWcga4O5B76pSfRxpvYbCDSLhMlJ
 tTjJKAbAmWsCTUy58U+ONZwZoAt1/N82LgH7HDaz27mzxS3vWER63NLHakbdfPwjs3vn
 fWc0S5pHC7EjoUBiR/zgUw9D/VWpEl3/419xfMnNBFylWseSx/nlRM7j1Feq+9XzLsGJ
 F6R26pBOlrqpHHG8EBrK9XKoU/vhE2jiF2nD7xacBHMNGxRMe0J/nEW7JsD72c7QkCer
 FBHDMrTmzSqHRMXFocdvQPdxOo7MHVPs4/3vs8AxaVa8r1g/eE95FwPKbHvYg7rNGY1Q
 nyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EcOr1QmO1S16fr4fOEvRxqFLTXjTaCedzwKUta20dVg=;
 b=hj19jhVuMitXylQgwBbhnawYfqJJYH2B4XVrXi6G7KtAi9zfW0a0kquL1GQXW4uwwO
 kv3wDDyBj3bMlzobT656bBuVOrCS3iTKJpC5ZE+rilwOw56M/qBW+sSIe04lQssrVRD2
 XNV9Z65CBRoPWdGQfO4VtXjnFkSybp9xJv2OCU9JMu9NWR7uFYtsJLa1DCkBnI9YUSMB
 yGabBU4RUGymJ0Gruc2LWchZ3HUyFBOHFWgfsbW0+Le8C1JFR+TdM5JuKHWoeJCbJRs5
 gFN1aibHmtf1TQKAZ3F8U8s9FvfHoxGc2nDclI+fe6Eet/cz4LvejBnAlHy2LS5VkmAq
 59Ig==
X-Gm-Message-State: AOAM532UC+w3c6WMkaWN8L+TK8ln+PSt847ZhTGM+TKXjsK7Pf+L6E0M
 aCNGGmTI7THgtvLjmD/QgDx7gigBQrE=
X-Google-Smtp-Source: ABdhPJyD5RuJN634Qj2x9308noTh5esQTBBXGuRJCttvftLoiBuTZJJx1XXeaofD8AGOY4KgTugYQw==
X-Received: by 2002:adf:d1c5:: with SMTP id b5mr9563327wrd.252.1632120059828; 
 Sun, 19 Sep 2021 23:40:59 -0700 (PDT)
Received: from x1w.. (14.red-83-35-25.dynamicip.rima-tde.net. [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id g205sm11057803wmg.18.2021.09.19.23.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:40:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/input/lasips2: Move LASIPS2State declaration to
 'hw/input/lasips2.h'
Date: Mon, 20 Sep 2021 08:40:47 +0200
Message-Id: <20210920064048.2729397-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920064048.2729397-1-f4bug@amsat.org>
References: <20210920064048.2729397-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to use the OBJECT_DECLARE_SIMPLE_TYPE() macro to QOM'ify
this device in the next commit. To make its review simpler, as a
first step move the LASIPS2State and LASIPS2Port declarations to
'hw/input/lasips2.h'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/input/lasips2.h | 18 ++++++++++++++++++
 hw/input/lasips2.c         | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 0cd7b59064a..c88f1700162 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -11,6 +11,24 @@
 
 #define TYPE_LASIPS2 "lasips2"
 
+struct LASIPS2State;
+typedef struct LASIPS2Port {
+    struct LASIPS2State *parent;
+    MemoryRegion reg;
+    void *dev;
+    uint8_t id;
+    uint8_t control;
+    uint8_t buf;
+    bool loopback_rbne;
+    bool irq;
+} LASIPS2Port;
+
+typedef struct LASIPS2State {
+    LASIPS2Port kbd;
+    LASIPS2Port mouse;
+    qemu_irq irq;
+} LASIPS2State;
+
 void lasips2_init(MemoryRegion *address_space, hwaddr base, qemu_irq irq);
 
 #endif /* HW_INPUT_LASIPS2_H */
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 68d741d3421..0f8362f17bc 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -33,24 +33,6 @@
 #include "hw/irq.h"
 
 
-struct LASIPS2State;
-typedef struct LASIPS2Port {
-    struct LASIPS2State *parent;
-    MemoryRegion reg;
-    void *dev;
-    uint8_t id;
-    uint8_t control;
-    uint8_t buf;
-    bool loopback_rbne;
-    bool irq;
-} LASIPS2Port;
-
-typedef struct LASIPS2State {
-    LASIPS2Port kbd;
-    LASIPS2Port mouse;
-    qemu_irq irq;
-} LASIPS2State;
-
 static const VMStateDescription vmstate_lasips2 = {
     .name = "lasips2",
     .version_id = 0,
-- 
2.31.1


