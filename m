Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57039154A43
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 18:33:48 +0100 (CET)
Received: from localhost ([::1]:43340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izl2B-0000jl-BN
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 12:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1izkzX-0006RJ-BN
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 12:31:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1izkzU-0004ZF-9W
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 12:31:03 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38036)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1izkzU-0004VV-20
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 12:31:00 -0500
Received: by mail-wr1-x435.google.com with SMTP id y17so8203128wrh.5
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 09:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j01HaJa7YmpTA4lG3GLiIjZ2qBKws2nRm9bPekFuhHI=;
 b=wnMghCK4szupAcemQr4p8BKf7eYSGJqDiPFlFFS2oislWOUjm1CWSv4u/I+qm05YdO
 9l5s2Y2a8zl9JzCmpEfjNj6jXffyI5FgqEqd/ghxW0vb0lzGNmpLoA2hwUTAMAmmtaXk
 m4b3D5P3jkcigEaTZhkNiCz2kiOnoH/N2DbIT783WosuMUOwVYw8ts8CQXu8Rz0RA77Q
 7mnSPLtI5hesjdaVUVVD0wPKNbV7r3QpdKSiDEvSQzFOHYNcTZ67j0qKzWueEaACkyUf
 mdRc3aLHVBTAue/PDRPyfnxdwA7/OYgPEqsNirBtDdr8+WJwm6HNjb7SD+lH6NGpIiv8
 mbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j01HaJa7YmpTA4lG3GLiIjZ2qBKws2nRm9bPekFuhHI=;
 b=eDqZEKEC1wf8yrnk67xt4OQdGrLd87nZzIwMY0BcWQS4VfDsG4DNHsrhSSQHMPkGEP
 gJ51Gi8vxIuX6x/BqSDVHgFrOTAkG359s7yr+yoahXSOGD2TsdLoU9mkFFoGsaV5X4X4
 OHnLyJIGqD3LVd8chB1oIOtd+fCKe1Mwk0le/sVrLL0vlhf71JsGvJ7MrTWxAiyYiF+X
 OeEMS9/aAt1nKu8JQGFYxXWXYkXHi6HogX0h8/JDV38n+Joeo4FJzUFCEeI0aH9fERHC
 63NHlO90/JcfOtXhKK3KTeEFgOmxp1411+V9milbzdbwDH60qHoi7fy0fxut5vKlTObM
 Hhxg==
X-Gm-Message-State: APjAAAXZAZE69bMXgnlJPdqflAnZOHjHGhW/e0dbBPseE+5RyxV9FQc1
 +1DEI9wdb49TmbS8kJAOmh+oUJBA1Js=
X-Google-Smtp-Source: APXvYqz6J9OuBF0G8IVHH5edhAYPimfUxCBsNR0igUQvvyaPrzfIRsOqKVsFRGBysBkN8px4OPT1EQ==
X-Received: by 2002:a5d:4702:: with SMTP id y2mr4676037wrq.37.1581010257979;
 Thu, 06 Feb 2020 09:30:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w15sm5204214wrs.80.2020.02.06.09.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 09:30:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/29] qga/qapi-schema.json: minor format fixups for rST
Date: Thu,  6 Feb 2020 17:30:17 +0000
Message-Id: <20200206173040.17337-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200206173040.17337-1-peter.maydell@linaro.org>
References: <20200206173040.17337-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

rST format requires a blank line before the start of a bulleted
or enumerated list. Two places in qapi-schema.json were missing
this blank line.

Some places were using an indented line as a sort of single-item
bulleted list, which in the texinfo output comes out all run
onto a single line; use a real bulleted list instead.

Some places unnecessarily indented lists, which confuses rST.

guest-fstrim:minimum's documentation was indented the
right amount to share a line with @minimum, but wasn't
actually doing so.

The indent on the bulleted list in the guest-set-vcpus
Returns section meant rST misindented it.

Changes to the generated texinfo are very minor (the new
bulletted lists, and a few extra blank lines).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 qga/qapi-schema.json | 86 +++++++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 41 deletions(-)

diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 7661b2b3b45..0e3a00ee052 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -510,8 +510,7 @@
 #
 # Discard (or "trim") blocks which are not in use by the filesystem.
 #
-# @minimum:
-#           Minimum contiguous free range to discard, in bytes. Free ranges
+# @minimum: Minimum contiguous free range to discard, in bytes. Free ranges
 #           smaller than this may be ignored (this is a hint and the guest
 #           may not respect it).  By increasing this value, the fstrim
 #           operation will complete more quickly for filesystems with badly
@@ -546,7 +545,8 @@
 # (or set its status to "shutdown") due to other reasons.
 #
 # The following errors may be returned:
-#          If suspend to disk is not supported, Unsupported
+#
+# - If suspend to disk is not supported, Unsupported
 #
 # Notes: It's strongly recommended to issue the guest-sync command before
 #        sending commands when the guest resumes
@@ -575,12 +575,14 @@
 #
 # This command does NOT return a response on success. There are two options
 # to check for success:
