Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B66815BF159
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:38:10 +0200 (CEST)
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamob-0007Qz-Qi
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8x-0001Sf-SW; Tue, 20 Sep 2022 15:42:58 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:45924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8s-0001sE-6b; Tue, 20 Sep 2022 15:42:53 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 j17-20020a9d7f11000000b0065a20212349so2454393otq.12; 
 Tue, 20 Sep 2022 12:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=kaoxYwqVYMfX1J/FS5qVCcaBu8reM1m5FL76Ohk+ggw=;
 b=QAfdJZwSoRMCCiKwvjv61ipWz9YQaie8sRqhBWaMyxXKPm6uv5fnZEc1bCt8o0arTr
 OfQnExybzkOOs5kALCkshL0pNY62KSxu5bv1lWmhoZaFJ6V7nWegULaxuIjwL99YQako
 dKJSAs23O0/G2Ab6E/StGyfraVRk5AmwgnKbYmbiuRCpZ6rlpTl4qVeQgKOVCFHl2JII
 xysHkyYRD/cAiZQoCZbMXvGcfVpy+gKrMudckg0buqy2YOp8XsYleRWwqHOlb8IuP7+N
 m2UY0eTBg7K4kFhhxrsd0SwtY4VYPzAcBMc8k59+K6OPDUTPigwj11Af+dfaADlOGl9v
 cOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kaoxYwqVYMfX1J/FS5qVCcaBu8reM1m5FL76Ohk+ggw=;
 b=sZx53Tn9N0bTIaWjfHNTjNMeHphBkBa4J3np4pu1VBegc+djDI4+I/Iukfc47/pu3H
 qzWoP06Bx54m6j0wwlKLpESU9Lhk6zFz5B/kkS2Xog6gWjUGuIh2pnVvir/mYMvIZL6t
 1GUbip4ODT/mg1R2Ip++fH40rLXtKnILV8UdGzSth9hFhn4zZQ+Qe+VED+pU8XEqUZZn
 L6MDEByfOTPM0Tyu3i9VCnpaCTe39bbKd+0unKDeYRsrRqk7uSMJ9SwkOZ4/fywOdt6/
 VZ+ZPGWYwVCZuHpvkrIKZNw0IYXsDDg64zCNU5o1l24qXqCupjsCM28EFmypZOkHIdlM
 vnXQ==
X-Gm-Message-State: ACrzQf0q2xO92bsbF+ayuUZZQuBq0aY2DTPdlLgxuab73AOHTgFcUUKs
 TUR3mczogvgq1yauKdyGyTiuYcfMXRI=
X-Google-Smtp-Source: AMsMyM6j+c5UkgNtAqblpGe4s8NnMtK0J8cZR95DMGNAvvkQxJwwVbfThkrUa+Y+WRXW6uPevCyHvA==
X-Received: by 2002:a9d:2963:0:b0:65b:a27e:f536 with SMTP id
 d90-20020a9d2963000000b0065ba27ef536mr1497113otb.364.1663702962511; 
 Tue, 20 Sep 2022 12:42:42 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:42 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 12/17] target/ppc: Set OV32 when OV is set
Date: Tue, 20 Sep 2022 16:41:57 -0300
Message-Id: <20220920194202.82615-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

According to PowerISA: "OV32 is set whenever OV is implicitly set, and
is set to the same value that OV is defined to be set to in 32-bit
mode".

This patch changes helper_update_ov_legacy to set/clear ov32 when
applicable.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220906125523.38765-7-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/int_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index d905f07d02..696096100b 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -37,9 +37,9 @@
 static inline void helper_update_ov_legacy(CPUPPCState *env, int ov)
 {
     if (unlikely(ov)) {
-        env->so = env->ov = 1;
+        env->so = env->ov = env->ov32 = 1;
     } else {
-        env->ov = 0;
+        env->ov = env->ov32 = 0;
     }
 }
 
-- 
2.37.3


