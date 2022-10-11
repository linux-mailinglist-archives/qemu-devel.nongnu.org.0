Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062335FBD46
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 23:59:24 +0200 (CEST)
Received: from localhost ([::1]:50578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNHW-0007IP-Ie
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 17:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNER-0001a7-Kg
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oiNEL-0003UP-EZ
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665525364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8P8rC6b0KNfCTgsUdutxidXaOSDJ5QtY1XIgKgEULM=;
 b=YZB8eUxnL3h3saxv9QepFgZ3MX4EPd8g5RV5UWstMRk9EQ/4mP1L0wFpTi/O0TSlp2rljr
 yxykt2dfuFPQUaZ2+Ed1iezBAQaN6mFCwmr1tcGBBefMhzZIs2mI7yr/T4I+HsfVN2fGu+
 mCr03Ng+R+RiIK9eiTA86xUhXZpZHl0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-491-yZTFJIuzNou2lc8Yhl0VbA-1; Tue, 11 Oct 2022 17:56:03 -0400
X-MC-Unique: yZTFJIuzNou2lc8Yhl0VbA-1
Received: by mail-qt1-f198.google.com with SMTP id
 fz10-20020a05622a5a8a00b0035ce18717daso9962542qtb.11
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f8P8rC6b0KNfCTgsUdutxidXaOSDJ5QtY1XIgKgEULM=;
 b=AxHcRD52/pNqkv5wF1umEBQeXWi10rlSlrPwIwKlPTeNMdHeODOQTeVQRTwjovFeRW
 DVX7qQRST/wpYvMV6Q86XNTr5gsXYRcRVLgzujRPdo0oMIBamzaWR3zXkV2ZyOZ+4YL9
 D/evhOdAVklQRiZ+RWwfI0fjAr3bHOA90eikO6Jhy98Hhl17NgXBvkLD0U3pPNa88EZW
 m6Q2A84o/xqDZqBGxf3F2x3a5mEjgQUYrKUx8p89cu9Rtng2ie3V1CpghqMf8CMkDtvk
 7lXx1jUhGDFIyRl6qFYVm4mUVNQe2xAs18mKYRIShu/nu3DDYMzj/x1IkLLmXgsnUBFy
 kmqg==
X-Gm-Message-State: ACrzQf1pqUuCTNiX3ZaDyBIR2XRLmlHAqLkAr91iYwgGLy8SwmdUgjIG
 37OlEcQbFVwxqhkVQsX4aFpzUcbqnsDbzAULqxiB+pEZdmAcEkkkZ/KFr1qDEYBqRCdXK3fLO9G
 t+9cd4gVhlVyLSk1rHiZuF8yzWQjjPBCQ5uugjyUXi3dwENOx+JvHctXUufIQ2PvQ
X-Received: by 2002:ac8:7d13:0:b0:35c:e54e:9c8 with SMTP id
 g19-20020ac87d13000000b0035ce54e09c8mr20944707qtb.320.1665525363015; 
 Tue, 11 Oct 2022 14:56:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5bneUi2UtgLyVELKcfQwLK1Ca6lcAPsgBvHOI1W/RY+2D2E1KTPs3fsU66ACLUatJYzx3l9Q==
X-Received: by 2002:ac8:7d13:0:b0:35c:e54e:9c8 with SMTP id
 g19-20020ac87d13000000b0035ce54e09c8mr20944691qtb.320.1665525362766; 
 Tue, 11 Oct 2022 14:56:02 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a05620a430a00b006ce7cd81359sm13863230qko.110.2022.10.11.14.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:56:02 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v2 01/15] migration: Take bitmap mutex when completing ram
 migration
Date: Tue, 11 Oct 2022 17:55:45 -0400
Message-Id: <20221011215559.602584-2-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011215559.602584-1-peterx@redhat.com>
References: <20221011215559.602584-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Any call to ram_find_and_save_block() needs to take the bitmap mutex.  We
used to not take it for most of ram_save_complete() because we thought
we're the only one left using the bitmap, but it's not true after the
preempt full patchset applied, since the return path can be taking it too.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 1338e47665..cfeb571800 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3406,6 +3406,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         /* try transferring iterative blocks of memory */
 
         /* flush all remaining blocks regardless of rate limiting */
+        qemu_mutex_lock(&rs->bitmap_mutex);
         while (true) {
             int pages;
 
@@ -3419,6 +3420,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
                 break;
             }
         }
+        qemu_mutex_unlock(&rs->bitmap_mutex);
 
         flush_compressed_data(rs);
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
-- 
2.37.3


