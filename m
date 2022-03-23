Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B089F4E4DD7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 09:11:43 +0100 (CET)
Received: from localhost ([::1]:34550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWw5m-0001gi-N7
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 04:11:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWw2x-000704-5j; Wed, 23 Mar 2022 04:08:47 -0400
Received: from [2607:f8b0:4864:20::102d] (port=45028
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nWw2v-0004s3-CR; Wed, 23 Mar 2022 04:08:46 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o6-20020a17090a9f8600b001c6562049d9so1009806pjp.3; 
 Wed, 23 Mar 2022 01:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JdSm91hvdvG+iqWNOoJDdr4G5I+f7aXrH0SNn7ScfEM=;
 b=XZ2RYE4CK5H7AzsajM3mP91fVf0D5bYgGR9l18E4/zcB2GCqRZbXnLhAxPLQjFlHo/
 td+45mFNmleKZtRJVSxLhPjTYlweNe72sBsSdqppAwrMkY7tv9TfuOsWJ788qRCBj+9q
 hVdCOCFygaBiLTsy40j12S9HMI49iTHH5PMezwQRpzoHdKcGcNO5P9Z9ZFh4VdnLqzOf
 FyXgyEGEcCYYWVkftEoI4eE/oCDHi83SrfBBCumb7ilVNqtsBuS99orl4ydPGJNVp3x+
 pvg6sEKzIgAE9pDVW7JprvAlC0+MEv7EzsPQhZ9ZUXWCQTJIjzm3AKuGFJjhqI2NXHOc
 8POg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JdSm91hvdvG+iqWNOoJDdr4G5I+f7aXrH0SNn7ScfEM=;
 b=xXtHoMFo+HsrlhlabI7XHOBxkn9el+OqCts1fBWrLUx1gEoUewZt/WBXexnFgFtW2C
 YHW154wWf5Qnuqq7h7oLOjAH9V37Yf0kWgUAcRfpgJsBiYoCZKx6ZrhNAob2xMHhTG6l
 /rhc6ASLUuOvFA9VL0/y7ij0s8kxC11A6mLVvKbScz3RYJon+uqGF8YBksh8lroRpdye
 I8Q76aptmQdMRvyan6ESnMEPhO0ScOLasO+RzOh7miUm3eXUHX55KEiYl0IAKBOMC6IJ
 X3a3K5xhkPeM5nbUsQ/ZuCq/qf8LAby8Uj/YWlbghI3VqO55RMMweDcXhdziZQB3sTsi
 P7Sw==
X-Gm-Message-State: AOAM531GpeTOFDsoDuS5CPPkpcgnoG3U/x83GifTLsVkWy1k+oVW6/bY
 pC3xecApL2kyR2YFqEcXzX8H1PBjRQ/B8A==
X-Google-Smtp-Source: ABdhPJy7uqFE79s9zHhf+Emxe8glbTCW2XzN6QFWgi/mN+CcvN+AV3JWDRel11qVdQdMfN3X/UF2lA==
X-Received: by 2002:a17:90a:1b65:b0:1c6:5bc5:99b4 with SMTP id
 q92-20020a17090a1b6500b001c65bc599b4mr10006889pjq.177.1648022922715; 
 Wed, 23 Mar 2022 01:08:42 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 v13-20020a17090a088d00b001c64d30fa8bsm4002999pjc.1.2022.03.23.01.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 01:08:42 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: QEMU Devel <qemu-devel@nongnu.org>
Subject: [PATCH v3 3/3] misc: Fixes MAINTAINERS's path
 .github/workflows/lockdown.yml
Date: Wed, 23 Mar 2022 16:07:55 +0800
Message-Id: <20220323080755.156-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20220323080755.156-1-luoyonggang@gmail.com>
References: <20220323080755.156-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=D0=B8=D0=B6?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=D0=B8=D0=B6e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 01d2ce93bd..0e93d02c7e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3615,7 +3615,7 @@ M: Thomas Huth <thuth@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 R: Beraldo Leal <bleal@redhat.com>
 S: Maintained
-F: .github/lockdown.yml
+F: .github/workflows/lockdown.yml
 F: .gitlab-ci.yml
 F: .gitlab-ci.d/
 F: .travis.yml
-- 
2.31.1.windows.1


