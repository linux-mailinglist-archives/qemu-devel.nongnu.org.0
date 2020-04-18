Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF61AF25C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Apr 2020 18:32:48 +0200 (CEST)
Received: from localhost ([::1]:59866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPqOd-0005rz-4X
	for lists+qemu-devel@lfdr.de; Sat, 18 Apr 2020 12:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48306)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jPqBy-0004Tl-Bi
 for qemu-devel@nongnu.org; Sat, 18 Apr 2020 12:19:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jPqBv-0005hW-Vj
 for qemu-devel@nongnu.org; Sat, 18 Apr 2020 12:19:41 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:51400)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jPqBv-0005fL-Ql
 for qemu-devel@nongnu.org; Sat, 18 Apr 2020 12:19:39 -0400
Received: by mail-pj1-x1032.google.com with SMTP id kb16so2558964pjb.1
 for <qemu-devel@nongnu.org>; Sat, 18 Apr 2020 09:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2sdxv3dgmobchGTZXq4ItSud4I5lO54dfCluBdiq+N0=;
 b=DYS4STqKvTGO2Zq4E16mZ6siBha+tBQcYeatzf8PFRxvQQXmF54OFjsHn+CVLWto/f
 g+Ac6mi5c+bJb4aKNnCRiJS4vzxUylxBGUxE5yyDukBkmCj7tc+11z8ZRAcr4rXZmjHH
 LeZrdwY7Ib88a3kmnq04K9PxOCAGnRq08yP512G0kvfSKZ/oUThiVTo1gd5o2LaXZezv
 sFNgF+dyU98JDrplBU93rcE1v99zgAMbAe51ubI2fhkHBcksOq6smMASM76dw8jIPjVd
 MsLAFow/Gq1iXJs6IAzDODBxvfJmV5fPP0q0L3Q7FaOOp3SrcfoXHb+tKP3g0FEeu0tb
 +Asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2sdxv3dgmobchGTZXq4ItSud4I5lO54dfCluBdiq+N0=;
 b=e0FWE2oYtJ6TxcPfHnWEdNozcYrABdAeUdWrCT0FeQy5rJW+uEglWCUMe4oN7r4/WG
 GPirJHwak9zoTuvyaSLCG+kQ5taXoOIUPgjoA06BZWFC29Mn3Ox9jDhFF9ARtSVqce04
 kPmZXjQK9J92VoMZ4z32NWSRvuZaYYS7TWpPr5JMWd5pcRk64mwXE8Z6OmcDq8oyyU7j
 ooiiwKNBt1O2g7URUTXjZgdiH4aX01TXwm25Hgvr2VftpK20u4JLHssqVkp0FRu1/MP3
 zdvKnyIvdxi3A+OP3edpj/8n0T26R5ZAkVHLRXKJgO2S0ENmKZ3hecD/5aYss2c6z67V
 bApQ==
X-Gm-Message-State: AGi0PuZ0rhGbNFHWCw1yqYijZsg/0VAGWKTxbq9nF1cCo/DJWj/U0cnP
 ZEMqCGUYIFm8whHfRlDjDas0EzbUrPM=
X-Google-Smtp-Source: APiQypIHepFsyDhndjoHvsJcuOFLby8AQUhWl67Uz7ES/AOqJbMtlGzN+6fwp24fQ3cUg3wk8xGcgw==
X-Received: by 2002:a17:902:8ec1:: with SMTP id
 x1mr8965791plo.325.1587226777948; 
 Sat, 18 Apr 2020 09:19:37 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id i187sm22398382pfc.112.2020.04.18.09.19.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 09:19:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/16] tcg: Remove tcg_gen_dup{8,16,32,64}i_vec
Date: Sat, 18 Apr 2020 09:19:14 -0700
Message-Id: <20200418161914.4387-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418161914.4387-1-richard.henderson@linaro.org>
References: <20200418161914.4387-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1032
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

These interfaces have been replaced by tcg_gen_dupi_vec
and tcg_constant_vec.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  4 ----
 tcg/tcg-op-vec.c     | 20 --------------------
 2 files changed, 24 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 11ed9192f7..a39eb13ff0 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -959,10 +959,6 @@ void tcg_gen_mov_vec(TCGv_vec, TCGv_vec);
 void tcg_gen_dup_i32_vec(unsigned vece, TCGv_vec, TCGv_i32);
 void tcg_gen_dup_i64_vec(unsigned vece, TCGv_vec, TCGv_i64);
 void tcg_gen_dup_mem_vec(unsigned vece, TCGv_vec, TCGv_ptr, tcg_target_long);
-void tcg_gen_dup8i_vec(TCGv_vec, uint32_t);
-void tcg_gen_dup16i_vec(TCGv_vec, uint32_t);
-void tcg_gen_dup32i_vec(TCGv_vec, uint32_t);
-void tcg_gen_dup64i_vec(TCGv_vec, uint64_t);
 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec, uint64_t);
 void tcg_gen_add_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b);
 void tcg_gen_sub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b);
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 6343046e18..a9c16d85c5 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -284,26 +284,6 @@ void tcg_gen_dupi_vec(unsigned vece, TCGv_vec dest, uint64_t val)
     tcg_gen_mov_vec(dest, tcg_constant_vec(type, vece, val));
 }
 
-void tcg_gen_dup64i_vec(TCGv_vec dest, uint64_t val)
-{
-    tcg_gen_dupi_vec(MO_64, dest, val);
-}
-
-void tcg_gen_dup32i_vec(TCGv_vec dest, uint32_t val)
-{
-    tcg_gen_dupi_vec(MO_32, dest, val);
-}
-
-void tcg_gen_dup16i_vec(TCGv_vec dest, uint32_t val)
-{
-    tcg_gen_dupi_vec(MO_16, dest, val);
-}
-
-void tcg_gen_dup8i_vec(TCGv_vec dest, uint32_t val)
-{
-    tcg_gen_dupi_vec(MO_8, dest, val);
-}
-
 void tcg_gen_dup_i64_vec(unsigned vece, TCGv_vec r, TCGv_i64 a)
 {
     TCGArg ri = tcgv_vec_arg(r);
-- 
2.20.1


