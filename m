Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F301B2E2C4E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:23:56 +0100 (CET)
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kstcy-0004km-0l
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZG-0002yg-GE
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:06 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZB-00059M-9A
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:06 -0500
Received: by mail-pl1-x62c.google.com with SMTP id r4so2703814pls.11
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9CqpWUkwS4uMUt5TO1bM8albvCwOVKljT5cmFJ6ZDcU=;
 b=s99N/oraQO6I0fQqQVxnttunz4ST0elk3Adrr9HqurLmVNrR9RmE7HyUrN04WVb1eQ
 YAytXOs9FBVej14h75WTFhVNbe/g2HanHCMLez6TbWfWo1MHOjbnufDLE/KcxoMTUzy8
 9SAJc35x2YhF/fYSpUG2hWM6g6gSxw9+8qCM/UgPWjqBb7hR44ZcYoJk2u+EIJaa/4b+
 2D0uCBfFfxK8E0lhdrtQU3+mq4lKZA0xPPzj2QecwGFOBIJjnr3iUKQTrQ+xVuuXvwoW
 S34j83bWAXMEZACZy0t82+n6jdjK+/7cIYhKVR/DL5LH0PPYlfqT2FuRqqY9CO+vJcnK
 7eYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CqpWUkwS4uMUt5TO1bM8albvCwOVKljT5cmFJ6ZDcU=;
 b=XasB3DfnkCyqJ8W92xbF1wWZc+D6lE5QZ+pnOZ4Bl6zJv5BT2AgvXi9zATqqN2q3Yh
 32pE5LgPZcXjn+5tLRqfGI9jTGjqegoDveeAaInbWK0Ierm7VSP0iM4CHhxdLHCk5gov
 roFIInQGPXJe730pzqTvw+iLOWUkjBThsLR/6NeoSJV+900HCzMHCJ7/aiZbm3/Zi8Qf
 AagohT170VedATYAhhKM8qxB1pr3gPiokzUnxKKljZp18LF5mgtF+dPQAU3rOm9dJVLT
 xTnXLoDaTzNd/z+0LfETecG9VBb1ZL2lwrmIiDRg6NcXWWcUVbZUZPycatffGWEeCmnk
 9gmA==
X-Gm-Message-State: AOAM531gjbu0QAAApmDxrGkzPnHKHpG1TkXEcTh/joYQxeSMhhOkag+N
 WwuWb5M23h1IaV3CQ5z8QB9A9QxgBWMSvQ==
X-Google-Smtp-Source: ABdhPJxdu9EEavdy6dLvTn5wYWenrF+E8pUHXCA6Gb1VRWXF5pZKwQffMig5tp38bjlQIQp9WK404g==
X-Received: by 2002:a17:90a:5405:: with SMTP id
 z5mr10134215pjh.13.1608927599637; 
 Fri, 25 Dec 2020 12:19:59 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.19.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:19:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/16] tcg/s390x: Rename from tcg/s390
Date: Fri, 25 Dec 2020 12:19:41 -0800
Message-Id: <20201225201956.692861-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225201956.692861-1-richard.henderson@linaro.org>
References: <20201225201956.692861-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This emphasizes that we don't support s390, only 64-bit s390x hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                             | 2 --
 tcg/{s390 => s390x}/tcg-target-conset.h | 0
 tcg/{s390 => s390x}/tcg-target-constr.h | 0
 tcg/{s390 => s390x}/tcg-target.h        | 0
 tcg/{s390 => s390x}/tcg-target.c.inc    | 0
 5 files changed, 2 deletions(-)
 rename tcg/{s390 => s390x}/tcg-target-conset.h (100%)
 rename tcg/{s390 => s390x}/tcg-target-constr.h (100%)
 rename tcg/{s390 => s390x}/tcg-target.h (100%)
 rename tcg/{s390 => s390x}/tcg-target.c.inc (100%)

diff --git a/meson.build b/meson.build
index 372576f82c..a6c8b4d431 100644
--- a/meson.build
+++ b/meson.build
@@ -117,8 +117,6 @@ if 'CONFIG_TCG_INTERPRETER' in config_host
   tcg_arch = 'tci'
 elif config_host['ARCH'] == 'sparc64'
   tcg_arch = 'sparc'
-elif config_host['ARCH'] == 's390x'
-  tcg_arch = 's390'
 elif config_host['ARCH'] in ['x86_64', 'x32']
   tcg_arch = 'i386'
 elif config_host['ARCH'] == 'ppc64'
diff --git a/tcg/s390/tcg-target-conset.h b/tcg/s390x/tcg-target-conset.h
similarity index 100%
rename from tcg/s390/tcg-target-conset.h
rename to tcg/s390x/tcg-target-conset.h
diff --git a/tcg/s390/tcg-target-constr.h b/tcg/s390x/tcg-target-constr.h
similarity index 100%
rename from tcg/s390/tcg-target-constr.h
rename to tcg/s390x/tcg-target-constr.h
diff --git a/tcg/s390/tcg-target.h b/tcg/s390x/tcg-target.h
similarity index 100%
rename from tcg/s390/tcg-target.h
rename to tcg/s390x/tcg-target.h
diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
similarity index 100%
rename from tcg/s390/tcg-target.c.inc
rename to tcg/s390x/tcg-target.c.inc
-- 
2.25.1


