Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16B6E0C75
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 21:20:09 +0200 (CEST)
Received: from localhost ([::1]:42012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMzhQ-0004ad-LL
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 15:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iMzec-0002OY-5k
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 15:17:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iMzeZ-0005G1-NG
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 15:17:13 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37448)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iMzeW-0005BX-AR
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 15:17:10 -0400
Received: by mail-wr1-x443.google.com with SMTP id e11so10614783wrv.4
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 12:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jH/0ruA5i4owuXTx/HGX42cpo0SMXjcQEx9rET5hw4Q=;
 b=eRfYLo9Ry1T3FGQqTNtDeYlhLBp+iJlBIOuozM96JqAYux7ZyuIT02Lc3cV7XCTFNt
 DvK0ZK85TWKRo5oUAvLvkHX0FrK9oXNxpeZt4tFJm5c6FEHVj0NiuoA97FpWcthRFTU/
 R1Or81cvs8zJ6NMF/l4MiTZWJMX25JhBtuc1a+AcpAmfKbZVmCWyIP2XwFdgmGvLuTdO
 S8FTPYragov6ouZ66Hmiv/dn+apTD5Ye8+hFCMIcWohoyQ4jQbr+qv5NYd/xcqCmGmYu
 jL0HB/Sz5fZ1uhB3p447WNKO5ol81CmOqdYB9KtojOM9MBsQff3QB9pWOqlXiCEVrwdD
 DLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jH/0ruA5i4owuXTx/HGX42cpo0SMXjcQEx9rET5hw4Q=;
 b=Heqj8YZ05Ez+Y8RSJ3hmzIunVaM1o6IPQP7EgGDfnLp/ygeUYd4RiaXrpIPsaBSPRU
 3DO8DSaHSFxwBDYLYNP5FB9uud8+TvRTQuIucH+ck/5Jv2KHmbuNiybgjihHmlwaHH1w
 keid+7o07X5tcsFm9DTY+xaYjAQ9Akw14MtBUUGI0DU637NZqwwjbVdLbgyIk9RkWXWR
 FDw//PfBK0CXhMORlE9fn5iY6iMnT6KpJDDBu9GCrZ+58l7lAd5LxRa6PP8L2TeOmhL0
 sgdjRGZsUnP+cS/OOfBz+zv1ud/V/vN0Hvg9Fu2ssU3ewafIO40Wnbc3oYTdDJUWDsck
 A3+g==
X-Gm-Message-State: APjAAAViDWSpZ+JZRaGn+kaBlmBaOFMb6HUaNQL9TyYM6AwM6W4HcJYu
 gi+KsllLLAip+BrW32T0d2gtAA==
X-Google-Smtp-Source: APXvYqx8pnNRvU9n0JgPXEubKOTdHqTfyLrD/+sxod8RCDGXBGtDk+EjFX2DYrxfUj9gW3dXK7HsVQ==
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr4852915wrb.222.1571771825863; 
 Tue, 22 Oct 2019 12:17:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x7sm25758175wrg.63.2019.10.22.12.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 12:17:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4F7211FF8C;
 Tue, 22 Oct 2019 20:17:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/19] travis.yml: reduce scope of the --enable-debug build
Date: Tue, 22 Oct 2019 20:16:46 +0100
Message-Id: <20191022191704.6134-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022191704.6134-1-alex.bennee@linaro.org>
References: <20191022191704.6134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding debug makes things run a bit slower so lets not hammer all the
targets.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2
  - drop superfluous --enable-debug-tcg in configure string
---
 .travis.yml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index d0b9e099b9c..7d90b87540f 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -124,12 +124,13 @@ matrix:
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
 
+    # --enable-debug implies --enable-debug-tcg, also runs quite a bit slower
     - env:
-        - CONFIG="--enable-debug --enable-debug-tcg --disable-user"
+        - CONFIG="--enable-debug --target-list=${MAIN_SOFTMMU_TARGETS}"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug"
 
 
-    # TCG debug can be run just on it's own and is mostly agnostic to user/softmmu distinctions
+    # TCG debug can be run just on its own and is mostly agnostic to user/softmmu distinctions
     - env:
         - CONFIG="--enable-debug-tcg --disable-system"
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug"
-- 
2.20.1


