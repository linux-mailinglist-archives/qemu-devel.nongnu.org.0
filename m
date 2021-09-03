Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4104A3FFCE5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:18:26 +0200 (CEST)
Received: from localhost ([::1]:44124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5L7-0006tD-BP
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM57C-0006ID-FM
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:02 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM579-0005gi-GK
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:02 -0400
Received: by mail-wr1-x435.google.com with SMTP id t15so7186990wrg.7
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gnkvq2Rb6V5W7/htmB7BU5fOrcMpKnuqDaYrMUnPexM=;
 b=VWEhf7CRE3WhAySygm0n1i6/e1W1OQPizCUNEiEWBtMQT1pDE3tzThe4opsst/Ki05
 g6SYjGhvFEInD4k3jI5X3TN5MzchB5bEbH1/bt2pgRq3QBNutIbcRiARDPBVT0nFZq1g
 HIBd+MZ8AgVxWksNxkwb4bb3jaVF0DRIddmMbSOeBUAkKT0DaWKIhQfSDsgQfx9BKqNt
 wOCd1UD8rBeF09bywgziNjlscZmnGnPiqYa1ihiVz5qaDEgvduXPEFaCxeEKNSRQMIQP
 40hxHjiwdtUQw7hOLfc5v+s9ZJzAroZg4uvXjdJsSW998KfIM74jAuHwkUTXmq847L0t
 cZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gnkvq2Rb6V5W7/htmB7BU5fOrcMpKnuqDaYrMUnPexM=;
 b=C2C1vHxnDPBlQKWvj03lNjesH7CpwVU0ZXKZq4IZ8lg9OWTjmyiPr1eFDSU8h4qJTs
 sXKsxL/g6MLmIveQ7eCFVhSS6P0mAXiJI7cdBl/j0IP151TvB7VZHOpKM0J8y9LrWaUu
 21V8Q/arrPnB74Vc2Oi4xNQx/Noa1Pizbd2xh8wkMwAgMZrdu/kam5oCvfkfHZchig3c
 Fi63sGBFyWg2GQ/lrxP+HCB7VrsAFXkf0AHblh1TSja3elzeSgBT2DtgFksX/5Gvl4lJ
 QzqCX8jSzeUXSEjJumFbAdYTSfo2PLFol5oORL2XE3Q2rC8iBM8XqHkOBxGJom/zO4kW
 EnEQ==
X-Gm-Message-State: AOAM531DUkPEVPR8sfOfk07t6o1B4ri57NJipkyQOnrsYrbFsIIMsqBR
 AfdHs2rfx7fDLfzbmNMh/rdYPA==
X-Google-Smtp-Source: ABdhPJxsq1204hmMQD5Wn7rttgAWSwFBoP+thUJxDErpKROgWKGwRfMLprLAFcb/Y9fNCuYrD73r9Q==
X-Received: by 2002:a05:6000:1808:: with SMTP id
 m8mr2773435wrh.272.1630659837996; 
 Fri, 03 Sep 2021 02:03:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k17sm3935314wmj.0.2021.09.03.02.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC4881FFAA;
 Fri,  3 Sep 2021 10:03:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/22] plugins/hotblocks: Added correct boolean argument parsing
Date: Fri,  3 Sep 2021 10:03:29 +0100
Message-Id: <20210903090339.1074887-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210730135817.17816-5-ma.mandourr@gmail.com>

diff --git a/contrib/plugins/hotblocks.c b/contrib/plugins/hotblocks.c
index 4b08340143..062200a7a4 100644
--- a/contrib/plugins/hotblocks.c
+++ b/contrib/plugins/hotblocks.c
@@ -133,8 +133,18 @@ QEMU_PLUGIN_EXPORT
 int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
                         int argc, char **argv)
 {
-    if (argc && strcmp(argv[0], "inline") == 0) {
-        do_inline = true;
+    for (int i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        if (g_strcmp0(tokens[0], "inline") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
+        }
     }
 
     plugin_init();
-- 
2.30.2


