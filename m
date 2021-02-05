Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C92631167B
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:18:35 +0100 (CET)
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AN0-0003Fx-Lw
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A37-0002Wr-Cc
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:01 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2n-0003Tn-H1
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:00 -0500
Received: by mail-pj1-x102c.google.com with SMTP id q72so4431397pjq.2
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5oMkWTFAvkbENXCd9UcZlqUmvtysI4E37yjhcZ4CH7A=;
 b=DBFczdXtmyPuofXW1veFtbo/xYHksbLPShpUNFnNaOnYPuEVj3xo6wmmtBWZUN9BJN
 tD2naYHElT0U8cEBvNvnNRY6tHJmU7czWGzg61t3T64iOaIfTzx8TqH6AqfaTasqVIqy
 IWo4gaN0gApV4aZfsYk+uvj59sLotFGdLOdbYswgkNTjhrJUBnaJse9FKtjvbbjfXyMc
 jQSP9yJw7kyBXSUerzF/M6CyWm+59qff6ShFzdgQYqfns5EYS13W4sNmQp6v1XZukvhq
 1/YHb/pTTmc9r7gkKVM/T+FNA5RnAsbHTsnda3U1gSIC2IMLHXShVy8rKjJ7QAEQG0sR
 CxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5oMkWTFAvkbENXCd9UcZlqUmvtysI4E37yjhcZ4CH7A=;
 b=HVAf7srQAMD8d581mfa0PVXUX8deT5yVwTL/IvUse7xdOgAzapYa1Io9VuwkJYTHqM
 T9zxuKcI+vAcHQfp1tSGWMxh4faTVDGxgCDOYmUajT3wFnFtPFQ29/975UjGrfGY+WfP
 ru/eSQMeNHr3kxK7WLmqhgm/T9rcJvT2s8tel/1rGqu16MuBZ2/XG5/xXpZ9h8MPO3vQ
 BMXUp/K0dGQOV1zugUJ/6HFkOumOjzlWjVQScNqrRY1wU00kA6Nrd65VuPwhgHTp/uMg
 U6rztrXUEG1K1PNiVV8LJUGgcOKf254T6x+8674vB8GZ/4B8oCwar7vvA/mLG+xiMKPY
 0lwg==
X-Gm-Message-State: AOAM533kZRgs/xgoWNUpnz1+PQoGVLxo47h+zT6AkczsWytzGIFF2u9p
 qwfEJHeLFygrtiUCerVkL35ZVhtUqVLAglMt
X-Google-Smtp-Source: ABdhPJxtrQ/Yfe7Fz1Xcs/ZK+Yp+RtbhtKuU0N3kGzxIVr0ZNERdRRGVg0kSHU5BKLnMbvxULjxTGQ==
X-Received: by 2002:a17:90a:53:: with SMTP id 19mr6057736pjb.29.1612565860181; 
 Fri, 05 Feb 2021 14:57:40 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/46] tcg/tci: Remove TODO as unused
Date: Fri,  5 Feb 2021 12:56:29 -1000
Message-Id: <20210205225650.1330794-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 5c84a1c979..e0d815e4b2 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -33,14 +33,6 @@
 #include "tcg/tcg-op.h"
 #include "qemu/compiler.h"
 
-/* Marker for missing code. */
-#define TODO() \
-    do { \
-        fprintf(stderr, "TODO %s:%u: %s()\n", \
-                __FILE__, __LINE__, __func__); \
-        tcg_abort(); \
-    } while (0)
-
 #if MAX_OPC_PARAM_IARGS != 6
 # error Fix needed, number of supported input arguments changed!
 #endif
-- 
2.25.1


