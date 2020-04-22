Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A431B4FAC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 23:56:37 +0200 (CEST)
Received: from localhost ([::1]:58572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRNMB-0005JT-Kj
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 17:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anthoine.bourgeois@gmail.com>) id 1jRNKs-0004OY-BM
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 17:55:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <anthoine.bourgeois@gmail.com>) id 1jRNKr-0004tT-Lh
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 17:55:14 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anthoine.bourgeois@gmail.com>)
 id 1jRNKr-0004o6-8y
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 17:55:13 -0400
Received: by mail-wr1-x442.google.com with SMTP id i10so4417562wrv.10
 for <qemu-devel@nongnu.org>; Wed, 22 Apr 2020 14:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SUQYWuaID5Z+pwe1OLNego3sgvcBxY1As+bvkp8jKu4=;
 b=b6M3pXXckyp9gW3X/MO81cCEEmsxV5P8fgaE8vN27WwbxV23zL4hlXGqzhk5e/zr+P
 pAa3Nl5HAZzFyXfKrCqlTU1/JXkjcqN4kIP/3AG1YC8CQrqHSezZHZ8oAHVhQYp2C3Wt
 pMvOnvyUu0lXBoXj+TuCpuqflEYk05ZOKGeuH/IKQm0zEy8UlXSzLST/ZXO0qX44Hbss
 /GNPsV62nPs8YmhUGdzSiPUAyCnY2dmhI9phyLqMdPTkOMy0gIzC7rKdvi6dr5ZwulcU
 q1o03QefNoCLLDCLlCYFAjsxFixKN1/HazwgqgfWw/GsZH2vOEDgGJ16PhuX6z8e9QLo
 5XmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SUQYWuaID5Z+pwe1OLNego3sgvcBxY1As+bvkp8jKu4=;
 b=UK5WsjNzymfb4tw02lL9/zBkA2bLGoWLzfWMbEP3AzLwUVxyQl0xMwIBptCbZuh8wV
 sXcyBlddZyW19yfCev5zlgnMBvicst5HMHgepDieCy2w2jMhiWuBJGaR+HBOWepd02YR
 YePTkuUAJ7MbsVaDQXP5k+nGjvV+D5qfBPFyHlQuxNQ4e5HCHm0wmLOf/8LFbEMbr1cN
 pguOD1HPFHv55S7yvGAHQZ6niGUiCzAq4mxztqUcvetOHd7Ydx4twUcIA9bq4HDdb4ul
 bPDd2z0DrZJ/knfnxkOmaPpJ1Ak394yB0ZvxVPVP/6T62FCnue3xN2Xa7SSqJ5R/rErp
 L8JQ==
X-Gm-Message-State: AGi0PuaIHj+E5nKN7SFgJJibOpHvlVL9gfrG86F/vMFZ5AUXHRxr5wb6
 HelV/6g8J1yPQTXpi+2py0o=
X-Google-Smtp-Source: APiQypKGShdLI5UMAN6sqJfp9gNqTzCcqo7oCd1KRL12v2oOFVCnn3Beyf7dygaEkX1dQ6+XxhknqA==
X-Received: by 2002:a5d:5189:: with SMTP id k9mr1197255wrv.3.1587592510740;
 Wed, 22 Apr 2020 14:55:10 -0700 (PDT)
Received: from hobbes.blade-group.net
 ([2a01:e35:2fb2:a0d0:6d28:3d72:693e:c474])
 by smtp.gmail.com with ESMTPSA id c190sm874243wme.10.2020.04.22.14.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 14:55:10 -0700 (PDT)
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 1/2] virtio-vga: fix virtio-vga bar ordering
Date: Wed, 22 Apr 2020 23:54:54 +0200
Message-Id: <20200422215455.10244-1-anthoine.bourgeois@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=anthoine.bourgeois@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::442
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With virtio-vga, pci bar are reordered. Bar #2 is used for compatibility
with stdvga. By default, bar #2 is used by virtio modern io bar.
This bar is the last one introduce in the virtio pci bar layout and it's
crushed by the virtio-vga reordering. So virtio-vga and
modern-pio-notify are incompatible because virtio-vga failed to
initialize with this option.

This fix sets the modern io bar to the bar #5 to avoid conflict.

Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
---
 hw/display/virtio-vga.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 2b4c2aa126..95757a6619 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -114,6 +114,7 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
      */
     vpci_dev->modern_mem_bar_idx = 2;
     vpci_dev->msix_bar_idx = 4;
+    vpci_dev->modern_io_bar_idx = 5;
 
     if (!(vpci_dev->flags & VIRTIO_PCI_FLAG_PAGE_PER_VQ)) {
         /*
-- 
2.20.1


