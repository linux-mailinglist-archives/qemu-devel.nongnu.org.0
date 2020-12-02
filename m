Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE50C2CB8A0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:23:51 +0100 (CET)
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOMY-0002U0-O2
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:23:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDO-0003xI-Gl
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCe-0003rL-0I
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e8hnoZGivgr313ZDbOqA0Nv2kwefhhsEAfF44TGY+aU=;
 b=LtEUVkvguKY8Q/BpU4I1RD2kMJ0pnPAUsBeV0xG1xwsirKr65G6i1Mo2F9VTTplq1CGlge
 iPP8nIL8UtpIV1YzrYfcnooXXdK5XB8+LsogIU/hzAVlroOVcffBIfx+SlSAFUXoH4Ccnl
 75wjoNPAbYAXaBWfwMLwdhK8yG4LTq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-MSzugtTQNCuUtLdG7UStcg-1; Wed, 02 Dec 2020 03:09:27 -0500
X-MC-Unique: MSzugtTQNCuUtLdG7UStcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3BA7185E489
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:26 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A80CE5C1B4
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:26 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 099/113] scripts: kernel-doc: use a less pedantic markup for
 funcs on Sphinx 3.x
Date: Wed,  2 Dec 2020 03:08:35 -0500
Message-Id: <20201202080849.4125477-100-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Unfortunately, Sphinx 3.x parser for c functions is too pedantic:

	https://github.com/sphinx-doc/sphinx/issues/8241

While it could be relaxed with some configurations, there are
several corner cases that it would make it hard to maintain,
and will require teaching conf.py about several macros.

So, let's instead use the :c:macro notation. This will
produce an output that it is not as nice as currently, but it
should still be acceptable, and will provide cross-references,
removing thousands of warnings when building with newer
versions of Sphinx.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-18-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 771367a6ab..75ddd3b5e6 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -886,19 +886,29 @@ sub output_function_rst(%) {
     my $oldprefix = $lineprefix;
     my $start = "";
 
-    if ($args{'typedef'}) {
-	if ($sphinx_major < 3) {
+    if ($sphinx_major < 3) {
+	if ($args{'typedef'}) {
 	    print ".. c:type:: ". $args{'function'} . "\n\n";
+	    print_lineno($declaration_start_line);
+	    print "   **Typedef**: ";
+	    $lineprefix = "";
+	    output_highlight_rst($args{'purpose'});
+	    $start = "\n\n**Syntax**\n\n  ``";
 	} else {
-	    print ".. c:function:: ". $args{'function'} . "\n\n";
+	    print ".. c:function:: ";
 	}
-	print_lineno($declaration_start_line);
-	print "   **Typedef**: ";
-	$lineprefix = "";
-	output_highlight_rst($args{'purpose'});
-	$start = "\n\n**Syntax**\n\n  ``";
     } else {
-	print ".. c:function:: ";
+	print ".. c:macro:: ". $args{'function'} . "\n\n";
+
+	if ($args{'typedef'}) {
+	    print_lineno($declaration_start_line);
+	    print "   **Typedef**: ";
+	    $lineprefix = "";
+	    output_highlight_rst($args{'purpose'});
+	    $start = "\n\n**Syntax**\n\n  ``";
+	} else {
+	    print "``";
+	}
     }
     if ($args{'functiontype'} ne "") {
 	$start .= $args{'functiontype'} . " " . $args{'function'} . " (";
@@ -925,7 +935,11 @@ sub output_function_rst(%) {
     if ($args{'typedef'}) {
 	print ");``\n\n";
     } else {
-	print ")\n\n";
+	if ($sphinx_major < 3) {
+	    print ")\n\n";
+	} else {
+	    print ")``\n";
+	}
 	print_lineno($declaration_start_line);
 	$lineprefix = "   ";
 	output_highlight_rst($args{'purpose'});
-- 
2.26.2



