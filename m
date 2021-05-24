Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB3538F265
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:40:30 +0200 (CEST)
Received: from localhost ([::1]:51870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEZ3-0007Mu-Ic
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llDp0-0003kZ-L5; Mon, 24 May 2021 12:52:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llDoy-0008Vp-SW; Mon, 24 May 2021 12:52:54 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x8so29234063wrq.9;
 Mon, 24 May 2021 09:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nkgsk24SyJzDyN5JtfS6I/kbjd8RlzgveFJeWIQ8VH0=;
 b=fMtjRuHODyt8LwO681/dl8nTECHa+jc7zopSPMc6rxU0ki4iu6iSuYmIA+eIT1rOUd
 2tYwlZBW4/j6/ax5soY2IQZxwrdF9s/QJteKI5ra7DpRnFKVAI7ob1yYFK82Uhn1GGoj
 L3kNFgJBEh6k9/oF9rEIi2TA5k+hcTkMndWX7iJjNOOv8gwwrawA3h+Hp8uXpeCLVCve
 XP7vadqX5WaUboDXu3WCOumxwn/AsdXdoHkad/tmtSlQrPT0x96QCWZUJ6CozNXapggz
 lfgqwdAKKb58Si4Q0R318E6b7WZILQlYbhhM4ezLNGzwf/rihABdz7nR0KVXSHuRiWnh
 ksKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Nkgsk24SyJzDyN5JtfS6I/kbjd8RlzgveFJeWIQ8VH0=;
 b=DHBudUeGUpEVzLUGBCHdhtCliBZOMtImOv1Mvk6Cr2pewVZGwSJ2LUIgwGDWUk+o4V
 V5RAT4rds85nxpq7Hz9X5ijxKyNZEY767iDopb/3P/HxJo31muIXiGnCPNq//oVO54P1
 DBbqXBHA1r92wWhUynar4e1oFzdnPoGMBohm9dYi7wL9mbFEiqIYNmXw6ikB5lkM6AP/
 5wEhSmyvVFsT0qldS0QELkRhe4eyCht4N6s20jbNGQEPx5PrgubmVPK9wma9yeHfP2Kc
 jWPdKEsM+yXM4FDPCobs+2ORc3GRVWG4M1AGm35oyO0ypch3lUxXEv4tTKb/ao7ei6TR
 DD0w==
X-Gm-Message-State: AOAM531pDr2Ok8/DDIa/Tsm9BIUfN2Lx8FffUB9E1GcsxUR6AeuxMNXF
 nX4U7jszzmXFFmfU9dTJBmv73vmR8EMigg==
X-Google-Smtp-Source: ABdhPJyu/pKtg0rn2AFbm5HvKpPFhKhoDT3/mVXedjC3/lmC79JiVFXL3Tk7xWg5tGkZGkDOSVT3eA==
X-Received: by 2002:adf:ee89:: with SMTP id b9mr22708889wro.139.1621875170125; 
 Mon, 24 May 2021 09:52:50 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id s7sm28511wmh.35.2021.05.24.09.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:52:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] plugins: Add missing 'qemu/qht.h' header
Date: Mon, 24 May 2021 18:52:26 +0200
Message-Id: <20210524165226.3785324-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building a plugin we get:

  cc ... -c ../plugins/api.c
  In file included from ../plugins/api.c:43:
  ../plugins/plugin.h:45:16: error: field 'dyn_cb_arr_ht' has incomplete type
       struct qht dyn_cb_arr_ht;
                  ^~~~~~~~~~~~~

Since we expect all headers to be self-contained, add the missing
"qemu/qht.h" to avoid other developers to hit the same problem.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 plugins/plugin.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/plugins/plugin.h b/plugins/plugin.h
index 1aa29dcaddf..55017e35819 100644
--- a/plugins/plugin.h
+++ b/plugins/plugin.h
@@ -13,6 +13,7 @@
 #define _PLUGIN_INTERNAL_H_
 
 #include <gmodule.h>
+#include "qemu/qht.h"
 
 #define QEMU_PLUGIN_MIN_VERSION 0
 
-- 
2.26.3


