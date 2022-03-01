Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9E14C872E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:56:21 +0100 (CET)
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyIu-0001fe-UR
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:56:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3C-00049i-Qw
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3B-000891-7s
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41Js5PNU7Y+xQ6FoNmu0DLJBoBEaZC2FdumT8DVak1w=;
 b=dtKrRoBoE4r6iHrt1yW5PxnlkwEj7RFykaQzPOioee0O4VgS2zUmNgNm1WLZty912TYywK
 ghzqu2kHHR0f61ShDYBT1E/Dyjp5U4jYvTyO6MfnSfBTNWGgPaJAYKSYo7Clazn1kgsfjK
 s8zeJJ3g/Btr8IsMjyHbwqr6G27+CqU=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-tMsVCqWZN8K49j0AofARaA-1; Tue, 01 Mar 2022 03:40:03 -0500
X-MC-Unique: tMsVCqWZN8K49j0AofARaA-1
Received: by mail-pf1-f200.google.com with SMTP id
 v127-20020a622f85000000b004f3dfd386e8so6375328pfv.16
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=41Js5PNU7Y+xQ6FoNmu0DLJBoBEaZC2FdumT8DVak1w=;
 b=obaOj/DIU0XPqDUDCaYV4KGyA0u5enxQ8f+AqPvGKB4+GuRhgs+MzCVmiT2qmiUrbZ
 VttgTbx8lU9ma06M7oWQ4S+XetinT1bakdNpakKJoPvNVcKN1blTadyx40maTdWXW/i5
 JVrrqm2QzOVSgDiWKe03jiYtDYxWV0b33n1oUGhZSBb2q03PG11/qqSf2Sy5grWHAlA8
 KmUDh2qurCADk+V5IETUN5LNdtewZf/b552mw1jA0mvyv+Q++7e1j1ckGhwezyvOa2g9
 /Vs64rL/VyIIu6J86ssNFptcvseJa6ZTAMX3kwrj1EjKz0bhAWmqWiWIH8SLzcMj11nN
 FdVA==
X-Gm-Message-State: AOAM531WjrxNe/qB/VgxZukS0ai4qZDnKqjNP730+WQoTBpR2tDgfQ+2
 P4FPAmTbPDTC8w5TIdj8Nwq2ub0glrhnRt0QQrOPa3o448vniAYWf1DW/MMCTPkNys95NHbIoug
 5KF+HFM5YtYAhi+Gv4ZfFdCCugB2ZetR3iVc2qYHChsGrapGFPz2uGyfbXfCND8ct
X-Received: by 2002:a63:70b:0:b0:373:9e98:d8f9 with SMTP id
 11-20020a63070b000000b003739e98d8f9mr20368703pgh.242.1646124002501; 
 Tue, 01 Mar 2022 00:40:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdfbtVKd2tQsbkxJxV6Rp4kXkM8GK07qN7v4dB7ZxaGrMLpe+q3+bjzzrUAGJCxJqgWxxxCw==
X-Received: by 2002:a63:70b:0:b0:373:9e98:d8f9 with SMTP id
 11-20020a63070b000000b003739e98d8f9mr20368677pgh.242.1646124002131; 
 Tue, 01 Mar 2022 00:40:02 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.39.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:40:01 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/25] migration: Enlarge postcopy recovery to capture
 !-EIO too
Date: Tue,  1 Mar 2022 16:39:10 +0800
Message-Id: <20220301083925.33483-11-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

We used to have quite a few places making sure -EIO happened and that's the
only way to trigger postcopy recovery.  That's based on the assumption that
we'll only return -EIO for channel issues.

It'll work in 99.99% cases but logically that won't cover some corner cases.
One example is e.g. ram_block_from_stream() could fail with an interrupted
network, then -EINVAL will be returned instead of -EIO.

I remembered Dave Gilbert pointed that out before, but somehow this is
overlooked.  Neither did I encounter anything outside the -EIO error.

However we'd better touch that up before it triggers a rare VM data loss during
live migrating.

To cover as much those cases as possible, remove the -EIO restriction on
triggering the postcopy recovery, because even if it's not a channel failure,
we can't do anything better than halting QEMU anyway - the corpse of the
process may even be used by a good hand to dig out useful memory regions, or
the admin could simply kill the process later on.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c    | 4 ++--
 migration/postcopy-ram.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 6e4cc9cc87..67520d3105 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2877,7 +2877,7 @@ retry:
 out:
     res = qemu_file_get_error(rp);
     if (res) {
-        if (res == -EIO && migration_in_postcopy()) {
+        if (res && migration_in_postcopy()) {
             /*
              * Maybe there is something we can do: it looks like a
              * network down issue, and we pause for a recovery.
@@ -3478,7 +3478,7 @@ static MigThrError migration_detect_error(MigrationState *s)
         error_free(local_error);
     }
 
-    if (state == MIGRATION_STATUS_POSTCOPY_ACTIVE && ret == -EIO) {
+    if (state == MIGRATION_STATUS_POSTCOPY_ACTIVE && ret) {
         /*
          * For postcopy, we allow the network to be down for a
          * while. After that, it can be continued by a
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index d08d396c63..b0d12d5053 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1039,7 +1039,7 @@ retry:
                                         msg.arg.pagefault.address);
             if (ret) {
                 /* May be network failure, try to wait for recovery */
-                if (ret == -EIO && postcopy_pause_fault_thread(mis)) {
+                if (postcopy_pause_fault_thread(mis)) {
                     /* We got reconnected somehow, try to continue */
                     goto retry;
                 } else {
-- 
2.32.0


