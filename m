Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36887457504
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 18:06:43 +0100 (CET)
Received: from localhost ([::1]:43952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo7LW-0005B8-8w
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 12:06:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7EO-0005LA-EY
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mo7ED-00036g-FB
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637341148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmEkVhVSKzuiu4C0PT+alXX9G5GjnHjiuGB7lH3TEq4=;
 b=ismgrdDIMyfnbkGm7aucHbZWN9EeYjPMkhMTApLqBFpbhaJHWDtGxnCB7VWAh0bcRZhct6
 TxO4FIKmzKKTh+F/ZAVt7hWeooSmH5EaGEIUiN1/jV+sqThYEG3B2mBEnRdaydk6cbLIj2
 47sAaGj+DVIi/dYtCJMFAXHnguVGQR8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-qMEknxMEO7-r88EHP0VhFw-1; Fri, 19 Nov 2021 11:59:07 -0500
X-MC-Unique: qMEknxMEO7-r88EHP0VhFw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so6199751wma.5
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:59:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XmEkVhVSKzuiu4C0PT+alXX9G5GjnHjiuGB7lH3TEq4=;
 b=WOE9PfAWfqgy3gs7W5z37LM9z7DoJwDRFI7vn9n2K5PSQ80fZTLFjZ6lKJRIoj7Rzl
 +OSC3lphfk1wHu868YB0RLhXqLZgtYbkK/Yf1yeWhr0QUdHXWdM9dF/IAdzyQfa2EtjP
 jCc1kgriGl/i8IGplPpkRD00u7EfgH4OUgdzahKENa1gEObxlv5JahcR8TR52I0MpWym
 qLCxNtTJCOgfK6AcksAmnWWNgclb/3NDca+0rJkseY7EeB9lXD8qzeFHZcmPMHJOohY5
 +kvL/yiCAo2f0EqFvS5/McWE1nVGn7vSSKI1iV6nz91kz5MazCXTI4hmoZF1RqlXW0Oc
 Zxyw==
X-Gm-Message-State: AOAM530zfDQGRtriXSAakltBpJmxuXi82zwOKQWi1DwFxs/aweiuFiBJ
 /KUn2IUdXd9I5GleHeKkz7QSfs1DXgcquxxNOHCVJLKTLL2VMiUkMxKBl7Ka1OFPhsZGscmFji3
 dYrzSVHf37bQ1IwUe0CUmuLRoygV+NSa60zUjtNTkEtF1AiMBGIRTYU0XXN7bNs8MPfQ=
X-Received: by 2002:a05:600c:35cb:: with SMTP id
 r11mr1366053wmq.190.1637341146186; 
 Fri, 19 Nov 2021 08:59:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzahFSFMgYW8SGXmVlwilXFzKr+605EU1K46LPD+/u9hvjHGg03cUhPbmCNqGtK+mBogyRgyQ==
X-Received: by 2002:a05:600c:35cb:: with SMTP id
 r11mr1366008wmq.190.1637341145893; 
 Fri, 19 Nov 2021 08:59:05 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id r8sm400927wrz.43.2021.11.19.08.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:59:05 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] migration: Remove is_zero_range()
Date: Fri, 19 Nov 2021 17:58:53 +0100
Message-Id: <20211119165903.18813-2-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119165903.18813-1-quintela@redhat.com>
References: <20211119165903.18813-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It just calls buffer_is_zero().  Just change the callers.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 863035d235..f2a799ff83 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -81,11 +81,6 @@
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
 
-static inline bool is_zero_range(uint8_t *p, uint64_t size)
-{
-    return buffer_is_zero(p, size);
-}
-
 XBZRLECacheStats xbzrle_counters;
 
 /* struct contains XBZRLE cache and a static page
@@ -1180,7 +1175,7 @@ static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
     uint8_t *p = block->host + offset;
     int len = 0;
 
-    if (is_zero_range(p, TARGET_PAGE_SIZE)) {
+    if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
         len += save_page_header(rs, file, block, offset | RAM_SAVE_FLAG_ZERO);
         qemu_put_byte(file, 0);
         len += 1;
@@ -3367,7 +3362,7 @@ static inline void *colo_cache_from_block_offset(RAMBlock *block,
  */
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size)
 {
-    if (ch != 0 || !is_zero_range(host, size)) {
+    if (ch != 0 || !buffer_is_zero(host, size)) {
         memset(host, ch, size);
     }
 }
-- 
2.33.1


