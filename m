Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A27153611
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 18:14:03 +0100 (CET)
Received: from localhost ([::1]:53728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izOFV-0001r5-V9
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 12:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1izOCI-0004qP-W7
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 12:10:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1izOCH-00050r-RU
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 12:10:42 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55241)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1izOCH-0004wj-L8
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 12:10:41 -0500
Received: by mail-wm1-x341.google.com with SMTP id g1so3304735wmh.4
 for <qemu-devel@nongnu.org>; Wed, 05 Feb 2020 09:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KcowZQvidWsL6K9vNr5PA0mK1ZdxCgzSQNRXFm9TCF8=;
 b=grA72OqPGdCWZW1QEGhC+Nb8S3Niuc1geHth+N1LGYbNe5A5lZAlHORAozYIuLoHYx
 0B/d+umP3NZ5Gxz60d/REI/9ypRMLjyNxA9cRkaM/cQ7MXchTxD+WB8797j7lZm8hN1s
 OkD5JXxXXsc3hhhecSlWm+6DtoS0QN8DZZKPaDs8Qql6ZGU/JHRxbFmYzvGfbrKoDy59
 NApDiDWE5r3o2i0SslKFVJbgC4FUL71AIwIXGHJe8e3P+Qeh4C6+rK81aDxbzlh/KKaN
 Rq3emWRQNRbUucozgy1M7RZ5+DYcmZFra4vb/4O+ROohsnYNKRVljJ6AQzIC3r6YH4sX
 ibPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KcowZQvidWsL6K9vNr5PA0mK1ZdxCgzSQNRXFm9TCF8=;
 b=Fb70R1nMRXwKudbETaH8nMgEbUvjACH/CxJYTSHNavea+fjLESkXT2OsFAPnUzTlKZ
 BDmWyU9VV2SfuMtM1S9ccCQwuFDHoggMTZEW2pZSNZjX+wAP7jZW6hMFJvV7i7cIu8IA
 POPjYOPld51NJMNSt8AGZag4HTFnuln9CP4CWbqoB4fX+z/DzuJCPO+26bg9hdjxHuPK
 M3dH2zZdclu6ED0d5230IKsqTbI3bcMmbIYe7pfGZo0B+dI5BgFt+4U7ksubbHUfM2Pz
 OuB61pkimBJ+Twv+z0wKJM2VkZ2jY4IfTX6V9QjJ4RlXJLC4uiwY4a4Ha1x1jM82y4OB
 V/Tg==
X-Gm-Message-State: APjAAAV0qs7AHZxX50rYbbqBlaW+v0QFerMco4zlC48EzchjpscdCcGW
 yqLj9zwzWKSTGmXNdCeisV2hWQ==
X-Google-Smtp-Source: APXvYqx6XlqQuBT/IhB4OsLUlfIV/1O6LxCulL311VTTHljUPGgh65k9ApWdaM/8RLbjtEoP2LizXg==
X-Received: by 2002:a1c:610a:: with SMTP id v10mr6521729wmb.44.1580922640609; 
 Wed, 05 Feb 2020 09:10:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 133sm238654wme.32.2020.02.05.09.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 09:10:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 08F121FF92;
 Wed,  5 Feb 2020 17:10:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v6 05/22] gdbstub: add helper for 128 bit registers
Date: Wed,  5 Feb 2020 17:10:14 +0000
Message-Id: <20200205171031.22582-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200205171031.22582-1-alex.bennee@linaro.org>
References: <20200205171031.22582-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: damien.hedde@greensocs.com, luis.machado@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, alan.hayward@arm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v2
  - take care of endianess of the whole 128 bit word
---
 include/exec/gdbstub.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 08363969c14..59e366ba3af 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -102,6 +102,19 @@ static inline int gdb_get_reg64(uint8_t *mem_buf, uint64_t val)
     return 8;
 }
 
+static inline int gdb_get_reg128(uint8_t *mem_buf, uint64_t val_hi,
+                                 uint64_t val_lo)
+{
+#ifdef TARGET_WORDS_BIGENDIAN
+    stq_p(mem_buf, val_hi);
+    stq_p(mem_buf + 8, val_lo);
+#else
+    stq_p(mem_buf, val_lo);
+    stq_p(mem_buf + 8, val_hi);
+#endif
+    return 16;
+}
+
 #if TARGET_LONG_BITS == 64
 #define gdb_get_regl(buf, val) gdb_get_reg64(buf, val)
 #define ldtul_p(addr) ldq_p(addr)
-- 
2.20.1


