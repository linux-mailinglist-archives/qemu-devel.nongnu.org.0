Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A3C461CA4
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:22:38 +0100 (CET)
Received: from localhost ([::1]:59282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkMP-0003CZ-T6
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:22:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkF3-0002S9-5G
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:15:01 -0500
Received: from [2a00:1450:4864:20::42b] (port=36444
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrkF1-0001U4-Ly
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:15:00 -0500
Received: by mail-wr1-x42b.google.com with SMTP id s13so38473339wrb.3
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2GTULer4lRmEbboJn8akTz+dcWrDvvBiAJ4+IAIoMr4=;
 b=XYzivzY8xOq65zDWWt9v69xdSWPBC1LON34lWNZANJEG3fazQ1AluaHT9/dF+GOv1g
 gfChn4A0XVwrEG54r5I0KDwzd+waD6kOS0y+V3vWskQlOX4VgUy/uX6r1M2ardbl/SUO
 9SB2VOse3rLo5jZ0oXAjVECUWHt1a6zHMbL+3CJDfmauKCmRqxr5s7s5gzYWRCXBeVDw
 EmsXNGx4ZY62oIZ9fAM1+Ee4wq94fCJEZNq+EREUD2aZ7FO1KY5W5heLmNtNzQFzXhK/
 chBcndsIYxLQtzqQfl413KU2BeUDYSc8AD28bVKr/ILsMe1nRWYY49lYCU1rkgu83uj4
 yfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2GTULer4lRmEbboJn8akTz+dcWrDvvBiAJ4+IAIoMr4=;
 b=al4rVyvOsc1vautmrloAriswcBHELBvVXWeoCpfj+Ld69cIwfk1b3f7Nqfne0yHL3I
 RDgGiJOncwpwBpoAKEF8y9zubKTcdeFTY8soHZaYJVJllpQvhHaMib8TfLGOx1BIkFGm
 NRPtOrMh7vNvBIRHdKSDKKu9bva3fOYNr74VBs4qbCCj+/susGdfX/VXiVqbK88BszVK
 bGsz7L4pFZMB8XLcLlGM5Lv8w68So8uIMM980VRtrzx9kgu5On2qOnttskfRsqkxFdhZ
 w9CEK9HGOyL/mbPWQGI+4I2RZaHCB2BnbGISTh+0MTyNRrs+zHK2CcqO5119GpKAUIm5
 V9lA==
X-Gm-Message-State: AOAM5301xE0yBiNgWBPtrZr5zYqAx+/v26dPoqbYc9HqLMDoPGspFsCk
 ZJwSUa1LZ4OVpdZ0Ymjp38izIw==
X-Google-Smtp-Source: ABdhPJwuTU1esWOlzvnB/EAY5Zo8wI4pDIURaCOh940f8b6TxpDkb0Zk90bTiQ0MzOZPThxgNX1D2w==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr36082166wrr.143.1638206097962; 
 Mon, 29 Nov 2021 09:14:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e12sm18822253wrq.20.2021.11.29.09.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 09:14:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 229B61FF9B;
 Mon, 29 Nov 2021 17:14:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	peter.maydell@linaro.org
Subject: [PULL 4/8] plugins/meson.build: fix linker issue with weird paths
Date: Mon, 29 Nov 2021 17:14:45 +0000
Message-Id: <20211129171449.4176301-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129171449.4176301-1-alex.bennee@linaro.org>
References: <20211129171449.4176301-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Stefan Weil <sw@weilnetz.de>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/712
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211129140932.4115115-5-alex.bennee@linaro.org>

diff --git a/plugins/meson.build b/plugins/meson.build
index aeb386ebae..b3de57853b 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -2,9 +2,9 @@ plugin_ldflags = []
 # Modules need more symbols than just those in plugins/qemu-plugins.symbols
 if not enable_modules
   if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
-    plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.project_build_root() / 'qemu-plugins-ld.symbols')]
+    plugin_ldflags = ['-Wl,--dynamic-list=qemu-plugins-ld.symbols']
   elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
-    plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.project_build_root() / 'qemu-plugins-ld64.symbols')]
+    plugin_ldflags = ['-Wl,-exported_symbols_list,qemu-plugins-ld64.symbols']
   endif
 endif
 
-- 
2.30.2