-#   1. Wait for the SUSPEND QMP event from QEMU
-#   2. Issue the query-status QMP command to confirm the VM status is
-#      "suspended"
+#
+# 1. Wait for the SUSPEND QMP event from QEMU
+# 2. Issue the query-status QMP command to confirm the VM status is
+#    "suspended"
 #
 # The following errors may be returned:
-#          If suspend to ram is not supported, Unsupported
+#
+# - If suspend to ram is not supported, Unsupported
 #
 # Notes: It's strongly recommended to issue the guest-sync command before
 #        sending commands when the guest resumes
@@ -607,12 +609,14 @@
 #
 # This command does NOT return a response on success. There are two options
 # to check for success:
-#   1. Wait for the SUSPEND QMP event from QEMU
-#   2. Issue the query-status QMP command to confirm the VM status is
-#      "suspended"
+#
+# 1. Wait for the SUSPEND QMP event from QEMU
+# 2. Issue the query-status QMP command to confirm the VM status is
+#    "suspended"
 #
 # The following errors may be returned:
-#          If hybrid suspend is not supported, Unsupported
+#
+# - If hybrid suspend is not supported, Unsupported
 #
 # Notes: It's strongly recommended to issue the guest-sync command before
 #        sending commands when the guest resumes
@@ -767,17 +771,17 @@
 # Returns: The length of the initial sublist that has been successfully
 #          processed. The guest agent maximizes this value. Possible cases:
 #
-#          - 0:              if the @vcpus list was empty on input. Guest state
-#                            has not been changed. Otherwise,
-#          - Error:          processing the first node of @vcpus failed for the
-#                            reason returned. Guest state has not been changed.
-#                            Otherwise,
+#          - 0: if the @vcpus list was empty on input. Guest state
+#            has not been changed. Otherwise,
+#          - Error: processing the first node of @vcpus failed for the
+#            reason returned. Guest state has not been changed.
+#            Otherwise,
 #          - < length(@vcpus): more than zero initial nodes have been processed,
-#                            but not the entire @vcpus list. Guest state has
-#                            changed accordingly. To retrieve the error
-#                            (assuming it persists), repeat the call with the
-#                            successfully processed initial sublist removed.
-#                            Otherwise,
+#            but not the entire @vcpus list. Guest state has
+#            changed accordingly. To retrieve the error
+#            (assuming it persists), repeat the call with the
+#            successfully processed initial sublist removed.
+#            Otherwise,
 #          - length(@vcpus): call successful.
 #
 # Since: 1.5
@@ -1182,35 +1186,35 @@
 # @GuestOSInfo:
 #
 # @kernel-release:
-#     * POSIX: release field returned by uname(2)
-#     * Windows: build number of the OS
+# * POSIX: release field returned by uname(2)
+# * Windows: build number of the OS
 # @kernel-version:
-#     * POSIX: version field returned by uname(2)
-#     * Windows: version number of the OS
+# * POSIX: version field returned by uname(2)
+# * Windows: version number of the OS
 # @machine:
-#     * POSIX: machine field returned by uname(2)
-#     * Windows: one of x86, x86_64, arm, ia64
+# * POSIX: machine field returned by uname(2)
+# * Windows: one of x86, x86_64, arm, ia64
 # @id:
-#     * POSIX: as defined by os-release(5)
-#     * Windows: contains string "mswindows"
+# * POSIX: as defined by os-release(5)
+# * Windows: contains string "mswindows"
 # @name:
-#     * POSIX: as defined by os-release(5)
-#     * Windows: contains string "Microsoft Windows"
+# * POSIX: as defined by os-release(5)
+# * Windows: contains string "Microsoft Windows"
 # @pretty-name:
-#     * POSIX: as defined by os-release(5)
-#     * Windows: product name, e.g. "Microsoft Windows 10 Enterprise"
+# * POSIX: as defined by os-release(5)
+# * Windows: product name, e.g. "Microsoft Windows 10 Enterprise"
 # @version:
-#     * POSIX: as defined by os-release(5)
-#     * Windows: long version string, e.g. "Microsoft Windows Server 2008"
+# * POSIX: as defined by os-release(5)
+# * Windows: long version string, e.g. "Microsoft Windows Server 2008"
 # @version-id:
-#     * POSIX: as defined by os-release(5)
-#     * Windows: short version identifier, e.g. "7" or "20012r2"
+# * POSIX: as defined by os-release(5)
+# * Windows: short version identifier, e.g. "7" or "20012r2"
 # @variant:
-#     * POSIX: as defined by os-release(5)
-#     * Windows: contains string "server" or "client"
+# * POSIX: as defined by os-release(5)
+# * Windows: contains string "server" or "client"
 # @variant-id:
-#     * POSIX: as defined by os-release(5)
-#     * Windows: contains string "server" or "client"
+# * POSIX: as defined by os-release(5)
+# * Windows: contains string "server" or "client"
 #
 # Notes:
 #
-- 
2.20.1


