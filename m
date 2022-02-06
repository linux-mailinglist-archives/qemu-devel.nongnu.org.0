Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C298A4AAEC7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:13:43 +0100 (CET)
Received: from localhost ([::1]:48124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeYA-0005Qi-LG
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:13:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0D-0000cU-NX
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0B-0003id-Tw
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DiaDZ6Jg6Wr7fQiD4I2/sd6NrZXyOewN/eKa4S/4RBc=;
 b=Nl+ofOjj48y52w8sKVxabdtNzK2sAo7RjYOx/nOODSV7gtLZttNU4gOKJZEEpwtpgXlHzD
 vcfZ4P/dOOYVnpwGLqpb2Tev3S7ISETHMU2A4Qy9BixxAKX+zjZTZhD74W+p8uUsoR7TdU
 3n4ZSy3kyVaSt68CyY5kOwpXoJekyfA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-ZA9-c8DCPdmE9Vs1B_xPww-1; Sun, 06 Feb 2022 04:38:32 -0500
X-MC-Unique: ZA9-c8DCPdmE9Vs1B_xPww-1
Received: by mail-wm1-f71.google.com with SMTP id
 s187-20020a1ca9c4000000b0037bb8547d64so1531927wme.0
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DiaDZ6Jg6Wr7fQiD4I2/sd6NrZXyOewN/eKa4S/4RBc=;
 b=zt7+txLuMZ+Hz6tkmY+wOcNlQfnxj4bmNKmFaYv99B4JHP/LvkxVXYgpcg5RNzFiJR
 bSu/HgKUBd39PwZeKYpkENfOepZEWwnwXndJZViIVuRO9U5lDabH6Wt2DwpRLv2z9rmi
 NrR8P2So3LOb6u5mBfWNm7tCCy8K84wpux6aZaVG9YV9Tl43pCPnB+gOTxdaQV241xJk
 puLPX6LRa5m+LJN19KTa4hN0Ps4CIDrGBktZMmE+4zcn0tcREVsO+8vYJG90pp3Z1Grf
 JYwJoZ4AaSaX/1YC1SqYvgWhz/Ay0cKu0sf1UslpGDa6Bc9ttwC6LbOdG/b4xWQXw4ym
 yieg==
X-Gm-Message-State: AOAM530RQXfgQ2xFVe8eiV90JOC3mF2DNitP+Ei0JxakDjsADx0+Lb2q
 ORuLO1VQ6mymJToS11KdFaHAamfwa/De+bWni0HFrgN6KZzIG3sxriaC/RMItoE813w+5gWz7NQ
 OldQz5m8mLPPIc3M1FMX0wiwcd+5OjXawc4d4ZffdCFVLdthAPvOp7+g4ZOLH
X-Received: by 2002:a05:600c:5118:: with SMTP id
 o24mr6493111wms.153.1644140311194; 
 Sun, 06 Feb 2022 01:38:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8vsEGRLnYH3MvENUfb39jKztYhyXJq46Bn52TVU0T8AV9roM42TxmWazXaT+aPVAptsJCNg==
X-Received: by 2002:a05:600c:5118:: with SMTP id
 o24mr6493093wms.153.1644140311008; 
 Sun, 06 Feb 2022 01:38:31 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id ay29sm6008532wmb.38.2022.02.06.01.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:30 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/24] ACPI ERST: PCI device_id for ERST
Message-ID: <20220206093702.1282676-17-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric DeVolder <eric.devolder@oracle.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric DeVolder <eric.devolder@oracle.com>

This change reserves the PCI device_id for the new ACPI ERST
device.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <1643402289-22216-4-git-send-email-eric.devolder@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 023abc0f79..c3f3c90473 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -108,6 +108,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
 #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
 #define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0011
+#define PCI_DEVICE_ID_REDHAT_ACPI_ERST   0x0012
 #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
 
 #define FMT_PCIBUS                      PRIx64
-- 
MST


