Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7802CA01E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:41:59 +0100 (CET)
Received: from localhost ([::1]:34508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk36d-0001Rj-0B
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30I-0002Nx-KT
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk307-0003rC-BM
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2xQpkPILcilVjGBJAZDcOXL4fhbJFhBizJguZe8vEgc=;
 b=Qixs/2V3Hw5OB2xsOG2qRuyErV4tODMnfg/xp0jnfh+8TvoML7ySGIK/3s7pMZq2yy3ZWq
 0Mzh/xNqfwjyqgt3UD+m6NgoHvJ3DF9yJ3ILGSfntt9DWoHK3NGDVskrRHytffHTWneyQJ
 T6R6XjFQUy6mUVEAYqaKR1rjTcHUopc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-XWtjqS1aP4uY8ruSGwGWxw-1; Tue, 01 Dec 2020 05:35:10 -0500
X-MC-Unique: XWtjqS1aP4uY8ruSGwGWxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7239805BE3;
 Tue,  1 Dec 2020 10:35:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 881CA1042A40;
 Tue,  1 Dec 2020 10:35:09 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/32] Revert "kernel-doc: Use c:struct for Sphinx 3.0 and
 later"
Date: Tue,  1 Dec 2020 05:34:46 -0500
Message-Id: <20201201103502.4024573-17-pbonzini@redhat.com>
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 152d1967f650f67b7ece3a5dda77d48069d72647.
We will replace the commit with the fix from Linux.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-16-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/sphinx/kerneldoc.py |  1 -
 scripts/kernel-doc       | 16 +---------------
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/docs/sphinx/kerneldoc.py b/docs/sphinx/kerneldoc.py
index 9124fcbff1..c0180e02a2 100644
--- a/docs/sphinx/kerneldoc.py
+++ b/docs/sphinx/kerneldoc.py
@@ -102,7 +102,6 @@ class KernelDocDirective(Directive):
                 env.note_dependency(os.path.abspath(f))
                 cmd += ['-export-file', f]
 
-        cmd += ['-sphinx-version', sphinx.__version__]
         cmd += [filename]
 
         try:
diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index cb603532ed..60f75cd176 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -71,8 +71,6 @@ Output selection (mutually exclusive):
 			DOC: sections. May be specified multiple times.
 
 Output selection modifiers:
-  -sphinx-version VER   Generate rST syntax for the specified Sphinx version.
-                        Only works with reStructuredTextFormat.
   -no-doc-sections	Do not output DOC: sections.
   -enable-lineno        Enable output of #define LINENO lines. Only works with
                         reStructuredText format.
@@ -294,7 +292,6 @@ use constant {
 };
 my $output_selection = OUTPUT_ALL;
 my $show_not_found = 0;	# No longer used
-my $sphinx_version = "0.0"; # if not specified, assume old
 
 my @export_file_list;
 
@@ -460,8 +457,6 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
 	    $enable_lineno = 1;
     } elsif ($cmd eq 'show-not-found') {
 	$show_not_found = 1;  # A no-op but don't fail
-    } elsif ($cmd eq 'sphinx-version') {
-        $sphinx_version = shift @ARGV;
     } else {
 	# Unknown argument
         usage();
@@ -989,16 +984,7 @@ sub output_struct_rst(%) {
     my $oldprefix = $lineprefix;
     my $name = $args{'type'} . " " . $args{'struct'};
 
-    # Sphinx 3.0 and up will emit warnings for "c:type:: struct Foo".
-    # It wants to see "c:struct:: Foo" (and will add the word 'struct' in
-    # the rendered output).
-    if ((split(/\./, $sphinx_version))[0] >= 3) {
-        my $sname = $name;
-        $sname =~ s/^struct //;
-        print "\n\n.. c:struct:: " . $sname . "\n\n";
-    } else {
-        print "\n\n.. c:type:: " . $name . "\n\n";
-    }
+    print "\n\n.. c:type:: " . $name . "\n\n";
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
     output_highlight_rst($args{'purpose'});
-- 
2.26.2



