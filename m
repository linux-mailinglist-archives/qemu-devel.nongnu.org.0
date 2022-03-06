Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A814CED86
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 20:41:59 +0100 (CET)
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQwlR-00056M-KO
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 14:41:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQwji-00042D-Qs
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 14:40:11 -0500
Received: from [2607:f8b0:4864:20::102b] (port=43626
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQwjg-0001p8-Up
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 14:40:10 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so11183464pju.2
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 11:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=USrD4Z+NJk0T9WhASYatV+Fg7sTb+IN7ppCcZuRfV40=;
 b=OROnPy9Wox0MyUPuijQwGjQsFhmtRqX9twk/Gg603ULU7LCB94jPURuBhvx4PQ1ztm
 rDuoLpR6wCBzJMCy6TFPFLVwd3896rRPtsdlqx4RLJyxacHRuKHSTH6uU5th2glyBYrr
 tl5Qz1NOVV/1hu8FiRzLAo/LH28/B/UbK5hrLwaV4UcsJWsqnJhJl8uQM4aV6QsSXFQG
 HYmbbrL4ON32JbSG2d/nthiukrtup0ulA0rimo3rCO9GNi2EHpAmcpY+GKAa5DVx1TR3
 SPZBG+nBFLD1GQ1krMgvBFaLr6Xk2NVCXQqPmzqHP2cOLfNZJaMFWOE2rGtcDOVRAZEz
 0tcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=USrD4Z+NJk0T9WhASYatV+Fg7sTb+IN7ppCcZuRfV40=;
 b=uf7AIJLBO6vekWq41QRNaNcsb/b5nbHbSDEeZ/8YE6CqnkAB4uYPX/w0UtzNrlHL92
 KDYDBndE5czDRjouCxX5YrYe0bwghd/pOuEYMvGwd2k+8Q3XNT6zXvX2R3KpylBgQWFQ
 HrWSsLBMTmKBkYHp6onsg3PgqJ3Rakjc5CHbi7QfhxcR52QZdjJODOzRbyiysK51ztav
 4adEVlU/PcLSgvcTgqILeBkCYe+lhPsNite0CTUfKzxHHBoppxsrhtSs4e0UK0SNl3BN
 G2j9mV5bbDdpESQaPm/MLV5dQE7iTLzJUKRgcI9ddTBX9D+PSZyDu5O+Tan4jnPzUmv1
 ADqQ==
X-Gm-Message-State: AOAM531Qel+uZfW7vKc7YsOA4SsLUukh4okAg/rGbqrO+OPNiKFPlZai
 5NeyUj5X9xkk29T2NU8oa0BT4fW5UUOP8g==
X-Google-Smtp-Source: ABdhPJyuMYSIJL/1YG/kqN0eWoKS3xwv95N1zrgnHVCDkj5HKzh4xQd1FGg1rPJSzory9cMqzBuNZQ==
X-Received: by 2002:a17:903:2442:b0:151:e3e2:cbf9 with SMTP id
 l2-20020a170903244200b00151e3e2cbf9mr3056424pls.115.1646595607135; 
 Sun, 06 Mar 2022 11:40:07 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 on18-20020a17090b1d1200b001b9cfbfbf00sm10060886pjb.40.2022.03.06.11.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 11:40:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Fix sve2 ldnt1 and stnt1
Date: Sun,  6 Mar 2022 09:40:03 -1000
Message-Id: <20220306194003.13030-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The order of arguments between ldnt1 and ld1 are swapped in the
architecture, and similarly for stnt1 and st1.  Swap them in the
decode so that we have "m" be the vector operand and "n" be the
general operand.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/826
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fd96baeb68..91a0873b7c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1577,22 +1577,25 @@ USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
 
 # SVE2 64-bit gather non-temporal load
 #   (scalar plus 64-bit unscaled offsets)
-LDNT1_zprz      1100010 msz:2 00 rm:5 1 u:1 0 pg:3 rn:5 rd:5 \
+# Note that Rm and Rn are swapped, so that the vector and general
+# register arguments match LD1_zprz.
+LDNT1_zprz      1100010 msz:2 00 rn:5 1 u:1 0 pg:3 rm:5 rd:5 \
                 &rprr_gather_load xs=2 esz=3 scale=0 ff=0
 
 # SVE2 32-bit gather non-temporal load (scalar plus 32-bit unscaled offsets)
-LDNT1_zprz      1000010 msz:2 00 rm:5 10 u:1 pg:3 rn:5 rd:5 \
+LDNT1_zprz      1000010 msz:2 00 rn:5 10 u:1 pg:3 rm:5 rd:5 \
                 &rprr_gather_load xs=0 esz=2 scale=0 ff=0
 
 ### SVE2 Memory Store Group
 
 # SVE2 64-bit scatter non-temporal store (vector plus scalar)
-STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
-                @rprr_scatter_store xs=2 esz=3 scale=0
+# Note the Rm and Rn swap, similar to LDNT1_zprz.
+STNT1_zprz      1110010 msz:2 00 rn:5 001 pg:3 rm:5 rd:5 \
+                &rprr_scatter_store xs=2 esz=3 scale=0
 
 # SVE2 32-bit scatter non-temporal store (vector plus scalar)
-STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
-                @rprr_scatter_store xs=0 esz=2 scale=0
+STNT1_zprz      1110010 msz:2 10 rn:5 001 pg:3 rm:5 rd:5 \
+                &rprr_scatter_store xs=0 esz=2 scale=0
 
 ### SVE2 Crypto Extensions
 
-- 
2.25.1


