Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F79D6C2429
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 22:57:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peNTd-0005ag-GV; Mon, 20 Mar 2023 17:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3U9YYZAYKCoo7w7865u22uzs.q204s08-rs9sz121u18.25u@flex--titusr.bounces.google.com>)
 id 1peNTb-0005Yi-Ng
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:55:35 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3U9YYZAYKCoo7w7865u22uzs.q204s08-rs9sz121u18.25u@flex--titusr.bounces.google.com>)
 id 1peNTY-0006Zk-Ss
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:55:35 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 n203-20020a25dad4000000b0091231592671so14189932ybf.1
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 14:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679349332;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xWDH8xZN+wbOnKloxA2ukLD5YDlW0BiAiiHOL9dZ6QI=;
 b=IsI+IWTHtG3KiKxROEb+V0Fi46zoOpg8bCq2CC0Pceg09BrjYOBfr+5X9u1bV8ndnn
 Ui8XjPPRkqkDJAGWivAtTxxY59MQJyMoBLmBd6D53zb5lR6Q4sZFJ/kS4A7V+Q4dMyNA
 ZCHUf2tlNv+Nqc24LqqLdLqXUbdoABupxfhuGCg+H6mB3ff3adLvlT65MRNpZ5Ese2lA
 6iBw5JGIi594DdhzxGVjt2A7J/rIn66Mge5h+uvY2fbuEzeR/pZZrCdsOJAqVWr3tHoM
 G3Few66YDpIpol0vGpJTnKwJ6rFIt0c0BIxz8TovZWW0K+0f0Yjk0WnjRDYwLi5yc5VE
 c19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679349332;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xWDH8xZN+wbOnKloxA2ukLD5YDlW0BiAiiHOL9dZ6QI=;
 b=i5WHL5m/Zbc/RSG90WzhQlDI1vD3l6ZL9f+wEtlkbvneUfn7cGJyj565Km4bw0CYzo
 /WlHLpxWm8RREkI573vLn8hdbcg34juMEfVpOoeTrx5QSK9Y18ugH5ZnufoU4+wwmh8y
 HRcl7TLC2kepNN2S6K5e3qbMcI0+crfCVn5mFl60mHIpvUYrMdj3t7/dEBCvuGtIiqSV
 zYxteuKip9yKa7LFehTrqsIOvLJgv34I+id5demMHdsUXydpwwoe/ylBZwZhKAEKM2vW
 ycnuln32P1NHqA71iNIjq2lCjpyhq2z9GwrZgl8f+ORsooEyXfRBLwfBNpGuP+FVHnwX
 Jy2w==
X-Gm-Message-State: AAQBX9eZ4oXVwAj8cmokluIXcO8GuVQ02VAa5pMgB/aRQufVFMqt52Tt
 CUY5GRLxg2035667Mu9tluljl0+gpVo=
X-Google-Smtp-Source: AKy350ZPUvUnfhRtsD+30fiS3kMUjPmJb2QrciN5mScylz2Jp6uWPwQ7UndWlFVP+zuZiFz8OqLtilKSteM=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a05:6902:2c3:b0:ad2:3839:f49 with SMTP id
 w3-20020a05690202c300b00ad238390f49mr905342ybh.5.1679349331993; Mon, 20 Mar
 2023 14:55:31 -0700 (PDT)
Date: Mon, 20 Mar 2023 21:54:59 +0000
In-Reply-To: <20230320215500.722960-1-titusr@google.com>
Mime-Version: 1.0
References: <20230320215500.722960-1-titusr@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230320215500.722960-6-titusr@google.com>
Subject: [PATCH v3 5/5] hw/arm: imply I2C_DEVICES on NPCM7xx
From: Titus Rwantare <titusr@google.com>
To: philmd@linaro.org, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3U9YYZAYKCoo7w7865u22uzs.q204s08-rs9sz121u18.25u@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b5aed4aff5..548c10d7fc 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -406,6 +406,7 @@ config XLNX_VERSAL
 
 config NPCM7XX
     bool
+    imply I2C_DEVICES
     select A9MPCORE
     select ADM1272
     select ARM_GIC
-- 
2.40.0.rc1.284.g88254d51c5-goog


