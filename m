Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBBB210D58
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 16:17:34 +0200 (CEST)
Received: from localhost ([::1]:49984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqdXg-0002K6-Vk
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 10:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqdKp-0004jp-KU
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 10:03:35 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqdKm-0006p0-VS
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 10:03:35 -0400
Received: by mail-wr1-x431.google.com with SMTP id b6so23958435wrs.11
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BKCckCRRRPz6gI/TExKS1YsAaVbiJZyRRuAn4UPdxe8=;
 b=Fm92SJucfe68NHY/3M2hicaZn+Phdb/ohWjkOKmRut7aahr7HfpO/uEmr+lmRaw1YN
 xherJkoHDLUmb1X7vAoKI+YBXrWysxkIUet8rQgTxPPQCZIYaLdh4RqZVMHb8ZqHL7av
 kYuhq8K0m6UV7HTDZRnonr3STBFBe7bFK2ofjclRy12co4hl3XTF8YSK8qxnAvHyAh9r
 MZJns7goIALIRC2WYAk8MwEk4IuygwjwOx7dIlzawT0kcTTk/ypq5tpVfczBN7HhI3DW
 IOHxoF+TVTHI7qt+ru8Ml8GvabAt2lCiglyJBzJCnBkxH9l3jcvYLMspC7kxdeqjsOMI
 Ny6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BKCckCRRRPz6gI/TExKS1YsAaVbiJZyRRuAn4UPdxe8=;
 b=R7ZOS3Vqur/M2Ho0kXLKIhONPwj23aGR/IkwwYZqJNfGfYRqTyw4U683neruQWy+qP
 u0uljzLVN54msGZf+ob6oaYW/0euNx8OgqkvK2Acx6PdauHreKxFT1eUov2UPSfnwHUs
 Ddm89Ax8Bt6eUTxc6GWXuIJ6x8kjmbGvWoiMezMdb7tEVJsoVoftWhj+FyF8yLuWnIJV
 I3811zEexnlYB8MV1T2lPKVJCFbynGPT88PQt19Q4KYn088rITIwugYtIOQv4qYO1O1L
 /DfQCPKlF3bnvHY55SAjz+VOcQ/I2psDqTnEuIKxEuBtFi7ikHAoruykQTkqbTe4l3GZ
 fttQ==
X-Gm-Message-State: AOAM530wKP1ANtA7ojTdW7PmtvvFt/45JODko5ZCGFErkmSqz7CpATjf
 RvfqvDCjUy6cpHoTRe4jgNahgA==
X-Google-Smtp-Source: ABdhPJzdh2cg7x6AwncTtTsf9EPn5Jk/Gn5Jf8Ly9n/STmY6JMQ2mshh+fdcly/5W1HRt8i3qqDouw==
X-Received: by 2002:a5d:44c7:: with SMTP id z7mr28853627wrr.226.1593612211517; 
 Wed, 01 Jul 2020 07:03:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d2sm7750124wrs.95.2020.07.01.07.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 07:03:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6CDEC1FFBC;
 Wed,  1 Jul 2020 14:56:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v4 35/40] gitlab: add avocado asset caching
Date: Wed,  1 Jul 2020 14:56:47 +0100
Message-Id: <20200701135652.1366-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200701135652.1366-1-alex.bennee@linaro.org>
References: <20200701135652.1366-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These can be quite big so lets cache them. I couldn't find any nots on
ccache in the gitlab docs so I've just ignored it for now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200622143204.12921-19-alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 257947853b7..13e9531724d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -8,6 +8,12 @@ stages:
   - build
   - test
 
+# We assume GitLab has it's own caching set up for RPM/APT repositories so we
+# just take care of avocado assets here.
+cache:
+  paths:
+    - $HOME/avocado/data/cache
+
 include:
   - local: '/.gitlab-ci.d/edk2.yml'
   - local: '/.gitlab-ci.d/opensbi.yml'
-- 
2.20.1


