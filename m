Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0EB379298
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:24:59 +0200 (CEST)
Received: from localhost ([::1]:36308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7mE-0002Yi-8w
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lg7kO-0008S0-9N
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:23:04 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lg7kM-0003gv-Rm
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:23:04 -0400
Received: by mail-ed1-x530.google.com with SMTP id l7so19190594edb.1
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nV2A80BQTfTwEkyPxurzDKl4dBiQvqh0sXB8LPx2INk=;
 b=KcHYJBpMCzpBr0iUK0LwgF7O+SXdCjc5yIs2PIMuMUH0wTfhW6TFugIcjS3YBUwD/J
 SU7aTlBd0Y9G+Xdf37NrSdV6kaaoyabtuVN2w0pGrFnky+ch0bmO0pHuTunGTl+Gz8at
 Xm/ySKIMnHGlvB/62BWIIXIIjA3kEPjaeI+/VWaPq2yFjWwVMHvSoMfVRwh45Ugj/JNT
 36wpofW016iX4P7Uym+9LxzEujzGwJ1KefEBwY8//Ht99hFUp8LsrDTNNn0aY+cDcDtQ
 TEmI0jIhFjwBqNYzNNgROgFo2Zg/d8036CY8gYcZc5xyV0lSoFtoW7qCiw4f5ATVcNHB
 YrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nV2A80BQTfTwEkyPxurzDKl4dBiQvqh0sXB8LPx2INk=;
 b=JFy2Cgg3WlcS+g8lnAIq90J+l1enraXbNIYZW2XMPK1oYUTLjYdrDdSO+EkXur1LbI
 45VVWhm3VoT6N91p0AHBgkwdoRenfHOZWpt/WlgdTJ+fDqigQwvV2isiNL0bnkzl/nD+
 QgMKIg9qYZeGL6+Nf/e64DDOBho3zTAzbjf3pVRwKnUsFubmEfvwf2AUjEAdAUc8ewxO
 vQN1nvPHvwk8VQ9rDHGc7nCrqOQOoihgOPbWanBZ6dvhop2pcH6J+NjE0Grk3/znjwCF
 gYH0BfGWprKA8lPXyd8vgg2vvUdDwJrgv01sIWVxYAO7eImuVTtfEFebcc52R7B0SAW2
 chTQ==
X-Gm-Message-State: AOAM5334wKm5g2R50ILUKfw85GFbxvBVxU5kg2NGi0j0mjgJ3XHpmZ/0
 JIVaeNRghbyeH6WXpNyQm28loPi9ylU7HA==
X-Google-Smtp-Source: ABdhPJwENATSAW06PwLWWOPNDWiRA+RMv9y7UIjJjEc2j442Njxc373AWcxpiDK5WMbLWY+UnxExyg==
X-Received: by 2002:a05:6402:694:: with SMTP id
 f20mr30315184edy.93.1620660181370; 
 Mon, 10 May 2021 08:23:01 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j1sm9289547ejv.40.2021.05.10.08.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:23:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] gitlab-ci: Extract &environment_variables template
Date: Mon, 10 May 2021 17:22:51 +0200
Message-Id: <20210510152254.2543047-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210510152254.2543047-1-f4bug@amsat.org>
References: <20210510152254.2543047-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to set the same environment variables to multiple jobs,
extract what we currently have as a template.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.yml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f01a1dbd7c9..598a8fb096f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -13,11 +13,14 @@ include:
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
 
+.environment_variables_template:
+  before_script:
+    - JOBS=$(expr $(nproc) + 1)
+
 .native_build_job_template:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  before_script:
-    - JOBS=$(expr $(nproc) + 1)
+  extends: .environment_variables_template
   script:
     - mkdir build
     - cd build
-- 
2.26.3


