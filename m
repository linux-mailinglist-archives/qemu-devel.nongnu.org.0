Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2723528408
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:20:03 +0200 (CEST)
Received: from localhost ([::1]:40442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZhi-0004M4-M3
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9O-0002hS-F4
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9M-0005mt-3t
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGmB4zsjFa00mhjv069N1K/klVxvRGM4udUUjgkD3LM=;
 b=id1kg5xifCixigh4dwJ/aBhOS7tKuzkbxdQN+4duBt3l73IzHWCeepSWVRtiO7lkEcd7Pk
 rRKAD6MACSFqaQN7aC2CGSzT/pXKCqgGoIlbyTK7p4IBcqf7ps2+gC/Hdq8e41vIPNaNzt
 iWQInYFminUXl8k4sMOWY4bqeM2ELlQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-L-f96dBBP06L9hjEaYa6rw-1; Mon, 16 May 2022 06:40:25 -0400
X-MC-Unique: L-f96dBBP06L9hjEaYa6rw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so5469443wmj.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RGmB4zsjFa00mhjv069N1K/klVxvRGM4udUUjgkD3LM=;
 b=I+ScWItYCfmiDQo79umxT6sS8LPe1wSIZLOMg5G4fF7WtWBsZh0X15zlu6HCNpc00z
 QApPVDUto+vy+QlaWsI3J5PoZz3MJpq4to9rqoLTaHivL5yOY032yrMdyTHoD/f6+1Us
 o/5pJ29/yfw/6x2cO/1Q5SiYQufxfkn/GltOUWpyERcRynoq1IviLUREruPieUU+0DaR
 iUkgsSJH81DuqFnfhGXZpxCi2Br0jpKKVM+Ln1FbvdWWcACN5hHeGbBRyfTrFt7650sX
 V34ghRrgyBrNLJC0Y3zj9W6AXODnJRo+xygsAs7Uh9xL3MEj6gJXlvMuOFcVZ2bzmazc
 uoUQ==
X-Gm-Message-State: AOAM531CjPuVYKOlYe7ct2s01vSq063JakCuevCsK3KkV4MpgQSAecJa
 gSk8+JFilxF0/CSKy6UgFXW9id1QgA/xjkxXmCCL/vm+4QE082X9Gn/YRtZ9WISVRs2fQHeN2r+
 pskZGFPoc9NT5RNNEu8kRuqwL60rG1S/QyRSqQiYaeiRmvXp0uKw4BDwvs8zd
X-Received: by 2002:a5d:4ccc:0:b0:20c:d966:85c with SMTP id
 c12-20020a5d4ccc000000b0020cd966085cmr13318397wrt.514.1652697624327; 
 Mon, 16 May 2022 03:40:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0uWeE6jj9d//SWdIEe7RedNNcAIWtzNvHBqIuO4DOU4RUPQTNAislEqwxp3yl8SjYr6P0wA==
X-Received: by 2002:a5d:4ccc:0:b0:20c:d966:85c with SMTP id
 c12-20020a5d4ccc000000b0020cd966085cmr13318379wrt.514.1652697624098; 
 Mon, 16 May 2022 03:40:24 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 u21-20020adfa195000000b0020c5253d915sm9355148wru.97.2022.05.16.03.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:23 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 81/91] include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX
Message-ID: <20220516095448.507876-82-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

According to 7.2.2 in [1] bit 27 is the last bit that can be part of the
bus number, this makes the ECAM max size equal to '1 << 28'. This patch
restores back this value into the PCIE_MMCFG_SIZE_MAX define (which was
changed in commit 58d5b22bbd5 ("ppc4xx: Add device models found in PPC440
core SoCs")).

[1] PCI Express® Base Specification Revision 5.0 Version 1.0

Signed-off-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20220411221836.17699-3-frasse.iglesias@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci/pcie_host.h b/include/hw/pci/pcie_host.h
index b3c8ce973c..82d92177da 100644
--- a/include/hw/pci/pcie_host.h
+++ b/include/hw/pci/pcie_host.h
@@ -65,7 +65,7 @@ void pcie_host_mmcfg_update(PCIExpressHost *e,
  * bit 12 - 14: function number
  * bit  0 - 11: offset in configuration space of a given device
  */
-#define PCIE_MMCFG_SIZE_MAX             (1ULL << 29)
+#define PCIE_MMCFG_SIZE_MAX             (1ULL << 28)
 #define PCIE_MMCFG_SIZE_MIN             (1ULL << 20)
 #define PCIE_MMCFG_BUS_BIT              20
 #define PCIE_MMCFG_BUS_MASK             0xff
-- 
MST


