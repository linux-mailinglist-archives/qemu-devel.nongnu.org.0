Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227E14E815B
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:12:44 +0100 (CET)
Received: from localhost ([::1]:46356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY79n-0006Ck-69
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:12:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Ra-0007sC-Cu
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:27:02 -0400
Received: from [2001:4860:4864:20::2b] (port=45854
 helo=mail-oa1-x2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6RS-0005YH-QE
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:56 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d6ca46da48so10699819fac.12
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lb1+Il1eKojAxX+nWwkLAHUYjVhh/WZK+1C1/5aXdGI=;
 b=ntkMSatQNWi3Iw6d9a742+4oLl0NPa/m6t0X6VAgU+/za/OGHh5/ThztlcIj2w5Qhm
 w9JIKTPe9yoqEqcz6jVH0XQUjapx2/OKb/bda4VVx+OJ+CX9zrDvHUp/HrGFc0aLaML8
 GbSfX+fWpKm7Mmxrc8Pw0N1RTkJGKOFb1TGNHUixs1w1Rq1JwyiigKgcTA2J7Cu3MM+L
 rGotRTOvQlX+sUGJsSBFdHWAHrSubqwTKxTfzFxjdWSd/B6YGWZQhunpCd80xhE2aY+o
 8xGb+Kf6CbRotUwluGMtiZuPt+6OHQyzAGsAtoQNiLck2FpAMfnuKzcdWDwN3B1peQ/p
 rE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lb1+Il1eKojAxX+nWwkLAHUYjVhh/WZK+1C1/5aXdGI=;
 b=kZ8bdYhqiT3P6+CjgJDkxMLxaLcVLcGSFn1Pj24ygFMsA4f/gmWzoHd5y7J6aYLbTY
 pKq3eaWrhC9aSyEeHlGVy1E31/4RHNIVcdAVRCGIyKEou0ETD++hPe2o+sZCKVk2nFV3
 OsA4i0P5I/7Pa71PSZD0zmTwf5aicCMq+NFVrfysU0+DnLs6zJ/WQwHBk9gEL8snySdM
 O/6nnAHHkV7bBdrsOna/rcO2bsPHLpxhlFk4vi+9VIJrr84MzEy8QT2AwThjKt1/s8CV
 xnDFXELr0HalxsoaFAQiBLipELej4NUxaSaMBG2rwNB4wrXq/H2K41T5RHR8RC3Bo1v8
 JpFA==
X-Gm-Message-State: AOAM533JlCpf1QEoZA7VheleCRjxQmamTxJ/0jTvp1BTZvIrGoEKpQrL
 vF4522DMW4SvVUALokWAYuhTwIAUPjyexoda
X-Google-Smtp-Source: ABdhPJyQVUsU3E010BP8lQmQ+9U85ZzRL+dDaLgU1LMXrBTmsIGe2n1ECuFg/KGlD73Rw6MX00/LRQ==
X-Received: by 2002:a05:6870:601b:b0:de:c5bd:e36b with SMTP id
 t27-20020a056870601b00b000dec5bde36bmr1946038oaa.89.1648301194946; 
 Sat, 26 Mar 2022 06:26:34 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/39] linux-user: Use qemu_set_log_filename_flags
Date: Sat, 26 Mar 2022 07:25:24 -0600
Message-Id: <20220326132534.543738-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2b
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Perform all logfile setup in one step.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index d263b2a669..0297ae8321 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -85,6 +85,7 @@ static bool enable_strace;
  * Used to support command line arguments overriding environment variables.
  */
 static int last_log_mask;
+static const char *last_log_filename;
 
 /*
  * When running 32-on-64 we should make sure we can fit all of the possible
@@ -257,7 +258,7 @@ static void handle_arg_dfilter(const char *arg)
 
 static void handle_arg_log_filename(const char *arg)
 {
-    qemu_set_log_filename(arg, &error_fatal);
+    last_log_filename = arg;
 }
 
 static void handle_arg_set_env(const char *arg)
@@ -643,7 +644,6 @@ int main(int argc, char **argv, char **envp)
     int i;
     int ret;
     int execfd;
-    int log_mask;
     unsigned long max_reserved_va;
     bool preserve_argv0;
 
@@ -677,10 +677,9 @@ int main(int argc, char **argv, char **envp)
 
     optind = parse_args(argc, argv);
 
-    log_mask = last_log_mask | (enable_strace ? LOG_STRACE : 0);
-    if (log_mask) {
-        qemu_set_log(log_mask, &error_fatal);
-    }
+    qemu_set_log_filename_flags(last_log_filename,
+                                last_log_mask | (enable_strace * LOG_STRACE),
+                                &error_fatal);
 
     if (!trace_init_backends()) {
         exit(1);
-- 
2.25.1


