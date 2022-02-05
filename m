Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4204B4AA5A1
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 03:21:09 +0100 (CET)
Received: from localhost ([::1]:51336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAhI-0007aj-Cm
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 21:21:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7J-0003wf-HO
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7F-0003Nc-27
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DiaDZ6Jg6Wr7fQiD4I2/sd6NrZXyOewN/eKa4S/4RBc=;
 b=GBvG1zYXVXoTh+00iiBRm1uDMQ5aOQpOB40Gdbn8d2JH8Y8kj7ayCxoe+QIbqOSPH+0iwC
 +252sUe2zKdS5mGGnaLjrSh44Q2BPfxGP2SlEsPdQjaxjQXB1Te14K9NDWsTx3F4wnrUwx
 J8pv9ImHh+lE8AdzQ0ksntxelzkpzk0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-2HURcZN8M9qmAmEa8dO1PA-1; Fri, 04 Feb 2022 20:43:48 -0500
X-MC-Unique: 2HURcZN8M9qmAmEa8dO1PA-1
Received: by mail-wr1-f71.google.com with SMTP id
 q4-20020adfbb84000000b001dd3cfddb2dso2804503wrg.11
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:43:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DiaDZ6Jg6Wr7fQiD4I2/sd6NrZXyOewN/eKa4S/4RBc=;
 b=WoyYOio9rzGrc484OmJb8Yd8MhIIKUIzkKDEe1CQsoAthqaHtja7Xkp4OupX1RUVkO
 VSRYtHZyy7CNkmgem4eMl+fELKkeoJrp+H9wK3cruj7UrmZS4dFcML1ckM/gXesD0x/l
 qx8BKnmEZYtUmvO7hkKCwKG0Ry1et4YQT3mb9E46V863+X+qaqUEJTNkj/MpX3i8wKOf
 +YgXd1o3/XCYeFaIPX8rdA4AldF35qFnZ2a1/HqlTAwoGuy0xCj5OVMrLMUysOQpxYRo
 2AXM9Il9BcPUbicuHmhgtlrZxxc6Bhj16/Z8mVa+DP2QecKqc3vNjJkn4SX71v4PATav
 KgjA==
X-Gm-Message-State: AOAM533WTggx6HiMP574SpxZDfPqrPiw1oZKsy4SPo2N4OxptbJBH5IB
 2VXaxesTost7eXXf3tPN634+incHuqGPg/EHHaHJV4F6/W6EZ/H6hhwRwXNxVlDNgBCyhKreYQQ
 5VR6L3kCC8QG41hm7bPjo2o9tM0kK8HSkBOZB7J8JxbZkTX8gJpm8Sc92q5KE
X-Received: by 2002:a05:600c:17d5:: with SMTP id
 y21mr1181993wmo.102.1644025426790; 
 Fri, 04 Feb 2022 17:43:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwY+bXvL57BeQfLNdN7F13X7b577eKuJ812XZ4sVFGhfyKJD2ngnBGod0JFgmTQzth3V819PA==
X-Received: by 2002:a05:600c:17d5:: with SMTP id
 y21mr1181976wmo.102.1644025426542; 
 Fri, 04 Feb 2022 17:43:46 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id t4sm3181912wro.71.2022.02.04.17.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:43:46 -0800 (PST)
Date: Fri, 4 Feb 2022 20:43:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/32] ACPI ERST: PCI device_id for ERST
Message-ID: <20220205014149.1189026-25-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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


