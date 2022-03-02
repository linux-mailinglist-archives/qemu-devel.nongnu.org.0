Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5484CA4EB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:36:50 +0100 (CET)
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPODp-0007dw-Nj
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:36:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO4M-0001vk-Tx
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:27:03 -0500
Received: from [2607:f8b0:4864:20::534] (port=46059
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO4K-0000k2-F7
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:27:02 -0500
Received: by mail-pg1-x534.google.com with SMTP id z4so1474665pgh.12
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ZpqVs0GOXjw29QL63IperGwYuGKOgudlGW4UMUfkyw=;
 b=ooBP1zmHySgKqTsVnDi2tCohsng4sNp+2FMXCtog030XXCNgcn6oDHBYiIH0ejKNzD
 a/ljvpjWQSmsfThQwNgjY0scj3YFxqOVFCx8OHl5olNSC2hj3bXZcLXLeIrEmyACUrza
 dTExcpMAjEu6sFMkxBQSIoyU1axQDNsArijw+lJP5wd6KQKnft0O28HXdGOVozeWI6Xu
 BLdzFkrAWodyP4dBwR8IB8OjF6lQ7gDNR8i64NDP/HO3EPl/STJIcYnjclLV2IED/vqf
 IRu3OpyxkUuKIyXmgWkMl+4K6VKv7kkVuhhK9wqaI5UM0cLYFj+N3o9OTaofG4xKr4Ap
 eNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ZpqVs0GOXjw29QL63IperGwYuGKOgudlGW4UMUfkyw=;
 b=qN0kySPhHXWLTrZ5N5lOu0FtDE7YXVxut7MMMojTmrcT8w35E8UoU2Mkd5sogBQ6qf
 8goPnVB30A0PDpEo3PWK4982n7Gk+CRDhWxD6Ej1a7K5s1Ys8pKO7ifhPzR+0yvXkp5C
 PVTMelrhGq+MJV3VtQTAd7GOmd4x1fp7LrPU0qfu5TEHiEbdQu4MmB2J9llY2Q3kzK/+
 82Wx7pc+Q6rziPXJX6KB4b+hz/hXGZE+JbmPUXJPVVR4qwxNFT3H+N5pmUAwuSMdbGLw
 uTM7MKuiPp42MclhLgGGuAVYMRHQn3rdrBM/u7NfsGKM8FAQOfao3X1+UqxGIacwoWYl
 eGIg==
X-Gm-Message-State: AOAM532VGK7nzJ1dzDI2p9WMtUOyniJDmIXLGIY+1QQ56Iv2RywrE3TS
 YIqpoX4GkPpyJDtVUC6Ox/ooS4m0JgolZg==
X-Google-Smtp-Source: ABdhPJxlt809y5AM3BXHRwFm0Gefh35bh80tYfS5+wbHbEJnJCn5xJn1abOhwbRp6kQT3ZSLz5bNPQ==
X-Received: by 2002:a63:d607:0:b0:378:c5ee:50c0 with SMTP id
 q7-20020a63d607000000b00378c5ee50c0mr9978402pgg.333.1646224018679; 
 Wed, 02 Mar 2022 04:26:58 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001bedddf2000sm4912971pjb.14.2022.03.02.04.26.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 04:26:58 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] hvf: only consider directly writeable memory regions
 for dirty-tracking
Date: Wed,  2 Mar 2022 20:26:10 +0800
Message-Id: <20220302122611.15237-9-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220302122611.15237-1-ubzeme@gmail.com>
References: <20220302122611.15237-1-ubzeme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=ubzeme@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Yan-Jie Wang <ubzeme@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is no need to dirty-track MMIO regions or other readonly regions.

Before we start or stop to dirty-track a memory region, check the type of
the memory region. The region must be a writeable ram to be dirty-tracked.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index 2f70ceb307..b215386bc8 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -180,6 +180,11 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
 {
     HVFSlot *slot;
 
+    if (!memory_region_is_ram(section->mr) || memory_region_is_rom(section)) {
+        /* do not consider memory regions which are not directly writeable */
+        return;
+    }
+
     qemu_mutex_lock(&memlock);
 
     slot = hvf_find_overlap_slot(
-- 
2.32.0 (Apple Git-132)


