Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4349C5A794B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 10:45:58 +0200 (CEST)
Received: from localhost ([::1]:53042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTJMD-0006RI-BD
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 04:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aburgess@redhat.com>)
 id 1oTJJQ-0003aE-Nd
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:43:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aburgess@redhat.com>)
 id 1oTJJN-0007tj-Si
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661935381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3a8deZn4sRTDuQ2LfrIKu69B0XmGRcZFz5ntLrrTeuM=;
 b=NIn5cmYa03jZd6YqFGIdhYFwKscYZ/PmCLA8eCo5XP9jZIbPvK5+cEvx+YO3QB915M8pZK
 W8DTTghglUIuRSY0tKkbpuopADXLxxMTiC/F2erWpYCDgosLlKgaM9U9haSkEmgvArVbQv
 wZ+v7lWu+uCLy8rq0kfykQjl51wZBYk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-QO1IcIHhPSqVBMriAEkprg-1; Wed, 31 Aug 2022 04:41:30 -0400
X-MC-Unique: QO1IcIHhPSqVBMriAEkprg-1
Received: by mail-wm1-f69.google.com with SMTP id
 b16-20020a05600c4e1000b003a5a47762c3so7967015wmq.9
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 01:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3a8deZn4sRTDuQ2LfrIKu69B0XmGRcZFz5ntLrrTeuM=;
 b=S9LFO+I999ueF8Dk2NolRobEo1FQB0IECuVPL3IvqPB/n4rLlwyei8nayMb2WNnhkg
 FxyDyJrvPgAwdn4chiMY7mfGGoW2ftwouRxlzD9FHZ344ixCRtZU2Pd176RTBsL4A0z/
 gkFSKQTZcJOG+3K+LMusryy4d4jTq4IdccnqgX6KjmfLsAyNuDlSC/W4hsv4OVdzyj2y
 1NerhP+NGxdSHX+rfUVfd0+K62BM3907KKojyHMV+RZYsf95FbVUBkG4Ph6m4TCpKKQV
 kZ98E8GZQqhr56UGzn75QGnz5sBQ49yZrETN1KalhJ7o6jk1w9TYHiPEK0k4zuhKJnsc
 nVrQ==
X-Gm-Message-State: ACgBeo12Y7LPKBfeOkO9PmRW/l3AmTbw+oVPIWHHfzpiMw4qY4cCAJ6I
 GXiyPyoAF1xQm3jf3ndoHKenlcJ3NmcFPam/cD0XUDAoYkCLh3zhInfvYGv393rGgo+Eisry2Nm
 EeMfQwhbjZzWvWqHxxfJNyFLJAQgTX6fl9qp0D+6zZRv0ao+BkArHf6rTrOwKY6P87Gs=
X-Received: by 2002:a5d:510e:0:b0:226:e949:8baf with SMTP id
 s14-20020a5d510e000000b00226e9498bafmr1812287wrt.204.1661935289166; 
 Wed, 31 Aug 2022 01:41:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR62+Y85lLKovUBzVAqo0xA9lmNPA+o1NPrEEFyJDB82+ROCDUA6I/RgtHAhN8L8NmLSfGpdnw==
X-Received: by 2002:a5d:510e:0:b0:226:e949:8baf with SMTP id
 s14-20020a5d510e000000b00226e9498bafmr1812268wrt.204.1661935288772; 
 Wed, 31 Aug 2022 01:41:28 -0700 (PDT)
Received: from localhost ([31.111.84.229]) by smtp.gmail.com with ESMTPSA id
 f6-20020a7bc8c6000000b003a35ec4bf4fsm1398779wml.20.2022.08.31.01.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 01:41:28 -0700 (PDT)
From: Andrew Burgess <aburgess@redhat.com>
To: qemu-devel@nongnu.org
Cc: Andrew Burgess <aburgess@redhat.com>
Subject: [PATCH 1/2] target/riscv: remove fflags, frm,
 and fcsr from riscv-*-fpu.xml
Date: Wed, 31 Aug 2022 09:41:22 +0100
Message-Id: <0fbf2a5b12e3210ff3867d5cf7022b3f3462c9c8.1661934573.git.aburgess@redhat.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1661934573.git.aburgess@redhat.com>
References: <cover.1661934573.git.aburgess@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=aburgess@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

While testing some changes to GDB's handling for the RISC-V registers
fcsr, fflags, and frm, I spotted that QEMU includes these registers
twice in the target description it sends to GDB, once in the fpu
feature, and once in the csr feature.

Right now things basically work OK, QEMU maps these registers onto two
different register numbers, e.g. fcsr maps to both 68 and 73, and GDB
can use either of these to access the register.

However, GDB's target descriptions don't really work this way, each
register should appear just once in a target description, mapping the
register name onto the number GDB should use when accessing the
register on the target.  Duplicate register names actually result in
duplicate registers on the GDB side, however, as the registers have
the same name, the user can only access one of these registers.

