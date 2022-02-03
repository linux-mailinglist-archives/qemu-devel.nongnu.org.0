Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0934A7C5C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 01:08:40 +0100 (CET)
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFPfz-0002tW-53
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 19:08:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFPe1-0002Aq-CY
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 19:06:37 -0500
Received: from [2607:f8b0:4864:20::529] (port=47043
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFPdz-0007T6-DC
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 19:06:37 -0500
Received: by mail-pg1-x529.google.com with SMTP id s16so812336pgs.13
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 16:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sNM0b1Hblbv13MBti61QiQCGZnjfK+gj+KEVibd6P3A=;
 b=m5IG52vpf8NttpfO+rVUf5+Ph2lMY1JrhPtVJ9+LV/cpIAai0HzzvOccR2CHHYXQUr
 AN6co3VAdm7GuPKgj8XWz4N0fEOqwE7KGFnM2LRLplB0MF61jcKPYBaNdc8XmRoUM80g
 mpdwfkzHS4xBS6sRQ0qMAxnXZjdNQwFE/soIuDr+xD6smPhob709WvmpjnIWxj1BKD6R
 SJCXig2q61kmeDpTLhvJrK9akT2PInAdYW2bEpeURCFBpS+KVwJTOWVxVaBda50+cCFd
 2j0964p5YjMpIpAjry1cEAn3NG8nlnKS6EE9vNG0s/4n0/3A90PAuR3Qy4PToFkMewk5
 DfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=sNM0b1Hblbv13MBti61QiQCGZnjfK+gj+KEVibd6P3A=;
 b=g4rEk5fDKiZK6eeBsOnDamWoGPFjsTKbGxE1fpfELAoh0ffspj81lAtGEEfV6x8nd+
 KLTAPGQnEmx0iSmEAqY9d6gxCzLLQxvi3QwwD2inki2Bq2sVVfPGGjv7U12nFQjHLMRI
 K/8eiH09oxRKnj+3sLimltIwsM/rrM/q8Guu1ipRpLoB9UGJfRMtDNTwq6jNXuGHrk7U
 vr01+o9IqVl+rESMCruIfxWAC59uXPm3uWIS9q3y6z3UAWeKQexxPcqjobuHQUFfyHcp
 gf7Jjs833FNqCGIIRH+2O11XsGSeOaxvIGBasulkztqWVVuToxWgDPTyv2bUEvPrld0X
 kDVA==
X-Gm-Message-State: AOAM533+QUarvM2JV55theyqK1nWUKJeWTtbQ5FcJq4ya+bmvsmeQEPW
 5Rz3KFVHb798PqBGnI7xRFvGJZVPWAo=
X-Google-Smtp-Source: ABdhPJzs4lphkqIS6FNoM9qmYIrmfca5CHO0FVz0n7rzT1P4z5SLwAYuAvlJy0ZGzJTFWyc1RVj9sg==
X-Received: by 2002:a63:88c6:: with SMTP id
 l189mr26344179pgd.229.1643846756210; 
 Wed, 02 Feb 2022 16:05:56 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id d2sm7495848pju.2.2022.02.02.16.05.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Feb 2022 16:05:55 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Andreas Gustafsson <gson@gson.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2] hw/display/tcx: Mark the VRAM dirty upon reset
Date: Thu,  3 Feb 2022 01:05:50 +0100
Message-Id: <20220203000550.36711-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

When resetting we don't want to *reset* the dirty bitmap,
we want to *set* it to mark the entire VRAM dirty due to
the memset() call.

Replace memory_region_reset_dirty() by tcx_set_dirty()
which conveniently set the correct ranges dirty.

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Supersedes: <20220122000707.82918-1-f4bug@amsat.org>
---
 hw/display/tcx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index d4d09d0df8..90e2975e35 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -371,8 +371,7 @@ static void tcx_reset(DeviceState *d)
     s->r[258] = s->g[258] = s->b[258] = 255;
     update_palette_entries(s, 0, 260);
     memset(s->vram, 0, MAXX*MAXY);
-    memory_region_reset_dirty(&s->vram_mem, 0, MAXX * MAXY * (1 + 4 + 4),
-                              DIRTY_MEMORY_VGA);
+    tcx_set_dirty(s, 0, MAXX * MAXY);
     s->dac_index = 0;
     s->dac_state = 0;
     s->cursx = 0xf000; /* Put cursor off screen */
-- 
2.34.1


