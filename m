Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B02332E72
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:44:08 +0100 (CET)
Received: from localhost ([::1]:36170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhKx-0004hz-3B
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJf8U-0000r6-99
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:23:08 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:47002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJf8Q-0002xp-Pk
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:23:06 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a18so16778160wrc.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tBewBnTfMkgPBQhT3YpBMAvGkh7+L4IITUeQXmeYAZ0=;
 b=iF84CXsn7f4Tpu3Ot2d1w/sBDfj5oDgAlNTTKQz0Qr7EgfBJscXHvlmoFTEIiwxPyO
 CiVQXJxjXAN9b8VxL2zcsvoQ1lsYDkSCSbvl1QHY25UmiRGkHq81QuByZdwBdiG1Jy7O
 qpzA0VOEA5LVxwa8ycQIlo98DO72C/w02vQCMKorXIZp8b+CN6yq/VS523HWKkvun1b4
 a1UVPXT3emXlQE6SKliUzOnrpPn/9d2a/ZvOQoqig6xWBoi7q+m/lrncM3Jaz1HarMH4
 XJDC9eScNKwYM/23au6fyVvjrCz9dJDfWyzAYW962C1uMNR/Od27+MiO1m0ju/N4Jc4S
 j/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tBewBnTfMkgPBQhT3YpBMAvGkh7+L4IITUeQXmeYAZ0=;
 b=NQVm0DNTREonZ0wBnWg1umiI0W9kCIRwaRTebA34c2a/qdjoQaUQyj42Mg8PSE600K
 LTu16jPCgRIzFsjP4bVb0o50N3vDXmFyIlrQJbIwMyG1Ia5SvgDk/ZD0Qp5eprmDP61J
 bBum5rIVA5FlC9si3r86XBxQm4lTDXjhhlgyRvAYuscKNd4GYMoc5V+8gVtaFOH6iDGr
 6EJ5NXFvwUsNFop0wVvVOtNo2snOUKEUwGOpXNZlKS0w/diaVO12XXnjmsY7sxleRKc+
 VJ5oKAJTPckxOcVvRVxXNX5oXsjHC/+NFMxRUQa1c9ZhWdPuRf9g1jI6xBobY/w5r0UG
 1oOg==
X-Gm-Message-State: AOAM532KehV5RM5YXkCnO828TShWHjcV8v1I8fXQ9LZx4NOqyjlBMSfP
 QztPzyKvAlJVPSfV0Mb//OIr9PYVuqS0Ig==
X-Google-Smtp-Source: ABdhPJzvwzNXsBZksJiUiPxx9h1kf9tyjyKErsj0LGDpxYspEZ4lLse5c93mG5/WMprWNIB3s4Lu5w==
X-Received: by 2002:a5d:6945:: with SMTP id r5mr28570053wrw.367.1615306980690; 
 Tue, 09 Mar 2021 08:23:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r7sm25345030wre.25.2021.03.09.08.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:23:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] qemu-common.h: Update copyright string to 2021
Date: Tue,  9 Mar 2021 16:22:58 +0000
Message-Id: <20210309162258.28633-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the common copyright string that we use in
-version reports, About dialogs, etc, to 2021.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 654621444ec..73bcf763ed8 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -13,7 +13,7 @@
 #define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
 
 /* Copyright string for -version arguments, About dialogs, etc */
-#define QEMU_COPYRIGHT "Copyright (c) 2003-2020 " \
+#define QEMU_COPYRIGHT "Copyright (c) 2003-2021 " \
     "Fabrice Bellard and the QEMU Project developers"
 
 /* Bug reporting information for --help arguments, About dialogs, etc */
-- 
2.20.1


