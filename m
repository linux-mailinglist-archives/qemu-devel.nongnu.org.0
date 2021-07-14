Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F6A3C89D0
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:28:55 +0200 (CEST)
Received: from localhost ([::1]:58432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3igo-0005pN-Hr
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3idW-0008Oj-Ox
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:25:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m3idV-0005hr-9F
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 13:25:30 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso1962183wmj.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 10:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jcYcrXSu+KqlQ/6QrGFdUV6rCUe9Kbh1qvz/TUIqCys=;
 b=gHiJmZ0V0T4FyGzjyh+GYXbsTnUi6dFa+GD35KyQc9kb5ER5DHmK6M8QHGpNOX1eIH
 /UmUOwG8IlfrjCKbOppD0UEOKuQ/oO5YPIAqXltwBJrV0uwQTO7Sxmsi9lF3k/GNrf8j
 VdRpkjUhptMrAAMTqIWfyEysUL8meP+tcEk3t+qMXs80IGaqxCttzps26GfkU/GnfTA/
 vfkvqilCJPVmHQqoue6q7rXXU8ngc5LuSxPM8MV0of4evqV3EfQ0UOxzdkxJs4IS9rB4
 b2jgHmW/sHsI+wiCJUyUr7iI9cwVFmusSEaDw9UGIjZFHWfbq0V9Jd8Xcl5Sm6V8gLe2
 KY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jcYcrXSu+KqlQ/6QrGFdUV6rCUe9Kbh1qvz/TUIqCys=;
 b=LAOmUC+RldKjuBuzT4fWWxfUu3Ng5z/V17/Fx5tZe7hkzNIS7uXs1BNp1OKe2NscNt
 QpZ3ukwepnOeGehkiWd/2COHnTuqNbU2/kdw84BQAkZA9uNiymbwhRw7YQI92swcnPS5
 TqSzdc7ogmS2YOva5DJGYnNScHiLYDwhRbC0OLRJnxCWYNkZUoqhZ1LUzHJicERW39o8
 31jE7vBvUjUeTJ8ytdF98AwZOd9TyMHKm6zjQwiYME26paX8HQjMgHj7DubXE3yYuwy4
 XZFARuXro4hNOHuH9I0XQXtJyRxqTjphudK8MJ/+FF7jWAfb6eijuU+6tSJerHsGW3/M
 br0A==
X-Gm-Message-State: AOAM531oKaUHbEn8G7rSfUYE2hx6H9s498tXP/rUv3Rm2SiivEA0FiSD
 9NfUXxuE4VwDfguUjLD9WAv7jwZjPSPiGw==
X-Google-Smtp-Source: ABdhPJwTygRiSwFZOD/UFdaLLZOCa9HwqFcYy+Jzfc2Zy8+g0WVmBHHfRXrIWgdFwLjie9QxMDLHAQ==
X-Received: by 2002:a1c:2142:: with SMTP id h63mr12753967wmh.84.1626283527752; 
 Wed, 14 Jul 2021 10:25:27 -0700 (PDT)
Received: from localhost.localdomain ([102.41.175.227])
 by smtp.gmail.com with ESMTPSA id l18sm6434393wme.29.2021.07.14.10.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:25:27 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] docs/devel/tcg-plugins: added cores arg to cache plugin
Date: Wed, 14 Jul 2021 19:21:51 +0200
Message-Id: <20210714172151.8494-6-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714172151.8494-1-ma.mandourr@gmail.com>
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 docs/devel/tcg-plugins.rst | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 595b8e0ea4..370c11373f 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -330,11 +330,8 @@ configuration when a given working set is run::
 
 will report the following::
 
-    Data accesses: 996479, Misses: 507
-    Miss rate: 0.050879%
-
-    Instruction accesses: 2641737, Misses: 18617
-    Miss rate: 0.704726%
+    core #, data accesses, data misses, dmiss rate, insn accesses, insn misses, imiss rate
+    0       996695         508             0.0510%  2642799        18617           0.7044%
 
     address, data misses, instruction
     0x424f1e (_int_malloc), 109, movq %rax, 8(%rcx)
@@ -378,3 +375,9 @@ The plugin has a number of arguments, all of them are optional:
   Sets the eviction policy to POLICY. Available policies are: :code:`lru`,
   :code:`fifo`, and :code:`rand`. The plugin will use the specified policy for
   both instruction and data caches. (default: POLICY = :code:`lru`)
+
+  * arg="cores=N"
+
+  Sets the number of cores for which we maintain separate icache and dcache.
+  (default: for linux-user, N = 1, for full system emulation: N = cores
+  available to guest)
-- 
2.25.1


