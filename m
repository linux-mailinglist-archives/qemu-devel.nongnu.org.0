Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3892EFB5A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:49:32 +0100 (CET)
Received: from localhost ([::1]:39044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0ZX-0002ob-FW
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TU-0005um-IG
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:16 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:47030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TS-0003JX-Uo
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:16 -0500
Received: by mail-wr1-x430.google.com with SMTP id d13so10352489wrc.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZI1VsMIy1r7CpfmYnpidWPrMlOcbS1JUAFKSEQ7RVOU=;
 b=Hg5R72USsu00Y09zOAmheKm55rDWUSMmE3Ys8Vfw3hlak2Kb+i9CA1AOLgh0QXLSVW
 mIlpQ38aygeFkzkrJ0Un1sUXV/Rm5nwxxQ9GRnctNWvVyvNCruMGZnmlavbfj91iOBhU
 J6PfqcG2rdJ64JRkczI+S+3RUlH96c1NmUmjceQHI84N9NhcMpoq9Jrg/O0VXqhq2F8N
 rlTAzuWt7+Yo3h8HQjOMXxXefZhWriO3arbBkaBzh1EbnqC9FbrYQ0jBq7EXF0m6dlW3
 SE0tWCRPe+4xE0jg6f4Arjg6TAR4v4wH7aurfSGI7yS6uS1jwMs/nAwZUQ7nhOmcwAHc
 NfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZI1VsMIy1r7CpfmYnpidWPrMlOcbS1JUAFKSEQ7RVOU=;
 b=WpXgGV8Z7fGP6L55PZ/KGA6conHmoTmtfujJ8vf0KSzNtUhVLHUCp95JDjHqCjjRrW
 OTXKbKaXLMjCkCjVAhNwqhgTFfUEPWlk4NkYLumbtk2wwXBDhs9A2YYEM1SRIE6ITa92
 K2geNJuk11ph9cB7e5Pm9JyJi4JfgbdchXS9myxqMDuDC1nQJp9hiQB2u3XYyI3hXmZn
 fhYpndsa1ZAhCxptZZlYBCE/YEy0sXRxMS0AzwJAXxWhHbr6tDknBOhYfsDnOOFRNR1J
 ufjVI3uUNctlGoy4t0aV3prNe3u+UKMERxzGtdUfHo5XbYMwSbwZbVa/ZmcVxfGAEKYw
 2eiw==
X-Gm-Message-State: AOAM533ftIC9wT6gIvgrWYHz1gQsEezaz77Mdk6fc4gMX96oaNiEhKGc
 AOcH4NmW+llBFWQ6mwvP/cu43Q==
X-Google-Smtp-Source: ABdhPJyPRtSzZqVJFxUgYWvxdAPek5cnHqomN9oChpBCBkk4ekIdD6Yv+0MqjGXZBpthQbtacweKrg==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr5682010wrs.284.1610145793659; 
 Fri, 08 Jan 2021 14:43:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r15sm14997298wrq.1.2021.01.08.14.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:43:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CDF6B1FF98;
 Fri,  8 Jan 2021 22:42:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 09/20] gdbstub: ensure we clean-up when terminated
Date: Fri,  8 Jan 2021 22:42:45 +0000
Message-Id: <20210108224256.2321-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108224256.2321-1-alex.bennee@linaro.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you kill the inferior from GDB we end up leaving our socket lying
around. Fix this by calling gdb_exit() first.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201214153012.12723-7-alex.bennee@linaro.org>
Message-Id: <20201218112707.28348-9-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index bab8476357..8c301edf32 100644
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


