Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883CB3513A8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:32:44 +0200 (CEST)
Received: from localhost ([::1]:35270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRud1-0001ex-J2
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWZ-0002kv-If
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:08 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuW8-0001jf-LN
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:25:51 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo626292wmq.4
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UUd4r76RZdIJQegFZ5ruGUZO9+fRBe7z4dq6+5SfFjQ=;
 b=K38lZCL1LpGQtTxKIEZTZKDJCSxufuyNY8SuI9r7lEs+WxKlHx6C2cNTO81qI+HXhd
 7O0zM5LLT78YPaOSMuj/t6tfB9njcGPJSgM/x/kC+2mVtQn9voPWJZWZZ4V4pBghYRjv
 hnd02pJbn6bXOyT2csKLdS0IPzJntxioaW9rXNh8la9GhV3QaTh4zKwIpl9bfux86DmS
 X+tSZXWi/fdXOiEUkNI1et+Loq/xMmL4JvvbyibuiHK1gDh1cdX3FAN7/VQjUAIh+eM7
 F5OQORfydh9pQXBCXpt7TusBRUk0DQH+GdvcWyPpV8wOGhlNXpd1Y16gA3fEPiH6uTaG
 aFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UUd4r76RZdIJQegFZ5ruGUZO9+fRBe7z4dq6+5SfFjQ=;
 b=AcQ4zOvkcr89A16VdMtKT64ydMFhrCHmc50QXKM5BeQ9QJwZkTl4l9b4SjQE+F/xlC
 OfyKfhQuOGTNZKi4WQY8Ml2Vs00QvGZGgw8IDZsv9Sg0zLojDXbisDrnBVhHbk+sSByl
 r5dSkuVSt5pFSskDqYqsNILUvDM7uNlRDbbAjhvejgpurX5GtMlX/rJpFq+CEnJca/2e
 8ellJEdRHYWiOCZKu7XabxNwdZCjQwe1g86TkBW/Bo8EfH/rgKy4ebWFUlrs1qk/vynB
 nVZ3MLRFmxlCQjZu2r4LOrnDp3wucPIF6+lHbLxuDWwc0Xp3CUGHkfKx4XWCm0TEJjto
 JhuQ==
X-Gm-Message-State: AOAM532/dwwAnM8ywopzgaPfOLTkP3i9kYG9AebGSabfNHvqXb74geWG
 ECWs9HqJJmIj9IboKdIpjkKOjg==
X-Google-Smtp-Source: ABdhPJwqDdVfBvQREdQsDV5z9Aj3829ixSgOULnO7YSMu8NglZzw8PC9xxstomiQT4leHY1kH0NfjQ==
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr7227607wmk.102.1617272734618; 
 Thu, 01 Apr 2021 03:25:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g16sm9697474wrs.76.2021.04.01.03.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:25:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 846371FF87;
 Thu,  1 Apr 2021 11:25:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 01/11] tests/tcg: update the defaults for x86 compilers
Date: Thu,  1 Apr 2021 11:25:20 +0100
Message-Id: <20210401102530.12030-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401102530.12030-1-alex.bennee@linaro.org>
References: <20210401102530.12030-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You don't usually notice this is broken on developer system on x86 as
we use the normal host compiler. However on other systems the -pc was
extraneous. Also for 32 bit only i686 packages exist now so we should
use those when available.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


