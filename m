Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3126A3C261A
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:39:20 +0200 (CEST)
Received: from localhost ([::1]:58294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rex-0007hr-7A
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWK-0004jU-1B
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:24 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWF-0005YU-UB
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:23 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 k31-20020a05600c1c9fb029021727d66d33so4919951wms.0
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MIjB8baV6ul8gNmy4v7s1kUfD6hLb3gxxyQmdjTCbfU=;
 b=nJbTNK5h1kZIV4U+6fCTspiBwgtdy4dCLpaytp+G8/y/udiUGTA+cOa3SHK9TzAg+x
 l9RRcEWpY/zOvChCvr0xyYQCVuowxwP09Sm3tfc6wqDDK8IFzT3f6lFtICvYgEVHiYHs
 cHo/waZHc4PQXFatIXhsHhwXip6aG1pQTCG1R29qI0WsNgAL8RSwyWI/GhzKmGKnMzyQ
 v1oZ98dGTtXiW5MZF/o6LnzidRIIuE1PynNlNWnVqzi9NTIrd18gUD5qg/Ne8pHT2/we
 x7zeVYDOqOhCHMODyzfWwuj8CqmZY4iNR90DejtUyUAmuML6hSmHnW4Kq4RvUb60ogvd
 B3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MIjB8baV6ul8gNmy4v7s1kUfD6hLb3gxxyQmdjTCbfU=;
 b=gkhUOcgBajIUDDBizUC6TK6CBSPQmJglayUBxM66g854+qXN1ie9NwxKiWXxXOszxd
 duNYnr0hWPPPaHBob2ZxF08RJbDVYQCq6lnsq+xOp6pYE4azGe2ObkvhE5/HDQXV7JO1
 A8Y7yQLLiWjuS9/37TyWM729Im201HmHzMjXuH5SH2ztVv3QLVV5slq67l3vn6TElB9c
 zsl0yM/kfuCeSY4vkVeQr+i5YiMBF5vFwbJ7poACRFACY02e0FnVwdBGbLPp9xWUV+wP
 f/2e0usqohRvg+EC0WQ2Sya3Mbm7D4CPovuubRYgYq9EhVUml2hUVGehaHKdv3zq6n63
 cYpg==
X-Gm-Message-State: AOAM530+7rlN/rAvNgaoYIhUUcJBrK57BdWZ/CH01yMXKVhOf3a3+oU7
 QC89VXeoyIh819FWv6+Vt/Dd+w==
X-Google-Smtp-Source: ABdhPJxd/O2nvY6dW8zhKFQjAZyp3FM6eGTlzV0q39fa18hgpK3e9qxusP2YPtaKgeJz9Ez9OIVttA==
X-Received: by 2002:a1c:4d10:: with SMTP id o16mr39870566wmh.160.1625841018629; 
 Fri, 09 Jul 2021 07:30:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z13sm5681457wro.79.2021.07.09.07.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 20DB51FF98;
 Fri,  9 Jul 2021 15:30:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 10/40] tests/docker: don't use BUILDKIT in GitLab either
Date: Fri,  9 Jul 2021 15:29:35 +0100
Message-Id: <20210709143005.1554-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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


