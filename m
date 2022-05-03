Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF4B518F2B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:44:05 +0200 (CEST)
Received: from localhost ([::1]:45442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzNM-0001E4-PR
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZm-0000ZJ-Li
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:50 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZk-0006Lz-VJ
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:50 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso3236773pjb.1
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7hrYGm6CB5wl83BARKhSg3dxjfTTX0HLuXW9+o58cZc=;
 b=an/9bH1s1Sd2UKZccy/vCK9LjN63Y5lWUvFKNK9c7eakLmlMK/zcLoAan6KiX4/UoW
 /WEFmYOFMG9kUFf0njFTv54ghU4az9F6SZYr99TAbWzusTzu/ARsuwEL2Kb2jAqF94uN
 22mqJ5hBzW/QIMydjGVnPU6H6Y0SvzL9L9ekrqVOtFfHmTMQq48Tejed7754G4Wcz3yo
 tnTA+3rndlWP9rkea5M5uORYiQnCWj/1REeQnqyHVZphOC+TbJ4D6x/Vts1/l49s+5Ay
 FgDHPv2SVnUMLxKkrO/s1zpYyKTj3MdIR9QRnmztyYrsoqpzlJBPOLAzk2PimqKuAli3
 //Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7hrYGm6CB5wl83BARKhSg3dxjfTTX0HLuXW9+o58cZc=;
 b=iN+rnx6UHbRMLf6U4NoBQhqFGWT4qEAKySUNVIhYsnARsoUT+19HEeNteNfm27GTVn
 xsDKrGVsfjNA+AQCJ2Mbw9FXzgTqPz5dFw9TAzjjEe4bBkBct1aoDz2D2cYvKnvceCZv
 o3Jbv3m97dXAYfDX+frP87BidRcTtNnXtUGsmzHsvXY3Mf3Rpo6dgXqTsfpB1ieapGet
 1Tf9qcvlRKyvqMfFxqOZqduKP9aopuk4DjdoAZl5eOyd0lLll+oQhbFZ+fiwauXXtTcn
 T94JYoE0ApzCeFzXooQvwpTgMAe2X6tX8t/fvaPIQGtD7okEW55zE8NSadkazRAMVPIm
 00oQ==
X-Gm-Message-State: AOAM533B1yDc19Vy4ttrLcJjQWlMxUAQWprtoASyhi71ZxgumUCnHwBE
 d+SIUb7XOwVfUW84YvvklxUusCpcuaNMiQ==
X-Google-Smtp-Source: ABdhPJxouzSepM8WB/5Tvd8B07D/3kUqwmf8X3qjYv8MBi94OHNsDp0SQgfmyWJxq2hI3jEKbXJMGA==
X-Received: by 2002:a17:90b:33c8:b0:1d9:9023:1103 with SMTP id
 lk8-20020a17090b33c800b001d990231103mr6394643pjb.26.1651607568148; 
 Tue, 03 May 2022 12:52:48 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 62/74] semihosting: Remove qemu_semihosting_log_out
Date: Tue,  3 May 2022 12:48:31 -0700
Message-Id: <20220503194843.1379101-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/console.h | 13 -------------
 semihosting/console.c         |  9 ---------
 2 files changed, 22 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index 61b0cb3a94..bd78e5f03f 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -40,19 +40,6 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len);
  */
 int qemu_semihosting_console_write(void *buf, int len);
 
-/**
- * qemu_semihosting_log_out:
- * @s: pointer to string
- * @len: length of string
- *
- * Send a string to the debug output. Unlike console_out these strings
- * can't be sent to a remote gdb instance as they don't exist in guest
- * memory.
- *
- * Returns: number of bytes written
- */
-int qemu_semihosting_log_out(const char *s, int len);
-
 /*
  * qemu_semihosting_console_block_until_ready:
  * @cs: CPUState
diff --git a/semihosting/console.c b/semihosting/console.c
index cda7cf1905..5b1ec0a1c3 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -38,15 +38,6 @@ typedef struct SemihostingConsole {
 
 static SemihostingConsole console;
 
-int qemu_semihosting_log_out(const char *s, int len)
-{
-    if (console.chr) {
-        return qemu_chr_write_all(console.chr, (uint8_t *) s, len);
-    } else {
-        return write(STDERR_FILENO, s, len);
-    }
-}
-
 #define FIFO_SIZE   1024
 
 static int console_can_read(void *opaque)
-- 
2.34.1


