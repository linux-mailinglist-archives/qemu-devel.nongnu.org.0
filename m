Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C546A4406
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:15:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5k-00066V-2Y; Mon, 27 Feb 2023 09:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5d-0005u1-IP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:02:57 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe5b-0007mb-Cy
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:02:52 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r7so6337359wrz.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OzWzaioajWSO5A1qlKtPG+UbJxPA3WTaVWjRJY3kTww=;
 b=skcorPZKIZCv01EVMQySJB0ARqk1y4xhHGoffVokrjDQZ0aYD9uJyeE+/nJEeGQbA8
 zxXu2RQZUXvoKu7FAHH8DMLRuRqczcyjACsno8feVybJGB0aJmfoKEBfdcV//vsLivZf
 pmhcBGnG9+HWdzXDKf9xmD8pIDGtnJomwk5BMRYgUQ0ZBrVYQLe29HrzKLrrvTN+9jQ6
 mSHsqAtgpy9PnMkRnH45Ec+BoZbhVpcQU+lXAjb+jDnIHNRhI6BcEI8HWxXv9UP4rYYI
 5xgW/9yAVrmRbdfEOSZ8ATVoctU5yyQAicqFvObX/wgwzXlfyo1tp+rVMAR30HgCjyfa
 Ke1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OzWzaioajWSO5A1qlKtPG+UbJxPA3WTaVWjRJY3kTww=;
 b=ODxFJOi9JCmqf6Z3IprI5dmzCFa3o7zy6FdFhGZwCBWNS0CQMPDcfH1x8O8e+gxAbu
 3Ae5iA9zIwluy5olF9/7ErlyfZbnxEP6cmkUnQFsVhhUZqDi2mjS3mzCXSA/hHZTHcHk
 TFma38HJq3kpSDwcWIjXCuPyKuvFtIpDsIx828aDm7PyYCUadlra77t7pd5fUnEMcSxN
 gndXdHX3dcSbGrMgvDb66PoWh6/cVyKFFLD9Qnvag4mcOemLFApwZ73eIw1HTh0Q5Mwm
 Qw3bfhHJUyD186yk7siuz+U0ocrHQBXjMGusTUlzVfUiR25rnvN/TPEJmCdmbVfLMyJJ
 bzXg==
X-Gm-Message-State: AO0yUKXdT8AL0mKfJa44mJ8QaAZo1Gd92PAF6PUbrWYIYe7GC0iPO5ij
 Bh5N2vhRytX6nPzC1NP8ClsoubddPw4TVGFr
X-Google-Smtp-Source: AK7set9nRVrhNGpsf6Gy6LbuiR+LjTN7Nuye9lseB4VQE53Xw8Cv+gx7x/Y6nJkVvNYmIFo/9qJLCg==
X-Received: by 2002:adf:f48d:0:b0:2c7:fc9:c51c with SMTP id
 l13-20020adff48d000000b002c70fc9c51cmr14502215wro.9.1677506569583; 
 Mon, 27 Feb 2023 06:02:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a05600c354e00b003e91b9a92c9sm9683708wmq.24.2023.02.27.06.02.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:02:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 016/126] target/ppc/kvm: Remove unused "sysbus.h" header
Date: Mon, 27 Feb 2023 15:00:23 +0100
Message-Id: <20230227140213.35084-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Nothing requires SysBus declarations here.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221217172907.8364-6-philmd@linaro.org>
---
 target/ppc/kvm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 7c25348b7b..78f6fc50cd 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -32,7 +32,6 @@
 #include "sysemu/device_tree.h"
 #include "mmu-hash64.h"
 
-#include "hw/sysbus.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_cpu_core.h"
 #include "hw/hw.h"
-- 
2.38.1


