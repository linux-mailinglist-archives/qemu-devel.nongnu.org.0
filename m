Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE8B39BE94
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:24:18 +0200 (CEST)
Received: from localhost ([::1]:33916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDYP-00015i-PP
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkv-0000Fj-Bp
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:09 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkh-0002DX-U1
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:09 -0400
Received: by mail-wm1-x32f.google.com with SMTP id h3so5739613wmq.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LPmHXyzWsrCuMzUxwCKFj0W0fSkTFbn/I48VNDyaKbw=;
 b=Hp5Um09J0bXhrMEoUkbEEzJATqdnAgYzcIYwuG/zu5QbZYX5AU48t5a+Icee38RnVH
 XHtBQwqixuvqTyK5SsGCb6C+pxCTluBaYwTHut1bFGBXDLJhzj3EHJfyKwYxe3hC5OA/
 H3oitPRdFDyW7nEAu+HkD2XpphTkwjoZ4UwOOIjm1w1pysPEMNSP03txpzJ9v9p8dVcx
 GjaRdehBX7m8wX+lGJqFLwtggfbkbI/EDonV77D4jbzHCD5KdjHHXPwzlZymmx0+fENo
 A/s7YiMTeatI00xvZ/k05to6gjLh6fbGP6YnJD4dsjQafIgCBTIdShBc1CwrF1wlwKzv
 bEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LPmHXyzWsrCuMzUxwCKFj0W0fSkTFbn/I48VNDyaKbw=;
 b=nO9IukVspBBxKGAoqUb8CvE6kOX/LJ623jIo502T29i34SsH2M4aabnrBWZrxze2n0
 MO/Dtzg1bKhTyxvqs9yINRtEFUASuLGXoHpEanThLyA4Co8ArHQ0agSAgJVuNswTx1Mk
 16T4vEfimnEHnMVeaNCgd9AM/wYF1GOgIgMFw9GswV8e2jFzA0Jq9mwdVhpAvCGFnEK/
 f4YVONG8JqJfGQdU8D+5m9vWTlzDfvmb42HzZs4xxPy/Qf2wRIHQFg4Nyhg1+asZqkUg
 mey0L4UuPH3pa+91qSJt8BKzMVh6o1MAEfTVi6mYHlhiydgORarQervzoHUZfGgkDwTp
 7FDA==
X-Gm-Message-State: AOAM533XiQkpcpLoeIHIikOJL8vUdivU26V76oduL+8pKus5mS6gjxfK
 v3eKu+vZ3590gnbmR1enl2nwgQ==
X-Google-Smtp-Source: ABdhPJzQWRpTiuOlBVh1aivSVmUKFvbq7GGemfUc34ENzVSb5lrFsMruDvCRetmkD9bWn7D4ZjhdIQ==
X-Received: by 2002:a1c:e409:: with SMTP id b9mr4350498wmh.63.1622824374142;
 Fri, 04 Jun 2021 09:32:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w8sm7616636wre.70.2021.06.04.09.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B876F1FFC7;
 Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 48/99] target/arm: remove now useless ifndef from
 fp_exception_el
Date: Fri,  4 Jun 2021 16:52:21 +0100
Message-Id: <20210604155312.15902-49-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

after moving the code of fp_exception_el to a sysemu-only module,
we can remove the #ifndef CONFIG_USER_ONLY.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sysemu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 128616d90d..0d80a0161c 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -417,7 +417,6 @@ int sve_exception_el(CPUARMState *env, int el)
  */
 int fp_exception_el(CPUARMState *env, int cur_el)
 {
-#ifndef CONFIG_USER_ONLY
     /*
      * CPACR and the CPTR registers don't exist before v6, so FP is
      * always accessible
@@ -507,6 +506,5 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         /* Trap all FP ops to EL3 */
         return 3;
     }
-#endif
     return 0;
 }
-- 
2.20.1


