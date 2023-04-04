Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8786D693E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:49:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjjq1-0008UJ-HS; Tue, 04 Apr 2023 12:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjjpv-0008To-Me
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:48:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjjpt-0005Xn-UZ
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680626925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hgiAE1YLOpU3FWZrN9UUfgNy/Hwh+ybTbTST+riGhu8=;
 b=W7o5XVOflTZmXwCTtTEvV10DyIJpx9gcb/EjIC3sbSVxOh6s0Y+nMD3kir1m4Y32B/hKJE
 JAtzgeNfMXpHRTP/kZRphhvpR98H+PQvsdlTfZ/3r3W9sUnL20Jc3uvJ6b2jKToQ3rPVr7
 neygJMSkndg1uCqM2G8N57i+jVCKejY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-NP_wfVbUMjmMSjmm7Ow2rA-1; Tue, 04 Apr 2023 12:48:44 -0400
X-MC-Unique: NP_wfVbUMjmMSjmm7Ow2rA-1
Received: by mail-ed1-f70.google.com with SMTP id
 b18-20020a50b412000000b0050234a3ad75so42344758edh.23
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 09:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680626922; x=1683218922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hgiAE1YLOpU3FWZrN9UUfgNy/Hwh+ybTbTST+riGhu8=;
 b=NJnl6BSNUu2KKjJu8vUeEIyHwPWP0UXm33vWeSq6Aa9ggnSPdbja+YpfkzZlOsTbkL
 1A2Xl67VQGjTMG+qk+PDEz5EaZt+epYgZLmISR80cvq+jG7zGyBtuqD0vyChANrW9GRr
 1R4Kc45Tj+22xitXwS6KHUzqw8udRR8kaOqxoCynC2kmjCSDMq5RrlqCCrpi9S7hIBFp
 8bgrvNv9VZoWksCHVngBHh9wZ4fSxtXJKSELNmz4ja7H3r9BWzLh85f6a1V8kiFT//Vi
 d7/mOMpUWF34lpM/zPrtubJ0y+csb+ai7uf3Y2Y2bmoRSOmL4IPBuof+kf8UlQVlOb6W
 GxCw==
X-Gm-Message-State: AAQBX9fGAmmoNHnepmh2mKTB5/Un5tjKa/EzDf9c6LYEt+7HdVx3W2hz
 pqfQq5lFvt3YyKE5T32Uv3sVS0oVRm2S6FCU6OzB3t9GWprjnCNkp5isHZDpOakIfv7ST0NhMDr
 j4vlFei3VCFvxJ0F9RVE0WwG/Pv8jNo3DvLqvw/cS3v1UYHTPTDY8G0Fq8ly+77HxHEMw9qL7Ve
 k=
X-Received: by 2002:a17:906:1705:b0:91d:9745:407a with SMTP id
 c5-20020a170906170500b0091d9745407amr109970eje.14.1680626922780; 
 Tue, 04 Apr 2023 09:48:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350afm+8B7UBumTQnQP8O4KFkkxIKhA3tmfzjdgas0TTm+h4ZVrI41GPcmw0knkiLIa6phGdh/g==
X-Received: by 2002:a17:906:1705:b0:91d:9745:407a with SMTP id
 c5-20020a170906170500b0091d9745407amr109931eje.14.1680626922386; 
 Tue, 04 Apr 2023 09:48:42 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170906100c00b0093295ea18c4sm6174835ejm.67.2023.04.04.09.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 09:48:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
	Xiaohui Li <xiaohli@redhat.com>
Subject: [PULL 1/1] kvm: dirty-ring: Fix race with vcpu creation
Date: Tue,  4 Apr 2023 18:48:39 +0200
Message-Id: <20230404164839.455941-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404164839.455941-1-pbonzini@redhat.com>
References: <20230404164839.455941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Xu <peterx@redhat.com>

It's possible that we want to reap a dirty ring on a vcpu that is during
creation, because the vcpu is put onto list (CPU_FOREACH visible) before
initialization of the structures.  In this case:

qemu_init_vcpu
    x86_cpu_realizefn
        cpu_exec_realizefn
            cpu_list_add      <---- can be probed by CPU_FOREACH
        qemu_init_vcpu
            cpus_accel->create_vcpu_thread(cpu);
                kvm_init_vcpu
                    map kvm_dirty_gfns  <--- kvm_dirty_gfns valid

Don't try to reap dirty ring on vcpus during creation or it'll crash.

Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2124756
Reported-by: Xiaohui Li <xiaohli@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <1d14deb6684bcb7de1c9633c5bd21113988cc698.1676563222.git.huangy81@chinatelecom.cn>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f2a6ea6a68a2..cf3a88d90e92 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -685,6 +685,15 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
     uint32_t ring_size = s->kvm_dirty_ring_size;
     uint32_t count = 0, fetch = cpu->kvm_fetch_index;
 
+    /*
+     * It's possible that we race with vcpu creation code where the vcpu is
+     * put onto the vcpus list but not yet initialized the dirty ring
+     * structures.  If so, skip it.
+     */
+    if (!cpu->created) {
+        return 0;
+    }
+
     assert(dirty_gfns && ring_size);
     trace_kvm_dirty_ring_reap_vcpu(cpu->cpu_index);
 
-- 
2.39.2


