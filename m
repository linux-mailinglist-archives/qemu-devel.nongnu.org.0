Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C4F621B52
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 18:58:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osSrL-0003oq-Qd; Tue, 08 Nov 2022 12:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osSrK-0003o2-2Z
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 12:58:02 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osSrI-0002Ii-89
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 12:58:01 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o30so9314883wms.2
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 09:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f5oJPPqPjIJNFRPi84YTMbiyp9r3sNtOkARV0kVnlE4=;
 b=S4h1o4THY+ZdA7wf5GA1HxGxs/NlHZYCIUEGviaIlysF31N4PtbWDfltz3VP4jzm9W
 saWgkeecmXpPALtMKaoVHWIkr8HSLO27nke+8WMuTphWtVi75XeqtBjNGRYkLwn5IkSK
 JVEHikd7D7Ga1LCxmUpDhHGTnRmVN+VGTO6NkBVRPeYQDBm0XKO46xDtc0pGH7SO79Gv
 Q9n2RDP1lfoI+pd9a072djvznSa7z0d/PJ7t8UBli/vdooK9ieTQlkdiZsVRr5pxhDcR
 0ccOaY3DrOrk47BJJyB5lavJ4UYnS3Lgm3gF5nojuCR9MDlvQu8Nqx7BJZM2PONOda9F
 2s8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f5oJPPqPjIJNFRPi84YTMbiyp9r3sNtOkARV0kVnlE4=;
 b=tQu8jOIvKZ6pEQ5+kkoBxO35KzIgN8c2VqKK1dbXQHDpKNDhRIINgbQiCrYxu4uFuD
 ZKuYZCh2hm5rHHuK+mNbbCn2vvHXoMHykNa6edpBCVXQqSc3C52iBkLNH5F6B4Zzv+BO
 tZ8dY7EYKUxV+IKBGTA3sN4wnrUYDw/4Pfse1pSQVzcWQav4B+8hkFbNSjtQ6thWRagE
 iaDwqpMjzQ/zVOQDLG/Tlq70NbKbVLN5tx/hC3jEsrU9bcoYmYyrnZmVjuJVwJYHpJe5
 XC3xGKFv3K0qC8gsKABrQXRMHbT6tfycoEsmCghvraKaE2psZykPlgbdTt8iLgrAZqWY
 JNHQ==
X-Gm-Message-State: ACrzQf2Z1/gzSYedOyywG/cThdJv+C0V+vvBdxHAlxZMlXEmHtTbmij1
 1MHqcEnPONRgUbLU6fdP65Plpa5vfGfXZA==
X-Google-Smtp-Source: AMsMyM6XS9ZCL4QYZkvqJ4l2COEA+aezgfUrIYAXqhl9LW3tGilM9VDTO1IV07Vu5T8fzS/V47djxw==
X-Received: by 2002:a05:600c:4d20:b0:3cf:819c:ed with SMTP id
 u32-20020a05600c4d2000b003cf819c00edmr27577177wmp.166.1667930278141; 
 Tue, 08 Nov 2022 09:57:58 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u8-20020adfeb48000000b002366b17ca8bsm12752947wrn.108.2022.11.08.09.57.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Nov 2022 09:57:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-7.2] Revert "hw/block/pflash_cfi: Error out if dev length
 isn't power of 2"
Date: Tue,  8 Nov 2022 18:57:55 +0100
Message-Id: <20221108175755.95141-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit 334c388f25 ("pflash_cfi: Error out if device length
isn't a power of two") aimed to finish the effort started by
commit 06f1521795 ("pflash: Require backend size to match device,
improve errors"), but unfortunately we are not quite there since
various machines are still ready to accept incomplete / oversized
pflash backend images, and now fail, i.e. on Debian bullseye:

 $ qemu-system-x86_64 \
   -drive \
   if=pflash,format=raw,unit=0,readonly=on,file=/usr/share/OVMF/OVMF_CODE.fd
 qemu-system-x86_64: Device size must be a power of two.

where OVMF_CODE.fd comes from the ovmf package, which doesn't
pad the firmware images to the flash size:

 $ ls -lh /usr/share/OVMF/
 -rw-r--r-- 1 root root 3.5M Aug 19  2021 OVMF_CODE_4M.fd
 -rw-r--r-- 1 root root 1.9M Aug 19  2021 OVMF_CODE.fd
 -rw-r--r-- 1 root root 128K Aug 19  2021 OVMF_VARS.fd

Since we entered the freeze period to prepare the v7.2.0 release,
the safest is to revert commit 334c388f25707a234c4a0dea05b9df08d.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1294
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Cc: Sunil V L <sunilvl@ventanamicro.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>
---
 hw/block/pflash_cfi01.c | 8 ++------
 hw/block/pflash_cfi02.c | 5 -----
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 9c235bf66e..0cbc2fb4cb 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -690,7 +690,7 @@ static const MemoryRegionOps pflash_cfi01_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl, Error **errp)
+static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl)
 {
     uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
@@ -708,10 +708,6 @@ static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl, Error **errp)
         sector_len_per_device = pfl->sector_len / num_devices;
     }
     device_len = sector_len_per_device * blocks_per_device;
-    if (!is_power_of_2(device_len)) {
-        error_setg(errp, "Device size must be a power of two.");
-        return;
-    }
 
     /* Hardcoded CFI table */
     /* Standard "QRY" string */
@@ -869,7 +865,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
      */
     pfl->cmd = 0x00;
     pfl->status = 0x80; /* WSM ready */
-    pflash_cfi01_fill_cfi_table(pfl, errp);
+    pflash_cfi01_fill_cfi_table(pfl);
 }
 
 static void pflash_cfi01_system_reset(DeviceState *dev)
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index ff2fe154c1..2a99b286b0 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -880,11 +880,6 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (!is_power_of_2(pfl->chip_len)) {
-        error_setg(errp, "Device size must be a power of two.");
-        return;
-    }
-
     memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
                                   &pflash_cfi02_ops, pfl, pfl->name,
                                   pfl->chip_len, errp);
-- 
2.38.1


