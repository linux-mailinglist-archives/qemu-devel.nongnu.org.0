Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6943C37CEFA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:24:18 +0200 (CEST)
Received: from localhost ([::1]:38440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsan-00087h-E3
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUb-0007Ak-31
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:55 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:34415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgsUR-0008Lm-Jl
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:17:52 -0400
Received: by mail-il1-x133.google.com with SMTP id c16so1905401ilo.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o9W9TsWDfUy9rNviBTYIU9THi5aRC//53zh1Wgxdr7U=;
 b=TjbLK30iWul2RGWtUVFQCa2od4t8t4wAcAtoe4+BCdIHnBfNcnCElO88nY0Uvg78D7
 RXXZEwbaSFX9jqvzJhlnBHlaPL0TEKwnjUP2vFCaxZwPd2n65p1ztJ+dliDSXtLu21Kj
 S59D+qaAdeY2CmJJiaNZlhLrJ4he/4wf5MsCMGx92sj0Wnnk2Gnt6sjTYsvsIiHuOGFp
 /58Sj7Kf9hiw0ymVDcumOuNtaK9hKuZDxgL7NYP+qDcnv+08VLQ22KrNHrsgKZDvNr63
 yhNzTTIsICNFr1Xef/EnVZ4HDY+VqiqVrvSYvxvso7wYmkwl+o+z79kvEq5tgBgcfSXF
 EnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o9W9TsWDfUy9rNviBTYIU9THi5aRC//53zh1Wgxdr7U=;
 b=Ri7IFur34D+9ls5k8w4y7VZsyurg4tHyyDM7hiOQFANlcbrqQEIWjrroW2gCh3wro9
 xfTTZ0F9zPvkMsM1o9273WfhjDIBbmKp6KjoYbP137H5Im9um5iEDqgWJmdHvKQiqFS7
 Bak7BubS4+yZnI3o4W5HfEXO3xHdDJicWrHAR49xJFN4qKwGZ+Zpayx1vL1wSuJh3+e8
 rO6Qf6/Il3gzLt7ecc3VIM2raOdsu/t7VTnnvjW6f+UXrZLvYxbx3P0kLrVkQTrpqycA
 YydGnftF8CLk7qkfHLzTO/N8Cd98BJLsy02fNKdg0DpeGYlRyRKV2Vrstyz4ZJHxWpg7
 1ecQ==
X-Gm-Message-State: AOAM533ryp5Omfcfr6Xxcd+yIDdEeq1RNT5RqW3xuCMa0TRpn4fxFStl
 GSAkUE/J2a89axv/9iAPiPal6c7lgCmvjw==
X-Google-Smtp-Source: ABdhPJypX2i7SJuHFQcWRYCe60WZE4k2CdB092taMePadZfctPlgtuc+LHx2vF4/Rs261tyywjJ0Cg==
X-Received: by 2002:a05:6e02:13ca:: with SMTP id
 v10mr29971659ilj.191.1620839861805; 
 Wed, 12 May 2021 10:17:41 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id d2sm192064ile.18.2021.05.12.10.17.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 May 2021 10:17:41 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/20] bsd-user: style tweak: keyword space (
Date: Wed, 12 May 2021 11:17:15 -0600
Message-Id: <20210512171720.46744-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210512171720.46744-1-imp@bsdimp.com>
References: <20210512171720.46744-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/uaccess.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/uaccess.c b/bsd-user/uaccess.c
index 91e2067933..89163257f4 100644
--- a/bsd-user/uaccess.c
+++ b/bsd-user/uaccess.c
@@ -46,7 +46,7 @@ abi_long target_strlen(abi_ulong guest_addr1)
     int max_len, len;
 
     guest_addr = guest_addr1;
-    for(;;) {
+    for (;;) {
         max_len = TARGET_PAGE_SIZE - (guest_addr & ~TARGET_PAGE_MASK);
         ptr = lock_user(VERIFY_READ, guest_addr, max_len, 1);
         if (!ptr)
-- 
2.22.1


