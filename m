Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E985AEDE4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 16:56:20 +0200 (CEST)
Received: from localhost ([::1]:40992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7hZ5-0000Ie-IW
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 10:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNs-0005Zb-NJ
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:44:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNr-00054d-Gn
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:44:44 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43945)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7hNr-000544-9I
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:44:43 -0400
Received: by mail-wr1-x441.google.com with SMTP id q17so16120609wrx.10
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 07:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sq8nSzuTSE3z6TeW22Jb/p8ysGSeKIUIld6DHEj34Ck=;
 b=vJRR4zhMarIJwOEag+GQp1yXeXT+q/UXt9Xtub70Zzd0iBgHFR+zDca6QkL3KyQrFF
 d6jtVtMtoVx0jQhhcNC7jmNK1/5GDty5Rk1Lbt04v/3Qg9d7SNU0govHcBdLEL1mawnW
 /jEdgOl/Fjh/WQ2YyxW8Wvuaus0ak96VghwQvvTVFYD0UUNfdvhFogYqvnXL9ydFz3Dw
 MHnuvpPut6aHKKU7jvwQEn7vihCg15FIrLr4OVkNUkQcAjgy9uMDn877ZPCHsiyOJ9FA
 0U8/NfbaYmKxarb753GB18++ClK8tHper8pHlhsqg8dPa7hCksO/HE/LdgodaFfjNWjB
 8Bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sq8nSzuTSE3z6TeW22Jb/p8ysGSeKIUIld6DHEj34Ck=;
 b=n229NGgWoTvg7aw28L9CcEycfG/Gk74IoEsHvTfIKnkQeit0TjCYO6uYPKgNsy2tZN
 ji/dFjJWCknxbeVgyewhOFrtjjOozlDbJ80gbFsCFpoA+yCzzPv0GWPfzRg62XHDFXB/
 qEh3LFJq4Ke3oQvoviY3Hjf8Yesk+20su5cUVbB1coMa80HBi3b4YhyIbsL+kqZeHgxW
 RGOUAAhye/i7fL15EZf8vFRehsT8siDVwfCcEx2yGvw5EIX47My3nyhBUZcUyCQbzDmT
 hDOFrLl5TOIaEAqBGSqaedUmO7dvnmxH6mbHdhzUSee96fFLaUHjDKKGszL5gakxP2zc
 oqAw==
X-Gm-Message-State: APjAAAVJ/3Jg1abbjJtJvFf+jKLSnQcz1IltV5p0kTN3iATn2Bo8IMud
 5437dHau03iGuLQUxppRBhdnRA==
X-Google-Smtp-Source: APXvYqycuNOuLYNTE2MIV3o2Pt1YSPVSpDoNIll/5mv4AFS4W99T4R7+XNM9C6WCEJO4SKRziYs1Gw==
X-Received: by 2002:adf:f812:: with SMTP id s18mr28610093wrp.32.1568126682426; 
 Tue, 10 Sep 2019 07:44:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a192sm5703814wma.1.2019.09.10.07.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:44:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 15:44:25 +0100
Message-Id: <20190910144428.32597-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910144428.32597-1-peter.maydell@linaro.org>
References: <20190910144428.32597-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH 10/13] target/arm/arm-semi: Factor out
 implementation of SYS_FLEN
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

Factor out the implementation of SYS_FLEN via the new
function tables.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index c548ce849e7..f9019b00b8d 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -352,6 +352,7 @@ typedef uint32_t sys_readfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
 typedef uint32_t sys_isattyfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
 typedef uint32_t sys_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
                             target_ulong offset);
+typedef uint32_t sys_flenfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf);
 
 static uint32_t host_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
 {
@@ -417,6 +418,16 @@ static uint32_t host_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
     return 0;
 }
 
+static uint32_t host_flenfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
+{
+    struct stat buf;
+    uint32_t ret = set_swi_errno(ts, fstat(gf->hostfd, &buf));
+    if (ret == (uint32_t)-1) {
+        return -1;
+    }
+    return buf.st_size;
+}
+
 static uint32_t gdb_closefn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
 {
     return arm_gdb_syscall(cpu, arm_semi_cb, "close,%x", gf->hostfd);
@@ -450,12 +461,19 @@ static uint32_t gdb_seekfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf,
                            gf->hostfd, offset);
 }
 
+static uint32_t gdb_flenfn(TaskState *ts, ARMCPU *cpu, GuestFD *gf)
+{
+    return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
+                           gf->hostfd, arm_flen_buf(cpu));
+}
+
 typedef struct GuestFDFunctions {
     sys_closefn *closefn;
     sys_writefn *writefn;
     sys_readfn *readfn;
     sys_isattyfn *isattyfn;
     sys_seekfn *seekfn;
+    sys_flenfn *flenfn;
 } GuestFDFunctions;
 
 static const GuestFDFunctions guestfd_fns[] = {
@@ -465,6 +483,7 @@ static const GuestFDFunctions guestfd_fns[] = {
         .readfn = host_readfn,
         .isattyfn = host_isattyfn,
         .seekfn = host_seekfn,
+        .flenfn = host_flenfn,
     },
     [GuestFDGDB] = {
         .closefn = gdb_closefn,
@@ -472,6 +491,7 @@ static const GuestFDFunctions guestfd_fns[] = {
         .readfn = gdb_readfn,
         .isattyfn = gdb_isattyfn,
         .seekfn = gdb_seekfn,
+        .flenfn = gdb_flenfn,
     },
 };
 
@@ -657,16 +677,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return set_swi_errno(ts, -1);
         }
 
-        if (use_gdb_syscalls()) {
-            return arm_gdb_syscall(cpu, arm_semi_flen_cb, "fstat,%x,%x",
-                                   gf->hostfd, arm_flen_buf(cpu));
-        } else {
-            struct stat buf;
-            ret = set_swi_errno(ts, fstat(gf->hostfd, &buf));
-            if (ret == (uint32_t)-1)
-                return -1;
-            return buf.st_size;
-        }
+        return guestfd_fns[gf->type].flenfn(ts, cpu, gf);
     case TARGET_SYS_TMPNAM:
         qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func__);
         return -1;
-- 
2.20.1


