Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B635ECA89
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:10:32 +0200 (CEST)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odE6J-0006lB-FR
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1odCna-0004FH-Aj
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:47:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1odCnY-0007tZ-4x
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 11:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664293618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QpqAfBvGkRAklWMKhtJHzZTkv08jdhvFbTPhM4ppGBU=;
 b=U4F0MwvffYGRw5nw/E76XZ+9AvIbPbvGkrj/WY+jQp/2IGGyqMFnoB2AmH5O3Ifhk7JxE0
 ZDU65wG2K7TwUC0APyW5MklNh1zgi2DGovOXGRHNmmNrPniSbBQJG3nyYnXp2FJFQEy/7A
 cnwtaik49H+DT8KZn1CU62wXscfpxLg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-170-OclVrkAHMQ-dwrF-Xzbq5A-1; Tue, 27 Sep 2022 11:46:57 -0400
X-MC-Unique: OclVrkAHMQ-dwrF-Xzbq5A-1
Received: by mail-qk1-f197.google.com with SMTP id
 de16-20020a05620a371000b006ceb92bc740so7626056qkb.15
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 08:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=QpqAfBvGkRAklWMKhtJHzZTkv08jdhvFbTPhM4ppGBU=;
 b=va66JPqBKtXJXkY9fk+MBoKvl3yOm5LP0q5zF+tovCi33QKMo/Vol0xYd7hbictwOD
 foFTQbARha7skbdAVxG9/4wzQOlnsOrfI3brmYJ+ZOr+vHkAnfoGSXvIjqu0TZii1eMp
 ayEdmXInvz61Eqlc2jKd1gsSq80bKuD/CmwIVXeBhwOOg0lkScH1ZZzw+UB3oCL0WXc0
 wFqHFNW8PfZ1aqkkdmVoDAIlcvBMY5tK4GFbvF+MCRpz+HBmnKdvxQMgGYpaOLw224YN
 5aCdB3zlA3an4/DDo6vBG4Gj82MEV1Cm2OZoenQEii866dqJOHi2MFYgk48qAqGrvs4D
 d6Uw==
X-Gm-Message-State: ACrzQf1yB1V/YwMDz3YQhoD9ePrjjcBmqJDOCk7Z4rmL2XsJ/F6Fkh1g
 fI184JhLQR72kKLG4mSUF4wbLFan/Yv18pq8Ef/0ggqC/LKnlfNgQptq60iECcXoCqM1Asyi18L
 EIM+JGutHq5Jl/uRifDdKeW1byPIjAxgzVOwxbG5uOTC54s9AhXQI9ryvmooMG7PM
X-Received: by 2002:ac8:590a:0:b0:35b:b323:8017 with SMTP id
 10-20020ac8590a000000b0035bb3238017mr22916023qty.369.1664293616217; 
 Tue, 27 Sep 2022 08:46:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM445xf0+YA0a4r6H7k1jRPZcqSShMtI9XVivCIn6JbGK88NGqrKTCC5Iy1ccdZBNIOMrz93eA==
X-Received: by 2002:ac8:590a:0:b0:35b:b323:8017 with SMTP id
 10-20020ac8590a000000b0035bb3238017mr22915989qty.369.1664293615924; 
 Tue, 27 Sep 2022 08:46:55 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 k21-20020ac81415000000b003436103df40sm1019185qtj.8.2022.09.27.08.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 08:46:55 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 peterx@redhat.com, Xiaohui Li <xiaohli@redhat.com>
Subject: [PATCH] kvm: dirty-ring: Fix race with vcpu creation
Date: Tue, 27 Sep 2022 11:46:53 -0400
Message-Id: <20220927154653.77296-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 accel/kvm/kvm-all.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 5acab1767f..df5fabd3a8 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -757,6 +757,15 @@ static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
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
2.37.3


