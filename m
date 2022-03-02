Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C20514CA642
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:46:38 +0100 (CET)
Received: from localhost ([::1]:41992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPJN-0002de-Sv
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:46:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO4N-0001xB-U5
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:27:03 -0500
Received: from [2607:f8b0:4864:20::633] (port=37745
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO4M-0000kP-C2
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:27:03 -0500
Received: by mail-pl1-x633.google.com with SMTP id n15so1427811plf.4
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FU0IylXrpCykU8A5fU0ogXV82XSWWHTLV5WNe7DNXpk=;
 b=lJcPnsMPj8Mr3q/omPtYciAmlxgIDGAsT+jBrPoeN+Br/vgzLpGXjWgpJhM1cOiWyI
 cEyoqtFuSdj0v11h1cYTq+AMybQ1NeNURQC4VnqFZbvLRz2vErx4SMmjofpejfPpasXM
 wFPBRHxCL6EhnOq3dqkpdlTc1JnBcVylKMvDO3U3LByJH1IuQskNJkJikD2izLpWYxYH
 f9u72+Ane5x4nwW5U4TOnt3XwdHcjr4jB+Cw2XoZ/9H2Q68sMlcP/gkirO1RAtKVs1Ke
 eftrrkFwJ9dpPsVSGtxXlFRTkh2mjOXfDdh8G6Z8D+7LBeuKWFS0U+I1DFkhniU0ZsEt
 wDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FU0IylXrpCykU8A5fU0ogXV82XSWWHTLV5WNe7DNXpk=;
 b=YWoV48mrcM+TQpQXGaD4ovA9mtVlcr1/e5impvFjG37NPHGlLu+muw60m8XYJ+Fahs
 8VWrq6MpNSa1Oi2Ufn0z7mnyc45NNwsZc22XirPEWbHXojZppXbk7Km4zeUIr6MQ4u+S
 xyXhHrFtEcfJxJusTffpUBPwi8yL55R1aUmyWGnlEfkDthceuJnF+zTfpRzD96/fj3I5
 uKKjdIfixPYWgqAPfp3uKGu4P61HoxKPP+o+XO+FPZECJyH99ZeL1xjP3ehJGxz7T3IA
 YLMd7iR5/40IMqJUayx9cIplRhQhjE/XF0L9qk/lNapdpeNbXztdpOJEJwoCvpwn2PgV
 t4jQ==
X-Gm-Message-State: AOAM532sEtVU1XgGKKBFy45m8rfsxFJ/emmk1zck1Aroxr0uD1fRvdxw
 C2F/JLDKqdheAwNHyrtFlUi59R22EbWLpg==
X-Google-Smtp-Source: ABdhPJx0inuo4yz5c4MCI65kUsIHfiwBoLS/vguvDPMKssLEgZjavwnoBGKj4RuUz+xZvfYH7ec1MQ==
X-Received: by 2002:a17:902:b602:b0:14f:e42b:d547 with SMTP id
 b2-20020a170902b60200b0014fe42bd547mr30874569pls.91.1646224020728; 
 Wed, 02 Mar 2022 04:27:00 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001bedddf2000sm4912971pjb.14.2022.03.02.04.26.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 04:27:00 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 9/9] hvf: remove the need to lookup memory slots when
 clearing dirty-bits
Date: Wed,  2 Mar 2022 20:26:11 +0800
Message-Id: <20220302122611.15237-10-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220302122611.15237-1-ubzeme@gmail.com>
References: <20220302122611.15237-1-ubzeme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=ubzeme@gmail.com; helo=mail-pl1-x633.google.com
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
 accel/hvf/hvf-mem.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index b215386bc8..7a588b70e1 100644
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
@@ -229,11 +232,21 @@ static void hvf_log_stop(MemoryListener *listener,
 static void hvf_log_clear(MemoryListener *listener,
                          MemoryRegionSection *section)
 {
+    hwaddr start, size;
+
+    if (!memory_region_is_ram(section->mr) || memory_region_is_rom(section)) {
+        /* do not consider memory regions which are not directly writeable */
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


