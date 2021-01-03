Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569FE2E8E5A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:17:29 +0100 (CET)
Received: from localhost ([::1]:54556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAki-0000H6-Di
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMy-0004qx-Ac
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:56 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:51160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMw-0006Rf-Rw
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:56 -0500
Received: by mail-wm1-x32d.google.com with SMTP id 190so15960111wmz.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SFAz4qf5qaCWKujyQyG6OOIUDn6IbjDbTkCHcatjAvg=;
 b=Qv0K95oqoQJ8LexfNC758XMQlPXcSfZ082u+jZ0a5vegM22/gmZue3n4opqp9s/Cfu
 XmMQQQyA668R2KsWkRLhmE9zdxySMEfA1vIBHtxkFcqcLRBzuelXMg83SkD0SfCFUMeW
 hETK7eYQ54Ev/2pDpGEg0M8ksUaRdqjZavgQX1do5veTwsLuieIIXsZf+wOKTY8WvD5a
 P7Mf5A9t1LNB29DgkoWv27AFVKM4jq1gHKPD0viqlh/7vcQeuF7uvEU2oLRrAPE0hZCI
 mezOcKaBbBnB0vhwhQQUW5rmlfS4KbfLZsucu1dky7vUzqo1On10LEXmkOczDoEmZRcE
 BOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SFAz4qf5qaCWKujyQyG6OOIUDn6IbjDbTkCHcatjAvg=;
 b=pL2QuZQk2SB50WqXX/hH8WP6QRy/T0TEHFedlD+JCEPiJaFRKFlyqzkuZk9SezWhfI
 6Imuh+wzGNgQdxu1zgt/762lqMuWXEei0M7C09QZOKFWe6VJUI9xeTMiQVd9SLLjhZeS
 KXV/v6pho8Nu+rbn//yNEJLPN3UC6NfzRIoG6+ekwVYzE9imyPGKJjI0nX/f7wzpN/51
 divC1pIX+I37JX1rEMhYrglX0hluvBmGE+OghGwP4OsTFlNpmOjXatqUmEGWGbbGmyse
 y4BIWcFr580a1VdkF2yUlt+Dyi2NBVau5iE0o9UNsmzDOEGvsYVcWY9gzOYsjgZTBtca
 sbWQ==
X-Gm-Message-State: AOAM5327N2mHHnBxpkIDjfv3NI6X8BDUSr4uC3I7uDvlXQ1SihpBNd4L
 KmRpGS/LMJSqgnCCD+w/46O/oXUGMyY=
X-Google-Smtp-Source: ABdhPJyKgEpcR4OFwS2r6N9M6o8+t2f+fdUMO+Rc5FGfgZSf1ZHRWPikzjS/y/84NnZV8uTtcpN/lw==
X-Received: by 2002:a1c:2bc2:: with SMTP id r185mr23449693wmr.13.1609707173335; 
 Sun, 03 Jan 2021 12:52:53 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id y68sm30951535wmc.0.2021.01.03.12.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:52:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/35] hw/mips/fuloong2e: Remove define DEBUG_FULOONG2E_INIT
Date: Sun,  3 Jan 2021 21:50:17 +0100
Message-Id: <20210103205021.2837760-32-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Seems useless....

Fixes: 051c190bce5 ("MIPS: Initial support of fulong mini pc (machine construction)")
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Message-Id: <20201224031750.52146-2-jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/fuloong2e.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 8bc854130ed..c5a20b64621 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -47,8 +47,6 @@
 #include "sysemu/reset.h"
 #include "qemu/error-report.h"
 
-#define DEBUG_FULOONG2E_INIT
-
 #define ENVP_PADDR              0x2000
 #define ENVP_VADDR              cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
 #define ENVP_NB_ENTRIES         16
-- 
2.26.2


