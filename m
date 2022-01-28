Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6883549FD17
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:49:08 +0100 (CET)
Received: from localhost ([::1]:53952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTUp-0000qz-Hm
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:49:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD5-0002Aa-P5
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:52 -0500
Received: from [2a00:1450:4864:20::331] (port=41512
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTCz-0006JV-FR
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:43 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so4325123wme.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3TqR2zgm5S4ywZbptgY4U9W2XiKosnPZusX/itqpoIY=;
 b=Olw57ZRiRQdO8Tvj8LMFrF3HWkLtQ6NqAhPhjMhlCefMCatx/HUixnW14N7Cvev0ny
 3Zyh5ZnkQ6awXyL2wJ5yRp5oqFItQSRl5BLCl6kFoObC0x6Qc2i3h+bNqD2bMycC4t4j
 fwl60xdsGzVCikrLmwxgn+zmem7KtGBBMpbBcj6ONj6iu7GsmkkgivQZ/2HiAqxWiM55
 iXI3dQHVwPvzwuWD3UpNXd2uDfEZ0ewkhLttXboYCTS2BBjO73DAU03er1Uu+0MrPWKx
 UUFOMd4NPb3IJeh+3FyaGkp/E98dMeLCdPGM9pb/NjqxT11D/dlRhS2n01bIBhcTLUSO
 6mnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3TqR2zgm5S4ywZbptgY4U9W2XiKosnPZusX/itqpoIY=;
 b=b/uoSFsHpbjJroN/v4aS+NXHtwsOvWYYVfFoq71yg5m4Asd7OrxiqrExsGFXlsoKLZ
 cSXT5Q/OiaC1VQtWhBkdGTWWnkqTNKZQi6NrKnxNadpDALTuaBcQ8ell85syXdXdlON7
 V5gc77xOR5llCP7srjHWO2rSFLDGLMKCFKDS2maicPD0KCGKhp+0e2cHcBOjz9UiRizc
 a3DAVS6MK2/jtt77pyAbq2zdd1qo1bABN2YH+Jfc3UhkNpUcjRqh5MDgFkniw8i6/ect
 7RnqOBUVZN+Rf20vJIkYf0wVeU7s1M4MF74FfJpmUCJEaozBq6kUQksy0dNc8HYwpVQT
 mRTg==
X-Gm-Message-State: AOAM530eWc1OKin0BS4ktJRBTd24mZqeyxiXp+bQdvqqLoxCX+IeZvCs
 x6n0K61WuGrWI/6EuzuzWMdfc4ev3j522A==
X-Google-Smtp-Source: ABdhPJw5e2pKA2MZxMKE1TM0C0WIUYwVC8dVult5l3ENvaTzhG91CU93aYo9HJpZmfhanj7YCtQHEA==
X-Received: by 2002:a05:600c:ac7:: with SMTP id
 c7mr2748223wmr.61.1643383815582; 
 Fri, 28 Jan 2022 07:30:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/32] Update copyright dates to 2022
Date: Fri, 28 Jan 2022 15:29:38 +0000
Message-Id: <20220128153009.2467560-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

It's a new year; update the copyright strings for our
help/version/about information and for our documentation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220120124713.288303-1-peter.maydell@linaro.org
---
 docs/conf.py          | 2 +-
 include/qemu-common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index e79015975e6..49dab44cca5 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -98,7 +98,7 @@
 
 # General information about the project.
 project = u'QEMU'
-copyright = u'2021, The QEMU Project Developers'
+copyright = u'2022, The QEMU Project Developers'
 author = u'The QEMU Project Developers'
 
 # The version info for the project you're documenting, acts as replacement for
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 73bcf763ed8..0e7e7bab959 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -13,7 +13,7 @@
 #define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
 
 /* Copyright string for -version arguments, About dialogs, etc */
-#define QEMU_COPYRIGHT "Copyright (c) 2003-2021 " \
+#define QEMU_COPYRIGHT "Copyright (c) 2003-2022 " \
     "Fabrice Bellard and the QEMU Project developers"
 
 /* Bug reporting information for --help arguments, About dialogs, etc */
-- 
2.25.1


