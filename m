Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F487497CE9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 11:24:13 +0100 (CET)
Received: from localhost ([::1]:49706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBwWA-00012e-Ea
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 05:24:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nBwSN-0007KC-Aw
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:20:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nBwSI-0006yd-Rj
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643019608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3+0md9az7qVGOq6ns7hMrPL1YC84U2kkSoagCUhx+1Y=;
 b=PG2yKYDUXqPE09HugVx1UMDwyJTLqIJuJGMU7+sSd9BkmwtczSZbi7IPiZQt/4X1RKBO+G
 7YLs3+7+Kh5tsnP8z8ZBqczcHxwWiXe6id71nPP+bW+rKrPVDnF8YKJXkM4Py+oETci5/m
 sGmvWpsshPacKf5V5QrBGz5FKbCZFUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-2d-iaW0IMW-zhLFusz10Nw-1; Mon, 24 Jan 2022 05:20:06 -0500
X-MC-Unique: 2d-iaW0IMW-zhLFusz10Nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E6691018726;
 Mon, 24 Jan 2022 10:20:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E125F73177;
 Mon, 24 Jan 2022 10:20:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] scripts: Remove the old switch-timer-api script
Date: Mon, 24 Jan 2022 11:20:01 +0100
Message-Id: <20220124102001.35930-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This script has been useful for the timer API rewrite in 2013, but
it is of no use anymore today. Let's remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/switch-timer-api | 178 ---------------------------------------
 1 file changed, 178 deletions(-)
 delete mode 100755 scripts/switch-timer-api

