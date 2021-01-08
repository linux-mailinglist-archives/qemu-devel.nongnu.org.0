Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F702EFB5C
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:51:23 +0100 (CET)
Received: from localhost ([::1]:42586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0bJ-0004Eg-VE
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TM-0005eY-47
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:08 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TK-0003EE-I6
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:07 -0500
Received: by mail-wm1-x334.google.com with SMTP id 3so9670228wmg.4
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RZcG7+X6/Kxoa0KtyXeoehYrR6t8Wi5tVIiJ0qA8vVo=;
 b=PVewVqq+3A/Xnhil1O+X51F8GYFqylAhfLKeWFt28PoHqMQ2yfSRn0SxW2kP4p6y1w
 JV983Rz5yTeRxRQ3ND4VxqtLbfzeqA8rNlEiKjNxjMCHVyzs//6FFi3g89ErpODUjGal
 VgUqK/pKHC3Xo4tO9OCmU2I3M5tZfVfwS5mmcqrwIlmR3U0DdoPjpFqJqbDRC9QZwsLF
 ZRVq8MssuAAv9xW2+ThcH3d2eI5XVnmuDUvbTh0A2y7TXwZpLQcBBqsnruRPjnx5wwPt
 iyxbWobLs9Lc+MPUVdnSblE6ibyg3LPjb+VAo1Gc2ppIaE6XXggHAmic8V0hiwe1ke5C
 /VlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RZcG7+X6/Kxoa0KtyXeoehYrR6t8Wi5tVIiJ0qA8vVo=;
 b=P2F+8QKIaam8CyisFnSXehS8M+tyN/hp5cxP+LjufYTrzUnBOCBrjkFNQs4FQAPvF7
 S2iTtF4hnU8QryKJP7qihUq21cd7H37MW3wpeZPU/eFAssi/DU5tClU4kd+Ta/74IRIo
 nuEjGVMuryJRI4YkhnTd5MfEny4d1FaYFGL/CuRrl2Py8rBib1z/0u8JiQI2W0ncTYjx
 Eoo6HQzK/EFgOH8uumgmP6Wo56eSecdHQe1V+YT39q9peNVpRRkNmG52v0eY4YNVcvht
 R01EKiIoXsX4TolwmlVkKS4qCU4Sm3Wou95VqgEJRZpALcaz2vkJ54V9LvGDNEyvgWJq
 sDVA==
X-Gm-Message-State: AOAM531b3I9lwT3Z8Lt0ocjzdd5eFB+mxtXHZXpCps77drRsFtiBJr3m
 VYvoPegzYbRa1vMnKnwvEVJwSw==
X-Google-Smtp-Source: ABdhPJySgoEZhtq18dJQ7+T3Q/WErdC3sTt0C71BTtgz3a3vL2QdsR9KnHvJHMHTLqMcdEHHxbHGMw==
X-Received: by 2002:a1c:2c83:: with SMTP id s125mr4861306wms.161.1610145785260; 
 Fri, 08 Jan 2021 14:43:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r20sm13044045wmh.15.2021.01.08.14.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:43:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 405AE1FF90;
 Fri,  8 Jan 2021 22:42:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/20] Revert "tests/tcg/multiarch/Makefile.target: Disable
 run-gdbstub-sha1 test"
Date: Fri,  8 Jan 2021 22:42:40 +0000
Message-Id: <20210108224256.2321-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108224256.2321-1-alex.bennee@linaro.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We won't attempt to run the test now it's gated on a newer version of
gdb.

This reverts commit a930cadd83b4681a98ce72abf530a791ee2e42a6.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201218112707.28348-4-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/Makefile.target | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 230eb9a95e..cb49cc9ccb 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -54,9 +54,7 @@ run-gdbstub-sha1: sha1
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/sha1.py, \
 	"basic gdbstub support")
 
-# Disable this for now -- it provokes a gdb internal-error on
-# Ubuntu gdb 8.1.1-0ubuntu1.
-# EXTRA_RUNS += run-gdbstub-sha1
+EXTRA_RUNS += run-gdbstub-sha1
 endif
 
 
-- 
2.20.1


