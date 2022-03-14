Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CB34D875E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:50:29 +0100 (CET)
Received: from localhost ([::1]:43248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTm1k-0003DX-N2
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:50:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTl6O-0000t2-66
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:51:13 -0400
Received: from [2607:f8b0:4864:20::52d] (port=39851
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTl6M-0004Ca-6r
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:51:11 -0400
Received: by mail-pg1-x52d.google.com with SMTP id q19so13887677pgm.6
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 06:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=huXSmdPLoqd95yuOAwGhtZu+mRG2tOF4xQxmLaDhgCo=;
 b=JR/ncsmu509HyiAwHuYKI4bSg6vYPs00nfCzKkdLmcDbgEhpvoLFZC0Z69+XYEb2Ia
 K+jDjm3jiFqzpwEP6qmxXaduNezijmB76TLPQWnMo4YrmQB13es/eZoKoWNph3t15bae
 ODSqZC7ojG+uNbaYdMZ81QdNM1ZQLY4y3QmHZcB+AydbC01jL7uTI8JSPy6E73GStYWJ
 iN00U1K4sxV29lSZ3SmM0LfbA5eVBXa4yzqo6T8eg0daqhYNXj0wzgLgAkwbh4M4w8aX
 YwlrwZ2TRC82ghzSvl86rgM5PHBzjKF7/NW/h3NzU6crw1QVPizKVl79E2ERa6t2BZS8
 MF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=huXSmdPLoqd95yuOAwGhtZu+mRG2tOF4xQxmLaDhgCo=;
 b=789sC8g2WWqzd5PseceyIBXlYsWwM250QtZQ86TFHFtfXzGEMWbQ9miHbclGZyjgWa
 ZmGs2b3MDyu5bbTToxIZ1txPpPXvM7RHrCnBVIGC9VsKhjZ0qUHl/rCu38msbXPOrrwB
 jSsbXE75PpFrkS+Mbg4+tKDutOtB4EFQXOxNRVvCFOq9V6J10gap6tbl4BvpQ8OKYg9q
 BFCjNjJUehXNFoJpnYUcJv51q177OC/Ijvy5yiCPfwnLhYNE1sGTN2yTJEKiC9y0SD71
 9T5g3GE9a85ZepgiiV5Jha1/4Yv/LZXUaGaeFLdX54+PHsEtgs8stDgHIyJkGUMn4rci
 Q8LA==
X-Gm-Message-State: AOAM531wC+FOR4/p6QVkMB1/JHQ0MRkmGcpMFCxpZB8E2uDaDB7Z6lwP
 FFrUF1zb5Nk5GZIgCk6DIN7nRMdv/FM=
X-Google-Smtp-Source: ABdhPJwaBDGzeJTCgA3UHTST/BmN///5WpFtXiV68ckgU49mOvS/UKWL0v3tDbvQ1w7nMylxIbKYXg==
X-Received: by 2002:a63:1223:0:b0:381:32e6:e56b with SMTP id
 h35-20020a631223000000b0038132e6e56bmr6392917pgl.375.1647265867685; 
 Mon, 14 Mar 2022 06:51:07 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm20875140pfj.43.2022.03.14.06.51.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Mar 2022 06:51:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] hw/nvram: at24 return 0xff if 1 byte address
Date: Mon, 14 Mar 2022 14:50:54 +0100
Message-Id: <20220314135054.25261-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314135054.25261-1-philippe.mathieu.daude@gmail.com>
References: <20220314135054.25261-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Patrick Venture <venture@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Patrick Venture <venture@google.com>

The at24 eeproms are 2 byte devices that return 0xff when they are read
from with a partial (1-byte) address written.  This distinction was
found comparing model behavior to real hardware testing.

Tested: `i2ctransfer -f -y 45 w1@85 0 r1` returns 0xff instead of next
byte

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211220212137.1244511-1-venture@google.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/nvram/eeprom_at24c.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index da435500ba..01a3093600 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -58,9 +58,10 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
 
     switch (event) {
     case I2C_START_SEND:
-    case I2C_START_RECV:
     case I2C_FINISH:
         ee->haveaddr = 0;
+        /* fallthrough */
+    case I2C_START_RECV:
         DPRINTK("clear\n");
         if (ee->blk && ee->changed) {
             int len = blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
@@ -84,6 +85,10 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
     EEPROMState *ee = AT24C_EE(s);
     uint8_t ret;
 
+    if (ee->haveaddr == 1) {
+        return 0xff;
+    }
+
     ret = ee->mem[ee->cur];
 
     ee->cur = (ee->cur + 1u) % ee->rsize;
-- 
2.34.1


