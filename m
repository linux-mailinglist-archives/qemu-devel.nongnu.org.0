Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5413639DEEA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:37:00 +0200 (CEST)
Received: from localhost ([::1]:48162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqGN9-0002kM-A6
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJY-00034n-Ar
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:16 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJV-0000MV-Po
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:16 -0400
Received: by mail-wm1-x331.google.com with SMTP id l9so1195320wms.1
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 07:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GJX41Cyp71VELU0zs8YHXUqZWa3i/WmdvaiSBLJrNCQ=;
 b=lsCQqQCwYTJxhMMG8WZOdCLRUQJDfmB349azkSXqqbYLwz9o+pO9gn6pENWNS/864r
 T20G6XiTRUqLJlMt6Qt3Lf8PYY3GoiUYVZ1Rpgt0eEfJVJgpDwPXKR0sclrXNEVwd8mA
 7aD59+JFvpwpV1KV7rspnWL39dwR3sx7mdMyrBe0V58ny2wcG7PNiTHoHgOp51kMuvoF
 jyz8xtA5Q0XGNLHonx65c2HInA9zGRXTAZsFWiwUnpae8EqmVwHYiVLAPECZOFBo6aLg
 nfP7RKUnTk2t86Fa4y+6FefxcwuyJiaRweJlD9BS3DL+Lou08yBsfP1FLwKPsH8uOyu/
 15kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GJX41Cyp71VELU0zs8YHXUqZWa3i/WmdvaiSBLJrNCQ=;
 b=CW2pKR2E+tNEZtqvbn9tCFzf2fY/Rxb/vVci283atz1oXVjv6gx9ferEmUASMRCJPR
 zCqj/qPGCTICgtIlCXTVTjfFD+loDTFQ0lIF8MQl9NEFJCF77opyCd1DCanLCHYv0D+G
 qXjybuVqXRS6qN1CcRa/Uu2nspiCqikDoN9umtlq+r5IBkLwjNTHDxAZdon7/Iwfn5O5
 fbdXSzO0hvHmSRyz8jYCdzf0pIEfDrmwD3wNh8fVBk64V+4/lI15wRckVh+zuKM8T2/a
 cyD+ND0VQaVvu14BqzA28QvuYAZ/wNneZAFMP+11mfp2Bt/UoEbK/ss2aH8q+vDFilok
 v1lw==
X-Gm-Message-State: AOAM532HPyeCtvb+3UGcdPKr58S4jxaDUfCep9XxAL/w+TqfCujQjUHY
 5O32i69xC6F5bRKWSIqIq3Lqlg==
X-Google-Smtp-Source: ABdhPJyvfh4wC8CNVHCZAevOF+FjE8iJ6mPmMUd5x1NzZ21rEkOesKLTfnBe0bYfVdQ5o37A6Nlxtw==
X-Received: by 2002:a05:600c:4ba1:: with SMTP id
 e33mr11571343wmp.39.1623076392428; 
 Mon, 07 Jun 2021 07:33:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m23sm20745072wml.27.2021.06.07.07.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 07:33:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A5731FF91;
 Mon,  7 Jun 2021 15:33:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 5/8] gitlab: work harder to avoid false positives in checkpatch
Date: Mon,  7 Jun 2021 15:33:00 +0100
Message-Id: <20210607143303.28572-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607143303.28572-1-alex.bennee@linaro.org>
References: <20210607143303.28572-1-alex.bennee@linaro.org>
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This copies the behaviour of patchew's configuration to make the diff
algorithm generate a minimal diff.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210602153247.27651-1-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 8e30872164..7e685c6a65 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -3,7 +3,11 @@ check-patch:
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
   needs:
     job: amd64-centos8-container
-  script: .gitlab-ci.d/check-patch.py
+  script:
+    - git config --local diff.renamelimit 0
+    - git config --local diff.renames True
+    - git config --local diff.algorithm histogram
+    - .gitlab-ci.d/check-patch.py
   variables:
     GIT_DEPTH: 1000
   rules:
-- 
2.20.1


