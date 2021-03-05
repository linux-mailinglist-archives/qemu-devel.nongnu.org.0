Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35C632E4C2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:27:45 +0100 (CET)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6kK-0004zf-Ls
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:27:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gR-00017M-42
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:43 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gM-0004K4-58
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:42 -0500
Received: by mail-wm1-x32d.google.com with SMTP id m1so811142wml.2
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nqr4DpgZIAeEnBFTTz1bmXe9GvqU+b3OtGdJf4zXv2o=;
 b=TiPn3D6k1Zm+5wP8HcXoPrK70hZ3mZxAMAOlhdypzA5CnXN3u1BygtQOwc93Cd8JA8
 O6nSZ+yvGTOTVVb61nfRJ9N3LJlYL9o/es22lwYPj60HDr5BxU+N7rMHIiODmWBZzTUr
 NNHuAbwItuf7k9AjL/V5xkck4RVFG5az0bMLigkKN7wBAzSZSIO9BWaQMljaaZpRmxB4
 sA1XsrtI+4jiM8YLSlkP8k5KL5gtS7JMLGUrTzqrpOCfLpTVzTecswADRuf2QyQoF6+f
 S7ezCZFjsZBO4zHwZida0IQkTYg5xLtle119AJkO8M7gsRF8quyXDkLA+CI5xtp8cbcR
 eajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nqr4DpgZIAeEnBFTTz1bmXe9GvqU+b3OtGdJf4zXv2o=;
 b=DeA4pA1DciMT9FbmOEDTMxZFl/UfraTDENe+XkV497HQ7deN91imFvCSJkEFHj81yJ
 Uh0f818fzWm8q5gW0hYqVX/7bk48LliKRjaYPUUf3ckzFptj2JwJreK6q8+EdaAD8E4S
 v+0rWUuNn7r5Tb46ACLgavClyWJRrrYd7GurcQ8EzJH5xT7qSu/ScPRpR0mHcIBwpv+X
 DxLqC+0VSukW+m1oh1wfxMDou2gdf/Cvg6w7mXFtTqoGGXwLWo+vOwl1uh3jKy0Mv0ZJ
 PuCgxwk6wPnPP3xBUQoI1Pp0qiBeQvRsdBRRM/tUTn6Nm34N10wL8GB8cnKAxLK41mjV
 5E9A==
X-Gm-Message-State: AOAM530KJ6kau+YvgFU15P1mtqAvDeSx8m1Bxj9xUY+fc3TKkizF1oeY
 sxdGTwDkZOZ9zYwsX9Ki73JHlA==
X-Google-Smtp-Source: ABdhPJzzu4fCDbxk1IGMLEGv7kKL/HGe61dgm8TJ2XvT+BiRQ66sJWe6hg7rPlTmY01c9fTWodyIAA==
X-Received: by 2002:a1c:3b42:: with SMTP id i63mr8020979wma.124.1614936216342; 
 Fri, 05 Mar 2021 01:23:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a17sm3018964wmj.9.2021.03.05.01.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 01:23:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B47A1FF91;
 Fri,  5 Mar 2021 09:23:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 5/9] tests/tcg: Use Hexagon Docker image
Date: Fri,  5 Mar 2021 09:23:24 +0000
Message-Id: <20210305092328.31792-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305092328.31792-1-alex.bennee@linaro.org>
References: <20210305092328.31792-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Alessandro Di Federico <ale@rev.ng>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

[PMD: Split from 'Add Hexagon Docker image' patch]

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210228222314.304787-5-f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 36b8a73a54..f70fd7435d 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -124,6 +124,10 @@ for target in $target_list; do
       container_image=fedora-cris-cross
       container_cross_cc=cris-linux-gnu-gcc
       ;;
+    hexagon-*)
+      container_image=debian-hexagon-cross
+      container_cross_cc=hexagon-unknown-linux-musl-clang
+      ;;
     hppa-*)
       container_image=debian-hppa-cross
       container_cross_cc=hppa-linux-gnu-gcc
-- 
2.20.1


