Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B038F33D390
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:13:10 +0100 (CET)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8ZR-0001mW-Pd
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RX-00038Q-Bo
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:05:00 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:42647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RT-0003vk-SW
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:59 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so1319170pjv.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CubR3Co6U6Ex+8IytfhrvWse7tMl3MTMhUWaYan/XpQ=;
 b=DxF0tGesjfExnMWgFZ3vmGs6XNKf5AOM4o7lA0zTu2aqhvvbSpwi5dHi9aLvDFgwrH
 Ki3zOpVgLgc5cV+J0wprS2/81jhR/WzSJxKPD+iCoTRAGzM0AQPCX/l/s0mJHWM7Z/82
 1+94IffRF1W8+1MLQkO/vuQbqPt+LeE8CJoZt24kAv1Av89QWwddd3dsEa9ou0D5yeWI
 a5F/tEEwHTtovnz4dugktkS4bFw1ODXen6r3TD1/HyceC0mOtI02tdLLtRymk2rXu3aM
 nJ4/DHOqYEGk4XJ5sjvp4sLdvflWAv2jIXwtLmgpez2cUMtie8DxuatXVuIAw6NZTueC
 iRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CubR3Co6U6Ex+8IytfhrvWse7tMl3MTMhUWaYan/XpQ=;
 b=BbbFPn6DbEg0hOFSRnaaH5+qr9I6I2Zb6mnBzoHKiQWP2IE2+4MIJdNT1Hv+1I4tkz
 a+TtGMi7cGgvBFTCtx1fPpTWQbyltYwkBDaihAWV6pc3DNHwJLNWmXXcvtxcCJe/VGVo
 OnTrOcnOCOCGrY72/dKZAoxfgZV0JKem/f8nB9//iVCvpwrAXYX47zE8SZDhwVfK0Hfh
 hSJNyh/lMBiSWstCuE6pXit8mtYr0KOAm6qahbWWPaNGbwcLQ5KUm32uDZLIr9sLVhmF
 cnpWz4jFPGSU0+DvZYZY2k6rxOZP3deKek/YkxfnUhC6m0f5udXWQfFTaQ9tghy+4Ts3
 4i/w==
X-Gm-Message-State: AOAM530pki6JpUwpeEk/D85JlqdkWDlox4wyrdJ5NG5VFKS1q0IL+yVI
 i8ZKW+4btZ6G8ssaju4l0zc=
X-Google-Smtp-Source: ABdhPJy7MqZSNaHlxKi+S3K9HkhDrtvT25f+RevA+vUo6fyd3NYHRoOP+J/AVzJsA5AwYbo5r0F7Gw==
X-Received: by 2002:a17:902:369:b029:e4:b5f1:cfb4 with SMTP id
 96-20020a1709020369b02900e4b5f1cfb4mr16174663pld.60.1615896294626; 
 Tue, 16 Mar 2021 05:04:54 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d5sm2722166pjo.12.2021.03.16.05.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 05:04:54 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4 10/12] hw/net: rtl8139: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 20:04:18 +0800
Message-Id: <20210316120420.19658-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316120420.19658-1-bmeng.cn@gmail.com>
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/net/rtl8139.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 4675ac878e..cbfe29a286 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -827,7 +827,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
 
     uint32_t packet_header = 0;
 
-    uint8_t buf1[MIN_BUF_SIZE + VLAN_HLEN];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -939,17 +938,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
         }
     }
 
-    /* if too small buffer, then expand it
-     * Include some tailroom in case a vlan tag is later removed. */
-    if (size < MIN_BUF_SIZE + VLAN_HLEN) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE + VLAN_HLEN - size);
-        buf = buf1;
-        if (size < MIN_BUF_SIZE) {
-            size = MIN_BUF_SIZE;
-        }
-    }
-
     if (rtl8139_cp_receiver_enabled(s))
     {
         if (!rtl8139_cp_rx_valid(s)) {
-- 
2.25.1


