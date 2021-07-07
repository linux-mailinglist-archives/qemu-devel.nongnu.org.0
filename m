Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1FF3BE8B3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:22:08 +0200 (CEST)
Received: from localhost ([::1]:39686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17V9-00016R-AZ
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m17R5-0002RC-TV
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:17:55 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m17R3-0001fD-Lm
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:17:55 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u8so3007477wrq.8
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NsjJxzAwJTN+Nf0C8BwWRQ0vnncQxoq8OehJB1XJAx4=;
 b=XrFCw5HOGs8ATLMUtKnKPSdfd/RPHkCB2PQMKjk839BgffPOCMrijeYNag0h9pURTM
 1wVue3G95YqWV0BDE8c07DnthX22UaqJ79wM1WxeiTbmw8llYtBzqm9teeX+10h8hwZW
 W/7c8bRARnWO6FxHmTrxLV7+GAkiF1prupxY2rNmjquBgLmSTz89URgmxNCQ+BHoq63v
 UnOeu3EU+GaBvpG8jE3kdSngneki2maJWRlAkkA/RytKklWrDLup9e+GqwjCyYqerQLs
 7C3KriwYZAZhyiy/cnIcqb0uMyLTe1l4Vm7dhl9SF1bdpdNHcTV321cppUe2J1fzL/0J
 Z7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NsjJxzAwJTN+Nf0C8BwWRQ0vnncQxoq8OehJB1XJAx4=;
 b=rvw+odgxyevzoSxAbrazvjbrJ9CEr9aNAfWuvkAx+6vg8aurrRasf7dW5MGTTNKwvT
 a/He+hny+OkQ8xk0okmEmTFcbMHx2QgEU68Yz8NYO0I/WNnL2F28HJ6JGa9Bm3yk3F59
 /lURIfYKRc5PlScLyTpaGL+cNRSp0Vqr+A3x/4ikCkNaes1oxbIMZMZnPYC9dZGZjr1M
 W933qollxwE1M97lOaVeUF85cn59qbiAz3wQuYmpo0RNypkRnHBGAVa/jXwPa3grbNmL
 tBFp7k/28o9w04xxnGY13bPZoGOiqXqRsT2NflxS/+dO1u9W/5UgTD0oyg7PrQpyk64G
 5TDA==
X-Gm-Message-State: AOAM532Jj5lA/k1k2YuuREeW7TzVFxyXowxKHy7UrEXCbsIJI7v/aXlo
 Qhglmcmkfmni8n5FgRuC26suPA==
X-Google-Smtp-Source: ABdhPJwxrj3tPjdPK2O640dbN8WYrZJeLXeQEV+kMzeKggvOs5qV5A4ZTOu8IosHJvvetSRvtWmleQ==
X-Received: by 2002:adf:ce84:: with SMTP id r4mr15234391wrn.397.1625663872283; 
 Wed, 07 Jul 2021 06:17:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y66sm19419636wmy.39.2021.07.07.06.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 06:17:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C46321FF8F;
 Wed,  7 Jul 2021 14:17:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH  v2 3/5] hw/arm: move CONFIG_V7M out of default-devices
Date: Wed,  7 Jul 2021 14:17:42 +0100
Message-Id: <20210707131744.26027-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210707131744.26027-1-alex.bennee@linaro.org>
References: <20210707131744.26027-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We currently select CONFIG_V7M for a bunch of our m-profile devices.
The last sticking point is translate.c which cannot be compiled
without expecting v7m support. Express this dependency in Kconfig
rather than in default devices as a stepping stone to a fully
configurable translate.c.

While we are at it we also need to select ARM_COMPATIBLE_SEMIHOSTING
as that is implied for M profile machines.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210621152120.4465-4-alex.bennee@linaro.org>
---
 default-configs/devices/arm-softmmu.mak | 3 ---
 hw/arm/Kconfig                          | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 0500156a0c..4114aa9e35 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -1,8 +1,5 @@
 # Default configuration for arm-softmmu
 
-# TODO: ARM_V7M is currently always required - make this more flexible!
-CONFIG_ARM_V7M=y
-
 # CONFIG_PCI_DEVICES=n
 # CONFIG_TEST_DEVICES=n
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 528f71bb9d..062fe94b64 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -296,7 +296,10 @@ config ZYNQ
 
 config ARM_V7M
     bool
+    # currently v7M must be included in a TCG build due to translate.c
+    default y if TCG && (ARM || AARCH64)
     select PTIMER
+    select ARM_COMPATIBLE_SEMIHOSTING
 
 config ALLWINNER_A10
     bool
-- 
2.20.1


