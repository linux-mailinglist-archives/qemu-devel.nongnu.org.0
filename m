Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 661A839BC59
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:56:18 +0200 (CEST)
Received: from localhost ([::1]:52334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCBF-0008RN-FH
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8X-0002jW-Ph
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:29 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:33369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8U-0008U6-2K
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:29 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 s70-20020a1ca9490000b02901a589651424so1270454wme.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HPoMc3YlkQAs9v+mSgnPrpvdiBylh/hj1ZQf5qMDtII=;
 b=NMhDWPfeWN5J/SlWK4FDgmYPV/9S5pRV9gLmvw8KG8Rj/VlzPof07KH9eW1jLslei/
 rbHdVH+Ulv7cCfMameePbEkdIsEkW1Uv3f4jp6PmFwJJL2V3jCfrd4QecRd2nrLXFOdz
 dHiKkvfTAvE4J20DM3S5jUVTaCHI/J/4qnudAYpHScoYPzZbf0jCmh3/ORLa6Sb9m/Fv
 2+rJE3ZaqGb0gT/wbUMkGT07i3lIR4MWzSDckRk2Xx1Yv0UIZ5jXQ5fUOlYl7UXYQ9/3
 0y1mgO9wnMyw70fph+ri00ZSEGumr+ncGttCw6R/eLnfIWbzz0hnn3aoasMQjPWMSRHk
 xJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HPoMc3YlkQAs9v+mSgnPrpvdiBylh/hj1ZQf5qMDtII=;
 b=gxurZErTpF4EzawYtVUT7QG56nYJOxBkIUPlEXHo64zVaEQPToMbhUoVXuVGHgCrDo
 fp5uF8PYB8wUu0+FDQHsd7G8SxxjrJgfWbVVs50SNObwsr6KTYt5cBNXssQF//A8UCiq
 9m+ENshsM+/J2JgNMMtkoxP8an6+5c8S+FMXD1/zWL81/8CMcC/c7tQH9tBAf4IT5njx
 dBZiLce5MH3fL9s6SNJfUY/HQXSuIY3okOnoAXa66FSDWjTFakOFfW4gchGncx3B2z3Z
 C4YuUJZK+MyR6jBvVOQjE3djhUGSfWq5rMk/g1CJb31NvoN88dNIQgDB+f8+Lf9NTb/N
 9MJg==
X-Gm-Message-State: AOAM532cQfolmfvUqqKKtErFpNAj9zWJE1LNK5US0o6TyaKhoUZB4WOm
 /JP8aDalnK0yUNlsp95VxEMTLA==
X-Google-Smtp-Source: ABdhPJyj00zuxJ9n1GfQWuRX+EFsgbDtB2/YnhlJWS4NYvLi0EQ++mu7xXI8VuLqonLMTME3+vBXBw==
X-Received: by 2002:a1c:6209:: with SMTP id w9mr4290273wmb.27.1622822004458;
 Fri, 04 Jun 2021 08:53:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm8563060wmb.1.2021.06.04.08.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3F6E1FF92;
 Fri,  4 Jun 2021 16:53:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 06/99] qtest/arm-cpu-features: Remove TCG fallback to KVM
 specific tests
Date: Fri,  4 Jun 2021 16:51:39 +0100
Message-Id: <20210604155312.15902-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
tests are now only being run if KVM is available. Drop the TCG
fallback.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505125806.1263441-7-philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 66300c3bc2..b1d406542f 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -21,7 +21,7 @@
 #define SVE_MAX_VQ 16
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
-#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
+#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
-- 
2.20.1


