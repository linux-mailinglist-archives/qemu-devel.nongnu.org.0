Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97812373779
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:27:16 +0200 (CEST)
Received: from localhost ([::1]:36460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDoJ-0002oL-KI
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkR-0000sr-FT
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:16 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1leDkL-000590-Cw
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:23:15 -0400
Received: by mail-wm1-x334.google.com with SMTP id o127so980599wmo.4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 02:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XOXXbFmKIzYlDZ6gGIuWNND3ouYEXltv7aZzivzNlxo=;
 b=lZQaQ31DtmHH3Nv+Tffdkue0yQmcHhmQkKipg0uXJqlrWKUHT8p5Yb01grtmWLYsi0
 hfbrk6QDyG03MB8Oj77xXg2GwQS6RZzS6W6U0SAynHTx5kYiyvnh3xpZCuJgGBAtBYr8
 7u266fmne/7hN43dvSuCWYgfUZ2qiQcR4kA09manT0YOt1RMVCBVA4O5rObqD4WuFOmi
 Dc+QzywvYbNqAnJC4sNd10dswGCALIZXprcSahVlxCl8BMFv2ghV+yddtLnh53D6FRZD
 yqmWFucqPrOD4jkY4vov2hU9DZbhSND2uiGnlTGxkGVfMVRskK0Sxlb9mmH9ESze1Th2
 BX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XOXXbFmKIzYlDZ6gGIuWNND3ouYEXltv7aZzivzNlxo=;
 b=d3mUjvk4mQd8XSmUJA3eUlYSnyYUCJNKrFzsmS0lXjAW6MaVZhObMSByAj2O1LZTSQ
 xh48KFf+xE+0ElwPrznVlzri9A5CRfWbNiAgoXUywDDatOUBydiQjNjpjivz63sIqssG
 G3n8le8NZKPCD/Yc81pPrhUogHeI7tg2xI3YTnULnVz6jGk7RMAOazUi+JYFm8WSR2We
 fK5clikmwU/1Jk+CNaZszaXRC4uvcG0PBG1bCPrIyA+lkFtfdlNeUXP3eX8estUyMXwJ
 PVS/8Faa09+TYy3daoWCPO8GCpLh/bq0AZJ8oaMCYB1ky/zTgUz4TgkNkMGOc0fk7q9X
 y2WQ==
X-Gm-Message-State: AOAM5337p3PuT3N3OXsgIQ4lTGN/Tw81ictnYax739iIu9w6WQuWFVGc
 v96KhywZQc5ZeS+wqsJWx3ZzUQ==
X-Google-Smtp-Source: ABdhPJx81BFahmoruKwtYyzySQ0OUECmYtdxRR7z4wHC2vvyDd9L/LZA0VY8VRmYTqk9o8qRLHrpjw==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr8896908wmj.157.1620206587379; 
 Wed, 05 May 2021 02:23:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o13sm4335362wmh.34.2021.05.05.02.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 02:23:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B5D11FF90;
 Wed,  5 May 2021 10:23:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/7] plugins/hotpages: Properly freed the hash table values
Date: Wed,  5 May 2021 10:22:56 +0100
Message-Id: <20210505092259.8202-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505092259.8202-1-alex.bennee@linaro.org>
References: <20210505092259.8202-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, minyihh@uci.edu,
 robhenry@microsoft.com, vilanova@imperial.ac.uk, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 mohamad.gebai@gmail.com, kuhn.chenqun@huawei.com,
 Mahmoud Mandour <ma.mandourr@gmail.com>, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Allocated ``pages`` hash table through ``g_hash_table_new_full`` to
add a freeing function & destroyed the hash table on exit.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210422005043.3569-3-ma.mandourr@gmail.com>
---
 contrib/plugins/hotpages.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index bf53267532..9cf7f02c77 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -97,13 +97,14 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
         g_list_free(it);
     }
 
+    g_hash_table_destroy(pages);
     qemu_plugin_outs(report->str);
 }
 
 static void plugin_init(void)
 {
     page_mask = (page_size - 1);
-    pages = g_hash_table_new(NULL, g_direct_equal);
+    pages = g_hash_table_new_full(NULL, g_direct_equal, NULL, g_free);
 }
 
 static void vcpu_haddr(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
-- 
2.20.1


