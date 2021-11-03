Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4AE4446D2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:15:34 +0100 (CET)
Received: from localhost ([::1]:44808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJrK-0002jr-1x
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiH-0003hY-Qg
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiF-0003Z6-Pv
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:13 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d3so4604856wrh.8
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M5fYOctlTURM4vfZYvc+pbC8U3ts65RhrBvT4OPTIOc=;
 b=QLeReWhDFXzzEwxAAoAkVsRHurqOsVjTktHlI262OWrZ4uw7jTM8pWZNyI5Q2TLH68
 nnpo2iHHtdoC+T6/ZLWnPsE5mUIQIbSuej4iUCKkSqDKd58yiKG1hkevxJh84uKMBFiT
 K3UOtW6UExftRf8YzChw2HaSnENTGezVeXY2qIUE67hw3qLaSYgKAYSiNqEGoYULzojG
 FfwufXJeHJjQQtJUmPeF0svZEYxKFt2b4jt4bwxvXF58Y9+Pxs+IaZX0TbfN+hX2IKlq
 x8Zkp6ofiXtnwiLUFxcI9ZlUTcVQHAB21chpxP8qgv2Hdk/k75LRR/njCUGY7oiw/K6P
 lWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M5fYOctlTURM4vfZYvc+pbC8U3ts65RhrBvT4OPTIOc=;
 b=SACu1f9kxrTEKLWk6xE83wg3DVuienQLSuW0aYIxkRwsOs3oe/GwOh5J5zthvdFcbH
 dSxPxAPmDHItR14LpQdAiOMcHpFDT/Zwmmpr2BS8aFLKiuIN5HYZ470gH5d++tvOQdwq
 8G0Eg1Ci5wKIRjGOJfLeLliXqopm6hWlpzmr6VuQb88BHEYa4b91vC2xGRzRsN4sl5SS
 9jkODM+0M+m5MDfqx1dI2E/Vj+DJV2Kq/iHgLqcggJHYhy51f8XEejKJfsuTWkNLhXc7
 JHmr2n7iSs6LZVaNIlgVHyKd9x84dy0NNjhPEqFqJDjKpGnvel+inkEp7oW61CBypr+z
 2yZQ==
X-Gm-Message-State: AOAM531TUYTxe20G5r3lfXmMNDtch40djUkNK1Zx62/DRBfo8tlkx0N4
 Pcn2BLE9JpdXxUkOteYjhTHa5g==
X-Google-Smtp-Source: ABdhPJysLJvGQxpz47f+Ez5ZFeISklhYrjDadhw8P09le//SLj96ThGYwOWSVWZUEZr/1MUA0m9W3w==
X-Received: by 2002:a5d:64a2:: with SMTP id m2mr5756291wrp.248.1635959170302; 
 Wed, 03 Nov 2021 10:06:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j40sm2605239wms.16.2021.11.03.10.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:06:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 031041FF9C;
 Wed,  3 Nov 2021 17:05:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/21] tests/tcg: Enable container_cross_cc for microblaze
Date: Wed,  3 Nov 2021 17:05:42 +0000
Message-Id: <20211103170558.717981-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211014224435.2539547-8-richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211026102234.3961636-8-alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 1f985ccfc0..ccf84e5559 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -55,6 +55,7 @@ fi
 : ${cross_cc_i386="i686-linux-gnu-gcc"}
 : ${cross_cc_cflags_i386="-m32"}
 : ${cross_cc_m68k="m68k-linux-gnu-gcc"}
+: ${cross_cc_microblaze="microblaze-linux-musl-gcc"}
 : $(cross_cc_mips64el="mips64el-linux-gnuabi64-gcc")
 : $(cross_cc_mips64="mips64-linux-gnuabi64-gcc")
 : $(cross_cc_mipsel="mipsel-linux-gnu-gcc")
@@ -133,6 +134,11 @@ for target in $target_list; do
       container_image=debian-m68k-cross
       container_cross_cc=m68k-linux-gnu-gcc
       ;;
+    microblaze-*)
+      container_hosts=x86_64
+      container_image=debian-microblaze-cross
+      container_cross_cc=microblaze-linux-musl-gcc
+      ;;
     mips64el-*)
       container_hosts=x86_64
       container_image=debian-mips64el-cross
-- 
2.30.2


