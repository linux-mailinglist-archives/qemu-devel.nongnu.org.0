Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088E92CA026
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:44:53 +0100 (CET)
Received: from localhost ([::1]:42916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk39P-0004yk-W9
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30K-0002OQ-Gv
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk307-0003rE-B0
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aRud3jdLb9FJvuGehd6OGDqI+KIpo1xj4TsOlXShFvA=;
 b=QyMkqeZziCNtaIwoblMX8hSMC0n6g/Or4X/lqk+1Q6VulH00amFA/qRB2qU/ku2qZTNdl4
 28QSoKX+Pi8zHO/1is07WcMYpi14ocnLRd6FsNBVbPdZ1rUe82zdb3P/aPb9wlY6gKPz5e
 ATFh8n1k69zIrmKp2857fWB8QWYD51w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-u6MVV40EOeGoBwyQ4XHlXQ-1; Tue, 01 Dec 2020 05:35:12 -0500
X-MC-Unique: u6MVV40EOeGoBwyQ4XHlXQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 426E6190A7C8;
 Tue,  1 Dec 2020 10:35:11 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E062910023BC;
 Tue,  1 Dec 2020 10:35:10 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/32] scripts: kernel-doc: fix troubles with line counts
Date: Tue,  1 Dec 2020 05:34:49 -0500
Message-Id: <20201201103502.4024573-20-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-1-pbonzini@redhat.com>
References: <20201201103502.4024573-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There's currently a bug with the way kernel-doc script
counts line numbers that can be seen with:

	$ ./scripts/kernel-doc -rst  -enable-lineno include/linux/math64.h >all && ./scripts/kernel-doc -rst -internal -enable-lineno include/linux/math64.h >int && diff -U0 int all

	--- int	2020-09-28 12:58:08.927486808 +0200
	+++ all	2020-09-28 12:58:08.905486845 +0200
	@@ -1 +1 @@
	-#define LINENO 27
	+#define LINENO 26
	@@ -3 +3 @@
	-#define LINENO 16
	+#define LINENO 15
	@@ -9 +9 @@
	-#define LINENO 17
	+#define LINENO 16
	...

This is happening with perl version 5.30.3, but I'm not
so sure if this is a perl bug, or if this is due to something
else.

In any case, fixing it is easy. Basically, when "-internal"
parameter is used, the process_export_file() function opens the
handle "IN". This makes the line number to be incremented, as the
handler for the main open is also "IN".

Fix the problem by using a different handler for the
main open().

While here, add a missing close for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-19-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 75ddd3b5e6..f33a4b1cc7 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -2268,7 +2268,7 @@ sub process_file($) {
 
     $file = map_filename($orig_file);
 
-    if (!open(IN,"<$file")) {
+    if (!open(IN_FILE,"<$file")) {
 	print STDERR "Error: Cannot open file $file\n";
 	++$errors;
 	return;
@@ -2277,9 +2277,9 @@ sub process_file($) {
     $. = 1;
 
     $section_counter = 0;
-    while (<IN>) {
+    while (<IN_FILE>) {
 	while (s/\\\s*$//) {
-	    $_ .= <IN>;
+	    $_ .= <IN_FILE>;
 	}
 	# Replace tabs by spaces
         while ($_ =~ s/\t+/' ' x (length($&) * 8 - length($`) % 8)/e) {};
@@ -2311,6 +2311,7 @@ sub process_file($) {
 	    print STDERR "${file}:1: warning: no structured comments found\n";
 	}
     }
+    close IN_FILE;
 }
 
 
-- 
2.26.2



