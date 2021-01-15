Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1412F8697
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:23:19 +0100 (CET)
Received: from localhost ([::1]:45580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Vcs-0007xG-HE
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSK-000647-Aq
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:24 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0VSI-0008LA-O4
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:12:24 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a9so7037104wrt.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y0DR22hMXp9oKz60CvU6efbhqp4d7kzllxBIJtK8094=;
 b=DT7xskEi+hNdftkZVEAoYyboh5nCXyGCs9u2w43qJjHrD+WDJabsw/6qNVPbLlFWT3
 fR1bvq7jecuE/djvGbeE5bnqR+w+nz/BlfA2rTO6S1+bUrx9drlL+i26gaYwNWIVxhaD
 aZEutGci4ZFG6BKX7VcsrbrZ58LW8MQ7eBmpUmKHeaoc7JWyaVu4xO43M6Q3/UBsMM9Y
 F++J9Aoif36RmBTYs/TCRV+vspVR4oMWfnDhNVGNLgNnb15g/tMWscvdHgQU+Wu5k4OC
 b1ngdOx4hOuq/u3/7uXrm2/+cQA34AAb28BHVv2dhPriKW0L06KJc8sfvEDhlKHWfQCx
 WV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y0DR22hMXp9oKz60CvU6efbhqp4d7kzllxBIJtK8094=;
 b=iyIn6ZK6+4Yfw3lQ0bTtPfUMHkz+ijrxsX4Ej+h3xpzP2pV/tVScMmxW/jKt4CqK+K
 IIZROF8n6qOymUloRlsnLQiuGOMKSKJtnKbLNM77c8R2XbzJF+styNdIS3rLwfupEF+9
 UrG2+NJR3KiSjUNiKSnc7ssic3WhVndGa4pt9eZVV/ZW6ibJxpOGIm0A+qWh1uT3eAbH
 k0WBtZKC/b+sTOBCeGr+WF+V8qYUu5BlR7gGzgX1DspfiJizEAGli4IIh498+oy9haD4
 tV2p2EpDuwyaQDoruwOuhwSlrAu6ZT3M4LhW49lJhi3oAcyl0i2opmopsI0SiaoWrx2k
 F7xA==
X-Gm-Message-State: AOAM533pFhEJSzALNejndS4e49hw+tmuFTGW/B+4Q2A//qQbbfRbOaBm
 LvM18ubbg15e/YOHlwGreWml/MQipAknDA==
X-Google-Smtp-Source: ABdhPJycVJBkPkEUDfRI5ClNEKsu8uRDG+dTFJSke1zGzVU67NIv37/VLWlTuJMyMEBMASFp+2UKgA==
X-Received: by 2002:a5d:4987:: with SMTP id r7mr15100366wrq.352.1610741540960; 
 Fri, 15 Jan 2021 12:12:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b3sm10353807wrn.70.2021.01.15.12.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:12:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] hw/m68k/next-cube: Add missing header comment to
 next-cube.h
Date: Fri, 15 Jan 2021 20:12:06 +0000
Message-Id: <20210115201206.17347-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115201206.17347-1-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next-cube.h file is missing the usual copyright-and-license
header; add it (same as the next-cube.c one).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/m68k/next-cube.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/hw/m68k/next-cube.h b/include/hw/m68k/next-cube.h
index d38c52d540d..43577282d15 100644
--- a/include/hw/m68k/next-cube.h
+++ b/include/hw/m68k/next-cube.h
@@ -1,3 +1,13 @@
+/*
+ * NeXT Cube
+ *
+ * Copyright (c) 2011 Bryce Lanham
+ *
+ * This code is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published
+ * by the Free Software Foundation; either version 2 of the License,
+ * or (at your option) any later version.
+ */
 
 #ifndef NEXT_CUBE_H
 #define NEXT_CUBE_H
-- 
2.20.1


