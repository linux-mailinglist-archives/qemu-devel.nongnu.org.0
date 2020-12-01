Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450022CA056
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:51:51 +0100 (CET)
Received: from localhost ([::1]:40178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3GA-0007DQ-8j
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30P-0002Xh-6U
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kk30A-0003s7-Kb
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606818918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ukg5Y1cAgqxZBGLArhGZ7RHHMiikRdI3w0My8dsythw=;
 b=Sh3P5C7nn8iUMR046hjOd05RM4gELkDUIc/0tW9m1bLUXsYq0+OQFR43QE04QLVZcyum9u
 Cvy4b4AUxTE0q9oR3afxu6mj1yZzaAKwJBXzSK9BN02XQ3Wm0G8ncBzu+w0qY3T9vmwHic
 PytizHEAnQiWAZdYSqcKpmi2pv2vWyk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-m3Z1G1MhMLii7fFJSF5aHQ-1; Tue, 01 Dec 2020 05:35:14 -0500
X-MC-Unique: m3Z1G1MhMLii7fFJSF5aHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29BB38558E2;
 Tue,  1 Dec 2020 10:35:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D72B410013C1;
 Tue,  1 Dec 2020 10:35:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/32] scripts: kernel-doc: allow passing desired Sphinx C
 domain dialect
Date: Tue,  1 Dec 2020 05:34:53 -0500
Message-Id: <20201201103502.4024573-24-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

When kernel-doc is called via kerneldoc.py, there's no need to
auto-detect the Sphinx version, as the Sphinx module already
knows it. So, add an optional parameter to allow changing the
Sphinx dialect.

As kernel-doc can also be manually called, keep the auto-detection
logic if the parameter was not specified. On such case, emit
a warning if sphinx-build can't be found at PATH.

I ended using a suggestion from Joe for using a more readable
regex, instead of using a complex one with a hidden group like:

	m/^(\d+)\.(\d+)(?:\.?(\d+)?)/

in order to get the optional <patch> argument.

Thanks-to: Joe Perches <joe@perches.com>
Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-23-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/sphinx/kerneldoc.py |  5 ++++
 scripts/kernel-doc       | 51 +++++++++++++++++++++++++++++++++-------
 2 files changed, 48 insertions(+), 8 deletions(-)

diff --git a/docs/sphinx/kerneldoc.py b/docs/sphinx/kerneldoc.py
index c0180e02a2..079aadced3 100644
--- a/docs/sphinx/kerneldoc.py
+++ b/docs/sphinx/kerneldoc.py
@@ -69,6 +69,11 @@ class KernelDocDirective(Directive):
         env = self.state.document.settings.env
         cmd = env.config.kerneldoc_bin + ['-rst', '-enable-lineno']
 
+        # Pass the version string to kernel-doc, as it needs to use a different
+        # dialect, depending what the C domain supports for each specific
+        # Sphinx versions
+        cmd += ['-sphinx-version', sphinx.__version__]
+
         filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
         export_file_patterns = []
 
diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 478037f736..667ad3169c 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -56,6 +56,13 @@ Output format selection (mutually exclusive):
   -rst			Output reStructuredText format.
   -none			Do not output documentation, only warnings.
 
+Output format selection modifier (affects only ReST output):
+
+  -sphinx-version	Use the ReST C domain dialect compatible with an
+			specific Sphinx Version.
+			If not specified, kernel-doc will auto-detect using
+			the sphinx-build version found on PATH.
+
 Output selection (mutually exclusive):
   -export		Only output documentation for symbols that have been
 			exported using EXPORT_SYMBOL() or EXPORT_SYMBOL_GPL()
@@ -270,7 +277,7 @@ if ($#ARGV == -1) {
 }
 
 my $kernelversion;
-my $sphinx_major;
+my ($sphinx_major, $sphinx_minor, $sphinx_patch);
 
 my $dohighlight = "";
 
@@ -457,6 +464,23 @@ while ($ARGV[0] =~ m/^--?(.*)/) {
 	    $enable_lineno = 1;
     } elsif ($cmd eq 'show-not-found') {
 	$show_not_found = 1;  # A no-op but don't fail
+    } elsif ($cmd eq "sphinx-version") {
+	my $ver_string = shift @ARGV;
+	if ($ver_string =~ m/^(\d+)(\.\d+)?(\.\d+)?/) {
+	    $sphinx_major = $1;
+	    if (defined($2)) {
+		$sphinx_minor = substr($2,1);
+	    } else {
+		$sphinx_minor = 0;
+	    }
+	    if (defined($3)) {
+		$sphinx_patch = substr($3,1)
+	    } else {
+		$sphinx_patch = 0;
+	    }
+	} else {
+	    die "Sphinx version should either major.minor or major.minor.patch format\n";
+	}
     } else {
 	# Unknown argument
         usage();
@@ -477,29 +501,37 @@ sub findprog($)
 sub get_sphinx_version()
 {
 	my $ver;
-	my $major = 1;
 
 	my $cmd = "sphinx-build";
 	if (!findprog($cmd)) {
 		my $cmd = "sphinx-build3";
-		return $major if (!findprog($cmd));
+		if (!findprog($cmd)) {
+			$sphinx_major = 1;
+			$sphinx_minor = 2;
+			$sphinx_patch = 0;
+			printf STDERR "Warning: Sphinx version not found. Using default (Sphinx version %d.%d.%d)\n",
+			       $sphinx_major, $sphinx_minor, $sphinx_patch;
+			return;
+		}
 	}
 
 	open IN, "$cmd --version 2>&1 |";
 	while (<IN>) {
 		if (m/^\s*sphinx-build\s+([\d]+)\.([\d\.]+)(\+\/[\da-f]+)?$/) {
-			$major=$1;
+			$sphinx_major = $1;
+			$sphinx_minor = $2;
+			$sphinx_patch = $3;
 			last;
 		}
 		# Sphinx 1.2.x uses a different format
 		if (m/^\s*Sphinx.*\s+([\d]+)\.([\d\.]+)$/) {
-			$major=$1;
+			$sphinx_major = $1;
+			$sphinx_minor = $2;
+			$sphinx_patch = $3;
 			last;
 		}
 	}
 	close IN;
-
-	return $major;
 }
 
 # get kernel version from env
@@ -2333,7 +2365,10 @@ sub process_file($) {
 }
 
 
-$sphinx_major = get_sphinx_version();
+if ($output_mode eq "rst") {
+	get_sphinx_version() if (!$sphinx_major);
+}
+
 $kernelversion = get_kernel_version();
 
 # generate a sequence of code that will splice in highlighting information
-- 
2.26.2



