Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA6C320B23
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:53:39 +0100 (CET)
Received: from localhost ([::1]:49860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq78-00043u-4h
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprJ-0008DK-Kw
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:17 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDprH-0003Mm-38
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:37:16 -0500
Received: by mail-wm1-x331.google.com with SMTP id m25so2581050wmi.3
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=85nFzxomfBY0Wb6TMHkchJXfTbOBaI6sB3oIVJAaXrw=;
 b=AQUaGGXhtDhVsANDv0/7mafaRU7KhiCXrXaEMRQRYqUl30a39A4ZKQXwzjqsBM0hf3
 Zb8j5cv4fJ9xhd4RUIzdx6BjND0iTdrGJunjzW+ZDa53WJgcz60OQH6LcvDkfaDHosTI
 v8IwBV3mUa+oRLYTahfKdtcK696FrzidXurclHiEVhz9RVWEjV4r3VPQ7efi2G9klt1w
 5KTTAaOQETV5JEb1OG4rfHNXab/bDiprjQdWQX5pMO3/+bm7lyqrWj2hbrgS0xk/QfWB
 U7v4ysJ58a0pTNfVgawFslroWR9/5FMEjSjIuOad4m3ZrPCk443VO1Wv5BjnwLfhHb76
 GJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=85nFzxomfBY0Wb6TMHkchJXfTbOBaI6sB3oIVJAaXrw=;
 b=bh8IQCFBbuNhlPS43LTUWCTEg/XqaDTcdXVGa++fbKTLkGP23se2RxeqVqb/HKCQXl
 t6lvUHbO5V7eQ1pDAFeVFtb3ZMv0T0ARl4uagDlW4F3ENfPDwns+4WbCnCBszPX+FYKq
 ckkfVe56R9dT6SKIYvVCEU3OojvJgzuskfXYB6qRAjGC6MzW1yL/EXoFUgmUYglQpFUO
 6EZATBbi5+U64wcQFA/9gaJE/0B8sXIjG9lu0YmFJ3u1i+1G0lkyXIhdBPwAXMJAmkVL
 I2XTJidJb47JIbZUcY/3eK7OSn7ZxyPwbwtrqjlU0jFbjTYIcY+E9/IaR4SQoJIIUln7
 4MDg==
X-Gm-Message-State: AOAM532q+UUFE8TBx8ccC/5y/jRMJ6aq5fEq9kMGEprUFXhLGVFBuUl1
 R5yW6a/QyRqXZscPTT7vrZWZndD4Nfc=
X-Google-Smtp-Source: ABdhPJydyLuqdGMDIu06QseJzlRVvwr59u48z+RuySUsDHBCwgcW+pT9Y/mMdr5aG6fHHZm6thXhZw==
X-Received: by 2002:a1c:5686:: with SMTP id
 k128mr16517514wmb.189.1613918233645; 
 Sun, 21 Feb 2021 06:37:13 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x4sm24885303wrn.64.2021.02.21.06.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:37:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/43] vt82c686: Correct vt82c686-pm I/O size
Date: Sun, 21 Feb 2021 15:34:21 +0100
Message-Id: <20210221143432.2468220-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Section "Offset 4B-48 – Power Management I/O Base" describes:

 Port Address for the base of the 128-byte Power
 Management I/O Register block.

Correct the vt82c686-pm I/O region size.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <cff9b2442d3e2e1cfbdcbc2dfbb559031b4b1cc1.1610223397.git.balaton@eik.bme.hu>
[PMD: Split original patch, this is part 2/4, reduced size to 128B]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 7e6a07fca48..fe8ae24c421 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -176,7 +176,7 @@ static void vt82c686b_pm_realize(PCIDevice *dev, Error **errp)
     apm_init(dev, &s->apm, NULL, s);
 
     memory_region_init_io(&s->io, OBJECT(dev), &pm_io_ops, s,
-                          "vt82c686-pm", 64);
+                          "vt82c686-pm", 128);
     memory_region_add_subregion(pci_address_space_io(dev), 0, &s->io);
     memory_region_set_enabled(&s->io, false);
 
-- 
2.26.2


