Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145A04E576A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:26:13 +0100 (CET)
Received: from localhost ([::1]:43048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4kO-00008b-4Y
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:26:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4eR-0006dF-P3
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:20:03 -0400
Received: from [2607:f8b0:4864:20::1031] (port=53029
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4eQ-0004lI-3J
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:20:03 -0400
Received: by mail-pj1-x1031.google.com with SMTP id v4so2381164pjh.2
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f+HL4Abo/9emIoVYr4nPcZWANTfk8HbxwtFhwWh4T4E=;
 b=R38CVVHJgH8kHmGn0ZOyhoWZ33CV6mzkknIiqbfMkEd3nlYmXum5LYE5EuR9nOh5dV
 4p+1F+9RocXuE6X/etkgzAlBdiSWWmatjKQnx2IG0DXq/5XQUfkek0cJmgKz3CvRAv+Q
 ZEQD4UjM+CuFPFnvkD7N3P9I3mXgm6KY1NLl24qU0ZpnRER1x6XTt68YoiVIlyjwivDY
 O6oJvDcjzbgtgV5VVYi1YxOK5p8sfe9NSUl24zEhnSJ+u/RzIPghmhV5VRqXDLHTZfDz
 1fSHXii1iS47EJJoenarBJh84GnRVtK24aTa2pye2VI1SSKFMWmBWKuqZTE/MxejwKcS
 YLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f+HL4Abo/9emIoVYr4nPcZWANTfk8HbxwtFhwWh4T4E=;
 b=EtPb4GFcQd+5imaEc+xD2zLhMxfutPm06udDGP83WVqhwnfYUV2l2KkCa4Sf5Vzm8G
 kGJwtH/vNhOpqyTq7H/aUbpbD4YCvgX5fhJLNbqeoWzNNm2ExCAJxtCXnwTeTglR6IZC
 7bknDQobLxyPKe7hbjd1VMuRSMaeTmCI+BSPFlRtvH+k6WYbAU3mwKA/F2AN6FIeH01r
 CKUGySIB6OqncdMNI2swedOLyJW99niZXHy4oWMCmBB8HMwedkyZ2w3EMvN93849Yh6t
 TlCF3uPADFGQlkql7F9/hJLPdpK05N+KcgXDnroGIcwvsBgAJiUAX0RwjqHWwcLy8XpG
 vZHA==
X-Gm-Message-State: AOAM533TbjOB8Snh1HSkQ1/p+sJoOTwBXRRZ2gh0XBdZ57oton52wpKH
 0JqT7woU7APhSZn2xKtE19zq3n0TUko=
X-Google-Smtp-Source: ABdhPJwUGIANIvoDBDf1d6wuhMbglFjfjHX2yL7VBu0eJlXm38w4pEE/zj+JRqSDdW4aqPv9Y3LI/A==
X-Received: by 2002:a17:90a:8d85:b0:1b8:a215:e3e4 with SMTP id
 d5-20020a17090a8d8500b001b8a215e3e4mr12881119pjo.175.1648056000652; 
 Wed, 23 Mar 2022 10:20:00 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 oo17-20020a17090b1c9100b001bf0ccc59c2sm7189967pjb.16.2022.03.23.10.19.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:20:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/13] accel-ops: Introduce common_vcpu_thread_destroy()
 and .precheck handler
Date: Wed, 23 Mar 2022 18:17:48 +0100
Message-Id: <20220323171751.78612-11-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
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

Introduce an empty common_vcpu_thread_destroy() function, and
provide a AccelOpsClass::destroy_vcpu_thread_precheck() callback
so accelerators can choose whether to call common_vcpu_thread_destroy.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/accel-ops.h | 2 ++
 softmmu/cpus.c             | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index caf337f61f..b47f6de3f9 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -35,6 +35,8 @@ struct AccelOpsClass {
     /* If non-NULL, return whether common vCPU thread must be created */
     bool (*create_vcpu_thread_precheck)(CPUState *cpu);
     void (*create_vcpu_thread_postcheck)(CPUState *cpu);
+    /* If non-NULL, return whether common vCPU thread must be destroyed */
+    bool (*destroy_vcpu_thread_precheck)(CPUState *cpu);
 
     void (*kick_vcpu_thread)(CPUState *cpu);
     bool (*cpu_thread_is_idle)(CPUState *cpu);
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index cf430ac486..37325b3b8d 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -617,6 +617,10 @@ static void common_vcpu_thread_create(CPUState *cpu)
 #endif
 }
 
+static void common_vcpu_thread_destroy(CPUState *cpu)
+{
+}
+
 void cpu_remove_sync(CPUState *cpu)
 {
     cpu->stop = true;
@@ -625,6 +629,11 @@ void cpu_remove_sync(CPUState *cpu)
     qemu_mutex_unlock_iothread();
     qemu_thread_join(cpu->thread);
     qemu_mutex_lock_iothread();
+
+    if (cpus_accel->destroy_vcpu_thread_precheck == NULL
+            || cpus_accel->destroy_vcpu_thread_precheck(cpu)) {
+        common_vcpu_thread_destroy(cpu);
+    }
 }
 
 void cpus_register_accel(const AccelOpsClass *ops)
-- 
2.35.1


