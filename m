Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2CE6F0DB0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 23:12:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8tD-0005up-Tv; Thu, 27 Apr 2023 17:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8tC-0005uQ-Ks
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:10:54 -0400
Received: from esa16.hc2706-39.iphmx.com ([216.71.140.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8tB-0005N6-1u
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:10:54 -0400
X-IronPort-RemoteIP: 209.85.160.198
X-IronPort-MID: 273505222
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:L1ko/qMmjNAJjcXvrR0clcFynXyQoLVcMsEvi/4bfWQNrUpzhWZSy
 WUfUW2DPf7cMWrxf9gkbI+//BsPvsDUzN82SAZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656yEnj8lkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjim8c3l48sfrZ80sz5quq41v0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE76RwFmMaDKgj2LhRJ1AUz
 voGFA0OV0XW7w626OrTpuhEg80iKIzyINpatCgxnXfWCvEpRZ2FSKLPjTNa9G1o14YeQLCHO
 ZJfMGs/BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvDOOlFEriuKF3Nz9Q+WPHJlzgB6hv
 DyF8U6lHj9CD/HF4G/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR4zZ36KZrpRztQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjJYJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:OekdeK5sCWHurHwhSgPXwPLXdLJyesId70hD6qkXc3Bom62j+P
 xG+c5x6faaslgssR0b+OxoWpPwIk80hKQU3WB5B97LNmTbUQ2TXeRfBODZsl/d8kPFh4lg/J
 YlX69iCMDhSXhW5PyKhjVQyuxQpOW6zA==
X-Talos-CUID: =?us-ascii?q?9a23=3AJmGVPmjDK6bOEhuqmqhpZxuLFjJuXizD1lX8Emq?=
 =?us-ascii?q?DKzhPbozPclmOxJ5nqp87?=
X-Talos-MUID: 9a23:KtIfMwX5UMfVn2jq/AbVgWg+Etkw2r7wS04nzYko4/KpbwUlbg==
Received: from mail-qt1-f198.google.com ([209.85.160.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 17:10:46 -0400
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3ef691d1eebso41123141cf.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 14:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682629845; x=1685221845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=baPw7HeUNSOgBdUdX5+Wv116KVOdtz82o0yKX11s6GY=;
 b=bLc+Sf5D1COH9x0JkJGO6Ctb9788JBLqleFbg1rk9fKeYwT1xuEpXgsPlBhLdBxhc8
 +dHqKSk7ueRWZawLcd9+Lqpt+n57ngOvEilE/H/vrR4RembzJXWHy2UfrV5dI/YqXTOS
 lQtmWH3P2jAFFIoFwK1y0p/lKJerr8CicukEyGsfIZNl01WAhafJnv2jlDL24EjkEPru
 xXHtzIt1wpHEYtZdX6uiiXwxTqORr17CyOzXdCa1CrS9kWtARYnIOQ5v6cYDXWrD+aWm
 XbWeTViYxuACcF2UU7KxIm5JIn5LQ+xm2cOGEDpX1wfDJ3ArwMCvHTyw22PhEYrk17uc
 GNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682629845; x=1685221845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=baPw7HeUNSOgBdUdX5+Wv116KVOdtz82o0yKX11s6GY=;
 b=M2C9Ajbb6IVCXJcoMpZyL0E+nhXF5IR+or/D5s1U2SkoK96tjT0iZDRB2mB5SKeYIN
 p11KWbB4T3Dq8aOQmpR6bMLMQWibOcgUkybxuDfesHFpDhX7/jFelfFZqU3tH5km3NlH
 mwgo7mISidkzovYQg15kdKfa4SiNmIVFNyq74BJI9Rx4YebJXHQ+YTev9RqOsgTo3Cau
 vvzi39aHPhnZP/MIS3fjRWCTlgZCequluGj4qDa2aMUjZtRGceGYc1qVd/rMnR8Ovydp
 M/r32aM5ZLgLzRYHYAWdBeSTsyUss83ONPw0LeYGfTBGfjP1Hj8RTW2kATzS/SZv6zat
 pabQ==
X-Gm-Message-State: AC+VfDxGPa99daqbrbwuUqTjcvkK1jJ+iSxtd9VtxnPGn5On1lGfk77y
 LsFFGcakv34p/DOnNP1ykQOxC9wrBPMksRHi53xNCxmgTQALyJJ6V9f1OGvEzS0grRTHYLKiy6w
 hkngDU08HtVoGsGvdV6yHZsMwe+lWQcpMYb6uoXP7J7M=
X-Received: by 2002:ac8:57c4:0:b0:3ea:bac1:a5be with SMTP id
 w4-20020ac857c4000000b003eabac1a5bemr4760082qta.42.1682629845233; 
 Thu, 27 Apr 2023 14:10:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qbri2Q+LH4NR35KATOGWb7DKHwgO2Xe2TuucXECJ/VltVtTl8c7BvSI8Jk5PVIxv7tHJtJg==
X-Received: by 2002:ac8:57c4:0:b0:3ea:bac1:a5be with SMTP id
 w4-20020ac857c4000000b003eabac1a5bemr4760042qta.42.1682629844982; 
 Thu, 27 Apr 2023 14:10:44 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 y11-20020ac8128b000000b003ef6582d971sm4947634qti.47.2023.04.27.14.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 14:10:44 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Raspberry Pi)
Subject: [PATCH v10 6/8] bcm2835_property: disable reentrancy detection for
 iomem
Date: Thu, 27 Apr 2023 17:10:11 -0400
Message-Id: <20230427211013.2994127-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230427211013.2994127-1-alxndr@bu.edu>
References: <20230427211013.2994127-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.205; envelope-from=alxndr@bu.edu;
 helo=esa16.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As the code is designed for re-entrant calls from bcm2835_property to
bcm2835_mbox and back into bcm2835_property, mark iomem as
reentrancy-safe.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/misc/bcm2835_property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 890ae7bae5..de056ea2df 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -382,6 +382,13 @@ static void bcm2835_property_init(Object *obj)
 
     memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_property_ops, s,
                           TYPE_BCM2835_PROPERTY, 0x10);
+
+    /*
+     * bcm2835_property_ops call into bcm2835_mbox, which in-turn reads from
+     * iomem. As such, mark iomem as re-entracy safe.
+     */
+    s->iomem.disable_reentrancy_guard = true;
+
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(s), &s->mbox_irq);
 }
-- 
2.39.0


