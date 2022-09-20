Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FED5BEF02
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:11:51 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakX0-0003tu-7z
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqR-0000Ia-Pr
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:40 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqP-0000eC-Jy
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:39 -0400
Received: by mail-ed1-x52a.google.com with SMTP id z2so4870683edi.1
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9jZtMLEWUNRGMJhs1MyLKK4Uh8abbgf3TTaN/xU7wp4=;
 b=EbumFRFlq2BIzT5tsHEKR3/ja7X2fkc3yMZ9XcpqGmbVKq4tdVbDTfJ16EyxbajZi7
 +lpojXO/CTVQqHjVhN6T0iQJWfyow6xPrX/PArS9hYbWi0rLtEcNUHVk0piyF8QfGmm6
 ZHJ4Qt6SIJ0Uw9JOLRietHN/rhGzsAc3hddGgXQz3vyfn90V7Pqh6Hgm/1hd2apLP+sb
 HVTUAyRMN1TqSP7X0BZYbMhXbieBumMuu8Iplxh4biVb59DV+99iKiRwLy/MNcDZ6LUw
 TOGr9+dd09EjRIpWcBK7jgaT4BAUfozGVns6zOrbXAzcmtYCKnFaRw+/c35gcmrb2zHE
 NsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9jZtMLEWUNRGMJhs1MyLKK4Uh8abbgf3TTaN/xU7wp4=;
 b=qS7kv+vxAo3GWPTX1uNiag40fPkcehavEqkkRym7gSfzXMc+vlgZeS8cyj7t4+Eksy
 fjIGdddfyfratWM3Pxfqpx6YOL2KcXxiRcV0UOW11MY2IahLtF5vOq4VScQMiZGXqafx
 Bqlg0jvyGVe9ir5XYtE/wlP35j65DTyBQhnRccODQ/j/+xRLxveQhzIqy5kE8wPdN3O2
 or1edeFy+MYo469BCoXAB0hWfMpzXK1ZSt2SCmTh2xLtUWNKAKQYNYTTRA1EaON1Ouwj
 iQEWa3GYOmq1WhjDN5Pjvlpq7Bf2/N8ghJr7FC00bhotGvJPO4JyFc44HWgtCc47Sb9V
 mnHw==
X-Gm-Message-State: ACrzQf2yd8VRKmfU/1UzzR9qEZPIrt5tbmMTV15/rFk5kjdkxIlFqmcd
 hsoAOf5VkzhopTs7NHlE1nL6VA==
X-Google-Smtp-Source: AMsMyM7/8RbN6ZIfRZ3OyMAg/sCJ72cqBL3lOH7XKJK8excyLHXbuug/kRIPrLrVgIABxwNoKb8NmQ==
X-Received: by 2002:a05:6402:3890:b0:451:ef52:8f9e with SMTP id
 fd16-20020a056402389000b00451ef528f9emr21407038edb.107.1663694135551; 
 Tue, 20 Sep 2022 10:15:35 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170906538500b0073bdf71995dsm140217ejo.139.2022.09.20.10.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:15:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E47AE1FFBA;
 Tue, 20 Sep 2022 18:15:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 02/30] tests/avocado/boot_linux_console: Fix the
 test_aarch64_xlnx_versal_virt test
Date: Tue, 20 Sep 2022 18:15:05 +0100
Message-Id: <20220920171533.1098094-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The assets that this test tries to download have been removed from the
server. Update to a newer version to get it working again.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220829080940.110831-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220914155950.804707-3-alex.bennee@linaro.org>

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 6b1533c17c..f26e036ab5 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -335,13 +335,13 @@ def test_aarch64_xlnx_versal_virt(self):
         """
         images_url = ('http://ports.ubuntu.com/ubuntu-ports/dists/'
                       'bionic-updates/main/installer-arm64/'
-                      '20101020ubuntu543.15/images/')
+                      '20101020ubuntu543.19/images/')
         kernel_url = images_url + 'netboot/ubuntu-installer/arm64/linux'
-        kernel_hash = '5bfc54cf7ed8157d93f6e5b0241e727b6dc22c50'
+        kernel_hash = 'e167757620640eb26de0972f578741924abb3a82'
         kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
 
         initrd_url = images_url + 'netboot/ubuntu-installer/arm64/initrd.gz'
-        initrd_hash = 'd385d3e88d53e2004c5d43cbe668b458a094f772'
+        initrd_hash = 'cab5cb3fcefca8408aa5aae57f24574bfce8bdb9'
         initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
 
         self.vm.set_console()
-- 
2.34.1


