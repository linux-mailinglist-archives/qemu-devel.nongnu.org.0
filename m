Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297751AF174
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Apr 2020 17:07:22 +0200 (CEST)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPp3x-0002vs-7v
	for lists+qemu-devel@lfdr.de; Sat, 18 Apr 2020 11:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36799)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jPp10-00074W-Ic
 for qemu-devel@nongnu.org; Sat, 18 Apr 2020 11:04:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jPp0z-0002tT-Ef
 for qemu-devel@nongnu.org; Sat, 18 Apr 2020 11:04:18 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:54630)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jPp0z-0002r2-98
 for qemu-devel@nongnu.org; Sat, 18 Apr 2020 11:04:17 -0400
Received: by mail-pj1-x1042.google.com with SMTP id np9so2461424pjb.4
 for <qemu-devel@nongnu.org>; Sat, 18 Apr 2020 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ue3ApTgP6L6VKxS6HIrw/kMTvfYiGAHHp1z12K/l2mg=;
 b=omiHnhkA/VnHvkR2SY3N/6VDT35fIiTaelNs2hhwY0AdZ7g836ZyE1jvsqNpgVCRsi
 9P071+92jRrY/tjjgewAmodUFs8aNU4IlHuBQn1ldoGH7hOXVnru2I2GIA9o+VAi5uKR
 VC19hzYnIq0J2g4oewaa8SkG8K/v5gFBb8L1myhkysOq49D2Cr/WZJe5FaJX2qF5qSLm
 IlBGXTe7q8VQWL++WUnr8QsovZSwAkXzSsRU5VKgw0wixJJbPNrpkJhyxDklGUL7c99r
 uCm7DJSyuiYxxTlxJI7xqAax1Kd2lrovVZ4y1/sGcM+7x0jQewtWKuQs/TmtyZrVSVYr
 ck5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ue3ApTgP6L6VKxS6HIrw/kMTvfYiGAHHp1z12K/l2mg=;
 b=FT8A/F8eLgn0HoxxF1jPjgkCNbvQpTdBUpl3Z/2byteVPEcwUhGZ33m68tkfc5U1F/
 JfzWXCV1ePqEM8YfYHhzLHvucGKfcr5OI0KAyB28YagWtwBC5+pbYjDMQWTrNkMciiqX
 xK9Xcc00EGmmQEBvf3r4hxFlaXTE1Wt/yhPtJMiKuWcup8Ii2eeAA8/6/6GEtY3c+atg
 w9fFSNoJRubaC16WYSJ9YgwrhL4j+GjfS3fRp4TGszctRd6EdaFffGrjvkho3TnafXIX
 NvrHm5V4YiSeQ6M6iPT7w3MNX2lQdLeshp4L66NHnH2Ic9d7XOSDP9wvVhdGH9kLQgUq
 Wldg==
X-Gm-Message-State: AGi0PuavY2qBcIxgRdrSQjiXwbJb+ddZlZ7MZffyCkTRWAl18S9VQBiP
 13zDpih6OfcIP7BT6sH8qGFb/rCkHI4=
X-Google-Smtp-Source: APiQypKkFbnXVqBI2Ztr97TMatv6qLURUAG10y8H9Y1rHGSe3cb/D0Xn1jLS3XrKBJtuW1n1iKip4g==
X-Received: by 2002:a17:902:694a:: with SMTP id
 k10mr8969568plt.82.1587222255797; 
 Sat, 18 Apr 2020 08:04:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id t103sm8668601pjb.46.2020.04.18.08.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 08:04:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] tcg: Add tcg_gen_gvec_dup_imm
Date: Sat, 18 Apr 2020 08:04:05 -0700
Message-Id: <20200418150411.1831-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418150411.1831-1-richard.henderson@linaro.org>
References: <20200418150411.1831-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
Cc: peter.maydell@linaro.org, david@redhat.com, zhiwei_liu@c-sky.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a version of tcg_gen_dup_* that takes both immediate and
a vector element size operand.  This will replace the set of
tcg_gen_gvec_dup{8,16,32,64}i functions that encode the element
size within the function name.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op-gvec.h | 2 ++
 tcg/tcg-op-gvec.c         | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index 74534e2480..eb0d47a42b 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -313,6 +313,8 @@ void tcg_gen_gvec_ors(unsigned vece, uint32_t dofs, uint32_t aofs,
 
 void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
                           uint32_t s, uint32_t m);
+void tcg_gen_gvec_dup_imm(unsigned vece, uint32_t dofs, uint32_t s,
+                          uint32_t m, uint64_t imm);
 void tcg_gen_gvec_dup_i32(unsigned vece, uint32_t dofs, uint32_t s,
                           uint32_t m, TCGv_i32);
 void tcg_gen_gvec_dup_i64(unsigned vece, uint32_t dofs, uint32_t s,
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 327d9588e0..593bb4542e 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -1569,6 +1569,13 @@ void tcg_gen_gvec_dup8i(uint32_t dofs, uint32_t oprsz,
     do_dup(MO_8, dofs, oprsz, maxsz, NULL, NULL, x);
 }
 
+void tcg_gen_gvec_dup_imm(unsigned vece, uint32_t dofs, uint32_t oprsz,
+                          uint32_t maxsz, uint64_t x)
+{
+    check_size_align(oprsz, maxsz, dofs);
+    do_dup(vece, dofs, oprsz, maxsz, NULL, NULL, x);
+}
+
 void tcg_gen_gvec_not(unsigned vece, uint32_t dofs, uint32_t aofs,
                       uint32_t oprsz, uint32_t maxsz)
 {
-- 
2.20.1


