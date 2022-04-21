Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83190509EF3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:49:49 +0200 (CEST)
Received: from localhost ([::1]:60380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVJk-0003tk-DI
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqR-0003Gm-QY
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:31 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqM-0003YY-9z
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:27 -0400
Received: by mail-wr1-x431.google.com with SMTP id g18so6191583wrb.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iC1dx7osygPCKxzESmzHpFu3XuxeglPRcqZ1T2HastM=;
 b=KO5f4YOle1iTvySe8e1oM8XoLsD3opyfMk7EHr9qLoXEljVzTy9UCGkrsm67mujFSE
 yFV3ubjfceRnCsm2Xh9B8zymzZHonJcizS144dnoSMjI1gp/sQC3IsKo83zzWHRm8K6i
 MueX/HLArfBIX3LRREDodrqrEyKRYtYn7tsGfGv1GTkPf32zo4xVR6Lwk0+Dm043FOW6
 DJW3jP1qUCSmJtvo2W3c1X1AQVkih8yAUiksLEiUYKnc+7cTgujnqFpSqa08O2pn5JXC
 DxxXymm/QBJd0V9lTHepTyTrLPWCzqmjKAH4C7uB71Eu7Sb/NSsthHLAIzgfJ8R9yDXH
 KhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iC1dx7osygPCKxzESmzHpFu3XuxeglPRcqZ1T2HastM=;
 b=cOCXQFyT06BSpmls5obUacojczcIyHw8W3Oi6uuEuKeBncKg7y4GJFShcgkXtHP+o3
 yTUt45v3kJt1y5vgmrI+N7/Vo6jS1gw3jqXPAs91RzliloqOwMrkaxVVKXdPKpSWEKqd
 iYk4gBayl1DpBYjHc5PfERcvJvg3xve4+ITIfKXwZy3T474B0C9z4qpQQQHqBdVAffkq
 39VTib0KaFJ1XYxt/mVvaAXh/u8TOdQYHNh9xERb7Gk0MgS5I5k5C5G8E+6V8TuimJ6h
 lhlREBWT9XTZcNOOY+j7YCVmqvAeFD2FEUSjmIQodAY1jqqfGOuA1zOGtGJTv4sylEdh
 mIFQ==
X-Gm-Message-State: AOAM532h31477bL3MO3+61lX5xToiAr819RsWIlytyJEEoERYXFRrGt1
 if65QoxxjW/yQ49Q+a3K1vcV4vZ94GKF3w==
X-Google-Smtp-Source: ABdhPJzMzgNdV+BiGH2etqFG4Tp8Yza2v38bu0+s0+OVITDvMkw/bjaXVYTfTV0yAZwjqzkbAy2sAQ==
X-Received: by 2002:a05:6000:2cb:b0:20a:88c4:ec9f with SMTP id
 o11-20020a05600002cb00b0020a88c4ec9fmr18060790wry.43.1650539956750; 
 Thu, 21 Apr 2022 04:19:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/31] hw/arm/virt: impact of gic-version on max CPUs
Date: Thu, 21 Apr 2022 12:18:44 +0100
Message-Id: <20220421111846.2011565-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Describe that the gic-version influences the maximum number of CPUs.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Message-id: 20220413231456.35811-1-heinrich.schuchardt@canonical.com
[PMM: minor punctuation tweaks]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/virt.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 1544632b674..1297dff5228 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -96,9 +96,9 @@ gic-version
   Valid values are:
 
   ``2``
-    GICv2
+    GICv2. Note that this limits the number of CPUs to 8.
   ``3``
-    GICv3
+    GICv3. This allows up to 512 CPUs.
   ``host``
     Use the same GIC version the host provides, when using KVM
   ``max``
-- 
2.25.1


