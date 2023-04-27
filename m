Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0241A6F0DAA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 23:12:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8tO-0005xN-EZ; Thu, 27 Apr 2023 17:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8tM-0005ww-BQ
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:11:04 -0400
Received: from esa10.hc2706-39.iphmx.com ([216.71.140.198])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8tJ-0005P8-U5
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:11:03 -0400
X-IronPort-RemoteIP: 209.85.160.199
X-IronPort-MID: 277337817
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Jmu5rapF85A5OqOpdiULYmbY/z1eBmKhZxIvgKrLsJaIsI4StFCzt
 garIBmPPviDZmqjL9p1bIrl8BxTsZWEzIQyTlFv+308RXlG95acVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiP68T5zcyqlFOZH4hDfDpR5fHatQMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+AsBOsDAbzsAB+v9T2M4nVKtio27hc+ada
 Tl6ncfYpQ8BZsUgkQmGOvVSO3gW0aZuodcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw++pqLHNc0
 sEjeDlURTmunPyq5o21Y7w57igjBJGD0II3v3hhyXTAEa9jT8mSEuPF4thX2Dp2jcdLdRrcT
 5BBOHw/MVKZPUUJYwZGYH49tL7Aan3XejlIrl6PjaAqpWXf0WSd1ZC3b4WOIYPaHJo9ckCwp
 Wni9kegICMgBdWTlxPYzyPzvsWSpHauMG4VPPjinhJwu3WKy2kOTREbS1a/if++jEG4RpRYM
 UN8x8Y1ha079UjuV8WkGhPh8S/CsRkbVN5dVeY97Wlh15bp3upQPUBcJhYpVTDsnJVnLdD2/
 jdlR+/UOAE=
IronPort-HdrOrdr: A9a23:35YZdaqQflGr/aJv84lw8MEaV5oleYIsimQD101hICG9Afb5qy
 nOpp4mPHDP5Ar5NEtQ/OxofZPwJU80lqQb3WByB9qftWDd0QPCEGgh1/qA/9SKIUzDH4BmpM
 VdmuRFZuEZUDVB/KHH3DU=
X-Talos-CUID: 9a23:+g5BYG8iTi6sqYbBezOVv08YB+03YFrg9yfZemSRJH13VJuqR3bFrQ==
X-Talos-MUID: 9a23:AHs5UQloJ7KgL6L03XvkdnphP+NhwP2MOno8mJlYkpS5ZHNIEWqk2WE=
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 17:10:52 -0400
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3ef34e947edso103958281cf.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 14:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682629852; x=1685221852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VCVW0/HeXmkSG974OczBBkQKZv6zFcpwChDreWsVAYs=;
 b=CG3zTuVEJhKMbMyUfD7jzbWH2W3t7/iYo37X7NCBLfzng8x292K0RSLSF3tqXgOCk4
 T4hz68fxCMTzvNTeeACo85dj0LaeUqfdzxQTHyxI0wL6P0HevMrtL2UgoxoOQRCwMQ9q
 th0cD4hqU6LU7R1Xjw+PPynexCAPEGWk0kr6KFFvKZ9hV1Iv3F1uzRw/Ge8yb1GXJ76A
 J5qNmgaBollGNoG/+9/TSMxHYXJ7WOkEVS0ZKUkRxfFyDCC6reYAhGAeBhLafitNiQuI
 Ck2mDY2LRMgyF/JM+3DFLlZlh52z6NGOQsrIVf5sZfspZ6JiCVzKuAroWzEu7QcyPg5w
 Qgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682629852; x=1685221852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VCVW0/HeXmkSG974OczBBkQKZv6zFcpwChDreWsVAYs=;
 b=HeISDYN+VOCKCyHUE9efTyujRJ6O2HprF7PIMQQ8bD7qhMosiyrV/1jHa9rmAIANZa
 qI/orAZ7Q+gOR6OEWxRawfyTq4CP5wei3P4MLTG/fPPayp+oRBxP9/hM8tuNztlw1GfU
 W0JWRuURGgEyA/uEko0iagdLBD29LNIB7/Kbc28k/xZyasc2d/oXzMGZPovmgzfWVSbd
 oj0r8t5j22g0Z0h9NdHjVPGVPKlZBXG6AvHYfS4ADNutN36/htXofWJlsYict6xhtSM/
 PPZ1WTUQMfoNvH52qHKXMNuG8TtRtFbYJG2bHZFYhM5GhSyTg+EXvxipgQGuBhdf9AcH
 9YjA==
X-Gm-Message-State: AC+VfDwYzAFylnwH7jjzDkPuiaGiVboxM4LwUxWDnLMAvzGWl50o8BPp
 hoSp8Bey4arglfwxBzsvJcCSZlq/8I/pxIVESdqdKPBMBt65IDvV3vFzOLgRxsJzaTutr3BVuLz
 uOHswpQqdvrvtqacOXsz29+51PeBWce9Asj0qby3WIGQ=
X-Received: by 2002:a05:622a:1ba0:b0:3ef:7d5d:9c41 with SMTP id
 bp32-20020a05622a1ba000b003ef7d5d9c41mr4651247qtb.59.1682629851969; 
 Thu, 27 Apr 2023 14:10:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qfpiBBwJj/WJmQRZMq3EbZALbqLQ558wusxGNjmhoQhcSYVCsLMMSDSX6i3qHnzxmLF3GlA==
X-Received: by 2002:a05:622a:1ba0:b0:3ef:7d5d:9c41 with SMTP id
 bp32-20020a05622a1ba000b003ef7d5d9c41mr4651192qtb.59.1682629851634; 
 Thu, 27 Apr 2023 14:10:51 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 e21-20020ac84e55000000b003bd0f0b26b0sm6515099qtw.77.2023.04.27.14.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 14:10:51 -0700 (PDT)
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
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH v10 8/8] apic: disable reentrancy detection for apic-msi
Date: Thu, 27 Apr 2023 17:10:13 -0400
Message-Id: <20230427211013.2994127-9-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230427211013.2994127-1-alxndr@bu.edu>
References: <20230427211013.2994127-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.198; envelope-from=alxndr@bu.edu;
 helo=esa10.hc2706-39.iphmx.com
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

As the code is designed for re-entrant calls to apic-msi, mark apic-msi
as reentrancy-safe.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
---
 hw/intc/apic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 20b5a94073..ac3d47d231 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -885,6 +885,13 @@ static void apic_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->io_memory, OBJECT(s), &apic_io_ops, s, "apic-msi",
                           APIC_SPACE_SIZE);
 
+    /*
+     * apic-msi's apic_mem_write can call into ioapic_eoi_broadcast, which can
+     * write back to apic-msi. As such mark the apic-msi region re-entrancy
+     * safe.
+     */
+    s->io_memory.disable_reentrancy_guard = true;
+
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, apic_timer, s);
     local_apics[s->id] = s;
 
-- 
2.39.0


