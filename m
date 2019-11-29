Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE0B10D6A0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 15:07:21 +0100 (CET)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iagvV-0003tA-OO
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 09:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iagqq-00022S-7x
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:02:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iagqm-0003Lc-Vm
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:02:27 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:39876)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iagql-0003GP-GW
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:02:24 -0500
Received: by mail-wr1-x441.google.com with SMTP id y11so32194906wrt.6
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2019 06:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GITb2fVxR4h7bhXASG9JI0LI0GYSIzOlpGLPA3IIb7s=;
 b=BtCZJWTy83YusnG4CVFiGPT8sh8Ir2hKiWbxTImDaD7IbNKb1WeTZkBhm0QKl3hyJC
 mV0VmrZNiFUizECkEes+pqJ3C+Q8TV9t8FrOtjM/RdBHzL4qANIXMY149FXyxaB/8Lbb
 Elqrqfsr9JF+Hvf/9dkMjbnlM0xamfGOZTBiqrOKgOoazFEpSMJU4fXxMzBKTuTKA2AA
 2TNpOKffEXGrbD5YORdGiH7vgctjuxr6ZHDrxHZrcOsIHFhHGmLkTNzPk6j6STaWw9XQ
 u9/c9lpyHu7a9LFHCRGiNkKnQUbrYuFFXbKJqQQs5relNBqrdrnmiKvxVilTIaOSv+si
 N1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GITb2fVxR4h7bhXASG9JI0LI0GYSIzOlpGLPA3IIb7s=;
 b=sOWBDEFrIZ090gxzZjrt+D92O/YuMgUwyH6Cqr4/P+Ia4sE9Hlg4GVc7xwADaV91pT
 5QSKYQY4q4nIuYj9XOIvXOZXTl+RRIipXRWn5cKoYj+fNWfoeqxW3w7BLTeGuHMsjsxT
 yANR1ebvhqg/1CQ9epC1xVNxEQyYieNaqa49KoZs1Z8ThIjeBdkqv1urto166IDZQtw5
 AU41z+UtnKnd0ChqHfX/4d1Zy25G0oKDJsT16vn2Kh4KV71QKDOSD+PTFkz9dLioIPUe
 Fdu6K/tKKD3mtccFTjhBfYAOF/G3oRxweSLwgBgsdN3NnRggp0Ap3iEfnGhe4GuC63q6
 sd2Q==
X-Gm-Message-State: APjAAAXalXKEvOsBU3y7mPtwk4hAcFjniKp1jOYQxmIq8xwqnJlw3XbW
 rjozjQPPQ7YIX3/VNXupEqjhVF7m
X-Google-Smtp-Source: APXvYqw160vQLb3isYSsvCCQqbqH5wYFoSNDhtpGMfItvozNk7Z/QqoHJbfJtSM0lK9S3v4d1shYvQ==
X-Received: by 2002:adf:f50b:: with SMTP id q11mr54720687wro.343.1575036141020; 
 Fri, 29 Nov 2019 06:02:21 -0800 (PST)
Received: from donizetti.redhat.com ([2001:b07:6468:f312:56e1:adff:fed9:caf0])
 by smtp.gmail.com with ESMTPSA id
 e7sm14190030wrp.43.2019.11.29.06.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 06:02:20 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] docs: tweak kernel-doc for QEMU coding standards
Date: Fri, 29 Nov 2019 15:02:11 +0100
Message-Id: <20191129140217.17797-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191129140217.17797-1-pbonzini@redhat.com>
References: <20191129140217.17797-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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

Surprisingly, QEMU does have a pretty consistent doc comment style and
it is not very different from the Linux kernel's.  Of the documentation
"sigils", only "#" separates the QEMU doc comment style from Linux's,
and it has 200+ instances vs. 6 for the kernel's '&struct foo' (all in
accel/tcg/translate-all.c), so it's clear that the two standards are
different in this respect.  In addition, our structs are typedefed and
recognized by CamelCase names.

Adjust kernel-doc's parser for these two aspects of the QEMU coding
standards.  The patch has been valid, with hardly any change, for over
two years, so it should not be an issue to keep kernel-doc in sync with
the Linux copy.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 81dc91760b..af470eb321 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -215,12 +215,12 @@ my $type_func = '(\w+)\(\)';
 my $type_param = '\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)';
 my $type_fp_param = '\@(\w+)\(\)';  # Special RST handling for func ptr params
 my $type_env = '(\$\w+)';
-my $type_enum = '\&(enum\s*([_\w]+))';
-my $type_struct = '\&(struct\s*([_\w]+))';
-my $type_typedef = '\&(typedef\s*([_\w]+))';
-my $type_union = '\&(union\s*([_\w]+))';
-my $type_member = '\&([_\w]+)(\.|->)([_\w]+)';
-my $type_fallback = '\&([_\w]+)';
+my $type_enum = '#(enum\s*([_\w]+))';
+my $type_struct = '#(struct\s*([_\w]+))';
+my $type_typedef = '#(([A-Z][_\w]*))';
+my $type_union = '#(union\s*([_\w]+))';
+my $type_member = '#([_\w]+)(\.|->)([_\w]+)';
+my $type_fallback = '(?!)';    # this never matches
 my $type_member_func = $type_member . '\(\)';
 
 # Output conversion substitutions.
@@ -1050,6 +1050,14 @@ sub output_blockhead {
 sub dump_declaration($$) {
     no strict 'refs';
     my ($prototype, $file) = @_;
+    if ($decl_type eq 'type name') {
+       if ($prototype =~ /^(enum|struct|union)\s+/) {
+	   $decl_type = $1;
+	} else {
+	   return;
+       }
+    }
+
     my $func = "dump_" . $decl_type;
     &$func(@_);
 }
@@ -1878,7 +1886,7 @@ sub process_name($$) {
     }
     elsif (/$doc_decl/o) {
 	$identifier = $1;
-	if (/\s*([\w\s]+?)(\(\))?\s*-/) {
+	if (/\s*([\w\s]+?)(\s*-|:)/) {
 	    $identifier = $1;
 	}
 
@@ -1888,7 +1896,7 @@ sub process_name($$) {
 	$contents = "";
 	$section = $section_default;
 	$new_start_line = $. + 1;
-	if (/-(.*)/) {
+	if (/[-:](.*)/) {
 	    # strip leading/trailing/multiple spaces
 	    $descr= $1;
 	    $descr =~ s/^\s*//;
@@ -1906,7 +1914,9 @@ sub process_name($$) {
 	    ++$warnings;
 	}
 
-	if ($identifier =~ m/^struct\b/) {
+	if ($identifier =~ m/^[A-Z]/) {
+	    $decl_type = 'type name';
+	} elsif ($identifier =~ m/^struct\b/) {
 	    $decl_type = 'struct';
 	} elsif ($identifier =~ m/^union\b/) {
 	    $decl_type = 'union';
-- 
2.21.0



