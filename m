Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7774CA7DB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 15:21:36 +0100 (CET)
Received: from localhost ([::1]:58384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPrB-00052n-Gz
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 09:21:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOey-0003gh-GS
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:53 -0500
Received: from [2607:f8b0:4864:20::52f] (port=46930
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOew-00050V-V4
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:52 -0500
Received: by mail-pg1-x52f.google.com with SMTP id o23so1553673pgk.13
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 05:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5EctREAQDjoYUQJkwsc8J7xA5hFqnlwKFFaMCNutUV4=;
 b=cCBgxVuszDqhq5Da+mLq+eZuoqXHCONWWcTlvYj3yCaS6v5DJEm4XGYpENBWnlJGpw
 3UQW3UlI29LlHB+myr1mYmy5T00YrGGCmuL70QZQuCOp19wO10RzKGMSDY9vqzZV5wsy
 0dNKtjGhFBrTAgoVq907pifzD9qAskaAQCkxkisTITNJhpmw2tMAT7nhUnG/JRp1ujlT
 ca20R9a+c9nviaDh8ZbCL8GtDt3apEoUTM4QS3OZPrp1P7qffXp/ckVWump/JGo33L8V
 Dutq3vXk9aQis3CHpwi4h7amjVj4bOUXAPubYcsm52trnf8WXCWZWv48RctUKdsmrgNz
 0z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5EctREAQDjoYUQJkwsc8J7xA5hFqnlwKFFaMCNutUV4=;
 b=w1U0IgfdTrdVCecN382PJ3fT3e/jlUIntNDv5mPUGf/r124m2I+qAfjjsJG0hUxRrN
 hebt4cbYCNyjY0wRVpR+CcFS82XULk+AshuVPar5qLwf5RjY3r8q6bpmqIpKT+3tYMqK
 1/67cGXHRXgJ1pqXTxFh0AYFipjWFJAeBNEKvOvdpANT+sI2IMGYmZbM5d7HJmzGZkQ6
 ZdUQHpucdE1cW7mk81eKhruq3E2Ba7Ir8zQ7QYoqxOlV/W/eRkam2PbJNi+M2BXigOjM
 Q5ctkKQ+NRK80ET9y/0CLDIjT1PaWP2BYunsWHpiwW7K+IhEM/2v45RqKHphYovidpCt
 CVeQ==
X-Gm-Message-State: AOAM533FigBj2Ri2K6adzpQvCXYhozmRS7ums1Fz1oeoiY8DKrTIYrta
 6Y3/zJzLNfJL0qCG96ytwAKnOsoU737vIw==
X-Google-Smtp-Source: ABdhPJxmgR8F+aU7ss85VNykQZaLkvTSFZlI3NSelRYyfMdTnX4z7s9KVpfJcZdMESA5cgYh/dZRxg==
X-Received: by 2002:a05:6a00:1d8a:b0:4e1:559d:2f62 with SMTP id
 z10-20020a056a001d8a00b004e1559d2f62mr33316326pfw.26.1646226289038; 
 Wed, 02 Mar 2022 05:04:49 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm21947964pfu.62.2022.03.02.05.04.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 05:04:48 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 9/9] hvf: remove the need to lookup memory slots when
 clearing dirty-bits
Date: Wed,  2 Mar 2022 21:04:17 +0800
Message-Id: <20220302130417.18551-10-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220302130417.18551-1-ubzeme@gmail.com>
References: <20220302130417.18551-1-ubzeme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=ubzeme@gmail.com; helo=mail-pg1-x52f.google.com
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

Originally, when log_clear gets called, log_clear calls
hvf_set_dirty_tracking to write-protect memory slots whose dirty-bits
are cleared.

Calling hvf_set_dirty_tracking means that memory slots will be
look up and the lock for memory slots will be held during the call.

We can use the parameter `section` passed by the caller to determine the
pages that need to be write-protected. Compared to the original method,
this saves time.

Moreover, this makes only pages whose dirty-bits
are cleared write-protected instead of making the whole memory slot
write-protected.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index 60ece20eb4..47d23faec8 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -84,7 +84,10 @@ static hwaddr hvf_align_section(MemoryRegionSection *section,
     size = (size - _delta) & qemu_real_host_page_mask;
 
     *start = _start;
-    *delta = _delta;
+
+    if (delta) {
+        *delta = _delta;
+    }
 
     return size;
 }
@@ -230,11 +233,27 @@ static void hvf_log_stop(MemoryListener *listener,
 static void hvf_log_clear(MemoryListener *listener,
                          MemoryRegionSection *section)
 {
+    hwaddr start, size;
+
+    if (!memory_region_is_ram(section->mr) ||
+        memory_region_is_rom(section->mr)) {
+        /* do not consider memory regions which are not directly writeable */
+        return;
+    }
+
+    if (!memory_region_get_dirty_log_mask(section->mr)) {
+        /* the region is not being dirty-tracked */
+        return;
+    }
+
     /*
      * The dirty bits are being cleared.
      * Make the section write-protected again.
      */
-    hvf_set_dirty_tracking(section, 1);
+    size = hvf_align_section(section, &start, NULL);
+    if (size) {
+        hv_vm_protect(start, size, HV_MEMORY_READ | HV_MEMORY_EXEC);
+    }
 }
 
 static void hvf_region_add(MemoryListener *listener,
-- 
2.32.0 (Apple Git-132)


