Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6408F30C026
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:51:25 +0100 (CET)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6w5U-0007Bd-0C
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuu-0003th-Ew
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:30 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuq-0007P4-0f
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:28 -0500
Received: by mail-wr1-x429.google.com with SMTP id a1so20509869wrq.6
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+V+VHFv4/e/yHtk8Ffju7fS512Ym9qRjG5IowmRiKvg=;
 b=tLmccLwhoY9zNU2Nhb3owS01UuklYoT8j9yIzjt3btvs9bhyOqv7UXg9ZfxkyEgsbD
 2Q5Bb1ip2efWobtut0bnbtY13sNLQ8TWvHctKS6abtVDGTWlEiwaxGpLpi8J7mZHmNJ7
 kHlyVxvq9tJuyqGU8ZzDz3yLM32s3scENMjG961CeBrt2ieDpyPZuuEi4isVCE/UnVzO
 WsVgXlwTydl94vXUzCsUmobk8z83p1B3EQa/ju90JwXy1eRjgXc/SAexhiO7vVAmrLU1
 5QgxednKckjlywTSdxSP8moy1Jt3a7qdylAbeJRRvMXK4rM2D8nXQYjiVqbVAK/EwMat
 QzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+V+VHFv4/e/yHtk8Ffju7fS512Ym9qRjG5IowmRiKvg=;
 b=bL/HcZnedDn7ReeFGHcqqVTQM84yhRcZZA/wn0ByWT2w6i4qORtZKwpOuIBMz8QF3Y
 sX+WNj4RjvzCIW2WSeY4GzkSly4906p/pVxgPyeWfZKS5UWpzyUGmPxo2W2Ixzrb79P9
 EGavl8Ha4d8lNflB/1R0DGRdcERi2HDSg5Ww8j/8F6kD+vG4b99G6XRA07RKatw84hyK
 GL7sRKtOv/Er+G9jdECxEe9jhtywIhvLMszT02eGGQSSWgaPXlxuCnKJFTcIe7LJXPRg
 H48Ru8APWOjMS/iGfxAYtZZM7pNHofwYH6zNgna33nkYsub1zHdP7o61TZs9F+pXN/x3
 I2RA==
X-Gm-Message-State: AOAM533rOmbaCNj2HWdXUYjBMVLPz3dnV+2TfxsLjWZ45oUvTgxvFMS+
 wPG5PMdE23pZiRfr7Danry2wwQ==
X-Google-Smtp-Source: ABdhPJyJiT+nVY2y8qHKJnTLa2KNpUYGezW6aCAPphfOSdI/fZxL+qTkIoBi97jVJu02DjHFU4ZDcg==
X-Received: by 2002:adf:cd10:: with SMTP id w16mr23638564wrm.90.1612273222424; 
 Tue, 02 Feb 2021 05:40:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e11sm31550314wrx.14.2021.02.02.05.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1DC21FF99;
 Tue,  2 Feb 2021 13:40:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 10/15] gdbstub: Fix handle_query_xfer_auxv
Date: Tue,  2 Feb 2021 13:39:55 +0000
Message-Id: <20210202134001.25738-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The main problem was that we were treating a guest address
as a host address with a mere cast.

Use the correct interface for accessing guest memory.  Do not
allow offset == auxv_len, which would result in an empty packet.

Fixes: 51c623b0de1 ("gdbstub: add support to Xfer:auxv:read: packet")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210128201831.534033-1-richard.henderson@linaro.org>
---
 gdbstub.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index c7ca7e9f88..759bb00bcf 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -2245,7 +2245,6 @@ static void handle_query_xfer_auxv(GdbCmdContext *gdb_ctx, void *user_ctx)
 {
     TaskState *ts;
     unsigned long offset, len, saved_auxv, auxv_len;
-    const char *mem;
 
     if (gdb_ctx->num_params < 2) {
         put_packet("E22");
@@ -2257,8 +2256,8 @@ static void handle_query_xfer_auxv(GdbCmdContext *gdb_ctx, void *user_ctx)
     ts = gdbserver_state.c_cpu->opaque;
     saved_auxv = ts->info->saved_auxv;
     auxv_len = ts->info->auxv_len;
-    mem = (const char *)(saved_auxv + offset);
-    if (offset > auxv_len) {
+
+    if (offset >= auxv_len) {
         put_packet("E00");
         return;
     }
@@ -2269,12 +2268,20 @@ static void handle_query_xfer_auxv(GdbCmdContext *gdb_ctx, void *user_ctx)
 
     if (len < auxv_len - offset) {
         g_string_assign(gdbserver_state.str_buf, "m");
-        memtox(gdbserver_state.str_buf, mem, len);
     } else {
         g_string_assign(gdbserver_state.str_buf, "l");
-        memtox(gdbserver_state.str_buf, mem, auxv_len - offset);
+        len = auxv_len - offset;
+    }
+
+    g_byte_array_set_size(gdbserver_state.mem_buf, len);
+    if (target_memory_rw_debug(gdbserver_state.g_cpu, saved_auxv + offset,
+                               gdbserver_state.mem_buf->data, len, false)) {
+        put_packet("E14");
+        return;
     }
 
+    memtox(gdbserver_state.str_buf,
+           (const char *)gdbserver_state.mem_buf->data, len);
     put_packet_binary(gdbserver_state.str_buf->str,
                       gdbserver_state.str_buf->len, true);
 }
-- 
2.20.1


