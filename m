Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B703DB79F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 13:08:42 +0200 (CEST)
Received: from localhost ([::1]:52256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9QNd-00075W-49
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 07:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QFD-0000A4-7N
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9QFB-0002ZI-HX
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 06:59:58 -0400
Received: by mail-wr1-x436.google.com with SMTP id h14so10755366wrx.10
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DIUHnJ9StEoveZf4Nm4WQZNeoUt/hCk/vohXCdTI0co=;
 b=xQQK/+hjng0KWP4e3Pk92ItKftKnHAo1MgndzPazELYNPEw1+dCtpvevd0NCFcE3rd
 wWLBle+KSHeqwq1iiyiyht8bRE249j7+xr2/lS9VBosqHgIGD9Grz0N59Ud+a7ABhNB6
 hF1VBSLpCiLnbIK2GwqOTStSGHGxK4/IjDgJEdJK4zP8hd26yEJBDn+3UAcxws/BG6bu
 /NG1RI6XEfvbvTXFwPi8m/UdgytwmPmvhrqAjGLUgb5OAF7FZVeUDtDUKCXLdrw+9I49
 TaDpeBrXWLKUVPe0yUN4KdIlCaZBPhFvNZAxXlKp+CfB1NbNP0ZHCNgyWbG1qQHAdyRP
 j6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DIUHnJ9StEoveZf4Nm4WQZNeoUt/hCk/vohXCdTI0co=;
 b=VagZ0QtJqcFoTVkiVB4eYEuKMmiQta8fT6ELB60+3AD7ByDlP0KUHhhSL2NTYvyWif
 t2oYM1630roFIDVdTCjVr7sBwmKI4sF9x0UxI/bQoUijIK5m8vC5W9aGJ2nQ73mAigK4
 sH9/2qHX5DoHDDRsdG8p+DO2CenH8B612gqBG5VvgwU+uF8ZjoR4JWbKraafgx3BOV5L
 m3aBKmR3h3hUrKvnCC71cLt+dOFPqdyyIWaKxZS5FmyEWGCyJnUqdDe9a0qCY5liZ64R
 vL9C+c3Rky5QcPPDV6qrQCXQB9cYunTfk3ciRHZhvY19A5QI2zpjvtUF+0wlryYSsIn9
 vw0w==
X-Gm-Message-State: AOAM5307OaWNg+dYNFMCMFed4pbRiWmEmii8S1Fc0GQZY/ARTC5yR3lI
 cYvVtB/fREgY0PGGvhqJ9nCMCVUPTlczYg==
X-Google-Smtp-Source: ABdhPJzazPU943JLsUI1TRFL6hW+1RO6ZeXoB4MNdNJlfiomegZJev3lTgm3BVbPxrNRmgxaL7o6Ig==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr2380312wry.241.1627642796229; 
 Fri, 30 Jul 2021 03:59:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p2sm1349697wrr.21.2021.07.30.03.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 03:59:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 8/8] stubs: Remove unused arch_type.c stub
Date: Fri, 30 Jul 2021 11:59:47 +0100
Message-Id: <20210730105947.28215-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210730105947.28215-1-peter.maydell@linaro.org>
References: <20210730105947.28215-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We added a stub for the arch_type global in commit 5964ed56d9a1 so
that we could compile blockdev.c into the tools.  However, in commit
9db1d3a2be9bf we removed the only use of arch_type from blockdev.c.
The stub is therefore no longer needed, and we can delete it again,
together with the QEMU_ARCH_NONE value that only the stub was using.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/arch_init.h | 2 --
 stubs/arch_type.c          | 4 ----
 stubs/meson.build          | 1 -
 3 files changed, 7 deletions(-)
 delete mode 100644 stubs/arch_type.c

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index e7789399508..70c579560ad 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -24,8 +24,6 @@ enum {
     QEMU_ARCH_RX = (1 << 20),
     QEMU_ARCH_AVR = (1 << 21),
     QEMU_ARCH_HEXAGON = (1 << 22),
-
-    QEMU_ARCH_NONE = (1 << 31),
 };
 
 extern const uint32_t arch_type;
diff --git a/stubs/arch_type.c b/stubs/arch_type.c
deleted file mode 100644
index fc5423bc98a..00000000000
--- a/stubs/arch_type.c
+++ /dev/null
@@ -1,4 +0,0 @@
-#include "qemu/osdep.h"
-#include "sysemu/arch_init.h"
-
-const uint32_t arch_type = QEMU_ARCH_NONE;
diff --git a/stubs/meson.build b/stubs/meson.build
index d3fa8646b38..717bfa9a999 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -1,4 +1,3 @@
-stub_ss.add(files('arch_type.c'))
 stub_ss.add(files('bdrv-next-monitor-owned.c'))
 stub_ss.add(files('blk-commit-all.c'))
 stub_ss.add(files('blk-exp-close-all.c'))
-- 
2.20.1


