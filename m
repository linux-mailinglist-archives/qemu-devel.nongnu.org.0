Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A72124742
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:51:19 +0100 (CET)
Received: from localhost ([::1]:53748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYnN-0004Lh-0I
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55443)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3n-0007EU-2c
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3l-00033o-Nd
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:10 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52347)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY3l-0002zW-Em
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:09 -0500
Received: by mail-wm1-x343.google.com with SMTP id p9so1563865wmc.2
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=KB33/P7pdd5zyToITAll1MNS1ualBhVbh7OSCHIhH1g=;
 b=a5KkxY0GKUs696wveW2SDwo8j8SUpugFuqA5PWnurYSrKg1fPmFGrSXTNx9MXRhJNi
 92ML/clLkiG6j66Xb1HsdRK0Svxl3wbgdjfGZfj6S/3ESt+6mmOfC7QvdJZ0pMFdGjL1
 SrHcjuh7GaUbVqvus/XZWDun1WaXygFLXmQn1BdOy6sHBrJal1Go6ewACO8HosFGnTOR
 2m/duyWLQdER82AZigpu0XVNQ7xBV+z2s2eGtnAak0Jh3LNeY6SSODxwTjEX9sTdaDVJ
 nKKzFTXcVNkD4idsbPfNORE/xwQQ71poGenLoSw//qxYYgaNF3Ps9GII/2U4xjrDPmt5
 ECyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=KB33/P7pdd5zyToITAll1MNS1ualBhVbh7OSCHIhH1g=;
 b=gI18tC95cNrnPLmCfMYV0QmNLlRN9Ox9GfKwax15B7EVinN61sBdmbU4MixyA5JH8i
 HgJeF9GBKecqbiIYZ4GpZbSPR17MV9TiAAW6XKPM36Pk6baZ9J0sUCbWqBXvKQqZTRap
 5BicvynWmmqNLRkMdRtSa5nar0xFMKqnqqQrhI8GzShqPkK+4PEqLSFrGShXtKC2SMC2
 rlvzXrav5Z/XhcKDMThRa+lwi4lRgU3+Svkj0K7G3WtLkdGaA4DoTiGH+/WaUZmLNv2n
 YH/EcLX/EDw3w8wZnKwzG07JxAH/Ufpm7LidfTdnNjmz/nuVt5nPxgBvtO3Lz03svE/6
 KZrA==
X-Gm-Message-State: APjAAAUvSLrTIhda6rBm8LN25tZGV3/+7vK5EBEzknuzUD2clJ1n9veU
 z3IWCj0S2F//dJ0ei4aTdjkeOa/F
X-Google-Smtp-Source: APXvYqzVdydMVMI3qwU86/NfcSMDBIwbXJ2bSKYBFhntj02NZmJFTnLxKeRxdvbQcPm0C5JRB/UtFw==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr2641764wmc.145.1576670648148; 
 Wed, 18 Dec 2019 04:04:08 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.04.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:04:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 65/87] docs: tweak kernel-doc for QEMU coding standards
Date: Wed, 18 Dec 2019 13:02:31 +0100
Message-Id: <1576670573-48048-66-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
index 81dc917..af470eb 100755
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
1.8.3.1



