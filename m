Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA723DC3F1
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 08:29:17 +0200 (CEST)
Received: from localhost ([::1]:55536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9iUm-0007aA-CW
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 02:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTL-00051F-9h
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:47 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTJ-0001FD-Eo
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:46 -0400
Received: by mail-ed1-x530.google.com with SMTP id j2so16371851edp.11
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 23:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTjOAVjdtymwz9rd5aA6ONu5k4R7mM2ueQUxv/s95TM=;
 b=uJfDd8Y/RphhArgS+rYjdYl88K8WXDeMo23L79/pD4cxY+PQIwOUb/UvbLDUanqK2L
 I0PdoK11b0oDcbGMFJ66DmWWwK9peHRqkiG38LhTjPxgMIqQ5Pxyhi2bGadYWX9mpbs3
 x+JqhARgL6MNZpeLp8ugxscgVlI+5aeBSIRvU6AjTjJZv7bUSkFPyKPQrlH8fsZ6YPZq
 zGRZ7D54lbXI1g66oJGZpFY38MgWF+Wx9TVaTJWOF7/Q5yVXkNhdkujvAzLv8tvrxf+Q
 rlYQBqdCKcDK7BBTB/78qn6EZA4D2NqU8Bl8p4B6Bo3WSD3Mkh/qzTX6XgG6OrBbM/x1
 Cgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wTjOAVjdtymwz9rd5aA6ONu5k4R7mM2ueQUxv/s95TM=;
 b=loj4rq1iqceuYNJsTe73PwL9CLfvgern60//GyzmH3zUkTX/sL1PPswsUuLwAJZP8P
 yKrC+KK2j5t4DN3tTzSpOdn5HKYFVfB82CSxHDFpv8OkeqbQc4d5W8T37jGYZAZXo6Ci
 IW4aoFpZoo36cZlz81bP+Jgl/Llxq8KSC13dzrFLqBcywqtAEqz6Na5lA3pM6OzEkno2
 X5r6oEbBF8WvOasiTg0QKl++cO9SDqxvUSQm+e/kNL2dGM1f9Y1JeTsgcv5HYY6kj1M+
 TxX6zKS6kAsbgWFQR6kTGvBnY/BSm/2sBOoEN2d66Udw649d3MGtt8uOTMH0YZ7iVOrz
 Dq9A==
X-Gm-Message-State: AOAM531qOaITzeb8YzG7A3WGJjbLkoDQx1DjB7y5i4orCrB4Qa9jGtTm
 XynUlL9m2bsDk6HCGmhxwOjL7SPbN2bnNg==
X-Google-Smtp-Source: ABdhPJziW7afJIUccC7cLZYSWLezLhpzqyNIzzTmSSOuuv6FRrAj4HwBXOR89qe9moX7Go6fpBKJ1Q==
X-Received: by 2002:a05:6402:6cb:: with SMTP id
 n11mr7637562edy.112.1627712863639; 
 Fri, 30 Jul 2021 23:27:43 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 b25sm1766116edv.9.2021.07.30.23.27.43 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 23:27:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] coverity-model: update address_space_read/write models
Date: Sat, 31 Jul 2021 08:27:36 +0200
Message-Id: <20210731062741.301102-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731062741.301102-1-pbonzini@redhat.com>
References: <20210731062741.301102-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use void * for consistency with the actual function; provide a model
for MemoryRegionCache functions and for address_space_rw.  These
let Coverity understand the bounds of the data that various functions
read and write even at very high levels of inlining (e.g. pci_dma_read).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/model.c | 48 ++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
index 2c0346ff25..e1bdf0ad84 100644
--- a/scripts/coverity-scan/model.c
+++ b/scripts/coverity-scan/model.c
@@ -45,9 +45,10 @@ typedef struct va_list_str *va_list;
 /* exec.c */
 
 typedef struct AddressSpace AddressSpace;
+typedef struct MemoryRegionCache MemoryRegionCache;
 typedef uint64_t hwaddr;
 typedef uint32_t MemTxResult;
-typedef uint64_t MemTxAttrs;
+typedef struct MemTxAttrs {} MemTxAttrs;
 
 static void __bufwrite(uint8_t *buf, ssize_t len)
 {
@@ -67,9 +68,40 @@ static void __bufread(uint8_t *buf, ssize_t len)
     int last = buf[len-1];
 }
 
+MemTxResult address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
+                                      MemTxAttrs attrs,
+                                      void *buf, int len)
+{
+    MemTxResult result;
+    // TODO: investigate impact of treating reads as producing
+    // tainted data, with __coverity_tainted_data_argument__(buf).
+    __bufwrite(buf, len);
+    return result;
+}
+
+MemTxResult address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
+                                MemTxAttrs attrs,
+                                const void *buf, int len)
+{
+    MemTxResult result;
+    __bufread(buf, len);
+    return result;
+}
+
+MemTxResult address_space_rw_cached(MemoryRegionCache *cache, hwaddr addr,
+                                    MemTxAttrs attrs,
+                                    void *buf, int len, bool is_write)
+{
+    if (is_write) {
+        return address_space_write_cached(cache, addr, attrs, buf, len);
+    } else {
+        return address_space_read_cached(cache, addr, attrs, buf, len);
+    }
+}
+
 MemTxResult address_space_read(AddressSpace *as, hwaddr addr,
                                MemTxAttrs attrs,
-                               uint8_t *buf, int len)
+                               void *buf, int len)
 {
     MemTxResult result;
     // TODO: investigate impact of treating reads as producing
@@ -80,13 +112,23 @@ MemTxResult address_space_read(AddressSpace *as, hwaddr addr,
 
 MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
                                 MemTxAttrs attrs,
-                                const uint8_t *buf, int len)
+                                const void *buf, int len)
 {
     MemTxResult result;
     __bufread(buf, len);
     return result;
 }
 
+MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
+                             MemTxAttrs attrs,
+                             void *buf, int len, bool is_write)
+{
+    if (is_write) {
+        return address_space_write(as, addr, attrs, buf, len);
+    } else {
+        return address_space_read(as, addr, attrs, buf, len);
+    }
+}
 
 /* Tainting */
 
-- 
2.31.1



