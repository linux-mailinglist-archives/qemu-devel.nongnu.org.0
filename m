Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832342ECA36
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 06:41:37 +0100 (CET)
Received: from localhost ([::1]:54832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxO3E-0006If-Gn
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 00:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxO0Y-0004aW-P5
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:38:50 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxO0X-00080Y-B0
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:38:50 -0500
Received: by mail-pj1-x102e.google.com with SMTP id l23so3078168pjg.1
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 21:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yh+R1Q3BWehjFsM76P4iILDkqeXMByWSAKoRDc0U9rE=;
 b=n1TfNbhWMXqyt/NoANqhes97IcUHQ5u1MlIbo5h+oddl11DhlbAuh4JVgwfRyjVWrr
 lwNq52EnmghakXiKXUHF9iWbKfe6Kp66bMd1b28yK53mWFirRboizuUTqeyz54zKgj5n
 v/HVe1inAeikI4Vor6p+I21UIxnu5NKvXUcTdFFtkCEa+0H9uOxpNuFS3r1Ih0QsyS55
 Zj6tXZjn4CbSSAxXe6wFvIjUYrBpYhyqxiHqlajtwlNc0qrGRy4WRLnSCaIAYKvExVdZ
 bxUvXpgdirxnUaRtj0xc5klWZXYRR1uBI9IC93SUNusI/PErVQwsV35W+lCqITtdbqLW
 xyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yh+R1Q3BWehjFsM76P4iILDkqeXMByWSAKoRDc0U9rE=;
 b=iFja3pMRvww3rXNxUdWvbLJINqFoZ6FabvYMgab1D7qYef3QVAeH4aNMCGuIqyJ0nd
 aejvurVqTtIWBT70nKohbIdPAHP0FzE+AIx2GOghG/nrHjY3YlawBR+q7D5Omr/x8+BZ
 SmVH6ctyYM8D9cerbypxodFVeYLDYqd9InKUX1RckMEt3xQ3j6Q5gXiKuobilJg3bh7z
 yXMN8ZuqR9umompd3btUNZKoRJhEYQe/fTjU9Vq8uDEjSs99BbSMfhehJYR28H9Mi1gN
 YOW93Usbm2tnN5djlsjIJpCSXU3sYfIqf7yz0eZOtCJ6UvZd9w6aVIIOKs58/9rSn33g
 Satw==
X-Gm-Message-State: AOAM531NuXgpyydqK4p7eUC+TwLQP1ht9zltEO+JgkT5eb9R8vu9JgN1
 yier/U2f+VX3wHmRTQ6cwwJVu6Lgys0vYBnZ
X-Google-Smtp-Source: ABdhPJznYu5TReJO7VcaKC7mF3qM9+b/be8m7WKh48xH6kunQJeyYkGMHEPdIPK8EAR+WPBAnOhcaQ==
X-Received: by 2002:a17:90a:bf88:: with SMTP id
 d8mr7917093pjs.124.1609997927729; 
 Wed, 06 Jan 2021 21:38:47 -0800 (PST)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id y6sm7660091pjl.0.2021.01.06.21.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 21:38:47 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] whpx: Fixes include of whp-dispatch.h in whpx.h
Date: Wed,  6 Jan 2021 21:38:24 -0800
Message-Id: <20210107053825.2010-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
In-Reply-To: <20210107053825.2010-1-luoyonggang@gmail.com>
References: <20210107053825.2010-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/sysemu/whpx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
index 9346fd92e9..0e6c9faaf6 100644
--- a/include/sysemu/whpx.h
+++ b/include/sysemu/whpx.h
@@ -15,7 +15,7 @@
 
 #ifdef CONFIG_WHPX
 
-#include "whp-dispatch.h"
+#include "target/i386/whpx/whp-dispatch.h"
 
 struct whpx_state {
     uint64_t mem_quota;
-- 
2.29.2.windows.3


