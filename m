Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8F04694C6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 12:10:11 +0100 (CET)
Received: from localhost ([::1]:38168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBso-0000z1-Ev
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 06:10:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBqo-0007BR-7g
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:08:06 -0500
Received: from [2a00:1450:4864:20::32c] (port=53827
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBqm-0003Md-2v
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:08:05 -0500
Received: by mail-wm1-x32c.google.com with SMTP id y196so7799916wmc.3
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 03:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rQLNgDkVXYZwEW1Uu7rHJimRg2dieloG0z+rLGhTp5Y=;
 b=jOc4ISS2cWzVlHqw482AK/qGFaX/NbQMaSB31s5DcFyfHumwjP06rMqUL3A60y0isa
 KoE+DrAAUbQ2fNu7zNWJvexJp76rdBHwUw6NiHANeQAt12DeE5SqHAf3pX7vV/C1T4Gf
 yaZls/QyEkbu39bj2ElkOxqUuSU6J5CFX1jOohs2ez6Q/9fNbTbtIId28yrYfSL63PyP
 s+OWRT1cSeNQbeg1nYdmMBQnwbVPws6LBJM5zIO16qBaEVSK3lUWnnpJJDrVRdoJ6D0Z
 BZEKTwwadQXm3yjWvn4QeFVYvaFu+2d19Tp7R/54qU1TDEa71HQ5X3iBSbuOZskC6RC4
 bd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rQLNgDkVXYZwEW1Uu7rHJimRg2dieloG0z+rLGhTp5Y=;
 b=nTQkF9Mb3t2DZ6PuIKlfQXiJ2xNJDeZXr3ORvuwRporqZHgeDJO8tSMdlRYIhOVBbC
 QXhROEo5YZKKJmVrcAi81mtSRyM9ptqFv62w/tdoJ3oTj39+ND813ZQinycGijqepoms
 tSmkxotZMYWFzQFv9VJI4t/SCn0C10yDt2DFbIQIV6jjIhFwmquk0TPMzPGriXPMjPsc
 VyeUSsAo2bwTxtUZe4rLL19/XyUzXy8AXx7slTSESl3jeRJipKNU+fDaMX51iizYLHJz
 cvmQgbIWfpqbNz+jg+ENBy1GUpjn+emHGM9nDTiWVSg7S+2h0qcDoqedPbMjmfGEt1cb
 vZog==
X-Gm-Message-State: AOAM532zGr+sMreMDFqteYKzLk3PARmPUddgsZzGKRkrQhhio4lmxILY
 7M4XnX3K457iZ8w931WqpcdRQVf3cRc=
X-Google-Smtp-Source: ABdhPJwePLULPzGNu2IBcRD54VkjYyrz7DlrqajAIBcgsCaphpdZb7TYH4v1lZ810gn/ueEnMF12nw==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr37266271wml.194.1638788882652; 
 Mon, 06 Dec 2021 03:08:02 -0800 (PST)
Received: from x1w.. (82.red-83-50-95.dynamicip.rima-tde.net. [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id g19sm13847705wmg.12.2021.12.06.03.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 03:08:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] Revert "vga: don't abort when adding a duplicate isa-vga
 device"
Date: Mon,  6 Dec 2021 12:07:46 +0100
Message-Id: <20211206110746.360608-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206110746.360608-1-f4bug@amsat.org>
References: <20211206110746.360608-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

This reverts commit 7852a77f598635a67a222b6c1463c8b46098aed2.

The check is bogus as it ends up finding itself and falling over.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/733
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211206095209.2332376-1-alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/vga-isa.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 8cea84f2bea..90851e730bc 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -33,7 +33,6 @@
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
-#include "qapi/error.h"
 
 #define TYPE_ISA_VGA "isa-vga"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
@@ -62,15 +61,6 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
     MemoryRegion *vga_io_memory;
     const MemoryRegionPortio *vga_ports, *vbe_ports;
 
-    /*
-     * make sure this device is not being added twice, if so
-     * exit without crashing qemu
-     */
-    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
-        error_setg(errp, "at most one %s device is permitted", TYPE_ISA_VGA);
-        return;
-    }
-
     s->global_vmstate = true;
     vga_common_init(s, OBJECT(dev));
     s->legacy_address_space = isa_address_space(isadev);
-- 
2.33.1


