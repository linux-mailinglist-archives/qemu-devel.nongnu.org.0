Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCDB570D1C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 00:03:01 +0200 (CEST)
Received: from localhost ([::1]:32870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB1Ua-0008Px-8S
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 18:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gZ3MYgoKCgw7u5mxAn6wms00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--vitalybuka.bounces.google.com>)
 id 1oB1Sa-0006eq-0w
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 18:00:56 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149]:44022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gZ3MYgoKCgw7u5mxAn6wms00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--vitalybuka.bounces.google.com>)
 id 1oB1SQ-0002VA-My
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 18:00:49 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-31cbe6ad44fso54790257b3.10
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 15:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ha/fBOQkFNZTTXgSAWqd3aCaZr8aABJoRAfLAYgjl3Q=;
 b=Sl34ywdO2tSXUtCt8x/vXyXJFu+H2D/TXmrhCM7PAajQpmO0yhNc08DWDTXqmWLKzN
 LAoNpRTw4zxb7w6gPxgh8TfmD2qE0zRJ1yYtsRX2lez+OjeyL9Miu1YFpnEowSXlGIfK
 x4Ts7UeOT252jaQRrESQZ+QoVNyTGFWWZIJwPAejcxtBC5SKqemvRyt99LFcdpUCsSsA
 tjS1e+5XA9Bl8Nkz1m6blXdz7n9HJSI5Hp8p5mHqMOvFnj9d1EarfFFH4xCSxX7NI5kt
 IRnEB9dYF0D9o4nX+ieRJZX4LsEaoWf/7liSgA0KIXxUJHj/zyAa6765n0iEYqdfwCBL
 A0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ha/fBOQkFNZTTXgSAWqd3aCaZr8aABJoRAfLAYgjl3Q=;
 b=aQzfRYswet2dLZh5/aZ96/dZE8YFJIeH0hIz29n43rD9ybZSvaHysi/zUhBF2IVdcY
 rcmvkDITgQ0aVijA1AmrVV9l4w3+jbIdSZVuBnhAnHkYrVD+rm5usalHpRalxBGVSidH
 axwy/kt+PTdr/2+zce3KQqwojPDhqsSDE8MD/AH/SUPyx2yF2RpeGQo1wepyPSAFeP6P
 NOvMqWWttbgNkcjZkGGvPOUawt8szybMSAlpxddWhYLQmEWezyMuExEv1R2/Ovtm3/2x
 z3zGfl7iIypaBzuHRPs+OTrvvVBGozE8fI7b/kp9b5Xxr6LuLNh7+ZgNMAeOniZwewxU
 4KMA==
X-Gm-Message-State: AJIora9GWx+oxtNODGe8/OOnPL7wK5EhtE8oHvFJTcaC1iaH32JhioD8
 ssw9LUK2Ot53sG2Yl2c3DRcQLVaUczTU4C8wqvhCf/n/6zkrg8IXugfj7RE0LBylfpylRxzCxEO
 M/D3XSpbX7HpQ+xRasNQ4f2L92KNHZVvh0uEcfyyIMp4uqTdiDl4Nbsrp5arsa5A+3zjjdWo=
X-Google-Smtp-Source: AGRyM1sQKj09zO5frjZFd69qQxIVhqrmwhYhRRjwmp+BsGxzIIiyYSoWcqeeM/klYl1QKve4RC3YnJCVnrVYk9wh
X-Received: from vvv.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:56c])
 (user=vitalybuka job=sendgmr) by 2002:a05:6902:72a:b0:66e:b863:1eb1 with SMTP
 id l10-20020a056902072a00b0066eb8631eb1mr19095010ybt.406.1657576833538; Mon,
 11 Jul 2022 15:00:33 -0700 (PDT)
Date: Mon, 11 Jul 2022 15:00:28 -0700
Message-Id: <20220711220028.2467290-1-vitalybuka@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [PATCH] [PATCH] linux-user/aarch64: Reset target data on MADV_DONTNEED
From: Vitaly Buka <vitalybuka@google.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Vitaly Buka <vitalybuka@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3gZ3MYgoKCgw7u5mxAn6wms00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--vitalybuka.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

aarch64 stores MTE tags in target_date, and they should be reset by
MADV_DONTNEED.

Signed-off-by: Vitaly Buka <vitalybuka@google.com>
---
 accel/tcg/translate-all.c | 24 ++++++++++++++++++++++++
 include/exec/cpu-all.h    |  1 +
 linux-user/mmap.c         |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ef62a199c7..d6f2f1a40a 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2314,6 +2314,30 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     }
 }
 
+void page_reset_target_data(target_ulong start, target_ulong end)
+{
+    target_ulong addr, len;
+
+    /* This function should never be called with addresses outside the
+       guest address space.  If this assert fires, it probably indicates
+       a missing call to h2g_valid.  */
+    assert(end - 1 <= GUEST_ADDR_MAX);
+    assert(start < end);
+    assert_memory_lock();
+
+    start = start & TARGET_PAGE_MASK;
+    end = TARGET_PAGE_ALIGN(end);
+
+    for (addr = start, len = end - start;
+         len != 0;
+         len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
+        PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+
+        g_free(p->target_data);
+        p->target_data = NULL;
+    }
+}
+
 void *page_get_target_data(target_ulong address)
 {
     PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index f5bda2c3ca..491629b9ba 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -271,6 +271,7 @@ int walk_memory_regions(void *, walk_memory_regions_fn);
 
 int page_get_flags(target_ulong address);
 void page_set_flags(target_ulong start, target_ulong end, int flags);
+void page_reset_target_data(target_ulong start, target_ulong end);
 int page_check_range(target_ulong start, target_ulong len, int flags);
 
 /**
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 4e7a6be6ee..c535dfdc7c 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -894,6 +894,8 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
     if ((advice & MADV_DONTNEED) &&
         can_passthrough_madv_dontneed(start, end)) {
         ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
+        if (ret == 0)
+            page_reset_target_data(start, start + len);
     }
     mmap_unlock();
 
-- 
2.37.0.144.g8ac04bfd2-goog


