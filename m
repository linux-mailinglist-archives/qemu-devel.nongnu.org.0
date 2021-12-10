Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD5C46FCE0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:40:53 +0100 (CET)
Received: from localhost ([::1]:60652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbSX-0004md-0V
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:40:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanv-00067w-Vi
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:56 -0500
Received: from [2607:f8b0:4864:20::1029] (port=41572
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvanu-0006tj-3v
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:58:55 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso6908716pjb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jOWao8o05t2OetkYHzKjns6q58uxy5xl9VSdFMxxNcQ=;
 b=CfB+JRaHBZV0LgtZW3YBnGoRpAOk7lSxuQbBElKYooHFPV9CTGr6CJ8BoMHPGg9nHo
 zXF2zAelu04xw9Ot8q/w8JqMcAwDYFqwzV8b+Py/FStAMpQsOzbQGsSPbRySV28UHMd7
 HzRqS7SgfHgCc6lKmh53L/2vYs/z7QjujK9YOYfujtj/Qv4fJSmCTLlxHtEbbt2WX7Q5
 kewBjQlSBYyoONcHMW1WtoQ5osdQeUCOhGhkCv93sGl4IIwf2wfSOdykspDSYJ9SGMNt
 J7soTjClWZR6D4rlEAPus6018uYbSJ4sGOIV8/eFCGbsRqISaIC2/QJQ4aUAKTyeHpsd
 5Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jOWao8o05t2OetkYHzKjns6q58uxy5xl9VSdFMxxNcQ=;
 b=7e80N9LAVcJykohIzHRoKMeLBNoxxoCygu4QRBaQRboe5adhTLQhAkSP1XShRMvuAo
 9/q5E4hxEwEQp495gubIWrubTzAFxrwgUQLmI4zWUVNsRqU/yheXtW/BnmTZKP40mX4t
 fYKFx0W5IjXS0HUVBb06hHd9twFUDe3B95tH/NAGmJlf5ncfUj9P8iUIBANbaW6HxONU
 aCLBpxrXQc6kP+Reb2ixBi+VycL9UvPgaEBYYxCieBU4w+eJYXYzEDYsc0zaSil2VXNy
 uP3B55r7gtSF6/lptu6C9IC0MQZXabz6dC73uQU4Jtjpe1OVKDjKxxtC3MwnXTzAqmHV
 P6FQ==
X-Gm-Message-State: AOAM532F0WJgfrDBY+Efsw0qn96LS2XvT9/i64uaw5cimNhHuxkrn5PA
 2JU1I7PRqrTHUB7qMI0/6b38rUuq1+9kxQZJ
X-Google-Smtp-Source: ABdhPJyria69SLXsjIZDkqV+9TFmu109nZJ8BDjI91GgGmeqIKP6vSI1Uw44OMulHDpwXpS1VZ0p8Q==
X-Received: by 2002:a17:902:f687:b0:141:cf6b:fee7 with SMTP id
 l7-20020a170902f68700b00141cf6bfee7mr72046123plg.75.1639123132790; 
 Thu, 09 Dec 2021 23:58:52 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:58:52 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 31/77] target/riscv: rvv-1.0: set-X-first mask bit
 instructions
Date: Fri, 10 Dec 2021 15:56:17 +0800
Message-Id: <20211210075704.23951-32-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              | 6 +++---
 target/riscv/insn_trans/trans_rvv.c.inc | 5 ++++-
 target/riscv/vector_helper.c            | 4 ----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 4df2aa9cdd..d139c0aade 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -629,9 +629,9 @@ vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
-vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
-vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
-vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
+vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
+vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
+vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 3645bb9635..9206e6f06c 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2731,7 +2731,10 @@ static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
 #define GEN_M_TRANS(NAME)                                          \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
-    if (vext_check_isa_ill(s)) {                                   \
+    if (require_rvv(s) &&                                          \
+        vext_check_isa_ill(s) &&                                   \
+        require_vm(a->vm, a->rd) &&                                \
+        (a->rd != a->rs2)) {                                       \
         uint32_t data = 0;                                         \
         gen_helper_gvec_3_ptr *fn = gen_helper_##NAME;             \
         TCGLabel *over = gen_new_label();                          \
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f97783acf0..b0dc971a86 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4260,7 +4260,6 @@ enum set_mask_type {
 static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
                    uint32_t desc, enum set_mask_type type)
 {
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;
     uint32_t vm = vext_vm(desc);
     uint32_t vl = env->vl;
     int i;
@@ -4290,9 +4289,6 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
             }
         }
     }
-    for (; i < vlmax; i++) {
-        vext_set_elem_mask(vd, i, 0);
-    }
 }
 
 void HELPER(vmsbf_m)(void *vd, void *v0, void *vs2, CPURISCVState *env,
-- 
2.31.1


