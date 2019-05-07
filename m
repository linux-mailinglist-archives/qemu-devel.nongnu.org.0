Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE921635F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 14:03:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45608 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNyok-0000Ua-V2
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 08:03:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hNyln-0007W5-Me
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:00:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hNylm-0003be-51
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:00:27 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52669)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hNyll-0003XF-S6
	for qemu-devel@nongnu.org; Tue, 07 May 2019 08:00:26 -0400
Received: by mail-wm1-x32f.google.com with SMTP id o25so8967054wmf.2
	for <qemu-devel@nongnu.org>; Tue, 07 May 2019 05:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Am1J2dJAVo3jcOoloT8MAdmJNelCyLiGsCZp2pMysc4=;
	b=gos9+dXdL+4FqGgWO72r/SN8Q82cNXRyduKbVv03aXEVzxLF/+Qu3BWxcGnlPxCfyU
	wIIe1l0QgpNISf8WXceGRcUmJjHgk95McqsINFy5zrK5/dYlagrvTRBSMJA+rOMTppfu
	6W5+/v5TKYrNCCcQr5vQ1/HEPjq9MdlVng4F43i8SRz/sKO9Y7BqIaYc1JydYtmXQyZt
	1xkxsuQbIy5sBWQrvtUf6DwV55PdR3GmUQn8CpxhGc5eyvwzFbU/r6pudUh5QbJK8E0+
	6XoYJ3Jq8XJBJ3yfdRdAJ68c/BlByOisM0b1o8prvSCwhoP96E3QKvNEVKAQDd5/6GNf
	76bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Am1J2dJAVo3jcOoloT8MAdmJNelCyLiGsCZp2pMysc4=;
	b=JTxrVHGY+dthvXnIscIlpv/pdaho12lHcyqbJVwmONE/ff97VH/1GRPnkcNGZUXJVN
	3V1awwe9qvPV19mlDGygAjvxURL2Wgs+3SFHnRcRamxPkr13azECZsGXRDiZ3wo8fWrU
	9t6j5t4p60Q90XBi26UFpjfP3QED382GocTdDhcw1lsDXihsptpGD4wVw+vTZSnElNc8
	xixt5yVA8glO4tQn5BNb7wAUUj6+28ALQ0aicmuMkQGlcxo19/ch2Gtbt+zCNjOnWPvF
	JtoP1D/Q1pvs+ACjSz2ukvuE+X5rTjTPZetAo+Liq7FUhia73ONYO+yXahoNVz+8r1yU
	Ayog==
X-Gm-Message-State: APjAAAXyg7fnVu2Js+HIfWkqUDHxmRdw/NnT3HNwdBdL+d/UR28VPYMZ
	H3kUU1O/mDmOlWuMEod57tdWU9woIQA=
X-Google-Smtp-Source: APXvYqyRoK5M3giz54RipolE4mJMuFkHXj35NdjLK9BX074aH3IWFXZB605/nXWmebutEEET5VW1sw==
X-Received: by 2002:a05:600c:2043:: with SMTP id
	p3mr20178420wmg.43.1557230424622; 
	Tue, 07 May 2019 05:00:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id g3sm12348596wmf.9.2019.05.07.05.00.23
	for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 05:00:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  7 May 2019 13:00:03 +0100
Message-Id: <20190507120011.18100-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507120011.18100-1-peter.maydell@linaro.org>
References: <20190507120011.18100-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32f
Subject: [Qemu-devel] [PULL 07/15] QEMU_PACKED: Remove gcc_struct attribute
 in Windows non x86 targets
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cao Jiaxi <driver1998@foxmail.com>

gcc_struct is for x86 only, and it generates an warning on ARM64 Clang/MinGW targets.

Signed-off-by: Cao Jiaxi <driver1998@foxmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 20190503003618.10089-1-driver1998@foxmail.com
[PMM: dropped the slirp change as slirp is now a submodule]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 contrib/libvhost-user/libvhost-user.h | 2 +-
 include/qemu/compiler.h               | 2 +-
 scripts/cocci-macro-file.h            | 7 ++++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.h b/contrib/libvhost-user/libvhost-user.h
index 414ceb0a2f9..78b33306e81 100644
--- a/contrib/libvhost-user/libvhost-user.h
+++ b/contrib/libvhost-user/libvhost-user.h
@@ -148,7 +148,7 @@ typedef struct VhostUserInflight {
     uint16_t queue_size;
 } VhostUserInflight;
 
-#if defined(_WIN32)
+#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
 # define VU_PACKED __attribute__((gcc_struct, packed))
 #else
 # define VU_PACKED __attribute__((packed))
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 296b2fd5727..09fc44cca45 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -28,7 +28,7 @@
 
 #define QEMU_SENTINEL __attribute__((sentinel))
 
-#if defined(_WIN32)
+#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
 # define QEMU_PACKED __attribute__((gcc_struct, packed))
 #else
 # define QEMU_PACKED __attribute__((packed))
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
index e485cdccae8..c6bbc05ba3e 100644
--- a/scripts/cocci-macro-file.h
+++ b/scripts/cocci-macro-file.h
@@ -23,7 +23,12 @@
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
 #define QEMU_SENTINEL __attribute__((sentinel))
-#define QEMU_PACKED __attribute__((gcc_struct, packed))
+
+#if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
+# define QEMU_PACKED __attribute__((gcc_struct, packed))
+#else
+# define QEMU_PACKED __attribute__((packed))
+#endif
 
 #define cat(x,y) x ## y
 #define cat2(x,y) cat(x,y)
-- 
2.20.1


