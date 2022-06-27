Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DB555B91F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:25:58 +0200 (CEST)
Received: from localhost ([::1]:57374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5lwL-0005Hb-Tr
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltF-0002Fo-Cp
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:45 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltB-0004rd-Qj
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:44 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v14so12340152wra.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EOVXgkGRtIpIGzJkFF4/6zpJoNS3CC73Hky3UMqCS5s=;
 b=FwVFcRrXy3p4zKvB6Ev4hnglI3w6Ldi4RJaKtatZ83oXHyJakWfOaLu96jqIZc4LJH
 t+b8v+bhSuVtE61XWN3g1VCdXDCj+0/IpZKEE40/m/DKyTMFygJCRqtacbd1CZgCbE/2
 8w6FWqoodA7m7cx3+a4jaXN7Tcefv2oxXm2BcA7+Dl33MELo8X1bSEu4FIYYZ3RFsr5V
 XbD2HyQ4wK72cLHh14WykL0sM2lxeYLW9NLsDDOC+E0XZa/4qK9NR3362hpSH3XORKIj
 usaxkfJGrz5vMyqmUbEcGfYstYNbFSf8UDRB2i9K1liRQ46Kk0iCWmyZV0QCYEb7OcTZ
 GNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EOVXgkGRtIpIGzJkFF4/6zpJoNS3CC73Hky3UMqCS5s=;
 b=jPrqmxpKC8J8WwtxfNMel/LDiN5zLTgxxMP/1XZtr+21UkahfuleBrYogpQp5g2NPS
 1jNRugGxYTL3v7BrxX2uXnMtsOvZ1yZCjqTPaPvrV5GPfNujqX455X0mzQTU4lp4oLaO
 Zitdu6G/BQa60uyi+/1OEnmXlxmtdR46q7yamUt+sRbNMau08T4LTfubLBPf0OToOeAI
 XxckWkRlR2Q+N7V0JRLSVMynB3njxqPJ4LrC+Npu/Z/DT7n8CfzkGnsWUcvPdzsVhtrZ
 pzXq84cr4fqAnfU9cXjWcNn4kpEM+teaSq5KVIW+HGt+PepwD4itq9KdocTIKFvgkM2J
 CvHg==
X-Gm-Message-State: AJIora9XhNVQB+tc/jtUretd8NQhc0h/8FHU5T/agvsdUmPXB6/evkX4
 7gDSV1i/pT1iNKBnRIMNUp+y3X2PnahvNQ==
X-Google-Smtp-Source: AGRyM1tPjmXO9M7DjX1DAOA22ec56KWmClDbiN4fFD6UBqCCQZhfkzidCPhV7MK6qkzA9GqqptsrFg==
X-Received: by 2002:a5d:584d:0:b0:21b:a3a2:d67c with SMTP id
 i13-20020a5d584d000000b0021ba3a2d67cmr10861641wrf.149.1656325360030; 
 Mon, 27 Jun 2022 03:22:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/25] accel: Introduce current_accel_name()
Date: Mon, 27 Jun 2022 11:22:13 +0100
Message-Id: <20220627102236.3097629-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Alexander Graf <agraf@csgraf.de>

We need to fetch the name of the current accelerator in flexible error
messages more going forward. Let's create a helper that gives it to us
without casting in the target code.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620192242.70573-1-agraf@csgraf.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/accel.h | 1 +
 accel/accel-common.c | 8 ++++++++
 softmmu/vl.c         | 3 +--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index 4f4c283f6fc..be56da1b999 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -68,6 +68,7 @@ typedef struct AccelClass {
 
 AccelClass *accel_find(const char *opt_name);
 AccelState *current_accel(void);
+const char *current_accel_name(void);
 
 void accel_init_interfaces(AccelClass *ac);
 
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 7b8ec7e0f72..50035bda55d 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -49,6 +49,14 @@ AccelClass *accel_find(const char *opt_name)
     return ac;
 }
 
+/* Return the name of the current accelerator */
+const char *current_accel_name(void)
+{
+    AccelClass *ac = ACCEL_GET_CLASS(current_accel());
+
+    return ac->name;
+}
+
 static void accel_init_cpu_int_aux(ObjectClass *klass, void *opaque)
 {
     CPUClass *cc = CPU_CLASS(klass);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 54e920ada1a..3dca5936c76 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2271,8 +2271,7 @@ static void configure_accelerators(const char *progname)
     }
 
     if (init_failed && !qtest_chrdev) {
-        AccelClass *ac = ACCEL_GET_CLASS(current_accel());
-        error_report("falling back to %s", ac->name);
+        error_report("falling back to %s", current_accel_name());
     }
 
     if (icount_enabled() && !tcg_enabled()) {
-- 
2.25.1


