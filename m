Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E2048B44A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:45:19 +0100 (CET)
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7LCw-0008PH-9n
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:45:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Hr3dYQcKCiUWFOUVSFHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--venture.bounces.google.com>)
 id 1n7Kxw-0004l0-Ok
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:29:49 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=33675
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Hr3dYQcKCiUWFOUVSFHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--venture.bounces.google.com>)
 id 1n7Kxv-0001eD-EU
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:29:48 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 u185-20020a2560c2000000b0060fd98540f7so35491142ybb.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=vmwZoqt3VOA1A7dG7w3w8KRUrA973J4DcOKjuhMXOP8=;
 b=phQdtBs9xo9va6TKFQoBbirtPWvONoNfjxDtxTBqLEnBcQlmpS6JSA0Iddx99RbXDp
 sbzR9QUy5MH4HObc8vjs00mG6hVBj71AgqNLTZSV1sNzefP5zwxx7ygoMCKJQhvCJOCK
 aionZ4V62D5pYKijUHtIOzELI68t9Io7UBWB+dWFU0H5MXcrN+pZCFBWNIsX4BKAzrDa
 8GjQNGadHcfdqK+tFDyQqUPBKlWhkIEQpQ9z3fbn5B1qoYtk+gUhjfDlR4Xje5vNNt5T
 g4ck21vMVl7L0pCc4LxifzSVvX1eZSp+8MyriKIU3UApRG8VfrbmgGCedfl7fL21/QKq
 OKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=vmwZoqt3VOA1A7dG7w3w8KRUrA973J4DcOKjuhMXOP8=;
 b=xs530/iT1bgIfy/wn7Y3xSRIRMKGKZhpNhuB4jembn3jkAQXa/0kAtDYDgZG0MK5rP
 staTjiVBdl8ue5gv1PDQBzv9kCQYN1kDGTudU+LcHQr9V4ooZxXXtI6rcGhheQJ47GgF
 Ki7XIiGH6M1O4p7u5VD/TpPjxBF7qzq04LqsygMz4hRxRXes9oTHof+RS/oaTuj2VqB4
 UyU6nKoGV5gOIClFNsfPixIJWv8JlsyYfE70YfULnxwiTK4DR3SC2IqAMQLGZJL04+T7
 S9U31TYe8MAj7YPb6hzxKCj2pxT96Nyw8GLsxUue5gPaUTMJOKtp6uFjvAP3zZc/M77+
 XOhg==
X-Gm-Message-State: AOAM530dAYAcs8NWSojFPeKQ4u3eeF68PGpzvAWTlvWagqKzXZIf/49z
 y2YIg/WR9matBOw1HMuHsbvJc0XI4ueo
X-Google-Smtp-Source: ABdhPJx0BWc2n1ZmJuo9EalaDamtHmtCHGp95FGdB8qTNx6Jd6e6FUF0B33M6iSpeYdNaVYdG1uE7/yqjlYo
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:574:98c:4a15:a258])
 (user=venture job=sendgmr) by 2002:a25:70d5:: with SMTP id
 l204mr7718307ybc.193.1641921822061; Tue, 11 Jan 2022 09:23:42 -0800 (PST)
Date: Tue, 11 Jan 2022 09:23:38 -0800
Message-Id: <20220111172338.1525587-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH] hw/arm: kudo add lm75s behind bus 1 switch at 75
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3Hr3dYQcKCiUWFOUVSFHPPHMF.DPNRFNV-EFWFMOPOHOV.PSH@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SORTED_RECIPS=2.499,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/arm/npcm7xx_boards.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 7d0f3148be..d701e5cc55 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -332,7 +332,15 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 {
     I2CSlave *i2c_mux;
 
-    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x75);
+    i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1),
+                                      TYPE_PCA9548, 0x75);
+
+    /* tmp105 is compatible with the lm75 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x5c);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x5c);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 6), "tmp105", 0x5c);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 7), "tmp105", 0x5c);
+
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x77);
 
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
-- 
2.34.1.575.g55b058a8bb-goog


