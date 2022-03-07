Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA684D0BC2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:10:44 +0100 (CET)
Received: from localhost ([::1]:38362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMV1-0006ij-HU
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:10:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7A-0007bS-HT
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM79-0005gX-4G
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IjGfq51R1V+EiuJTNpSRpX5c6IUrfGMgpNpMM4jK+NE=;
 b=XBpWPiSolpALa3U3cncrfVtgXnjzLn5O1kfaQaIodwJds0rx3k/It1lyTcy9iEYAkozPtr
 d4tFRENrmVucpYO9dt3DF1FwGfrmgm7SsTaEgfb7dhxICdXA5JFFF7FagXA0Uh9M7UTum0
 NqJ6tqI5OzYjvxoXi/K48aR+UquSTW0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-2_RWzguIMTu0axeKMtIO5Q-1; Mon, 07 Mar 2022 17:46:01 -0500
X-MC-Unique: 2_RWzguIMTu0axeKMtIO5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 i83-20020a1c3b56000000b00389a203e5adso1101000wma.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IjGfq51R1V+EiuJTNpSRpX5c6IUrfGMgpNpMM4jK+NE=;
 b=k0QOun3xe2mdbD8EpnVyG2UnoS92GZDMiEidZIbiDcmfZeKfqqFQ6ptvZL1mH/cJTT
 ZdMs/IS55y5m2OKVQDD9z6sak4Dzm6EAAAucrRg5Xi3HD86CXGNbDT6bdFXAgHXSZZNS
 hMmqb2s9pryJHmj9O4R7BTkfsOR2w3TAwDykzqcj55aEm4M5GH29wkukI2v8G0gDm/3u
 2cPyZhUXKCPezBJuSGeoLoXUBaUSWOMZQtVI1Slxx5+asp/tEdNhgZuBC8CGhJwWJ395
 eMroMI0eCrEB9FxRTKdRcuDQD9racHgJLXBnv7XUAb2FIEeOOjdCIbtXSFu31x5f2691
 6uyQ==
X-Gm-Message-State: AOAM530Hp0znSh82hDwVjvUeqdSY+mEDQgI9qSaKTO/ZcLLawKHFzaP1
 iintRY6SgOZphC70fqmoJ8S1QxV5pA1BBnrlZaIpLynVjO2NtCJRlrn+vvaOtLIGpi8QmpjTQNn
 gTvHCjjvHxosCNl2Nd1SiDCyXIdsDHXvttAvI9iRrbiNI7Yykjr6d+It0CZgj
X-Received: by 2002:a5d:4dca:0:b0:1f0:2543:e10e with SMTP id
 f10-20020a5d4dca000000b001f02543e10emr10068264wru.60.1646693160288; 
 Mon, 07 Mar 2022 14:46:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzb9lCR21I6QrLAhechfCnunnJnktiJ7Dk/QX8Tq/iKmTpZBVXVRIyKzCfVy4koEcg/J0zFTQ==
X-Received: by 2002:a5d:4dca:0:b0:1f0:2543:e10e with SMTP id
 f10-20020a5d4dca000000b001f02543e10emr10068255wru.60.1646693160063; 
 Mon, 07 Mar 2022 14:46:00 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c351400b0038688a67568sm581416wmq.21.2022.03.07.14.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:59 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 27/47] pcie: Add 1.2 version token for the Power Management
 Capability
Message-ID: <20220307224357.682101-28-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


