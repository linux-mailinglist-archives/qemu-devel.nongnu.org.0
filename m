Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E49410F96
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 08:43:09 +0200 (CEST)
Received: from localhost ([::1]:46042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSD1A-0003rQ-1k
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 02:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSCz3-0001IU-Sg
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:40:57 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSCz2-0004N4-C6
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 02:40:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id 140so12283815wma.0
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 23:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=THd7jeuPtRUebml8cZHFdTMlOfIa5gz3RTHrt9j0Rw8=;
 b=cVUzwVwFkWTXu91F9FLMg/QX1A5dJQZ0nsojpOwsMynWpvvqBTNPupgzrl5gzSwamI
 oAA0xcIUXIWb0UNO2Bou3fY35E1+rgDnki/wXP7XJiLJs0L+JzWm+Ezti76CGxFIAO6y
 wEC43Mwop7ldvP7+AIueUg02y2K9/kzgEhJ1d5XCJ/NK5wPABX14IuLXDUfn8LrSW3ry
 Q5A/GhSZp+ilt2FScbG0v7XAGhrngIs3wb5iaRQpPrEQbVN5jfT7MsV7R7X8hkTZnKd5
 xR93vRrwtt+x+ci2ucrBs1tE0dhCos8/No0lwBe+P7kJJFRG7Zmg0vJOgr/H1KxtLSJd
 JB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=THd7jeuPtRUebml8cZHFdTMlOfIa5gz3RTHrt9j0Rw8=;
 b=ugCamIbxpQHqNTFabFG76oFeHcaj6cee3Qjpmw1g3LvlqNHeZEXLwZjLXWShBmsXGa
 AA8yELuZe8dVUtJLMw+mhiZYz1KVxIn4isVnBRSZgBZIY7JKD23Alpe6dg2WdypSWQjL
 whbu9F9pc6MP8MH60J2dHR7Dp86q7GqXi4x59RZOhH/El2Hb7LY93WIBpqAufCtWAPVA
 RJLOBrgbvIueRcrcyk5GMz+aeV55ie4dEDdEHxJ+3YLzXrsLaPd4J6UKj+dyrzYlqHYa
 YIHx+p76oRxybN4rkhyvMAqiBAdYyYu4AOIyG8L7baRpzl36rlYSWH6LMYJ02wTAPHcV
 dXQg==
X-Gm-Message-State: AOAM532gILdqMt7glG0SUvILZDmmEVLZnBOEWN5siwkEavj8arLtEKte
 KVfZOnnk3ozAthWTeOc+77yeNzSQpSM=
X-Google-Smtp-Source: ABdhPJyZl1UOlGxwlWvuE4u+O7s8gBPyNn+ss5cy+XJ0UZaJiJPgv0lTv7sG1zlHduPdK9305+IGeg==
X-Received: by 2002:a05:600c:5109:: with SMTP id
 o9mr18256587wms.90.1632120054550; 
 Sun, 19 Sep 2021 23:40:54 -0700 (PDT)
Received: from x1w.. (14.red-83-35-25.dynamicip.rima-tde.net. [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id m18sm14695169wrn.85.2021.09.19.23.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:40:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/input/lasips2: Fix typos in function names
Date: Mon, 20 Sep 2021 08:40:46 +0200
Message-Id: <20210920064048.2729397-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920064048.2729397-1-f4bug@amsat.org>
References: <20210920064048.2729397-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

Artist is another device, this one is the Lasi PS/2.
Rename the functions accordingly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/lasips2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index e7faf24058b..68d741d3421 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -96,7 +96,7 @@ typedef enum {
     LASIPS2_STATUS_CLKSHD = 0x80,
 } lasips2_status_reg_t;
 
-static const char *artist_read_reg_name(uint64_t addr)
+static const char *lasips2_read_reg_name(uint64_t addr)
 {
     switch (addr & 0xc) {
     case REG_PS2_ID:
@@ -116,7 +116,7 @@ static const char *artist_read_reg_name(uint64_t addr)
     }
 }
 
-static const char *artist_write_reg_name(uint64_t addr)
+static const char *lasips2_write_reg_name(uint64_t addr)
 {
     switch (addr & 0x0c) {
     case REG_PS2_RESET:
@@ -145,7 +145,7 @@ static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
     LASIPS2Port *port = opaque;
 
     trace_lasips2_reg_write(size, port->id, addr,
-                            artist_write_reg_name(addr), val);
+                            lasips2_write_reg_name(addr), val);
 
     switch (addr & 0xc) {
     case REG_PS2_CONTROL:
@@ -239,7 +239,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
         break;
     }
     trace_lasips2_reg_read(size, port->id, addr,
-                           artist_read_reg_name(addr), ret);
+                           lasips2_read_reg_name(addr), ret);
 
     return ret;
 }
-- 
2.31.1


