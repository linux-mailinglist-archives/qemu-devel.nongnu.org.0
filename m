Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278E252E7F5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 10:45:49 +0200 (CEST)
Received: from localhost ([::1]:51308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nryGY-0004vD-VI
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 04:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nryAi-0002mD-3N
 for qemu-devel@nongnu.org; Fri, 20 May 2022 04:39:46 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nryAg-0008LV-EY
 for qemu-devel@nongnu.org; Fri, 20 May 2022 04:39:43 -0400
Received: by mail-pg1-x529.google.com with SMTP id a19so7172321pgw.6
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 01:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BM1kBrWq+bqE3NESx8j54Gj/7nlZoqCE0tR894m4XZo=;
 b=RB/4Ym/pY71msstsDqTtRbJwkGylTJ6is4Bh3nUD4jcWz/ro8rCt0XGAqvylEqtImo
 Ai4/YNO4piE89OS11p7p6QsqqLIt4bFZCt68f7tqKXVK9i69kqU6KZr8sWLPETDoMzlp
 IW/ZlDmdxtnVYS2XagRoExQOVvO4aSMwO4mPxPe6yqYYW8YQweaBmRxTCQpMUPq1v3DQ
 BNnqVJ/0zik5hu5wU/CVDGeBKs++XeQKqBXPM4DGHb5BH32d1fEwTGu1sNNVWfLR8fVI
 hknibW/effHMx1U51CT44dCAFa3pJYV3uyaoq+efHuz0FJVAId+6p4O5cV+Q0HxJ2TMx
 ihdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BM1kBrWq+bqE3NESx8j54Gj/7nlZoqCE0tR894m4XZo=;
 b=or29Sgzu6oqmbXEQpbcZI0+IuLobI+476GsVJ3T1osRKZVVE3gm9DbnbiJ5PNjDyvZ
 LES5dKfIXMvDZzl8s5r4/q9iClc5YhujnrIM5H2zXLGVaKRkw0c13M6zpUw9VdCZOBXI
 Sbm075q0jh/y1FYpJYtRw7Qe9uEWO+Z7FD0ptugq2g88fDggpeupCR3bQa3hJzWxYw4j
 ffPr0hKxb3Df0Owei4yYpVW1HBG6RMApFZyUYlvSqDGHNV2TxXBHtt4scSmZp816hhmZ
 2j/Svm2e3fI78AdTr+g2mAIqUsf6ObSqh5kHyM9JlKhyhByxbADRwKlEhRUOEoYj3PPi
 TmMQ==
X-Gm-Message-State: AOAM530Lk4q+QTDuHuBsMLJslYTzcYwUtjffCw+BTHd8JQ4rszAnc6Au
 AaO0Nn3okshqwnMbardwb5EAGPbKX7I=
X-Google-Smtp-Source: ABdhPJwU4YgKlC+l2bl+Rssj8E3jBVVXZwxmXXIf4OMJNx0fhZ6N9xhmwljH5sWZVPljs6GP+bdH2g==
X-Received: by 2002:a63:1c03:0:b0:3f2:75a7:b25c with SMTP id
 c3-20020a631c03000000b003f275a7b25cmr7316633pgc.463.1653035980585; 
 Fri, 20 May 2022 01:39:40 -0700 (PDT)
Received: from localhost.localdomain (p7443c068.hyognt01.ap.so-net.ne.jp.
 [116.67.192.104]) by smtp.gmail.com with ESMTPSA id
 a13-20020aa7864d000000b0051829b1595dsm1188111pfo.130.2022.05.20.01.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 01:39:40 -0700 (PDT)
From: Itaru Kitayama <itaru.kitayama@gmail.com>
X-Google-Original-From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: qemu-devel@nongnu.org
Cc: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Subject: [PATCH] Add A64FX CPU support to the sbsa-ref board.
Date: Fri, 20 May 2022 17:39:11 +0900
Message-Id: <20220520083911.401134-1-itaru.kitayama@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-pg1-x529.google.com
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

In target/arm/cpu64.c, CPU init function for A64FX is there, add this
CPU to the sbsa-ref board.

Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 4bb444684f..a7d27b2e55 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -146,6 +146,7 @@ static const char * const valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
     ARM_CPU_TYPE_NAME("cortex-a76"),
+    ARM_CPU_TYPE_NAME("a64fx"),
     ARM_CPU_TYPE_NAME("neoverse-n1"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
2.25.1


