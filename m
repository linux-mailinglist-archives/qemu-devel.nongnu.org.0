Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90164CD649
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:25:11 +0100 (CET)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8rm-0003YI-S3
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:25:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8BG-0003e5-Pb
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8BE-000189-KH
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IjGfq51R1V+EiuJTNpSRpX5c6IUrfGMgpNpMM4jK+NE=;
 b=NmhZkKIK+FdZXE9AXLvuGkbd9SEH/p8wff8hCUmImtvsPxrJXwPPkmNhUzXqocPa8SZie4
 oc5R7HDBGNi4b2KcDWMpRA/ota+L0XzckrfZAsteQlYSIMYXilXFqyJSiBSzi75U0/MRue
 xr/aFAZjd6BzJKCByvyG5BW/6olT04s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-sNrB0LBzMte7t8YuX6h10A-1; Fri, 04 Mar 2022 08:41:11 -0500
X-MC-Unique: sNrB0LBzMte7t8YuX6h10A-1
Received: by mail-wr1-f72.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so3380493wrg.19
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IjGfq51R1V+EiuJTNpSRpX5c6IUrfGMgpNpMM4jK+NE=;
 b=A3O0ENmbTFW3NMsNgVXQq1u5ImpFfPrcdHs1yKMBdOVeKdcZR6a3mYmizi9aXc/Rc6
 IwahAsw4huJw9TZzwNDkWU5jgbDKdEO6CX5bOYo9iP47uXEvq24kTuUU40I3QfqvzPHi
 y6CH/Bubx9NdXg6O2X8x5wc7v1GgRIFG1l2JiLBKfEw5jn6l/Ddf9HhzvjRg60NUZzoH
 BumgGdoVc5SpLT50b3hdkEHy9iH3r0njkBzYLSRgqyzWWgirrOSzqeuwlRvMgxVOaseh
 9xF0ZAOJJAG7NLt0wOIA7uD1WrL5g/6VbrCnu5c7/lAPraa2t3eeT1k0ckB04Wair15A
 vNhQ==
X-Gm-Message-State: AOAM530KaKzl7NqJDZ49ELzYbzsHBZ2pxoiZ+vPcDT71zrAsDbHQfdyN
 kBHbCZrUFdq3XIIz0k5Dk7MqNcqoNBqKYhAXwXh3aTLCb22RdJA2gmhkempqeEDBEBnjTEABDrj
 b61Q7eCwFUbrJPu41vaBXUTAzKmeSnlKZiiEKXEIIrgbYy3P+6RScUCOhG6rS
X-Received: by 2002:a5d:49c9:0:b0:1f0:16b2:584f with SMTP id
 t9-20020a5d49c9000000b001f016b2584fmr12786168wrs.710.1646401269435; 
 Fri, 04 Mar 2022 05:41:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvGi8Kj34zlRu0108In8y75wMRsVmnGZ7fZ04ArfhjN4EA7K2hvqi6uWNWhgJXSCExVaSVww==
X-Received: by 2002:a5d:49c9:0:b0:1f0:16b2:584f with SMTP id
 t9-20020a5d49c9000000b001f016b2584fmr12786143wrs.710.1646401269149; 
 Fri, 04 Mar 2022 05:41:09 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 l1-20020a05600c4f0100b00387369f380bsm5562882wmq.41.2022.03.04.05.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:41:04 -0800 (PST)
Date: Fri, 4 Mar 2022 08:41:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/45] pcie: Add 1.2 version token for the Power Management
 Capability
Message-ID: <20220304133556.233983-32-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Message-Id: <20220217174504.1051716-5-lukasz.maniak@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci_regs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/pci/pci_regs.h b/include/hw/pci/pci_regs.h
index 77ba64b931..a590140962 100644
--- a/include/hw/pci/pci_regs.h
+++ b/include/hw/pci/pci_regs.h
@@ -4,5 +4,6 @@
 #include "standard-headers/linux/pci_regs.h"
 
 #define  PCI_PM_CAP_VER_1_1     0x0002  /* PCI PM spec ver. 1.1 */
+#define  PCI_PM_CAP_VER_1_2     0x0003  /* PCI PM spec ver. 1.2 */
 
 #endif
-- 
MST


