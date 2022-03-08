Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830334D203B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:27:01 +0100 (CET)
Received: from localhost ([::1]:50582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReY0-0008BK-5d
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:27:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReLa-0000Pv-1O
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:14:10 -0500
Received: from [2607:f8b0:4864:20::632] (port=37777
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nReLY-00021H-Ef
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:14:09 -0500
Received: by mail-pl1-x632.google.com with SMTP id n2so8296034plf.4
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BqJbDF11r+EHejjDPsbfqTXHf2f9UZaSH+bhrconn3U=;
 b=ZM63irR4XD5lviu6la1pYZtZxv3RCAA0yQEqJGZhnikiC6L3wZnKwaSostGWOcIabp
 OxgN4QBuCxAikV4JbAiZYz3lP5RBsQKmg9g5AQNkBoyAh4WII0Ja/hu1nYXM/9aEg7W9
 32Ry/TzPnuacLiP7NwJem6QZX2603dP44X3TBRkys2r/r3Z44uvqGG9YARBrnBiTic9j
 Yh3hIqfP2Pytb5Nh0FQvSFhG6YtS3GNBUah+HAKsXc8nKJR3+ojNIqAv2vNtsGP1xDmq
 Y4GH0DN1THsEswwpCEXaZ0tUNoKLByEpWaT7UKObP6lLLvJSsiS+XXtwxgOAxunNt7P0
 TTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BqJbDF11r+EHejjDPsbfqTXHf2f9UZaSH+bhrconn3U=;
 b=eJKewaTyqZTWevxQFvDQtxnA4AgByALg+qd3xwaDlOiYiGKXyHsYRT6RdJbCFj2L9R
 TaqpaWmjwi4whjtckKnEoUkZgzKo4kj01gyz7wLAMuDB/+CnUMTCGM2IqXRNmULFjpxc
 rxCBc64cZhWeyXh/3CCdWs3OgQUWjiaC1AohjDhiYh0qkBVsx+yLssaCfg6Y87Ucne+5
 6BOs5Z1vhjrxHiT1HFQdkoniCuMkK36Bfywz2xa2RY23Mwj4gPOmXjiSSHkRMvqLksX8
 dTqoYcpbUi8AhkcRUC7cSc52zHXmG9E0hOcDqw3Yf+46uHGtFbttSeIZRQDzjfQOA0OC
 wMAw==
X-Gm-Message-State: AOAM531kwo+In57m5g08Wojqm30sktnfGlBC15/uOL83MTvmGuNywOjg
 JMOooPSZZjpkVxcSKCgqh+JRqZMMvfQ=
X-Google-Smtp-Source: ABdhPJx/LpVN8tzjxWO/mQ9nf1IB6zAvZh6DOln9rhDBzaECqjyYcd7cNUM6WzOsO4AVrffL+2wY2A==
X-Received: by 2002:a17:90a:5a86:b0:1bf:7860:c0f6 with SMTP id
 n6-20020a17090a5a8600b001bf7860c0f6mr6038049pji.213.1646763247026; 
 Tue, 08 Mar 2022 10:14:07 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 z7-20020a056a00240700b004e1cde37bc1sm21050734pfh.84.2022.03.08.10.14.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Mar 2022 10:14:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] hw/i2c: pmbus: update MAINTAINERS
Date: Tue,  8 Mar 2022 19:13:16 +0100
Message-Id: <20220308181320.79400-6-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
References: <20220308181320.79400-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
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
Cc: Titus Rwantare <titusr@google.com>, Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Titus Rwantare <titusr@google.com>

add self to MAINTAINERS for the PMBus subsystem and related sensors,
and set PMBus as maintained.

Signed-off-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-Id: <20220307200605.4001451-6-titusr@google.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f0cc1e448..600bf820da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3138,6 +3138,16 @@ F: include/hw/i2c/smbus_master.h
 F: include/hw/i2c/smbus_slave.h
 F: include/hw/i2c/smbus_eeprom.h
 
+PMBus
+M: Titus Rwantare <titusr@google.com>
+S: Maintained
+F: hw/i2c/pmbus_device.c
+F: hw/sensor/adm1272.c
+F: hw/sensor/max34451.c
+F: include/hw/i2c/pmbus_device.h
+F: tests/qtest/adm1272-test.c
+F: tests/qtest/max34451-test.c
+
 Firmware schema specifications
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Daniel P. Berrange <berrange@redhat.com>
-- 
2.34.1


