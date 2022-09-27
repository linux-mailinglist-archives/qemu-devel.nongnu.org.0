Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113D55ECF63
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 23:39:26 +0200 (CEST)
Received: from localhost ([::1]:52108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odIIW-0001K0-As
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 17:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odIER-0005k6-WB
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:35:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odIEQ-0006kP-4h
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 17:35:11 -0400
Received: by mail-wm1-x32d.google.com with SMTP id o5so7405167wms.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 14:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=JeOTEj0u9zgJJW0hLMI9IraBljRSe4nnDYuQlbMwrLA=;
 b=wuxPGZvh4lPA4GWjR/6bi48WNFXlJ7vJzpHnED+s+mzz67ll18jANuF+moImr1MP54
 DzN46+AcRhIJuk7B2H7Y6JRMe8IdEH99nuNiqBXZlByvUfWXaWRV8FIptTDWKxhdNpz1
 xqxl9gcEKauBlldZbs2LQaK+0g9KPYPfd7Uh6ggnZa88dEd5MBVz30a/20PJfOBSpHy4
 RI2yeHzLM41WAHhIOKVzKYk212YTrJniPVZHoS54PRzqZiSwSFMksgqWPKu7JYj8XcQn
 P3diEJxMpJMNtKFPrxYcopW1YgL0ARW3Lhh0l+b1xRkQF77JZWf/UAEfjV//7Y/tHgS9
 Hcxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=JeOTEj0u9zgJJW0hLMI9IraBljRSe4nnDYuQlbMwrLA=;
 b=hzre8tJ3MO4cXUwE5+qQLjwj5JGE6mv46aH4fR/AtLfJk6G2TBT6mx8y4QsHeQXCqn
 eMNsgWUC0xIq54KsjD57xKTWljg7XyQskzT6Mk/WPAdyLkjJe1jhY2SGXF7hbRM86Qmv
 ue3ZP+3xiL8vPM4bwEyi2IzBWOXiw+qO2u/QiWwGOdWN69+f0tieCIGM3UlAPedH2j5Y
 wv5l3DEmpnQMmFJ0eBzMcONNaRVscEYvyIBhPm7uDzUBejQ0Nt6nRq5ioxWpRf2CZ49l
 iBw772vDSfN4jIhbpm2yXFZJ6EnPu+cp1Zj0j+ooZC6knEVIGT6EHvJrS7a8IHvMNfIi
 xqlA==
X-Gm-Message-State: ACrzQf3854XjCcit64SNncGlvMcbZcQ6rhs/N5AQCA+faHDZ6jZII1IC
 z+9e1PkKiQ5SyOR8yI+N2JeYIw==
X-Google-Smtp-Source: AMsMyM7Sv5hZeQUcPrK8q61wSr2FVzY6cctDrjwBggdUODGssJXw+LkRivvjP6l6thCERMmbv4cTVA==
X-Received: by 2002:a05:600c:3595:b0:3b4:8378:98d2 with SMTP id
 p21-20020a05600c359500b003b4837898d2mr4421183wmq.64.1664314508323; 
 Tue, 27 Sep 2022 14:35:08 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c4f5400b003b47e75b401sm16370006wmq.37.2022.09.27.14.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 14:35:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5AFEE1FFB7;
 Tue, 27 Sep 2022 22:35:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH] tests/qtest: bump up QOS_PATH_MAX_ELEMENT_SIZE
Date: Tue, 27 Sep 2022 22:35:01 +0100
Message-Id: <20220927213501.4069117-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

It seems the depth of path we need to support can vary depending on
the order of the init constructors getting called. It seems
--enable-lto shuffles things around just enough to push you over the
limit.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1186
---
 tests/qtest/libqos/qgraph.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
index 6e94824d09..5c0046e989 100644
--- a/tests/qtest/libqos/qgraph.h
+++ b/tests/qtest/libqos/qgraph.h
@@ -24,7 +24,7 @@
 #include "libqos-malloc.h"
 
 /* maximum path length */
-#define QOS_PATH_MAX_ELEMENT_SIZE 50
+#define QOS_PATH_MAX_ELEMENT_SIZE 64
 
 typedef struct QOSGraphObject QOSGraphObject;
 typedef struct QOSGraphNode QOSGraphNode;
-- 
2.34.1


