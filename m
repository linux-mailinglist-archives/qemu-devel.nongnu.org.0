Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EB34D06E9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:51:51 +0100 (CET)
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRISU-0007a9-Hr
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:51:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRILo-0001r4-Lc
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:44:57 -0500
Received: from [2a00:1450:4864:20::629] (port=45835
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRILm-0000lR-UU
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:44:56 -0500
Received: by mail-ej1-x629.google.com with SMTP id qa43so33922728ejc.12
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J5RlH1aPAeNLs2eT1p3Fp/sUrvv8+WG8rBzhKWTAWzY=;
 b=i/rLFxDCQfoPsB79eDbIoERlMFyNOAHOEm3lOhcwylEkSCgRwpvIzSvAGjJ9HS1AeK
 vAcC/8opf3HUXERTuLIJjUpeuF03pzh32upIFttUBNT00BmzQvqEWxPapS7OCXA1r0FN
 3b+Qtlj6ovdJwQJZuOKK/6kOVD2uMED1sscJoJkjTG/HAcd8/qtElZQF5iOt6wOYPlTF
 cnG7AExFzdgTvw9aOXZJnrBEMJsSQrgHcOeP4CrhcV435/GiMpj/jTVWHHHT65GNJhSL
 IZ8JcLuOVK5L6k01mNT7TZMHrhjc5i3g63JSgz7KLgnqSzkMLeHaCvisiGFdpqF2Lej0
 y3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J5RlH1aPAeNLs2eT1p3Fp/sUrvv8+WG8rBzhKWTAWzY=;
 b=SUIj1D+bs7z+Qv9zvQbCNruPkSyvVfp9qmdB+e3GWGwi9X6vTXb2NJ5Y8weQbrdQ+h
 HYYAWrlivthdGiATaBQHTdgt2Uhva8AdQH/AMUfn+83CZFZZl+qsoRpJW95kHKhr4cOj
 hs9+nP82hlmpaaLQ6tm7T23W53Sw4w4lsjvL5dgQq5w010Y3hyvxFfww5rhAcLPe6BTy
 zm620D0xYUep7Sw69ez6AudPaESZwK9zshdMx2Stgrjmrr+FGjKbm0A4Q2vtRTJl4j8p
 rVfHSez5G67iahtGZjtGIWuipJaqU9Xo8lxUO3wdIhsUqlXg5MIDZA1eHVNj9QVaxAsV
 fNJg==
X-Gm-Message-State: AOAM531kG6eaocDL2T1O+zuYvXkECZi4nG8XxIoIxPovmETHRCHHXVNM
 Ds+tAC9iKmcoo37twf0e7olmbw==
X-Google-Smtp-Source: ABdhPJyPAlCTOcZIBpInqj4e6I8leYcH5iH2pLluQbRp30nmaEJG6f1jtZB5GrF+omvwhp6QLyWI/Q==
X-Received: by 2002:a17:906:32cf:b0:6d5:83bc:e962 with SMTP id
 k15-20020a17090632cf00b006d583bce962mr10370509ejk.108.1646678693202; 
 Mon, 07 Mar 2022 10:44:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a056402060400b00415a1f9a4dasm6575931edv.91.2022.03.07.10.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:44:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C53A1FFB7;
 Mon,  7 Mar 2022 18:44:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] target/i386: for maximum rounding precision for fildll
Date: Mon,  7 Mar 2022 18:44:46 +0000
Message-Id: <20220307184446.3149199-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 incoming+7b48dc26643084f29a2bbb8c07f757b1@incoming.gitlab.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The instruction description says "It is loaded without rounding
errors." which implies we should have the widest rounding mode
possible.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/888
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index cdd8e9f947..d986fd5792 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -250,11 +250,15 @@ void helper_fildl_ST0(CPUX86State *env, int32_t val)
 void helper_fildll_ST0(CPUX86State *env, int64_t val)
 {
     int new_fpstt;
+    FloatX80RoundPrec old = get_floatx80_rounding_precision(&env->fp_status);
+    set_floatx80_rounding_precision(floatx80_precision_x, &env->fp_status);
 
     new_fpstt = (env->fpstt - 1) & 7;
     env->fpregs[new_fpstt].d = int64_to_floatx80(val, &env->fp_status);
     env->fpstt = new_fpstt;
     env->fptags[new_fpstt] = 0; /* validate stack entry */
+
+    set_floatx80_rounding_precision(old, &env->fp_status);
 }
 
 uint32_t helper_fsts_ST0(CPUX86State *env)
-- 
2.30.2


