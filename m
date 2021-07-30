Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053363DBFCD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:27:18 +0200 (CEST)
Received: from localhost ([::1]:54900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z6D-00080f-1F
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yyv-0006D6-TV
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:45 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yyu-0001Bx-0S
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:45 -0400
Received: by mail-pj1-x102b.google.com with SMTP id j1so16842958pjv.3
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RvQdQFOqZAua2VjIGleNmluh7reCfzFuoJQXI/+8inM=;
 b=M5wPVGYldyGNSDhCr+5PcVN5FZwNNbm3ZwUNJNNbB6R51ZshMfmeqWFdTsRxmwOj9l
 wGQhDmBTnviMqVUgLIGbKfdCxuROIJJ9FY+JQsfZ+3olLa6tt81wlpXDafdDPGAxjx2S
 cFbjHdVMdaGU8TchSUtM3N0aHWBl/PgQOaO+OeQqRFL2l19xW4LpFDU1+a4gmAA7QZGt
 UQd1NBwjnntWSrMyHCDV/M4uPRm/d6m4HhWr9c3TsphePw3bjGf6+RLcdiNwKVwK3CON
 ZsPpYQFYeAcoMjjCYyHybo4j9Q/3z77QoJErMDRBkz+GrsYUM1YATbI2TVRrnAdh1dgn
 /8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RvQdQFOqZAua2VjIGleNmluh7reCfzFuoJQXI/+8inM=;
 b=XN5a5MQg0Ibz0Gkl1CFbCHfoJky7gyKBRRF24nt8rso/ou8nHq/3i7H1m3MSYZOqMj
 skaogMWM8W0TvuLP9QAhWSVC8PIaHxXaYTOcqjLX7yX+/b6N5t85GcWTdGmBUlwK3QCq
 oxTQniWJEwvgxoCjWc/qLCZ8Q0dkRK15uWxvcYNTkAqTAuCk4AnNNSuUouIm0IrYrV8X
 g2yxFx/FwOeIla/QKSMTiy/rKWR42Y/6fjDXKhoHPCpm9hVMiXETc9nu0mHFPq+7V/PM
 4quOkmlWE98r5xi1jG4seo6uEHRtN/SILoTJc7ZamJUxTa1a6KpLsM5jMG30ZeKs88pI
 FNuw==
X-Gm-Message-State: AOAM531dMuyMcNj0pbVW3j8Olc5zHlBTnCDf3Muh1hcDBxdxa8G8A3WA
 ydqm6um+xn9J/rweHfEofKMJjFB3GDvpAw==
X-Google-Smtp-Source: ABdhPJydPh1tv6IMmEt04TE2fvViBfEEN8uuT6nEwJeGVzDaepXHtXY+SgRNtjQwM8LocPjXJu3G7g==
X-Received: by 2002:a17:90a:9483:: with SMTP id
 s3mr4944312pjo.22.1627676382648; 
 Fri, 30 Jul 2021 13:19:42 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:19:42 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/13] python/aqmp-tui: Allow copying message from TUI
Date: Sat, 31 Jul 2021 01:48:46 +0530
Message-Id: <20210730201846.5147-14-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210730201846.5147-1-niteesh.gs@gmail.com>
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: ehabkost@redhat.com, kchamart@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, wainersm@redhat.com,
 G S Niteesh Babu <niteesh.gs@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit adds a feature that enables use to copy
messages from the TUI after highlighting the message
in the history box using up/down arrow keys and pressing
alt-c.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/qemu/aqmp/aqmp_tui.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index 4bae0d4e89..434f431a35 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -21,6 +21,7 @@
 
 from pygments import lexers
 from pygments import token as Token
+import pyperclip
 import urwid
 import urwid_readline
 
@@ -390,6 +391,14 @@ def keypress(self, size: Tuple[int, int], key: str) -> Optional[str]:
                 self._update_highlighting()
                 self.change_focus(size, self.highlighting)
             return None
+        if key == 'meta c':
+            if self.highlighting == -1:
+                return None
+            widget = self.history[self.highlighting].original_widget
+            text = widget.get_text()[0]
+            LOGGER.info('Text is %s', text)
+            pyperclip.copy(text)
+            return None
 
         # Remove highlighting if someother key is pressed
         if self.highlighting != -1:
-- 
2.17.1


