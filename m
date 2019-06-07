Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEEF386E8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 11:18:29 +0200 (CEST)
Received: from localhost ([::1]:47388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZB12-0004e1-JF
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 05:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39451)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hZAp5-00049Q-Bj
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:06:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hZAp2-0004ZE-1x
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:06:05 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45939)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hZAp1-0004QR-MT
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 05:06:03 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f9so1329429wre.12
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7WvYOUS4wxrAh1bmzV9VJwvouE7jKXGGzDv4QIMUl7o=;
 b=AuZhySanN0DuKNNoWuawG1yC3v+/0sU9fq0vp/OpGHXyXCylI8xUBGQPI+xc78c07e
 wxXmh5AmId+sCBXrAkOWFzkCYXs10VrVCZbn7rkK3LCN0dOn3Q5fvDyN1Bs1+n0wbIEE
 jURxIa6jxKmqaufRV2VcRLJ3E8MQDgwva5ynEGtKY2LUFae4El0ckpgRQufPi1HCMcfY
 87AApnXe/qXnGdRoLYZVOTd9uowuUSjzOAXTDGlPtCspRcJfWEL6DDuwGLfu9lw8HjqS
 O2FMhML6ycNwJIz6/jjEh5WAitjP+o33LHIZlYu23O3yQHVJtpvr0gykhWCSvtUByCjo
 lslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7WvYOUS4wxrAh1bmzV9VJwvouE7jKXGGzDv4QIMUl7o=;
 b=YDLG1kcLctB9DLBvF8UZ+9Ftyu1z5LU6ciVmP83rd0ZJDspetJUhfFZq461pLisvad
 WapsRUo7lvBS9BmyodrgCsoovrzQ5HTjDQ0lOnPjXZLnO1w4t8XHdBdm+//ftLHS9XJx
 cTZ1HBZ6m4xUCez7FWz7Maf/MNZ32J7MKsTMwr8/JJLnod7vnz2CclWilmmzlinldsiu
 BfD7CrjQe2a710wgnCMlmEtmCEtYjpGL2Ln1Iw+NfomDADFb0a0DGf/vdSR6Pf2/wzsL
 r77brKglJQK2McTp81jsjnZLxVeBaJuK08fKI8CwOzVY6PVp+CIhMBrPEKlquWBJhe5j
 Jelg==
X-Gm-Message-State: APjAAAWaIzke28D7cMALxgN3efagHWymbm300Q/Pp4MAXPeeERbvn4M2
 McXQTIX3Q8LYy8t2kAY/Q5nS136B6bE=
X-Google-Smtp-Source: APXvYqx1qKf/VeuShYsVJfYElUPVcbOt3XQv/QtOhzssJ7wMAnjzmh/+2OHr+XRYf5VLpEbSZL4dSw==
X-Received: by 2002:adf:e309:: with SMTP id b9mr729345wrj.135.1559898361592;
 Fri, 07 Jun 2019 02:06:01 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id m17sm1328261wrx.12.2019.06.07.02.05.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 02:05:57 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DBAB91FF9B;
 Fri,  7 Jun 2019 10:05:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Fri,  7 Jun 2019 10:05:10 +0100
Message-Id: <20190607090552.12434-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190607090552.12434-1-alex.bennee@linaro.org>
References: <20190607090552.12434-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
Subject: [Qemu-devel] [PULL 11/52] tests/vm: Add missing variables on help
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

Added description of variables missing on vm-test help.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20190329210804.22121-6-wainersm@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 6f82676306..c59411bee0 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -21,9 +21,13 @@ vm-test:
 	@echo "  vm-clean-all                    - Clean up VM images"
 	@echo
 	@echo "Special variables:"
-	@echo "    BUILD_TARGET=foo		 - override the build target"
-	@echo "    TARGET_LIST=a,b,c    	 - Override target list in builds."
+	@echo "    BUILD_TARGET=foo		 - Override the build target"
+	@echo "    TARGET_LIST=a,b,c    	 - Override target list in builds"
 	@echo '    EXTRA_CONFIGURE_OPTS="..."'
+	@echo "    J=[0..9]*            	 - Override the -jN parameter for make commands"
+	@echo "    DEBUG=1              	 - Enable verbose output on host and interactive debugging"
+	@echo "    V=1				 - Enable verbose ouput on host and guest commands"
+	@echo "    QEMU=/path/to/qemu		 - Change path to QEMU binary"
 
 vm-build-all: $(addprefix vm-build-, $(IMAGES))
 
-- 
2.20.1


