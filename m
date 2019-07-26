Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEFA76C7F
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 17:21:08 +0200 (CEST)
Received: from localhost ([::1]:41095 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hr21r-00054d-Ob
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 11:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37631)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hr20n-0000nA-0k
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 11:20:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hr20l-00071n-PQ
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 11:20:00 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40063)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hr20l-0006zi-I5
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 11:19:59 -0400
Received: by mail-wm1-x343.google.com with SMTP id v19so48037739wmj.5
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 08:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LvhsiHkVuNBsC4pCSoHsjH+VA0vVutJhC/fh+GMwzbk=;
 b=PqupO5IJLGb7Ylzsr5fR0dI09T7xdVdadgddGnI5C6BmTl9xeHAbYMhcp/E34J5dEk
 4zBSnAtB1K7R+snzBH7edbX5G72nx5+f3BBJPmL3rMGDshQ9CLKCFloRvSpZDkY9BL/w
 w3P/wyDXPcbU2VlvBC6QFVD7eTG8/oL4DXz+Niuvsg/q0o8w5EsTvvlW5Axc+uLkFkZS
 Q+M3bcTYnnLdvOgJUpGFfuu/k1dIr0Q6GMMvZty8aV0yPi76gdiRuXyYR3g2nhJ0oYau
 XjuUBTJprgi3cT4AsoHiTUVvr4zmNu6VufBK2YVhduGNz689pbTuSLtRvdOEwgDVsthL
 E+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LvhsiHkVuNBsC4pCSoHsjH+VA0vVutJhC/fh+GMwzbk=;
 b=sSsVI8MqlomeQYKCOS1774ANg7IKE/zt47BLNczq+0Q2rPiWYRBBchKWyUa0OiJ/pc
 Pk6y+8ptorA+pcMQy9CgBnbxHE2vEnl686kY/vxvBNYt4PjGwS+V0E7GSQLiDW8jz8Xa
 oSefhEGmfQvJ24TLfpI1WQaOPj+aUJzW1mBM/+BdaJKX3gWn1zYaIj9SQA1roJWV+kLd
 1uyrT8ACWz3kLL0S3YEcAqc1SpZ0zBS2U//T/RGhalv8XKkFnbRd/XknCDNjoJLHXtFN
 qAya1Vw6fcEC3lwaqG1iZkunO7utE+yQ6nYfIT6AWIYrjNUOUjEvlwZQD7XxJMPsXcYR
 Ud9g==
X-Gm-Message-State: APjAAAUednpwy/xd2B90JiCC305z12niZHzKch/LPdi6Vw6cmQ14hVww
 ipl1xbCtSVZitas1MABD/1rgk4T4RTau4g==
X-Google-Smtp-Source: APXvYqxb0IlaZ9FF0JgRaU6WGDTk72JFdTtgJ7kgWMRA3dlGg+6QSW4HFN9iCynZAOkT2dHxadfYSA==
X-Received: by 2002:a05:600c:212:: with SMTP id
 18mr35875634wmi.88.1564154398294; 
 Fri, 26 Jul 2019 08:19:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v16sm32746844wrn.28.2019.07.26.08.19.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 08:19:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 16:19:51 +0100
Message-Id: <20190726151952.1932-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726151952.1932-1-peter.maydell@linaro.org>
References: <20190726151952.1932-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PULL 4/5] hw/arm/boot: Rename elf_{low,
 high}_addr to image_{low, high}_addr
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the elf_low_addr and elf_high_addr variables to image_low_addr
and image_high_addr -- in the next commit we will extend them to
be set for other kinds of image file and not just ELF files.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Mark Rutland <mark.rutland@arm.com>
Message-id: 20190722151804.25467-2-peter.maydell@linaro.org
---
 hw/arm/boot.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 1fb24fbef27..b7b31753aca 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -986,7 +986,9 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
     int kernel_size;
     int initrd_size;
     int is_linux = 0;
-    uint64_t elf_entry, elf_low_addr, elf_high_addr;
+    uint64_t elf_entry;
+    /* Addresses of first byte used and first byte not used by the image */
+    uint64_t image_low_addr, image_high_addr;
     int elf_machine;
     hwaddr entry;
     static const ARMInsnFixup *primary_loader;
@@ -1014,24 +1016,24 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
         info->nb_cpus = 1;
 
     /* Assume that raw images are linux kernels, and ELF images are not.  */
-    kernel_size = arm_load_elf(info, &elf_entry, &elf_low_addr,
-                               &elf_high_addr, elf_machine, as);
+    kernel_size = arm_load_elf(info, &elf_entry, &image_low_addr,
+                               &image_high_addr, elf_machine, as);
     if (kernel_size > 0 && have_dtb(info)) {
         /*
          * If there is still some room left at the base of RAM, try and put
          * the DTB there like we do for images loaded with -bios or -pflash.
          */
-        if (elf_low_addr > info->loader_start
-            || elf_high_addr < info->loader_start) {
+        if (image_low_addr > info->loader_start
+            || image_high_addr < info->loader_start) {
             /*
-             * Set elf_low_addr as address limit for arm_load_dtb if it may be
+             * Set image_low_addr as address limit for arm_load_dtb if it may be
              * pointing into RAM, otherwise pass '0' (no limit)
              */
-            if (elf_low_addr < info->loader_start) {
-                elf_low_addr = 0;
+            if (image_low_addr < info->loader_start) {
+                image_low_addr = 0;
             }
             info->dtb_start = info->loader_start;
-            info->dtb_limit = elf_low_addr;
+            info->dtb_limit = image_low_addr;
         }
     }
     entry = elf_entry;
-- 
2.20.1


