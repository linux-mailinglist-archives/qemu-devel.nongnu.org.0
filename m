Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED45F4D0833
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 21:15:27 +0100 (CET)
Received: from localhost ([::1]:49466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJlO-0007UA-Tt
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 15:15:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <342UmYgYKCmARGRSQPEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--titusr.bounces.google.com>)
 id 1nRJjn-0005xl-21
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:13:47 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=52834
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <342UmYgYKCmARGRSQPEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--titusr.bounces.google.com>)
 id 1nRJjl-000703-M0
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:13:46 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 b11-20020a5b008b000000b00624ea481d55so14516550ybp.19
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 12:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=LqhkxWS36ULXOg2FChbFMJ7upCoor9LOa8Ol8hX/PP8=;
 b=aSCxrNE0UrcHG8MWSL0RBswPXOz3wF1edatR5bE9quRTJi2l8tIYGsJ7qvbaOxUkOw
 mUPExB02xVPA+JtTbNNKRRaq3Cw71HapghsPWXCTlplCMS2YjyBavhq4+ls7+OBXxMVy
 zZ8sXZmok0vwHTchPNYJuPKVHZtg345vMU8MNxEl16/r/QriPsRHrhmm7fsZ1l5L0Bls
 XU8q+/KCUe2432YFOjVUwZ95FR7HlEDhv/uo4JbDTNWC3n6o2dM93M73rsPKNPcbvkMD
 3kc687wG1Hv734T2MdzoqlosDLX4DYumfjwODPXoJrfSKxm1NX78Pm6GuOcDtL7hUv/7
 PkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=LqhkxWS36ULXOg2FChbFMJ7upCoor9LOa8Ol8hX/PP8=;
 b=GB6rTutIQYwFLqaJt8E8iMfzIR4fG8j6xNKxWRbBiRKgZC5WpnGypHYghZMo9hHcbn
 8EY5wp3cS1gK+3wOhZ8v6qSG/gNVs2v9BYGBYk04JqizgqHJi8wB+lu1JubDTKfTfwtB
 q9SQ8/VH/0GS4vG2/nQR9sMUYS7PIk44yn8V3yzq/0CpcKeupaRLv4Zol+kjfuxydQ4d
 JM7vLHRh04toi7KDqB94g4FL1Wpzv4as6MgePbgtuydzWa/aZlwmShuc2luEgFm0q91g
 v5I1dPhUlcStK3ZoXY8HUvXrmjrxy5ar8K/2LBewQlWDdq5Vt3jwTNff9jAR8F/Nwpxq
 bOeg==
X-Gm-Message-State: AOAM530iv9q1M48PSxckvtxmR6G9gM6aeR8dt2aMuwVMwGoZolhq+9bc
 pvHEeq6AJOH5EQG/9vhqlPu1+zBQrzs=
X-Google-Smtp-Source: ABdhPJxcz3WgD0mHljSaxd93GDCzZTsXO7WT/alaee7sVCXGEdaFe5igYOz8PoCtoW3SGDD51FP0bAXugUY=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3c4a:fc8b:1418:53ce])
 (user=titusr job=sendgmr) by 2002:a25:2510:0:b0:629:5421:c1d6 with SMTP id
 l16-20020a252510000000b006295421c1d6mr3822543ybl.619.1646683619942; Mon, 07
 Mar 2022 12:06:59 -0800 (PST)
Date: Mon,  7 Mar 2022 12:06:02 -0800
In-Reply-To: <20220307200605.4001451-1-titusr@google.com>
Message-Id: <20220307200605.4001451-7-titusr@google.com>
Mime-Version: 1.0
References: <20220307200605.4001451-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v4 6/9] hw/i2c: Added linear mode translation for pmbus devices
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Shengtan Mao <stmao@google.com>,
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=342UmYgYKCmARGRSQPEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/i2c/pmbus_device.c         | 18 ++++++++++++++++++
 include/hw/i2c/pmbus_device.h | 20 +++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 8cb9db0f80..62885fa6a1 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -28,6 +28,24 @@ uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uin=
t16_t value)
     return x;
 }
=20
+uint16_t pmbus_data2linear_mode(uint16_t value, int exp)
+{
+    /* L =3D D * 2^(-e) */
+    if (exp < 0) {
+        return value << (-exp);
+    }
+    return value >> exp;
+}
+
+uint16_t pmbus_linear_mode2data(uint16_t value, int exp)
+{
+    /* D =3D L * 2^e */
+    if (exp < 0) {
+        return value >> (-exp);
+    }
+    return value << exp;
+}
+
 void pmbus_send(PMBusDevice *pmdev, const uint8_t *data, uint16_t len)
 {
     if (pmdev->out_buf_len + len > SMBUS_DATA_MAX_LEN) {
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index bab4526734..0f4d6b3fad 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -448,7 +448,7 @@ typedef struct PMBusCoefficients {
  *
  * Y =3D (m * x - b) * 10^R
  *
- * @return uint32_t
+ * @return uint16_t
  */
 uint16_t pmbus_data2direct_mode(PMBusCoefficients c, uint32_t value);
=20
@@ -461,6 +461,24 @@ uint16_t pmbus_data2direct_mode(PMBusCoefficients c, u=
int32_t value);
  */
 uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uint16_t value);
=20
+/**
+ * Convert sensor values to linear mode format
+ *
+ * L =3D D * 2^(-e)
+ *
+ * @return uint16
+ */
+uint16_t pmbus_data2linear_mode(uint16_t value, int exp);
+
+/**
+ * Convert linear mode formatted data into sensor reading
+ *
+ * D =3D L * 2^e
+ *
+ * @return uint16
+ */
+uint16_t pmbus_linear_mode2data(uint16_t value, int exp);
+
 /**
  * @brief Send a block of data over PMBus
  * Assumes that the bytes in the block are already ordered correctly,
--=20
2.35.1.616.g0bdcbb4464-goog


