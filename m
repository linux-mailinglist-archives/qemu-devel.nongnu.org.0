Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DAD164B8F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 18:09:46 +0100 (CET)
Received: from localhost ([::1]:56998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4Sr3-00037Q-0H
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 12:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1j4SON-0003Nk-Ij
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:40:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1j4SOM-00089b-Hi
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:40:07 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:43952)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1j4SOM-000894-Bt
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 11:40:06 -0500
Received: by mail-pf1-x429.google.com with SMTP id s1so313726pfh.10
 for <qemu-devel@nongnu.org>; Wed, 19 Feb 2020 08:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=A8rtmh1NdudL2G95OwMBtm9/xjxDOXwkQuwmUBhd1bQ=;
 b=HwD26yBelM7lMNjn4n1K7sKadWa+ltco+M001VIZjD2iIpBG/cFRYvaOe1iD6yJT4v
 NP83vgBDMLGC6Jx8V0W+nNaH7YMb5Dt3Tx9C9DJP95BjToA0M3hmP3qdVMu5vweJkYYf
 s+MC9Z3N5TfR0ipxiRXJGrSDiQd1WnVCOD0rS6yRdSE7+DfEyCL/2HAY3wlmLqV5Ood1
 NP0TsYT/sxDP/1RS+FCbu1LG2dYDuqy9dj0GyD1lREFV5qoHxQQYNLYhZxxLqVnQ91ox
 V0zJJuL2vUgMwxfNcCxNQESuL6qLd5tGjHHoU6RMjm9hDNY0ar7gcbY/bWZaK8wzvN2r
 aX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=A8rtmh1NdudL2G95OwMBtm9/xjxDOXwkQuwmUBhd1bQ=;
 b=MbI5qSJUNENMA41Eb5rEpz8lsXuRpXTlgRVTpHs1v/XcNY2NXsFrpJE2WUN14rk5so
 VCk7hZ3QykQS9kKspLzS8YO2FKxn7/s43u/9aBJZnJQbtlMP2LxcXylziyOQYlEW6Vgb
 YPjmYtUyJCXw/Qj0hxb88SfKqaZfLtxLwgv/c3ZmA+a4qL/O6xej+lucizOuvornlMI0
 NqnkLEmVYxqDqvNUmkLpOjPvFxMW5QFe4Qge18DUn2VDhEl4eeKukeBnBvuYaGsm11C2
 TYq1LTCP7aL9E7KSIc+AXxaQdufjgSaP0ZWS3qw6PYqXwDNuM2FDnNto5qCELpiqTVgn
 5xPA==
X-Gm-Message-State: APjAAAXZuVGhr2ausaNdthr/BLvSsZjGKR7aQDxAWPXRlTt2pWp/yuHm
 g2QBS06vz7qhNHsqY6bVY8dX9Hij8+c=
X-Google-Smtp-Source: APXvYqynVgvgxaGOLSmHP/LoB81y2ayYh5aaI/+qlE50FO/oIXD2E893rFhhNFJcBuC4SFc6n26BXA==
X-Received: by 2002:aa7:9a8b:: with SMTP id w11mr28685182pfi.38.1582130405106; 
 Wed, 19 Feb 2020 08:40:05 -0800 (PST)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:3cc2:5eb7:e248:ad23])
 by smtp.gmail.com with ESMTPSA id a69sm112362pfa.129.2020.02.19.08.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 08:40:04 -0800 (PST)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/14] tests/vm: allow wait_ssh() to specify command
Date: Wed, 19 Feb 2020 11:35:34 -0500
Message-Id: <20200219163537.22098-12-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200219163537.22098-1-robert.foley@linaro.org>
References: <20200219163537.22098-1-robert.foley@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::429
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
Cc: philmd@redhat.com, alex.bennee@linaro.org, robert.foley@linaro.org,
 peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows for waiting for completion of arbitrary commands.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 tests/vm/basevm.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index a30a641a4a..792e4a3fb2 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -407,24 +407,24 @@ class BaseVM(object):
     def print_step(self, text):
         sys.stderr.write("### %s ...\n" % text)
 
-    def wait_ssh(self, wait_root=False, seconds=300):
+    def wait_ssh(self, wait_root=False, seconds=300, cmd="exit 0"):
         # Allow more time for VM to boot under TCG.
         if not kvm_available(self.arch):
             seconds *= self.tcg_ssh_timeout_multiplier
         starttime = datetime.datetime.now()
         endtime = starttime + datetime.timedelta(seconds=seconds)
-        guest_up = False
+        cmd_success = False
         while datetime.datetime.now() < endtime:
-            if wait_root and self.ssh_root("exit 0") == 0:
-                guest_up = True
+            if wait_root and self.ssh_root(cmd) == 0:
+                cmd_success = True
                 break
-            elif self.ssh("exit 0") == 0:
-                guest_up = True
+            elif self.ssh(cmd) == 0:
+                cmd_success = True
                 break
             seconds = (endtime - datetime.datetime.now()).total_seconds()
             logging.debug("%ds before timeout", seconds)
             time.sleep(1)
-        if not guest_up:
+        if not cmd_success:
             raise Exception("Timeout while waiting for guest ssh")
 
     def shutdown(self):
-- 
2.17.1


