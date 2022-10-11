Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AC55FBD28
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 23:44:47 +0200 (CEST)
Received: from localhost ([::1]:57480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiN3O-000057-1b
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 17:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oiMfq-0004Te-D7
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:20:31 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:43794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1oiMfo-0006SS-SJ
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:20:26 -0400
Received: by mail-qk1-x741.google.com with SMTP id o2so2162993qkk.10
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 14:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ozVAThgn2oeccWPcE+jwIIHUv3uIclTtkDlamqTwwk=;
 b=k4fm6dEkcYzgX5Q7VPbkNgie4EmRxxWgLPHRI3Nax8PSmgCd7AbMlPrjI3hyajdpsD
 OLh9ezcYAu/z46FVdEr3qpsCfGnR5uASxk3kWBknjPlz9ChU1BKL/3GBfH7a/S2T5HUE
 ZT3CVG+ctHA27V3xOsWC2jtopjCdiW7VKk3vlGh1/ZdZxnBWfkySpHYKndA0anhZDaLr
 TzgelghthKQk2+vTvYjHcRKCcMUyHO91rMycqIlPojbBNyxdyBSVQYMHkNSeBi9a99He
 m9xREuRmkubmc/iijzY2yvkOBPDGnEYfvQ73y4tWCpjyK9hnd9PbUTApFV22FYFfXzvZ
 Hzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ozVAThgn2oeccWPcE+jwIIHUv3uIclTtkDlamqTwwk=;
 b=KeQSutlIq5US2ZggSUty0uCIT0kHl9icUvh8R/WEPSWbaxRQNmcUeowO6pi6oxm3L3
 QUlc/IqXF0FGXUVXCluWNN+levfDjwxhxKdgsLppauw4T2Gc0QPxBGUGzbgP8h1aSark
 CHTHSLInP+zVThoZt7Xrj2Hzl8wi2iUUnbfru7YTAB4uqKX51q1kwcY1GmDblF0Me381
 RpWBt97X2Vdt1FSMl3LQse1kKjp1qqmJL4PoI66zBh4jLEihsIvNLxwcOmZfdX0DDkQc
 IRVtNVVst6uVqCGYjKOTvSe+W4eJe0m73dZF30WeSGgsNtqfdR37o/2KjA4qdrag2zES
 RHng==
X-Gm-Message-State: ACrzQf0hDa0qiKmU8loqtDOAEFbY5aANmK7VYGyri9o3IbugvzcY2hBL
 W0zh3ujgr+W2YHNJkbR+rA==
X-Google-Smtp-Source: AMsMyM7kFZvP7defG2iJkjuNTo0HSF3VoSHFoaf7ehStKnxdYQZUqMA9fVaJJS+cPNwjYDO4WLwAiw==
X-Received: by 2002:a05:620a:22c3:b0:6ec:53bb:d296 with SMTP id
 o3-20020a05620a22c300b006ec53bbd296mr10773609qki.158.1665523223758; 
 Tue, 11 Oct 2022 14:20:23 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05620a44d500b006b8f4ade2c9sm14493164qkp.19.2022.10.11.14.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 14:20:23 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: jonathan.cameron@huawei.com
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com, mst@redhat.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 1/5] hw/cxl: set cxl-type3 device type to PCI_CLASS_MEMORY_CXL
Date: Tue, 11 Oct 2022 17:19:12 -0400
Message-Id: <20221011211916.117552-2-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011211916.117552-1-gregory.price@memverge.com>
References: <20221007152156.24883-1-Jonathan.Cameron@huawei.com>
 <20221011211916.117552-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::741;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qk1-x741.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Current code sets to STORAGE_EXPRESS and then overrides it.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/mem/cxl_type3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 3e7ca7a455..282f274266 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -535,7 +535,6 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     }
 
     pci_config_set_prog_interface(pci_conf, 0x10);
-    pci_config_set_class(pci_conf, PCI_CLASS_MEMORY_CXL);
 
     pcie_endpoint_cap_init(pci_dev, 0x80);
     if (ct3d->sn != UI64_NULL) {
@@ -763,7 +762,7 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     pc->config_read = ct3d_config_read;
     pc->realize = ct3_realize;
     pc->exit = ct3_exit;
-    pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
+    pc->class_id = PCI_CLASS_MEMORY_CXL;
     pc->vendor_id = PCI_VENDOR_ID_INTEL;
     pc->device_id = 0xd93; /* LVF for now */
     pc->revision = 1;
-- 
2.37.3


