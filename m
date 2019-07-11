Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0594A661D3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 00:36:11 +0200 (CEST)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlhfd-00036K-UR
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 18:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40593)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hlhdR-0002Nt-Mj
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 18:33:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hlhdO-0004B3-S9
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 18:33:53 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:39723)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hlhdO-0003cv-KP
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 18:33:50 -0400
Received: by mail-yb1-xb41.google.com with SMTP id u9so3195769ybu.6
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 15:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=STYHNfHKT+WeaRsMylnX7uqflldknYKtkY4EJdyR0q0=;
 b=vhdgmYE2kiDCvaqNJlsgj6IjdPoRcGHIfmjf9m+D2+TXf8DZiaO5w1e9Zz7fl18H13
 zu5qaUP3sICCB/mJZmdgywvFeuuFHIAl5O3GFB2FGSaHLI8sHRS311gCURGFe2tae6uy
 OEr4prnTsGYJzBqPmsG5lXYdpBg3leHF0MX7Ne6DErX+gO8nu7hysFubLw43dBAQ+OQC
 Cj7wIZpsCrL91xXnz+bnL9j+yvZVjkt4i9K4Y7m2t3g4f5Nig4c/cQyzrrdm1TEOl2cd
 ve0rhaZoqiUPKKGTnipMC7w9XGIzHLTCwKrPX/FIrb1OEXCojbxR0bGH0Md+yAfCwD0D
 czDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=STYHNfHKT+WeaRsMylnX7uqflldknYKtkY4EJdyR0q0=;
 b=rLdI11Qp1l0wcJGbCFm9ldWHEK34T+bc5DR3ykxeSX04lFjKRca0UaaRe/4ToY6eDT
 1uk37uyUj1rnM93OZK2NocXKsnaA5Ws7mEspTieJodQpeuy4ogAT1zOn3F5I1XeToYi8
 Czw26YHFpulpLQWufKd5w9KsO1OMCNJf1eZtQxhn0iDC0v5QE2uLC8KeKbU8Ju6jUBAw
 +QAH1MKTkiYq0j9ku2lC7YFV6/6mGKrafeYNGNAsQdLQbvaey9BelsZKjunFsQXJvlnL
 Vhgn8+XV9ULMIOGYx0X0Cs0lF4H82lX5/9KdcXAuTR+UQF+Couhb2WTz30M9zabHVEt0
 t6vw==
X-Gm-Message-State: APjAAAW/CxE6n57fITDewZeMpbXA1JaZ2ug8XUSCpPrSdEEPNgDZPkv9
 7iHoAjVFZU7yLWN6hejg30e5QhPC
X-Google-Smtp-Source: APXvYqy2Rd6i8HnrpbG/v3vQI3X+hMKsa5rMBEEDvL0J78FKRIINMj77Z/L6RTj+0lQHBXS0XveGDw==
X-Received: by 2002:a25:2e09:: with SMTP id u9mr4268225ybu.21.1562884393949;
 Thu, 11 Jul 2019 15:33:13 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id z191sm1676728ywa.31.2019.07.11.15.33.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 15:33:13 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Jul 2019 18:32:44 -0400
Message-Id: <20190711223300.6061-3-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190711223300.6061-1-jan.bobek@gmail.com>
References: <20190711223300.6061-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b41
Subject: [Qemu-devel] [RISU PATCH v3 02/18] risugen_common: split
 eval_with_fields into extract_fields and eval_block
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

extract_fields can extract named variable fields from an opcode; it
returns a hash which can be then passed as environment parameter to
eval_block. More importantly, this allows the caller to augment the
block environment with more variables, if they wish to do so.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 risugen_arm.pm    |  6 +++--
 risugen_common.pm | 64 ++++++++++++++++++++++++++++-------------------
 risugen_m68k.pm   |  3 ++-
 risugen_ppc64.pm  |  6 +++--
 4 files changed, 48 insertions(+), 31 deletions(-)

