Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D955737A199
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:18:46 +0200 (CEST)
Received: from localhost ([::1]:36422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNbJ-0001X6-UJ
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWj-0001RX-Om
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWg-0000gf-ON
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C0MgpkbkQe6j4ED+JKPApYHqkoktuJG4YVVd4ZRBBS8=;
 b=dEEUvUAnhDyr7MenDgjMOkXAvHRmDPIctV00JovVf2zNGhFh7gVOVQChxIBLosqA9DkuE7
 ENKJ0fr+X3Vwbjm5BlQIfYELN5XF0EL7yoJ/hLGuKGzzc/CehqmMns/r8o2WAbpzSbtUr4
 4br/PO6kcgmyk6K3cspeVyWSEPgv7rQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-X9_PdsqNMIiUxyupAC6bDw-1; Tue, 11 May 2021 04:13:53 -0400
X-MC-Unique: X9_PdsqNMIiUxyupAC6bDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 032758189DA;
 Tue, 11 May 2021 08:13:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8238B5D9E3;
 Tue, 11 May 2021 08:13:51 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/33] target/i386: Rename helper_fldt, helper_fstt
Date: Tue, 11 May 2021 04:13:18 -0400
Message-Id: <20210511081350.419428-2-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Change the prefix from "helper" to "do".  The former should be
reserved for those functions that are called from TCG; the latter
is in use within the file already for those functions that are
called from the helper functions, adding a "retaddr" argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Tested-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210322132800.7470-3-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/fpu_helper.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 60ed93520a..3d9b192901 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -117,8 +117,7 @@ static inline void fpop(CPUX86State *env)
     env->fpstt = (env->fpstt + 1) & 7;
 }
 
-static inline floatx80 helper_fldt(CPUX86State *env, target_ulong ptr,
-                                   uintptr_t retaddr)
+static floatx80 do_fldt(CPUX86State *env, target_ulong ptr, uintptr_t retaddr)
 {
     CPU_LDoubleU temp;
 
@@ -127,8 +126,8 @@ static inline floatx80 helper_fldt(CPUX86State *env, target_ulong ptr,
     return temp.d;
 }
 
-static inline void helper_fstt(CPUX86State *env, floatx80 f, target_ulong ptr,
-                               uintptr_t retaddr)
+static void do_fstt(CPUX86State *env, floatx80 f, target_ulong ptr,
+                    uintptr_t retaddr)
 {
     CPU_LDoubleU temp;
 
@@ -405,14 +404,14 @@ void helper_fldt_ST0(CPUX86State *env, target_ulong ptr)
     int new_fpstt;
 
     new_fpstt = (env->fpstt - 1) & 7;
-    env->fpregs[new_fpstt].d = helper_fldt(env, ptr, GETPC());
+    env->fpregs[new_fpstt].d = do_fldt(env, ptr, GETPC());
     env->fpstt = new_fpstt;
     env->fptags[new_fpstt] = 0; /* validate stack entry */
 }
 
 void helper_fstt_ST0(CPUX86State *env, target_ulong ptr)
 {
-    helper_fstt(env, ST0, ptr, GETPC());
+    do_fstt(env, ST0, ptr, GETPC());
 }
 
 void helper_fpush(CPUX86State *env)
@@ -2468,7 +2467,7 @@ void helper_fsave(CPUX86State *env, target_ulong ptr, int data32)
     ptr += (14 << data32);
     for (i = 0; i < 8; i++) {
         tmp = ST(i);
-        helper_fstt(env, tmp, ptr, GETPC());
+        do_fstt(env, tmp, ptr, GETPC());
         ptr += 10;
     }
 
@@ -2495,7 +2494,7 @@ void helper_frstor(CPUX86State *env, target_ulong ptr, int data32)
     ptr += (14 << data32);
 
     for (i = 0; i < 8; i++) {
-        tmp = helper_fldt(env, ptr, GETPC());
+        tmp = do_fldt(env, ptr, GETPC());
         ST(i) = tmp;
         ptr += 10;
     }
@@ -2539,7 +2538,7 @@ static void do_xsave_fpu(CPUX86State *env, target_ulong ptr, uintptr_t ra)
     addr = ptr + XO(legacy.fpregs);
     for (i = 0; i < 8; i++) {
         floatx80 tmp = ST(i);
-        helper_fstt(env, tmp, addr, ra);
+        do_fstt(env, tmp, addr, ra);
         addr += 16;
     }
 }
@@ -2703,7 +2702,7 @@ static void do_xrstor_fpu(CPUX86State *env, target_ulong ptr, uintptr_t ra)
 
     addr = ptr + XO(legacy.fpregs);
     for (i = 0; i < 8; i++) {
-        floatx80 tmp = helper_fldt(env, addr, ra);
+        floatx80 tmp = do_fldt(env, addr, ra);
         ST(i) = tmp;
         addr += 16;
     }
-- 
2.26.2



