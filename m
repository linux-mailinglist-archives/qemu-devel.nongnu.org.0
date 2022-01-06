Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0204865AA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:59:21 +0100 (CET)
Received: from localhost ([::1]:47982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TIW-0007eS-7I
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:59:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SfE-0005rq-9p
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SfC-000169-Le
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LvT4ppWsVTNHwP1QDeBfIbJrLtF0WPUv8XlijE9OykM=;
 b=HOosF8/wMpflCeuNtBBkhXP6IEwM3ryGmF14L4TM31VpMlSn+nO1vAia/x6cpEkQwJP1sF
 PSaR1xRUl24p4Xc5fsavdBr790h60B2mzPYwMahhUvQJVF2GSe7x9k5396fzxZj4mU5VtK
 ACoHDg1ENKNA9P3P8tBt0zxl+qTzC2s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-D2o7fGFcPxGfMws7W_kq5g-1; Thu, 06 Jan 2022 08:18:41 -0500
X-MC-Unique: D2o7fGFcPxGfMws7W_kq5g-1
Received: by mail-ed1-f72.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso1896530edt.20
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LvT4ppWsVTNHwP1QDeBfIbJrLtF0WPUv8XlijE9OykM=;
 b=VmRFvS5m9oyA+gCAzdON+wrGVprEK5uVwevgda5w7+XEsdEPjdSDNyeREltv/Yda5K
 D4ZX555vUPeYjuDlTgEzDK3R3CyKxOKULo/Q+BM2/WL29y00sV2gU3pCTJa0qy93ETjK
 eATxT5raftIUad+myeL1HudVN5d+X63q60KbwiDJFFhOzH73ZLGbQM0Hx57ulsGyAy2U
 oBjH4Jo3jDChvAbOJdlYL2QnwClYGWd+Fib+4qGUS5H4C1w0ynzIOmj1HreUeLpXkMwv
 pVU8Vgz+7ZsZ7vHAS1waoFTORPBOR/52RR92PFc8/5qQwuT8rOQVKtBJ6sputhgUxxqc
 bSoA==
X-Gm-Message-State: AOAM530to0idcrkXSdqzZkB0hgS3hV1s1B8Q5XDYXyntDUOBiesM9d8m
 ycBgB51Q2mT3ZpCX8L12/Agb90mPd/b1VCEefxdM0CfRsUEmb4F7Oeq0X5g+Dly/FNMXhAtnaWs
 l1ObNZbWZphG+SScWj/FwMLuZUj57d/hkSzcYwtfqyroExpF3fcSm0u5bMJFP
X-Received: by 2002:a17:906:bc56:: with SMTP id
 s22mr1691504ejv.760.1641475119232; 
 Thu, 06 Jan 2022 05:18:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/lqiSHjZAbh82+6Xt1SuftNhJlMkiJYGqL0+XMk6mx9vkxk9qNPKL8bwmVi07lJv+aRVwNQ==
X-Received: by 2002:a17:906:bc56:: with SMTP id
 s22mr1691485ejv.760.1641475118999; 
 Thu, 06 Jan 2022 05:18:38 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id p5sm709870edx.34.2022.01.06.05.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:18:38 -0800 (PST)
Date: Thu, 6 Jan 2022 08:18:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 48/52] hw/i386/pc: Add missing property descriptions
Message-ID: <20220106131534.423671-49-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

When running "qemu-system-x86_64 -M pc,help" I noticed that some
properties were still missing their description. Add them now so
that users get at least a slightly better idea what they are all
about.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211206134255.94784-1-thuth@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 718ab81ba8..c8696ac01e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1759,15 +1759,23 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
 
     object_class_property_add_bool(oc, PC_MACHINE_SMBUS,
         pc_machine_get_smbus, pc_machine_set_smbus);
+    object_class_property_set_description(oc, PC_MACHINE_SMBUS,
+        "Enable/disable system management bus");
 
     object_class_property_add_bool(oc, PC_MACHINE_SATA,
         pc_machine_get_sata, pc_machine_set_sata);
+    object_class_property_set_description(oc, PC_MACHINE_SATA,
+        "Enable/disable Serial ATA bus");
 
     object_class_property_add_bool(oc, PC_MACHINE_PIT,
         pc_machine_get_pit, pc_machine_set_pit);
+    object_class_property_set_description(oc, PC_MACHINE_PIT,
+        "Enable/disable Intel 8254 programmable interval timer emulation");
 
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
+    object_class_property_set_description(oc, "hpet",
+        "Enable/disable high precision event timer emulation");
 
     object_class_property_add_bool(oc, "default-bus-bypass-iommu",
         pc_machine_get_default_bus_bypass_iommu,
-- 
MST


