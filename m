Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA0A43B000
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:29:05 +0200 (CEST)
Received: from localhost ([::1]:39700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJhY-0007Z8-5t
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbX-0000tk-MA
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:51 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbV-0007Qj-LQ
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:51 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m22so14926958wrb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vk2fYQyC8qTaGZS/T1cDqpDUV8Xm6hpS74KdoWzwKII=;
 b=cBFgGEn3mqQD7hzSW+eLulT7POqmtqqLsED2BCFNVEVgvGD4k2wVYKo8MfQXjbiVly
 nQ7FvVhfgSqVI1TZM9fi0NIueyG4rUkm7g/hmOkRKNiQh5traHM5fV850Ak3R2jCu+kp
 GziBgfx4MIG83P29+CZmlSXsZoYs8iS+35lvdtz1uz+o+GhLfp+rzYWV1w2yFMWqRPW4
 coziBu81vYRHVe96nOs6wHkx03qzZ+e1VqGDBfEHy3AY3PkH1obHD4DukkXffGsv4gfb
 iqTNU6fuAPmKWnryKqQMCkIRlOv9PhCcMQwJdm4aL0BRshRHO6IqIHIhcHxEXUwh28e3
 bl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vk2fYQyC8qTaGZS/T1cDqpDUV8Xm6hpS74KdoWzwKII=;
 b=tvqW2cybPO4krvanCMd9lFv/z3+s76+kmQ0SekOEwd4kSz/HYE9HZNTvCgpMBDjAHK
 2LDOD3R8xZw9jDz5DFeS0mar8yN9jkml2CAXFiD900YCk5+A6JysmPqUKB0BZBYAJHw9
 nHtwT5zUUCK3edvD9gtqEBcgfXRmVIsi05RPhjYRaO1qK7fpo6f4ukJfNR8BHc1sT4SO
 lDLfknovxmBCpy+yULB8cZVrd4MAQA20g+G6kXS5CJxNSjE+UJ6SjPCNsr1IZ9vt9ZYC
 wsWJp/p2C3kEVTuLvjjxxMzTA0Ik6Ciwppbh4JVPmUv94SiTlW7jL+8QVl0p0CyDpptQ
 +VoQ==
X-Gm-Message-State: AOAM530t1S1dEkOSEfPvxRIWlz8C/Alfv4vdY+iAAm5sY/1Pxr+HEfn5
 82MbJKC76TJFayKM2Y/TqKqw1g==
X-Google-Smtp-Source: ABdhPJwc42Bg2q4AQa2pHgpOo9w2+UlfbaiLofQogupy5dQivhL3DhUUtaZ47R7Ude+tI9foQ9Vmdg==
X-Received: by 2002:adf:ce09:: with SMTP id p9mr30993478wrn.363.1635243768087; 
 Tue, 26 Oct 2021 03:22:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y5sm9120292wrd.75.2021.10.26.03.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6629B1FF9E;
 Tue, 26 Oct 2021 11:22:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 07/28] tests/tcg: Enable container_cross_cc for microblaze
Date: Tue, 26 Oct 2021 11:22:13 +0100
Message-Id: <20211026102234.3961636-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 f4bug@amsat.org, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211014224435.2539547-8-richard.henderson@linaro.org>
---
 tests/tcg/configure.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 1f985ccfc0..149eeb15ff 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -55,6 +55,7 @@ fi
 : ${cross_cc_i386="i686-linux-gnu-gcc"}
 : ${cross_cc_cflags_i386="-m32"}
 : ${cross_cc_m68k="m68k-linux-gnu-gcc"}
+: $(cross_cc_microblaze="microblaze-linux-musl-gcc")
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


