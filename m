Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797D12ECDBE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:27:00 +0100 (CET)
Received: from localhost ([::1]:57430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSVP-0007mg-E8
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSOe-00087N-Ra
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:20:00 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSOS-00054j-OY
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:19:58 -0500
Received: by mail-pg1-x52e.google.com with SMTP id q7so2624089pgm.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 02:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f4d6+/fiHcHh6WBlQoqouCJtUMFkdB+MaBZ1d0g9sEA=;
 b=rXbBs65ClOcsCBxasIZ4uqJ8d+AlrpUc5xKnW4pDh/do7QsPRQNcfMVITX0mJEskk3
 16OqaLXZLS7bpFQFFrdQhI9MU+lgZLhKltqHygI6rzjkZ5prHMFHxAfvxw7/d3I726sl
 cwqZga6lZXy1LNfCEvVtSRaK8vecvQr9SwVWzjpvAqidGXH4PzfWrwqpHmWHxeZaaGVz
 TEzotjjsn2gV3+pNx+zM2+Ut1KJ3izEhh+xq1T5gZnKF4zSNgANsGKBSE196DmszFiQF
 9gIcD+nD2B71L8/praYLSASBvOUWS3j39DXuI3MOeLAZmbZHmw32gHixQoPGnqTIMmRc
 aWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f4d6+/fiHcHh6WBlQoqouCJtUMFkdB+MaBZ1d0g9sEA=;
 b=KzfoWRvmR0rh0dJjfLLycT7tABwZQBuCwMosNMdRlFcfVGw1ZSMCadPVbKrMuEZOQc
 jRjsfyOauB4SVMl/HXgrHRfOafrHZWcjj1HB0I/AubudqIQabkncVnKjDmSehCLGrvGF
 /reywGz2W4XCN9Vgy+oqGQ4Xr7jXZ10/tTn0xxeUr6grKqlKjgXXIKEUzd0+17typAS4
 b5l4mbPUwOefdSMygwtLYfq0WKMDe+Lukd0FrGDcBSh1kZ4KWy5T8TwBQ8Ea+qwNSraR
 V5UY6wUVS/UOYcCJZY5csqA5i7m3wZT9bDfGHelukD98OGEJFEk36hTAYdKqPmtlouSn
 FJMg==
X-Gm-Message-State: AOAM530nHU6AfPqV6c2r8vFevatFc3d/y9Wd1OGDRNTziyzPG/WsBSpR
 xwcyW4vrMR/IuvmcxDfzxJ5VK31Owpu4jknT
X-Google-Smtp-Source: ABdhPJxD0kVQbzDANMRkzVx0GC8RZEEMHUVhU2RTa31j1Xvsnlm7fkpGPIFBJpnrQuaxC9yz1yxZYA==
X-Received: by 2002:a63:4b5c:: with SMTP id k28mr1164924pgl.294.1610014786515; 
 Thu, 07 Jan 2021 02:19:46 -0800 (PST)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id s5sm4934662pju.9.2021.01.07.02.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:19:45 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] whpx: move whpx_lapic_state from header to c file
Date: Thu,  7 Jan 2021 02:19:19 -0800
Message-Id: <20210107101919.80-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
In-Reply-To: <20210107101919.80-1-luoyonggang@gmail.com>
References: <20210107101919.80-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This struct only used in whpx-apic.c, there is no need
expose it in whpx.h.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/sysemu/whpx.h        | 7 -------
 target/i386/whpx/whpx-apic.c | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
index 4f38784d7e..bfbcaa25d8 100644
--- a/include/sysemu/whpx.h
+++ b/include/sysemu/whpx.h
@@ -25,13 +25,6 @@ struct whpx_state {
     bool apic_in_platform;
 };
 
-struct whpx_lapic_state {
-    struct {
-        uint32_t data;
-        uint32_t padding[3];
-    } fields[256];
-};
-
 extern struct whpx_state whpx_global;
 int whpx_enabled(void);
 
diff --git a/target/i386/whpx/whpx-apic.c b/target/i386/whpx/whpx-apic.c
index b127a3cb8a..dd60fb0996 100644
--- a/target/i386/whpx/whpx-apic.c
+++ b/target/i386/whpx/whpx-apic.c
@@ -20,6 +20,13 @@
 #include "sysemu/whpx.h"
 #include "whp-dispatch.h"
 
+struct whpx_lapic_state {
+    struct {
+        uint32_t data;
+        uint32_t padding[3];
+    } fields[256];
+};
+
 static void whpx_put_apic_state(APICCommonState *s,
                                 struct whpx_lapic_state *kapic)
 {
-- 
2.29.2.windows.3


