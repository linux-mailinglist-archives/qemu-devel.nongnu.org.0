Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C4047B1A9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:54:00 +0100 (CET)
Received: from localhost ([::1]:43826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLvD-0008KX-I3
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:53:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKQR-0001xw-6n
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:18:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKQF-0006IL-NY
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7+IaUs/ri/bBQ3wmEyPeRxPM6SAsBS5ON+zrdwGBIM=;
 b=Am11d2mt0b+x1aoSVShHHEJOMnmBZdsriFSuisnbyjsX6DuRtTBcOZU0soLaVUPp6jio1c
 eVuiFNXj1OklghNzhYxebMYmxZOMs2eRNDz4K3412ycfN0r2tap3VbWsFCgVtU1A9j/PSn
 vVkbNQSXgbfkTcalavBNQUoSo6VBZSo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-SCkgulAHOvChhymcvAVpkQ-1; Mon, 20 Dec 2021 03:54:36 -0500
X-MC-Unique: SCkgulAHOvChhymcvAVpkQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z199-20020a1c7ed0000000b003456affcffaso6170635wmc.2
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 00:54:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f7+IaUs/ri/bBQ3wmEyPeRxPM6SAsBS5ON+zrdwGBIM=;
 b=dwtllxSYLt6fAC4o+xG0jH8zhHLhxY/gh8oJ8CWsDTb4l1K7ws4XQeDnqoxLe56a7H
 LJUoM2zdMsd2dJDxSvq4ttshkdsvX4GdaqTsAZ9cqoB4oeloPdMv6TyRqWcW3v7niJTu
 VRNhJm1DKI6GEFa+Ge+fayuYFH9FMQUscerXPDdHhJOmztBuirN1bz8za5bDvExZAyfr
 x5JK42s/0hA+qDAXIqDjIuwkiTVTNmSiYDlhWoUI6X8lhsPRMLCUPUo+IjVv3fptZ8vG
 3wmUf2uok2h+HldezMzKIpD6aDaoKyF0L2B/q4uIi30/6wJnNoq6BqEp93UI/imefZtD
 +neg==
X-Gm-Message-State: AOAM5331n1nfZp2ohX9tirMw1on3DhoTwhl3bDKSUM8KO1J/l3JO1soz
 pEjHRE7WOEkFkA56ii8FwlvWQUhfk9JjBnXa33/gW60Tm4QuKNgkz1AFT5rOD0cZgCW3vlk4sxP
 WJ8mghFO23pfi6HaMNEBUT3NU9gXotX73VtTqf5CF39c8qG7v5FUaIEnaHEugbflt
X-Received: by 2002:a05:600c:4ed2:: with SMTP id
 g18mr13149475wmq.25.1639990475136; 
 Mon, 20 Dec 2021 00:54:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuytwfdUQ70lhg2tLyUKIEqe9z5I+QDObRkK/Sn0PIFGOC1i/tswUIK2tZPH5XFaAXanwkXA==
X-Received: by 2002:a05:600c:4ed2:: with SMTP id
 g18mr13149457wmq.25.1639990474831; 
 Mon, 20 Dec 2021 00:54:34 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.164])
 by smtp.gmail.com with ESMTPSA id h2sm14439713wrz.23.2021.12.20.00.54.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Dec 2021 00:54:34 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] migration: Dump sub-cmd name in loadvm_process_command
 tp
Date: Mon, 20 Dec 2021 16:53:53 +0800
Message-Id: <20211220085355.2284-7-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211220085355.2284-1-peterx@redhat.com>
References: <20211220085355.2284-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.209, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


