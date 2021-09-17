Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A3440FDFA
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:34:42 +0200 (CEST)
Received: from localhost ([::1]:47978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGoy-0002fa-Ay
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeK-0003T6-BG
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:40 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeG-0005PK-MO
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:40 -0400
Received: by mail-wr1-x433.google.com with SMTP id t18so16145302wrb.0
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ctCyxck4EL5Ky38T3SMMObhR0rKiRHYqaGdfnEA1vgQ=;
 b=Wj8QUPdIh0XAfjh5lrXE+fCygtR0mzfy7j4WmJpkhAQnru/v5aqvs5AGX76iKNTYGa
 nYq2nd6F3FdZZDnSCS9aZ3Io7jUAnX172XECQGtWLpvEgB0fib07hQOd0Wr1zFpdT372
 6n1vHI7dFptV1POk0icVuZRwtQYDqaaP2bMwBwOIqva9o1dOfE02yXDr6V2pkyACIyxn
 cmdThjN6MECfr7UeaMIxeFxy9qNbCE0eUptGjtnmBijNAzZB/zKSX0zzVZIyAip1218x
 hZYcDU4Dh/p8rdJva2LpNQ+9oTLgIttog8q88m8M3ioGjLMpwxpUl/wYQJathoJttQJX
 XzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ctCyxck4EL5Ky38T3SMMObhR0rKiRHYqaGdfnEA1vgQ=;
 b=Yyg8l1xDreEriRMde6ZT3Qhuw+SWGLcfyM8mx9Nh0K7xrCQ+eVmkqkj0e9cfmlr9CI
 mj5MbrT31slLTJUmq8KYQBRc/W+wYmiSL+DTkqNPesc678ZS+mD+dZwykSE3Bl21Updn
 +wny0ZZkAfv/7ShMmZDfydLF4/ddnC8v3DBbrEC/L5Gm4/YbFXKSwmtBnREaRfu2XFpb
 pu2rYEPdRHDMT4Z3aPcNuUjV22m/pdSRmKQLsY8otE/R3zpqTtzTOH9edhmeUW1opNiW
 ZkJNs+iIm21kNzkdDruId9CoZANONpZswszeQcIy6j30O0YkYc9HqtILYcl1qkfKr1XZ
 ym5A==
X-Gm-Message-State: AOAM5331RxVoiKKbYCJOZ1NGMEh9JYTn4oyPwHO5GNKjJHybbUXoLZNO
 syTiyeKsAiFansAmoMAvu2b/zQ==
X-Google-Smtp-Source: ABdhPJziXvyAEg4pm0D8BO01C0TIOv9R9dLHHMLd1h7/rAS7MFl9fjh0PQMNd0FBLgORa1H27WZXtA==
X-Received: by 2002:a05:6000:1ac5:: with SMTP id
 i5mr2290225wry.292.1631895814741; 
 Fri, 17 Sep 2021 09:23:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g1sm12758034wmk.2.2021.09.17.09.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:23:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E76A1FF99;
 Fri, 17 Sep 2021 17:23:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 02/11] tests/tcg/sha1: remove endian include
Date: Fri, 17 Sep 2021 17:23:23 +0100
Message-Id: <20210917162332.3511179-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917162332.3511179-1-alex.bennee@linaro.org>
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This doesn't exist in BSD world and doesn't seem to be needed by
either.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
---
 tests/tcg/multiarch/sha1.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/tcg/multiarch/sha1.c b/tests/tcg/multiarch/sha1.c
index 87bfbcdf52..0081bd7657 100644
--- a/tests/tcg/multiarch/sha1.c
+++ b/tests/tcg/multiarch/sha1.c
@@ -43,7 +43,6 @@ void SHA1Init(SHA1_CTX* context);
 void SHA1Update(SHA1_CTX* context, const unsigned char* data, uint32_t len);
 void SHA1Final(unsigned char digest[20], SHA1_CTX* context);
 /* ================ end of sha1.h ================ */
-#include <endian.h>
 
 #define rol(value, bits) (((value) << (bits)) | ((value) >> (32 - (bits))))
 
-- 
2.30.2


