Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2238912864D
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Dec 2019 02:08:12 +0100 (CET)
Received: from localhost ([::1]:35748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiTFa-0002DD-1A
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 20:08:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57508)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iiTAK-0002Rc-AC
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 20:02:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iiTAJ-0006SR-0t
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 20:02:44 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45160)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iiTAI-0006Od-Ok
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 20:02:42 -0500
Received: by mail-wr1-x441.google.com with SMTP id j42so11024235wrj.12
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 17:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V1+z6sRVnI27VpffzgG0YkFKLgO7M/snYow2w7N5Qbg=;
 b=EPBEARiMrVjq6fE8LgpPISwcrO16IseTUI56yLbNTSi6e7o2hjyiW4PoLnJRNX549x
 UOsLG0de55WnyyXN8aHElx3R6M9twbQSlDuMHzB0KMUmWE4H+fY6gf0xdJRAQHlwDxYz
 gPglqQu4a772oufKgdTyEDrr0z3o/FTsRzAeVvTX3dF7CXlgTG2+3k6qD9eXQ/EJ8Hh+
 fKCCWsLmQBSZL9+4YOpgLH9GkN9xwE+4vEWruCQNkRX6HOFZoktIWhN+SJKeKX47OKi5
 O7Td4iZpGIB2Jb3BOtJzhcbJ7DaSlU76P2M1RM+TCcL9iIzqDeliMNf0whpzYiP/Pnau
 +FlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V1+z6sRVnI27VpffzgG0YkFKLgO7M/snYow2w7N5Qbg=;
 b=XNjRX16DbWaOxF5GLO2aqBPnxxIKkWYilzgunPef7wSyKGNA6cEwIyfeS3ch4+WF87
 Js//y5hbEZf/Q3c2Oq0mFv8VH2IslAVrjyHp0GxXVWlDrbn9/TGx5AVsHqyE0mHXhtOs
 EANzdqXXnzw2diWFBgZW+AkvJQslZzpWQhVqeWFjoFTpjjItcvE4YxybM88zV0wGazGp
 rgTScEKfyTR4sJgGOWBfuJ6qxY8r1+5vnZBrK/ilwvYZI1AV+Pzyr1PwOuVUENl2l7JO
 FMwYA2v/jjW1WO+GMNJOiwrUrfS5lN0YT+DLGLsuYJRaSbGhzP/yob3tCabClA1NANuw
 /wqQ==
X-Gm-Message-State: APjAAAVQIbtx7mjsKA1NknRI9WHogX/J6GBTIfEQg/v1lDl0baYZZhWj
 1JFLveOSm3yC267ZSFwT+cOuda9f
X-Google-Smtp-Source: APXvYqxowyWKuNtUpEloLNeXz2OnYy7Bj19Ks5I6noxSHJsPk9UlDpYelA9+ULicfzZAPwlojJDClA==
X-Received: by 2002:a5d:620b:: with SMTP id y11mr17574237wru.230.1576890161555; 
 Fri, 20 Dec 2019 17:02:41 -0800 (PST)
Received: from x1w.redhat.com (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id t125sm8449596wmf.17.2019.12.20.17.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 17:02:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 2/8] hw/timer/avr_timer16: Rename memory region debugging
 name
Date: Sat, 21 Dec 2019 02:02:20 +0100
Message-Id: <20191221010226.9230-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191221010226.9230-1-f4bug@amsat.org>
References: <20191221010226.9230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This device expose 3 different I/O regions. Name them differently
to have a clearer 'info mtree' output.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/avr_timer16.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/timer/avr_timer16.c b/hw/timer/avr_timer16.c
index f3dcef7246..8a0027861c 100644
--- a/hw/timer/avr_timer16.c
+++ b/hw/timer/avr_timer16.c
@@ -562,11 +562,11 @@ static void avr_timer16_init(Object *obj)
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->ovf_irq);
 
     memory_region_init_io(&s->iomem, obj, &avr_timer16_ops,
-                          s, TYPE_AVR_TIMER16, 0xe);
+                          s, "avr-timer16", 0xe);
     memory_region_init_io(&s->imsk_iomem, obj, &avr_timer16_imsk_ops,
-                          s, TYPE_AVR_TIMER16, 0x1);
+                          s, "avr-timer16-intmask", 0x1);
     memory_region_init_io(&s->ifr_iomem, obj, &avr_timer16_ifr_ops,
-                          s, TYPE_AVR_TIMER16, 0x1);
+                          s, "avr-timer16-intflag", 0x1);
 
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->imsk_iomem);
-- 
2.21.0


