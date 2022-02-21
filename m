Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399A04BD9C7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:04:34 +0100 (CET)
Received: from localhost ([::1]:46794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8Mg-0002Ni-FQ
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:04:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7O7-00040e-NE
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7O1-0000u9-QG
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wR6N0WCO3QS1a+gcwPbSNjsf+BBp3Up2l779raX945I=;
 b=KM7S+ctna+NS/ueQ6iHM2eHMiyQzmEQLKDBlEmFWJNFoSvK0rNR3VhZ2bpaU0RhDN6S9e0
 kipNtkKH7mMl30BNod32ApMAaEJZmMwjShiWsdW0neMwQ4fU5yxpsFgogLcV7wbhc5R3pj
 TX+/2kPi0ID5zSH8Rf7TRQPP5IPoyKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-LLdJbdBmNHqDnyu-rpKUew-1; Mon, 21 Feb 2022 07:01:45 -0500
X-MC-Unique: LLdJbdBmNHqDnyu-rpKUew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAF07100C662;
 Mon, 21 Feb 2022 12:01:44 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2250273165;
 Mon, 21 Feb 2022 12:01:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/25] scripts: Remove the old switch-timer-api script
Date: Mon, 21 Feb 2022 12:59:56 +0100
Message-Id: <20220221120008.600114-14-thuth@redhat.com>
In-Reply-To: <20220221120008.600114-1-thuth@redhat.com>
References: <20220221120008.600114-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This script has been useful for the timer API rewrite in 2013, but
it is of no use anymore today. Let's remove it now.

Message-Id: <20220124102001.35930-1-thuth@redhat.com>
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


