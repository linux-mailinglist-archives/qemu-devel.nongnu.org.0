Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F15214913DF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 03:01:39 +0100 (CET)
Received: from localhost ([::1]:55050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9doY-00011P-Ku
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 21:01:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZ6-0008S3-RB
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:45:40 -0500
Received: from [2607:f8b0:4864:20::1033] (port=36506
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZ5-0007Rr-4U
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:45:40 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 i8-20020a17090a138800b001b3936fb375so848678pja.1
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 17:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTumydVPN7vaOmVu2aTT01lAWA4wv+vG4rcMpjjNZeY=;
 b=GVBt7n0w8F44kCg3YTs5Pr8kfOKWZGjGji/su8aO/9yiaeh9JBw9ujkvZC2DBqupsN
 Wp4xP/wUNYETC7kkurYP8l9pbCLOAXaHvq4gT8/eI/njz5WJT1Rpvfa6Zu/kaAKvkJPi
 Cm3bG/YvFZyxBCdlPeJvDvjiHQhHLquIlcDrI0Fw/roB3WTTRWSEGGIlE8gaoKVepCVt
 61zA9/hejBit4+4JhhJlw/FcVz+3iLQvxdlCwu7SgDBIUCZFVMCilrCK9kTppp+SOGa5
 tMSjyRye/QpuxdkLd5LXkrArwsLP+TqE30L0iI5j7GLzG4O7ZHvpYIbViaDl0AQ/ejmx
 z4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTumydVPN7vaOmVu2aTT01lAWA4wv+vG4rcMpjjNZeY=;
 b=6UM7gG7AV5mmKuOiRGpCTeL3cFAnOY4axzigADU3kuisi1etkspyvI7vy8/qTreGnT
 WNCh9qKzNavNKBXWTT2YRCgg3RpTkdADOVgBoC4G++7JmmIem7ZLAowKdahi5Nb3HKZt
 gm+4XeEBbofWr18QDNLkezAqjhaT0k4ANlAErQCiFccOIzMRIlMyqm0C4vhLemtDHwOe
 qkqMxmM6wLvJTdeoIJwU1HHLykKuEJwY8s8ya/Ob/WBxXAGD11VdhZ6tbIp7TStC5ozO
 Qvp3cYy8J9pAzpKC3Wxfwxe8UMSbHWKfnB48UvNVLpMWmEwnBDEVohXbSvy9IrDpy8hO
 5V9Q==
X-Gm-Message-State: AOAM533GQhvpS3eh5avn52ugiqXdGgPPbY7vqhqb8e0vJbbgrHhC82VM
 cmxlGY/STElYGDm9P1xnSfAUHmvGi4u+PGsX
X-Google-Smtp-Source: ABdhPJx2jVPpjZxh/Su2WU1EZ1r3bVlLa1d2WqCiNqnqjrFowSQVlmSS52UodxJP2HTRforClOPcJw==
X-Received: by 2002:a17:902:e8c2:b0:149:fdf8:270 with SMTP id
 v2-20020a170902e8c200b00149fdf80270mr25492166plg.167.1642470337681; 
 Mon, 17 Jan 2022 17:45:37 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:45:37 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/17] target/riscv: rvv-1.0: Add Zve64f support for load
 and store insns
Date: Tue, 18 Jan 2022 09:45:06 +0800
Message-Id: <20220118014522.13613-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

All Zve* extensions support all vector load and store instructions,
except Zve64* extensions do not support EEW=64 for index values when
XLEN=32.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5b47729a21..0bf41aaa1e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -263,10 +263,21 @@ static bool vext_check_st_index(DisasContext *s, int vd, int vs2, int nf,
                                 uint8_t eew)
 {
     int8_t emul = eew - s->sew + s->lmul;
-    return (emul >= -3 && emul <= 3) &&
-            require_align(vs2, emul) &&
-            require_align(vd, s->lmul) &&
-            require_nf(vd, nf, s->lmul);
+    bool ret = (emul >= -3 && emul <= 3) &&
+               require_align(vs2, emul) &&
+               require_align(vd, s->lmul) &&
+               require_nf(vd, nf, s->lmul);
+
+    /*
+     * All Zve* extensions support all vector load and store instructions,
+     * except Zve64* extensions do not support EEW=64 for index values
+     * when XLEN=32. (Section 18.2)
+     */
+    if (get_xl(s) == MXL_RV32) {
+        ret &= (!has_ext(s, RVV) && s->ext_zve64f ? eew != MO_64 : true);
+    }
+
+    return ret;
 }
 
 /*
-- 
2.31.1


