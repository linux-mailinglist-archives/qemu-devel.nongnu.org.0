Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72DA3BBCD6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:27:56 +0200 (CEST)
Received: from localhost ([::1]:41498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Nhb-0002ma-Qf
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaT-0003h3-Tf
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:20:34 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaF-0001yK-Rb
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:20:33 -0400
Received: by mail-wm1-x32b.google.com with SMTP id g10so5440210wmh.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 05:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ivDqw6cb4tXEXKTbKqgdqyGHQY5fQsdGvOhlrmBitSE=;
 b=ODIFsi4lC/F0Y1pWfZ6Fm4H1HEjPqU7bzVpl9/mHRXS0cId3bCLWMv0asjIUbejywe
 hm34yPlAKbKnfDRli+74nNnQWW3C5hU/Hm/oE5EiztZah3q9XEIfSl9qbVI8ryaXgpjS
 KRqjNREO1K+RZYlmMVouHxFb4O+SBdGiZHp8teKDcHhX6QgXVkeoscsP3A1vuTTmPJNa
 FMcNkdEH2Qv1rDZxNrYGFeiN3GZy/lX0F8x0JHQWkkKfWI7WlLQlKsomrfkuGW0zmvHN
 yMpf0/koJeTnrsH9qy/jerIPxGITuNa0YqAVQul5C17cdGdoVbfYol33hsQF9q8mvsB5
 copQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ivDqw6cb4tXEXKTbKqgdqyGHQY5fQsdGvOhlrmBitSE=;
 b=AkElbkl4Jht5acJshVUbgj24Cs4/IJ9RnF5E9Ud3O84OS0xz4VyOaRdaFXNrcpGXUC
 NsM6R9HwWjVLVOitLA3P+NpmkdFyozkXYGXMbst4jRdi7bf0c1dYz01KdcCbEpcpNEdu
 6yd0SW/dz06Agzvs+TeN4H94nhXzdUSU2qlXR3h7VlLSLVRfG52oQprm4UHptsgo2RCV
 poDRBpkMqphh8KLSiqHg4e+6MAeehBozJey0gQbBIXc3HaBUC2UtMb4VuiwyYiLyBMmH
 3fX/5O9v7Q4fjfSQWkPBB1h/kVSeMxJr+9/WlZuEGGj51imOil0ViH4Hrzqtx24atGyi
 xLtw==
X-Gm-Message-State: AOAM5310iY8AWAYx695iHHR1lJB1C/Y176+N62jIkm/4PWrmW1l/Q6N0
 Q479lGDJaVGn0t1CNfqByB0uoA==
X-Google-Smtp-Source: ABdhPJwJW71U7GmyXxwL9rYN62ayEw1ywSqm89zbDKkLZ+df55bjRJfS/ocQSGm4SZYKf2x+SXEIAw==
X-Received: by 2002:a05:600c:4e94:: with SMTP id
 f20mr14551275wmq.172.1625487618634; 
 Mon, 05 Jul 2021 05:20:18 -0700 (PDT)
Received: from orth.archaic.org.uk ([81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f18sm13450406wru.53.2021.07.05.05.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 05:20:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] docs: Add skeletal documentation of cubieboard
Date: Mon,  5 Jul 2021 13:20:09 +0100
Message-Id: <20210705122011.753-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705122011.753-1-peter.maydell@linaro.org>
References: <20210705122011.753-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add skeletal documentation of the cubieboard machine.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/cubieboard.rst | 6 ++++++
 docs/system/target-arm.rst     | 1 +
 MAINTAINERS                    | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 docs/system/arm/cubieboard.rst

diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
new file mode 100644
index 00000000000..2be8a278633
--- /dev/null
+++ b/docs/system/arm/cubieboard.rst
@@ -0,0 +1,6 @@
+Cubietech Cubieboard (``cubieboard``)
+=====================================
+
+The ``cubieboard`` model emulates the Cubietech Cubieboard,
+which is a Cortex-A8 based single-board computer using
+the AllWinner A10 SoC.
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 13b3eeaf076..0a3ef309472 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -85,6 +85,7 @@ undocumented; you can get a complete list by running
    arm/aspeed
    arm/sabrelite
    arm/digic
+   arm/cubieboard
    arm/musicpal
    arm/gumstix
    arm/nrf
diff --git a/MAINTAINERS b/MAINTAINERS
index cb8f3ea2c2e..76a2c608d1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -559,6 +559,7 @@ S: Odd Fixes
 F: hw/*/allwinner*
 F: include/hw/*/allwinner*
 F: hw/arm/cubieboard.c
+F: docs/system/arm/cubieboard.rst
 
 Allwinner-h3
 M: Niek Linnenbank <nieklinnenbank@gmail.com>
-- 
2.20.1


