Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C90F529353
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 00:03:52 +0200 (CEST)
Received: from localhost ([::1]:42498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiog-0006Fz-Fs
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 18:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkW-0003Q8-Gq
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkU-00073L-UR
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PwK/p5+FmU17Oa8SJM6EBBCm87cG2gPVSdHa2qFFojk=;
 b=Cn29yhfMYq2UF5LTF74N+LfETuc0vnjEuUEN2CLvnpynrnWjhvQntfyk1YOapgltVnoqjp
 ysBvUTB9OKhyaIIh6VlzbQgiz1B7nITFFHLaArSwpJQOVTz3CWvGeGNwsUOdYxw3MWy4Ep
 XQLnZLZC8pLPVRIE5viRqpQ7R0F3Gdc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-Y--TMbuBNI6b2ZTeezJrAg-1; Mon, 16 May 2022 16:55:22 -0400
X-MC-Unique: Y--TMbuBNI6b2ZTeezJrAg-1
Received: by mail-ed1-f70.google.com with SMTP id
 cz24-20020a0564021cb800b00425dfdd7768so10499505edb.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PwK/p5+FmU17Oa8SJM6EBBCm87cG2gPVSdHa2qFFojk=;
 b=PwHY3tw9BX+eoJ0zsUt+6CtrD93v/pJC+ENv3zZQ+6skri7Np4r/gYfVSc8szthDoY
 8vd8zsguVLIgLJiWjSh9qQ3JvR3AYslRBTCKBf5QR0jASPnbolBkUc01GWU4S7SIupSS
 a+D5YKZfrJ3KlmX4L9UhGFWl4a7ltVISmwV22/8Y5WtiQOEj1wPQj6Y+Uzh1hvdGYc7d
 ck2F+2V5R4uw1m4mRfWu0EXoF6Ug2iQTeUDqpnFYSfae3Pww2bY6uZSZ5htlybwt3MwI
 7Of2oM2YSc7OIO06hyPz0nt4u7+SbTw0/KzKgFSRlsja8rQ/zzJvtktZBP1Y9TBHspRJ
 kV/w==
X-Gm-Message-State: AOAM531N79MLoVWF0NUcgw2DZc3d6c4g/MUpvqeHp5EAVuJtGDruUvIt
 eaxSL8Vg0aX66uXnzu6xmTzs7wQNCl9aM2J6SlvasBiPdZc+913boeJMf2JbOxbktTjaWsCgXJ3
 whgTXmzisadg5k0XQQe3VDRGA4WndKTtU4Wc2MZ3ENY/06jaemrDfa6Kvfobx
X-Received: by 2002:a05:6402:3488:b0:427:b4ec:991b with SMTP id
 v8-20020a056402348800b00427b4ec991bmr15132614edc.319.1652734520974; 
 Mon, 16 May 2022 13:55:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz76XuHYtVsvHxdzBHos1ekQe8CHhufPUk8kcMXnQgbSbQ7O4Sdr3rMP+Rojq3yhseGi3cwLA==
X-Received: by 2002:a05:6402:3488:b0:427:b4ec:991b with SMTP id
 v8-20020a056402348800b00427b4ec991bmr15132599edc.319.1652734520759; 
 Mon, 16 May 2022 13:55:20 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 j13-20020a508a8d000000b0042617ba63cbsm5658373edj.85.2022.05.16.13.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:55:20 -0700 (PDT)
Date: Mon, 16 May 2022 16:55:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 74/86] include/hw/pci/pcie_host: Correct PCIE_MMCFG_BUS_MASK
Message-ID: <20220516204913.542894-75-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Francisco Iglesias <frasse.iglesias@gmail.com>

According to [1] address bits 27 - 20 are mapped to the bus number (the
TLPs bus number field is 8 bits). Below is the formula taken from Table
7-1 in [1].

"
Memory Address | PCI Express Configuration Space
A[(20+n-1):20] | Bus Number, 1 ≤ n ≤ 8
"

[1] PCI Express® Base Specification Revision 5.0 Version 1.0

Signed-off-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220411221836.17699-2-frasse.iglesias@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie_host.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
index 076457b270..b3c8ce973c 100644
--- a/include/hw/pci/pcie_host.h
+++ b/include/hw/pci/pcie_host.h
@@ -60,7 +60,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
 /*
  * PCI express ECAM (Enhanced Configuration Address Mapping) format.
  * AKA mmcfg address
- * bit 20 - 28: bus number
+ * bit 20 - 27: bus number
  * bit 15 - 19: device number
  * bit 12 - 14: function number
  * bit  0 - 11: offset in configuration space of a given device
@@ -68,7 +68,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
 #define PCIE_MMCFG_SIZE_MAX             (1ULL << 29)
 #define PCIE_MMCFG_SIZE_MIN             (1ULL << 20)
 #define PCIE_MMCFG_BUS_BIT              20
-#define PCIE_MMCFG_BUS_MASK             0x1ff
+#define PCIE_MMCFG_BUS_MASK             0xff
 #define PCIE_MMCFG_DEVFN_BIT            12
 #define PCIE_MMCFG_DEVFN_MASK           0xff
 #define PCIE_MMCFG_CONFOFFSET_MASK      0xfff
-- 
MST


