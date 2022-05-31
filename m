Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2C0538C90
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:13:26 +0200 (CEST)
Received: from localhost ([::1]:47488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvx0H-00014y-2U
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linmq006@gmail.com>)
 id 1nvwwd-0007C0-3M; Tue, 31 May 2022 04:09:39 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <linmq006@gmail.com>)
 id 1nvwwX-00042L-K0; Tue, 31 May 2022 04:09:38 -0400
Received: by mail-pl1-x62d.google.com with SMTP id b5so12169091plx.10;
 Tue, 31 May 2022 01:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FCF6KghIDt9EGw/B8pqxiXLLOoIe30Ih2/8Txn0PfA4=;
 b=o20G3jEULT3SsjLuEbIIKsTVANMlm0qhUvgm58Zq6up40UQ73wrPy+W+saIYbQfEQT
 OSn6BdPyJK1vbyYplZGnuuCNTbYFrF+hxH0UI4w2hom7CpjdkdDP9h+sAnGRJWjpGdiw
 KEfZQB36Lz2mNKQNCvO5qhIO3ciYhh9vttbGG1BvYCdDTJaY74YvIYhhUqWow4yVRa0E
 V6K4pKO4bf6ivsHPgqHYBJVIkg7DJm7gDBjVHkP3DG6i2S55Td+WpFV1tUcw6whAcmYr
 ASLNMQ06xnCPKwgP6qUrBBHnULU29Inf7iAtHTc07nFCbZlRz+k4+P2cXRUIOlzmz6UV
 ilzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FCF6KghIDt9EGw/B8pqxiXLLOoIe30Ih2/8Txn0PfA4=;
 b=mNC2OdJ4xfnBnzhaiCCQk4rldil7yaKkwfugKitZeOxA6C3PS40xto9RBONPYs9qpb
 TQ2SsoWoY9FN13DwSDid2B6BPmEIDzlYO3USZahIiQOZqOR6MRG2treaJacJJD5eBcLD
 0sfSJXVDTQLtJXpYxAMoa+kpetixGSFGIyFsZAUgEjFiUU+F4JPZpLJsv3lVWJ96WPda
 21Oz5x60b2kRI8SdjjD1oU8taClBl0MV4/LnxjrQYUS+H7R9j0wWuEOBtcNvpyJJxH9k
 8JPoxmUICk6vCR3PVYN2vV3ViydevZnGCcrQxyQOVx3nSFLRoypmYbC67UsfPndmKKPm
 Ksig==
X-Gm-Message-State: AOAM5306d61UW1zJXY+H0Bv+zd1iVlXSVtJPCqW7K3+AC+/r2UNiQ8fC
 RWRGSH177yM/ArALHYr1Gz8=
X-Google-Smtp-Source: ABdhPJxqgHpZgNoNg0DL6U58rEJTOaVuzOd16RK2fOP28ZP6lOX+Qs/MQsF3MopNRAQKnRWVeBfAvg==
X-Received: by 2002:a17:902:f34c:b0:163:fa4f:2ff5 with SMTP id
 q12-20020a170902f34c00b00163fa4f2ff5mr4365633ple.174.1653984570653; 
 Tue, 31 May 2022 01:09:30 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 e1-20020aa798c1000000b0050dc76281b8sm10423926pfm.146.2022.05.31.01.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 01:09:30 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: linmq006@gmail.com
Subject: [PATCH] qtest/npcm7xx_pwm-test: Fix memory leak in mft_qom_set
Date: Tue, 31 May 2022 12:09:21 +0400
Message-Id: <20220531080921.4704-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=linmq006@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

g_strdup_printf() allocated memory for path, we should free it with
g_free() when no longer needed.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 tests/qtest/npcm7xx_pwm-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.c
index c4a5fdcacd79..e320a625c4b6 100644
--- a/tests/qtest/npcm7xx_pwm-test.c
+++ b/tests/qtest/npcm7xx_pwm-test.c
@@ -268,6 +268,9 @@ static void mft_qom_set(QTestState *qts, int index, const char *name,
             path, name, value);
     /* The qom set message returns successfully. */
     g_assert_true(qdict_haskey(response, "return"));
+
+    qobject_unref(response);
+    g_free(path);
 }
 
 static uint32_t get_pll(uint32_t con)
-- 
2.25.1


