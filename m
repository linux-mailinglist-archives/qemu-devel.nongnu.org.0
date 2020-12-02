Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8157B2CB8E3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:31:29 +0100 (CET)
Received: from localhost ([::1]:46788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOTw-0002UF-Ha
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDP-0003yY-25
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCd-0003qO-4K
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRIkoNqZeWXHR0EnZtaHGymS/XZpyIR+HCZcqdjuTu0=;
 b=gCgKj1crjoaxMzwehUmC1a07+d6My9KPOC6KZRF/P36HEVf9eBUA2Ai5reEJJ7gpKjitKA
 H14f6zIfACMFEE3tq7CY5nLvaukhJM18La6JEf+TxxI1BvUiU2Zh/ckc8FK8xjfB8bd5p1
 +WDM0FJfZqqRGxMCZsJCeYa6DkJhUVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-Pu2nTXLpMbOyvTF7du9jrQ-1; Wed, 02 Dec 2020 03:09:27 -0500
X-MC-Unique: Pu2nTXLpMbOyvTF7du9jrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87D12185E48B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:26 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C45B5C1B4
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:26 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 098/113] scripts: kernel-doc: make it more compatible with
 Sphinx 3.x
Date: Wed,  2 Dec 2020 03:08:34 -0500
Message-Id: <20201202080849.4125477-99-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

With Sphinx 3.x, the ".. c:type:" tag was changed to accept either:

	.. c:type:: typedef-like declaration
	.. c:type:: name

Using it for other types (including functions) don't work anymore.

So, there are newer tags for macro, enum, struct, union, and others,
which doesn't exist on older versions.

Add a check for the Sphinx version and change the produced tags
accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-17-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 71 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 65 insertions(+), 6 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 60f75cd176..771367a6ab 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -271,6 +271,8 @@ if ($#ARGV == -1) {
 }
 
 my $kernelversion;
+my $sphinx_major;
+
 my $dohighlight = "";
 
 my $verbose = 0;
@@ -465,6 +467,43 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
 
 # continue execution near EOF;
 
+# The C domain dialect changed on Sphinx 3. So, we need to check the
+# version in order to produce the right tags.
+sub findprog($)
+{
+	foreach(split(/:/, $ENV{PATH})) {
+		return "$_/$_[0]" if(-x "$_/$_[0]");
+	}
+}
+
+sub get_sphinx_version()
+{
+	my $ver;
+	my $major = 1;
+
+	my $cmd = "sphinx-build";
+	if (!findprog($cmd)) {
+		my $cmd = "sphinx-build3";
+		return $major if (!findprog($cmd));
+	}
+
+	open IN, "$cmd --version 2>&1 |";
+	while (<IN>) {
+		if (m/^\s*sphinx-build\s+([\d]+)\.([\d\.]+)(\+\/[\da-f]+)?$/) {
+			$major=$1;
+			last;
+		}
+		# Sphinx 1.2.x uses a different format
+		if (m/^\s*Sphinx.*\s+([\d]+)\.([\d\.]+)$/) {
+			$major=$1;
+			last;
+		}
+	}
+	close IN;
+
+	return $major;
+}
+
 # get kernel version from env
 sub get_kernel_version() {
     my $version = 'unknown kernel version';
@@ -848,7 +887,11 @@ sub output_function_rst(%) {
     my $start = "";
 
     if ($args{'typedef'}) {
-	print ".. c:type:: ". $args{'function'} . "\n\n";
+	if ($sphinx_major < 3) {
+	    print ".. c:type:: ". $args{'function'} . "\n\n";
+	} else {
+	    print ".. c:function:: ". $args{'function'} . "\n\n";
+	}
 	print_lineno($declaration_start_line);
 	print "   **Typedef**: ";
 	$lineprefix = "";
@@ -938,9 +981,14 @@ sub output_enum_rst(%) {
     my ($parameter);
     my $oldprefix = $lineprefix;
     my $count;
-    my $name = "enum " . $args{'enum'};
 
-    print "\n\n.. c:type:: " . $name . "\n\n";
+    if ($sphinx_major < 3) {
+	my $name = "enum " . $args{'enum'};
+	print "\n\n.. c:type:: " . $name . "\n\n";
+    } else {
+	my $name = $args{'enum'};
+	print "\n\n.. c:enum:: " . $name . "\n\n";
+    }
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
     output_highlight_rst($args{'purpose'});
@@ -966,8 +1014,13 @@ sub output_typedef_rst(%) {
     my %args = %{$_[0]};
     my ($parameter);
     my $oldprefix = $lineprefix;
-    my $name = "typedef " . $args{'typedef'};
+    my $name;
 
+    if ($sphinx_major < 3) {
+	$name = "typedef " . $args{'typedef'};
+    } else {
+	$name = $args{'typedef'};
+    }
     print "\n\n.. c:type:: " . $name . "\n\n";
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
@@ -982,9 +1035,14 @@ sub output_struct_rst(%) {
     my %args = %{$_[0]};
     my ($parameter);
     my $oldprefix = $lineprefix;
-    my $name = $args{'type'} . " " . $args{'struct'};
 
-    print "\n\n.. c:type:: " . $name . "\n\n";
+    if ($sphinx_major < 3) {
+	my $name = $args{'type'} . " " . $args{'struct'};
+	print "\n\n.. c:type:: " . $name . "\n\n";
+    } else {
+	my $name = $args{'struct'};
+	print "\n\n.. c:struct:: " . $name . "\n\n";
+    }
     print_lineno($declaration_start_line);
     $lineprefix = "   ";
     output_highlight_rst($args{'purpose'});
@@ -2242,6 +2300,7 @@ sub process_file($) {
 }
 
 
+$sphinx_major = get_sphinx_version();
 $kernelversion = get_kernel_version();
 
 # generate a sequence of code that will splice in highlighting information
-- 
2.26.2



