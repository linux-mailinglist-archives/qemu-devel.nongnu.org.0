Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E60E2CB892
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:22:01 +0100 (CET)
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOKm-00083r-Jn
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDJ-0003l1-3K
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCY-0003oE-Jf
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2u5vWAM3QV1XtIiQ8u3LMQS/2hhuLS683irIASUSqOA=;
 b=MTy0r3ADpt8POBn45obBVTgYjqz5WAradBtofoC6VaDQ2g0b3LMETvVnEk1XuPyXctor1e
 q7anApCQH1QvL8Kw6KLpvt8lA4gNA2dXYSmVgqyhcdqsuTQEbSbqLRG6cQ2GMFNPExz3Mp
 OtcbsI82CaXGpqGxiiXH9fu8wCA2FhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-piPyVgaIMV-nCOb7NNdIRA-1; Wed, 02 Dec 2020 03:09:23 -0500
X-MC-Unique: piPyVgaIMV-nCOb7NNdIRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83032185E48B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:22 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 509C960855
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:22 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 088/113] scripts: kernel-doc: accept blank lines on parameter
 description
Date: Wed,  2 Dec 2020 03:08:24 -0500
Message-Id: <20201202080849.4125477-89-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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

Sphinx is very pedantic with respect to blank lines. Sometimes,
in order to make it to properly handle something, we need to
add a blank line. However, currently, any blank line inside a
kernel-doc comment like:

	/*
	 * @foo: bar
         *
	 *       foobar
	 *
	 * some description

will be considered as if "foobar" was part of the description.

This patch changes kernel-doc behavior. After it, foobar will
be considered as part of the parameter text. The description
will only be considered as such if it starts with:

zero spaces after asterisk:

	*foo

one space after asterisk:
	* foo

or have a explicit Description section:

	*   Description:

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Link: https://lore.kernel.org/r/c07d2862792d75a2691d69c9eceb7b89a0164cc0.1586881715.git.mchehab+huawei@kernel.org
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201117165312.118257-7-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index e4b3cd486f..95f2d7adcf 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -334,13 +334,14 @@ my $lineprefix="";
 
 # Parser states
 use constant {
-    STATE_NORMAL        => 0, # normal code
-    STATE_NAME          => 1, # looking for function name
-    STATE_BODY_MAYBE    => 2, # body - or maybe more description
-    STATE_BODY          => 3, # the body of the comment
-    STATE_PROTO         => 4, # scanning prototype
-    STATE_DOCBLOCK      => 5, # documentation block
-    STATE_INLINE        => 6, # gathering documentation outside main block
+    STATE_NORMAL        => 0,        # normal code
+    STATE_NAME          => 1,        # looking for function name
+    STATE_BODY_MAYBE    => 2,        # body - or maybe more description
+    STATE_BODY          => 3,        # the body of the comment
+    STATE_BODY_WITH_BLANK_LINE => 4, # the body, which has a blank line
+    STATE_PROTO         => 5,        # scanning prototype
+    STATE_DOCBLOCK      => 6,        # documentation block
+    STATE_INLINE        => 7,        # gathering doc outside main block
 };
 my $state;
 my $in_doc_sect;
@@ -1987,6 +1988,12 @@ sub process_body($$) {
 	}
     }
 
+    if ($state == STATE_BODY_WITH_BLANK_LINE && /^\s*\*\s?\S/) {
+	dump_section($file, $section, $contents);
+	$section = $section_default;
+	$contents = "";
+    }
+
     if (/$doc_sect/i) { # case insensitive for supported section names
 	$newsection = $1;
 	$newcontents = $2;
@@ -2040,18 +2047,21 @@ sub process_body($$) {
 	$state = STATE_PROTO;
 	$brcount = 0;
     } elsif (/$doc_content/) {
-	# miguel-style comment kludge, look for blank lines after
-	# @parameter line to signify start of description
 	if ($1 eq "") {
-	    if ($section =~ m/^@/ || $section eq $section_context) {
+	    if ($section eq $section_context) {
 		dump_section($file, $section, $contents);
 		$section = $section_default;
 		$contents = "";
 		$new_start_line = $.;
+		$state = STATE_BODY;
 	    } else {
+		if ($section ne $section_default) {
+		    $state = STATE_BODY_WITH_BLANK_LINE;
+		} else {
+		    $state = STATE_BODY;
+		}
 		$contents .= "\n";
 	    }
-	    $state = STATE_BODY;
 	} elsif ($state == STATE_BODY_MAYBE) {
 	    # Continued declaration purpose
 	    chomp($declaration_purpose);
@@ -2203,7 +2213,8 @@ sub process_file($) {
 	    process_normal();
 	} elsif ($state == STATE_NAME) {
 	    process_name($file, $_);
-	} elsif ($state == STATE_BODY || $state == STATE_BODY_MAYBE) {
+	} elsif ($state == STATE_BODY || $state == STATE_BODY_MAYBE ||
+		 $state == STATE_BODY_WITH_BLANK_LINE) {
 	    process_body($file, $_);
 	} elsif ($state == STATE_INLINE) { # scanning for inline parameters
 	    process_inline($file, $_);
-- 
2.26.2



