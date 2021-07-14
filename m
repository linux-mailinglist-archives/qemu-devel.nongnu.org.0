Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597CA3C8722
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:13:35 +0200 (CEST)
Received: from localhost ([::1]:58556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gZq-0001VB-BD
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNk-0007Nb-04
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:01:04 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNf-0007aZ-TU
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:01:03 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso3614850wme.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BvwbZLBR4hL0ldbCuEgl4dvAczyyqU5ZlfKEwgLnAm4=;
 b=kLud9fgaNjIqCzYxw/YKz7k4UTxFK02hATw+0jUy+KMYFAWPuCFBGwyTx249Kz8TzA
 K5X2Mj+HQv/o+x/mwpR3AwXD/stqhhCavnxHndRNZXVcWeYpRj1FOPGNAUlQ905X9jTz
 MUVi+fxFv4+St0Q+eKvvq9W/tA2oj7lpTNy0EZSKT2bBY5TVE2TQ0UETSQLg9BEp9lH9
 zRNltqw1N/NQfLLX7Tfdd3v/g4vCPX60UyfTWawBZ+B4Dud6WJrnzK1q1vJMZCYY/DQN
 7JsI0fvYi9fu0hRax4exw9mvjhfzFICucqK27jwnDj8eiaSKeKcwyc+IZtlDp+EOglXY
 qw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BvwbZLBR4hL0ldbCuEgl4dvAczyyqU5ZlfKEwgLnAm4=;
 b=jaAN8HMyQX27MSPWrYlGfygY1SMsWIdHXjSG4Br7fxPvhDTfjpmNwEq2JXDpIwYs9T
 ATSJtGTUAiPwxI/o7ien2EXVD4yNp14vkHMRgNI/fjzT8wnMCMxbisGvv7/2W9lDgcNq
 MwbDQKd8z371QXTyr5BCoHZX75ucflrewxuD7aKXEM03m7m+dIXcgcAv/Ej3hrBAUZK7
 jjYgilgp6CxRrkqlSvJQq6EZfP4GtJX5RYs/91Z7DTGwgmYtt0vOOX5rImxmYyN9d011
 XdXJaTZZxxj/gQWdR/++GnCmqUCu51fi3ANPAkCxyDXBKWBPhAimeqkjuLFQWQEyE/4X
 YhRQ==
X-Gm-Message-State: AOAM533YU0h+L8n4srUmqoERU+Eb5ANcYRMNuEAsMXl6NxzLs6czPMWN
 YlPOxyGHBK179y9QemZ0iU25YA==
X-Google-Smtp-Source: ABdhPJzKQ/NUQTf2OJELbvvM6FftYvEZcAPm2J4r+p9wpE+vKwesMixEI3yMm15UiIMrHapyPOoIkA==
X-Received: by 2002:a05:600c:1c07:: with SMTP id
 j7mr1423448wms.165.1626274858257; 
 Wed, 14 Jul 2021 08:00:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z7sm2851465wrt.47.2021.07.14.08.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:00:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 05D041FF9B;
 Wed, 14 Jul 2021 16:00:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 12/44] tests/docker: don't use BUILDKIT in GitLab either
Date: Wed, 14 Jul 2021 16:00:04 +0100
Message-Id: <20210714150036.21060-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Using BUILDKIT breaks with certain container registries such as CentOS,
with docker build reporting an error such as

  failed to solve with frontend dockerfile.v0:
  failed to build LLB: failed to load cache key:
  unexpected status code
  https://registry.centos.org/v2/centos/manifests/7:
  403 Forbidden

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210623142245.307776-3-berrange@redhat.com>
Message-Id: <20210709143005.1554-11-alex.bennee@linaro.org>

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 4d9bb7c7ed..78dd13171e 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -228,7 +228,9 @@ class Docker(object):
     def __init__(self):
         self._command = _guess_engine_command()
 
-        if "docker" in self._command and "TRAVIS" not in os.environ:
+        if ("docker" in self._command and
+            "TRAVIS" not in os.environ and
+            "GITLAB_CI" not in os.environ):
             os.environ["DOCKER_BUILDKIT"] = "1"
             self._buildkit = True
         else:
-- 
2.20.1


