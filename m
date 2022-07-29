Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE399584E66
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:53:10 +0200 (CEST)
Received: from localhost ([::1]:34468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMg9-0000Jk-OP
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMFC-0005Vd-C8
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:25:20 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:45771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMFA-0006h8-N4
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:25:18 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u14-20020a05600c00ce00b003a323062569so2211916wmm.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gy+5PY+WqRlaBvLBWvCWjtIPhrWvg0Op57/GOX9XBTc=;
 b=B8WD5jcwmYY/eu507A0UUFniFZ2KTaBxMKjt/Ag9mtcryY9oWp9LMGjfdHEbG2//N+
 57wcH71bR2lKnhXsHaZpJdgmEgcMgggPzLu/E4pVolVMNPLrf404tXUky2zomi9FykTY
 2bitlYNTILYalS44c8USFPymwG9nQQQSW/qY1gjaTR9Hog+KZJ3INiS7tPIPksBk07wV
 rT7o7qDbhmdaZEEhofBGTrsknPOMLJMkT+PC6a3SZtvwU6nmlqZDrbJRCnhuVmshMY3I
 N77e0R9rtvKQmqnmk9PiuW/D0O9P2WdjPr/Ddhw1tPWofmpEMIhtpSTtfWDodIU1S0Pk
 XBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gy+5PY+WqRlaBvLBWvCWjtIPhrWvg0Op57/GOX9XBTc=;
 b=VTuLswGHtBhgLR0wwXlUPaOWTwPLRLEHiRUWOGUPvq1mJIKsZSz64+kbZ31bC8RVpp
 9bw75k1ByPb37iZh37FN/CDcrGBbWkJejZsCf8gaOZisKSMAe2CovkmuqBiEgZqp7SwZ
 Mi6GfpL7kIDTXv+oNX/FRDCEq3H0U6qnatEQHMQOdmrKzRDNJe8lAvk+aiXBr6/Zgwnq
 nWZQ934zhZ2dtJ+CebKqEfp4Dp3pIAQqgDjEqtm3deihiCXAUu/RUu9dHFQbilYBrCpV
 frPWgh9E8sXpXYgReES14tEAETUeE3auOnLpfwOtG1QfJPRo/biA2JhaSC0zefzzemPr
 63GA==
X-Gm-Message-State: AJIora/d069X73z1wPcn7FnM0bNhN9yCl6xBBQPxSorumdW73xSpz1Uq
 0BRiU/t/9EAUJqQNTV6PNVgk/Q==
X-Google-Smtp-Source: AGRyM1sZIbKVOpPX6W/zeecnBTBj0qR28bZOsZDp8Robh8xmWb8OxUoIb/qP1s3OwXbx3YE9WdRf2Q==
X-Received: by 2002:a05:600c:22c2:b0:3a3:19e3:a55 with SMTP id
 2-20020a05600c22c200b003a319e30a55mr2170372wmg.53.1659086714974; 
 Fri, 29 Jul 2022 02:25:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bg3-20020a05600c3c8300b003a327b98c0asm4361866wmb.22.2022.07.29.02.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:25:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C8C851FFC3;
 Fri, 29 Jul 2022 10:19:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PULL 11/13] tests/tcg/s390x: Test unaligned accesses to lowcore
Date: Fri, 29 Jul 2022 10:19:41 +0100
Message-Id: <20220729091943.2152410-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test to avoid regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220725223746.227063-3-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
new file mode 100644
index 0000000000..a34fa68473
--- /dev/null
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -0,0 +1,9 @@
+S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
+VPATH+=$(S390X_SRC)
+QEMU_OPTS=-action panic=exit-failure -kernel
+
+%: %.S
+	$(CC) -march=z13 -m64 -nostartfiles -static -Wl,-Ttext=0 \
+		-Wl,--build-id=none $< -o $@
+
+TESTS += unaligned-lowcore
diff --git a/tests/tcg/s390x/unaligned-lowcore.S b/tests/tcg/s390x/unaligned-lowcore.S
new file mode 100644
index 0000000000..f5da2ae64c
--- /dev/null
+++ b/tests/tcg/s390x/unaligned-lowcore.S
@@ -0,0 +1,19 @@
+    .org 0x1D0                         /* program new PSW */
+    .quad 0x2000000000000,0            /* disabled wait */
+    .org 0x200                         /* lowcore padding */
+
+    .globl _start
+_start:
+    lctlg %c0,%c0,_c0
+    vst %v0,_unaligned
+    lpswe quiesce_psw
+
+    .align 8
+quiesce_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+_c0:
+    .quad 0x10060000                   /* lowcore protection, AFP, VX */
+
+    .byte 0
+_unaligned:
+    .octa 0
-- 
2.30.2


