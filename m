Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF19313E98
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:14:08 +0100 (CET)
Received: from localhost ([::1]:45812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Bz5-0000jz-FR
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95pE-0003fx-EY
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:39 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95oi-0007kk-9g
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:22 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r21so669687wrr.9
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NRda7hohv+ORS/AyN1sYb9iTKw761l7PAGPzaaV6iHY=;
 b=yMc8TcunZRgGeRtGNmhWgxR56Jp0jPpdaqo8kGLH1Zf/pId7wXkAQqfmMaKcDsKEAJ
 v4LOeoXqCGwZyyAUPkrjCAJwwYXM5PvYTZzCqCBXwwZ4Wxms1/UzlAO2Nfo8vB5vv7AW
 tAJLFkUpTKQMquR0m4j020eRejweGzqALAGVoOvMlfyoz7b7JDuL3oWSOswY3fwVXTTu
 D5QPbQbrifAjoUvZ0HJdt9TPZCmHUuVEJjsWQFOL7XbUVtCj47JPYfpJ16mhza6fJv7i
 pN+rZs83IjM9KJANvw6NZYZZCBWxnclDRUv0Nni777lcvafPmW+DKZ9mINF6uQ2D/kQb
 /nDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NRda7hohv+ORS/AyN1sYb9iTKw761l7PAGPzaaV6iHY=;
 b=FD5zX5JZKn8/k2mz5UIIk7UxECqI5gu1CBa5aNFWJrl/jetcOQJcB0J/9YryfoseCw
 lDeLhRuQO2sTLBkMzeZMekj+J3DklcloDk9sYDc3eD1f+omoS3GUDWvRj2B3vcdWQlsF
 r4Cw0dxtOywoPzAPzEEK3EayqPo+H6qn8DRRB5LXlb2F9fHZX7XItSioyfDenQ5cedpT
 ZAbFDAkLuBJ85FYgKYR5mQ8+tigSRGd/fjOipgBRZ/2VYZoDJ/0QZqAYozOAvfBlSLNp
 NXc6udMq59WmDqRjSYdaTQ4LP9WAJ/+tjQL6MLFWGi8U3EoP3td01/Sq+43gyVpZDAWy
 N9lQ==
X-Gm-Message-State: AOAM533qMjtql+PSl8UFyuAW7ubH0n3/Zl6q1Lx7z8JlpDHzJY8dMq/m
 vVc/MlitQoRirjMoP/YcKzJjLQ==
X-Google-Smtp-Source: ABdhPJyA2vmeGabSOdoyZTAUOJyW2ebbOKnGb9hGy3lryUiQRsAZcajA6ynoVr2TjNs9SOfeb/cQBQ==
X-Received: by 2002:a5d:4383:: with SMTP id i3mr19822242wrq.293.1612787923465; 
 Mon, 08 Feb 2021 04:38:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k15sm20168078wmj.6.2021.02.08.04.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:38:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB9F31FF9A;
 Mon,  8 Feb 2021 12:38:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/16] gdbstub: Fix handle_query_xfer_auxv
Date: Mon,  8 Feb 2021 12:38:16 +0000
Message-Id: <20210208123821.19818-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
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
Message-Id: <20210202134001.25738-11-alex.bennee@linaro.org>

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


