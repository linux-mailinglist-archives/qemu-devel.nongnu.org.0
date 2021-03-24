Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6514E347B36
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:55:27 +0100 (CET)
Received: from localhost ([::1]:59098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4us-0002Cg-5U
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4f9-0000Qw-B9
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:11 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4f6-0003S0-2t
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:11 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x7so2238954wrw.10
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J/FXnYHxF99XSKiPCq/PPY58O6zMCmVG8ygc3pMoNMc=;
 b=ONsd0TYm5Q/iPi/E6G86ZwK4lJ0zTyF/Oui0hG/tl7350t03aUrAGV8LEp1qAiKgK2
 gmZ+HHehEdRKZN6egBZ/slCbnAF/sGlRSTis0JrsnD9p2g1pSF3QXEqKO51aEmSGL2u+
 //qCoAxdOQRQMxFDzl9KlUw+7XV6AmiuTbTD/h/lM0oYXMfFvip5/NwuaYCIukbOm3ts
 Nmmirl2jpCtcDVCWqU1+ZrDJkvoQ6rVY/YJWkySLuSaU1lnaPFp4caLd2TRMJeL6JLXY
 1+VA7S0awbIvHi8ippbwIhThcTSxXym3eqkH6EyDTs6qAeHR4t5uV5MXs/LbANtX2kSg
 LhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J/FXnYHxF99XSKiPCq/PPY58O6zMCmVG8ygc3pMoNMc=;
 b=UYPsYGXyld927FgO1o3JhR+W25bQWZE3KWaZV1YuI1Hl2a3BB8nSd12JggKXOS+v7I
 5W1QNc71ZBzrXK8WA8GIg+7okyX7LnV/ssS14fiz0WCD+/ynx/Vs6uBKggSPJNrox2k3
 5g9vAgyXlKqYH8S1HixoiUuICWLA+VnzyW28TjEEMkll4/EJoPJf+VwttoHB9V48oQ38
 TrlHH2v+6CmYQn9rdUcefBJz02HDYWYLlusXwDycYA2aYi6HdfRzX0BWRWJzfKJUI0nW
 iPGdQ/kZFxpPRjfoTIgiU/nQ8EHtnIgmZtgHEh2lDrQuwR1lfqOsOQS+UK9XovZxw/O8
 gpLw==
X-Gm-Message-State: AOAM530TtG6hxJB3oyUIw1cSqvNG3R0DmULGveU1jXW+o+/0wc9AAgri
 8Y4d+FM6/WH1Ae2aKiI0qhc05Q==
X-Google-Smtp-Source: ABdhPJziTbSSnyXpka6lP+gcR6WDtpJAZFqymZQAf0X0KiJR+UHHfiCrLl5sJ5WbvHp+7Vqd9rn1bg==
X-Received: by 2002:a5d:550b:: with SMTP id b11mr3899577wrv.313.1616596746593; 
 Wed, 24 Mar 2021 07:39:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r11sm3470853wrm.26.2021.03.24.07.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:39:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2680F1FF9E;
 Wed, 24 Mar 2021 14:30:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/22] gitlab: extend timeouts for CFI builds
Date: Wed, 24 Mar 2021 14:30:14 +0000
Message-Id: <20210324143021.8560-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These builds are running very close to the default build limit and as
they are already pared down the only other option is to extend the
timeout a little to give some breathing room.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210323165308.15244-16-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f746d5fbea..9ffbaa7ffb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -502,6 +502,7 @@ build-cfi-aarch64:
       --enable-safe-stack --enable-slirp=git
     TARGETS: aarch64-softmmu
     MAKE_CHECK_ARGS: check-build
+  timeout: 70m
   artifacts:
     expire_in: 2 days
     paths:
@@ -538,6 +539,7 @@ build-cfi-ppc64-s390x:
       --enable-safe-stack --enable-slirp=git
     TARGETS: ppc64-softmmu s390x-softmmu
     MAKE_CHECK_ARGS: check-build
+  timeout: 70m
   artifacts:
     expire_in: 2 days
     paths:
@@ -574,6 +576,7 @@ build-cfi-x86_64:
       --enable-safe-stack --enable-slirp=git
     TARGETS: x86_64-softmmu
     MAKE_CHECK_ARGS: check-build
+  timeout: 70m
   artifacts:
     expire_in: 2 days
     paths:
-- 
2.20.1


