Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59655124789
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 14:03:10 +0100 (CET)
Received: from localhost ([::1]:53934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYyr-0002lW-8l
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 08:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57633)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3z-0007Sn-2D
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3x-0003rb-Td
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:22 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39539)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY3x-0003ny-Hl
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:04:21 -0500
Received: by mail-wm1-x332.google.com with SMTP id 20so1485214wmj.4
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+3NmuoiiOR4K6FlJJ+4sxocF9vH1N56yvHdXlcbt7s0=;
 b=QejMMHHB97lxBKsD0u/CCrHMpcIW1W8wwX5PYp1wmUksDIJKFwbnUTM0KW7Rh59Mvw
 XFbWfN4onuG5NkCtOdloiVMVqaX/91FOdd1DCOy7ep+rOt2/GA7PmLQRznf1S2YmfGfD
 nlh1rcfNX1a9tDPXFGPPSo3MNSN+BvQC/EenThnPCWL/HiIwDxXiP0PFsGvVwlgyrWOj
 XrEweoyJP2/TGGuyyRQbT27L2TN0pB7biebvIA4XF6enX1nk19FSKKprsqHSCWq1Nyhy
 EKmaM4dKq5C6ZYciOVdnxIWGvABjrmqSyVMvaSk2h5/DpAhDEyOtRZvXVos0P1TK+iAO
 kKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+3NmuoiiOR4K6FlJJ+4sxocF9vH1N56yvHdXlcbt7s0=;
 b=J/NRinzIOz2T/QtIYMFwQ4tPhD3jeySV+DrxN8/WUmfPZSUXcValo3LIbIOG1Aj7t+
 zV8JaMLpiE+zWxfubHtMT5enFfHFPoOjooZ86LulXGJ6/BYH5mLFeRL5hnczjKiK8MxW
 OZiJQuYssaz+Xo7Hu+wzJKsjV/BXABNCCp364W/13Ni2gwsMr9iQFIe4y38YqhfuBMzB
 hmDoV5YHaZ3a5sikTZeyUb75g+W/Km+3Tj48jc+pj+Ohm6N+BRR4n0yGXs3a1XHOZTlC
 eYXvFewZ4xQkNSWFz/hv5FngAxlpWglS/CJDbqMNpuZIhSw1QQ17aCAE3trXwRlmahfN
 w4qw==
X-Gm-Message-State: APjAAAU+hKZmqSp8dH7ks/NPNT6m2XvtnIxx3NLuEJf9Is9OEyfq6AT3
 z99PkUKmfyX+fldnhhZZYhUyt2gV
X-Google-Smtp-Source: APXvYqzQ20VgKws9PDX1GHC5VtZm1UzClNUMjIYOUfV0NUOhLO1dzl/VhxE4SMqhP2R+uSv+b1DAJw==
X-Received: by 2002:a7b:c936:: with SMTP id h22mr2729219wml.115.1576670660057; 
 Wed, 18 Dec 2019 04:04:20 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.04.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:04:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 77/87] hw/pci-host/i440fx: Correct the header description
Date: Wed, 18 Dec 2019 13:02:43 +0100
Message-Id: <1576670573-48048-78-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Missed during the refactor in commits 14a026dd58 and 0f25d865a,
this file is now only about the i440FX chipset.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20191209095002.32194-2-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/pci-host/i440fx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index f271311..3fc9442 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -1,5 +1,5 @@
 /*
- * QEMU i440FX/PIIX3 PCI Bridge Emulation
+ * QEMU i440FX PCI Bridge Emulation
  *
  * Copyright (c) 2006 Fabrice Bellard
  *
-- 
1.8.3.1



