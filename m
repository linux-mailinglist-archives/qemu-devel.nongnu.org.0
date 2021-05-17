Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F69C383A95
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:57:44 +0200 (CEST)
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligYp-0004Hf-Fz
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyr-0001om-3M
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:33 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifyi-0002DT-RN
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:20:32 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so3952654wmf.1
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aZuDUoz3vNGYexV1AEzGlzVlTs4kTeswm8li9GZxIko=;
 b=JV7tltDSdSR9KmszjToHv6VBlamZSzMvBvKcaPronfV5LOmDnZVCqwlytyO+ha9CTb
 Bp9U1AQtHl6gT4CusHJp0A6lsy2w0TpNhDQJpgA92L/Md202XA7AT2GaiMPwV1ILJ1eR
 5+DtnWDNuDE4lLDRiIHAc/MzF/cwl3WuaJEpnvPovanYvGLzAfLseIcTwfVT9kIw77kk
 neq00oaA9dMzGG9xraxEGlrKBs5L9vr/n4P5Gam8krGIrKur7sViX3BxiutL6V9jGOBW
 50/5yGUwAvP1KZEbf3tGNSFiQt5XGmeuO8uuY92R/h64MLd/M7d3/mY97br4Km4HJTX6
 VGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aZuDUoz3vNGYexV1AEzGlzVlTs4kTeswm8li9GZxIko=;
 b=gpYRa/wwC+/ZuCu0zFa21rMuFMZwYgWCkDTc7WOszv/sFOoz40/ofErXSbFNzGA7BM
 VloQ3bL0sG8VhO56fy5gMhHNwnFYQghEBfDU/Gq4+FVDpi8rv00RWmlH4csaRqPq9VOF
 VJGJD+gnM76ruJC/IwfxN/7+lebOZVtv1EJuIgGwJS45KEdOlUNcE+W8YUjllfgVvTR3
 7C0WCgfrtc41Oqi2dBLb68E85FcWXkMIoKypjGHgBSJKDXRPBU49qZc+jsCgk0tNnCVe
 2yMBJSB8FJbNp4hTDtIChVnqyN+HgDpTHMIO0dHvX5whz+Ai1xM3TJsYS+M0zMamS6Hy
 dRCQ==
X-Gm-Message-State: AOAM530QUoVL1+xzz1R3W/9BgiLE23oOHJ90sRSmynVuB+qzxJN1Lm0X
 3amthcFy3+clLJ3n1kKvdb1e4g==
X-Google-Smtp-Source: ABdhPJwDCqubkyXWeDwC7sOkZhZ/ykhcBtsUATGEqyBruQPAkcmSADf+Ul96p55sMM/JVvSVs71p6w==
X-Received: by 2002:a1c:e408:: with SMTP id b8mr441275wmh.85.1621268422887;
 Mon, 17 May 2021 09:20:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm2333011wrt.67.2021.05.17.09.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:20:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EA6601FFB4;
 Mon, 17 May 2021 17:10:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 29/29] plugins/hotpages: Properly freed the hash table values
Date: Mon, 17 May 2021 17:10:22 +0100
Message-Id: <20210517161022.13984-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Allocated ``pages`` hash table through ``g_hash_table_new_full`` to
add a freeing function & destroyed the hash table on exit.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210422005043.3569-3-ma.mandourr@gmail.com>
Message-Id: <20210505092259.8202-5-alex.bennee@linaro.org>

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


