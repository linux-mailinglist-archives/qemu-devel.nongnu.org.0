Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D04280451
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 18:53:58 +0200 (CEST)
Received: from localhost ([::1]:52300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kO1q9-00011V-HG
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 12:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kO1Xo-0005Ty-AK
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 12:35:00 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:36119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kO1Xm-0004Xu-Mo
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 12:35:00 -0400
Received: by mail-pf1-x441.google.com with SMTP id d9so5047030pfd.3
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 09:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EBxW4luOkzYiyvuhOjCfOqocmYLMNy1Q+gLL07TewwM=;
 b=TzgMjg0aSxxMQRMcXg6rLCe53ki0n2lo41HqcFzFXFaBlpVDv+AS/ZqyjZy5nn+93Z
 OeEZ9jycxqxr2jNgGWjJXo2l+tbHaLZaYRY9snUCZG/jfWq6H+v47qEkNztrFtU3giCq
 BPdGILC8tGUtrKhuoMt7/9D0Jcgjxe/CtzynG7oe0o47K2zYqGHzzci+VEYYpLpNwZHh
 bAtYrWbx5/XbHgKZuchWQADZhSy9Zfz/99RY+nXcOBl2+dmIrLRpu0pc3RA4K4CnjfMN
 3ETIon7m75Kx4oa6ASA4adnEvRsAE42tFbI2kxEqC4rMqNUSGBnEtgW9I5PNXrAH8lnP
 KWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EBxW4luOkzYiyvuhOjCfOqocmYLMNy1Q+gLL07TewwM=;
 b=h0zhax0ZUVcwaLycmlxqcBcDX3pjpFWeXp51TaFmNz0k9gmFr5CbiEXVuaWV0hbkM2
 tZrWY07zF+iJKWufArWPJULS+DYuWR3UZuBfK0vUe1gLS6GvAl7HFb/OqsZf9EHll0uK
 tasyIb6Yg2mI7Uq4Krbp62HP22pwEEmKykrR5+C137m2za/dUV+8Q24Cz5NYWnAmn7sA
 zyii+9vCxqBo7JTkH1iJI9J5jgyKqUtCkjKBUAy3/yCkaPCDYMKxUAxFmGCyWr1nq/Q3
 1oHmZZffIh0Ecw0Co8A+6ffDdq9ItErOgn9WrhdzLZAoLJ5LIngQttb1BNfAUmnHet7n
 lkfw==
X-Gm-Message-State: AOAM533yI92ieFH2hLmq5i9mwEHP/2vigkZo7L6pP9e0DRcR5Qc+Z+1a
 bnkDcN05MlK6Q+U5X8LKt8hphNPInG4mCQ==
X-Google-Smtp-Source: ABdhPJzCS2K9wFnSW57vQDz1135NZsGIE2R6yGTbUlwUNl8ennHFYGGMx64uFYENzhm0nKHxRFR9ww==
X-Received: by 2002:a62:3585:0:b029:142:2501:3985 with SMTP id
 c127-20020a6235850000b029014225013985mr8368550pfa.74.1601570097058; 
 Thu, 01 Oct 2020 09:34:57 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id t12sm6946028pfh.73.2020.10.01.09.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 09:34:56 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/6] plugin: getting qemu_plugin_get_hwaddr only expose one
 function prototype
Date: Fri,  2 Oct 2020 00:34:28 +0800
Message-Id: <20201001163429.1348-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201001163429.1348-1-luoyonggang@gmail.com>
References: <20201001163429.1348-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is used for counting how much function are export to qemu plugin.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 plugins/api.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/plugins/api.c b/plugins/api.c
index f16922ca8b..d325084385 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -252,10 +252,12 @@ bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info)
 
 #ifdef CONFIG_SOFTMMU
 static __thread struct qemu_plugin_hwaddr hwaddr_info;
+#endif
 
 struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
                                                   uint64_t vaddr)
 {
+#ifdef CONFIG_SOFTMMU
     CPUState *cpu = current_cpu;
     unsigned int mmu_idx = info >> TRACE_MEM_MMU_SHIFT;
     hwaddr_info.is_store = info & TRACE_MEM_ST;
@@ -267,14 +269,10 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
     }
 
     return &hwaddr_info;
-}
 #else
-struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
-                                                  uint64_t vaddr)
-{
     return NULL;
-}
 #endif
+}
 
 bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr)
 {
-- 
2.28.0.windows.1


