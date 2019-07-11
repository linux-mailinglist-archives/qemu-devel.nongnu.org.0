Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CBE661D7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 00:36:33 +0200 (CEST)
Received: from localhost ([::1]:45706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlhg0-00050b-Tt
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 18:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40597)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hlhdR-0002P7-TY
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 18:33:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hlhdO-0004BD-Uj
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 18:33:53 -0400
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:36085)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hlhdO-0003dQ-OP
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 18:33:50 -0400
Received: by mail-yw1-xc44.google.com with SMTP id x67so3129347ywd.3
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 15:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7G+2pTAkPYR+y9CxbHr0aart4UPeU1g/FFfWLkc4zgs=;
 b=lzbJsZ0e9uOMqHCblf44DQDRO92lZzrfAO3ArVzJCtDgUJ89L4/Rdw9zJW444fhuuo
 VAfW+nzeajvT4SEW5qmsiYMYJrpAZhM20x8QC6r5l8tIw1HVpeRO7y+1YF91vHWPdIl/
 zqWqOFXvkhdmkhoW4gzEYC36G1u7R6mDvGn8dUxWt2vSCfUbeHjfd3HtcbfYdpozgnXB
 oN01YyLqWuNixlIo8sqz2WjOfVSyCCI2Zum13IWg/qHzJXWpr9ZDXJbsd2PHcfPz6lmF
 5o2s1nc3GRG8kgISLwQbTdpiIMuUVIun3HkLhe/fUdf9qUQzw+IyqbBUAUdFPQ820a5c
 uG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7G+2pTAkPYR+y9CxbHr0aart4UPeU1g/FFfWLkc4zgs=;
 b=nT4xbmrZDTdqN1lqyXj5ICGIC57y6DUBLnvj+H5nStKGv3aW2DeLb/CdG1CABvAFe3
 hQBy62kI4HzmwuWyfHka/JgJEujqUXiipYeAoKVbM9DPjTkPIDIeXM9n9mXQIRfY8W21
 9cszZAphIoRzDXuKbcNxExz1vZBf6ZIWkGPbu3CJkMq/dKF1NAWT3z2LIoRKuSEDd8vL
 IT+9PQVqgiMiPfUeO0+dBpkg5EqYP/kBXVNxDUY+yClkblxosktFytrVNCyv0aeHn7/G
 HY05exMpwkvqrR1IRieJJJ8V0lfX9zcCS9aFLbjE1WJWARN4OfTpsHqaTrS58CsVr7EE
 ULfw==
X-Gm-Message-State: APjAAAV4e8r6Y2cY8rrDcB6k2D75gk4TM029IsWhWRInZeeleJXi+zk+
 rfDDN0s/0R3UzUMXyVABr9qBEJrC
X-Google-Smtp-Source: APXvYqwYZEbjqzcYBtfuuUn6ru+I656A7pFnbtpEus3BDY94OrnhAFhIBBs+mLKVE2RNon4qQ76m2w==
X-Received: by 2002:a81:9a8a:: with SMTP id r132mr3789231ywg.126.1562884395348; 
 Thu, 11 Jul 2019 15:33:15 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id z191sm1676728ywa.31.2019.07.11.15.33.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 15:33:14 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Jul 2019 18:32:46 -0400
Message-Id: <20190711223300.6061-5-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190711223300.6061-1-jan.bobek@gmail.com>
References: <20190711223300.6061-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c44
Subject: [Qemu-devel] [RISU PATCH v3 04/18] risugen_x86_constraints: add
 module
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

The module risugen_x86_constraints.pm provides environment for
evaluating x86 "!constraints" blocks. This is facilitated by the
single exported function eval_constraints_block.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 risugen_x86_constraints.pm | 154 +++++++++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 risugen_x86_constraints.pm

