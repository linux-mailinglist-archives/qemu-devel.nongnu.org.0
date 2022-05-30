Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D55387E8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 21:56:37 +0200 (CEST)
Received: from localhost ([::1]:60734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlVE-0007Tg-Qr
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 15:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlH5-0003Wt-36; Mon, 30 May 2022 15:41:59 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:37449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlH2-0000RP-BJ; Mon, 30 May 2022 15:41:58 -0400
Received: by mail-pl1-x629.google.com with SMTP id t2so3442186pld.4;
 Mon, 30 May 2022 12:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pAi4+p0wY1bxzBZ24y5yNQYY9Xt3OVGw4T6z/yPKKqA=;
 b=JdHOckjFr+5bOy6bBcsfc00oIP5BCbQrmKojFaAaKo42wJmKmL28LCtegJfH7MOznD
 SSxEWGl118FLB11GnqRUu9ZxQ++K/x4MWC7TMcAXVfH5nWHjyxA8cO2H7Q2VFcGpQP0f
 f2B+RLJBP7Pi3NWs3+DOVk9RBx67uyPqMxlI7LchpMzFnuGZeHFgmuFeLMpbDLZdF50A
 GzvlM2Ezslwhby34Q0I1NVbnm8O8HX/BUP/lZEJ+9gJLxfju6N8LZeI8c8ckLUDu3U2E
 fUD3SDrdWUyWyMzMWcWLPx9woLucMgUi67HDA9TcvDocO7L5RPADvlRgbqbh+hcbT8fn
 cHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAi4+p0wY1bxzBZ24y5yNQYY9Xt3OVGw4T6z/yPKKqA=;
 b=gh+d7amlzPNNd5RcAqFIaBNSpxmM1aUDcAE8FJLLcZFfpi5gDagJlJlZnJY1VxkLXR
 kIqeiAz07HDtDY7AKGJrD5gKx5Dh9A7CqUbXmwGQX8grCDfkUgP3EOVNNF7wzExtA2dX
 mkYSIN8FC2ZqhLyR0KaPH5FIrGUfijzPHp/SN8MKPfxV75M+yO/wRD88xZ55z6CwCqnW
 pYQH2AbPbJeEjOcoHf+awvVBxk7AWxbHPRwWMkYXFnT3woqFA3dZOfyeENB+cDzK7OOi
 Z6yTtw9RoCgGQokW4Pm53nvAMFKGcGbQAd/4eeRrnjLfDNHyDpFOGK2WqW8b1LZ+LvbU
 Mwlg==
X-Gm-Message-State: AOAM5336TgfyJdTVDvZMtAvPo1iBDDI8S1yylQAIhModNwtjthIt0LjZ
 tI/vQpHOhICfRJjEBHcpgj+up2dnnNE=
X-Google-Smtp-Source: ABdhPJxzs0uy6ZsYQddbalLZzXfoSfqq5l6e83ir29YZgH/QGlkEIp93lpCxLV/tPS2NXegKqNdfiA==
X-Received: by 2002:a17:903:249:b0:163:6dc0:b8b3 with SMTP id
 j9-20020a170903024900b001636dc0b8b3mr24582273plh.24.1653939709645; 
 Mon, 30 May 2022 12:41:49 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170902968d00b001621c48d6c2sm9474077plp.221.2022.05.30.12.41.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:41:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 24/25] hw/sd: Subtract bootarea size from blk
Date: Mon, 30 May 2022 21:38:15 +0200
Message-Id: <20220530193816.45841-25-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Joel Stanley <joel@jms.id.au>

The userdata size is derived from the file the user passes on the
command line, but we must take into account the boot areas.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 05e77f128f..26ddf3e92d 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -668,6 +668,7 @@ static unsigned sd_boot_capacity_bytes(SDState *sd)
 static void sd_reset(DeviceState *dev)
 {
     SDState *sd = SD_CARD(dev);
+    SDCardClass *sc = SD_CARD_GET_CLASS(sd);
     uint64_t size;
     uint64_t sect;
 
@@ -679,6 +680,10 @@ static void sd_reset(DeviceState *dev)
     }
     size = sect << 9;
 
+    if (sc->bootpart_offset) {
+        size -= sd_boot_capacity_bytes(sd) * 2;
+    }
+
     sect = sd_addr_to_wpnum(size) + 1;
 
     sd->state = sd_idle_state;
-- 
2.36.1


