Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001523F4ECB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:55:55 +0200 (CEST)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDEp-00026Z-2F
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1o-0000bZ-34
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1l-0007VE-9x
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629736944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U6o7mUiS+x+yoYgYKCe3zRTvEmO9Jt50OpWWKAuJ49Y=;
 b=PCGBpfpFaZLjYasU8P5D1Q+PzXu937UUu46siQYfyNn9ReyHMrp6FZArgH1c0PPcS/eZD8
 riJXLViy3LbYIXSuwWpZWl1GMSqjpfIjtQmvUctFHEHZtydeMOIytXt5kwqCJl4BBEQGq2
 fFjY3MoBGTGgYd3a5NeSxQu2jw0cSZA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-i3HOse9INgSZJqdnkBSYxA-1; Mon, 23 Aug 2021 12:42:23 -0400
X-MC-Unique: i3HOse9INgSZJqdnkBSYxA-1
Received: by mail-wr1-f71.google.com with SMTP id
 d12-20020a056000186cb02901548bff164dso5168014wri.18
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U6o7mUiS+x+yoYgYKCe3zRTvEmO9Jt50OpWWKAuJ49Y=;
 b=VJMLPlYJvLeBRArnn9fxB62KIUuoFCj1xDILPUv1dx2TNm+vwSjJZ3HYijeLmuPoOK
 JMSjNcGIidZynhX6B2E2PkdwPMlLUZvtqRtvYhOxq8THo7jkuajVUOHnaArNeyZprs/o
 /oNYMuVwX+76c02tsnaZ8FI2Ctf20k7MCG32zLJCrUzL8PORtzIWv2vMulcO+72dfWpa
 GyGpGHOKe0SsAIWAlrSNlIYpZzWRIBJTWcIW88eLDSo+ezjExiXRHkuIQ8B4xjjQZPad
 XFCY9rKJKVFO9OuiSGrvllEjJlfNHkb+W8R8SD1PiiCr22NxA9eukWV/8M0Q5FN0F/jr
 apfg==
X-Gm-Message-State: AOAM533H3TpI+GIrKEiusoDDq1DsiSCWX/EVJKDNc815qHB55j3S11VM
 7NNMZjPPSnElUJ9etrGzgO6G4ogYnnKwLKVZUMwLtZDdZDZ7iXb769rD911exHdhYMMJfsPcIK0
 aLESLJK7Da+UY9gZ68KnrOPD+cdtdGNRWOMXewpC8D8sKwRR2RAMhB9WhCFcyJ8pn
X-Received: by 2002:a05:600c:241:: with SMTP id
 1mr11269913wmj.93.1629736942376; 
 Mon, 23 Aug 2021 09:42:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK8E4wJeqKC1vHJvRWr2gaLqg/4qrJHs8pGEpSWPboeu5B5479K8sbltqGJ0DurBZf1G/EaQ==
X-Received: by 2002:a05:600c:241:: with SMTP id
 1mr11269882wmj.93.1629736942128; 
 Mon, 23 Aug 2021 09:42:22 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 s16sm8505653wrw.44.2021.08.23.09.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:42:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 5/5] softmmu/physmem: Have flaview API check
 MemTxAttrs::bus_perm field
Date: Mon, 23 Aug 2021 18:41:57 +0200
Message-Id: <20210823164157.751807-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823164157.751807-1-philmd@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check bus permission in flatview_access_allowed() before
running any bus transaction.

There is not change for the default case (MEMTXPERM_UNSPECIFIED).

The MEMTXPERM_UNRESTRICTED case works as an allow list. Devices
using it won't be checked by flatview_access_allowed().

The only deny list equivalent is MEMTXPERM_RAM_DEVICE: devices
using this flag will reject transactions and set the optional
MemTxResult to MEMTX_BUS_ERROR.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/physmem.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 0d31a2f4199..329542dba75 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2772,7 +2772,22 @@ static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
                                            hwaddr addr, hwaddr len,
                                            MemTxResult *result)
 {
-    return true;
+    if (unlikely(attrs.bus_perm == MEMTXPERM_RAM_DEVICE)) {
+        if (memory_region_is_ram(mr) || memory_region_is_ram_device(mr)) {
+            return true;
+        }
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Invalid access to non-RAM device at "
+                      "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
+                      "region '%s'\n", addr, len, memory_region_name(mr));
+        if (result) {
+            *result |= MEMTX_BUS_ERROR;
+        }
+        return false;
+    } else {
+        /* MEMTXPERM_UNRESTRICTED and MEMTXPERM_UNSPECIFIED cases */
+        return true;
+    }
 }
 
 /* Called within RCU critical section.  */
-- 
2.31.1


