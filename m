Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6812F3D05D8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:49:19 +0200 (CEST)
Received: from localhost ([::1]:60104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zUE-0005Be-Ew
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFx-0004HQ-Vu
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFw-0001hv-Cs
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:33 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so2405777wmb.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wGyzsMcwyPdU32aTj0BzS3yJV+u0+Pq22bBiQhu0jRI=;
 b=dFuRuljkEPQpaWZK9pz+WuGQfxnI+kDOy5VwWvOc5bP+03MBXqVr7ryjWqLmX1xdmu
 P7gM6sFHlMNi8Oy2lQB3lTTC/koSgbBIYwkU//k8SjsOr/aOIUVyGPpEEhgl9dbQF130
 CQcnacaD8blhvUUpHfcxQZPgi3/+znIVLfO8n/GGOWZvW7DbKKlwJAx8TsjaHJyiRz/R
 6Td7ZpweUPsn40Asz3E1S3eP0P2QAru7WVQwFnGCSg1Zk47YO9pW69lUmaqKQYSS4AGv
 Kq25xH3xFmUunY6juLcanVwQg4bSTiT8C43fFneruEldH7A+qAiojqMLLUG8V6IVP5aN
 eLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wGyzsMcwyPdU32aTj0BzS3yJV+u0+Pq22bBiQhu0jRI=;
 b=VeQ8lNc8v3+LuFVYXHQ0Q4hjnMG9lK0Wup6qLnTOFc4iBoNEjeR4eT5gf6yVXoJ/s1
 AzosCBDtsOkRr4fIOoNTtOXFzEiCO332lNkVmHVTJSfeNicG7bb4ayEIgItI8kxI8On6
 NMmArPcnP2YlpXE/cBK6tq7eRpqlanZdT25QT6/KJ6xQrajYafO/0V6pmYZ87rGbF2Ek
 X8uio7ixi6mp470bOjcrVn84XCnnwEfrWyOjumPJMur3c6YRjvuZRk1kBQuJT0jbhGQ5
 h4r0DGKHI0tt/TSKaQ92c3iwsOPWNiVMPa0Bh9YyJgKzbBWnmLUVeonrE0iBPSsexIo0
 YQ6Q==
X-Gm-Message-State: AOAM533x0lqt0TQf1cv0nIaJAwrX2yEyL4LAoCf3Q6JrMC0VnEc2Xs+M
 e6/relzMUwjV7OAn6eyXKhROKw==
X-Google-Smtp-Source: ABdhPJzWcCOJvvX0O7K4YjNOCEA6sRu4yXDsQgN0LuqfdwCJxh752rUNi53kMSUIjrQATL4Omv+aVw==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr987664wmb.82.1626824071075;
 Tue, 20 Jul 2021 16:34:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e8sm3354295wrc.6.2021.07.20.16.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:34:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DDC841FFAB;
 Wed, 21 Jul 2021 00:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 22/29] plugins/cache: limited the scope of a mutex lock
Date: Wed, 21 Jul 2021 00:26:56 +0100
Message-Id: <20210720232703.10650-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

It's not necessary to lock the address translation portion of the
vcpu_mem_access callback.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210714172151.8494-3-ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/cache.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 4a71602639..695fb969dc 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -355,15 +355,14 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     struct qemu_plugin_hwaddr *hwaddr;
     InsnData *insn;
 
-    g_mutex_lock(&mtx);
     hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
     if (hwaddr && qemu_plugin_hwaddr_is_io(hwaddr)) {
-        g_mutex_unlock(&mtx);
         return;
     }
 
     effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : vaddr;
 
+    g_mutex_lock(&mtx);
     if (!access_cache(dcache, effective_addr)) {
         insn = (InsnData *) userdata;
         insn->dmisses++;
-- 
2.32.0.264.g75ae10bc75


