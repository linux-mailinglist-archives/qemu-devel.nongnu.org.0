Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4911C3DD545
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:09:11 +0200 (CEST)
Received: from localhost ([::1]:40928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWko-0002gA-BA
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaM-0000Rm-68
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaK-0003a4-Oz
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id b11so15835714wrx.6
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oAmHaChlHeq8uZJC1dsECbrC/qaM8LnULTn49QMEW04=;
 b=o8f9UcKjTg5qY35Tcd689IhDfmTJxs6A9s7yONGVBuyvrOdO7pEOFvcra2t2bRLvAt
 fFKALyVWJ5gThbTq5K6xBOZuBSg/4VJR7zOTgz0PZ7kXpqOkG64V3ZTRazoYASu1LhK6
 lNpFTXgS6U0eR49OpPZUyWd4hgwERpNhYFcnA7WBlboy2rOw0FBHniUVxWS3JJZhtZFN
 GSjUhiitf12uJN/iVfcSkSdrx2ukDhGzPS0PQ6AcOw/kG8DnTca+7mhEOezv8hmzcqBk
 jlTCX9OsdnvyOzt0N4JikzYrzOet78gqxj5u1UzSrO8m3IdX6wfIPCCN5zZbEffLeGH6
 3iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oAmHaChlHeq8uZJC1dsECbrC/qaM8LnULTn49QMEW04=;
 b=CQ2OQPoDpuW69oeRJCBK1xw5m2BPZTeN25Be17UAwUy+WTlLn169qvIAKUZtnIM8eI
 FPSOpYlRWx2DBRmEALmtAV8zLlU7fgjbySRqybDnHwlN1M7qrXDOkN3ir3dz+oXviXSm
 tPc2rRhm06P8Nv6XTMGCH23YcsJKgOtEIpjJHpVMX+d6nz4f//xWezBnQUIUTy8F/gAq
 tPVEx47VBF5rjthA9wIgYyPwqDtu74X5HwtGOrTEalUPtXDmnhLxw/YwT9sju4zLKSvk
 pDbIC4Ru1N9GeeFxf0khDK+vybKYywKE5BYHE7eet9yuEmdYYILncQNM2fQDduae5Mfy
 db2A==
X-Gm-Message-State: AOAM532T9/GtjvlWyjmPPddgWSU4JCSoSNiYm76VUwzi5jHe3wXDR7Ds
 WYY8YuptNa+qdARVPuHGo8UKn+F5Jji6Ug==
X-Google-Smtp-Source: ABdhPJytmjOgUy9ynvAduik6G0snhPRmmXsHUmnMQ9itwMHGBvJWk9xJ6WAX6+UxsE+QhNJnHEDGYA==
X-Received: by 2002:a5d:4d85:: with SMTP id b5mr16895604wru.317.1627905499532; 
 Mon, 02 Aug 2021 04:58:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/21] docs/devel/build-system.rst: Correct typo in example code
Date: Mon,  2 Aug 2021 12:57:59 +0100
Message-Id: <20210802115812.10731-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

One of the example meson.build fragments incorrectly quotes some
symbols as 'CONFIG_FOO`; the correct syntax here is 'CONFIG_FOO'.
(This isn't a rST formatting mistake because the example is displayed
literally; it's just the wrong kind of quote.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210726142338.31872-3-peter.maydell@linaro.org
---
 docs/devel/build-system.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index ee660a998d0..3baec158f22 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -235,11 +235,11 @@ Target-independent emulator sourcesets:
   symbol::
 
     # Some targets have CONFIG_ACPI, some don't, so this is not enough
-    softmmu_ss.add(when: 'CONFIG_ACPI`, if_true: files('acpi.c'),
+    softmmu_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi.c'),
                                         if_false: files('acpi-stub.c'))
 
     # This is required as well:
-    softmmu_ss.add(when: 'CONFIG_ALL`, if_true: files('acpi-stub.c'))
+    softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c'))
 
 Target-dependent emulator sourcesets:
   In the target-dependent set lives CPU emulation, some device emulation and
-- 
2.20.1


