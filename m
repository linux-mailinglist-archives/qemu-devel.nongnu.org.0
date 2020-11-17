Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02512B6AFD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:03:58 +0100 (CET)
Received: from localhost ([::1]:52054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4Ob-0000bL-RJ
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EZ-0002QH-KR
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:35 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4EX-000784-4s
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:35 -0500
Received: by mail-ej1-x644.google.com with SMTP id a16so2628956ejj.5
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q+PlRwjOPb/KcvEK/B0VStlPrSATDGDH8ddyO3b8qDc=;
 b=KWuVQO2jszagXPZTpeSAqYhsGbqy7Xo2Su+GSowq1pXEDJnO52offrGAhMb0oV2i+i
 bxDV+wYyj1j39o0Bkb4AeFMHPIIaYT1rbW/X72eE34ozpqBGqTwIVdj6eeuv7bHCcBrK
 wa72udlaOz3j8FelvqdY+wM1Z1jKxTYoQ1K/OEWXAXggPfkJfX439M/jD/3/+WKhr23X
 emBzKP2uhBcjKE8oJRC5GaSmHxodvTFmQjZYPjTou6i7pgN6TyvheLTdpZzhNv5KuMtJ
 RJHW6lADj4ZqH0RUnxW/qfR1wK1s8fqMa8lIxS8z8upEk7hjWDPjZpWw65MNN+1Rh1td
 sYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=q+PlRwjOPb/KcvEK/B0VStlPrSATDGDH8ddyO3b8qDc=;
 b=m3uEDDiBMhS1g+8Lcj1qRh1ya/xMWDQzrllb2b41yHqepRcgHJV3h5fWoZvoyVwQ3W
 gmYMj1VYD7loroZgI/G02oD8wRmCjQhzxdY/nQ2kuJ9uKeLW2H19v0GKroiHFAIq1atQ
 TYGulZNyTFTrtDT1uCSFFj6L1zE2D4Hc9x6UZwxbSe81F08P/JHVJCKaXbLD9+TdCKLt
 MVW/FtJm2/icsValb83+55FXtdYn6EhV6oEH21q4k+SKqf80dtN+PhyHtT0fw1Kai4YW
 a1px70Sl9CLb9Gk8PdbBAiSYhHWPe+QzIZhAqtrB2+d2xei9bxk62lOi+60k4XWbuaYG
 IHQA==
X-Gm-Message-State: AOAM5337nHbRwm/3B4jNR07+V2Ich4OClkYDRx+k1AcTPsNb7ZncKfb/
 v/kTqCT9vpoRBTdnOHOBUkfeErtNC14=
X-Google-Smtp-Source: ABdhPJx8ALdfMymWtPqPvKMZFE9HHSJkQk/zXe4AwlAL+9bxfMPemXL59o283PNiD1HpbwztwOsFFw==
X-Received: by 2002:a17:906:5052:: with SMTP id
 e18mr19485780ejk.530.1605632011503; 
 Tue, 17 Nov 2020 08:53:31 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/29] Revert "kernel-doc: Use c:struct for Sphinx 3.0 and
 later"
Date: Tue, 17 Nov 2020 17:52:58 +0100
Message-Id: <20201117165312.118257-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This reverts commit 152d1967f650f67b7ece3a5dda77d48069d72647.
We will replace the commit with the fix from Linux.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/sphinx/kerneldoc.py |  1 -
 scripts/kernel-doc       | 16 +---------------
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/docs/sphinx/kerneldoc.py b/docs/sphinx/kerneldoc.py
index 3ac277d162..0df6a0814d 100644
--- a/docs/sphinx/kerneldoc.py
+++ b/docs/sphinx/kerneldoc.py
@@ -99,7 +99,6 @@ class KernelDocDirective(Directive):
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
2.28.0



