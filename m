Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF12375504
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:43:53 +0200 (CEST)
Received: from localhost ([::1]:37110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leeIC-0005bS-IK
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeD5-0007jG-Lf
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leeD4-0007vr-1L
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620308313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dmSw65R373KTKOSFnzTrI/V4leURDKdprV/OcTyehJU=;
 b=IF1/a6ymFBnqPrr/2ZvXCau7QCmJ0EcXVAyBrrX1hRpo0DqfSRjiY54Bj9TJVATsf4I7Wu
 5QiwQI1KmqtnG4XovyNQ025jE8eDgg9FKqjxKXgoANsLUk2C6waa1RiSqP90j2B2Mm6ruK
 jb/YAYqcMuO/+jVpLClYyyAoO0OCaHk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-nb_KoJdXO-evjmwSof096g-1; Thu, 06 May 2021 09:38:30 -0400
X-MC-Unique: nb_KoJdXO-evjmwSof096g-1
Received: by mail-wr1-f72.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso2210950wrh.12
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dmSw65R373KTKOSFnzTrI/V4leURDKdprV/OcTyehJU=;
 b=I6GXCUfbtydqzDPbBZkSOjEKTE/tbMKr26hYrlOJcSR+H5qwOBR8MR5Z1xHu+5+Gdz
 m0ni3GKhArtc7Mbx3cNPU7LhlCYFEdxGl6za8aJK9RTqzLarllvD/Vdv2h0P5XoiMqt3
 m+v1faUUpP/YmyxfPj0G4dJGUt0O64fqbA5XpWoFeyMuY332mfLMuPz8gd4AhEFEQKKK
 Ers3C/Ugz6dwzC5uSXhhnSl8u7vLliqyiG2zaR/tTYCMvJZ0gPc7CL0oMq67dp0FrmBa
 YLsUnf33wgQO/4vZJKh9koKAFZ4CzcZtgBONSeZQM/zPGOvk6XE9gyJOf/CDgAM3QXpI
 iIxQ==
X-Gm-Message-State: AOAM531q0fpQ4dDLde0dJiYdl5sa+7LD8z8q6YGJGnmiHFFOkI5rNpRh
 7Askvh6yTsK/KDroYxjqfpciH6AOtV2VsZZAAAJgvg2W4cPiovJk45pRg/FR6e+HdY0gIwxkkkA
 z9p3LTZxmhTs7B9qbLcZ2J9j1qImk3VYBUBsv6Q2nvAV1X46P7eJ0RCwU5otbzfPe
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr15225997wmq.143.1620308309367; 
 Thu, 06 May 2021 06:38:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDIDMczepsuakeS2rOwouy+q2KMwVcj0QDOZPZg65zS1H29vCOvRHBjDW4Th8rjGTb2H7EvA==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id
 l15mr15225973wmq.143.1620308309193; 
 Thu, 06 May 2021 06:38:29 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id d3sm4089244wri.75.2021.05.06.06.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:38:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/9] gdbstub: Only call cmd_parse_params() with non-NULL
 command schema
Date: Thu,  6 May 2021 15:37:55 +0200
Message-Id: <20210506133758.1749233-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the NULL check on command schema buffer from the callee
cmd_parse_params() to the single caller, process_string_cmd().

This simplifies the process_string_cmd() logic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 gdbstub.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 83d47c67325..7cee2fb0f1f 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1368,12 +1368,9 @@ static int cmd_parse_params(const char *data, const char *schema,
     int curr_param;
     const char *curr_schema, *curr_data;
 
+    assert(schema);
     *num_params = 0;
 
-    if (!schema) {
-        return 0;
-    }
-
     curr_schema = schema;
     curr_param = 0;
     curr_data = data;
@@ -1471,7 +1468,7 @@ static inline int startswith(const char *string, const char *pattern)
 static int process_string_cmd(void *user_ctx, const char *data,
                               const GdbCmdParseEntry *cmds, int num_cmds)
 {
-    int i, schema_len, max_num_params = 0;
+    int i;
     GdbCmdContext gdb_ctx;
 
     if (!cmds) {
@@ -1488,21 +1485,21 @@ static int process_string_cmd(void *user_ctx, const char *data,
         }
 
         if (cmd->schema) {
-            schema_len = strlen(cmd->schema);
+            int schema_len = strlen(cmd->schema);
+            int max_num_params = schema_len / 2;
+
             if (schema_len % 2) {
                 return -2;
             }
 
-            max_num_params = schema_len / 2;
-        }
+            gdb_ctx.params = (GdbCmdVariant *)alloca(sizeof(*gdb_ctx.params)
+                                                     * max_num_params);
+            memset(gdb_ctx.params, 0, sizeof(*gdb_ctx.params) * max_num_params);
 
-        gdb_ctx.params =
-            (GdbCmdVariant *)alloca(sizeof(*gdb_ctx.params) * max_num_params);
-        memset(gdb_ctx.params, 0, sizeof(*gdb_ctx.params) * max_num_params);
-
-        if (cmd_parse_params(&data[strlen(cmd->cmd)], cmd->schema,
-                             gdb_ctx.params, &gdb_ctx.num_params)) {
-            return -1;
+            if (cmd_parse_params(&data[strlen(cmd->cmd)], cmd->schema,
+                                 gdb_ctx.params, &gdb_ctx.num_params)) {
+                return -1;
+            }
         }
 
         cmd->handler(&gdb_ctx, user_ctx);
-- 
2.26.3


