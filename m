Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CED493663
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:35:00 +0100 (CET)
Received: from localhost ([::1]:51724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6Ql-0005mP-FG
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:34:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA631-0007KC-Mp
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA62z-0001Lj-4k
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OZVkrMSngFS5rGQULjw+Q25CAXqrhJkHW+x+P4pPtk0=;
 b=Fhh4oAeqJU5cvpgrz25zehVXOfVODu/ImiuOaMZTd1C5HQjDeJC2Re7H7pURizmvUo03yF
 cavyjQBt/BVXnQOv0Vijt5ZhABjVLo3VG7+OnqOA/w26xLNiQYJ1+yFbeEBBwXpr5Pip/X
 KaAfXNOwviAdy1JRp9JAaEfJVuNV118=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-a4UfuOjcOnWTMSuVe3YjaQ-1; Wed, 19 Jan 2022 03:10:23 -0500
X-MC-Unique: a4UfuOjcOnWTMSuVe3YjaQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o3-20020a05600c4fc300b0034aee9534bdso801356wmq.2
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OZVkrMSngFS5rGQULjw+Q25CAXqrhJkHW+x+P4pPtk0=;
 b=2UyUGZjRb1fhK2z6HhNk3u0+wTt1OOB08JKqzQqv/oEfssCRtbyqEXFclZ6RdPbcR3
 3CLiPdwAH1P5stcMCkq8HBTUoekEsK1d66Q23y3DtP17ewSH8LkyLCLklsKYNfGCwcu2
 GKysH4TJ2RIojmTO3KEbVmZOZcxcCxTm2VJR9I4dwnHMnrysPcx9t3Xnl06aLDPR5HLg
 BcjlBVluzqOeUgRJTIqtKPBAuKvnSH4Ljtg+HGDAULNQn9yH7uB/RDbXkNFIBB1CWGJf
 U1KMwBolASPwKA1B95cfEVZ2hBXorUTIjriDWfV/TVPN1h56cNX5Kxit820E1NYP9pfx
 dYQw==
X-Gm-Message-State: AOAM531xTJjpTSHtM+zFJMDxG/p5LynM01p1Nw+g0jjZiPw/GSmvrFYl
 jowFdSuMq61CqnvP2kWO2+wLnO09RWHexT9OiEOvkI/OvCXE3W2MhqYlXNVa3f3dxMHN2GlD6wX
 4ATsJtmj+k1Fq0W4RDJTCeojqeQSkIjWIlTd4+FKMygr/3X/9/A7pmAhf7Fh7f6Hr
X-Received: by 2002:a5d:5253:: with SMTP id k19mr27827373wrc.228.1642579821921; 
 Wed, 19 Jan 2022 00:10:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMp8cvXIhMIQDd/KIuJlaDjnGay3q0d5NZ2Zt3AGtPRSE6At12L5wzeY/1arKdEVMVti8Z2w==
X-Received: by 2002:a5d:5253:: with SMTP id k19mr27827356wrc.228.1642579821638; 
 Wed, 19 Jan 2022 00:10:21 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.10.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:10:21 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 10/15] migration: Move static var in
 ram_block_from_stream() into global
Date: Wed, 19 Jan 2022 16:09:24 +0800
Message-Id: <20220119080929.39485-11-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119080929.39485-1-peterx@redhat.com>
References: <20220119080929.39485-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Static variable is very unfriendly to threading of ram_block_from_stream().
Move it into MigrationIncomingState.

Make the incoming state pointer to be passed over to ram_block_from_stream() on
both caller sites.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.h |  3 ++-
 migration/ram.c       | 13 +++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 35e7f7babe..34b79cb961 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -66,7 +66,8 @@ typedef struct {
 /* State for the incoming migration */
 struct MigrationIncomingState {
     QEMUFile *from_src_file;
-
+    /* Previously received RAM's RAMBlock pointer */
+    RAMBlock *last_recv_block;
     /* A hook to allow cleanup at the end of incoming migration */
     void *transport_data;
     void (*transport_cleanup)(void *data);
diff --git a/migration/ram.c b/migration/ram.c
index 3f823ffffc..3a7d943f9c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3183,12 +3183,14 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
  *
  * Returns a pointer from within the RCU-protected ram_list.
  *
+ * @mis: the migration incoming state pointer
  * @f: QEMUFile where to read the data from
  * @flags: Page flags (mostly to see if it's a continuation of previous block)
  */
-static inline RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
+static inline RAMBlock *ram_block_from_stream(MigrationIncomingState *mis,
+                                              QEMUFile *f, int flags)
 {
-    static RAMBlock *block;
+    RAMBlock *block = mis->last_recv_block;
     char id[256];
     uint8_t len;
 
@@ -3215,6 +3217,8 @@ static inline RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
         return NULL;
     }
 
+    mis->last_recv_block = block;
+
     return block;
 }
 
@@ -3667,7 +3671,7 @@ static int ram_load_postcopy(QEMUFile *f)
         trace_ram_load_postcopy_loop((uint64_t)addr, flags);
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE)) {
-            block = ram_block_from_stream(f, flags);
+            block = ram_block_from_stream(mis, f, flags);
             if (!block) {
                 ret = -EINVAL;
                 break;
@@ -3881,6 +3885,7 @@ void colo_flush_ram_cache(void)
  */
 static int ram_load_precopy(QEMUFile *f)
 {
+    MigrationIncomingState *mis = migration_incoming_get_current();
     int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
     /* ADVISE is earlier, it shows the source has the postcopy capability on */
     bool postcopy_advised = postcopy_is_advised();
@@ -3919,7 +3924,7 @@ static int ram_load_precopy(QEMUFile *f)
 
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE)) {
-            RAMBlock *block = ram_block_from_stream(f, flags);
+            RAMBlock *block = ram_block_from_stream(mis, f, flags);
 
             host = host_from_ram_block_offset(block, addr);
             /*
-- 
2.32.0


