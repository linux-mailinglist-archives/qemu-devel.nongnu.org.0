Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5945ADB4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 21:59:37 +0100 (CET)
Received: from localhost ([::1]:35890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpct6-0004SF-Cx
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 15:59:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcr9-0001up-RI
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:35 -0500
Received: from [2a00:1450:4864:20::32a] (port=46596
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcr7-0006LM-LF
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:35 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso244088wmr.5
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 12:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YmANYK88aPtNwGm4O/0eNlrDR7OUnbvfD2pP6xbhw2g=;
 b=VfB/tJuwYmg2pfvAon0sRPac9bt2MqUyzl6ij/tMXSfuaCcC79AU67a838nZFMh9/x
 5f4YMx4d8SmhfsIPv77fzSmrPTvpPMDoEAtPv6Biu3Ep/kjGWMa7VTx+r0nAhOkp5nZ+
 5p3ci0UENAPJcVLYXxOQEPZ4KeyYC9tONzqZTOaKm4f3NknWOs4EGl3bxDOU1li1/1Co
 zpnYbnLeJJsA2X84oowlN8aGMd0kjQyxYOkDMau1cEfBKxi9ocUOuiUkyXZ+cD5kDE2L
 cMPvsXi+1dmUuTB+LLfNdNX+UHiNmJYMUtGO3BiufDaAZcrE2iTTnBfnXZEcfiWs4qVR
 BOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YmANYK88aPtNwGm4O/0eNlrDR7OUnbvfD2pP6xbhw2g=;
 b=SzM4JPt6uMtO+sHaDdV/C6o5kTMceyfKFQQiGExJBadKdG2CYIa+N/uDhrWf7v1oVU
 g82y7Y3RqfU389rbdH8oWCOocnQwiXhBL5Q61KO/gYDMEYzzYtiPXRrR9YaxeXFBHOkl
 VnjVKkRQsyy6l8c/JOfeejsbwS0t3E2wHOIxonv7PUvG/C0PzTG43hcWst3DxIt6Nvc9
 jXWYChsx3FRAtbP41bGElwE9ICmV5F0oPO3/1xaqf9bKCMOVI2L9/j4LvQ126Zb7Ucr0
 RheADGxxIBeCFUMciLxLJMAlWuQfqiK8WN2J/EPtnC6YNEyfPutPkwEWQwtaSK1rRS2y
 AS2A==
X-Gm-Message-State: AOAM533cYsgP2C89d6xQzUoA5vl+wNTncvjNjVWeID8qUy+oLzV1xdip
 d+nZza0k1iRdSod78/1E0mP/+A==
X-Google-Smtp-Source: ABdhPJxO+mNPN25SyqXrecdo0w9Ah0plAEWdNk6fHuihXBIc267nJ7GPOGC1h4/XbChdPDadW3PeSw==
X-Received: by 2002:a7b:c207:: with SMTP id x7mr7255368wmi.108.1637701052131; 
 Tue, 23 Nov 2021 12:57:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t8sm2778157wmq.32.2021.11.23.12.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 12:57:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F8AD1FF9B;
 Tue, 23 Nov 2021 20:57:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/7] plugins/meson.build: fix linker issue with weird paths
Date: Tue, 23 Nov 2021 20:57:26 +0000
Message-Id: <20211123205729.2205806-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211123205729.2205806-1-alex.bennee@linaro.org>
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, Stefan Weil <sw@weilnetz.de>,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Stefan Weil <sw@weilnetz.de>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/712
---
 plugins/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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


