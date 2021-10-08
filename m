Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFF1426ADB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:31:17 +0200 (CEST)
Received: from localhost ([::1]:49056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYp1x-0006GK-0u
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYox5-00037W-52
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:16 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYox2-0006xZ-JA
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id v25so29247658wra.2
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 05:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UlbD6XGfCfOXQupeOaSvEq6gHfGN83XYP2EpCj2vfsk=;
 b=dg+F8z3jmyzi9qAi4YnugEblf9Js7jis7RShYJeqyCGaqi5Q93Usdq7EptitIMcXAZ
 ils/DYNvKNzZl2K/Lr1IesZi1HbYRu1ylDAA7bQ9NOa/onJCpmAifP/vLWpRkDh8SJr+
 WU7todvkmAAnPozvn/AV0RqDpB1XCeZAmVzfkUIEB6yGpaXfQpQzVr/DnIf0FoUd9dii
 VuwuTm0JyGvRj8x3xfszgsWQfrsE1UFlXJgN1jYB+fEkfh6Vt7gcz8cPhEySWrvVTcns
 HDeihKN1AczOeNQOSFjazcf9EV8avtIinAWYbMDCe0GSbjEwLji7CDFh+8w6MKq3G0sV
 wnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UlbD6XGfCfOXQupeOaSvEq6gHfGN83XYP2EpCj2vfsk=;
 b=cg22qqn8rThFf5E6vuXd4ZmA+QNylGj9EzfRC29XWfNbLn14Lm9MsgcIEvLhtByq6Q
 k/R+ynUqbZCjiHUSD38ioaVIqO0uJv0PbmaTIeJH+sEExpW4JKSUh4gG0KZuvI0yNHVR
 HlF3sRWwoCFRvHtTRpvGYgvOzfZ+BxdMYbmOpMXpbp9lhskR6HGCpY3hIf0szKG4xRI6
 rr/AfqN2jnjO+pAKmZA6wZkPQAu90XWuSMndVTIKN/wID4ZSdAWYMGFphTDBnNAgSzIw
 r5ghq0kTdOMvNddx4dgnLuVxG71N16QRx9S8F/hx9fDQp9bx7M6uTVgcXi5qvp+Yb/vu
 yCog==
X-Gm-Message-State: AOAM5312yW3w1Uo88FQWMC9OCqoN6JEAl8GJTTbr3FCsyVNwTwc4yB/n
 DJoGPA1Dw6LJEOEPoFcZrRt78A==
X-Google-Smtp-Source: ABdhPJwUpJqsHyYM+gVo+kvg4Ew9rSNZ94m/42yR1BdEl5/rEdxkpph8Z3BRrD52Z7L7YBXXej1LOw==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr3882998wri.140.1633695970739; 
 Fri, 08 Oct 2021 05:26:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l21sm2418952wmh.31.2021.10.08.05.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 05:26:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD9DB1FFA5;
 Fri,  8 Oct 2021 13:25:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 09/12] plugins/: Add missing functions to symbol list
Date: Fri,  8 Oct 2021 13:25:53 +0100
Message-Id: <20211008122556.757252-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008122556.757252-1-alex.bennee@linaro.org>
References: <20211008122556.757252-1-alex.bennee@linaro.org>
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.junger@greensocs.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Jünger <lukas.junger@greensocs.com>

Some functions of the plugin API were missing in
the symbol list. However, they are all used by
the contributed example plugins. QEMU fails to
load the plugin if the function symbol is not
exported.

Signed-off-by: Lukas Jünger <lukas.junger@greensocs.com>
Message-Id: <20210905140939.638928-2-lukas.junger@greensocs.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210917162332.3511179-11-alex.bennee@linaro.org>

diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 67b309ea2a..4834756ba3 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -1,11 +1,14 @@
 {
   qemu_plugin_bool_parse;
   qemu_plugin_get_hwaddr;
+  qemu_plugin_hwaddr_device_name;
   qemu_plugin_hwaddr_is_io;
+  qemu_plugin_hwaddr_phys_addr;
   qemu_plugin_insn_data;
   qemu_plugin_insn_disas;
   qemu_plugin_insn_haddr;
   qemu_plugin_insn_size;
+  qemu_plugin_insn_symbol;
   qemu_plugin_insn_vaddr;
   qemu_plugin_mem_is_big_endian;
   qemu_plugin_mem_is_sign_extended;
-- 
2.30.2


