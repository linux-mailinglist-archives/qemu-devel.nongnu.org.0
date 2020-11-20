Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13922BAF40
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:48:05 +0100 (CET)
Received: from localhost ([::1]:50726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8do-00009D-8I
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bu-0006Oh-QF; Fri, 20 Nov 2020 10:46:06 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bt-0002px-E4; Fri, 20 Nov 2020 10:46:06 -0500
Received: by mail-wm1-x329.google.com with SMTP id p22so10762977wmg.3;
 Fri, 20 Nov 2020 07:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cm3lia8anTWDVgfbt0f/jL3jqU8QAJ6KmLpjDhi9roM=;
 b=nte5I8S4T8nlZ3o7lxxcdliRkyc7KgDfZV3qK5JAI5T78EVMMGOzKMMj8HelAXa5jR
 S3O6ga4SvPv3R6jxiL2/jYIk7fROFmPAPnS2SOAGHcYcROsu6zH9OGcJUTaL8aYhjGIr
 wzMY+1MERZh2oCQKYLjQkEBlTioLr/1iAkkw2Zxt3LxPjBWFlTJLe9guAIOx13T4fzvp
 HvozW104IBvk/ke0uE+VA/wwHs1DkkPuDx4gSL9u1ykJpkeEmO6yV2LNNjbjUd0ehXYC
 L0g3amT/EAxk27zMSqJIAatmdO4955+GH3BMTcSu2TLk9BK2g4HVlBbHECorMbZ+Wmq0
 wRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cm3lia8anTWDVgfbt0f/jL3jqU8QAJ6KmLpjDhi9roM=;
 b=dmhHpfmmkA+HCWZ1J1cAdmu8bw6lfrafd/mE6o+mogQXxcKXsKQjapBnp905Y2z54V
 GvkaCmffdpWyv5x05yTqHqVrZ6Vb1FbMrsOc/zjKcQTaES2yi6JGSZCZSV8vDck7nLrz
 2UT2dI8Ah/NoyvYmNP6Uv+TKbGBzt162B38aghb2HX3kot36pXsBPTg2o8BTtV/X7xqn
 CpKMPJH93bEk6mSgRLyCA6/9LYMbOM6pikAZJJKekkesRbd2oc8S/p4j8CevKFDQwqQ6
 kmXzH1FFEHSyWwuJlbj2jNIi873q+ZxjBxAh3F+V0vRquhzTEn3qmxH+t0ulJj6s6bXW
 NeVw==
X-Gm-Message-State: AOAM531pAuRF+3zMQrfPfJuJRL06YI/VLsROKKx1D5ytoJKdog40CW9x
 tX+wiLKKIU/rpHiUYl59NrW+V0fW7Hg=
X-Google-Smtp-Source: ABdhPJyPOYMG9A4pZdiPHXNs+V5LGLIvRN6KJxeA2KjT04Qz0+I70CgERl1rP1fKevmz04Pl0gIY/g==
X-Received: by 2002:a1c:c6:: with SMTP id 189mr1780501wma.36.1605887162751;
 Fri, 20 Nov 2020 07:46:02 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id l14sm869410wmi.33.2020.11.20.07.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:46:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 3/6] MAINTAINERS: Cover system/arm/nuvoton.rst with
 Nuvoton NPCM7xx
Date: Fri, 20 Nov 2020 16:45:42 +0100
Message-Id: <20201120154545.2504625-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120154545.2504625-1-f4bug@amsat.org>
References: <20201120154545.2504625-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Havard Skinnemoen <hskinnemoen@google.com>
Cc: Tyrone Ting <kfting@nuvoton.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc883260d03..2623cf85f66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -763,6 +763,7 @@ F: include/hw/*/npcm7xx*
 F: tests/qtest/npcm7xx*
 F: pc-bios/npcm7xx_bootrom.bin
 F: roms/vbootrom
+F: docs/system/arm/nuvoton.rst
 
 nSeries
 M: Andrzej Zaborowski <balrogg@gmail.com>
-- 
2.26.2


