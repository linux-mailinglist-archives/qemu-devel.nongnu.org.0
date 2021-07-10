Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A4A3C35F0
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 19:53:55 +0200 (CEST)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2HAn-00051S-AN
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 13:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H7T-0006UR-FR
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:27 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H7S-0001HC-3r
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so11134323wmb.3
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 10:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/obS4D9S1SVl/D1Gz5H05yYD8WjZiqBnh+MqRwzyFeE=;
 b=ONQm5DuZKNWFIKs1ApOW92WPxR/ne7lRhXX1nihqtGI0omt0fCWGu1j0MdEsnmt1dw
 U/awm3nyqvVIGuf0nzXev+FDhEiEh/SwNZ3UWS1I69Kmix5aWxn5kRmwJTM07az/Rvbz
 O3WowUY66yOGnrYwrvuEVgIj4O+xCDsNMmkjBha3rVz7KRRq9QVeti4oNc0MejUfb9A0
 bYStRhX8vVYumsDbRXUJExQ2ImiqgwcepHzcF/gegZ4HkIFlIentPPnH76OEnN6+b6oe
 uVBnwB/MHSJPEVXyIkOgvaU5ZQu6X5EGNnLolTcz7Khkb+fA5DAi6oOYNPwKCjdXHGNv
 GW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/obS4D9S1SVl/D1Gz5H05yYD8WjZiqBnh+MqRwzyFeE=;
 b=bc1r77J9r6O/RZIQ8J9mAHt32gKwxbwT/vL8Yx4PYRLzhbY2sL1RTRhfJulQaJxpDR
 vKj8MTzVjUpRmjW87sIh+RgCmD7975cOzBMU3pC5UO3Jflw2Dln/uSFWMHyc4is/nVFR
 MHeeB/Ou9ASpyvBj9cmSxa1W5Pm02kY3F1DyLBy4HrCC/T5aGl2pM7F4zpN1+IuvIQZ5
 5P5lm4zi/rg71m9yfZdy731T6FU2qrPs7DDIVtk9raTop6f8UyoXYgCuVG9fvBtX6x5x
 +FUDP173kZyVlklGJmqONySJcnQjeaJxEqhOKdAC8uufeycwGrbTS8OxROMies57TNdy
 5taQ==
X-Gm-Message-State: AOAM531qDxkOGBeIVLYdSh9m9S3LoqzDN45LFvIXIaphCRyVk2Gkm3w7
 PViOExkt1drn0jObQAGrmakNUSIoiKiczw==
X-Google-Smtp-Source: ABdhPJyd+p4z1ZoIjgYJYtRXgIQig3nmiulzJj/z8lTLw3mhNtMMA/Fgcd0qU5GU2r/bw9lpSYBNCg==
X-Received: by 2002:a05:600c:4f8a:: with SMTP id
 n10mr5266550wmq.11.1625939424691; 
 Sat, 10 Jul 2021 10:50:24 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s1sm15119821wmj.8.2021.07.10.10.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 10:50:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/8] dp8393x: Store CRC using device configured endianess
Date: Sat, 10 Jul 2021 19:49:52 +0200
Message-Id: <20210710174954.2577195-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210710174954.2577195-1-f4bug@amsat.org>
References: <20210710174954.2577195-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Little-Endian CRC is dubious. The datasheet does not
specify it being little-endian. Use big-endian access
when the device is configured in such endianess.
(This is a theoretical bug fix.)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 68516241a1f..ac93412f70b 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -827,7 +827,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     s->regs[SONIC_TRBA0] = s->regs[SONIC_CRBA0];
 
     /* Calculate the ethernet checksum */
-    checksum = cpu_to_le32(crc32(0, buf, pkt_size));
+    checksum = crc32(0, buf, pkt_size);
 
     /* Put packet into RBA */
     trace_dp8393x_receive_packet(dp8393x_crba(s));
@@ -837,8 +837,13 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     address += pkt_size;
 
     /* Put frame checksum into RBA */
-    address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                        &checksum, sizeof(checksum));
+    if (s->big_endian) {
+        address_space_stl_be(&s->as, address, checksum,
+                             MEMTXATTRS_UNSPECIFIED, NULL);
+    } else {
+        address_space_stl_le(&s->as, address, checksum,
+                             MEMTXATTRS_UNSPECIFIED, NULL);
+    }
     address += sizeof(checksum);
 
     /* Pad short packets to keep pointers aligned */
-- 
2.31.1


