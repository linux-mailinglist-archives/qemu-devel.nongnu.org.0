Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0D1E0CA2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 21:36:23 +0200 (CEST)
Received: from localhost ([::1]:42560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMzx8-0006gX-S3
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 15:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37543)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iMznV-0004xp-HA
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 15:26:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iMznU-00027E-8f
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 15:26:25 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42496)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iMznU-00026b-25
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 15:26:24 -0400
Received: by mail-wr1-x441.google.com with SMTP id r1so9556404wrs.9
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 12:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LpJXKQKkVgScovOu0Bd6ZFI8XIdqfOawG4aSS/zoE0s=;
 b=iYQDLutPJOnZIZm9HXBfzFWbYMMwMfh+V76yE/CiZawGqnveccxCJD0TBxpJP65OEX
 tj1VQH5X8JlMIeHUgNzx0s1SwhUFRDtMjgfLn3h2ICrpd+svQAWl4sy11S8qkWrT/ZSz
 vlSqxlrVnEMNBh9x05Fc7Mn/BzWbd9x1Z9dVZPt9gtvxwvCoOmUhJnGbK8NceijqMFlD
 g9U13z4VYC8/HLt8SKiQG9hObJ9cpD8/JipCc5XEaqHXV8MbVw5PmRk1usjxXic0BLj1
 sEaWa29Cx+xJL9odLeBjpAGwFhNfkNBaastV4sUbeMEThNdLPbus4tedW7hzOLXAwm7a
 RMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LpJXKQKkVgScovOu0Bd6ZFI8XIdqfOawG4aSS/zoE0s=;
 b=kCXigkhJjLX1saxU7c01LDzAGMNF1V7kk58fyw0ID21B2uxx7VoKhVf+lAnd1YfXY6
 m7dvkT5KWm6Jn4XmDNo5LwiEEnHT2Zm+we5fpD9bsLW++S+fyXSO3NVQfZrrFstkBlL/
 ULBC2N0/hKENZGTOoYdfVQphGllzx+jGDLyvnOB3egmEbwhbVqvIBG6G6f5DL+jLM3nz
 H+R4LzHINw0fSJqZXs9UACLUZPtEONG159eER7Na4X/gPXODW7Qphhuq/dE0syjqC8zQ
 yzwJMM80HgRygohXOVvwARXdpw92dTcgQH8hcC69siMjQOjK/hbETja4ekKoTEQ/+tQq
 Jy+A==
X-Gm-Message-State: APjAAAVWNENvLFhLxtERHLbLUwOMxzUdG3En0WPlO6vjMeHgXuJX0h7B
 NeB//fk4FTeDWzOIgRglkgJbcQ==
X-Google-Smtp-Source: APXvYqxKqbIf15Q0Q1WnyyrmTJpMzgsMla4XdJw7x1+97ttj1Woi7Bt1E2cWKUq/h50wDHCJGHiQKA==
X-Received: by 2002:a05:6000:10d:: with SMTP id
 o13mr4737511wrx.321.1571772382945; 
 Tue, 22 Oct 2019 12:26:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v20sm15804359wml.26.2019.10.22.12.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 12:26:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C64A11FFA5;
 Tue, 22 Oct 2019 20:17:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 17/19] iotests: Skip "make check-block" if QEMU does not
 support virtio-blk
Date: Tue, 22 Oct 2019 20:17:02 +0100
Message-Id: <20191022191704.6134-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022191704.6134-1-alex.bennee@linaro.org>
References: <20191022191704.6134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanb@linux.vnet.ibm.com, richard.henderson@linaro.org, f4bug@amsat.org,
 Max Reitz <mreitz@redhat.com>, cota@braap.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The next patch is going to add some python-based tests to the "auto"
group, and these tests require virtio-blk to work properly. Running
iotests without virtio-blk likely does not make too much sense anyway,
so instead of adding a check for the availability of virtio-blk to each
and every test (which does not sound very appealing), let's rather add
a check for this at the top level in the check-block.sh script instead
(so that it is possible to run "make check" without the "check-block"
part for qemu-system-tricore for example).

Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20191022072135.11188-5-thuth@redhat.com>
---
 tests/check-block.sh | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index 679aedec50c..e9e2978818a 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -26,10 +26,24 @@ if grep -q "CFLAGS.*-fsanitize" config-host.mak 2>/dev/null ; then
     exit 0
 fi
 
-if [ -z "$(find . -name 'qemu-system-*' -print)" ]; then
+if [ -n "$QEMU_PROG" ]; then
+    qemu_prog="$QEMU_PROG"
+else
+    for binary in *-softmmu/qemu-system-* ; do
+        if [ -x "$binary" ]; then
+            qemu_prog="$binary"
+            break
+        fi
+    done
+fi
+if [ -z "$qemu_prog" ]; then
     echo "No qemu-system binary available ==> Not running the qemu-iotests."
     exit 0
 fi
+if ! "$qemu_prog" -M none -device help | grep -q virtio-blk >/dev/null 2>&1 ; then
+    echo "$qemu_prog does not support virtio-blk ==> Not running the qemu-iotests."
+    exit 0
+fi
 
 if ! command -v bash >/dev/null 2>&1 ; then
     echo "bash not available ==> Not running the qemu-iotests."
-- 
2.20.1


