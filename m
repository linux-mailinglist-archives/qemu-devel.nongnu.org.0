Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6615D28BFA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 22:55:34 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTukP-00067C-HX
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 16:55:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTuf3-0001nE-2R
	for qemu-devel@nongnu.org; Thu, 23 May 2019 16:50:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTuf1-00081Y-9A
	for qemu-devel@nongnu.org; Thu, 23 May 2019 16:50:01 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:41870)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hTuf1-000819-1U
	for qemu-devel@nongnu.org; Thu, 23 May 2019 16:49:59 -0400
Received: by mail-yb1-xb43.google.com with SMTP id d2so2788904ybh.8
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 13:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jXzqcLUR36mrZ8zbNeITGhWgRKvCgnJ4YD1qZfRVpzo=;
	b=PbEDC500kOe1Px7MITq1c0BT5YvOO4We1bJ1uIgOeGlrdBzgPWJC5XQb9urFDLqRE2
	HJo7vdpunnzazXoV2Vx0mNJOhYxrn4wshAPrM7nVs/AJOi/RN5DtIjpZu3YFMitGVaDK
	oZfZV7zQsKDtoEfkLXusPQi2hLvpIkRF9Hrs/Cqa9CVvpxdl2LtbOD8KkS9lkvcI/QJz
	6HSBsjdG2C8nhW/1hWQz+9ScMw4VDwUz1/i5baBknTIfqvJ1ZCWVCSFsWwoAoCUUyxMm
	Jlql1Sp5LgCxdLpDlMEBmUdIPUIIBgs6kEJ835WkbgYSHRNxVxjpcUq2lidK1nxG89Rh
	Bp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jXzqcLUR36mrZ8zbNeITGhWgRKvCgnJ4YD1qZfRVpzo=;
	b=EgliTxOQtLypfZ6M3Nfa1iejOLTRgYO9Sz3RTfp5o7biTJXBpVpRBjRHHNC8yx2Omo
	f9dzB6Fen8K1amqtK9cAB05gWeHqT0cwTP4G/Zo1RiDGARC/eK7Ku7KsLVhoX/AjYSmI
	e8+JbBuIHOOErOGcUOTWuRQxue5i+vPMqS+i8lcPE5mOF/hM6ylMIu9FPW6CbALYpwvW
	rHX9FfcANChxRsdumFixaIiEwATjQ27iU7TB2zam18K6Q772jp5zbTfyFVTyZHK33lSh
	tGBquRSNfVd2tAF1wAppJg4nDkQH5axb8TwKQkxSU7+yxSI2pXIvEPO7KovGjbjZgPQA
	1kOA==
X-Gm-Message-State: APjAAAVEEOtD4HT+9K4CmfP7RgkO+t2tYG0ocZHyU8LyTL0W4jk/Ew94
	7c27vlqLVhyF6Zh2Xr3Ax9ZdKjHrp1o=
X-Google-Smtp-Source: APXvYqzXzb8k/WLh+FIv3Q9aAHsyseI2tRwd5krisidwSxOKBKNukPyVRdnjoOOQA9T3PyKpAZQCvw==
X-Received: by 2002:a5b:492:: with SMTP id n18mr18534920ybp.246.1558644598187; 
	Thu, 23 May 2019 13:49:58 -0700 (PDT)
Received: from localhost.localdomain ([71.46.56.19])
	by smtp.gmail.com with ESMTPSA id j187sm98341ywj.32.2019.05.23.13.49.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 13:49:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 16:49:53 -0400
Message-Id: <20190523204954.13122-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190523204954.13122-1-richard.henderson@linaro.org>
References: <20190523204954.13122-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b43
Subject: [Qemu-devel] [PATCH v2 1/2] capstone: Update to master
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update to fbb20ea83c5a.  Choose this over the 4.0.1 tag because
master now includes the s390x z13 vector opcodes.

Acked-by: David Hildenbrand <david@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 capstone  | 2 +-
 configure | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/capstone b/capstone
index 22ead3e0bf..fbb20ea83c 160000
--- a/capstone
+++ b/capstone
@@ -1 +1 @@
-Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf
+Subproject commit fbb20ea83c5af4f29b40c17fbadb1f71b0a08fae
diff --git a/configure b/configure
index 528b9ff705..d3cbdd595c 100755
--- a/configure
+++ b/configure
@@ -5022,7 +5022,7 @@ case "$capstone" in
       git_submodules="${git_submodules} capstone"
     fi
     mkdir -p capstone
-    QEMU_CFLAGS="$QEMU_CFLAGS -I\$(SRC_PATH)/capstone/include"
+    QEMU_CFLAGS="$QEMU_CFLAGS -I\$(SRC_PATH)/capstone/include/capstone"
     if test "$mingw32" = "yes"; then
       LIBCAPSTONE=capstone.lib
     else
-- 
2.17.1


