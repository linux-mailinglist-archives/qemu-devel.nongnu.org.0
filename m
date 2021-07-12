Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B2A3C5C2D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:30:34 +0200 (CEST)
Received: from localhost ([::1]:52304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2v4y-00076J-UJ
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1f-00047n-4C
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:07 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1d-0007vf-EL
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:06 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso11380095wmj.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vfMIiyHNfTwBacCZ/Z5kXuUc3K4JlBoxSMTzFBkGMIE=;
 b=U8kaS19zVZwGOyfBs4xSViFZJK4/UO5JjcrFwKvrE+iLdxpetjxf8DnkOBh6hUXcDm
 B8DwhwCJLr6DtiGqoceG71EN7wVI5HQ9BVwJ3pJ85YqCcvy2ZDZ+jJxKmeGc+yfX3q2B
 YfKeXfS9Yj4oE9n1r/H8OP9+U7XfNrS7C60ZnDVqy9hCd/U5w7v3MXi/27gXHMuLx7WD
 gmKx/pzpw30c4S1WBFkVmmZEC7qGdyEnyAPO4gX7EaNdbSGPGHJvEv8M6m/dktbAP3JK
 QrAFmUIHKQP0YzyRjTuNaxKZuPSEUNADaHeZJP/oILkQi+B2g5R2sq9L6Td5PqDqOOGs
 GaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vfMIiyHNfTwBacCZ/Z5kXuUc3K4JlBoxSMTzFBkGMIE=;
 b=cWsnqyt6wkXOex9HYdNhvr2FyI6It3Uxh9FDcKCGrTz4ksKKVn13eoPCn13F1iyvYU
 7bCf3bUW1tyaXPTibacOUs0nZk762UrysXzabLSectXsl0RbqvOPANcQLXpvHX9Dy64i
 5foFV2jrWjjkD6TjmBqmaCZh6y81Mp2OOHymvhIPE3FbBxKASY+Cmd1ASQa2o+wvQgYH
 TjFJle2E38j37lOdCvQOSvYtsNHWFlupuJvClUv497wXBAMQtktdIKB3gOL82wl412kT
 4H2t1BiQLwEvMrAxIA8SpCxOmiE9oNA5HrEOn+J2itr9bkdfLVeEZduPlvU4Qk4a96Fo
 luvg==
X-Gm-Message-State: AOAM530cB1Mq0/jivXhUIe/pYB8bp/nehCDsiWy7NEXCj9Txcmnt/IwW
 DVgD//gxxTp60tBpC51GeK9QLw==
X-Google-Smtp-Source: ABdhPJzoSke/WD25do16sbPPB1iMLhoT8BtuLEQkp7TpuufB1oCNhHleVIZUuC0dhJKTrVbGtRD2sw==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr2945735wma.185.1626092824194; 
 Mon, 12 Jul 2021 05:27:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o14sm8309852wrj.66.2021.07.12.05.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:27:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A96C1FF92;
 Mon, 12 Jul 2021 13:26:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/40] build: validate that system capstone works before using
 it
Date: Mon, 12 Jul 2021 13:26:19 +0100
Message-Id: <20210712122653.11354-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Some versions of capstone have shipped a broken pkg-config file which
puts the -I path without the trailing '/capstone' suffix. This breaks
the ability to "#include <capstone.h>". Upstream and most distros have
fixed this, but a few stragglers remain, notably FreeBSD.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210625172211.451010-2-berrange@redhat.com>
Message-Id: <20210709143005.1554-7-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index eb362ee5eb..cea8196e53 100644
--- a/meson.build
+++ b/meson.build
@@ -1644,6 +1644,19 @@ if capstone_opt in ['enabled', 'auto', 'system']
                         kwargs: static_kwargs, method: 'pkg-config',
                         required: capstone_opt == 'system' or
                                   capstone_opt == 'enabled' and not have_internal)
+
+  # Some versions of capstone have broken pkg-config file
+  # that reports a wrong -I path, causing the #include to
+  # fail later. If the system has such a broken version
+  # do not use it.
+  if capstone.found() and not cc.compiles('#include <capstone.h>',
+                                          dependencies: [capstone])
+    capstone = not_found
+    if capstone_opt == 'system'
+      error('system capstone requested, it does not appear to work')
+    endif
+  endif
+
   if capstone.found()
     capstone_opt = 'system'
   elif have_internal
-- 
2.20.1


