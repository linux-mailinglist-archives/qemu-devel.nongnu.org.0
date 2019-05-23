Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7C28394
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 18:28:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40381 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTqaN-0001Ka-QX
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 12:28:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hTqQQ-0002OF-7W
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:18:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hTqQP-0006TD-AL
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:18:38 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37427)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hTqQP-0006Sa-3L
	for qemu-devel@nongnu.org; Thu, 23 May 2019 12:18:37 -0400
Received: by mail-wr1-x442.google.com with SMTP id e15so6963018wrs.4
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=t+fpOzpoYMTvZREMygefSwOqjQyndhbSY04K2Iq39pg=;
	b=pKxEwwboJZUmeKt5OoQX2Rivx1lS7LvoJgAtURLdWDf3ldBnS/Z4dBxnxSx2CRH6sC
	MEjefgUTYU+Mg5fw4pfrFPMW8z/KPWkXrxh5xaIkhtWeezf1mjRXTPez5MTJjo2XrSGq
	rEAORtBeXUPaAQPXdQ6kPRS/kvU46QOtbQyyubDcioUrKFqTsUoFKJKk8+Wzcp+5mNqy
	1haJc8QDxs1azQ7KccQ7PvHihPNP3l5E5KBhgBXqlWt/QVEZmL5c5OpiMAod7eqLkfGo
	YC8osiiSSk/WD71rQsowiRWYl4KIQV+bQTZLfRatqiVvOEJlMQ4uHHzz3wFUYI9h5Tl9
	/pBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=t+fpOzpoYMTvZREMygefSwOqjQyndhbSY04K2Iq39pg=;
	b=fGv8PYox//J+bm6/ISy7+oE9i6VkaxizTrr5Wv4NXosPlBqTfDvabb+8hCwJY5eSHc
	v8Sa/e2Z0Ro6TX75zl3IQEznimVwwnm6BsDDLXquR0bKfMrubCNuy1zc6wu03SG1wfj9
	/2RVrc62rVsof/YX/hTL0li356kdYFwX7O7qYyl2DO7FY/DqBD6LY9+O+rwBjst3SbUx
	hYAZ09SmmPcs3HPoFMHKdvqfcE8/lb7TiyzYq2dB1fL2+gE4euLDeMiJtPWPVVB+dW4x
	a8pqSXsimY4dztBk2M7HuDsKN+QFnaSYBYR11qlOJpG82ama8wLg5a4D2vnZoyNCt/N+
	TlgA==
X-Gm-Message-State: APjAAAWfbPTaDlHRF0zetUSMYK9uWUcmOpzoC1R1t6ysslimJR0lZl5H
	Vc3qPHNMl8uBOk4evxo/kZM=
X-Google-Smtp-Source: APXvYqyZOHTmTWBYjU7/FHaxxOBDtQLgthd1J+dX2g8Z3I4Wpqsb+3MyMEeXXQC87Ijp5BQ+JW7fxw==
X-Received: by 2002:adf:e2c8:: with SMTP id d8mr7265314wrj.14.1558628316001;
	Thu, 23 May 2019 09:18:36 -0700 (PDT)
Received: from x1.local (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228]) by smtp.gmail.com with ESMTPSA id
	q16sm10273222wmj.17.2019.05.23.09.18.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 09:18:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Cleber Rosa <crosa@redhat.com>
Date: Thu, 23 May 2019 18:18:29 +0200
Message-Id: <20190523161832.22490-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190523161832.22490-1-f4bug@amsat.org>
References: <20190523161832.22490-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v2 1/4] BootLinuxConsoleTest: Let
 extract_from_deb handle various compressions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Debian binary package format supports various compressions.

Per man deb(5):

  NAME
    deb - Debian binary package format

  FORMAT
    ...
    The third, last required member is named data.tar.  It contains the
    filesystem as a tar archive, either not compressed (supported since
    dpkg 1.10.24), or compressed with gzip (with .gz extension),
    xz (with .xz extension, supported since dpkg 1.15.6),
    bzip2 (with .bz2 extension, supported since dpkg 1.10.24) or
    lzma (with .lzma extension, supported since dpkg 1.13.25).

List the archive files to have the 3rd name with the correct extension.

The function avocado.utils.archive.extract() will handle the different
compression format for us.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
This patch is already in Eduardo's queue, but is required in
this series.
---
 tests/acceptance/boot_linux_console.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index d5c500ea30..6aa084e049 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -55,8 +55,9 @@ class BootLinuxConsole(Test):
         """
         cwd = os.getcwd()
         os.chdir(self.workdir)
-        process.run("ar x %s data.tar.gz" % deb)
-        archive.extract("data.tar.gz", self.workdir)
+        file_path = process.run("ar t %s" % deb).stdout_text.split()[2]
+        process.run("ar x %s %s" % (deb, file_path))
+        archive.extract(file_path, self.workdir)
         os.chdir(cwd)
         return self.workdir + path
 
-- 
2.19.1


