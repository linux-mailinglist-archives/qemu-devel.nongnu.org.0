Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658C42ADF4D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:27:30 +0100 (CET)
Received: from localhost ([::1]:47420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZIe-0003qC-Rm
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEm-0002QB-Bc
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:28 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEk-0007Zo-My
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:28 -0500
Received: by mail-wm1-x341.google.com with SMTP id 10so4331375wml.2
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 11:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jpVEDWP3gfYFFtNFcdA/65BvVndU1vlolgIAVjnzgOg=;
 b=k96OPj2lfAGXvYOAUo1TF25grRbkg25ULq+/aeOZDHp/Xkrp/BdkO5V3HEOq2akAEJ
 dOx2ZRRiNsb2LfEmLjcHAcgARqWhDso+WkBILSCXTvCqe9OVMSwvglVKWYii0SkXkAh+
 4qUYEzeHEyOKYsRW/embGlOSLWUT8cMGDoRumw50D9bt8NdmeM/aotIgTtb5V6l+jyTd
 zP9S8v1ECNYJ/3GRsQZbAS+7ExZxZzaJ4GzxOdRNm9YGetu5gHcKPri9PHpx6J7Ju5Qr
 0NntDRNNYGjX1FKGQOVxH6yCp6uyIMXEoPtl826oNVS5+juhDfp8/R1IyHVCn12mqkvz
 PpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jpVEDWP3gfYFFtNFcdA/65BvVndU1vlolgIAVjnzgOg=;
 b=s8n7u1JbFvVy23/px6msWnVKlN/KGe2TQYG6QW7/QP0dRDfTMGekSvxnDmXwA+nXX/
 X5k/kzMzRaawVYCRJH1mk7Xps51Z5VhLuNbG+pPAFMjiLVEHYbT0OGqv/kht3sWY/9s/
 xvF7c7O5xbIbenQjGmDcLc/v09J0m1nQebLdDjEvroyJ8AnK2m2ZnnSiKVXe7Kst8FMo
 xolJfeaUvtxLDexplWuqWwcdflQRZY3uI/zMppRanq6R9g5DdfKO6DP1jUMiNvIdWEVG
 w74/0HT3QajL/x8lHlJ+s6eznj8podplpU7M+DfYKX9MSFQpHO/y24PmT40DTVXKBpqT
 Qr2g==
X-Gm-Message-State: AOAM530z3X/xdDz19JN4t+4Q4wqIuwQR5EAoJ1DsaZz297btlmeEM+lo
 /ez3B2TQ2B4eegsN8hRXNPqHsw==
X-Google-Smtp-Source: ABdhPJwX6um96NoI9RclGyJFIX79WTehg7an52FgaBfA99rPPw02m4RrUah+xUAtCWpKfK4Q8hx89g==
X-Received: by 2002:a1c:3c44:: with SMTP id j65mr724220wma.13.1605036202249;
 Tue, 10 Nov 2020 11:23:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u5sm3933272wml.13.2020.11.10.11.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:23:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 739701FF8C;
 Tue, 10 Nov 2020 19:23:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 02/10] plugins: Fix two resource leaks in setup_socket()
Date: Tue, 10 Nov 2020 19:23:08 +0000
Message-Id: <20201110192316.26397-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110192316.26397-1-alex.bennee@linaro.org>
References: <20201110192316.26397-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Alex Chen <alex.chen@huawei.com>, peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Chen <alex.chen@huawei.com>

Either accept() fails or exits normally, we need to close the fd.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Message-Id: <20201109082829.87496-3-alex.chen@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/lockstep.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 319bd44b83..5aad50869d 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -268,11 +268,13 @@ static bool setup_socket(const char *path)
     socket_fd = accept(fd, NULL, NULL);
     if (socket_fd < 0 && errno != EINTR) {
         perror("accept socket");
+        close(fd);
         return false;
     }
 
     qemu_plugin_outs("setup_socket::ready\n");
 
+    close(fd);
     return true;
 }
 
-- 
2.20.1


