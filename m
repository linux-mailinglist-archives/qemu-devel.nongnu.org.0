Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D6F440A96
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:26:30 +0200 (CEST)
Received: from localhost ([::1]:51402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgs7h-0002BM-Oo
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrqF-0005HH-Fe
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:27 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrqD-0004vs-97
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:27 -0400
Received: by mail-wr1-x433.google.com with SMTP id d13so21605368wrf.11
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZLUlGGCAE4OsJnGPcZDW1ai5vTzjA4RoqtmCsvfI3/w=;
 b=oWUqQNFnlr9G+lJOmX8G0cck0hbbWiF6Wkj0vbqW/86RBWHjibhtA1pofbQbfFys5M
 z/E8pmPvrBsEsuC1eDQ71Ii7Z8AOShXaay3MH2fydGrNAM45dOyTLe43MBOY5siWas3O
 tWWyVmkub1+jxMor7kTplLSScuGtJhxbZv3Ky/H7HKxeDe4vVXKJaN325n7cMM0xMcBt
 /BuT7zsDjyzDKNSS6KqxUc0z/TY0DD2XMUyswrYy4HbP5XoXRapBw/Ln5L3E2lnzKVv5
 Bw+becQAaFcHtxnU1dcAo2DWtb3nncfWY7j8VSKBCJTXXWUir24JVSSQTMQiEF0O6LRg
 jQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZLUlGGCAE4OsJnGPcZDW1ai5vTzjA4RoqtmCsvfI3/w=;
 b=iHQWM2pX2JjnsZ5AbyNz/E614Ec7WBZu6oEccgetAiImtEJ2uUA341//YS1Udcfz3F
 pxFG5cPWu8gi5tZAQrJfSr6U+ZepO0wViGaz98agyNGPvL3BB6nNIAV4K33Kl1PvRnHB
 YiLvWzINWptQBJI0iAuR4aRu3d2Ly1LbriQtl7bHlqw9n5oyHUqUxcXhzxYPdtlMtDrj
 PDG7/F/AhvE1MWuCS7Xg3QP/X9Cqk+0E5pE9icze+TjdNDLYX2kzmTmSdU1rmqWOFZHy
 nNUwRds6rT2YmjXmajV2B2wdW/Dndjj2I2WthuF2AZwxgTWrZoOyndjPGxUe7VzoGwdR
 3/1A==
X-Gm-Message-State: AOAM530dTzaoq44bSuIlJAJIkN1jQI2l/ZYHGNEhhW/p7D1kY9oDOajA
 0yLyq9RU+O7vxCqoLhtnay4lrGfIuKw=
X-Google-Smtp-Source: ABdhPJw7zHuyZWXW96vheHANmloQ+ut3j/8wK8/m+nG1F58xAYAoBrskH9Dc4vFGP1D1a0GxTnByFQ==
X-Received: by 2002:a05:6000:1689:: with SMTP id
 y9mr23771532wrd.52.1635613703902; 
 Sat, 30 Oct 2021 10:08:23 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 h18sm3031789wre.46.2021.10.30.10.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:08:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/30] hw/intc/sh_intc: Remove unneeded local variable
 initialisers
Date: Sat, 30 Oct 2021 19:06:11 +0200
Message-Id: <20211030170615.2636436-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

The sh_intc_locate function will either init these or not return so no
need to initialise them.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <15e04aa665c68ab5df47bbf505346d413be2fc1c.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/sh_intc.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 3356b422022..c9b0b0c1ecc 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -195,14 +195,13 @@ static void sh_intc_toggle_mask(struct intc_desc *desc, intc_enum id,
     }
 }
 
-static uint64_t sh_intc_read(void *opaque, hwaddr offset,
-                             unsigned size)
+static uint64_t sh_intc_read(void *opaque, hwaddr offset, unsigned size)
 {
     struct intc_desc *desc = opaque;
-    intc_enum *enum_ids = NULL;
-    unsigned int first = 0;
-    unsigned int width = 0;
-    unsigned int mode = 0;
+    intc_enum *enum_ids;
+    unsigned int first;
+    unsigned int width;
+    unsigned int mode;
     unsigned long *valuep;
 
     sh_intc_locate(desc, (unsigned long)offset, &valuep,
@@ -215,12 +214,12 @@ static void sh_intc_write(void *opaque, hwaddr offset,
                           uint64_t value, unsigned size)
 {
     struct intc_desc *desc = opaque;
-    intc_enum *enum_ids = NULL;
-    unsigned int first = 0;
-    unsigned int width = 0;
-    unsigned int mode = 0;
-    unsigned int k;
+    intc_enum *enum_ids;
+    unsigned int first;
+    unsigned int width;
+    unsigned int mode;
     unsigned long *valuep;
+    unsigned int k;
     unsigned long mask;
 
     trace_sh_intc_write(size, (uint64_t)offset, value);
-- 
2.31.1