diff --git a/risugen_x86_constraints.pm b/risugen_x86_constraints.pm
new file mode 100644
index 0000000..a4ee687
--- /dev/null
+++ b/risugen_x86_constraints.pm
@@ -0,0 +1,154 @@
+#!/usr/bin/perl -w
+###############################################################################
+# Copyright (c) 2019 Jan Bobek
+# All rights reserved. This program and the accompanying materials
+# are made available under the terms of the Eclipse Public License v1.0
+# which accompanies this distribution, and is available at
+# http://www.eclipse.org/legal/epl-v10.html
+#
+# Contributors:
+#     Jan Bobek - initial implementation
+###############################################################################
+
+# risugen_x86_constraints -- risugen_x86's helper module for "!constraints" blocks
+package risugen_x86_constraints;
+
+use strict;
+use warnings;
+
+use risugen_common;
+use risugen_x86_asm;
+
+our @ISA    = qw(Exporter);
+our @EXPORT = qw(eval_constraints_block);
+
+my $is_x86_64;
+
+sub data16($%)
+{
+    my ($insn, %data16) = @_;
+    $insn->{data16} = \%data16;
+}
+
+sub rep($%)
+{
+    my ($insn, %rep) = @_;
+    $insn->{rep} = \%rep;
+}
+
+sub repne($%)
+{
+    my ($insn, %repne) = @_;
+    $insn->{repne} = \%repne;
+}
+
+sub rex($%)
+{
+    my ($insn, %rex) = @_;
+    # It doesn't make sense to randomize any REX fields, since REX.W
+    # is opcode-like and REX.R/.X/.B are encoded automatically by
+    # risugen_x86_asm.
+    $insn->{rex} = \%rex;
+}
+
+sub vex($%)
+{
+    my ($insn, %vex) = @_;
+    my $regidw = $is_x86_64 ? 4 : 3;
+
+    # There is no point in randomizing other VEX fields, since
+    # VEX.R/.X/.B are encoded automatically by risugen_x86_asm, and
+    # VEX.M/.P are opcodes.
+    $vex{l} = randint(width => 1) ? 256 : 128 unless defined $vex{l};
+    $vex{v} = randint(width => $regidw)       unless defined $vex{v};
+    $vex{w} = randint(width => 1)             unless defined $vex{w};
+    $insn->{vex} = \%vex;
+}
+
+sub modrm_($%)
+{
+    my ($insn, %args) = @_;
+    my $regidw = $is_x86_64 ? 4 : 3;
+
+    my %modrm = ();
+    if (defined $args{reg}) {
+        # This makes the config file syntax a bit more accommodating
+        # in cases where MODRM.REG is an opcode extension field.
+        $modrm{reg} = $args{reg};
+    } else {
+        $modrm{reg} = randint(width => $regidw);
+    }
+
+    # There is also a displacement-only form, but we don't know
+    # absolute address of the memblock, so we cannot test it.
+    my $form = int(rand(4));
+    if ($form == 0) {
+        $modrm{reg2} = randint(width => $regidw);
+    } else {
+        $modrm{base} = randint(width => $regidw);
+
+        if ($form == 2) {
+            $modrm{base}        = randint(width => $regidw);
+            $modrm{disp}{value} = randint(width => 8, signed => 1);
+            $modrm{disp}{width} = 8;
+        } elsif ($form == 3) {
+            $modrm{base}        = randint(width => $regidw);
+            $modrm{disp}{value} = randint(width => 32, signed => 1);
+            $modrm{disp}{width} = 32;
+        }
+
+        my $have_index = int(rand(2));
+        if ($have_index) {
+            my $indexk      = $args{indexk};
+            $modrm{ss}      = randint(width => 2);
+            $modrm{$indexk} = randint(width => $regidw);
+        }
+    }
+
+    $insn->{modrm} = \%modrm;
+}
+
+sub modrm($%)
+{
+    my ($insn, %args) = @_;
+    modrm_($insn, indexk => 'index', %args);
+}
+
+sub modrm_vsib($%)
+{
+    my ($insn, %args) = @_;
+    modrm_($insn, indexk => 'vindex', %args);
+}
+
+sub imm($%)
+{
+    my ($insn, %args) = @_;
+    $insn->{imm}{value} = randint(%args);
+    $insn->{imm}{width} = $args{width};
+}
+
+sub eval_constraints_block(%)
+{
+    my (%args) = @_;
+    my $rec = $args{rec};
+    my $insn = $args{insn};
+    my $insnname = $rec->{name};
+    my $opcode = $insn->{opcode}{value};
+
+    $is_x86_64 = $args{is_x86_64};
+
+    my $constraint = $rec->{blocks}{"constraints"};
+    if (defined $constraint) {
+        # user-specified constraint: evaluate in an environment
+        # with variables set corresponding to the variable fields.
+        my %env = extract_fields($opcode, $rec);
+        # set the variable $_ to the instruction in question
+        $env{_} = $insn;
+
+        return eval_block($insnname, "constraints", $constraint, \%env);
+    } else {
+        return 1;
+    }
+}
+
+1;
-- 
2.20.1


