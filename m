Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B474F391F55
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:42:06 +0200 (CEST)
Received: from localhost ([::1]:52394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyTl-0005mO-Ga
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1llxnS-0002ia-Ct; Wed, 26 May 2021 13:58:22 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:38836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1llxnO-0006zt-12; Wed, 26 May 2021 13:58:22 -0400
Received: by mail-ed1-x52c.google.com with SMTP id o5so2590021edc.5;
 Wed, 26 May 2021 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6P47nwDyYtXSKtHDGnpN6mD0yBf3ZQehoCf7mlzEQWo=;
 b=kuLqa/g8R1bB/Z2QvBwUTrzR3b1H/fX4o+zz/W2idN7b30HH03NaIMUsqJcnBEl+6A
 mzJyykLO8WhLyDbW0NPByJ/mf1EsngEaVgEi37ViOpj/YSBMGA9J6z1A4K+zIhY7P8p1
 +fv1Vs1Q1Sv4IvklVeIs0c8MryTZzC1QLSXd8Ufgo9p233BVLTILxIBIlAYRluFp1T1s
 AHDmfh1SBeVZZwQ7lrCMoLz9tqbzInBkaWOil2XANwvWqxvdTuJE+xzUBLqW2Al83Zjn
 x8/Nm9k7q7sWuEWANr0M6LJQH4QWFG1TwtGBRpoPWwUPdBwZBOgyf0HxJm6iFvxZijjW
 3yNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6P47nwDyYtXSKtHDGnpN6mD0yBf3ZQehoCf7mlzEQWo=;
 b=nHnLBwbeJrJw6DzYsUGG82V4UFM9C8CGAynBmSoW1nkWIzldudY2HbHtt2D9LTLXns
 YPzTdVblouJXO6W5D5OF3rnz9q9cDsXLiPm/ie+j4e2vtNwrPtiv4z90PxqSo3vB5aKf
 Y4DqqUQanX+LBEvPF2ubebRa/eKLu4lXSDaTvgqn1gO6R+JAe1JAJdtvtDWqbpkzoALN
 YuO6kTFsMFQ7kskWXD2Gp6JtuKmhd8sVqPQiJzi+PwSVPr9yFdn6JAqmDdUQT74/5IAy
 1hxMR2WwGHSrBVc+QlGoE9Ysk+wQLcLsj4TRDklseUvSMcj2XRZKKmo3GazpciG+3G8j
 nveQ==
X-Gm-Message-State: AOAM532h04K9ogwAn1CGPb1/U2mdVBaYUcKtazbJjmHJ+rD6piorQ+z0
 jsIuHgL2axVbTB0nPje9aYA=
X-Google-Smtp-Source: ABdhPJx0KvfvKH6xvkKIEu3F++n/8StWX2kak4PlpZxJgNOT3GWj6IY4xxW1AISZrPbkT2ON0vhz8w==
X-Received: by 2002:a05:6402:14c2:: with SMTP id
 f2mr39945039edx.69.1622051896453; 
 Wed, 26 May 2021 10:58:16 -0700 (PDT)
Received: from neptune.lab ([81.200.23.112])
 by smtp.googlemail.com with ESMTPSA id hp1sm10407449ejc.96.2021.05.26.10.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:58:16 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Subject: [PATCH v9 3/6] [RISCV_PM] Print new PM CSRs in QEMU logs
Date: Wed, 26 May 2021 20:57:45 +0300
Message-Id: <20210526175749.25709-4-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210526175749.25709-1-space.monkey.delivers@gmail.com>
References: <20210526175749.25709-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x52c.google.com
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
Cc: baturo.alexey@gmail.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, Bin Meng <bin.meng@windriver.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 space.monkey.delivers@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 kupokupokupopo@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9841711e71..25e28e9b95 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -292,6 +292,31 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
         qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
     }
+    if (riscv_has_ext(env, RVJ)) {
+        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mmte    ", env->mmte);
+        switch (env->priv) {
+        case PRV_U:
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "upmbase ",
+                         env->upmbase);
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "upmmask ",
+                         env->upmmask);
+            break;
+        case PRV_S:
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "spmbase ",
+                         env->spmbase);
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "spmmask ",
+                         env->spmmask);
+            break;
+        case PRV_M:
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mpmbase ",
+                         env->mpmbase);
+            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mpmmask ",
+                         env->mpmmask);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
 #endif
 
     for (i = 0; i < 32; i++) {
-- 
2.20.1