diff --git a/scripts/switch-timer-api b/scripts/switch-timer-api
deleted file mode 100755
index 41736d11dd..0000000000
--- a/scripts/switch-timer-api
+++ /dev/null
@@ -1,178 +0,0 @@
-#!/usr/bin/env perl
-
-use strict;
-use warnings;
-use Getopt::Long;
-use FindBin;
-
-my @legacy = qw(qemu_clock_ptr qemu_get_clock_ns qemu_get_clock_ms qemu_register_clock_reset_notifier qemu_unregister_clock_reset_notifier qemu_new_timer qemu_free_timer qemu_del_timer qemu_mod_timer_ns qemu_mod_timer qemu_run_timers qemu_new_timer_ns qemu_new_timer_us qemu_new_timer_ms);
-my $legacyre = '\b('.join('|', @legacy).')\b';
-my $option_git;
-my $option_dryrun;
-my $option_quiet;
-my $option_rtc;
-my $suffix=".tmp.$$";
-my @files;
-my $getfiles = 'git grep -l -E \'\b((host|rt|vm|rtc)_clock\b|qemu_\w*timer)\' | egrep \'\.[ch]$\' | egrep -v \'qemu-timer\.c$|include/qemu/timer\.h$\'';
-
-sub Syntax
-{
-    print STDERR <<STOP;
-Usage: $FindBin::Script [options] FILE ...
-
-Translate each FILE to the new QEMU timer API. If no files
-are passed, a reasonable guess is taken.
-
-Options:
-  -q, --quiet     Do not show warnings etc
-  -d, --dry-run   Do a dry run
-  -g, --git       Generate a git commit for each change
-  -r, --rtc       Only fix up rtc usage
-  -h, --help      Print this message
-
-STOP
-return;
-}
-
-sub ParseOptions
-{
-    if (!GetOptions (
-	     "dry-run|d" => \$option_dryrun,
-             "git|g" => \$option_git,
-	     "quiet|q" => \$option_quiet,
-	     "rtc|r" => \$option_rtc,
-             "help|h" => sub { Syntax(); exit(0); }
-        ))
-    {
-        Syntax();
-        die "Bad options";
-    }
-
-    if ($#ARGV >=0)
-    {
-	@files = @ARGV;
-    }
-    else
-    {
-	@files = split(/\s+/, `$getfiles`);
-    }
-
-    foreach my $file (@files)
-    {
-	die "Cannot find $file" unless (-f $file && -r $file);
-    }
-}
-
-sub DoWarn
-{
-    my $text = shift @_;
-    my $line = shift @_;
-    return if ($option_quiet);
-    chomp ($line);
-    print STDERR "$text\n";
-    print STDERR "$line\n\n";
-}
-
-sub Process
-{
-    my $ifn = shift @_;
-    my $ofn = $ifn.$suffix;
-
-    my $intext;
-    my $outtext;
-    my $linenum = 0;
-
-    open my $input, "<", $ifn || die "Cannot open $ifn for read: $!";
-
-    while (<$input>)
-    {
-	my $line = $_;
-	$intext .= $line;
-	$linenum++;
-
-	# fix the specific uses
-	unless ($option_rtc)
-	{
-	    $line =~ s/\bqemu_new_timer(_[num]s)\s*\((vm_|rt_|host_)clock\b/timer_new$1(XXX_$2clock/g;
-	    $line =~ s/\bqemu_new_timer\s*\((vm_|rt_|host_)clock\b/timer_new(XXX_$1clock/g;
-	    $line =~ s/\bqemu_get_clock(_[num]s)\s*\((vm_|rt_|host_)clock\b/qemu_clock_get$1(XXX_$2clock/g;
-	}
-
-	# rtc is different
-	$line =~ s/\bqemu_new_timer(_[num]s)\s*\(rtc_clock\b/timer_new$1(rtc_clock/g;
-	$line =~ s/\bqemu_new_timer\s*\(rtc_clock\b/timer_new(rtc_clock/g;
-	$line =~ s/\bqemu_get_clock(_[num]s)\s*\(rtc_clock\b/qemu_clock_get$1(rtc_clock/g;
-	$line =~ s/\bqemu_register_clock_reset_notifier\s*\(rtc_clock\b/qemu_register_clock_reset_notifier(qemu_clock_ptr(rtc_clock)/g;
-
-	unless ($option_rtc)
-	{
-	    # fix up comments
-	    $line =~ s/\b(vm_|rt_|host_)clock\b/XXX_$1clock/g if ($line =~ m,^[/ ]+\*,);
-
-	    # spurious fprintf error reporting
-	    $line =~ s/: qemu_new_timer_ns failed/: timer_new_ns failed/g;
-
-	    # these have just changed name
-	    $line =~ s/\bqemu_mod_timer\b/timer_mod/g;
-	    $line =~ s/\bqemu_mod_timer_(ns|us|ms)\b/timer_mod_$1/g;
-	    $line =~ s/\bqemu_free_timer\b/timer_free/g;
-	    $line =~ s/\bqemu_del_timer\b/timer_del/g;
-	}
-
-	# fix up rtc_clock
-	$line =~ s/QEMUClock \*rtc_clock;/QEMUClockType rtc_clock;/g;
-	$line =~ s/\brtc_clock = (vm_|rt_|host_)clock\b/rtc_clock = XXX_$1clock/g;
-
-	unless ($option_rtc)
-	{
-	    # replace any more general uses
-	    $line =~ s/\b(vm_|rt_|host_)clock\b/qemu_clock_ptr(XXX_$1clock)/g;
-	}
-
-	# fix up the place holders
-	$line =~ s/\bXXX_vm_clock\b/QEMU_CLOCK_VIRTUAL/g;
-	$line =~ s/\bXXX_rt_clock\b/QEMU_CLOCK_REALTIME/g;
-	$line =~ s/\bXXX_host_clock\b/QEMU_CLOCK_HOST/g;
-
-	unless ($option_rtc)
-	{
-	    DoWarn("$ifn:$linenum WARNING: timer $1 not fixed up", $line) if ($line =~ /\b((vm_|rt_|host_)clock)\b/);
-	    DoWarn("$ifn:$linenum WARNING: function $1 not fixed up", $line) if ($line =~ /\b(qemu_new_timer\w+)\b/);
-	    DoWarn("$ifn:$linenum WARNING: legacy function $1 remains", $line) if ($line =~ /$legacyre/o);
-	}
-
-	$outtext .= $line;
-    }
-
-    close $input;
-
-    if ($intext ne $outtext)
-    {
-	print STDERR "Patching $ifn\n" unless ($option_quiet);
-	unless ($option_dryrun)
-	{
-	    open my $output, ">", $ofn || die "Cannot open $ofn for write: $!";
-	    print $output $outtext;
-	    close $output;
-	    rename ($ofn, $ifn) || die "Cannot rename temp file to $ifn: $!";
-	    return 1;
-	}
-    }
-    return 0;
-}
-
-sub DoCommit
-{
-    my $file = shift @_;
-    open (my $git, "| git commit -F - $file") || die "Cannot run git commit on $file: $!";
-    print $git "timers api: use new timer api in $file\n\nConvert $file to use new timer API.\nThis is an automated commit made by scripts/switch-timer-api\n";
-    close ($git);
-}
-
-ParseOptions;
-
-foreach my $file (@files)
-{
-    my $changed = Process ($file);
-    DoCommit($file) if ($changed && $option_git);
-}
-- 
2.27.0


