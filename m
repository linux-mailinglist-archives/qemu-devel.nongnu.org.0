Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434EFB55AF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 20:53:37 +0200 (CEST)
Received: from localhost ([::1]:49696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAIbY-0003wY-7A
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 14:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iAIPb-000372-Rd
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 14:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iAIPa-0000AJ-JR
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 14:41:15 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33671)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iAIPa-00009O-Cv
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 14:41:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b9so4306544wrs.0
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 11:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=znr7szzdATmGgMGshVrW6w2nJQVaMJk+gcyCQ34qRwQ=;
 b=MhTVQTakcz5aDic7AsfeFFOo3h0YREV/HJhnL+RhAODqDtNLcXsogqDVeagdUpNnIN
 GzRSpNPJpKOzxnDF5Ob+sEl1RpduCBhk0XUaU77DtT2G3lAhE3ZQW5MkaUJJRWN8D/8k
 feNUbe7mZxSqZeKNYdm0JMmu3mn7Nh57AD8m61RNkQN3VdygdkhX/bNYkoRHiBgv0vzl
 SWInsnjBgJsicFO54GsUOERAPVGwQIc1DcHU4fYurGgmPglslLwKRnHu6sJLTtCe20UM
 GsgHZEOEoY+DDB/4MQNrHyfhQyEN4arRP5MrwzrCNUL3DnA2A+POvvGiA/x1V/glslDu
 zy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znr7szzdATmGgMGshVrW6w2nJQVaMJk+gcyCQ34qRwQ=;
 b=f1zY++A0HX3Rx782jjIl2gworPjlIfm5mBtg73W/G+1eptVsALV+rbgKhpVpl0e/JN
 rSpaLRMm3xSKDTS6fATTbSYQQgow8IKICfvhWj/oLR6omA7LCL/d88Vt1VdW+/MHkabs
 lTlXHBFhqm8hsb3psvGX35y0WTukK5MjMhLBRJdoIbIFPnsGfjzpfkVbUgmzD+mLfHRP
 jSbeJEcdZxZD1N2+yRV/ayYqJA9DiNATEuBTwqdzvbGFeuLXdOZebaBezTXIyXdLuYCR
 P42wcpm40PbuOA+2ku0N1hKOo+04OBuhSRtu+LE0GuwUOBCcvGgsxxEeiEp+HVVROQDz
 DcDA==
X-Gm-Message-State: APjAAAVsZBLB0I1zkujeKstnJkM7Mk6KiylrZ/1R0vLz4LZ9EK1vdv2A
 +DB1auTkckNtHqCGcurWrUb6Rg==
X-Google-Smtp-Source: APXvYqyy2I0R+rTOEA2XHYjMFoP91ZITu3P9HULzRIjNfR5Xmf159gX6z74aEeZ0Y3QvmtNP4/Ykgg==
X-Received: by 2002:adf:e443:: with SMTP id t3mr38652wrm.181.1568745673207;
 Tue, 17 Sep 2019 11:41:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 189sm7087377wma.6.2019.09.17.11.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 11:41:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 85DB81FF8C;
 Tue, 17 Sep 2019 19:41:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 17 Sep 2019 19:41:01 +0100
Message-Id: <20190917184109.12564-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190917184109.12564-1-alex.bennee@linaro.org>
References: <20190917184109.12564-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42e
Subject: [Qemu-devel] [PATCH v1 1/9] tests/docker: add sanitizers back to
 clang build
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
Cc: Fam Zheng <fam@euphon.net>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Fedora23 is but a distant twinkle.
The sanitizer works again, and even if not,
we have --enable-sanitizers now.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20190912014442.5757-1-jsnow@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/test-clang | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/docker/test-clang b/tests/docker/test-clang
index 324e341cea9..db9e6970b78 100755
--- a/tests/docker/test-clang
+++ b/tests/docker/test-clang
@@ -17,11 +17,7 @@ requires clang
 
 cd "$BUILD_DIR"
 
-OPTS="--cxx=clang++ --cc=clang --host-cc=clang"
-# -fsanitize=undefined is broken on Fedora 23, skip it for now
-# See also: https://bugzilla.redhat.com/show_bug.cgi?id=1263834
-#OPTS="$OPTS --extra-cflags=-fsanitize=undefined \
-    #--extra-cflags=-fno-sanitize=float-divide-by-zero"
+OPTS="--cxx=clang++ --cc=clang --host-cc=clang --enable-sanitizers"
 build_qemu $OPTS
 check_qemu
 install_qemu
-- 
2.20.1


