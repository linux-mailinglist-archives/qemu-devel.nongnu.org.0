Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517BF3CEB75
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 21:52:06 +0200 (CEST)
Received: from localhost ([::1]:46028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZJ7-0006ZM-Bo
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 15:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5ZHE-0004UE-3J
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:50:09 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5ZHC-0006cI-9Y
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:50:07 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l7so23420773wrv.7
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 12:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kbT9YM2qnDiYu1MefImT/Te/Zn63TyXdYA+A8VSke9c=;
 b=WXCDQa/ZxAxxs+dxnX2BjAqLqe3SMgQ9T7fuIyYGB6hl3Rnxv7M4tbBn/0zBKHlsUM
 0tmtd5SDDoDVU3thAd9xV3q6Gga0gO3itr3Wlg/fh3Y+0i6YFbye91GrXQfm9/YEOP5S
 kNtO2tI4eMPgdU/0ZCv92ggbSFH5b9HSDJsJsdmefCvE57fdltUQDf7tb9Y7yIvhScGF
 fMvcCa37whQjzX0s3FIgENJowPdOLgcFV3hpyK5rqym5niI5tJYoz4lCGtMjKOtILOH0
 tGDjQiFR/qJ1qMM7LB1y+MF+LSFCnRdXgDowLj3wkcXPoO1CJae4xYSPbeYOFOyDk8p4
 iw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kbT9YM2qnDiYu1MefImT/Te/Zn63TyXdYA+A8VSke9c=;
 b=RwWb9vzuDSJYc11ywtp+T4XrC/REzJRewBaW9Vciv+RSqweTwNi9M65X6uqXPbeFg0
 wh90+nIa99VRVhJAzIFb+iV6oFO+arQh9zS3Q/Ozhz/ohcwFL4jbMOomYDrLsBn5pQLB
 ZWfkXw/eATHMVcNJ1ICg4h/q7nH9/Lw+4vQVUZPc3v6RjZnACUBoNI3eyy3gCirs3ak4
 fGt2gPJSgQJIDCSpK0+s7dR0qXNEIzzzmr62V4/btDb9kCcgIs0J8Oaxfse6x1iTwyh4
 JVqPe0a9pRDuKbJb4UHspx25OvexEDtY7HflualLa3QHRK9vo5fpyhBX/THZGQwrhSJP
 fVWA==
X-Gm-Message-State: AOAM530FSeCBbjMMqLqdVmF33rksMHUJ/1MeQ1eocn+zUuQwMrK37kH/
 zHJVVEsxbecYIK8S+mr5Aaa5yg==
X-Google-Smtp-Source: ABdhPJwSwVG4ku6hbkJH5z4DRHxSQobgCED0saJR9YbAAbcUlJej5bCSj3m3c2YMNUVPun0cONsMnA==
X-Received: by 2002:adf:db43:: with SMTP id f3mr31996975wrj.143.1626724204397; 
 Mon, 19 Jul 2021 12:50:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q17sm15159207wrv.47.2021.07.19.12.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 12:50:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1FD9F1FF87;
 Mon, 19 Jul 2021 20:50:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 1/2] hw/tricore: fix inclusion of tricore_testboard
Date: Mon, 19 Jul 2021 20:50:01 +0100
Message-Id: <20210719195002.6753-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210719195002.6753-1-alex.bennee@linaro.org>
References: <20210719195002.6753-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We inadvertently added a symbol clash causing the build not to include
the testboard needed for check-tcg.

Fixes: f4063f9c31 ("meson: Introduce target-specific Kconfig")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configs/devices/tricore-softmmu/default.mak | 1 +
 hw/tricore/Kconfig                          | 3 +--
 hw/tricore/meson.build                      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/devices/tricore-softmmu/default.mak b/configs/devices/tricore-softmmu/default.mak
index 5cc91cebce..724cb85de7 100644
--- a/configs/devices/tricore-softmmu/default.mak
+++ b/configs/devices/tricore-softmmu/default.mak
@@ -1 +1,2 @@
+CONFIG_TRITEST=y
 CONFIG_TRIBOARD=y
diff --git a/hw/tricore/Kconfig b/hw/tricore/Kconfig
index 506e6183c1..a1b2438d99 100644
--- a/hw/tricore/Kconfig
+++ b/hw/tricore/Kconfig
@@ -1,9 +1,8 @@
-config TRICORE
+config TRITEST
     bool
 
 config TRIBOARD
     bool
-    select TRICORE
     select TC27X_SOC
 
 config TC27X_SOC
diff --git a/hw/tricore/meson.build b/hw/tricore/meson.build
index 47e36bb077..692a4708ba 100644
--- a/hw/tricore/meson.build
+++ b/hw/tricore/meson.build
@@ -1,6 +1,6 @@
 tricore_ss = ss.source_set()
-tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testboard.c'))
-tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testdevice.c'))
+tricore_ss.add(when: 'CONFIG_TRITEST', if_true: files('tricore_testboard.c'))
+tricore_ss.add(when: 'CONFIG_TRITEST', if_true: files('tricore_testdevice.c'))
 tricore_ss.add(when: 'CONFIG_TRIBOARD', if_true: files('triboard.c'))
 tricore_ss.add(when: 'CONFIG_TC27X_SOC', if_true: files('tc27x_soc.c'))
 
-- 
2.32.0.264.g75ae10bc75


