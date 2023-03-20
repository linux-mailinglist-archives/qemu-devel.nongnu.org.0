Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1736C2450
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 23:15:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peNlw-0005Cl-OB; Mon, 20 Mar 2023 18:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wNoYZAcKCgElpnmpejhpphmf.dpnrfnv-efwfmopohov.psh@flex--komlodi.bounces.google.com>)
 id 1peNlu-0005Cc-IT
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 18:14:30 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wNoYZAcKCgElpnmpejhpphmf.dpnrfnv-efwfmopohov.psh@flex--komlodi.bounces.google.com>)
 id 1peNlr-0004QV-MP
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 18:14:28 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 m9-20020a056a00164900b0062300619e03so6827645pfc.18
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 15:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679350464;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=G9h1pghCJ9XAsr4xSNN5xqA2lbhruSbq3L9/vCF6TkY=;
 b=i2Q/9YsySArH7DEDxXNoKGIh4lgM85ta36WqujH8bEQ0QnGV75W31j5V+7ft2Bw42W
 MPqJrzfAXIqRblkQC9tvglD9yRPGBc82iIGyTeBbp5l8EW6tDJpXJr1DE79snIiQAwsq
 1RqXS6Hctgi0owHQXZ6WJmqGkSENAkoVX77E74cToYVPLqAQHPxhGUsFS4IgA9Lcs1ah
 /boUbGRR/Yf/1UH9SvySyRrE9UHFRE9RfkN9dllFuPT/4Uoagn3LsLUjBnP2W4PqkN+Y
 x1bpt4aDLwYu6Pb+NqgcjROEmOBNnlC/g2U5Httx9GYcI6UsIkhT4RYoFewneQGyIjuq
 /NAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679350464;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G9h1pghCJ9XAsr4xSNN5xqA2lbhruSbq3L9/vCF6TkY=;
 b=52S58Fmhy6zmTKCccxPa2drEBT5BhaEmACIc2r317KfmGHtWZitodm/jlNHMOI+ouQ
 Gp5jDhUkNk/jQJp6U7R72UoXs1Wc8NMdeyOlfD7Gr0S5kBbriHa19o4nl7S/5Vyniqol
 ghwxKMANffi9B4hl1k2kVeIo9J0CC6apisUO9vRcIzHgfsOwniIYhGHjrLwantoRlXFT
 tUF/6Y5hYAToLFke4CnSbM8VdT6KysHwlMMubaWJnj80HcTeastIQa71usDmFElIZIWq
 uNzVMbp/1AYEOslOn7i0PyxI/gtNj9t7m/St142PTLrSIMZKkpa6Mwpzzr+IXyD9MuC0
 7Hfw==
X-Gm-Message-State: AO0yUKW+e+PamLRGXe7A04o9gxiRbT+C7UoWHI0NEACvHx85HZfnWcaT
 +1D3V3Y3u7TV2BZawzVrsjdf+8TDCaeq
X-Google-Smtp-Source: AK7set98/a0qG3aDJ+zdVPmFQUGgYRh1aaTwWAu/8JND//CNJ7biYPMKxCalHqkVvIQ7NvJhw290CuFtRbh9
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a05:6a00:2303:b0:5a8:a475:918f with SMTP
 id h3-20020a056a00230300b005a8a475918fmr234171pfh.4.1679350464387; Mon, 20
 Mar 2023 15:14:24 -0700 (PDT)
Date: Mon, 20 Mar 2023 22:14:18 +0000
In-Reply-To: <20230320221419.2225561-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230320221419.2225561-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <20230320221419.2225561-2-komlodi@google.com>
Subject: [PATCH 1/2] hw/i2c: smbus_slave: Reset state on reset
From: Joe Komlodi <komlodi@google.com>
To: cminyard@mvista.com
Cc: qemu-devel@nongnu.org, komlodi@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3wNoYZAcKCgElpnmpejhpphmf.dpnrfnv-efwfmopohov.psh@flex--komlodi.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

If a reset comes while the SMBus device is not in its idle state, it's
possible for it to get confused on valid transactions post-reset.

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 hw/i2c/smbus_slave.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/i2c/smbus_slave.c b/hw/i2c/smbus_slave.c
index feb3ec6333..7b9d8780ae 100644
--- a/hw/i2c/smbus_slave.c
+++ b/hw/i2c/smbus_slave.c
@@ -197,10 +197,19 @@ static int smbus_i2c_send(I2CSlave *s, uint8_t data)
     return 0;
 }
 
+static void smbus_device_enter_reset(Object *obj, ResetType type)
+{
+    SMBusDevice *dev = SMBUS_DEVICE(obj);
+    dev->mode = SMBUS_IDLE;
+    dev->data_len = 0;
+}
+
 static void smbus_device_class_init(ObjectClass *klass, void *data)
 {
     I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
+    rc->phases.enter = smbus_device_enter_reset;
     sc->event = smbus_i2c_event;
     sc->recv = smbus_i2c_recv;
     sc->send = smbus_i2c_send;
-- 
2.40.0.rc2.332.ga46443480c-goog


