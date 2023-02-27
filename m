Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B716A442F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:20:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFS-0002ac-JF; Mon, 27 Feb 2023 09:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeE3-0000Km-IH
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:11:40 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeDx-000197-Pn
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:11:34 -0500
Received: by mail-wr1-x434.google.com with SMTP id bw19so6335184wrb.13
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SxuGCiDEM4B0M1G1+5/Ku1B4TwdzfOaRDWtMa7ZXM5M=;
 b=v+ngnNRkK7KZt97Puyy/+fqfZ5hLZm83yxqPNlUUDN+0ZA0XBDT7CICfJ99fWbaWOK
 rgHVu+0w8BWvQ/ebU2boa/W+AiIXh8/BcDdNPYWYUHe3ZN97ywpxYWsltKhR3HQ4EPjn
 E0EYrrwcTyeySZuvPcX7gs3QLXgFWVBF3DTeJ5iym/XwMA9lH9KPbn6hPIfevbveZ8Jv
 I+MWGA2lH2HLVin3zoZ78SpCaedtQQbtmhbbxDRlZYVJlxCF9V5bCIc1Yq7/NpAaqmJL
 3NYacHnYXYIsphADR/PjNGXM9aAeoBpfUmT9ahCE24bzriGGXV2mr2RwOTwDYpj8IPZG
 g92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SxuGCiDEM4B0M1G1+5/Ku1B4TwdzfOaRDWtMa7ZXM5M=;
 b=cOE114oCNXiBxUP2LbLNBTZ6enwm0pF61kdBH/MPbFyktm5qbrJvYF1EjkWoEqtXIu
 nnT13JgK9clvIpqC8v8t1Z+ufSw6dREdypZeU8IdIOo6yl2S4ag7F2FLBMjrXmNSzIj+
 EBBesr5sJQ9RfNsVr+c7ON9+ezKrnSnWcFK3pcYhwqvlAPXYbBwknwM5prjaZRx2oO+S
 9kBwkz6OQQvDwqntjgp7N2lNTIejGrMlMrqmL+uj33FWo0JjYi+DAIlxjshKOBAYW2vQ
 EDEqPUnf3EL9NrGGZOkGAzbXhbtvZ0xxXIJjdCUsj4WXgqSS1FmIJqoTrQESa1Ak2gOh
 /6HQ==
X-Gm-Message-State: AO0yUKX5xJd5L8p7HQIlR887Up1ptVhhMFl3MWY6I++Bg1ZyTcXh2Y5o
 YLFRORzDCzl+sBbIPM4NXqBuWRKV9ml04Owb
X-Google-Smtp-Source: AK7set+73l8X9PPDJVwy/MZ9/Y7l+PQ5KNkw2w8rxzKIZOr4TEH8EAjMq2wURR4ckWvoTNRdG9yuHw==
X-Received: by 2002:adf:f887:0:b0:2c7:f82:827a with SMTP id
 u7-20020adff887000000b002c70f82827amr11809947wrp.19.1677507081761; 
 Mon, 27 Feb 2023 06:11:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x6-20020adff646000000b002c56046a3b5sm7059757wrp.53.2023.02.27.06.11.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:11:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 110/126] hw/ide: Rename ide_exec_cmd() -> ide_bus_exec_cmd()
Date: Mon, 27 Feb 2023 15:01:57 +0100
Message-Id: <20230227140213.35084-101-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ide_exec_cmd() operates on a IDEBus; rename it as
ide_bus_exec_cmd() to emphasize its first argument
is a IDEBus.

Mechanical change using:

  $ sed -i -e 's/ide_exec_cmd/ide_bus_exec_cmd/g' \
        $(git grep -wl ide_exec_cmd)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-14-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/ahci.c             | 2 +-
 hw/ide/core.c             | 6 +++---
 hw/ide/trace-events       | 2 +-
 include/hw/ide/internal.h | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 316dbb97d3..e6498964af 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1269,7 +1269,7 @@ static void handle_reg_h2d_fis(AHCIState *s, int port,
     cmd->status = 0;
 
     /* We're ready to process the command in FIS byte 2. */
-    ide_exec_cmd(&s->dev[port].port, cmd_fis[2]);
+    ide_bus_exec_cmd(&s->dev[port].port, cmd_fis[2]);
 }
 
 static int handle_cmd(AHCIState *s, int port, uint8_t slot)
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 5897411b95..1be0731d1a 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1327,7 +1327,7 @@ void ide_ioport_write(void *opaque, uint32_t addr, uint32_t val)
     case ATA_IOPORT_WR_COMMAND:
         ide_clear_hob(bus);
         qemu_irq_lower(bus->irq);
-        ide_exec_cmd(bus, val);
+        ide_bus_exec_cmd(bus, val);
         break;
     }
 }
@@ -2123,13 +2123,13 @@ static bool ide_cmd_permitted(IDEState *s, uint32_t cmd)
         && (ide_cmd_table[cmd].flags & (1u << s->drive_kind));
 }
 
-void ide_exec_cmd(IDEBus *bus, uint32_t val)
+void ide_bus_exec_cmd(IDEBus *bus, uint32_t val)
 {
     IDEState *s;
     bool complete;
 
     s = idebus_active_if(bus);
-    trace_ide_exec_cmd(bus, s, val);
+    trace_ide_bus_exec_cmd(bus, s, val);
 
     /* ignore commands to non existent slave */
     if (s != bus->ifs && !s->blk) {
diff --git a/hw/ide/trace-events b/hw/ide/trace-events
index 5ef344ae73..57042cafdd 100644
--- a/hw/ide/trace-events
+++ b/hw/ide/trace-events
@@ -12,7 +12,7 @@ ide_data_writew(uint32_t addr, uint32_t val, void *bus, void *s)
 ide_data_readl(uint32_t addr, uint32_t val, void *bus, void *s)                    "IDE PIO rd @ 0x%"PRIx32" (Data: Long); val 0x%08"PRIx32"; bus %p; IDEState %p"
 ide_data_writel(uint32_t addr, uint32_t val, void *bus, void *s)                   "IDE PIO wr @ 0x%"PRIx32" (Data: Long); val 0x%08"PRIx32"; bus %p; IDEState %p"
 # misc
-ide_exec_cmd(void *bus, void *state, uint32_t cmd) "IDE exec cmd: bus %p; state %p; cmd 0x%02x"
+ide_bus_exec_cmd(void *bus, void *state, uint32_t cmd) "IDE exec cmd: bus %p; state %p; cmd 0x%02x"
 ide_cancel_dma_sync_buffered(void *fn, void *req) "invoking cb %p of buffered request %p with -ECANCELED"
 ide_cancel_dma_sync_remaining(void) "draining all remaining requests"
 ide_sector_read(int64_t sector_num, int nsectors) "sector=%"PRId64" nsectors=%d"
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index cc95cd47a0..11a4931ef9 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -622,7 +622,7 @@ int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
 void ide_bus_set_irq(IDEBus *bus);
 void ide_bus_register_restart_cb(IDEBus *bus);
 
-void ide_exec_cmd(IDEBus *bus, uint32_t val);
+void ide_bus_exec_cmd(IDEBus *bus, uint32_t val);
 
 void ide_transfer_start(IDEState *s, uint8_t *buf, int size,
                         EndTransferFunc *end_transfer_func);
-- 
2.38.1


