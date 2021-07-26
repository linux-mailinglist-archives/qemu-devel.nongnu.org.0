Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FC33D6904
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:52:45 +0200 (CEST)
Received: from localhost ([::1]:58544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88Wj-0004Rp-00
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rt-0002jI-Fo
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:45 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m88Rs-0006BW-2J
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:47:45 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso1017147pjb.1
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 14:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EeP1+NrmJvGDfY8+Y89RDlhc26oiM2pn4/yKW7SqsKg=;
 b=aMaRyYxzhm1oiOqfZXwQ7aow/rGTYPLBMsmKyr8cNerOoZExGbKwdOcRKRGNtzdgnp
 /V5EJ9deI2d3tSProLfYLJ4tV9FO4/5lYLgtbnj8pEa8Tgkddv28gUXy0hwuzTXvkUWu
 6HFxVCYEh7JjG2KssmZOKvwrZkfmCo5Q6reMjxwkCgqOPiNTVjzC5YoLlbsrSk8jtB3K
 cli8JrSy8sk4blzM/jeugSM/Z46xABEre80Vw30Sgl6QaZdM330hlIOc6pxIYK8Df2Fn
 Nin+y3os6hTlDtFm/HlcRaVt8wiT/xeo6wTm+3AqQVBrXdAOMrBErvphALF5RvX2owpW
 iARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EeP1+NrmJvGDfY8+Y89RDlhc26oiM2pn4/yKW7SqsKg=;
 b=ri07RZCyUwqLT2RBzYg9SJcMElk6OyMkQauxM4yIvzgUwD4yJDUi0IUW8BlOwDQcDS
 Abky3PrwIvil/3pXFro4VDeMY1qJ5657vHPDixQ3ka/jmqVyFmDVynGyjAz5Uucw6hk2
 wzU7XZ7HdkCA21baVngoWRIQEB/JX4NGpcmHEPdVZyOU81dpxbW/gRd3knETuz6bgJE5
 Hx45wg/IqVCqZb9Wvfa/lpxkKfG3svgaqkFMJdtBr5R3lr6HhE45K3oBhS/AsfVGwm7J
 yKUJ72101g7LZRKwMlB8iXlFvHy1AYYRI23bGbOIhvNSTuWqCfRJwoemm2pYpLFgGZ3C
 SXmg==
X-Gm-Message-State: AOAM5307hvcgTGeSeMh2kAr/6yhL+JXg/7lnRpj4dJ3LeINOyrm/oy40
 tKn5npELnDapDTKoQ4watufl3Npp+hjOWA==
X-Google-Smtp-Source: ABdhPJzCrZgN1Xa+N83ZO/KT8ZDt1Gce+nuQ9OHhizNbj79aoPus7wRSwIzOCPF492EzCV8lur8gdg==
X-Received: by 2002:a63:f00d:: with SMTP id k13mr20662523pgh.260.1627336061453; 
 Mon, 26 Jul 2021 14:47:41 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id e8sm997679pfm.218.2021.07.26.14.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 14:47:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.1 07/12] net/checksum: Remove unused variable in
 net_checksum_add_iov
Date: Mon, 26 Jul 2021 11:47:24 -1000
Message-Id: <20210726214729.2062862-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726214729.2062862-1-richard.henderson@linaro.org>
References: <20210726214729.2062862-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: peter.maydell@linaro.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
../qemu/net/checksum.c:189:23: error: variable 'buf_off' set but not used \
    [-Werror,-Wunused-but-set-variable]

Reviewed-by: Eric Blake <eblake@redhat.com>
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


