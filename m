Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F6E40FDFE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:37:52 +0200 (CEST)
Received: from localhost ([::1]:60282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGs3-0002Ym-Ka
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeP-0003Vr-PU
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:46 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeO-0005VG-B5
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:45 -0400
Received: by mail-wm1-x331.google.com with SMTP id y132so7791726wmc.1
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4j01yZVL1S/7C/x7Jm6reKhaa846Ap6IiDn68rRko7k=;
 b=jlN0/t9Ee94zIFJdroTcD6O8htohy82BM/DA8MulihfLTVUNBeln5C2DT8kTPYWNfD
 nIFYOU3pmaJi64rMPdaUwLUBbHtUsrFCs6p2/0EjIkcpHX74LVzBJ9yCsYKUr9ygU2ce
 kVQ5ezy6AQtYKL9iQwUoddE7Qqxt3uyfnuZwMzdiiDlOMupD0E2H+xYBSRd5i8LjaI0K
 yNnwBeX+VlldNFfUGVH3iMUoSvQHrXbMl8O+WHWACzxkBcuhZ2fGc4jdVqrPxz33JIkP
 z1C2AjeGNJvxLCs9Nefw4fr8s+i4N4VYog3h3CZi11n0a67BIGADFBfvpirAZuw21tDK
 YKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4j01yZVL1S/7C/x7Jm6reKhaa846Ap6IiDn68rRko7k=;
 b=T8raZtVrE2DAhvG6hfdcu69V/hSXI1ezreOAxJzupe4t1sk/wnTIVpIboHH7O+kvWW
 9WLlq8yWjL/Yxegivi6gG6fuPJTfaPGUJfPZpAfpsng6aBKRNhnnlThavOukfgXf5koi
 3mXScOfQZ0EdPvQz9A9hdDsvL5mfO4rVeZDl//6HB7IjwPc2vmUNtrrnwfCP30iu0B4I
 17VQgCblWou+4Fa43U1zXCiRm8bqadJBVJsRUI6o5aA3k2tZCpt50dx/MrfVk5B9S8JM
 VrrWSaZThFoGi4fAhVXBQko+x4dt2KSLDYq9nIpalffOvP2XaMrm4zYTWaMYlaI0F7BY
 XZyQ==
X-Gm-Message-State: AOAM531qDgppiKkOHAyFhOKbYxj7my1TdmnAP6KxhTUA1tu4xwpsr8PW
 OKO2G+MtApF0booVQJkNHNgKnQ==
X-Google-Smtp-Source: ABdhPJwDnjtxPg9xmjk+WH9E1fSiW8wmGA26zAesRPHJB/NZCdMNpORBwzzN6vrJizfqPuxC0lO2mw==
X-Received: by 2002:a1c:8b:: with SMTP id 133mr10430601wma.29.1631895822907;
 Fri, 17 Sep 2021 09:23:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c30sm7170571wrb.74.2021.09.17.09.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:23:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF9141FF9F;
 Fri, 17 Sep 2021 17:23:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/11] gitlab: skip the check-patch job on the upstream repo
Date: Fri, 17 Sep 2021 17:23:29 +0100
Message-Id: <20210917162332.3511179-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917162332.3511179-1-alex.bennee@linaro.org>
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The check-patch job is intended to be used by contributors or
subsystem maintainers to see if there are style mistakes. The
false positive rate is too high to be used in a gating scenario
so should not run it on the upstream repo ever.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210915125452.1704899-2-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/static_checks.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 96dbd9e310..902843f8b3 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -8,7 +8,7 @@ check-patch:
   variables:
     GIT_DEPTH: 1000
   rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
       when: never
     - when: on_success
       allow_failure: true
-- 
2.30.2


