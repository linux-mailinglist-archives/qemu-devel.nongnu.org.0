Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC545705D2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:39:17 +0200 (CEST)
Received: from localhost ([::1]:54430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuZ9-000857-H0
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvV-0006Yx-P8
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvQ-0002pO-3t
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id o4so7142332wrh.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9H4vayvC6P8HyxpZR8DvsdsTXJo88+HbItchv84O0iE=;
 b=QmhX5Ai7AUKVLyGTlRPmwGEAaIUrljdejQgLrGmW97FuqF4Q1eEfOF+W+j/fIRxwXY
 Mpd9uAzG9ie9w0TLCzsh3oK1Dj+YeeolS3/PYkKG7yZpXwrist1j2TmB/XQo3sIYpWz1
 8D5/4DkUK6MZQOM20L5eVZnYd4uheIof6Hva88kKuyuCHKTtxTl3fTHKNprRhWQmSO69
 C94rVaKL3HZZjzmOT4uKh4/Gpr24DRnitwMdq8EP8E3XxmlWCFXPpXBAueskK7u6TYUi
 Hke+psH3o8wP2nlNYJK4EN9AljspYdn8dTJ4j8l1zwcUqlloamHJI0a0MdMko2kaACMa
 uGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9H4vayvC6P8HyxpZR8DvsdsTXJo88+HbItchv84O0iE=;
 b=qnVPU4kJpyhbZM7lawAm+A98Ybbe9PKhXheLz3bN6vhF8GuPIZXjV+1eDuMZIkwPx7
 AXsj5ClOJHi7LGfu/dWd5Av4YEVTnFIUCDW36Hbeg+c0BYI1MPxZHWH50/4AFBiQohzN
 Imnd+itDWaA+jccQZ8Acdv6b+H82usTLOVm9yiCxDmT0SmZJ5RmFkapBipqFZIWnSaXx
 4fyUN6St7odeJd85qOPw+tRI3S/+x32T0rtMAITJGJEjXXSykqDEizVdHlDXZEqL+sN2
 8bm1TSDWGwhzJS2Q56UlSGF9cqhsiZzLFy8Agt9I63IcZvBHGKFy4dOswlKu7/3193Kf
 nq8Q==
X-Gm-Message-State: AJIora/w8uk67DMPL+Xllmd/HCv1Ju+5nLr/6Jpjtx50LYBxVgwaHkjg
 aUJhamoEnlVxIr/W8tdDAujsUSEn84YUKg==
X-Google-Smtp-Source: AGRyM1u2Z71IGI3a98FQiTqQRx0lHTSxHtXFmIGY8O3OwAIPSgOq5mRW5VRhrWfh7pqbwQYkoxaYXA==
X-Received: by 2002:a5d:4aca:0:b0:21d:6793:1c11 with SMTP id
 y10-20020a5d4aca000000b0021d67931c11mr16516057wrs.202.1657547882128; 
 Mon, 11 Jul 2022 06:58:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/45] target/arm: Mark gather prefetch as non-streaming
Date: Mon, 11 Jul 2022 14:57:17 +0100
Message-Id: <20220711135750.765803-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Richard Henderson <richard.henderson@linaro.org>

Mark these as a non-streaming instructions, which should trap if full
a64 support is not enabled in streaming mode.  In this case, introduce
PRF_ns (prefetch non-streaming) to handle the checks.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sme-fa64.decode |  3 ---
 target/arm/sve.decode      | 10 +++++-----
 target/arm/translate-sve.c | 11 +++++++++++
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 1acc3ae0809..7d4c33fb5b8 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,10 +59,7 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
-FAIL    1000 0100 0-1- ---- 0--- ---- ---- ----   # SVE 32-bit gather prefetch (scalar+vector)
 FAIL    1010 010- ---- ---- 011- ---- ---- ----   # SVE contiguous FF load (scalar+scalar)
 FAIL    1010 010- ---1 ---- 101- ---- ---- ----   # SVE contiguous NF load (scalar+imm)
 FAIL    1010 010- -01- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
 FAIL    1010 010- -010 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
-FAIL    1100 010- ---- ---- ---- ---- ---- ----   # SVE 64-bit gather load/prefetch
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a54feb2f61d..908643d7d90 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1183,10 +1183,10 @@ LD1RO_zpri      1010010 .. 01 0.... 001 ... ..... ..... \
                 @rpri_load_msz nreg=0
 
 # SVE 32-bit gather prefetch (scalar plus 32-bit scaled offsets)
-PRF             1000010 00 -1 ----- 0-- --- ----- 0 ----
+PRF_ns          1000010 00 -1 ----- 0-- --- ----- 0 ----
 
 # SVE 32-bit gather prefetch (vector plus immediate)
-PRF             1000010 -- 00 ----- 111 --- ----- 0 ----
+PRF_ns          1000010 -- 00 ----- 111 --- ----- 0 ----
 
 # SVE contiguous prefetch (scalar plus immediate)
 PRF             1000010 11 1- ----- 0-- --- ----- 0 ----
@@ -1223,13 +1223,13 @@ LD1_zpiz        1100010 .. 01 ..... 1.. ... ..... ..... \
                 @rpri_g_load esz=3
 
 # SVE 64-bit gather prefetch (scalar plus 64-bit scaled offsets)
-PRF             1100010 00 11 ----- 1-- --- ----- 0 ----
+PRF_ns          1100010 00 11 ----- 1-- --- ----- 0 ----
 
 # SVE 64-bit gather prefetch (scalar plus unpacked 32-bit scaled offsets)
-PRF             1100010 00 -1 ----- 0-- --- ----- 0 ----
+PRF_ns          1100010 00 -1 ----- 0-- --- ----- 0 ----
 
 # SVE 64-bit gather prefetch (vector plus immediate)
-PRF             1100010 -- 00 ----- 111 --- ----- 0 ----
+PRF_ns          1100010 -- 00 ----- 111 --- ----- 0 ----
 
 ### SVE Memory Store Group
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b23c6aa0bfd..bbf3bf2119a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5971,6 +5971,17 @@ static bool trans_PRF_rr(DisasContext *s, arg_PRF_rr *a)
     return true;
 }
 
+static bool trans_PRF_ns(DisasContext *s, arg_PRF_ns *a)
+{
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
+    /* Prefetch is a nop within QEMU.  */
+    s->is_nonstreaming = true;
+    (void)sve_access_check(s);
+    return true;
+}
+
 /*
  * Move Prefix
  *
-- 
2.25.1


