Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD1F32B9F5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:40:19 +0100 (CET)
Received: from localhost ([::1]:50350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWPy-0004cP-Nc
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWA9-0007N4-3L
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWA7-0000rw-Ch
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HpZXUiaC2c4IcwOvA2cs846pRcaPAAbCPhPXUPapPlg=;
 b=XQXjvRKfrhjgqM3Fj0oFsnIz9RrYiiKZOTSn/Fv539idO3OaS07gmlf5TRC2w+5LcaM0gY
 ZeVKY2v4/5zfMDqaINw8koQb1kQYr+e7V6WrH+FvMSNQxF4Sg12CqARfCUs2iS+z2jrJUO
 ZvHISj5tH8BNi1okzGQ5zWDrzTnujSY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-w38EN_tmOCqeTxyC-NGRLQ-1; Wed, 03 Mar 2021 13:23:51 -0500
X-MC-Unique: w38EN_tmOCqeTxyC-NGRLQ-1
Received: by mail-wm1-f69.google.com with SMTP id n17so2069687wmi.2
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HpZXUiaC2c4IcwOvA2cs846pRcaPAAbCPhPXUPapPlg=;
 b=cATyMqR+swKekPs15qlN0pvq9/XKF2jY0aEXQTN9DSV+SuhwEK6OJh4KeavEw8gnmz
 iZsnm17FQ+6eb0LMi0YL9s4ugksWQ7NLpQJdWkB76PWBlJGpTa8tFm2BYREBi9UHKGTW
 izHPeNbAD5DxJ3fXTqBT+kT36M1tomMKKU3KXe75JXdDAIeULBM4GeU4RQXpsP1Gmiu+
 ya61oe5x2/BqZnJTP/Hme4M+JI0/7j/msciCfD/WenpP4GJiL4dmlEzzfcwP60hdr5U6
 4enPKlvmaNTVvikCmCLqFq4CwxurLru4xdsNYT7LNIZgdnHnDFG3sFyZXu49xg07ilzg
 Azpw==
X-Gm-Message-State: AOAM533zqr9Tq8ccT4Qz5zjwivpHQ9rkCzYSpHJXvA3eLMRKL8WRhxqo
 Q+YB3M8rGS7tfSMRJMXViVWN8hNfSLvASbojW896lDbczlKzng1qNF00F3vH5Weq1lwJJP87Ylw
 VoIMWdYZGj99LN2jh/0Y0uKoPWS9BFqoj4kMyIpcwvR1YOc8TEW5boEieVKwvqZkl
X-Received: by 2002:adf:9bd7:: with SMTP id e23mr38418wrc.48.1614795829874;
 Wed, 03 Mar 2021 10:23:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5Hi2oRgLR+p5+nLOhzpKyBoO9bwdj0rvSDTYuP5mfCGdgF+ImQznX99ey9HDtd42t6mXMIw==
X-Received: by 2002:adf:9bd7:: with SMTP id e23mr38385wrc.48.1614795829618;
 Wed, 03 Mar 2021 10:23:49 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p14sm6718722wmc.30.2021.03.03.10.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:23:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 13/19] accel/kvm: Declare and allocate AccelvCPUState
 struct
Date: Wed,  3 Mar 2021 19:22:13 +0100
Message-Id: <20210303182219.1631042-14-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation of moving KVM-specific fields from CPUState
to the accelerator-specific AccelvCPUState structure, first
declare it empty and allocate it. This will make the following
commits easier to review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/kvm_int.h | 3 +++
 accel/kvm/kvm-all.c      | 5 +++++
 target/s390x/kvm.c       | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index ccb8869f01b..f57be10adde 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -13,6 +13,9 @@
 #include "qemu/accel.h"
 #include "sysemu/kvm.h"
 
+struct AccelvCPUState {
+};
+
 typedef struct KVMSlot
 {
     hwaddr start_addr;
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 8259e89bbaf..4ccd12ea56a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -399,6 +399,7 @@ void kvm_destroy_vcpu(CPUState *cpu)
         error_report("kvm_destroy_vcpu failed");
         exit(EXIT_FAILURE);
     }
+    g_free(cpu->accel_vcpu);
 }
 
 static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
@@ -434,6 +435,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
         goto err;
     }
 
+    cpu->accel_vcpu = g_new(struct AccelvCPUState, 1);
     cpu->kvm_fd = ret;
     cpu->kvm_state = s;
     cpu->vcpu_dirty = true;
@@ -468,6 +470,9 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
                          kvm_arch_vcpu_id(cpu));
     }
 err:
+    if (ret < 0) {
+        g_free(cpu->accel_vcpu);
+    }
     return ret;
 }
 
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index d8ac12dfc11..cf6790b2678 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -2085,7 +2085,7 @@ int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
     int ret;
 
     /* the kvm part might not have been initialized yet */
-    if (CPU(cpu)->kvm_state == NULL) {
+    if (CPU(cpu)->accel_vcpu == NULL) {
         return 0;
     }
 
-- 
2.26.2


