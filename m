Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A85F2EF642
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:12:12 +0100 (CET)
Received: from localhost ([::1]:33668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvJ5-00081L-28
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyi-0008P4-AJ
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kxuyf-0005b0-Ne
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610124665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cq278E7t9jKibHnaozTkidZOgPVwKtZqvYaNSgg6NcQ=;
 b=arVtS5T1B3bUMhQSXR8jo/RErP1sO9pX03mCMH/L//nrCPtD4sFJllOOlKturDl8/YBU8h
 GmxfJCgsObTzJZUPg8AoshEUX2GaM/Y3NksC5uXoIjAW/TQKvTrYWLakK2pHJBPu0mCs4b
 89oMZemO1jtVOHkmufge6SBXLolTkcQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-LIKFhLjxOAeGWw7RICsVKA-1; Fri, 08 Jan 2021 11:51:03 -0500
X-MC-Unique: LIKFhLjxOAeGWw7RICsVKA-1
Received: by mail-qk1-f197.google.com with SMTP id g4so9712623qko.23
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cq278E7t9jKibHnaozTkidZOgPVwKtZqvYaNSgg6NcQ=;
 b=Z0tEXsDD53AaUEaZAXERmFqFFwKTmP/ke5FzIyMMjvIwodrxZ8SrG3trqJ/vZjvvk4
 VA8xvvb2/oVRjAuaQo8QP09XrBVo8Yn/u+VLuijQQVsY9tcEbQGTpRqyF3q/1b5ajWgP
 lPfR0L3hg0Oz1xw12CJVi9UA2hFsqSoQyHMCpjj5AvNiSsM/88msI9syKdH7av6pwjOs
 JBtesfdFmQ8dZyUkowU3XcKoYqw3sGo8llin80v/3DNN20HgQnpw5vf8BGlOt7ptwhXI
 UAG3/3yyKxZpuVUKL+HUFUJbOFOsZSuPThq2BEsJQS2dsC0VWLdVH5udLZZWYhGPJaxA
 JCXg==
X-Gm-Message-State: AOAM533vuop+6dOH2F7VqzMqR5HG996a1eoN/ghFxPtiXCoEpmDFhY0m
 hn9G768F/QZv2FW+p+I3z1B0Q/e5aF8DHsOAKlivfiT3Sx8C2B6AdPkloZYr4xPeGOz9RcA8bwT
 Ri2l6QeJFwjN2NTL/EW5V1e0wCwhqnk75C+9Mpc0w5jOskYhOjoHMjAjdd+3VFxZm
X-Received: by 2002:a05:620a:1256:: with SMTP id
 a22mr4730067qkl.484.1610124663075; 
 Fri, 08 Jan 2021 08:51:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7/erfRl033iUfiz0irk/IszQLzDYnvZ0F7SdMuBekKb+Igvjw/IP6WWKjS0KfcXzlqzXUdw==
X-Received: by 2002:a05:620a:1256:: with SMTP id
 a22mr4730041qkl.484.1610124662776; 
 Fri, 08 Jan 2021 08:51:02 -0800 (PST)
Received: from xz-x1.redhat.com ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id n5sm4954064qkh.126.2021.01.08.08.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:51:01 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/13] KVM: Disable manual dirty log when dirty ring enabled
Date: Fri,  8 Jan 2021 11:50:49 -0500
Message-Id: <20210108165050.406906-9-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210108165050.406906-1-peterx@redhat.com>
References: <20210108164601.406146-1-peterx@redhat.com>
 <20210108165050.406906-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is for KVM_CLEAR_DIRTY_LOG, which is only
useful for KVM_GET_DIRTY_LOG.  Skip enabling it for kvm dirty ring.

More importantly, KVM_DIRTY_LOG_INITIALLY_SET will not wr-protect all the pages
initially, which is against how kvm dirty ring is used - there's no way for kvm
dirty ring to re-protect a page before it's notified as being written first
with a GFN entry in the ring!  So when KVM_DIRTY_LOG_INITIALLY_SET is enabled
with dirty ring, we'll see silent data loss after migration.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 77b2c4eb0c..9a9ce0316a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2174,20 +2174,29 @@ static int kvm_init(MachineState *ms)
         }
     }
 
-    dirty_log_manual_caps =
-        kvm_check_extension(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2);
-    dirty_log_manual_caps &= (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE |
-                              KVM_DIRTY_LOG_INITIALLY_SET);
-    s->manual_dirty_log_protect = dirty_log_manual_caps;
-    if (dirty_log_manual_caps) {
-        ret = kvm_vm_enable_cap(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2, 0,
-                                   dirty_log_manual_caps);
-        if (ret) {
-            warn_report("Trying to enable capability %"PRIu64" of "
-                        "KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 but failed. "
-                        "Falling back to the legacy mode. ",
-                        dirty_log_manual_caps);
-            s->manual_dirty_log_protect = 0;
+    /*
+     * KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 is not needed when dirty ring is
+     * enabled.  More importantly, KVM_DIRTY_LOG_INITIALLY_SET will assume no
+     * page is wr-protected initially, which is against how kvm dirty ring is
+     * usage - kvm dirty ring requires all pages are wr-protected at the very
+     * beginning.  Enabling this feature for dirty ring causes data corruption.
+     */
+    if (!s->kvm_dirty_ring_enabled) {
+        dirty_log_manual_caps =
+            kvm_check_extension(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2);
+        dirty_log_manual_caps &= (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE |
+                                  KVM_DIRTY_LOG_INITIALLY_SET);
+        s->manual_dirty_log_protect = dirty_log_manual_caps;
+        if (dirty_log_manual_caps) {
+            ret = kvm_vm_enable_cap(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2, 0,
+                                    dirty_log_manual_caps);
+            if (ret) {
+                warn_report("Trying to enable capability %"PRIu64" of "
+                            "KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 but failed. "
+                            "Falling back to the legacy mode. ",
+                            dirty_log_manual_caps);
+                s->manual_dirty_log_protect = 0;
+            }
         }
     }
 
-- 
2.26.2


