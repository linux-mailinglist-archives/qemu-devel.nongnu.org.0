Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39AB2D9B2D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:37:33 +0100 (CET)
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopum-0006K0-RG
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopny-0007o2-Iu
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:30 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopnu-00068a-2I
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:30 -0500
Received: by mail-wm1-x343.google.com with SMTP id a6so14110861wmc.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 07:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mswVJ8W6L1K/A6VuFf51dF/y+gVp/RoCPsfkvo9QLzE=;
 b=QVkwCJ/j3zPIV4YA1tBPzveprpEbQjG+cxzTzsAUbIdpiDQPZfCdu27TyzapPAHyK6
 x8VglSx26Z+Qh1nF8zqljmNUOYv5gSGDgIbjQ56qOZIRCvS3oSHHFj/a5naNNeoDaw3T
 nXVj7Q2xp4wtpts9rqBOxK+zvS0GyCDq0nNewRodU+1k2fPx0K4Yk/L1RchsyzF8kBxD
 aqtJFG+UdvWUvJRU7wKpyICezroRgzPUN5ie56b+84xxOc4+R9tByTx7+EtZcO+sF+2c
 Rig2ZmvKtHji14K2+x25p5e0+bo0rkjtWC+kfiGm5/7AXWqqsusEMoLPtFZDLbAcKvmg
 gk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mswVJ8W6L1K/A6VuFf51dF/y+gVp/RoCPsfkvo9QLzE=;
 b=MmPUBWrr+T+m+9/aFuJr/7aWl9Hv/Wh+D+GiPAIZ79yYz42J20Lq14OQGdD5sNbA79
 O7lSNTGhWukevbgQHEiXBVtMsPcHVXHvflZjc2n9iwU9+fwKj/KAcnK53N1cMvGeDpa8
 3JhN3lz8hakrqHHUoV02eKopvC/Es1AemL3qdQeme9qU3UeYbqi5qD5kn+wj8O6pxop6
 XX+skAyF74WLNUtNGwlU0Hby6sQerDNC7hIaihcpB87fQAToBAaTRkTupfIwpoBnNovB
 rDMEgSiI9oJKVZ7KwcrWUJc7xeEAh1iB0/jIcBUCCrqMJYEefKA9Mp7YCAsDsoDjSUHX
 zIUw==
X-Gm-Message-State: AOAM530sNQsMvyToiZj6+qM1X09nC/XQo6Aevn3M+ryzN88ok3u8NUTr
 sdrtQ0O7A0jF1BIwhaAKzYDXfg==
X-Google-Smtp-Source: ABdhPJwonk04q+wMmGuxNV4GL6KGT9uZoVdun8MW0QA6mbXtO3SiN6ZAIvgNYRCdNRILWGMYNtfh8A==
X-Received: by 2002:a1c:a785:: with SMTP id q127mr23794528wme.25.1607959824657; 
 Mon, 14 Dec 2020 07:30:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a144sm31463691wmd.47.2020.12.14.07.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 07:30:18 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 494341FF92;
 Mon, 14 Dec 2020 15:30:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 6/6] gdbstub: ensure we clean-up when terminated
Date: Mon, 14 Dec 2020 15:30:12 +0000
Message-Id: <20201214153012.12723-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214153012.12723-1-alex.bennee@linaro.org>
References: <20201214153012.12723-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you kill the inferior from GDB we end up leaving our socket lying
around. Fix this by calling gdb_exit() first.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 7172f063a1..61fe2360e3 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1978,6 +1978,7 @@ static void handle_v_kill(GdbCmdContext *gdb_ctx, void *user_ctx)
     /* Kill the target */
     put_packet("OK");
     error_report("QEMU: Terminated via GDBstub");
+    gdb_exit(0);
     exit(0);
 }
 
@@ -2539,6 +2540,7 @@ static int gdb_handle_packet(const char *line_buf)
     case 'k':
         /* Kill the target */
         error_report("QEMU: Terminated via GDBstub");
+        gdb_exit(0);
         exit(0);
     case 'D':
         {
-- 
2.20.1


