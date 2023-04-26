Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3446EF856
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:22:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prhuq-0004wm-BZ; Wed, 26 Apr 2023 12:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhun-0004vV-L4
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:22:45 -0400
Received: from esa5.hc2706-39.iphmx.com ([216.71.137.63])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhum-00068J-21
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:22:45 -0400
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 287060773
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Qswvqa3BTl9bOU3hCvbD5Wxzkn2cJEfYwER7XKvMYLTBsI5bp2cHz
 2odXTiOOv3bNDDycopxaI3j800F68DUzdU2SwM/qSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv666yE6jfrSLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglYwr414rZ8Ek05Kio5mtC1rADTasjUGH2xiF94K03ePnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aLVeS8oiM+t5uK23CukhcPPpMTb5LwX6v2ZwKhxLidw
 P0V3XC5pJxA0qfkwYzxWDEBe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1VBmI0E58xvdpMOl1q8
 qVIEh1dREqq0rfeLLKTEoGAh+wmJcjveZoB4zRuk2CfAvEhTpTOBa7N4Le03h9q3pEITauYP
 ZNIL2Q+BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtszeLklQuj+OF3Nz9WP2Xfeh7uGKh+
 WOdoHXCAUgQKJ/Axm/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR4zR36KZspQqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxWjNdJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:JoLkvasFrWzpFTv3f852q+Ti7skDT9V00zEX/kB9WHVpm62j+f
 xG+c5w6faaslkssQ4b6La90cW7MBHhHP1OgLX5X43PYOCOggLBEGgF1+vfKlbbakjDH4BmuJ
 uJjMBFeb7N5FJB/KHHCVmDeOrJabG8gcSVuds=
X-Talos-CUID: 9a23:qiJubmOGLr6/i+5DYyNE9mAGM4cZSUbh6HCJc3WVWUwzYejA
X-Talos-MUID: 9a23:5vd7nwp9/FE5IOYuLqUezxNDKf9FzYKKMR8MysoXgMrdPzAzZDjI2Q==
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2023 12:20:20 -0400
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-5ef4b68f47bso45312456d6.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682526019; x=1685118019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=baPw7HeUNSOgBdUdX5+Wv116KVOdtz82o0yKX11s6GY=;
 b=HOTBcmjzK+VrSqZG+hRfhMXWw5DnTHU8N63AWA5iXVJqZGte35yFYlcUvc++1cOMei
 NzudhD/vOPObQp42GDavrwghDDg8j75lpv1Oregf7XZVStL6sVMHG+Q2R0dSURonvXxu
 /P856opItzGwjYbcLMNbk4YSOtxh3dvixnxa04XVY795+6ChUeECk8g+sFdLiHYJPW65
 7WLof1T5equXfYCH1cbYAczD5mO7qcl4lTN6YptepTgzzgAkWi4mdlY+q4RlEVQC51Mj
 WDJWKwWX7PzOhX3mUKAPUEkn54Ayc9nRPNzMi/2UfZTIoiUJiTgQLHiJpjsdgGevjWmB
 +a7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526019; x=1685118019;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=baPw7HeUNSOgBdUdX5+Wv116KVOdtz82o0yKX11s6GY=;
 b=FzD3Bhyj/5eq/X8GEcN5eo0RbcxaWQuQZNo/V/OFfEX7JpjQCvSS3lpEzW7Lc0yC+G
 T+4MwXQ8Y668JxJrliaJROdt4660RudNT1+LmPswbobVHP8SMV+xBYerwOyRCAt7CwLg
 TayadTdoLXKhM50vjXKb/LOFixiQp+Yr5yc4YNOSTGVHwRNq5Fdu4uUO755taYl3RXUF
 vzqC+IWypE8nghS5z3boQS9TYNjGNVcuPCyTuz6iqrsOnHykjhkXVSS0YDo2yZ9jxjyM
 G5jDJ8hrWzYZaZ3fVENtt+vG/YLG8mgQRl9Eikh4U7Ds9WCq5YRtbF5umQDG95ozQTQw
 10Jw==
X-Gm-Message-State: AAQBX9eLwbCwxsD2DD7bfeyxhp5qVN7O5F497P76wQqXnv+jNfQ4dFag
 vA5lrrfWgs/YDKcchvaSTahpJ9LorAsaUEN/qSf5ll9JlJ4Y4oKgwxTLxl0DOqb6cEOUeQmVbBI
 hRWxuIQeA5Wsk+33mcN/P5P/yzpIHbNa3rIjsbGTd/64=
X-Received: by 2002:a05:6214:1c4f:b0:5ef:5144:9d24 with SMTP id
 if15-20020a0562141c4f00b005ef51449d24mr38061703qvb.21.1682526019488; 
 Wed, 26 Apr 2023 09:20:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350bp+GsjrdVdootw/GoXQWNlgEnT+dB9PI9t6pL2vHlJD3PuCKJkKZtUMUHgY78QX3EQ0oJ62g==
X-Received: by 2002:a05:6214:1c4f:b0:5ef:5144:9d24 with SMTP id
 if15-20020a0562141c4f00b005ef51449d24mr38061600qvb.21.1682526018604; 
 Wed, 26 Apr 2023 09:20:18 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a0ccc08000000b005f160622f3esm4953167qvk.85.2023.04.26.09.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:20:18 -0700 (PDT)
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
Subject: [PATCH v9 6/8] bcm2835_property: disable reentrancy detection for
 iomem
Date: Wed, 26 Apr 2023 12:19:49 -0400
Message-Id: <20230426161951.2948996-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230426161951.2948996-1-alxndr@bu.edu>
References: <20230426161951.2948996-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.63; envelope-from=alxndr@bu.edu;
 helo=esa5.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


