Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF8245AAA0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:56:07 +0100 (CET)
Received: from localhost ([::1]:53722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpa1W-0006Mi-Ng
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:56:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZwx-0006Lc-K7
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZwu-0006kJ-MU
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637689879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoCZGdg8jPnZ4FJ9H5tQajzuxhFrzLy+nqeqCxQdqEQ=;
 b=hFtLx1kdPrQ50Lc38hHzMpEFGmQWV5E8SmPGMjXZLoPoOwPdLKgd8G5I7geNf9hbzvytcH
 toNIb+/+JNvuOSbwEeF8x08cnBvtBmLeeI7htWEvE6x7jQis4/PmFn7FXaz9FY3knc2WXL
 NAesdYmqqOIQyoL4ubk9pbCUu/Kk9YE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-pHqxgECCOBmLuibzm4wKfw-1; Tue, 23 Nov 2021 12:51:18 -0500
X-MC-Unique: pHqxgECCOBmLuibzm4wKfw-1
Received: by mail-wm1-f69.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso1560793wme.8
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YoCZGdg8jPnZ4FJ9H5tQajzuxhFrzLy+nqeqCxQdqEQ=;
 b=U1kogrfO4Phd2rCIUW3fe+L0kqoHFiQCSe339TJjNXvcPxHqtJ9x83J96t+YOC3tjj
 y6FHkAwtBwVDekkHJhYMpkuMkZloXqTSWnALVf36N5QXGwmBucl4THB+H8AHGRhYR2BM
 iELs0POmf7Rp0jUuRDVR+BTH/NIXMwv8dOzNuvbIfBorcITxBqs0/dYkInO3Wj8B8xEt
 tKCd6DG8gb2Ct5AgYVQr2/wn1RE0iCTIDUN94fcz/JzCx6y2tUxYTfxUAS19+7gOlvGR
 /aGK8ecUxQ2c6y0Ab3SYmssbyc2IZdz/SvjnH1mqUwp5o2pWhh64Fa3r+n2WhEsBjIFc
 7+mg==
X-Gm-Message-State: AOAM531KTfdzh5elqYenhy50Bx/LXZhlh+Rr9ZjVVn9pa8GNsGaUSHMI
 eLgza7TK/VgQMD4nLUqHazrx2DSmpSdFHf5IrLssFSdIjWmKMxc1XktfR+/rnqqahBSoBw4RJcH
 hwyJ5ZZ9Me1mBdh3j+cIGMZ/YF9lThNn5bxsaGi26RIyAl7uNuiswQwSLcJiHFqbePb8=
X-Received: by 2002:a05:600c:4e94:: with SMTP id
 f20mr5183719wmq.77.1637689877331; 
 Tue, 23 Nov 2021 09:51:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxbbADuTgyXtcTihqmNUhRy5cc64Me3S7PaiT96Vz5HKJDljVMtl5pfpw7GOhCCxUicbnwgw==
X-Received: by 2002:a05:600c:4e94:: with SMTP id
 f20mr5183657wmq.77.1637689876971; 
 Tue, 23 Nov 2021 09:51:16 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id g4sm12573304wro.12.2021.11.23.09.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:51:16 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/23] multifd: Delete useless operation
Date: Tue, 23 Nov 2021 18:50:51 +0100
Message-Id: <20211123175113.35569-2-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211123175113.35569-1-quintela@redhat.com>
References: <20211123175113.35569-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are divining by page_size to multiply again in the only use.
Once there, impreve the comments.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd-zlib.c | 13 ++++---------
 migration/multifd-zstd.c | 13 ++++---------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index ab4ba75d75..3fc7813b44 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -42,7 +42,6 @@ struct zlib_data {
  */
 static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
 {
-    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
     z_stream *zs = &z->zs;
 
@@ -54,9 +53,8 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
         error_setg(errp, "multifd %d: deflate init failed", p->id);
         return -1;
     }
-    /* We will never have more than page_count pages */
-    z->zbuff_len = page_count * qemu_target_page_size();
-    z->zbuff_len *= 2;
+    /* To be safe, we reserve twice the size of the packet */
+    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         deflateEnd(&z->zs);
@@ -180,7 +178,6 @@ static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
  */
 static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
 {
-    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     struct zlib_data *z = g_malloc0(sizeof(struct zlib_data));
     z_stream *zs = &z->zs;
 
@@ -194,10 +191,8 @@ static int zlib_recv_setup(MultiFDRecvParams *p, Error **errp)
         error_setg(errp, "multifd %d: inflate init failed", p->id);
         return -1;
     }
-    /* We will never have more than page_count pages */
-    z->zbuff_len = page_count * qemu_target_page_size();
-    /* We know compression "could" use more space */
-    z->zbuff_len *= 2;
+    /* To be safe, we reserve twice the size of the packet */
+    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         inflateEnd(zs);
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 693bddf8c9..cc3b8869c0 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -47,7 +47,6 @@ struct zstd_data {
  */
 static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
 {
-    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     struct zstd_data *z = g_new0(struct zstd_data, 1);
     int res;
 
@@ -67,9 +66,8 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
                    p->id, ZSTD_getErrorName(res));
         return -1;
     }
-    /* We will never have more than page_count pages */
-    z->zbuff_len = page_count * qemu_target_page_size();
-    z->zbuff_len *= 2;
+    /* To be safe, we reserve twice the size of the packet */
+    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         ZSTD_freeCStream(z->zcs);
@@ -191,7 +189,6 @@ static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
  */
 static int zstd_recv_setup(MultiFDRecvParams *p, Error **errp)
 {
-    uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     struct zstd_data *z = g_new0(struct zstd_data, 1);
     int ret;
 
@@ -212,10 +209,8 @@ static int zstd_recv_setup(MultiFDRecvParams *p, Error **errp)
         return -1;
     }
 
-    /* We will never have more than page_count pages */
-    z->zbuff_len = page_count * qemu_target_page_size();
-    /* We know compression "could" use more space */
-    z->zbuff_len *= 2;
+    /* To be safe, we reserve twice the size of the packet */
+    z->zbuff_len = MULTIFD_PACKET_SIZE * 2;
     z->zbuff = g_try_malloc(z->zbuff_len);
     if (!z->zbuff) {
         ZSTD_freeDStream(z->zds);
-- 
2.33.1


