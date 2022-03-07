Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0EA4CFBF6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:53:29 +0100 (CET)
Received: from localhost ([::1]:44170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAzY-00085m-I2
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:53:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMo-0004x0-FX
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:26 -0500
Received: from [2a00:1450:4864:20::332] (port=40742
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMm-0004Ps-AZ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:13:25 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 bi14-20020a05600c3d8e00b00386f2897400so5246174wmb.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sjqdeQnFVDOxsZhUeJhTFcRMhF0JVoSy8TW73eBt5/Q=;
 b=YZcaqgPJBrnCERZ4SecTFi6pesRg/42zT/tzzF/y+NvROErqPsUEX8upDOuv/Cne5A
 83sF+q1MI91OGXSnNMNDigyN6da1XMoeSxyf+M6WWA7WSgbCYVX4GqgAyOM+7NJlvDlL
 17Kk7I1b2A+eF5Hm8VUwVk1W4TGQ00Y0CqBUE5X0JXCbQqYi4No4PYh1bT4LEMRyNzMF
 zxQqPFGI/6guPHmMa5dvntK7Um0WRFgGflzVy3rfnrYcZmg5bi4woVPukRFKgTWMwM2t
 /19XfFEh7+vG0R0iiyHmLzFFsXPeyoKNcQJO9tcK2TipzhZAXarnhDFE1GLUWjV1W5G8
 ntnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sjqdeQnFVDOxsZhUeJhTFcRMhF0JVoSy8TW73eBt5/Q=;
 b=Wy7d8X9r+wYwjsaJiAQs87XYtq04LZkre2h+U+DDAgUHFyjCQeKFaPFx4CLuKKR9+J
 ati04fqQNrCmrW5pEPXl1ycIrZyrlZucjzymiXmpQw05puRKkjW9LSRXAGk+bhBwSPva
 GnkOGDW+6s2GoUkHfQ3hoZNfJrWDrALT6cPhDzap+HFDBTbiCNgudpoKVNNWOmMh3QvQ
 3oK8E+rSPIzMdATgFmkJQK7tvQxsbIS1Ux6/H87ly4u0ItKGgHmY73vDS0Ye7s+O2zj5
 lSkLx4iQR7zgmjkxpPga0ogWSIaFXmeRi6BoRewQQyA97eRBquZD4gFiyNkkNK7zMie4
 dn2w==
X-Gm-Message-State: AOAM532Ma8ZzZl8kzhSu5aco50i1yarzBuIahb8q/7uLji4p869UhSJ4
 tSMbmlQiW1qpe3wLH1oCpsxzXC9sEMQ=
X-Google-Smtp-Source: ABdhPJz9AXjb5jkTQZ0RXTEZ272tpMtXdoRwadarVV7C0fwt2I/8rhnK/uBTyo6LukyH3rn6jLbpWg==
X-Received: by 2002:a05:600c:2314:b0:381:8931:2387 with SMTP id
 20-20020a05600c231400b0038189312387mr18028074wmo.76.1646648002675; 
 Mon, 07 Mar 2022 02:13:22 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003899263bab1sm6609674wmi.20.2022.03.07.02.13.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:13:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/16] isa: Inline and remove one-line isa_init_irq()
Date: Mon,  7 Mar 2022 11:12:06 +0100
Message-Id: <20220307101207.90369-16-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

isa_init_irq() has become a trivial one-line wrapper for isa_get_irq().
It can therefore be removed.

isa_ipmi_kcs)

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com> (tpm_tis_isa)
Acked-by: Corey Minyard <cminyard@mvista.com> (isa_ipmi_bt,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220301220037.76555-8-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index fc3c8b3fd1..8607e0ac36 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -216,7 +216,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, s->rtc.isairq);
+    s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
 }
 
 static void piix4_init(Object *obj)
-- 
2.34.1


