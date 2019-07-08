Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB54E61F89
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 15:27:03 +0200 (CEST)
Received: from localhost ([::1]:41724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkTfb-0001Fg-5f
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 09:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52286)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hkTbQ-00061b-Q6
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 09:22:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hkTbP-0003z7-Kc
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 09:22:44 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45192)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hkTbP-0003yJ-DZ
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 09:22:43 -0400
Received: by mail-wr1-x431.google.com with SMTP id f9so17071774wre.12
 for <qemu-devel@nongnu.org>; Mon, 08 Jul 2019 06:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pKM2iILzmzhmTqm7MEMC5botAaQF87nwgPiMoPvLMns=;
 b=YTH0RLqeggG5rfz11OfxKD7+0CEdGqqxd2/vCjX3gmnz2PMmN5XC31hJ86ZqMMY8CG
 HMTuhadm3LOGJ/IagFEumjmLVauYeT0vDyGIlaIL8O70M61UnBQTjCIPy00s3nOj0xrf
 g++6Y1JWihTlNNx38R/uOyIvjEoUsNlPrI9R7USfG97rDqxWclHQ/N3RacVtZE50N0Nz
 sNQn24Y7GLJ+qcYtgLlEZ3GznSaF+g+svcrr7N2x/xVBBAr/1mKYgTH/fm/B0DzPjpBi
 BqGK8973EPh4Pd5n+5HrRYDS416wB1y+ftMfVJUZipgLTXXcfo880T86ED8egJ0Xj/LU
 mdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pKM2iILzmzhmTqm7MEMC5botAaQF87nwgPiMoPvLMns=;
 b=h2AgjFLXo5pDv+XH3ljU5L4mvdGY6qAUgNzuupD2R/tYJJcqNpgfi3iXZK0Qs662SY
 9ihj6pZe/RexI5+aEmkMP28e8oYZ5K5Mzk1VITGaifHGYG9Rc+006BLzPPJax6HkzGkm
 6Jeb5gI0L16nFd2OURHFioWbw2eDfZnL0ZnSygYZHeRT6CFz1FbnMxRLvJm3h/B6cTR9
 4g6r2o6zANVWS98VFhRveQYNIK0dzpRQ4SewIc9HJDqi5Vgs3Mv3GjKxGuI0h9cnvRmO
 rmrE0rsO37HbWHJBbA7N0FGdGHFvQh5WAUtYQ9KfZqQHtGBpJqte6PzsMWpjFf5+a0x5
 sEog==
X-Gm-Message-State: APjAAAWnFDNwkuqDp2joXKeC4KNpdIiY5cV2eJPBKStc7ugshwsk24sa
 bWFX7cyebvD/LHRY9P8VFxr/Dslb3b8OWw==
X-Google-Smtp-Source: APXvYqy0k76u0+Xc0tBxR4ayVap+r+17gY2+Hzy5iIyRn1jPxInc6qFuk2DzcDdD0kp6hBiRaCECEA==
X-Received: by 2002:a5d:4cc5:: with SMTP id c5mr9107067wrt.278.1562592162133; 
 Mon, 08 Jul 2019 06:22:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v15sm13773744wrt.25.2019.07.08.06.22.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 08 Jul 2019 06:22:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  8 Jul 2019 14:22:36 +0100
Message-Id: <20190708132237.7911-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190708132237.7911-1-peter.maydell@linaro.org>
References: <20190708132237.7911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::431
Subject: [Qemu-devel] [PULL 3/4] hw/arm/sbsa-ref: Remove unnecessary check
 for secure_sysmem == NULL
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

In the virt machine, we support TrustZone being either present or
absent, and so the code must deal with the secure_sysmem pointer
possibly being NULL. In the sbsa-ref machine, TrustZone is always
present, but some code and comments copied from virt still treat
it as possibly not being present.

This causes Coverity to complain (CID 1407287) that we check
secure_sysmem for being NULL after an unconditional dereference.
Simplify the code so that instead of initializing the variable
to NULL, unconditionally assigning it, and then testing it for NULL,
we just initialize it correctly in the variable declaration and
then assume it to be non-NULL. We also delete a comment which
only applied to the non-TrustZone config.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20190704142004.7150-1-peter.maydell@linaro.org
Tested-by: Radosław Biernacki <radoslaw.biernacki@linaro.org>
Reviewed-by: Radosław Biernacki <radoslaw.biernacki@linaro.org>
---
 hw/arm/sbsa-ref.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index e8c65e31c70..9c67d5c6f9e 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -254,8 +254,6 @@ static void sbsa_flash_map(SBSAMachineState *sms,
      * sysmem is the system memory space. secure_sysmem is the secure view
      * of the system, and the first flash device should be made visible only
      * there. The second flash device is visible to both secure and nonsecure.
-     * If sysmem == secure_sysmem this means there is no separate Secure
-     * address space and both flash devices are generally visible.
      */
     hwaddr flashsize = sbsa_ref_memmap[SBSA_FLASH].size / 2;
     hwaddr flashbase = sbsa_ref_memmap[SBSA_FLASH].base;
@@ -591,7 +589,7 @@ static void sbsa_ref_init(MachineState *machine)
     SBSAMachineState *sms = SBSA_MACHINE(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     MemoryRegion *sysmem = get_system_memory();
-    MemoryRegion *secure_sysmem = NULL;
+    MemoryRegion *secure_sysmem = g_new(MemoryRegion, 1);
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     bool firmware_loaded;
     const CPUArchIdList *possible_cpus;
@@ -615,13 +613,11 @@ static void sbsa_ref_init(MachineState *machine)
      * containing the system memory at low priority; any secure-only
      * devices go in at higher priority and take precedence.
      */
-    secure_sysmem = g_new(MemoryRegion, 1);
     memory_region_init(secure_sysmem, OBJECT(machine), "secure-memory",
                        UINT64_MAX);
     memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1);
 
-    firmware_loaded = sbsa_firmware_init(sms, sysmem,
-                                         secure_sysmem ?: sysmem);
+    firmware_loaded = sbsa_firmware_init(sms, sysmem, secure_sysmem);
 
     if (machine->kernel_filename && firmware_loaded) {
         error_report("sbsa-ref: No fw_cfg device on this machine, "
-- 
2.20.1


