Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE1F3C65CA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 23:58:22 +0200 (CEST)
Received: from localhost ([::1]:33674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m33wT-0003q7-Gc
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 17:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tv-0000aA-Jn
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:43 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m33tt-0006rv-Df
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 17:55:43 -0400
Received: by mail-pg1-x532.google.com with SMTP id h4so19728607pgp.5
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 14:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h4VDfQcFJ7YgMKSWd754t3G1Gz4yG0zsxrrNOOR5Dw8=;
 b=fb793n8maWYopelOndZlhmLQd6fdjBsVcayxajgZEqV/r11fnTNExQgx58eFQGrs7Q
 X+zL8fEpvuJa5SuVZ2Y+34GpG/XHtSXbze5LqP171zdkT+wTwQY6XpnDi8nMu8QFTHpf
 wOJeQ8QmAsJHIEMqN2DkkWmeowgZeaJuEF2Z78mszDjaCa49P1uV8EgnlwjlEghXdKBM
 zf2B/tOBkEaLUY9zUE5t3etRHHytV5UJtA/KddHgM914ccTVVce5mBDn+kO9l/FyC5xC
 CItf3tOlzW5UfoXA3OvgANJkqRDJTLMteLaB1wc0QLZtMctWv6Ue7qB3OBLltasOM/eL
 /XOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h4VDfQcFJ7YgMKSWd754t3G1Gz4yG0zsxrrNOOR5Dw8=;
 b=ZTrF0GTtMKyjMuWR2QC66gvFw1dsUmC1IRd0bgrPxWlWY6TXKEalItUqooabGs/pFH
 Tsmgc6ozilZ+lsaOBJoFp+fVNuie4npz0eO3TVio1icc2SoroM4N1OHzqh3Mi9rAFoIG
 4Eug7T1XtjDffo1wl62jiik8pPUmoU/4iSebvEDuDV7UCkokgvdBCdWEiubRHKoXDiWf
 5NMbUqxxkmskxvBAr5MPv04AjyDMHHKSsYjqd6Q3SepEWeQ1gALpfO1o0dLoSLxyeUGS
 58ABO6O5DKVkZhmjD7cs4kFgWts+k5fw41+iyYfC0DOq3lIYExxbjqdK/dke6QzSqpQd
 Qo2g==
X-Gm-Message-State: AOAM530FEcU0bT3BkpBkOe3329wOmSD7Zu8SAV92OLqRXeHPGPxj+tTf
 jrWZRo2sdRbuMu5DPUzyVOukWUwW1apa8g==
X-Google-Smtp-Source: ABdhPJx3bwvtnKqMldj6frjSX5qNcie4FunuAoESfl9Ge7Z+ZNznFYiMWoHXDVGJcGTcGWN9VpX3Bw==
X-Received: by 2002:a05:6a00:1411:b029:302:d9d6:651d with SMTP id
 l17-20020a056a001411b0290302d9d6651dmr1294472pfu.56.1626126939806; 
 Mon, 12 Jul 2021 14:55:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d2sm376932pjo.50.2021.07.12.14.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 14:55:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] net/checksum: Remove unused variable in
 net_checksum_add_iov
Date: Mon, 12 Jul 2021 14:55:28 -0700
Message-Id: <20210712215535.1471256-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712215535.1471256-1-richard.henderson@linaro.org>
References: <20210712215535.1471256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
../qemu/net/checksum.c:189:23: error: variable 'buf_off' set but not used \
    [-Werror,-Wunused-but-set-variable]

Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 net/checksum.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/checksum.c b/net/checksum.c
index 70f4eaeb3a..68245fd748 100644
--- a/net/checksum.c
+++ b/net/checksum.c
@@ -186,12 +186,11 @@ uint32_t
 net_checksum_add_iov(const struct iovec *iov, const unsigned int iov_cnt,
                      uint32_t iov_off, uint32_t size, uint32_t csum_offset)
 {
-    size_t iovec_off, buf_off;
+    size_t iovec_off;
     unsigned int i;
     uint32_t res = 0;
 
     iovec_off = 0;
-    buf_off = 0;
     for (i = 0; i < iov_cnt && size; i++) {
         if (iov_off < (iovec_off + iov[i].iov_len)) {
             size_t len = MIN((iovec_off + iov[i].iov_len) - iov_off , size);
@@ -200,7 +199,6 @@ net_checksum_add_iov(const struct iovec *iov, const unsigned int iov_cnt,
             res += net_checksum_add_cont(len, chunk_buf, csum_offset);
             csum_offset += len;
 
-            buf_off += len;
             iov_off += len;
             size -= len;
         }
-- 
2.25.1


