Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307524AA167
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 21:50:05 +0100 (CET)
Received: from localhost ([::1]:33290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5Wu-0006lM-8w
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 15:50:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qq-0006gh-9K
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:48 -0500
Received: from [2a00:1450:4864:20::333] (port=42868
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5Qo-0007LM-DQ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:43:47 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 n40-20020a05600c3ba800b00353958feb16so4464319wms.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DaG3zQiQZ36ycjnydoAdWjsIMQZNyRhwpx1B2DtbdXE=;
 b=ZzFoL0iYjocxs78puY+y1PrPpwe4vMde3SRZubdsFTHEBQ0J0yajyd8LlI8Xu69/6c
 Htqb5AxVUDrhwrjfoJQ/f7ObyrvusL+Vw6lXlPqEyOJHM7Pb5YkOPCnxbAoIa8m131Tg
 cfBAWu8mf9IxpCqBwWUY/Wim/JqGT/mK5fZ0DNOjuf2vMvD4bKZHSZ94RgwbXmBI6IJm
 rX/5di65djTamwuEikTPb+4ECr5pcBzzcgsI3YyvVViLVzk43wdYFxeYDB90QByUF9Bi
 Kc8cLF1xP/LZOYLckEc4a04qGjJNNg4u41ZpO/lbrdoBb4pNRuCPHJ0GvPemHDY1Zu9Y
 bRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DaG3zQiQZ36ycjnydoAdWjsIMQZNyRhwpx1B2DtbdXE=;
 b=Aufx4ZAZKwdRgLzXk+A9tRpWn6H33BUHu2jhY354C4K23pM+72I8g/Z0x1O1bfS/0l
 4ARUf7jUKqWzYWt/G4wqttrXruTRPPNyw2TYdx1qZmPo3/l78E/BJrNOCBOjeeqz01Dz
 D2n24xqy/aLasZbaEQqHTbdrxOhuMqvqDxZEZbwZnVdOUTgbQ2MUUV8MZQbCr2INskau
 oTwpTQOV7/YnOU1xdycpfEirU07scuOtErHXEb9Z9vceu1tSUijAIwhNN58xGJfrafZP
 MSxnjsK+xiOMJEEw654gmkrxeZgvvI6IBovtFHvomSS53pPBu2Vn3LRz4PpP96cW8Gs7
 EsFw==
X-Gm-Message-State: AOAM5317dlzH9HzJxaMPRmsGHZ4r27tr+EG1C6kgaJ2PUHmd2ga/VuYo
 FMRzPq4MyOdyVf7zFFLMbAEKYw==
X-Google-Smtp-Source: ABdhPJy/sfp1hc4hCfKj9ahTCoA285bgxDol42SXaRuO0OXrkmvCEluAgBMmrquAb/16j+YxOa3LLA==
X-Received: by 2002:a05:600c:3ac5:: with SMTP id
 d5mr3727961wms.101.1644007425076; 
 Fri, 04 Feb 2022 12:43:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m11sm9462721wmi.16.2022.02.04.12.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8B0751FFBE;
 Fri,  4 Feb 2022 20:43:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH  v3 06/26] gitmodules: Correct libvirt-ci submodule URL
Date: Fri,  4 Feb 2022 20:43:15 +0000
Message-Id: <20220204204335.1689602-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Correct the libvirt-ci repository URL to avoid this warning when
cloning / refreshing the submodule:

  warning: redirecting to https://gitlab.com/libvirt/libvirt-ci.git/

Fixes: 4ebb040f1fd ("tests: integrate lcitool for generating build env manifests")
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-3-f4bug@amsat.org>
Message-Id: <20220124201608.604599-7-alex.bennee@linaro.org>
---
 .gitmodules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitmodules b/.gitmodules
index 84425d87e2..f4b6a9b401 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -66,4 +66,4 @@
 	url = https://gitlab.com/qemu-project/vbootrom.git
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
-	url = http://gitlab.com/libvirt/libvirt-ci
+	url = https://gitlab.com/libvirt/libvirt-ci.git
-- 
2.30.2


