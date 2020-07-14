Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDF421ED60
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 11:56:00 +0200 (CEST)
Received: from localhost ([::1]:35358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvHfL-000882-1Q
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 05:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvHcP-0003QK-W6
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 05:52:58 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jvHcO-0003x7-CW
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 05:52:57 -0400
Received: by mail-wm1-x32d.google.com with SMTP id w3so4417325wmi.4
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 02:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nLGL97rROnaKpdqPQWyvMY+ljMO7k5wyI/22+OUtb64=;
 b=GNX5au0Tkuw84VNUoSuRuStPXMs6wyxI01mUHNUAFw8dw8o+FM0pEx4ZYhjw6jktjW
 ICcnLfubwn0kIHZY90ONDs2v2smKsUMmZgv+bNKLaIjNESmIHNNNN++qQwLPTtFvAeBl
 8jNhuuPkjOhNfxpSjwqZe7apRVSvQ47bVEQ8xccttKsG10hVL7RKmCDLZQw64V6gNhZK
 q8ghLehNHyUMK1UqYVGSeQ9WihpK65Fd8jVtPwdq87PO6Qwbkm3XsyfWchwmEaDccegR
 Eki28Bwi77GNWKHSnvGR7lydb9INM5LxiqzTJ4fLhtx+3eEzGgysoU+X81iSagVF9tI6
 l5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nLGL97rROnaKpdqPQWyvMY+ljMO7k5wyI/22+OUtb64=;
 b=dzz25PwkVSFhsYc+YR/n/8zl+k0cEb3RmDufCayuGtKVCnMIcIVWrwBxAbyuk6/zzv
 LFlANbUz9XyBLaheWz6a+wXAyAiILPRpm13XdNDrVj2bqFD5LUVtNJ5PJ2vkdA+WMjTm
 wwxbAHiM7LvgJ6LTHGKT85bIatVesT2WzdFWMVSc9U3RaR+BxtesvSliA/FVyWg3wORX
 xEquKQTy4YwILCn37rY9PyfiWtxYSouGGSs5hcbUqnaddTNq9K5ZBAVO7Qhmxmy0A6xl
 roBTeUIGkgT9sw9cbkuraEaQkCvw4PQBcVgnVnLj1wX2bidZCEEwUVgDdkQUm9RQyBzD
 cGgw==
X-Gm-Message-State: AOAM531i8eM0t3kbIzAvso4+4tSeyLsmam/H7NvTTZMud6Mg4c0iYNhK
 YXi6wEDw5wpQ5Q14CxAuTcscVw==
X-Google-Smtp-Source: ABdhPJzT3V7NUmn+oehMjcjLtHpjhp0xvAeS3DjoiwzP+p8SEbLjbjOFylXhn7fAUD0tdLl8sHlbjA==
X-Received: by 2002:a7b:c09a:: with SMTP id r26mr3391769wmh.176.1594720374959; 
 Tue, 14 Jul 2020 02:52:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x1sm27330282wrp.10.2020.07.14.02.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 02:52:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A53A41FF90;
 Tue, 14 Jul 2020 10:52:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 4/9] docker.py: fix fetching of FROM layers
Date: Tue, 14 Jul 2020 10:52:42 +0100
Message-Id: <20200714095247.19573-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200714095247.19573-1-alex.bennee@linaro.org>
References: <20200714095247.19573-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This worked on a system that was already bootstrapped because the
stage 2 images already existed even if they wouldn't be used. What we
should have pulled down was the FROM line containers first because
building on gitlab doesn't have the advantage of using our build
system to build the pre-requisite bits.

We still pull the image we want to build just in case we can use the
cached data.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200713200415.26214-4-alex.bennee@linaro.org>

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 2d67bbd15a..c9f20d8d09 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -306,14 +306,18 @@ class Docker(object):
         checksum = _text_checksum(_dockerfile_preprocess(dockerfile))
 
         if registry is not None:
-            # see if we can fetch a cache copy, may fail...
-            pull_args = ["pull", "%s/%s" % (registry, tag)]
-            if self._do(pull_args, quiet=quiet) == 0:
+            sources = re.findall("FROM qemu\/(.*)", dockerfile)
+            # Fetch any cache layers we can, may fail
+            for s in sources:
+                pull_args = ["pull", "%s/qemu/%s" % (registry, s)]
+                if self._do(pull_args, quiet=quiet) != 0:
+                    registry = None
+                    break
+            # Make substitutions
+            if registry is not None:
                 dockerfile = dockerfile.replace("FROM qemu/",
                                                 "FROM %s/qemu/" %
                                                 (registry))
-            else:
-                registry = None
 
         tmp_df = tempfile.NamedTemporaryFile(mode="w+t",
                                              encoding='utf-8',
@@ -339,6 +343,8 @@ class Docker(object):
             build_args += ["--build-arg", "BUILDKIT_INLINE_CACHE=1"]
 
         if registry is not None:
+            pull_args = ["pull", "%s/%s" % (registry, tag)]
+            self._do(pull_args, quiet=quiet)
             cache = "%s/%s" % (registry, tag)
             build_args += ["--cache-from", cache]
         build_args += argv
-- 
2.20.1


