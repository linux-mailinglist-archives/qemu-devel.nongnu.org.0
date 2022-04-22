Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B688D50B6E4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:10:05 +0200 (CEST)
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhs6u-0006Ia-OX
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrha-0004jK-HJ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:54 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhrhZ-0003eA-1M
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 07:43:54 -0400
Received: by mail-pl1-x630.google.com with SMTP id b7so10282535plh.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 04:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/yJYNbmHzMaH9snSTtewuCLJRVV1k7sJHGVXunCvCQ=;
 b=djsxBCC9hjfNZ3LOpuTgPJLQNF05EzEru2n7+ovt2pXDvX3GoAFa+QmhP5YW54zQi/
 RxmKQNub3C1CPwAxg9oh0jGvOXIJnLFrA23lwLXivDzi09NSziA/6qwbRWXXWFDzjgWG
 WiwR2++npaxwGquXu3NlML2IoKu4+sQRVlyOFLlyZF3L+2kabqghxnrybqL56ovAHK76
 TvKjg+Uz8DYCzQpL2VmAFDXCnSZIhAFopsBxKvWK7KP9gSoF/a9CxSLmizfR+DHddNuY
 9QUwTQ/2sW+zyFOfCfv7UksRUTtTzWYZUgzpo5wlOF2ux6JQ9aDF0lkr2tNXANHOo3vC
 4EfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/yJYNbmHzMaH9snSTtewuCLJRVV1k7sJHGVXunCvCQ=;
 b=xRy+Cfbw13Xq4pwr155Di24I3InwDDdATv4ZEUJEYGhgC3JLyxgZhQo5mnFBwnKbwP
 fo3y8RuhxdGe+anr9BXaGFA/tj9Veqf0meGK5LDuRaCwoHEPbrOKdfiXyHa4/eNHuf3D
 hFij/LuIipSSVoTfhj/wID/U9AbMR7yHmcjEQubUJACY55rH4OMb8wLClMk5ylPYi3Nz
 WchWChL8YxAFg+v2g7KFnksMbUMbjmPROVpno7JuaJrKof3RleB+KG2aPdIiHwyuYqUg
 g46RqyLN09vOF0/D7KuvxJtf4Uiv76FSh/72ct1e80ixSQOX4uLIg955+kap4y0dl5Rv
 8hFQ==
X-Gm-Message-State: AOAM532CCSbZDwad6ohQKTfbEh1v5/UgQ31TSkCc5cqdSB1s8jIgZpIC
 k/Fv0pT1/E0ahUiqT5sFB/nCwQgdFIc=
X-Google-Smtp-Source: ABdhPJzkRyjJGeTrmbGyyM9TlwJZo+2hq6hOpk395AD9RSJCUOPfp4ifoT0Bp805dPSMwZCDGL9eag==
X-Received: by 2002:a17:90b:4a09:b0:1d2:de49:9be8 with SMTP id
 kk9-20020a17090b4a0900b001d2de499be8mr15991377pjb.68.1650627831411; 
 Fri, 22 Apr 2022 04:43:51 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:4c40:4238:b597:4c1a])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a056a00245000b004f7728a4346sm2706519pfj.79.2022.04.22.04.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 04:43:50 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] target/xtensa: use tcg_constant_* for numbered special
 registers
Date: Fri, 22 Apr 2022 04:43:30 -0700
Message-Id: <20220422114332.374472-6-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422114332.374472-1-jcmvbkbc@gmail.com>
References: <20220422114332.374472-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Numbered special registers are small arrays of consecutive SRs. Use
tcg_constant_* for the SR index.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 245c5968bd5d..c51aea460160 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -2612,15 +2612,13 @@ static void translate_wsr_ccompare(DisasContext *dc, const OpcodeArg arg[],
 {
 #ifndef CONFIG_USER_ONLY
     uint32_t id = par[0] - CCOMPARE;
-    TCGv_i32 tmp = tcg_const_i32(id);
 
     assert(id < dc->config->nccompare);
     if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
     tcg_gen_mov_i32(cpu_SR[par[0]], arg[0].in);
-    gen_helper_update_ccompare(cpu_env, tmp);
-    tcg_temp_free(tmp);
+    gen_helper_update_ccompare(cpu_env, tcg_constant_i32(id));
 #endif
 }
 
@@ -2640,11 +2638,9 @@ static void translate_wsr_dbreaka(DisasContext *dc, const OpcodeArg arg[],
 {
 #ifndef CONFIG_USER_ONLY
     unsigned id = par[0] - DBREAKA;
-    TCGv_i32 tmp = tcg_const_i32(id);
 
     assert(id < dc->config->ndbreak);
-    gen_helper_wsr_dbreaka(cpu_env, tmp, arg[0].in);
-    tcg_temp_free(tmp);
+    gen_helper_wsr_dbreaka(cpu_env, tcg_constant_i32(id), arg[0].in);
 #endif
 }
 
@@ -2653,11 +2649,9 @@ static void translate_wsr_dbreakc(DisasContext *dc, const OpcodeArg arg[],
 {
 #ifndef CONFIG_USER_ONLY
     unsigned id = par[0] - DBREAKC;
-    TCGv_i32 tmp = tcg_const_i32(id);
 
     assert(id < dc->config->ndbreak);
-    gen_helper_wsr_dbreakc(cpu_env, tmp, arg[0].in);
-    tcg_temp_free(tmp);
+    gen_helper_wsr_dbreakc(cpu_env, tcg_constant_i32(id), arg[0].in);
 #endif
 }
 
@@ -2666,11 +2660,9 @@ static void translate_wsr_ibreaka(DisasContext *dc, const OpcodeArg arg[],
 {
 #ifndef CONFIG_USER_ONLY
     unsigned id = par[0] - IBREAKA;
-    TCGv_i32 tmp = tcg_const_i32(id);
 
     assert(id < dc->config->nibreak);
-    gen_helper_wsr_ibreaka(cpu_env, tmp, arg[0].in);
-    tcg_temp_free(tmp);
+    gen_helper_wsr_ibreaka(cpu_env, tcg_constant_i32(id), arg[0].in);
 #endif
 }
 
-- 
2.30.2