Currently GDB has a hack in place, specifically for RISC-V, to spot
the duplicate copies of these three registers, and hide them from the
user, ensuring the user only ever sees a single copy of each.

In this commit I propose fixing this issue on the QEMU side, and in
the process, simplify the fpu register handling a little.

I think we should, remove fflags, frm, and fcsr from the two (32-bit
and 64-bit) fpu feature xml files.  These files will only contain the
32 core floating point register f0 to f31.  The fflags, frm, and fcsr
registers will continue to be advertised in the csr feature as they
currently are.

With that change made, I will simplify riscv_gdb_get_fpu and
riscv_gdb_set_fpu, removing the extra handling for the 3 status
registers.

Signed-off-by: Andrew Burgess <aburgess@redhat.com>
---
 gdb-xml/riscv-32bit-fpu.xml |  4 ----
 gdb-xml/riscv-64bit-fpu.xml |  4 ----
 target/riscv/gdbstub.c      | 32 ++------------------------------
 3 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/gdb-xml/riscv-32bit-fpu.xml b/gdb-xml/riscv-32bit-fpu.xml
index 1eaae9119e..84a44ba8df 100644
--- a/gdb-xml/riscv-32bit-fpu.xml
+++ b/gdb-xml/riscv-32bit-fpu.xml
@@ -43,8 +43,4 @@
   <reg name="ft9" bitsize="32" type="ieee_single"/>
   <reg name="ft10" bitsize="32" type="ieee_single"/>
   <reg name="ft11" bitsize="32" type="ieee_single"/>
-
-  <reg name="fflags" bitsize="32" type="int" regnum="66"/>
-  <reg name="frm" bitsize="32" type="int" regnum="67"/>
-  <reg name="fcsr" bitsize="32" type="int" regnum="68"/>
 </feature>
diff --git a/gdb-xml/riscv-64bit-fpu.xml b/gdb-xml/riscv-64bit-fpu.xml
index 794854cc01..9856a9d1d3 100644
--- a/gdb-xml/riscv-64bit-fpu.xml
+++ b/gdb-xml/riscv-64bit-fpu.xml
@@ -49,8 +49,4 @@
   <reg name="ft9" bitsize="64" type="riscv_double"/>
   <reg name="ft10" bitsize="64" type="riscv_double"/>
   <reg name="ft11" bitsize="64" type="riscv_double"/>
-
-  <reg name="fflags" bitsize="32" type="int" regnum="66"/>
-  <reg name="frm" bitsize="32" type="int" regnum="67"/>
-  <reg name="fcsr" bitsize="32" type="int" regnum="68"/>
 </feature>
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 9ed049c29e..9974b7aac6 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -114,20 +114,6 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
         if (env->misa_ext & RVF) {
             return gdb_get_reg32(buf, env->fpr[n]);
         }
-    /* there is hole between ft11 and fflags in fpu.xml */
-    } else if (n < 36 && n > 32) {
-        target_ulong val = 0;
-        int result;
-        /*
-         * CSR_FFLAGS is at index 1 in csr_register, and gdb says it is FP
-         * register 33, so we recalculate the map index.
-         * This also works for CSR_FRM and CSR_FCSR.
-         */
-        result = riscv_csrrw_debug(env, n - 32, &val,
-                                   0, 0);
-        if (result == RISCV_EXCP_NONE) {
-            return gdb_get_regl(buf, val);
-        }
     }
     return 0;
 }
@@ -137,20 +123,6 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
     if (n < 32) {
         env->fpr[n] = ldq_p(mem_buf); /* always 64-bit */
         return sizeof(uint64_t);
-    /* there is hole between ft11 and fflags in fpu.xml */
-    } else if (n < 36 && n > 32) {
-        target_ulong val = ldtul_p(mem_buf);
-        int result;
-        /*
-         * CSR_FFLAGS is at index 1 in csr_register, and gdb says it is FP
-         * register 33, so we recalculate the map index.
-         * This also works for CSR_FRM and CSR_FCSR.
-         */
-        result = riscv_csrrw_debug(env, n - 32, NULL,
-                                   val, -1);
-        if (result == RISCV_EXCP_NONE) {
-            return sizeof(target_ulong);
-        }
     }
     return 0;
 }
@@ -404,10 +376,10 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
     CPURISCVState *env = &cpu->env;
     if (env->misa_ext & RVD) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
-                                 36, "riscv-64bit-fpu.xml", 0);
+                                 32, "riscv-64bit-fpu.xml", 0);
     } else if (env->misa_ext & RVF) {
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
-                                 36, "riscv-32bit-fpu.xml", 0);
+                                 32, "riscv-32bit-fpu.xml", 0);
     }
     if (env->misa_ext & RVV) {
         gdb_register_coprocessor(cs, riscv_gdb_get_vector, riscv_gdb_set_vector,
-- 
2.25.4


