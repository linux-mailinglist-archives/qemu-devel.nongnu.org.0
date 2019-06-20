Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5F54CA53
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 11:08:59 +0200 (CEST)
Received: from localhost ([::1]:45038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdt3z-0006CL-3A
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 05:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38483)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pizhenwei@bytedance.com>) id 1hdsqQ-0006T1-PT
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:55:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pizhenwei@bytedance.com>) id 1hdsqO-0006Zo-Rh
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:54:58 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:40353)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pizhenwei@bytedance.com>)
 id 1hdsqM-0006Pe-VF
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:54:55 -0400
Received: by mail-pg1-x541.google.com with SMTP id w10so1217724pgj.7
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 01:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Q++PuXQ04Zp6hoQX9wFKwFojx0AIP28t8ItaEcjA+So=;
 b=m7aNdc8ItkosH5h4msOLDiFJbcU9S/tcUdIicv0UFXsvZdpehUqx4N7rlK0+Kibn9i
 e3PwA2vn1KKZZFAR/6X80DmRDdiGmQND9EEaeagfbTb48bSO4VsZMBNHQXiixBDaCJ4s
 6r18SaIy7yAuCLPXmVmkVKpxa/Lo9ww73n6DJsfHj9u9thSc2oHcR5yzK5bZDHsqGH8K
 raNtFSd1CgRCsla68YNa9JooELnVmJnNbGZb2LAv/33Wp2mTxqBOZPyUSAu4vLVxn/Xm
 1RSJpMaBHZff394SGhyNTeMZj48dES7oQei7QU6iMrdyQ8oaWsZ+EqaEsKqIvCtq8xqe
 G2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Q++PuXQ04Zp6hoQX9wFKwFojx0AIP28t8ItaEcjA+So=;
 b=a4mod8djic+FGFbOfDs5Hc+8vT9tPmx3k5c8sDr1fDTBavtsPdZXEnm6uYGk6L3je6
 DkhflUXE4Z74otvrS7gig8fP06kOEGgKxiq1kmQpVYrx3pMVFWYdP7BU3ywKwvVhIgCC
 OlDPV+cprBVyNRNEj6uCwZH1Y60kWq/Oe5zhiKNtv0zTDPTPndqBwSma5pVY2kT8LLSb
 /AlbjdgBX26Ii0nv6WBqOmb6kVkd1+3fueYvFPV9HwRgWYDwQcvEuB78FdpQGz2cwteI
 YsQE3Wb/r0FC8EVXkv5ueCO9ZhzmCIxzUEn1mmVtogcQkJ5n/KZwcq9Pwsng2gdLoqrM
 O1Vw==
X-Gm-Message-State: APjAAAXgpiz87w2k4udHJ/0xPC/66S6NPjqFFcKVveec4/a7JowWQ+cL
 uCronAF7A+nUT6XHeeuUDg70Ww==
X-Google-Smtp-Source: APXvYqxGgNIpP5m8hjt2XRXNjew6D43qZBDeycvm2oq0ajpQVwfCEyFY6dtZeJdWdrrrqzy5Jbilvg==
X-Received: by 2002:a17:90a:950d:: with SMTP id
 t13mr1909178pjo.81.1561020884462; 
 Thu, 20 Jun 2019 01:54:44 -0700 (PDT)
Received: from always-ThinkPad-T480.bytedance.net ([61.120.150.76])
 by smtp.gmail.com with ESMTPSA id c11sm19240635pgg.2.2019.06.20.01.54.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Jun 2019 01:54:43 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kwolf@redhat.com,
	mreitz@redhat.com
Date: Thu, 20 Jun 2019 16:54:31 +0800
Message-Id: <1561020872-6214-3-git-send-email-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561020872-6214-1-git-send-email-pizhenwei@bytedance.com>
References: <1561020872-6214-1-git-send-email-pizhenwei@bytedance.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [PATCH 2/3] block/accounting: introduce block size
 histogram
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
Cc: fam@euphon.net, qemu-block@nongnu.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, pizhenwei@bytedance.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce block size histogram statics for block devices.

For read/write/flush operation type, the block size region
[0, +inf) is divided into subregions by several points.
It works like block latency histogram.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 block/accounting.c         | 24 ++++++++++++++++++++++++
 include/block/accounting.h |  4 ++++
 2 files changed, 28 insertions(+)

diff --git a/block/accounting.c b/block/accounting.c
index bb8148b6b1..94d5aa292e 100644
--- a/block/accounting.c
+++ b/block/accounting.c
@@ -187,6 +187,27 @@ void block_latency_histograms_clear(BlockAcctStats *stats)
     }
 }
 
+int block_size_histogram_set(BlockAcctStats *stats, enum BlockAcctType type,
+                                uint64List *boundaries)
+{
+    BlockHistogram *hist = &stats->size_histogram[type];
+
+    return block_histogram_set(hist, boundaries);
+}
+
+void block_size_histograms_clear(BlockAcctStats *stats)
+{
+    int i;
+
+    for (i = 0; i < BLOCK_MAX_IOTYPE; i++) {
+        BlockHistogram *hist = &stats->size_histogram[i];
+        g_free(hist->bins);
+        g_free(hist->boundaries);
+        memset(hist, 0, sizeof(*hist));
+    }
+}
+
+
 static void block_account_one_io(BlockAcctStats *stats, BlockAcctCookie *cookie,
                                  bool failed)
 {
@@ -211,6 +232,9 @@ static void block_account_one_io(BlockAcctStats *stats, BlockAcctCookie *cookie,
 
     block_histogram_account(&stats->latency_histogram[cookie->type],
                                     latency_ns);
+    block_histogram_account(&stats->size_histogram[cookie->type],
+                                    cookie->bytes);
+
 
     if (!failed || stats->account_failed) {
         stats->total_time_ns[cookie->type] += latency_ns;
diff --git a/include/block/accounting.h b/include/block/accounting.h
index 270fddb69c..49d3a78f48 100644
--- a/include/block/accounting.h
+++ b/include/block/accounting.h
@@ -89,6 +89,7 @@ struct BlockAcctStats {
     bool account_invalid;
     bool account_failed;
     BlockHistogram latency_histogram[BLOCK_MAX_IOTYPE];
+    BlockHistogram size_histogram[BLOCK_MAX_IOTYPE];
 };
 
 typedef struct BlockAcctCookie {
@@ -117,5 +118,8 @@ double block_acct_queue_depth(BlockAcctTimedStats *stats,
 int block_latency_histogram_set(BlockAcctStats *stats, enum BlockAcctType type,
                                 uint64List *boundaries);
 void block_latency_histograms_clear(BlockAcctStats *stats);
+int block_size_histogram_set(BlockAcctStats *stats, enum BlockAcctType type,
+                                uint64List *boundaries);
+void block_size_histograms_clear(BlockAcctStats *stats);
 
 #endif
-- 
2.11.0


