Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28402333218
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 00:54:37 +0100 (CET)
Received: from localhost ([::1]:47446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJmBQ-00014h-5F
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 18:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm8K-0004b7-EI
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:51:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm8I-0001CL-Jh
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:51:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615333881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qy+PTHxX7Huj9tjoLOPMC5OSIt87dLhiTpUcqMgFpc=;
 b=ZRdiYYqqRdEddBzFcoI6Z+A0NEpBlIbFtTguSYHETIMv7EpuxlWM2tyHX3K6PoTx9NvlQh
 1BU68FyqmPs+hqMvR7hSl9TTiBifV+1yl1JQU7MfrfAE170AxGWq6/MMCM816u8ad4w3tT
 aSZ9SBqa3KFAnxPkSmy9QAvKvLSVCd4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-ARxrelvSOni28qzksKzm-w-1; Tue, 09 Mar 2021 18:51:20 -0500
X-MC-Unique: ARxrelvSOni28qzksKzm-w-1
Received: by mail-ej1-f71.google.com with SMTP id di5so6411610ejc.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 15:51:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+qy+PTHxX7Huj9tjoLOPMC5OSIt87dLhiTpUcqMgFpc=;
 b=N+VsypNfqp6qaiP8n26jpj1nwgMSjsC1N4cBy/hvNnF9ZLW7WMtHDcKVlgGQJL7jbf
 ROFvsFYB2a49IV2ruc/F+iqQkyrGfW6NRhR51tOfoDGeyhweaVCxAYWiQc0aqjZxyreC
 EODgxKOrgeSJJ40zkMGvQRPbi8mhbkdO2+EukLXALYsPKYklMBkeqddsx71QV/5m5dBV
 XVxvibC/9GtBS+LpYP2Fw2FAoqJRKPzDpFiWNr+p6RZJF3wbaCS5pJrB0b3ckXJKgi4d
 qzoIqisIOyrA+mr9iDqpopJOQBxKCrcBMlR+hbmo1lVAAUKECcfW4pbnSyeXX4JtwJHg
 TEHw==
X-Gm-Message-State: AOAM533VxX2syuk8mQL4kJqJ8SIY4EY+VedsQiSYQWfhDzTIQehqnvae
 kBb6lqDecfZULNUD1XzozfRc7B7kOAP1pI6wLy5ghpM3tA6Ov9zpayzRjEiWuZMY+f4/s+1wgfj
 TvmYfpRmDMMJhcyDYiMe5ifqbw+DCVJC51p6erRgSZvSt8bpfu1cp/sRHmHwjgL+c
X-Received: by 2002:a50:fc94:: with SMTP id f20mr180164edq.370.1615333879089; 
 Tue, 09 Mar 2021 15:51:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIfelKM7fpky08JbD8KlJyfEgtCvmAqDAoD4S5W2kW2STAedUUU1l+W8QOncswpaSyK+UfmA==
X-Received: by 2002:a50:fc94:: with SMTP id f20mr180138edq.370.1615333878855; 
 Tue, 09 Mar 2021 15:51:18 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p19sm10094548edr.57.2021.03.09.15.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 15:51:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] hw/block/pflash_cfi01: Extract pflash_mode_read_array()
Date: Wed, 10 Mar 2021 00:50:28 +0100
Message-Id: <20210309235028.912078-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309235028.912078-1-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The same pattern is used when setting the flash in READ_ARRAY mode:
- Set the state machine command to READ_ARRAY
- Reset the write_cycle counter
- Reset the memory region in ROMD

Refactor the current code by extracting this pattern.
It is used three times:

- On a read access (on invalid command).

- On a write access (on command failure, error, or explicitly asked)

- When the device is initialized. Here the ROMD mode is hidden
  by the memory_region_init_rom_device() call.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 40 +++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 2618e00926d..32c9b289715 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -115,6 +115,19 @@ static const VMStateDescription vmstate_pflash = {
     }
 };
 
+static void pflash_mode_read_array(PFlashCFI01 *pfl)
+{
+    trace_pflash_mode_read_array();
+    /*
+     * The command 0x00 is not assigned by the CFI open standard,
+     * but QEMU historically uses it for the READ_ARRAY command (0xff).
+     */
+    trace_pflash_mode_read_array();
+    pfl->cmd = 0x00;
+    pfl->wcycle = 0;
+    memory_region_rom_device_set_romd(&pfl->mem, true);
+}
+
 /*
  * Perform a CFI query based on the bank width of the flash.
  * If this code is called we know we have a device_width set for
@@ -283,12 +296,7 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr offset,
     default:
         /* This should never happen : reset state & treat it as a read */
         DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
-        pfl->wcycle = 0;
-        /*
-         * The command 0x00 is not assigned by the CFI open standard,
-         * but QEMU historically uses it for the READ_ARRAY command (0xff).
-         */
-        pfl->cmd = 0x00;
+        pflash_mode_read_array(pfl);
         /* fall through to read code */
     case 0x00: /* This model reset value for READ_ARRAY (not CFI compliant) */
         /* Flash area read */
@@ -663,10 +671,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
                   "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
 
  mode_read_array:
-    trace_pflash_mode_read_array();
-    memory_region_rom_device_set_romd(&pfl->mem, true);
-    pfl->wcycle = 0;
-    pfl->cmd = 0x00; /* This model reset value for READ_ARRAY (not CFI) */
+    pflash_mode_read_array(pfl);
 }
 
 
@@ -872,13 +877,8 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         pfl->max_device_width = pfl->device_width;
     }
 
-    pfl->wcycle = 0;
-    /*
-     * The command 0x00 is not assigned by the CFI open standard,
-     * but QEMU historically uses it for the READ_ARRAY command (0xff).
-     */
-    pfl->cmd = 0x00;
     pfl->status = 0x80; /* WSM ready */
+    pflash_mode_read_array(pfl);
     pflash_cfi01_fill_cfi_table(pfl);
 }
 
@@ -887,13 +887,7 @@ static void pflash_cfi01_system_reset(DeviceState *dev)
     PFlashCFI01 *pfl = PFLASH_CFI01(dev);
 
     trace_pflash_reset();
-    /*
-     * The command 0x00 is not assigned by the CFI open standard,
-     * but QEMU historically uses it for the READ_ARRAY command (0xff).
-     */
-    pfl->cmd = 0x00;
-    pfl->wcycle = 0;
-    memory_region_rom_device_set_romd(&pfl->mem, true);
+    pflash_mode_read_array(pfl);
     /*
      * The WSM ready timer occurs at most 150ns after system reset.
      * This model deliberately ignores this delay.
-- 
2.26.2


