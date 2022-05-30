Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35055386B9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:23:13 +0200 (CEST)
Received: from localhost ([::1]:41508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvj6m-0004FU-Tn
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:23:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwI-0003rF-Uh
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:26 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nvhwF-0007BN-4Y
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:08:18 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t6so15296903wra.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yFMd59Snn9i/SI22nQsnQ//y31NfaU+pmwjMbQTtNXE=;
 b=EGFQ0feJozjvOC7bJ/cMYjwSO+Ixet8387ROzdv3e/jveHY8VOJAZkZEsOxjaNtq+e
 U49KQVc3ICUM3hmgdpuTzX1GuabUPGWnHvr1+AciDAUBD3RmQ1AbdGQ8KoxZdF3P0Mmk
 XUahGlK4eqddrJnuovconuqE7sb4ER7RkYAFdg7vHtqQaDs0UjbPoF1Fz+m8rRBlX6Mp
 eRGr+aiU6ZBbkeko9jbdPzviEnsRYOe6+agmlIUVvm6vptL5+Ow6E/HxzyfUDqWBGnBc
 FaaC9/jpN7Z3t9vyyZEHZceWysHKlf+6LRfzXbFkUl/iFV1EPCQiEfKnhGg+S8lfupjl
 Tmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yFMd59Snn9i/SI22nQsnQ//y31NfaU+pmwjMbQTtNXE=;
 b=7FMCkGljP4m4i138VSpUJ24gUEOkCV6a8ZmPOj/Opcmfi1/VO/79774Zc38NG9kiuU
 CL17X8rJxBIaVgBp1Lm/u6D/dyS8JbXks6gL3FTNTeX2gem72jrMh5QtwOiaqSmQK1JZ
 7Yc0PSFstYG/qQMw7wLtDwnCwI1ap+54yjKfsh9ArRT/IAtI6Su4gI17ditfBqjuY9C1
 Vyxv85TXl/OW0mKtu8xAY3nMvGF6EESoQVPk8iZ05km1sPegO2nSJcCj6KDID7kQ7G7u
 AARbAONzVJFH/ZcPGbz/jtrgXdPYG3tpbKu0XSQ0H7CA0V5cfyKdKY+cr9zYkMoTwMxS
 8fYQ==
X-Gm-Message-State: AOAM532ZlrDaGkaShJiFFgDLOLYJ3lYyv6E+XatqrPqip8k7+XgspR68
 eQsY6v+la8vBd8DaeGjUIpjls+hJ7J4g8g==
X-Google-Smtp-Source: ABdhPJwCyU7Y8odqFspPSijLmXSBYrXETeH/McaQkoV9DS7twreXI3g8++WcmsuT9DD0glEiKcxWqQ==
X-Received: by 2002:a05:6000:1d83:b0:20c:d508:f55a with SMTP id
 bk3-20020a0560001d8300b0020cd508f55amr46892214wrb.217.1653926891105; 
 Mon, 30 May 2022 09:08:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003974b95d897sm10232152wmb.37.2022.05.30.09.08.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 09:08:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 063/117] target/arm: Use TRANS_FEAT for do_clast_vector
Date: Mon, 30 May 2022 17:06:14 +0100
Message-Id: <20220530160708.726466-64-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530160708.726466-1-peter.maydell@linaro.org>
References: <20220530160708.726466-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220527181907.189259-61-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7c9deb267fa..51358667984 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2492,15 +2492,8 @@ static bool do_clast_vector(DisasContext *s, arg_rprr_esz *a, bool before)
     return true;
 }
 
-static bool trans_CLASTA_z(DisasContext *s, arg_rprr_esz *a)
-{
-    return do_clast_vector(s, a, false);
-}
-
-static bool trans_CLASTB_z(DisasContext *s, arg_rprr_esz *a)
-{
-    return do_clast_vector(s, a, true);
-}
+TRANS_FEAT(CLASTA_z, aa64_sve, do_clast_vector, a, false)
+TRANS_FEAT(CLASTB_z, aa64_sve, do_clast_vector, a, true)
 
 /* Compute CLAST for a scalar.  */
 static void do_clast_scalar(DisasContext *s, int esz, int pg, int rm,
-- 
2.25.1


