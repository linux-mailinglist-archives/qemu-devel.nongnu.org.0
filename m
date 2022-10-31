Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160956134FC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 12:55:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTNS-0005IL-FE; Mon, 31 Oct 2022 07:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTNK-00056X-PS
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTN6-000574-PI
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:42 -0400
Received: by mail-wr1-x42e.google.com with SMTP id g12so15597227wrs.10
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 04:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lPGvzb6Tis+8r2QYoWc1QH4dM6oWwndybei8DLOeu1s=;
 b=wfWCGpvs5dTcgiYteFRIwEx1OFy5o0jyoqrZv3v7LaKwH9Mv6aeNZKuOX4go/ojyml
 RRTg/J7mPCWVHkmC1rmYPUGBe1HSWOnpZG85QOD3xdHLJxW/A7Zy7OaTd7GJI99tHiaN
 hKRIbuJVSHUH3x7hg4YEmN7zrrpMXUWLGyzscLumMKJkH3yaLBKmmv8QEuS7U83C8jAs
 vFsbFySpZg0P2lp//iLPBB0h/ljZWV4rWYFoe1dqt8jxFtVZEHt30FQcDPy0gLFOb0xV
 aN+h5iryFTXO9iwf538iw3Jbg8+MbA+8f6JrIqdGC05xU/BC2v7M5uWopQECi+stkHfq
 rLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lPGvzb6Tis+8r2QYoWc1QH4dM6oWwndybei8DLOeu1s=;
 b=MABNDFd/15BlIH7qKvh42/GfAW55pHY2P+zU221fMzE1wi3vBM3p2GgUncg2BxoS+J
 qDmdjWfV9mnL5MQdMBXZrdq0LRM4wv9pKg2IFZZ/Ny36W0/y7Z1g1Ski5LLVaJ1znhjU
 jm9Jyd3FKBdVOTI5Q8WMoNKG53RSd9TPEjCiSA9U44pE/aKje9Vilmr/LsoFdxVVm+nr
 tCM03/9BI52pAhb3UTHt9/b8VuWE3BKvuCbCgNLapfNYiI0eti9w6CtvVkiUBX/Mt3UE
 pvOhBUM/Zbnzs5YwtAo+g0//7K7wAFGMBpi4g6SiXnWFZh1zhzByskukEae+jNPs0ISa
 cy6A==
X-Gm-Message-State: ACrzQf3u6E1uQG0hLE0/O+xcZNH4YKIuPG2MW880hwMqnZtI4MK1C8D9
 cseG0mYN0FXNsNzFJW0MwK5Eysn9szWKGA==
X-Google-Smtp-Source: AMsMyM7ENxJ06kmLGO0/D994pN50pJK7GSwY6NTTbJmukQxuIvG9xAlfF3R7qMsR+MTmYPzjcRSaMw==
X-Received: by 2002:a5d:5346:0:b0:235:6c05:6272 with SMTP id
 t6-20020a5d5346000000b002356c056272mr7999648wrv.332.1667217267258; 
 Mon, 31 Oct 2022 04:54:27 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bd26-20020a05600c1f1a00b003c6b70a4d69sm7024579wmb.42.2022.10.31.04.54.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Oct 2022 04:54:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v5 4/6] docs/system/ppc/ppce500: Use qemu-system-ppc64 across
 the board(s)
Date: Mon, 31 Oct 2022 12:54:00 +0100
Message-Id: <20221031115402.91912-5-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221031115402.91912-1-philmd@linaro.org>
References: <20221031115402.91912-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

The documentation suggests that there is a qemu-system-ppc32 binary
while the 32 bit version is actually just named qemu-system-ppc. Settle
on qemu-system-ppc64 which also works for 32 bit machines and causes
less clutter in the documentation.

Found-by: BALATON Zoltan <balaton@eik.bme.hu>
Suggested-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221018210146.193159-2-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/system/ppc/ppce500.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index ba6bcb7314..7b5eb3c4ee 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -113,7 +113,7 @@ To boot the 32-bit Linux kernel:
 
 .. code-block:: bash
 
-  $ qemu-system-ppc{64|32} -M ppce500 -cpu e500mc -smp 4 -m 2G \
+  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \
       -display none -serial stdio \
       -kernel vmlinux \
       -initrd /path/to/rootfs.cpio \
@@ -154,10 +154,10 @@ interface at PCI address 0.1.0, but we can switch that to an e1000 NIC by:
 
 .. code-block:: bash
 
-  $ qemu-system-ppc -M ppce500 -smp 4 -m 2G \
-                    -display none -serial stdio \
-                    -bios u-boot \
-                    -nic tap,ifname=tap0,script=no,downscript=no,model=e1000
+  $ qemu-system-ppc64 -M ppce500 -smp 4 -m 2G \
+                      -display none -serial stdio \
+                      -bios u-boot \
+                      -nic tap,ifname=tap0,script=no,downscript=no,model=e1000
 
 The QEMU ``ppce500`` machine can also dynamically instantiate an eTSEC device
 if “-device eTSEC” is given to QEMU:
-- 
2.37.3


