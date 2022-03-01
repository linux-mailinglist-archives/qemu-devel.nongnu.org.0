Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDC64C86C7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:43:02 +0100 (CET)
Received: from localhost ([::1]:39396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOy60-0006FN-KA
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:43:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy2o-0003Pn-5A
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:39:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy2l-0007qn-Ex
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646123978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVsGHM6RhLibS9NK15rpLaSdALDGeWM7BQJKbM6wKrI=;
 b=h4MvnHb5ibJmUg5+H6fAwVECn/LddOUYX9A0xCbRb70501lofnMSx8ISxmE8YcpNVUnsHk
 qaXQQumSKymXbwjkFRtEjbTW57DmWu+C8rRDVk6GlFSSN36oonqtDxFtf0wzzINpWvqHXG
 qj/CHtrN/UPpqqonh6G1qhNWRaddPgY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-vPW9ZhuLNky2wui2wmSUVQ-1; Tue, 01 Mar 2022 03:39:37 -0500
X-MC-Unique: vPW9ZhuLNky2wui2wmSUVQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 mn16-20020a17090b189000b001bc2315d75cso1209621pjb.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TVsGHM6RhLibS9NK15rpLaSdALDGeWM7BQJKbM6wKrI=;
 b=bWfywLoJyXbKuC6CFrR7m8nyRRjeW1X9PcIxu0PbOJXcw4nbHUDV401vUtuf5Rmbpu
 TTbbd1kMvf7cSYoe3kmWqSyRLlcCylBhHyVmrNMV2x2H7eKDeQE5L/euiZsarF+2EpXf
 qfDZwIZEebDPSQhN4Uk51b0cXI6NG+0uxkGe/c1NAo0PxrgGScxFqy96SY/IavhIwgdw
 vF+JddLTVJgh0ErYn6nGtFdc+BHtBPjztnqiM0ei2PI6ZmxyFdUtLm1qr9ZjXMdaiiOD
 HAVnwIyQP5UlJ2eSXRaTjFp6rGUK2OWC09uRk3brxLn7kuVHDBaLwN+wDzbgQn/l211Z
 AhwQ==
X-Gm-Message-State: AOAM532yxVzFuL7/Ho/B0l7eRfrtk3jnVFWWGjcjxKUOAZrCV6M+ZJmX
 fXKCLNcfTwMviTKel06JaZ6bD567AZ5UkoH58YMtYzYLeP0QUjISD0qNXkE0mg68V6TS5zA5Ltw
 8NvvlmiWBhCR8iEh0sIZk0pKkg05Lgik58Qk1jXDPSF54yGNHyURs3pipEAQ4Vxlx
X-Received: by 2002:a17:90a:b307:b0:1bd:37f3:f0fc with SMTP id
 d7-20020a17090ab30700b001bd37f3f0fcmr11501934pjr.132.1646123976440; 
 Tue, 01 Mar 2022 00:39:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCHRN6RyLdYV/s8bdOrppKIlqiT6rI4Dhe74fFJPDbM1jFZuliGx+lOdQUERVeQPMr52DDRw==
X-Received: by 2002:a17:90a:b307:b0:1bd:37f3:f0fc with SMTP id
 d7-20020a17090ab30700b001bd37f3f0fcmr11501911pjr.132.1646123975909; 
 Tue, 01 Mar 2022 00:39:35 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.39.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:39:35 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/25] migration: Dump sub-cmd name in
 loadvm_process_command tp
Date: Tue,  1 Mar 2022 16:39:01 +0800
Message-Id: <20220301083925.33483-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301083925.33483-1-peterx@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/savevm.c     | 3 ++-
 migration/trace-events | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 1599b02fbc..7bb65e1d61 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2273,12 +2273,13 @@ static int loadvm_process_command(QEMUFile *f)
         return qemu_file_get_error(f);
     }
 
-    trace_loadvm_process_command(cmd, len);
     if (cmd >= MIG_CMD_MAX || cmd == MIG_CMD_INVALID) {
         error_report("MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
         return -EINVAL;
     }
 
+    trace_loadvm_process_command(mig_cmd_args[cmd].name, len);
+
     if (mig_cmd_args[cmd].len != -1 && mig_cmd_args[cmd].len != len) {
         error_report("%s received with bad length - expecting %zu, got %d",
                      mig_cmd_args[cmd].name,
diff --git a/migration/trace-events b/migration/trace-events
index 48aa7b10ee..123cfe79d7 100644
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


