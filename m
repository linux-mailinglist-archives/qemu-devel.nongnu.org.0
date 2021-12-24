Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36F047EC69
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 08:04:39 +0100 (CET)
Received: from localhost ([::1]:51748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0ed4-0001sD-Li
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 02:04:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePS-0001Fk-Sa
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePR-0005rI-Am
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640328632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7+IaUs/ri/bBQ3wmEyPeRxPM6SAsBS5ON+zrdwGBIM=;
 b=SlSp0i3+RPk+2RmqjKotgVdX5ZAVO3UNlLsCPrctAMI+FHR/LujRYi0amC9+YKNgLBInAn
 Qm61qpySxrneW0CWO/z2caIiniynJ41sKoO5bsTuSD4aSRvgAPgCVOmZvVRYWk5CuSYMwY
 pMbD7fxjI5Hi4jeB+BT21f/G93YYO0s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-3CPvFvfENMiJvkLfek2UlQ-1; Fri, 24 Dec 2021 01:50:30 -0500
X-MC-Unique: 3CPvFvfENMiJvkLfek2UlQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adf9b8d000000b001a2aa837f8dso1470541wrc.3
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 22:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f7+IaUs/ri/bBQ3wmEyPeRxPM6SAsBS5ON+zrdwGBIM=;
 b=Med/axj9sk15oNQxWznUODnVoQxNYV8uBI3Qk9rT/1cb7lKnIYEyattQ3TigAajIX/
 m7RxVaMp/3mJt007py7+rG8KfplBgpQrXz0NmX7lOC/2g9QIgZdvkTfRBpkSMngSnibB
 /7blH5BCrAcl92HEek+cveZrQu/BS3InhyB8HRA8bYzatTMG0DnjJlmWpj98KdLmV6KI
 gMa8ExMO0ifhNwB2W6rTbps4ttVKBgVfGBnNGJe89HoVzWVdvXlrpRQaCYgdhqbHxORJ
 qtAY1lb7dfBsvZRyaKMTGBeXu113cYJGjkmfmpAUoF9C99B6b2MATAQmwlXmWH5ebOjh
 dmvw==
X-Gm-Message-State: AOAM532C/unRYXulHUnIAEWy2a3hZftbqs4t+u6UOdzXKY2KJdo8OAf/
 UUwp9AYoV5VrHEr/PvRt96lT3SiplZGU8rJeF86JIxXUrVQv/q8P06HZixhsRLGDjTv6Dc1X/2g
 kDjZfXqUOawfqFA1BwvhNg3LlJ944r7wZ3FWLeOZN+nKDeEiNHLM+D3mlHYp7as6R
X-Received: by 2002:adf:e4ce:: with SMTP id v14mr3671337wrm.370.1640328629312; 
 Thu, 23 Dec 2021 22:50:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhnFV8sqK/Eu+nN+9y5JGqQ+C8qwZcgDs+eIrFalQWkPGtjgz/YO/sJp4vk3PQKfZggpOa1A==
X-Received: by 2002:adf:e4ce:: with SMTP id v14mr3671322wrm.370.1640328629089; 
 Thu, 23 Dec 2021 22:50:29 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.8])
 by smtp.gmail.com with ESMTPSA id h14sm2174425wmq.16.2021.12.23.22.50.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Dec 2021 22:50:28 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/8] migration: Dump sub-cmd name in loadvm_process_command
 tp
Date: Fri, 24 Dec 2021 14:49:58 +0800
Message-Id: <20211224065000.97572-7-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211224065000.97572-1-peterx@redhat.com>
References: <20211224065000.97572-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It'll be easier to read the name rather than index of sub-cmd when debugging.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/savevm.c     | 3 ++-
 migration/trace-events | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 0bef031acb..7f7af6f750 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2272,12 +2272,13 @@ static int loadvm_process_command(QEMUFile *f)
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


