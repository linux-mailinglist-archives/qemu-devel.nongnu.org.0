Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AF03C5C8B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:44:00 +0200 (CEST)
Received: from localhost ([::1]:33958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vHz-00087h-NF
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1m-0004P5-Fm
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:19 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1k-0008C3-6g
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:14 -0400
Received: by mail-wr1-x429.google.com with SMTP id i94so25336811wri.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BvwbZLBR4hL0ldbCuEgl4dvAczyyqU5ZlfKEwgLnAm4=;
 b=N7uS/q+/7+1+BLnASQZmYRuLyrv8u+hLp8ZCQvwEFbRFl6qH1nSIJDkHvCRvf7K/iN
 wnq2QvMWCLHYvKcadepO1Y0VkyxLmAybTvujIBTDDC/vTT9Oy4Jc5X0tYRHNTNHXGL3O
 BFWIzfjqQ+Xx0h/59GYuHhfHki6Uun5PXrS9Sz5SmnluvGy6F4WABSKH//0E3ca0HBjv
 mF09q/5sjsqdpXUWyHEjgTIEgcF9QI423A5o7G32Bfe79VeXmNq79+Cdw/j81CK0ruEu
 Oi3pxMSytde0a9E0KIh1s7Qpgd4+ue7GOzJTDeFau4bG4KkVPPACQ6huMTS0D68NSK5j
 CuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BvwbZLBR4hL0ldbCuEgl4dvAczyyqU5ZlfKEwgLnAm4=;
 b=ARcDuOVMAGayu040WRCeEPHI5+rA/j862xI6wGtcy27VhhUfW6O3j0YfeTr3SAAiiP
 kCPCdcr2oajV9EzW6MbrG6xbmKrXm5dGxIdQ3OLJtJt4v/9MgeQtm8lxx6jmXDVORVE1
 3KqIlr6o+GkUrXD0bR0VWUGnX0WqDCiDkRrOEZiEDcUqZxtVj5Ejo4Q+b7vhlK2w341O
 hcjnOdS7U/R4+6PBPESERaD0uKks9dUtcRo9IrL6CtqboqSGWC9NT9w1Heiy9YGIJHEh
 3jtY00MCVtyLBCb6RpDyeoJ11Z+iUFqqKtErNeWKah3oU4HzK/rO/7QurrdkWZJc2GbI
 U2qA==
X-Gm-Message-State: AOAM531/dup1jnA9oYDtlun4nV/CRFxEvwK9CMnNmhZOppb2tn5xSNxl
 gNJbeQz1sPtCVsFIWDIlME1Keg==
X-Google-Smtp-Source: ABdhPJxKUusKSiO1MDYnQh4oBPLOtzzBBRb4U2mUDZzIisQSWYfDWuTY7FcRlCSWVfD/cWIhiNCjSw==
X-Received: by 2002:adf:f60a:: with SMTP id t10mr34154155wrp.127.1626092830808; 
 Mon, 12 Jul 2021 05:27:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j16sm14163649wrw.62.2021.07.12.05.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:27:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D31201FF99;
 Mon, 12 Jul 2021 13:26:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/40] tests/docker: don't use BUILDKIT in GitLab either
Date: Mon, 12 Jul 2021 13:26:23 +0100
Message-Id: <20210712122653.11354-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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


