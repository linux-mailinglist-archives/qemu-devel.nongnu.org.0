Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFE53C19CC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:28:46 +0200 (CEST)
Received: from localhost ([::1]:46980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZhV-0005O2-Vd
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPK-0003We-SZ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPJ-0004oa-1V
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso7514843wmh.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MIjB8baV6ul8gNmy4v7s1kUfD6hLb3gxxyQmdjTCbfU=;
 b=PwGYhN15viulcOdxF8wDYTya6NvR5mshUlQ93NPXg8AoRnHoiCk0bx+vqk9e1dU2XW
 msDHPl+0jXEAppHPz5C+VxHuGXys7j1wMBMfMWyVkKG6GeZrpcgtN3PRIWUKHSsP2OOz
 EAegSJs8o6G6GKlqc/KbnucajWWYdLmzNQNtyhgFigg1WXT1ms8yPlB1wOTXCZVEDXBG
 rq3XfvWAUEKf1dSxaEOHsY8EjDKB9WujhVkoZFgi2p/tryEO2tn+PvP0XLE+tvNApYVb
 pfsWNPG1k5HRQt0skKvivLPrfZXn9nDQ1xsDUjAI0X4ocvbe0I1Mb74zoPYYleLgAgy7
 7jNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MIjB8baV6ul8gNmy4v7s1kUfD6hLb3gxxyQmdjTCbfU=;
 b=hrMDwq5ZToKffxdXc4u5dfmVIOY1N/oijIirhBdA/MmuKE+R3J9ZbToKjUiBSerTjy
 TYCoJIKMSsFlM55FhF+V0Gi5DMJluCm8O5HFErz8ZfoXJfR/eOa9TwA+nEdvGvL8KOxq
 Kd6CE1IkF4HkShS8JdmMgUZ3v7P7d8j9u9fPBYhhqerzhTdekubx8H/iyAyeKvvH4HBl
 pZcbGFKJNzzTDjl+H00KzJoOrp0Zq1fPEuK+jM/I9EQ61fvBRGeeR/KYvxiOiSw3Q4eN
 AmA+YiqyhudbZ0nW/JmO54ew4LAIZPKxY/RbbEorGNu/xavLNULtHlc/gk8DJ94p7e3j
 OhYQ==
X-Gm-Message-State: AOAM532aqDwGdziJ1qeS0mipg7QxdNR1+w54l3/Y1njoJL+ctHauC9mF
 ZmGvc0oVpGy2ND3atNkbSGXqYg==
X-Google-Smtp-Source: ABdhPJxgZb29JfQfRgDZusYORdRbK58tdvez/f6S5xiKurCssH3/Cra2scA6qws+0yNq9Wh1JywetQ==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr6985955wmo.132.1625771395479; 
 Thu, 08 Jul 2021 12:09:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y3sm1943875wrh.16.2021.07.08.12.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:09:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0EB401FF99;
 Thu,  8 Jul 2021 20:09:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 10/39] tests/docker: don't use BUILDKIT in GitLab either
Date: Thu,  8 Jul 2021 20:09:12 +0100
Message-Id: <20210708190941.16980-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210623142245.307776-3-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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


