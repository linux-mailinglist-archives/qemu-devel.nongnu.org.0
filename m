Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE3E454584
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 12:20:49 +0100 (CET)
Received: from localhost ([::1]:39084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnIzg-0005iS-2c
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 06:20:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnIyY-00051m-Rz
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 06:19:38 -0500
Received: from [2a00:1450:4864:20::430] (port=38877
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mnIyS-0000GC-BJ
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 06:19:38 -0500
Received: by mail-wr1-x430.google.com with SMTP id u18so3940840wrg.5
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 03:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lcHwTAYCaPLGkGsCxcC4+wML9K4j68n96+OFQHki2ik=;
 b=ZinPEAPq/G5AwLKtKHr7aCNC5hSK61ZDGuqDzY8JDPkC9ezTs2zfBgpjFOmz/RkTHG
 eEBe1YhCL86A6YJN8Ijbp1yLfYdEYB6nEdUtB94OoAfpXtMul0ZTcX3QmkOk+fxIz3G9
 XD9AztNWdfDR/qSkT/xmNn4Wm3V5FQJTTlRkQ1t36FnfFcuXAEIjAUp+xBhlThvL/+dv
 te7P53j9PgwgQly3WzpWt1w+6ADOr1GbKSc0QQ1/ksEdkVt0sA4BuwEUmLVt6NTOcvmB
 e/ZUpO+zA3OA/UTQ/wJ1i8xEbhvAG+tfHBNKeoFAsBvPTGD35NB+RtWEFm7lpCR6ufnp
 vcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lcHwTAYCaPLGkGsCxcC4+wML9K4j68n96+OFQHki2ik=;
 b=K+X2kcY6KRkTluC67cYPtPDexhCQYknZkenrNrMJl6VVY/mfo2VE/SgWkxj7F2GSiA
 WbIqm41PX+V3SzxaNcUYnvoOkSPdbbR/4N67aC3MrVtGKzKpunoK2rFo90ajKLY6pIcj
 LosyT6pnOTA13g/q43IxYclendA8MQ0JK6XRy6aavXho/diCkK5pTpZJUvf/7QI38+Or
 vrcIWTJoBSNm1dq54SkFD5UCXoTOjv015zmF2mbsuYiZdhSNUVtnVsOc0KAh8/9+PW8/
 WXZowUWCN7x49lasiBx7A9aKsLXj3uwlbssSobF2hAv7ahuVRQyG2Yfvxl0q0NBr5T7Q
 3apQ==
X-Gm-Message-State: AOAM532VWJWC37kkFKp0gABOr2wiaCKmocSN8vZzve43peFSl+QY3Grw
 uU3YYn0Q1xkb4l6SciRopjLB0Q==
X-Google-Smtp-Source: ABdhPJxyTCHvkI/EVotcQpKMianIWCzOatuNgGV8Q3j+8lVVVsKMc5TKfB1uyiYiNQnou4KgsB8alQ==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr19361753wrw.21.1637147970716; 
 Wed, 17 Nov 2021 03:19:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l5sm5506152wms.16.2021.11.17.03.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 03:19:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 029B81FF96;
 Wed, 17 Nov 2021 11:19:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] plugins/meson.build: fix linker issue with weird paths
Date: Wed, 17 Nov 2021 11:19:24 +0000
Message-Id: <20211117111924.179776-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: sw@weilnetz.de, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


