Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D84A2BC034
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 16:18:11 +0100 (CET)
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgUeQ-0007V3-0Y
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 10:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgUdc-000704-H8
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 10:17:21 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kgUdY-0005fA-8A
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 10:17:20 -0500
Received: by mail-wm1-x344.google.com with SMTP id h21so13177236wmb.2
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 07:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2jv8Mh2QaZLvrj0Z/qed+GpzSEsLTDt0SlJRacOL58=;
 b=QROAEbEagORpZQTvsEUqn6YPggQvX3sPqqRqp2Fv1A2UmYmZDfxx/vY0RVYjEk9AfS
 3kY5Cf+nzBRi0/d60Va02+iPOOVb6bUk3qVzZpg2n3eP805j7QTC4gaj4kETg44moEbu
 9XD4oUnbVjLWLwQcekvGg3LtGqchtCrMoPZA/IZCHMKJf+DYsyF1LiA1abP7594glRVU
 fD1mTJje66eFIT+IdYtrVBU4Xmo/jBlZXRhpie0y568sNYABHJv9fDWQV7T4VfOHHvdE
 5HcXbQkE9FCjo0USbqG3NGveaeTByzlDLi2a+BLt39tN45xWe/dz06ryQtJdOJz8z98K
 Vjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P2jv8Mh2QaZLvrj0Z/qed+GpzSEsLTDt0SlJRacOL58=;
 b=siTk/6Q+AADlgiUAPxOMDnnOQy5QOSITJticFVF15WH/8AONTOCeA6xej4CNkyThTD
 lI8QAu6X5SAN/GrFBSyCoESSiu9Wh+hr+5LzVRE3YwS61Jbomh0LUk+HeBDFs8V87eyW
 LF7BVZsCLp0qPrAzUDLOA3nb0Ga24XE/9OjXhSWul7rFsu+ChdEOwBix/WeFVoPNDOg4
 gXWEw2nWHnQfx65+NmufjdHJrws/8kHFLbUAgQ6nnS0iGZJ2TAADKT+SF+8SzHFGSy8A
 So/7+8/t7pc1+TK09Cr7EYYBjIcSZygyJGKPP0KqEJv/nVNqBjs56jxUXjB2lLmLDu7k
 EGvw==
X-Gm-Message-State: AOAM533MYm+MfUXMsIaP5siqBwJzGWbD7LZd3v5pRcv/XWe4gZXziQrt
 xHbABnN4dWlupQK3NOaKcGigrgDoQWMhDQ==
X-Google-Smtp-Source: ABdhPJwFJtSUNDuYwilk/+lvnXkos8idce2fnP0F7e1hd2q8PvhOiSSSsD0W8fk/UJPq64l8X49PvQ==
X-Received: by 2002:a1c:544c:: with SMTP id p12mr15145124wmi.146.1605971833527; 
 Sat, 21 Nov 2020 07:17:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d2sm9480397wra.73.2020.11.21.07.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 07:17:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hmp-commands.hx: List abbreviation after command for cont,
 quit, print
Date: Sat, 21 Nov 2020 15:17:11 +0000
Message-Id: <20201121151711.20783-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have four HMP commands which have a single-character abbreviated
version: cont ('c'), quit ('q'), print ('p') and help ('h').  For
cont, quit and print, we list the abbreviation first in the help
documentation and the command name.  This has the odd effect that in
the full 'help' command list these commands end up sorted out of
alphabetical order (they end up after all the other commands that
start with the same letter).  As it happens, the only place this
currently changes the order is for 'cont'.

Abbreviation first is also not a very logical order, and it doesn't
match what we use for 'help' (which is 'help|?').  Put the full
command name first in both the help text and the .name field for
cont, quit and print.

Fixes: https://bugs.launchpad.net/qemu/+bug/1614609
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hmp-commands.hx | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index ff2d7aa8f3e..15a14ed4c7f 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -40,7 +40,7 @@ SRST
 ERST
 
     {
-        .name       = "q|quit",
+        .name       = "quit|q",
         .args_type  = "",
         .params     = "",
         .help       = "quit the emulator",
@@ -48,7 +48,7 @@ ERST
     },
 
 SRST
-``q`` or ``quit``
+``quit`` or ``q``
   Quit the emulator.
 ERST
 
@@ -400,7 +400,7 @@ SRST
 ERST
 
     {
-        .name       = "c|cont",
+        .name       = "cont|c",
         .args_type  = "",
         .params     = "",
         .help       = "resume emulation",
@@ -408,7 +408,7 @@ ERST
     },
 
 SRST
-``c`` or ``cont``
+``cont`` or ``c``
   Resume emulation.
 ERST
 
@@ -553,7 +553,7 @@ SRST
 ERST
 
     {
-        .name       = "p|print",
+        .name       = "print|p",
         .args_type  = "fmt:/,val:l",
         .params     = "/fmt expr",
         .help       = "print expression value (use $reg for CPU register access)",
@@ -561,7 +561,7 @@ ERST
     },
 
 SRST
-``p`` or ``print/``\ *fmt* *expr*
+``print`` or ``p/``\ *fmt* *expr*
   Print expression value. Only the *format* part of *fmt* is
   used.
 ERST
-- 
2.20.1


