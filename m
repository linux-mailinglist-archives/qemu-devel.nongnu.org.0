Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6169046BA75
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 12:54:32 +0100 (CET)
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muZ3G-00055i-Ed
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 06:54:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzg-0005dN-Q8
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzf-0004q1-5z
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638877846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ME4kLSP5lhgHWBxXaiMyGh0qPJuS3dwOj2lYhY6dAjo=;
 b=Cotr6Vo5zDYWP5+IkmC2BrWUSQOKoOpTIPByakqvU/oX3ZJntvCh1DOC1GwmsmkZ6m8Zpb
 BPC/w9LrExGO7xN3SRFNIiBkYcYhHZ1Kg5xyLRREi9wUlKIXWydRAYz/mmkI03PxaRJmCa
 S3v+E7yOF5mtgyoloLJ6hfcmySU0hlE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-521-K0-g76nMMdOArgdC3nFvUA-1; Tue, 07 Dec 2021 06:50:45 -0500
X-MC-Unique: K0-g76nMMdOArgdC3nFvUA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso1267384wms.0
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 03:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ME4kLSP5lhgHWBxXaiMyGh0qPJuS3dwOj2lYhY6dAjo=;
 b=K9RyD5MhAgDeFfXkoZ8hqH2VfWKkrw9SLvJMKrqGdoSg1ZfN8qcchrR9TESg0gWHQo
 UQoZ3KMx/iTSl6Y1GOye8jc6Vbu76/j+4DGcyG5LMjexuHdaN+tHkdxV7ecQzUW5e4rg
 SngmFDNmgfk5XsYQy+cEoZfjuPwSDRvy/WD5a0dP+xB4Hei8a02vwZ68WSAfSlhEm+c7
 X5s7A49Xpp0bh/tWTgXPg492v9wcZUJp6RCnXnf3+6M61YkxSx/hirkmDDglvK+JmteF
 jP/bkV8yN4gcic7Xe97jzI2iNmGN3RMSo87m51WMBkCwrQCHat7aaqDhI3/QyQU+NDkf
 M+ew==
X-Gm-Message-State: AOAM532ew1rm1d218bebQ9Bdx3Aom4yDhX29k6EvtHwOqi1cyoXjdHJZ
 zrQaNcGGmA0ZGmZCiOubqB3nZcUIdGAkTOVTNFRl+OLf570dnu8hhjGaXXpPpQdvvZUTnAqIxby
 +Q99HhXu2hRVUlauzMDsF2JAzKcz3PUboeGMZ1VBP+pMfUayF3QxeaVwqVVsT54bZ
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr50576232wrd.33.1638877844100; 
 Tue, 07 Dec 2021 03:50:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzD1HuLxZAei45zNliLwJwcvBvWF6Nac3TfpekFsb6QvaH4/80VgczYPsP9np8UYxGTQK/OxA==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr50576204wrd.33.1638877843835; 
 Tue, 07 Dec 2021 03:50:43 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.177])
 by smtp.gmail.com with ESMTPSA id g18sm3023551wmq.4.2021.12.07.03.50.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 03:50:43 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] migration: Dump sub-cmd name in loadvm_process_command tp
Date: Tue,  7 Dec 2021 19:50:15 +0800
Message-Id: <20211207115016.73195-7-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211207115016.73195-1-peterx@redhat.com>
References: <20211207115016.73195-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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

It'll be easier to read the name rather than index of sub-cmd when debugging.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/savevm.c     | 2 +-
 migration/trace-events | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index d59e976d50..17b8e25e00 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2271,7 +2271,7 @@ static int loadvm_process_command(QEMUFile *f)
         return qemu_file_get_error(f);
     }
 
-    trace_loadvm_process_command(cmd, len);
+    trace_loadvm_process_command(mig_cmd_args[cmd].name, len);
     if (cmd >= MIG_CMD_MAX || cmd == MIG_CMD_INVALID) {
         error_report("MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
         return -EINVAL;
diff --git a/migration/trace-events b/migration/trace-events
index b48d873b8a..d63a5915f5 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -22,7 +22,7 @@ loadvm_postcopy_handle_resume(void) ""
 loadvm_postcopy_ram_handle_discard(void) ""
 loadvm_postcopy_ram_handle_discard_end(void) ""
 loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s: %ud"
-loadvm_process_command(uint16_t com, uint16_t len) "com=0x%x len=%d"
+loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"
 loadvm_process_command_ping(uint32_t val) "0x%x"
 postcopy_ram_listen_thread_exit(void) ""
 postcopy_ram_listen_thread_start(void) ""
-- 
2.32.0


