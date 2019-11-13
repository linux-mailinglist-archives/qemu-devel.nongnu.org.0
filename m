Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80DAFB26F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 15:22:21 +0100 (CET)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUtXI-0000aj-Ny
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 09:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52448)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iUtWE-00008L-LM
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 09:21:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iUtWD-0001El-An
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 09:21:14 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39648)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iUtWD-0001Dj-4Z
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 09:21:13 -0500
Received: by mail-wr1-x442.google.com with SMTP id l7so2569796wrp.6
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2019 06:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Ynf0kKSMAZy2MsOiephMWqYKhqXXsF///fo2m5tGYc=;
 b=dN0/+CtyV2mkTsLup/inayU5jXzjaHsb/AQ2GCGgGVizpown3F+RvfXU59XsfeNbiW
 gHwTvBIQW1ho01fm783jRkxa+DsDZ03gpFA9xN3FEBe4EzrY7hRDhzSpbuhfWEYToziC
 Fx2H880WjGV2Vukg8PBnwrJJpbn5NMh6Nnxv0HIPAoiMnt5aWucwzzwH249DLDT2do4s
 E3X69UEHftBFqHTMwg+Pa8hkxN3LNSKIi1geiClVEAAWXp6Pd5955cz/Og1EFA3+EvdD
 QuMAr2nnQj5kSLgHfnHONy041W79VEmCJC4OxiOx3+5yDTUiF/HzrEslKbqFtLWCGv2t
 3Hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Ynf0kKSMAZy2MsOiephMWqYKhqXXsF///fo2m5tGYc=;
 b=dUApquyQk8Pt0GR225FTbhvf8vtaPNjQvaFUQ8nMBpR6dRJi+XXZtyoZaBS698d2CX
 U7C9xDADfhkTEI6SSQTKImZ0W8YdyLaHbu45TupUQMkcTXklfZUgdEnSPFexuETE0FY5
 l5JUPtaehlZD4Fa3OPK34gqMhmvFBr/V0fkBOD9sG2Vd8SwuFDSVecRuYK7S4rM0ZjWt
 ZGDLepLrX5ncU+dfKf8dPW8xg+Rqs/0F8UrH90dui6oVzfjiPXxP3tVLrPRIuDWpq+rD
 ekgOJQJ5q0ePtDiUKqQvbr5owFUmJoLAVdP8mSYZdqYswrJ1rq05CW9ogE1hDSc5PSmD
 nEPQ==
X-Gm-Message-State: APjAAAUadfLdcHA0CoqR6fayUXV3acFaLNoWbYaji7t7Jps17qpHW3mg
 0v5QpSLKMP1tT0jDCbqR6i34Tw==
X-Google-Smtp-Source: APXvYqx2G6UxJgtUt19kPVGVQNCO2uDqJSzZdONWB83cy2SDsD6SsxMdLtjI13GTyBLEklsmfWaGOQ==
X-Received: by 2002:adf:e3c6:: with SMTP id k6mr2945171wrm.135.1573654871404; 
 Wed, 13 Nov 2019 06:21:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y6sm3070510wrw.6.2019.11.13.06.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 06:21:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BAFAC1FF87;
 Wed, 13 Nov 2019 14:21:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: pbonzini@redhat.com
Subject: [RFC PATCH] scripts/tap-driver: report "slow" tests (HACK)
Date: Wed, 13 Nov 2019 14:21:01 +0000
Message-Id: <20191113142101.30280-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some tests seem to run slower on CI systems but we don't really get
visibility of which it is unless we happen to hang the test at the end
of a run. This hacky change exposes "slow" tests in the tap output.

[AJB: my perl is rusty, I'm sure this could be more idiomatic]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/tap-driver.pl | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/scripts/tap-driver.pl b/scripts/tap-driver.pl
index 6621a5cd671..0fe748d5de6 100755
--- a/scripts/tap-driver.pl
+++ b/scripts/tap-driver.pl
@@ -29,6 +29,7 @@ use strict;
 use Getopt::Long ();
 use TAP::Parser;
 use Term::ANSIColor qw(:constants);
+use Time::HiRes qw( time );
 
 my $ME = "tap-driver.pl";
 my $VERSION = "2018-11-30";
@@ -111,7 +112,7 @@ sub decorate_result ($);
 sub extract_tap_comment ($);
 sub handle_tap_bailout ($);
 sub handle_tap_plan ($);
-sub handle_tap_result ($);
+sub handle_tap_result ($$);
 sub is_null_string ($);
 sub main ();
 sub report ($;$);
@@ -220,12 +221,18 @@ sub testsuite_error ($)
   report "ERROR", "- $_[0]";
 }
 
-sub handle_tap_result ($)
+sub handle_tap_result ($$)
 {
   $testno++;
   my $result_obj = shift;
+  my $time = shift;
 
   my $test_result = stringify_result_obj $result_obj;
+
+  if ($time > 1.0) {
+    $test_result = $test_result . sprintf(" (%0.1fs)", $time);
+  }
+
   my $string = $result_obj->number;
 
   my $description = $result_obj->description;
@@ -312,6 +319,9 @@ sub main ()
 {
   my $iterator = TAP::Parser::Iterator::Stream->new(\*STDIN);
   my $parser = TAP::Parser->new ({iterator => $iterator });
+  my ($start, $end);
+
+  $start = time();
 
   STDOUT->autoflush(1);
   while (defined (my $cur = $parser->next))
@@ -325,7 +335,9 @@ sub main ()
         }
       elsif ($cur->is_test)
         {
-          handle_tap_result ($cur);
+          $end = time();
+          handle_tap_result ($cur, $end - $start);
+          $start = time();
         }
       elsif ($cur->is_bailout)
         {
-- 
2.20.1


