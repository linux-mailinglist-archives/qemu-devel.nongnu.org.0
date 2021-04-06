Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE83A355765
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:10:39 +0200 (CEST)
Received: from localhost ([::1]:47326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnLi-0006YV-Q0
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCO-0006SI-Ui
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCF-00051u-Ei
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:00 -0400
Received: by mail-wr1-x435.google.com with SMTP id j18so14573374wra.2
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tP8/moLF8HqczbFq/OlKK/AmKp0m7nQgiXxa02a46ak=;
 b=SolX26N1+4miHmBDsbp2pBvGvgh7jeiMrXA0MjOPQ5pPToYHdAVXO54qSlD0rr521m
 9qUiCFkKLvKDbPnPO8dSRUmhHX7w7iH+fjPaJjSf2u1kpHPJXbxZUuExyXJrjPTriJnb
 HteKWhxE0vAVMJgPxXtkMMwDRvoTnhfJbi6bQwTiOfwD8PDWNIKHu5MpmfqpN6HWQw2X
 uj25caAcFnhLrBD7rjoElmyyO7S5oAMwncUmvqh3SewK/dnpXP/XQMl0JEc7MQPHJ9+k
 sywGuhhKSYThLlx6iOzHA3v7rVRAclcGRUWB1BSHmLlHxsjzcCGGRGMvJBbbaAl62qRG
 f2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tP8/moLF8HqczbFq/OlKK/AmKp0m7nQgiXxa02a46ak=;
 b=G2NxMrJBu1Hcwt2UeUe4/gQKXub6JP5WzdvDWSycZAzxDhqwpF0yR8ym84t9x/Pisq
 N72rImdFUe4ZsjO4lA4ha9mnaI1/pf11x6573liMH8Gh8Wdq9TplDYV34fspvy4yqPaz
 DV6fzhI3PTeWuS6u+/+eTUfs7/3zo4LlA1PO+6PedDdktK6ResKTKPy2MRVDyn0dlc/6
 S+g4hxbkEsyW9aabHJESLHjAcQc37pOohh+IpiEDy0tgQDkz5pJr/pc1L3IIrfRT2vBL
 bkHklFkH4HTFx9dsu13SO0qKSKLZ2oqDBMpqt6dPq/g9XO4z+LzLKNeWDt8rtZxnGkgI
 6wrw==
X-Gm-Message-State: AOAM531xEUyzZb3pVGCJjJiR+awsXHzfvR7WB8MiyDuZjp0MlFSYQEtM
 iqU/ru04y6/7gLcVxKgvwS4Rhw==
X-Google-Smtp-Source: ABdhPJy8WsR5DqanbJCUSz62cWtd46UkMLwOSrGJmnr1MforUfPRYZN9Zeh22BepUjPDYsxra8sM0Q==
X-Received: by 2002:a5d:5402:: with SMTP id g2mr1038219wrv.25.1617721247946;
 Tue, 06 Apr 2021 08:00:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i8sm33727755wrx.43.2021.04.06.08.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:00:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1AB751FF87;
 Tue,  6 Apr 2021 16:00:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/11] tests/tcg: update the defaults for x86 compilers
Date: Tue,  6 Apr 2021 16:00:31 +0100
Message-Id: <20210406150041.28753-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406150041.28753-1-alex.bennee@linaro.org>
References: <20210406150041.28753-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You don't usually notice this is broken on developer system on x86 as
we use the normal host compiler. However on other systems the -pc was
extraneous. Also for 32 bit only i686 packages exist now so we should
use those when available.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210401102530.12030-2-alex.bennee@linaro.org>

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


