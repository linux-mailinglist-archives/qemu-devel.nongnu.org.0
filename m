Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A1B529344
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:59:38 +0200 (CEST)
Received: from localhost ([::1]:34014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqikb-000058-2r
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkW-0003QG-JM
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhkV-00073R-4n
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGmB4zsjFa00mhjv069N1K/klVxvRGM4udUUjgkD3LM=;
 b=Nsv2WMQBsY4cBfhXL9HTQK5TaVpPAKUWuNnjPQSa7t95FEwfql4Q6HamRlXy41jTNlF3FS
 NGKbDAS3KxdP8nkHVXaNZKZgY9iEb803MWoZxxKLxamYOQH/TBA9jDs0AAHkmS7uI+gySA
 7BJrHw0D/Gob4aOlLQTofFx7OELo2Qo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-PqTZF1pxORuffXEd9EfS6Q-1; Mon, 16 May 2022 16:55:25 -0400
X-MC-Unique: PqTZF1pxORuffXEd9EfS6Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 f20-20020a50d554000000b0042abba35e60so1410688edj.15
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RGmB4zsjFa00mhjv069N1K/klVxvRGM4udUUjgkD3LM=;
 b=mLGRNa/w1x8m/zPzLyh4bwIbwAsNs4NH+ig3s5XxQzJjs65q8UX3e7ybGy89lgg+OV
 Rve2kJ2f6aYmv/4yDXupkIUi1hwPqPBoR5LyvKiaDWDm/AvHXNFM7/+G+M7DVLK/ijJW
 W3DiIJGCFZX5VbMLkq6VnWPF8+0Xa8sOJQruqeebpzIpqTy73qa24ONNWIJqPZfY5t3i
 wWM3e5GY0wjJ74GJ+C35YaUytuf1fxURxcmO4oprByp/j6V8ffXbcAMeRHGBI275JFkl
 zwdc5T99KOv3OGDy4K4msL4neOSURhBumDMJlTn/E/S/ac43/cpkTBSMlnsMamw5X9u/
 RDag==
X-Gm-Message-State: AOAM530OqkqoY/fvvNi7yFWDj+q2drd2fLBcPp7OeJ42OUPkF5lve4aD
 RhUnwXj3JybKbQie31YfCldtJN38HkpXCZL4mn7mdHfmY7CnZra/QXEAAHvpuJl+3jMpIPaU1q5
 6W4J4HRcSmWCV9Zsb2Tzjb5yJiukuSXqDeDUcPZ0lD4VD+xOUFuM9QFmkqzsd
X-Received: by 2002:a17:906:6a0e:b0:6f5:30c9:7c7d with SMTP id
 qw14-20020a1709066a0e00b006f530c97c7dmr16389292ejc.63.1652734523856; 
 Mon, 16 May 2022 13:55:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsAzrFoZXXuHAqZ0hW4PJQ5IZua6hlsAcsmSGZh0lZKpiXIhL3iNIA7qxd7izebMExiZMOSg==
X-Received: by 2002:a17:906:6a0e:b0:6f5:30c9:7c7d with SMTP id
 qw14-20020a1709066a0e00b006f530c97c7dmr16389277ejc.63.1652734523558; 
 Mon, 16 May 2022 13:55:23 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 gz15-20020a170907a04f00b006f3ef214dddsm176011ejc.67.2022.05.16.13.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:55:23 -0700 (PDT)
Date: Mon, 16 May 2022 16:55:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 75/86] include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX
Message-ID: <20220516204913.542894-76-mst@redhat.com>
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


