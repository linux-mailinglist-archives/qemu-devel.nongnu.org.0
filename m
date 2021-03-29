Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D4234CE7F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:08:27 +0200 (CEST)
Received: from localhost ([::1]:59806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQpkw-0004GR-Ea
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpfs-0000An-N9
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:12 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lQpfq-0004hH-Jb
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:03:12 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x16so12388406wrn.4
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 04:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nH6nUSONdi6BpKhrQ0XSQEH1Lc2hXxt4waJ2mPlCCBI=;
 b=bEGsfg7JsUo0jcN5fJybdL8bpp7ZsWFGAZKtxWJZHVbZ4tKG7VSWsB2/7mccyPTibh
 TOCF/L6RPuVL2+flt09rPU0sPj7gSLYlwDKYufr+AiG5k4PpGi6kE48Oe0pnfkMObL59
 fOJb5ZbgocjOPkOy8p9qm57V5fjR0hA8vKffbMJ8aZwVrDF3rZXNbLrK/gI02esrCd+D
 UUmtVh4ysvE+Cq+oPXpZCLbtinGL8dJhG2R4v3CjGP1hF8zgVlxtxYh/N67GPKF8qQCx
 tdxb59eNSRXgCaNO+vKzFlLAMz7UqpCuGpPSz0WlAeLmuAVr1r65Tpo0tLv2gEhpwOVc
 zdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nH6nUSONdi6BpKhrQ0XSQEH1Lc2hXxt4waJ2mPlCCBI=;
 b=QBRe4T6tZXHt2FHjywpSL4VI5k4FlEXHhNCh3bcS2eL0g/5mnMZYn3vrN4JlVp4tKK
 cuor8CuKBuVggHnh4QCBvUG4GAujHjDX/TA8hi4C6Jx0o+CRPcyA4R3Di5mwSXqS/Xdu
 lyCIAIy/k4M2FaH0XNLyuslFus2aBfecl2KnekUGszQHjs97YMl+6HIoSlG1jzoWsTfb
 3OsFexB9nwAWqklWSZwpS6beGUA98LW3jihYm7mpT+g1HXCz03NUXDUGmk93Mysm5Taw
 mGXQptouOeQCJPjRUoUfQXke05gl51mNBk98UFbGdRInon4x+7dDLuHq1CAZEEazy61E
 jneg==
X-Gm-Message-State: AOAM532syfhb1rshEdq/hBQxSxuR4prll1EMuwSzWxR1TNZrw3SoiahE
 cTgnzIuxOKNKTIlFCwJlN5vLGz4Ysiwo1qDk
X-Google-Smtp-Source: ABdhPJyBWQJwEFg2WW6bDwaoJWJ00783DDRx/ZPcv/DBi61HShYrZ0sQZwUTyMK6duA1Hz/3bv4S8w==
X-Received: by 2002:adf:edc3:: with SMTP id v3mr27047542wro.79.1617015788969; 
 Mon, 29 Mar 2021 04:03:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm23017470wmq.11.2021.03.29.04.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 04:03:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 871611FF87;
 Mon, 29 Mar 2021 12:03:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 1/6] tests/tcg: update the defaults for x86 compilers
Date: Mon, 29 Mar 2021 12:02:58 +0100
Message-Id: <20210329110303.15235-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210329110303.15235-1-alex.bennee@linaro.org>
References: <20210329110303.15235-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You don't usually notice this is broken on developer system on x86 as
we use the normal host compiler. However on other systems the -pc was
extraneous. Also for 32 bit only i686 packages exist now so we should
use those when available.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index ce304f4933..af4aecf14e 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -52,7 +52,7 @@ fi
 : ${cross_cc_hexagon="hexagon-unknown-linux-musl-clang"}
 : ${cross_cc_cflags_hexagon="-mv67 -O2 -static"}
 : ${cross_cc_hppa="hppa-linux-gnu-gcc"}
-: ${cross_cc_i386="i386-pc-linux-gnu-gcc"}
+: ${cross_cc_i386="i686-linux-gnu-gcc"}
 : ${cross_cc_cflags_i386="-m32"}
 : ${cross_cc_m68k="m68k-linux-gnu-gcc"}
 : $(cross_cc_mips64el="mips64el-linux-gnuabi64-gcc")
@@ -69,7 +69,7 @@ fi
 : ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
 : ${cross_cc_sparc64="sparc64-linux-gnu-gcc"}
 : ${cross_cc_cflags_sparc64="-m64 -mcpu=ultrasparc"}
-: ${cross_cc_x86_64="x86_64-pc-linux-gnu-gcc"}
+: ${cross_cc_x86_64="x86_64-linux-gnu-gcc"}
 : ${cross_cc_cflags_x86_64="-m64"}
 
 for target in $target_list; do
-- 
2.20.1


