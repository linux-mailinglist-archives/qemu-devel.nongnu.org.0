Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F07AEDB6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 16:51:08 +0200 (CEST)
Received: from localhost ([::1]:40874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7hU2-0001Zn-CM
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 10:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNr-0005Xi-E4
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:44:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNq-00053l-5I
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:44:43 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38285)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7hNp-000533-VG
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:44:42 -0400
Received: by mail-wr1-x444.google.com with SMTP id l11so20811355wrx.5
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0rlPylnHuLKixhickeuo5/KvckwQXrJ/eGak0x254JU=;
 b=TP4FGPJnqWDNNaqsdxqiebobluuX7Dowm18Kz3kHyWoTByhD2xEyf5VfrTm/rDvUA8
 FupOUbrQw0+PfwZNxK1C5jmqfo4RuUmi1Bl2Rq0vyb+Tg+wnEI/uhOfe9AbEDfF+pkQ+
 VdUvNni/d3lHt/jkQYhNUFMbpYl6+LFoZQqROoYTMn0otdcxzIOdErz4i8mTxrjGhpva
 3hbEbqy/JtSmIELAJAaMZ/cYuCu19CNmj34mt/4FsLvp+yLlqKz4uAj1XhG+eHiUEdRQ
 oumvSysknBVXtsNDO9c/QtZbRKbVRmUJv7SEgAai3fyPy0A9E7IZeC3eM48sRZA8FSK0
 Gdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0rlPylnHuLKixhickeuo5/KvckwQXrJ/eGak0x254JU=;
 b=iQcEazgp3/tPSab6XnjxQBo/37ppYIasxIfnkVZ/xVP5KEruAJg/5lHupWKUjVTms8
 dN2wxhIeBiHdHpXc94An1XJydzdmOj4jEWjkJEbQZs673Sdkjkza4mia4NrxwjEWRw5c
 2tiy5o+MU5tfteGywwIQMUxBcPOZbkXN0Fx08iovZqIodDgJnP1DZa1NpUcxI4LBV+/g
 DlMLJE/KHNop046h0L91/bTndvh91Xu1hose7/skeFI6wlRd7dqqpjg4Hge48cdbSfRZ
 zC2T+0S3nXEXzaDbqkxT5GCM/vc8qfpZnSqQCVxCKdWs76IN1NCy6Rz2buZUC3ttJrLK
 La+g==
X-Gm-Message-State: APjAAAWIRFdGlMP1AGeEXEQA2Qm6ZHO+yLnie9tO3jXuJhiQMDTpxRLx
 p4AOgzDChGHE0RcPlUA4Ke1yu0fgV05oXQ==
X-Google-Smtp-Source: APXvYqxzNnVOtPKBg+t745zaKlYoFew5shXjJTBch1ItMi5ciaoaQTknMZMn1P1JFsRcCZ3pPW41dg==
X-Received: by 2002:adf:ef44:: with SMTP id c4mr28033411wrp.216.1568126681065; 
 Tue, 10 Sep 2019 07:44:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a192sm5703814wma.1.2019.09.10.07.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:44:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 15:44:24 +0100
Message-Id: <20190910144428.32597-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910144428.32597-1-peter.maydell@linaro.org>
References: <20190910144428.32597-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 09/13] target/arm/arm-semi: Factor out
 implementation of SYS_SEEK
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Factor out the implementation of SYS_SEEK via the new function
tables.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 64ed39fc075..c548ce849e7 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -350,6 +350,8 @@ typedef uint32_t sys_writefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
 typedef uint32_t sys_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
                             target_ulong buf, uint32_t len);
 typedef uint32_t sys_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
+typedef uint32_t sys_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
+                            target_ulong offset);
 
 static uint32_t host_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
 {
@@ -405,6 +407,16 @@ static uint32_t host_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
     return isatty(gf->hostfd);
 }
 
+static uint32_t host_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
+                            target_ulong offset)
+{
+    uint32_t ret = set_swi_errno(ts, lseek(gf->hostfd, offset, SEEK_SET));
+    if (ret == (uint32_t)-1) {
+        return -1;
+    }
+    return 0;
+}
+
 static uint32_t gdb_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
 {
     return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
@@ -431,11 +443,19 @@ static uint32_t gdb_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
     return arm_gdb_syscall(cpu, arm_semi_cb, "isatty,%x", gf->hostfd);
 }
 
+static uint32_t gdb_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
+                           target_ulong offset)
+{
+    return arm_gdb_syscall(cpu, arm_semi_cb, "lseek,%x,%x,0",
+                           gf->hostfd, offset);
+}
+
 typedef struct GuestFDFunctions {
     sys_closefn *closefn;
     sys_writefn *writefn;
     sys_readfn *readfn;
     sys_isattyfn *isattyfn;
+    sys_seekfn *seekfn;
 } GuestFDFunctions;
 
 static const GuestFDFunctions guestfd_fns[] = {
@@ -444,12 +464,14 @@ static const GuestFDFunctions guestfd_fns[] = {
         .writefn = host_writefn,
         .readfn = host_readfn,
         .isattyfn = host_isattyfn,
+        .seekfn = host_seekfn,
     },
     [GuestFDGDB] = {
         .closefn = gdb_closefn,
         .writefn = gdb_writefn,
         .readfn = gdb_readfn,
         .isattyfn = gdb_isattyfn,
+        .seekfn = gdb_seekfn,
     },
 };
 
@@ -625,15 +647,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(ts, -1);
         }
 
-        if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_cb, "lseek,%x,%x,0",
-                                   gf->hostfd, arg1);
-        } else {
-            ret = set_swi_errno(ts, lseek(gf->hostfd, arg1, SEEK_SET));
-            if (ret == (uint32_t)-1)
-              return -1;
-            return 0;
-        }
+        return guestfd_fns[gf->type].seekfn(ts, cpu, gf, arg1);
     case TARGET_SYS_FLEN:
         GET_ARG(0);
 
-- 
2.20.1