diff --git a/risugen_arm.pm b/risugen_arm.pm
index 8d423b1..23a468c 100644
--- a/risugen_arm.pm
+++ b/risugen_arm.pm
@@ -992,7 +992,8 @@ sub gen_one_insn($$)
         if (defined $constraint) {
             # user-specified constraint: evaluate in an environment
             # with variables set corresponding to the variable fields.
-            my $v = eval_with_fields($insnname, $insn, $rec, "constraints", $constraint);
+            my %env = extract_fields($insn, $rec);
+            my $v = eval_block($insnname, "constraints", $constraint, \%env);
             if (!$v) {
                 $constraintfailures++;
                 if ($constraintfailures > 10000) {
@@ -1020,7 +1021,8 @@ sub gen_one_insn($$)
             } else {
                 align(4);
             }
-            $basereg = eval_with_fields($insnname, $insn, $rec, "memory", $memblock);
+            my %env = extract_fields($insn, $rec);
+            $basereg = eval_block($insnname, "memory", $memblock, \%env);
 
             if ($is_aarch64) {
                 data_barrier();
diff --git a/risugen_common.pm b/risugen_common.pm
index d63250a..3f927ef 100644
--- a/risugen_common.pm
+++ b/risugen_common.pm
@@ -25,8 +25,8 @@ BEGIN {
     our @ISA = qw(Exporter);
     our @EXPORT = qw(open_bin close_bin set_endian insn32 insn16
                    $bytecount insnv randint progress_start
-                   progress_update progress_end
-                   eval_with_fields is_pow_of_2 sextract ctz
+                   progress_update progress_end extract_fields
+                   eval_block is_pow_of_2 sextract ctz
                    dump_insn_details);
 }
 
@@ -138,36 +138,48 @@ sub progress_end()
     $| = 0;
 }
 
-sub eval_with_fields($$$$$) {
-    # Evaluate the given block in an environment with Perl variables
-    # set corresponding to the variable fields for the insn.
-    # Return the result of the eval; we die with a useful error
-    # message in case of syntax error.
-    #
-    # At the moment we just evaluate the string in the environment
-    # of the calling package.
-    # What we *ought* to do here is to give the config snippets
-    # their own package, and explicitly import into it only the
-    # functions that we want to be accessible to the config.
-    # That would provide better separation and an explicitly set up
-    # environment that doesn't allow config file code to accidentally
-    # change state it shouldn't have access to, and avoid the need to
-    # use 'caller' to get the package name of our calling function.
-    my ($insnname, $insn, $rec, $blockname, $block) = @_;
+sub extract_fields($$)
+{
+    my ($insn, $rec) = @_;
+
+    my %fields = ();
+    for my $tuple (@{ $rec->{fields} }) {
+        my ($var, $pos, $mask) = @$tuple;
+        $fields{$var} = ($insn >> $pos) & $mask;
+    }
+    return %fields;
+}
+
+# Evaluate the given block in an environment with Perl variables set
+# corresponding to env. Return the result of the eval; we die with a
+# useful error message in case of syntax error.
+#
+# At the moment we just evaluate the string in the environment of the
+# calling package. What we *ought* to do here is to give the config
+# snippets their own package, and explicitly import into it only the
+# functions that we want to be accessible to the config.  That would
+# provide better separation and an explicitly set up environment that
+# doesn't allow config file code to accidentally change state it
+# shouldn't have access to, and avoid the need to use 'caller' to get
+# the package name of our calling function.
+sub eval_block($$$$)
+{
+    my ($insnname, $blockname, $block, $env) = @_;
+
     my $calling_package = caller;
     my $evalstr = "{ package $calling_package; ";
-    for my $tuple (@{ $rec->{fields} }) {
-        my ($var, $pos, $mask) = @$tuple;
-        my $val = ($insn >> $pos) & $mask;
-        $evalstr .= "my (\$$var) = $val; ";
+    for (keys %{$env}) {
+        $evalstr .= "my " unless $_ eq '_';
+        $evalstr .= "(\$$_) = \$env->{$_}; ";
     }
     $evalstr .= $block;
     $evalstr .= "}";
+
     my $v = eval $evalstr;
-    if ($@) {
-        print "Syntax error detected evaluating $insnname $blockname string:\n$block\n$@";
-        exit(1);
-    }
+    die "Syntax error detected evaluating $insnname $blockname string:\n"
+        . "$block\n"
+        . "$@"
+        if ($@);
     return $v;
 }
 
diff --git a/risugen_m68k.pm b/risugen_m68k.pm
index 7d62b13..8c812b5 100644
--- a/risugen_m68k.pm
+++ b/risugen_m68k.pm
@@ -129,7 +129,8 @@ sub gen_one_insn($$)
         if (defined $constraint) {
             # user-specified constraint: evaluate in an environment
             # with variables set corresponding to the variable fields.
-            my $v = eval_with_fields($insnname, $insn, $rec, "constraints", $constraint);
+            my %env = extract_fields($insn, $rec);
+            my $v = eval_block($insnname, "constraints", $constraint, \%env);
             if (!$v) {
                 $constraintfailures++;
                 if ($constraintfailures > 10000) {
diff --git a/risugen_ppc64.pm b/risugen_ppc64.pm
index b241172..40f717e 100644
--- a/risugen_ppc64.pm
+++ b/risugen_ppc64.pm
@@ -311,7 +311,8 @@ sub gen_one_insn($$)
         if (defined $constraint) {
             # user-specified constraint: evaluate in an environment
             # with variables set corresponding to the variable fields.
-            my $v = eval_with_fields($insnname, $insn, $rec, "constraints", $constraint);
+            my %env = extract_fields($insn, $rec);
+            my $v = eval_block($insnname, "constraints", $constraint, \%env);
             if (!$v) {
                 $constraintfailures++;
                 if ($constraintfailures > 10000) {
@@ -335,7 +336,8 @@ sub gen_one_insn($$)
             # Default alignment requirement for ARM is 4 bytes,
             # we use 16 for Aarch64, although often unnecessary and overkill.
             align(16);
-            $basereg = eval_with_fields($insnname, $insn, $rec, "memory", $memblock);
+            my %env = extract_fields($insn, $rec);
+            $basereg = eval_block($insnname, "memory", $memblock, \%env);
         }
 
         insn32($insn);
-- 
2.20.1


