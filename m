Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620FC334879
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:01:59 +0100 (CET)
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK51q-0008D5-9y
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:01:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lK4ye-0006Ql-R6; Wed, 10 Mar 2021 14:58:42 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:41809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lK4yc-0001eC-Fp; Wed, 10 Mar 2021 14:58:40 -0500
Received: by mail-ed1-x534.google.com with SMTP id b7so29987046edz.8;
 Wed, 10 Mar 2021 11:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+Rz9VtTzj18ZejGjRujsTac3478spKZatBuoAAa8Eg=;
 b=hd3dKjrSHCktVDN9LoDJzWPU2IjNkEeFaFoDrr4NkC8d3XmVfxfZZLrSa8jiulaIOB
 rwkewxRF++CmFQyo+hTkqf/P/zLPbKVAR6GEz+HwZj9Y3IxjPaYKddNf2tOvH/YO5i1w
 gRIPZt5LDg31YrMc+Juk1rGKQXD54u7NFqLUnh8l9EiYvygxD72yM5RE+JtCUJTebr7Q
 kZOne9UCzdXrnC3KFhofKI7GKRYrohdWxz5TH0/aAG3KWSLTyvGv8fUD1ysleP2lVcpa
 FN+OayVyb+6XgVdhktE0Rds7Vv8dZFNi0NDnO2yMJS+Hxoiv01/DThfIUcTHxIzZkpK5
 zxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7+Rz9VtTzj18ZejGjRujsTac3478spKZatBuoAAa8Eg=;
 b=jOKjlmnOtCD/IlD13/WljDOBGeWSYcPtlgwhVO8Vy9l+rSOZ69i4ouMXkehYXaTBHD
 uWZtHh/iy42bhVxIxEUkjW6pkFR8zHDGFyM+3k/Cu7Zg+j2S+5N4EwBawdLOhiVgJUiJ
 e/2GuuIlMXIy03lT6QuEqi0On6MBTjdXfrtQHoUnN0/UkYwpS7hKFjHm6Hga98rdNG9Y
 hB46dsDQnd/LfjBoP++Joppcq+el1InkqHYhvasYFFegxDHXZ1Q8Sh1D+UnWFSXmeXRO
 c1jx0N9SywtfB0ZXXxzBMaEtqICwu19g6dk/s84yKen9b/fgN+1zGUSA9CT7hWbwTdI0
 b3Dw==
X-Gm-Message-State: AOAM530PIDdrgOFYIkUwzbKqdmAxJIyo0VjUrrx5C7znThSdkTuhDGYt
 uVGLQMP+2BiICk7lHYIDj/e6eFxYwVGUAQ==
X-Google-Smtp-Source: ABdhPJwV7cSq7b2YuBsZ5au6h5iwvVAgl6SSuUr97o+IJ2lbWVTJ786P3j9YUlSFQTlzu0XzBo794Q==
X-Received: by 2002:a05:6402:57:: with SMTP id
 f23mr5021977edu.323.1615406316871; 
 Wed, 10 Mar 2021 11:58:36 -0800 (PST)
Received: from tuf.home (2a02-a456-6be8-1-d8ed-76d3-94d3-2909.fixed6.kpn.net.
 [2a02:a456:6be8:1:d8ed:76d3:94d3:2909])
 by smtp.gmail.com with ESMTPSA id h13sm133570edz.71.2021.03.10.11.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:58:36 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] tests/acceptance/boot_linux_console: change URL for
 test_arm_orangepi_bionic_20_08
Date: Wed, 10 Mar 2021 20:58:18 +0100
Message-Id: <20210310195820.21950-4-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310195820.21950-1-nieklinnenbank@gmail.com>
References: <20210310195820.21950-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 wrampazz@redhat.com, f4bug@amsat.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com,
 Willian Rampazzo <willianr@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the download URL of the Armbian 20.08 Bionic image for
test_arm_orangepi_bionic_20_08 of the orangepi-pc machine.

The archive.armbian.com URL contains more images and should keep stable
for a longer period of time than dl.armbian.com.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 9fadea9958..4a7a6830ca 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -816,7 +816,7 @@ def test_arm_orangepi_bionic_20_08(self):
         # to 1036 MiB, but the underlying filesystem is 1552 MiB...
         # As we expand it to 2 GiB we are safe.
 
-        image_url = ('https://dl.armbian.com/orangepipc/archive/'
+        image_url = ('https://archive.armbian.com/orangepipc/archive/'
                      'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
         image_hash = ('b4d6775f5673486329e45a0586bf06b6'
                       'dbe792199fd182ac6b9c7bb6c7d3e6dd')
-- 
2.25.1


