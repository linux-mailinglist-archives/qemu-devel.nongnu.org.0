Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C48559CF8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:05:52 +0200 (CEST)
Received: from localhost ([::1]:42304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ksZ-0002Cp-Cw
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4kpz-0000Mq-2Y
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:03:11 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4kpx-0002Sf-Hg
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:03:10 -0400
Received: by mail-pg1-x535.google.com with SMTP id 23so2657257pgc.8
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KHVAnKap8arAL/CJ/RRCZLqAxsImPdNLBj2NT1+94XQ=;
 b=N5yO4QFcO5dzUdjyYVrJU3vDAWCSqKtT4esSopwTz5IeUKPiEYbpwYzZ64mD5okDJN
 pY+jh4OP46vDeglLAMrajER4ivmVEKsr1+BqTdfMIzFjyLmMn0w1ITEx1it33B2nePfN
 mIypoRCPcm/2OITs0FuOeuzXtlLm/Bb+waf68Tay5zSjH06B9qQTBkJr1V2rXDXw28G5
 LbYaKZ/AHkRaAWJac2fXQblhVoRehBob2h4thu5s4iG2fi8hHo6sqln20JsEIhj2uOFu
 6oEMMLcLPnKDBHEWdTqgTkM8z7+LjE3mkJUbacNteayz596kokZbR2eAS5d+2gsLqtVj
 kxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KHVAnKap8arAL/CJ/RRCZLqAxsImPdNLBj2NT1+94XQ=;
 b=QtWRbuZ3BKODtdvDdAU5ShXBQffGVC2QWi3RwBMtvvmiPeBWUNPyU3CeONqJRnABb3
 GIsLEO8kh+PRSIDd3WCNSadwxl/1F7g3q1tz/6gqS/U+4SRhrN0cky0+AamWw6vGG9RH
 MwJ3OdeW1zsxaH6vdUL3cY9LgDxRyEanmNEFMSOZK0wp8hL1pcu7etHHhNEQbO6djGrw
 nvCGwzVwmI3I0/UL2/U6NRUzNAPMmLlZmSZm8id4vY+yJ4RZ5GHkcGM9nMSzbBduZ5sV
 V9ggsYmSQr2gSEGmWPEtuZNTg+Yk1CVr7BlDcNYpZhhVglI/3H7flnIdg48eSrcg2xzl
 ey7g==
X-Gm-Message-State: AJIora8/Rg/4xp1IWIHUeeJehHche0mb2VfC8qmXSy46XvLccFSfchqG
 Gm+nDsHY3TvWvE21e/lJ+J8=
X-Google-Smtp-Source: AGRyM1tHnHR+PWbhlUqGOpDrpxYsiDr8FDrKuqfyMJ/tqZBSSg67Q8Opkq34X1Wmlmy3Dtmzm7Ly2w==
X-Received: by 2002:a63:2c15:0:b0:408:a75e:340a with SMTP id
 s21-20020a632c15000000b00408a75e340amr12540117pgs.313.1656082988188; 
 Fri, 24 Jun 2022 08:03:08 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:80ba:2fd0:a1d1:c891])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902714a00b001693bd7427asm1951253plm.170.2022.06.24.08.03.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jun 2022 08:03:06 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH] build: Do not depend on pc-bios for config-host.mak
Date: Sat, 25 Jun 2022 00:02:58 +0900
Message-Id: <20220624150258.50449-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Commit 45f1eecdd63f9e4fa93fef01dd826e7706ac6d7b removed the dependency
from configure to pc-bios

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3c0d89057eb..2e95d473b3e 100644
--- a/Makefile
+++ b/Makefile
@@ -87,7 +87,7 @@ x := $(shell rm -rf meson-private meson-info meson-logs)
 endif
 
 # 1. ensure config-host.mak is up-to-date
-config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/scripts/meson-buildoptions.sh $(SRC_PATH)/pc-bios $(SRC_PATH)/VERSION
+config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/scripts/meson-buildoptions.sh $(SRC_PATH)/VERSION
 	@echo config-host.mak is out-of-date, running configure
 	@if test -f meson-private/coredata.dat; then \
 	  ./config.status --skip-meson; \
-- 
2.32.1 (Apple Git-133)


