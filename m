Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C5147E332
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:27:07 +0100 (CET)
Received: from localhost ([::1]:36002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0NBa-0004O1-Mz
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:27:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MlL-0004a4-06
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:59:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MlJ-0001E8-8t
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AccLfnY/B/12ZHLoZ2OU6IixKvcUVx9674CliXPrEJo=;
 b=Yt0Q84EV+TTM+tQVeUw2MrHn1uzPEocDodtyvb3D7/3ESa19XGN4WSPeLcKwLLurDhKEKe
 ebBJU4EDAP2vR+X/bA39GExlMsrHIPOESLDf2N0ztqdEBl2uoIGglzwW5Zu0NVmSPpuB/B
 7rWorTQoUaNM99aS4K3Nm2Ano2fhdtI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-0a5GKM3pPQiS0Jor_R9Cbw-1; Thu, 23 Dec 2021 06:59:54 -0500
X-MC-Unique: 0a5GKM3pPQiS0Jor_R9Cbw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m19-20020a05600c4f5300b00345cb6e8dd4so1669783wmq.3
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AccLfnY/B/12ZHLoZ2OU6IixKvcUVx9674CliXPrEJo=;
 b=hijEEsQMf/eWr5QbDEQ/XpWifR2cayaWU9rEBILWiQtAPxfQUZCyo2JMezT9l2qKD+
 hAv46eSOTCambMsL5c4sBIBkw7pUAnBuW0m3XWjitzidSKjYWmInovJuwryG0vaqYjPv
 XJ+dzIkYZZLyIWxvWbjsBFz3oZt0UUUU1vnyp2/vkb3diQLKsewkas9HE+/UubiRArsT
 MTy7zm8/sADVbWgzTPevu0GHCEQS5V2BksdaLiFOGizS0G8VAWKtajy1fnohbBwgP0uT
 PepWoDey0vYi+1WnN6K9sBuHfTltLpv35RyMDRqe+uH/tvVUGp/y7FSLOuOoSiv5SFwL
 RbtA==
X-Gm-Message-State: AOAM531Gq53vG5Np4TewVmnlTdT50fAeiDEx1QLngw18KTvtE7SnajXW
 B8ziwgwsYFS6PkXdZ5hiyyIfWmVB+wADV8uN5UaJJ6zkbIDljQqTNK0IJZX1xcoWbd7ka1FlE4r
 /2nXBTKAHRc/jJ6kezmzFXHKCnracDpQe5tyvMvohyCBJnu+G5A7bLNYhE70vHSEq
X-Received: by 2002:a05:600c:1f18:: with SMTP id
 bd24mr1593871wmb.174.1640260793203; 
 Thu, 23 Dec 2021 03:59:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/oJ4qDHZs1qmUK48d0flpcHtTo7uhZOdN58vL8y6w/JcRg0Kb4wZpKSYPbM+SK/9h+ecGLw==
X-Received: by 2002:a05:600c:1f18:: with SMTP id
 bd24mr1593821wmb.174.1640260793042; 
 Thu, 23 Dec 2021 03:59:53 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id i4sm7759112wmd.34.2021.12.23.03.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:59:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/23] dma: Let st*_dma() propagate MemTxResult
Date: Thu, 23 Dec 2021 12:55:48 +0100
Message-Id: <20211223115554.3155328-18-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dma_memory_write() returns a MemTxResult type. Do not discard
it, return it to the caller.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index f3cf60d222d..725e8e90f88 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -248,13 +248,13 @@ static inline void dma_memory_unmap(AddressSpace *as,
         dma_memory_read(as, addr, &val, (_bits) / 8, attrs); \
         return _end##_bits##_to_cpu(val);                               \
     }                                                                   \
-    static inline void st##_sname##_##_end##_dma(AddressSpace *as,      \
-                                                 dma_addr_t addr,       \
-                                                 uint##_bits##_t val,   \
-                                                 MemTxAttrs attrs)      \
-    {                                                                   \
-        val = cpu_to_##_end##_bits(val);                                \
-        dma_memory_write(as, addr, &val, (_bits) / 8, attrs);           \
+    static inline MemTxResult st##_sname##_##_end##_dma(AddressSpace *as, \
+                                                        dma_addr_t addr, \
+                                                        uint##_bits##_t val, \
+                                                        MemTxAttrs attrs) \
+    { \
+        val = cpu_to_##_end##_bits(val); \
+        return dma_memory_write(as, addr, &val, (_bits) / 8, attrs); \
     }
 
 static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs attrs)
@@ -265,10 +265,10 @@ static inline uint8_t ldub_dma(AddressSpace *as, dma_addr_t addr, MemTxAttrs att
     return val;
 }
 
-static inline void stb_dma(AddressSpace *as, dma_addr_t addr,
-                           uint8_t val, MemTxAttrs attrs)
+static inline MemTxResult stb_dma(AddressSpace *as, dma_addr_t addr,
+                                  uint8_t val, MemTxAttrs attrs)
 {
-    dma_memory_write(as, addr, &val, 1, attrs);
+    return dma_memory_write(as, addr, &val, 1, attrs);
 }
 
 DEFINE_LDST_DMA(uw, w, 16, le);
-- 
2.33.1


