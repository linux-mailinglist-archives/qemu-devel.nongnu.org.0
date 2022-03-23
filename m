Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CED4E576C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:26:32 +0100 (CET)
Received: from localhost ([::1]:43908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4kh-0000lk-3I
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:26:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4ds-00058X-7g
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:19:28 -0400
Received: from [2607:f8b0:4864:20::433] (port=42877
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4dq-0004gL-PC
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:19:27 -0400
Received: by mail-pf1-x433.google.com with SMTP id g19so1969161pfc.9
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDaNpZGuS1pck7ljrYFEMbUPV6qyv4FTweWO+b6dthQ=;
 b=T/qLqQeIJbWYsc9iaC9cBJMrxMVXpFG/QUiJyPoZd2LdVpzgu4IXrjsjtgh7JucAvy
 K7XpwsgzEr4aysFsdfXZmw3r4NYiJ3DWcc8JZSOA6Tl3BokPzJQNj2so5OQV1hh6HwEd
 K1QxKLSW49T2dyO8ay7JL+g882pp7zrdo93r7w/Lf9Ytie2vCQEYjBetUSMwG2E36vDl
 O1T8FHb+t6UP2pO29Px3c/CN3Z5Qpup501aDNB/0R3S7yzRNJBBBqU6RsNi2V43JnUir
 +2yzv/A6XJFzT3jeRvNmug8zR6Gv0G3QKmEJL2xM7jyr2axrPlstTpbbBI6cVPxAa6d7
 uTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qDaNpZGuS1pck7ljrYFEMbUPV6qyv4FTweWO+b6dthQ=;
 b=3qO3MJ/KyoinwAf1Juwz4OV/whm+MCYfi9iXrZL5ksyICBbEjaQoOVS6FRSgtEvQtH
 1KaJGXWQg5+TuP5m7jvfZ9nwBTsPSymMj1HU+PMcGcuJ1kPaXqT4qxB/lGg7HMSRffqy
 WI2Oacont+7TML3ioXHI+H6O1EdksNXEEj/eozpHbGWJOXLMMxZN3Ay+1ZaDKW4lF2YM
 5k01xT2ZIu+SBU9V9gXM+HE+Vn68l/gReLt86QCw3UYHWjjvO16MblWyAlMr4mTemm06
 dUZCjt2Y1gFxF92X1d+Tvzkmk+pSiieO4UHo9W5wP75HXPPCAn6kTiyxmoAGZUavbGyV
 XFQg==
X-Gm-Message-State: AOAM532XeuoSjH4Qf2DgGpwfMB/TX8xeTfrJidNtL5JzYiPpfOyuIiB9
 Nk1lQJNHuLyQNs4qOXg6cO7ljTQ7Ru8=
X-Google-Smtp-Source: ABdhPJysELA1SacEi6NLWr6VDuEztyIdr+gkkW330J+PSAAiBOd3a1EdmuP7lIO3WbruDTaR69cscQ==
X-Received: by 2002:a63:cf09:0:b0:372:d564:8024 with SMTP id
 j9-20020a63cf09000000b00372d5648024mr705074pgg.251.1648055965298; 
 Wed, 23 Mar 2022 10:19:25 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 a24-20020a637f18000000b003821e17819csm354438pgd.61.2022.03.23.10.19.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:19:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/13] accel-ops: Introduce create_vcpu_thread_precheck /
 postcheck handlers
Date: Wed, 23 Mar 2022 18:17:45 +0100
Message-Id: <20220323171751.78612-8-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
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
Cc: Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 David Hildenbrand <david@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Introduce precheck/postcheck handlers which will help to
refactor code common to the various create_vcpu_thread()
implementations.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/accel-ops.h | 4 ++++
 softmmu/cpus.c             | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 6013c9444c..26b542d35c 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -31,6 +31,10 @@ struct AccelOpsClass {
     bool (*cpus_are_resettable)(void);
 
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
+    /* If non-NULL, return whether common vCPU thread must be created */
+    bool (*create_vcpu_thread_precheck)(CPUState *cpu);
+    void (*create_vcpu_thread_postcheck)(CPUState *cpu);
+
     void (*kick_vcpu_thread)(CPUState *cpu);
     bool (*cpu_thread_is_idle)(CPUState *cpu);
 
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7b75bb66d5..857e2081ba 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -637,7 +637,13 @@ void qemu_init_vcpu(CPUState *cpu)
 
     /* accelerators all implement the AccelOpsClass */
     g_assert(cpus_accel != NULL && cpus_accel->create_vcpu_thread != NULL);
-    cpus_accel->create_vcpu_thread(cpu);
+    if (cpus_accel->create_vcpu_thread_precheck == NULL
+            || cpus_accel->create_vcpu_thread_precheck(cpu)) {
+        cpus_accel->create_vcpu_thread(cpu);
+    }
+    if (cpus_accel->create_vcpu_thread_postcheck) {
+        cpus_accel->create_vcpu_thread_postcheck(cpu);
+    }
 
     while (!cpu->created) {
         qemu_cond_wait(&qemu_cpu_cond, &qemu_global_mutex);
-- 
2.35.1


