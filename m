Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5852651DB15
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 16:49:13 +0200 (CEST)
Received: from localhost ([::1]:43668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmzGa-0006z9-FJ
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 10:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmz5t-0001FT-5O
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:38:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmz5r-0005ZV-E3
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651847886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r12BzETZBGadf8EGe0bGkSHApk9OAohZ3a42QtkZwCc=;
 b=gpqXUjcKpxJ0rN7w68l2YNJuy7hcli5L/K53li201qgVNpiI0MmW0IFIhrpusB1N4e4FdC
 5RkrjaLmxSaMe0eV4hVGWViRErYfY4UUDDwuwyDnn5r8ycFaVfd/PGofa5F9jmLBlz0B0c
 a6MDA80QfENv6jpoej3PlTv+5hWbRas=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-wB3sdZjxOqakcrU-V5yP5w-1; Fri, 06 May 2022 10:38:03 -0400
X-MC-Unique: wB3sdZjxOqakcrU-V5yP5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AF7518E5280;
 Fri,  6 May 2022 14:38:03 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04F212166B2D;
 Fri,  6 May 2022 14:38:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: Yonggang Luo <luoyonggang@gmail.com>
Subject: [PULL 5/9] doc: remove hxtool-conv.pl
Date: Fri,  6 May 2022 16:37:46 +0200
Message-Id: <20220506143750.559526-6-thuth@redhat.com>
In-Reply-To: <20220506143750.559526-1-thuth@redhat.com>
References: <20220506143750.559526-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

This script doesn't need anymore as all texi are already convert to rST

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Message-Id: <20201001162705.219-3-luoyonggang@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/hxtool-conv.pl | 137 -----------------------------------------
 1 file changed, 137 deletions(-)
 delete mode 100755 scripts/hxtool-conv.pl

diff --git a/scripts/hxtool-conv.pl b/scripts/hxtool-conv.pl
deleted file mode 100755
index eede40b346..0000000000
--- a/scripts/hxtool-conv.pl
+++ /dev/null
@@ -1,137 +0,0 @@
-#!/usr/bin/perl -w
-#
-# Script to convert .hx file STEXI/ETEXI blocks to SRST/ERST
-#
-# Copyright (C) 2020 Linaro
-#
-# This work is licensed under the terms of the GNU GPL, version 2 or
-# (at your option) any later version. See the COPYING file in the
-# top-level directory.
-
-# This script was only ever intended as a one-off conversion operation.
-# Please excuse the places where it is a bit hacky.
-# Some manual intervention after the conversion is expected, as are
-# some warnings from makeinfo.
-# Warning: this script is not idempotent: don't try to run it on
-# a .hx file that already has SRST/ERST sections.
-
-# Expected usage:
-# scripts/hxtool-conv.pl file.hx > file.hx.new
-
-use utf8;
-
-my $reading_texi = 0;
-my $texiblock = '';
-my @tables = ();
-
-sub update_tables($) {
-    my ($texi) = @_;
-    # Update our list of open table directives: every @table
-    # line in the texi fragment is added to the list, and every
-    # @end table line means we remove an entry from the list.
-    # If this fragment had a completely self contained table with
-    # both the @table and @end table lines, this will be a no-op.
-    foreach (split(/\n/, $texi)) {
-        push @tables, $_ if /^\@table/;
-        pop @tables if /^\@end table/;
-    }
-}
-
-sub only_table_directives($) {
-    # Return true if every line in the fragment is a start or end table directive
-    my ($texi) = @_;
-    foreach (split(/\n/, $texi)) {
-        return 0 unless /^\@table/ or /^\@end table/;
-    }
-    return 1;
-}
-
-sub output_rstblock($) {
-    # Write the output to /tmp/frag.texi, wrapped in whatever current @table
-    # lines we need.
-    my ($texi) = @_;
-
-    # As a special case, if this fragment is only table directives and
-    # nothing else, update our set of open table directives but otherwise
-    # ignore it. This avoids emitting an empty SRST/ERST block.
-    if (only_table_directives($texi)) {
-        update_tables($texi);
-        return;
-    }
-
-    open(my $fragfh, '>', '/tmp/frag.texi');
-    # First output the currently active set of open table directives
-    print $fragfh join("\n", @tables);
-    # Next, update our list of open table directives.
-    # We need to do this before we emit the closing table directives
-    # so that we emit the right number if this fragment had an
-    # unbalanced set of directives.
-    update_tables($texi);
-    # Then emit the texi fragment itself.
-    print $fragfh "\n$texi\n";
-    # Finally, add the necessary closing table directives.
-    print $fragfh "\@end table\n" x scalar @tables;
-    close $fragfh;
-
-    # Now invoke makeinfo/pandoc on it and slurp the results into a string
-    open(my $fh, '-|', "makeinfo --force -o - --docbook "
-         . "-D 'qemu_system_x86 QEMU_SYSTEM_X86_MACRO' "
-         . "-D 'qemu_system     QEMU_SYSTEM_MACRO'  /tmp/frag.texi "
-         . " | pandoc  -f docbook -t rst")
-        or die "can't start makeinfo/pandoc: $!";
-
-    binmode $fh, ':encoding(utf8)';
-
-    print "SRST\n";
-
-    # Slurp the whole thing into a string so we can do multiline
-    # string matches on it.
-    my $rst = do {
-        local $/ = undef;
-        <$fh>;
-    };
-    $rst =~ s/^-  − /-  /gm;
-    $rst =~ s/“/"/gm;
-    $rst =~ s/”/"/gm;
-    $rst =~ s/‘/'/gm;
-    $rst =~ s/’/'/gm;
-    $rst =~ s/QEMU_SYSTEM_MACRO/|qemu_system|/g;
-    $rst =~ s/QEMU_SYSTEM_X86_MACRO/|qemu_system_x86|/g;
-    $rst =~ s/(?=::\n\n +\|qemu)/.. parsed-literal/g;
-    $rst =~ s/:\n\n::$/::/gm;
-
-    # Fix up the invalid reference format makeinfo/pandoc emit:
-    # `Some string here <#anchorname>`__
-    # should be:
-    # :ref:`anchorname`
-    $rst =~ s/\`[^<`]+\<\#([^>]+)\>\`__/:ref:`$1`/gm;
-    print $rst;
-
-    close $fh or die "error on close: $!";
-    print "ERST\n";
-}
-
-# Read the whole .hx input file.
-while (<>) {
-    # Always print the current line
-    print;
-    if (/STEXI/) {
-        $reading_texi = 1;
-        $texiblock = '';
-        next;
-    }
-    if (/ETEXI/) {
-        $reading_texi = 0;
-        # dump RST version of block
-        output_rstblock($texiblock);
-        next;
-    }
-    if ($reading_texi) {
-        # Accumulate the texi into a string
-        # but drop findex entries as they will confuse makeinfo
-        next if /^\@findex/;
-        $texiblock .= $_;
-    }
-}
-
-die "Unexpectedly still in texi block at EOF" if $reading_texi;
-- 
2.27.0


