Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC5B31D069
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 19:50:27 +0100 (CET)
Received: from localhost ([::1]:33010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5QY-0004ZG-38
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 13:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC5EY-0004OY-Pt
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:38:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lC5EW-0000Hn-Im
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 13:38:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613500678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BCfRkMvnkmlcoYor2lyxQrdDMQrSkS0csvhAugNFYi4=;
 b=Y80uoKT11rRrqVHx5Bjm9p4YqGjQtG0DTrKsLIi5gRZpPm+fmOYgZFWfOpd0REBkI35Wcn
 TSbV/H5zu5w4EzSwp6f8s1HGzzWpEfwKpOLfCQ/Nel28Ti6MRd0+nIBal8pHg8szS43Tvp
 YPkzVFkCbZkV2aEAHC9nIeHGXb9mcq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-lbQbO6H1NUue03ULthORJQ-1; Tue, 16 Feb 2021 13:37:49 -0500
X-MC-Unique: lbQbO6H1NUue03ULthORJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56CDE801965;
 Tue, 16 Feb 2021 18:37:48 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-109.ams2.redhat.com
 [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E74A05C1B4;
 Tue, 16 Feb 2021 18:37:46 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, wainersm@redhat.com, groug@kaod.org,
 philmd@redhat.com, vgoyal@redhat.com
Subject: [PULL 3/6] tools/virtiofsd: Replace the word 'whitelist'
Date: Tue, 16 Feb 2021 18:37:31 +0000
Message-Id: <20210216183734.57810-4-dgilbert@redhat.com>
In-Reply-To: <20210216183734.57810-1-dgilbert@redhat.com>
References: <20210216183734.57810-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210205171817.2108907-3-philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c      |  6 +++---
 tools/virtiofsd/passthrough_seccomp.c | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 147b59338a..5f3afe8557 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3204,7 +3204,7 @@ static void setup_mounts(const char *source)
 }
 
 /*
- * Only keep whitelisted capabilities that are needed for file system operation
+ * Only keep capabilities in allowlist that are needed for file system operation
  * The (possibly NULL) modcaps_in string passed in is free'd before exit.
  */
 static void setup_capabilities(char *modcaps_in)
@@ -3214,8 +3214,8 @@ static void setup_capabilities(char *modcaps_in)
     capng_restore_state(&cap.saved);
 
     /*
-     * Whitelist file system-related capabilities that are needed for a file
-     * server to act like root.  Drop everything else like networking and
+     * Add to allowlist file system-related capabilities that are needed for a
+     * file server to act like root.  Drop everything else like networking and
      * sysadmin capabilities.
      *
      * Exclusions:
diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
index ea852e2e33..62441cfcdb 100644
--- a/tools/virtiofsd/passthrough_seccomp.c
+++ b/tools/virtiofsd/passthrough_seccomp.c
@@ -21,7 +21,7 @@
 #endif
 #endif
 
-static const int syscall_whitelist[] = {
+static const int syscall_allowlist[] = {
     /* TODO ireg sem*() syscalls */
     SCMP_SYS(brk),
     SCMP_SYS(capget), /* For CAP_FSETID */
@@ -117,12 +117,12 @@ static const int syscall_whitelist[] = {
 };
 
 /* Syscalls used when --syslog is enabled */
-static const int syscall_whitelist_syslog[] = {
+static const int syscall_allowlist_syslog[] = {
     SCMP_SYS(send),
     SCMP_SYS(sendto),
 };
 
-static void add_whitelist(scmp_filter_ctx ctx, const int syscalls[], size_t len)
+static void add_allowlist(scmp_filter_ctx ctx, const int syscalls[], size_t len)
 {
     size_t i;
 
@@ -153,10 +153,10 @@ void setup_seccomp(bool enable_syslog)
         exit(1);
     }
 
-    add_whitelist(ctx, syscall_whitelist, G_N_ELEMENTS(syscall_whitelist));
+    add_allowlist(ctx, syscall_allowlist, G_N_ELEMENTS(syscall_allowlist));
     if (enable_syslog) {
-        add_whitelist(ctx, syscall_whitelist_syslog,
-                      G_N_ELEMENTS(syscall_whitelist_syslog));
+        add_allowlist(ctx, syscall_allowlist_syslog,
+                      G_N_ELEMENTS(syscall_allowlist_syslog));
     }
 
     /* libvhost-user calls this for post-copy migration, we don't need it */
-- 
2.29.2


