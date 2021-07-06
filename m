Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAB93BD961
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:06:50 +0200 (CEST)
Received: from localhost ([::1]:41894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mev-0002Si-Ah
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mX9-0004sV-Vq
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mWz-00025P-CI
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:47 -0400
Received: by mail-wr1-x434.google.com with SMTP id f17so1840668wrt.6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MIjB8baV6ul8gNmy4v7s1kUfD6hLb3gxxyQmdjTCbfU=;
 b=q7ndubA4R6lUyedVGgXg6NdEBbsItZchYncSIqWcBN6/g7yDLTJwQyExgTuoqMSpzh
 i2gB3DdGptai5/STOHFAbiHo7DlOgV/pU35xyx5vjEI4aOIbT9mVPOpHWZGANTUpDpO1
 3P4QY0r7vcwfTmgeFSWGi4VxPJunarxcIkSxATE1UwPa+lALY+WwAKMGrxkVHDEYFcqf
 s9eB0iS/4c+kqa8gqtVEfwLZ2YHAvFZ+WaZTO6LvxMqiLYuMo+yLHTYFBsHSqTa/qI5k
 s3pNBBfgFfOx6T1u5/VMC7o74/ZVMpyxsVpAn6CvP8D7JwE/VZC9HBoosD8M7n6ZBHfm
 QULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MIjB8baV6ul8gNmy4v7s1kUfD6hLb3gxxyQmdjTCbfU=;
 b=V1Om+U7U+JgOX0jJwUrn+4nQyKBOo7G6/Eac3YEHBnATexkCBSKVWT7Flu0PKtftWD
 ZZzqPTRGvSj9HIHt8MlfvLmTaSuKLiQ4FlYvyubeqauEmmh3Qi9mm1mYdBp030eJ7r+B
 AJUN0XV7UcfwUKTUb1GUXQhlltN/yGKCFbC78z0g3IibdRwlBqfJoTaYMR6muwdOHzSO
 J0utTaAL5aeJMBltT/SuzemrpgEhd0qZWMkPh9NsnMjnFB2an9bgrshlcjQcDjWcDcAF
 sHcme7iej76sISLlUdux036pc2NXCrsmJwGaVa1c8Kg6WQ1ZYRTFtEE6LxoBz3Z+8ASA
 RoFA==
X-Gm-Message-State: AOAM530r7trV5CouOZ5HwVC1+JRpd6QGgINJcBPuMZwv5cRZATYVJ/G+
 w7sA3Wtl3tFN5U85DhNuSt6Prw==
X-Google-Smtp-Source: ABdhPJzPTsGBSnI0YSSE3JevZRCtcn+v6FK69k57jNgzTHVeaaJNkjbxAF+56YD527Rsc/a5tJb2JQ==
X-Received: by 2002:adf:b605:: with SMTP id f5mr22424323wre.419.1625583514364; 
 Tue, 06 Jul 2021 07:58:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y19sm3287863wmj.33.2021.07.06.07.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 07:58:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD6791FF99;
 Tue,  6 Jul 2021 15:58:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 10/39] tests/docker: don't use BUILDKIT in GitLab either
Date: Tue,  6 Jul 2021 15:57:48 +0100
Message-Id: <20210706145817.24109-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
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


