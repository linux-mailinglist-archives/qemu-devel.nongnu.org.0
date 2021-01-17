Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FB02F9234
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 13:01:58 +0100 (CET)
Received: from localhost ([::1]:39336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l16km-0002KJ-SN
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 07:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16WA-0001s6-TO
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l16W2-0008Ge-Et
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 06:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610884000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Ve2ARHYvLFIq8kepyLE4GCsFnzf21hx4ojk8moHaEs=;
 b=IhsJzgE2X/HvIBo8FtMHtDI9JUW8NEI8DzGxXVCvW3FieFaGmb03Iu0b8MLxDMQiNylIbZ
 TSfb8XDV+TfYgePtnhuhPuEvUg2QY9WZFCmwx1pIT4/OsFqbr5m0LE9EeoTI8zbRgKJxP+
 CLEzv1ZHSGM9N3A4kkXxzevYeTSEyp4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-qRQulJVkOnml6SnbT7W_1Q-1; Sun, 17 Jan 2021 06:46:38 -0500
X-MC-Unique: qRQulJVkOnml6SnbT7W_1Q-1
Received: by mail-wr1-f69.google.com with SMTP id q18so6784195wrc.20
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 03:46:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3Ve2ARHYvLFIq8kepyLE4GCsFnzf21hx4ojk8moHaEs=;
 b=Y1adugXrSiqBKRaI2HpzaBqYo37dTSjcQSehubAGR3p27b4dCUcrRHWuHatOu6I+Q+
 crFXzN8vZQDEebqSRXk2pgLVbicrghkDucD8jF7gmjW4LKxdrXu7BlLMF/8wLcReqIJW
 dCpxuLFQsD1v+Ydyc6Y8Jx78lmFSqXwXySbioLZgRgtes+5txKKFN8xILd6f0LC+Vr4x
 4GLmwqknLXTupGoEHMGRGa8JBYDAQVPo3dxZ3q4M+aCKyic5xNUl7hUZ4n8kz9s0cmw/
 nZGUQ4cCdHpBW/COjQ+biGPk1uS4h1zzZr776LFxM2WhAGgMW/2rbaqjRlLtBn9X/+EL
 RuIg==
X-Gm-Message-State: AOAM5336AUymCxGSFAIm0yAMvlkdqFdYDmEdW9iIBbh4hGV+rjWxwAgG
 bf+/LhDx9lOk+HGFUTi6CrxPq8Baq2cZAzwigXOMmm7MKOUC6S7dsg7YhWdcDUt9j0+44wzcQcx
 L91YXVFYmUvv6Q/FPnTcRBYpCvrVo8vt5ElUYT5TLHa7wcmkPL0iNBbBq6Hjx
X-Received: by 2002:a1c:3c04:: with SMTP id j4mr16614538wma.177.1610883997308; 
 Sun, 17 Jan 2021 03:46:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7n6EC4+ir/pfsNq4vcfAuhGCPJFrDNHqzY4JP9w7pTBSMhfYWcKVrAM6UcJGxOftH+aHZUg==
X-Received: by 2002:a1c:3c04:: with SMTP id j4mr16614524wma.177.1610883997089; 
 Sun, 17 Jan 2021 03:46:37 -0800 (PST)
Received: from redhat.com (bzq-79-176-30-58.red.bezeqint.net. [79.176.30.58])
 by smtp.gmail.com with ESMTPSA id
 h5sm24090493wrp.56.2021.01.17.03.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 03:46:36 -0800 (PST)
Date: Sun, 17 Jan 2021 06:46:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] Kconfig: Compile PXB for ARM_VIRT
Message-ID: <20210117114519.539647-9-mst@redhat.com>
References: <20210117114519.539647-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210117114519.539647-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiahui Cen <cenjiahui@huawei.com>

PXB is now supported on ARM, so let's compile for arm_virt machine.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20210114100643.10617-7-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-bridge/Kconfig b/hw/pci-bridge/Kconfig
index a51ec716f5..f8df4315ba 100644
--- a/hw/pci-bridge/Kconfig
+++ b/hw/pci-bridge/Kconfig
@@ -5,7 +5,7 @@ config PCIE_PORT
 
 config PXB
     bool
-    default y if Q35
+    default y if Q35 || ARM_VIRT
 
 config XIO3130
     bool
-- 
MST


