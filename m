Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0624DEA5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 19:36:56 +0200 (CEST)
Received: from localhost ([::1]:44380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9AyF-0006ZO-3M
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 13:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9ArG-0001aj-PL; Fri, 21 Aug 2020 13:29:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9ArF-0001DO-9A; Fri, 21 Aug 2020 13:29:42 -0400
Received: by mail-wm1-x331.google.com with SMTP id k8so2576481wma.2;
 Fri, 21 Aug 2020 10:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ArJcEdqJX+vmqubLA63riTsSiUZwEENuCNY6yovraRY=;
 b=Htm26PR3I+xSImMZ+2D5dPBeSWaQvQgzPuKkTiSIZuaeUTlV0FGpc6j7sYDmOPv1GP
 B/O2qWhIKbPgoE9K3QCnpzE75gJj9R7w1Sr9Fd45b62nFDwKhJz18Vw88Jt8CJuArmGe
 zpOtCVmm6pqRZlhVD9MwaAC3nQdhrTJN9HENpfIguK8uVtOYUVo9zsZ7yNQERhhyrOlD
 TAzucIqmUK25X57KlzLIxLw1w2XH3pyl2l6qoDJr9hP6vszpiq8TyMKTNt1dT5gUevzA
 y9jSmkQ663R06kVc2Czw7HSsUVOYpG+hvilQ7VSjo6C0qeTLQoa3rqpNeJoYG4PisUeA
 ydZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ArJcEdqJX+vmqubLA63riTsSiUZwEENuCNY6yovraRY=;
 b=G0pSXNqLmQ2PAb1t62I8DeDJBLdwwWEommUiEsUE/cZRtl7JjvlxsMzHIP9I2+ZC0+
 n5HMyGVMAkyO3SY/m1wEMYj/f+UAC8qaTgq+r3yKAM6WGSj2csII7lBILns/XgkFX9B4
 X57ya9spSNmDFpGyjoQ+DCXoqhv8iK98+K+0DpdQFoxX4fq00w0IHC+BKpuKbqdPO/YR
 +yeJNcJPI+WASSYEZomv2thTWBDPE6nkLjNyt+qWs999RL1oILttT9Q3b09XtLNqFaG9
 Uf0XTdf1/7/tpzQpPPMnPZ+ybhdrBQccJn/zdPpd33BSzFNz8redxfnVp8nCvFmjwgtX
 TXjA==
X-Gm-Message-State: AOAM532E6LlTH32vhmSM3LpsyBPTAj/vZ9VSPXtK+XfJO5CwBpnIGtmU
 ee2LqhajcQh2DaVZfKSpIgQlorz4euM=
X-Google-Smtp-Source: ABdhPJyljEwfRG8mMFpdG2S9PmkHKqJ6NS2f3dmboL4emFFyg7z2Fj469HX9DY6Eh/+bJ18+xDZEvQ==
X-Received: by 2002:a1c:1d92:: with SMTP id d140mr3993892wmd.157.1598030978727; 
 Fri, 21 Aug 2020 10:29:38 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id 32sm5315471wrn.86.2020.08.21.10.29.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 10:29:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/23] hw/sd/sdcard: Make sd_data_ready() static
Date: Fri, 21 Aug 2020 19:29:06 +0200
Message-Id: <20200821172916.1260954-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200821172916.1260954-1-f4bug@amsat.org>
References: <20200821172916.1260954-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sd_data_ready() belongs to the legacy API. As its last user has
been converted to the SDBus API, make it static.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Message-Id: <20180216022933.10945-7-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/sd/sd.h | 1 -
 hw/sd/sd.c         | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index a84b8e274a3..ace350e0e83 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -143,7 +143,6 @@ int sd_do_command(SDState *sd, SDRequest *req,
 void sd_write_data(SDState *sd, uint8_t value);
 uint8_t sd_read_data(SDState *sd);
 void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert);
-bool sd_data_ready(SDState *sd);
 /* sd_enable should not be used -- it is only used on the nseries boards,
  * where it is part of a broken implementation of the MMC card slot switch
  * (there should be two card slots which are multiplexed to a single MMC
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index fad9cf1ee7a..a5ae5dccbe5 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2082,7 +2082,7 @@ uint8_t sd_read_data(SDState *sd)
     return ret;
 }
 
-bool sd_data_ready(SDState *sd)
+static bool sd_data_ready(SDState *sd)
 {
     return sd->state == sd_sendingdata_state;
 }
-- 
2.26.2


