Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EEE13AD92
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 16:25:08 +0100 (CET)
Received: from localhost ([::1]:41970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irO42-0006h0-Lp
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 10:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1irNpl-0005Ur-Tq
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 10:10:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1irNpk-0007i6-HA
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 10:10:21 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36059)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1irNpj-0007Zd-5x
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 10:10:19 -0500
Received: by mail-wr1-x441.google.com with SMTP id z3so12531195wru.3
 for <qemu-devel@nongnu.org>; Tue, 14 Jan 2020 07:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JbtXdfX5swqeAC9KUR1iSEagQ19S2uV9NFabci8QvJo=;
 b=xeSSSLHAaYDMNxShQEyr41CzxaTAsIBLo3YS5HxoGOhmEUYRJhlPC22e60/whtZSeI
 KaMpdeKavvGnU8Y7OBpNPSROdAKdIQr8r+mlv9dnfib34q/O937ha9iLW2ACR6kZiEhi
 V11FdT/yj5n8e9WFhWEhrql7L8Ey9WqGDCF8N3VowDaGyagwDRBKXnEMUGIKUbE0K+b1
 ogBWmXPmMdiDtNcJ0gkpNSqCPQw1oUQL/1/iKFbeHm3tWA9CwLfdwttzRSVU9JdZZg7D
 TBSiLhHRZbFdHW3KQ+8UrxnhfkTEIavD5ZEI1+ZWkEXEQFAIy4AqJDUon0mxKnoSmIOL
 /IfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JbtXdfX5swqeAC9KUR1iSEagQ19S2uV9NFabci8QvJo=;
 b=SpQ2OT+cQGwj9WDcJUkBfynhtVea316isi8+Xzzyi4Q7dGr4Dj9TI9tYMlyxGjNYXe
 K5xQdYa3uyL09PPey1sGbCOnA2We/pMfYc6NeSZZykUxOHtARR70Otmzcl5E1U4fBuOh
 jnhcTLfwjRcpp/XIVhjCrnYmLdR/4xaK5e3ZgDRP43kuyDVAmUJjq9BuNLPmETc8PiNN
 Pkgrg+MQHCs06i25K+conJqMoRIOIa1chucQuaj2Pic63YwZRQ2RHqbcjeDnvIfok7UX
 pajBuRIlHzTA+bxNMJzDAZF5DvHubX2J/Vb1ePODX4yAn7+ebuNOJOS4jbCa45lN1jJB
 yFZQ==
X-Gm-Message-State: APjAAAXzz3PoFb0GCvZHa5zdGdFOQrNSKPjxSgSOI9MEwCHE6QkpnvvR
 4w61CdGJqFENfykH+QlNSb2sUqBFLNg=
X-Google-Smtp-Source: APXvYqx4b+8I/+Na4RL55vm2z2GMFW3NR6x3tmQDBDKOozY9fJO4Ub3pDk+xhxt2JCtFdYFojccpmg==
X-Received: by 2002:adf:e641:: with SMTP id b1mr25603676wrn.34.1579014611004; 
 Tue, 14 Jan 2020 07:10:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t1sm19255221wma.43.2020.01.14.07.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 07:10:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 566F91FF9C;
 Tue, 14 Jan 2020 15:09:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/22] tests/tcg: add a configure compiler check for
 ARMv8.1 and SVE
Date: Tue, 14 Jan 2020 15:09:44 +0000
Message-Id: <20200114150953.27659-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200114150953.27659-1-alex.bennee@linaro.org>
References: <20200114150953.27659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will need this for some tests later. The docker images already
support it by default.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 210e68396f..e0d1fbb182 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -216,6 +216,20 @@ for target in $target_list; do
       echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
     fi
     echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
+
+    # Test for compiler features for optional tests. We only do this
+    # for cross compilers because ensuring the docker containers based
+    # compilers is a requirememt for adding a new test that needs a
+    # compiler feature.
+    case $target in
+        aarch64-*)
+            if do_compiler "$target_compiler" $target_compiler_cflags \
+               -march=armv8.1-a+sve -o $TMPE $TMPC; then
+                echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
+            fi
+        ;;
+    esac
+
     enabled_cross_compilers="$enabled_cross_compilers $target_compiler"
     got_cross_cc=yes
     break
-- 
2.20.1


