Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4E14CD64A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:25:13 +0100 (CET)
Received: from localhost ([::1]:53052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8ro-0003bi-Oi
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:25:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8BB-0003cu-2e
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8B7-00017S-Dc
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nfa7HHR2REoaTfd34g0WHMW6eNj0XG3k8vtXlnv0J3Q=;
 b=Xt2Rj/lqiuuHVIT8V0yYNMhyYKG3W6EEwpjK4/1OlYGMzRchPfF6cE+elpq8ObNa0PfPzI
 MKrESiw2HwuhQfTqPGADkL49JJOuKhD1K7mo0KYvtcMwGGuk6ZTLHFMObPfAxGbql0AISY
 MU9UTDhIEZa/ZTEGeKrWsDbrwY6m5t0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-nJJtTMSWNeGyhyBRGDP4nQ-1; Fri, 04 Mar 2022 08:41:03 -0500
X-MC-Unique: nJJtTMSWNeGyhyBRGDP4nQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 f14-20020adfc98e000000b001e8593b40b0so3363811wrh.14
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Nfa7HHR2REoaTfd34g0WHMW6eNj0XG3k8vtXlnv0J3Q=;
 b=g2RbsT9rEJgGm5O94hXhEw2iH4iNnfCEE9rOO6b4gQQu8vm7bQeiAe3OpsKKDc4iiN
 zKOCTZIVvgDZhlzakTf3e/9DEJTkyMao+swnf/v0XVaVLJeVCgcWYBWEJ0ObrtzSgxXC
 VnIF+LErtQ1aVd7uvk9EppkEjxgsKVwZm1NDWE9WOWHeU09RiTAoh1gO9EQ992K+r/yK
 igC2olCMDBAvMubFeuuQxRz4snXfOqYEfm29HufVfBSSY5p1N23FjFmpy3BD1rtUsGF2
 t9JZ0hy8tMoSL0ZAL6Gw7h7VQiHxc/sf1V/d9yH+oDoPEwivyElFK1ZUkSo+dHG9u43i
 +x4Q==
X-Gm-Message-State: AOAM5302t6CYetL4tPsyw7LRXbfMqvdg1BSEyiRLUVoi/hS/WjQIKj0O
 ubqdEwNVKM4FegkPyOWRIITr/W+jS/cXbevV+oBTM5jOFj+HAo+JPlaGd15zGteK+oWEI2FG2gF
 7UhQB55W74osVovpnIwociYnAKLxQ71lYMnqupNRgPUpDz5b+cGOR+tUh1DLT
X-Received: by 2002:a5d:678a:0:b0:1ef:8e97:363c with SMTP id
 v10-20020a5d678a000000b001ef8e97363cmr22471848wru.617.1646401262035; 
 Fri, 04 Mar 2022 05:41:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnTCkbb1qdMdjn4gpDmR6rErN56Ls12L76k++zVR2tgyYDv0fQGgkg/3ogSqLo9SGjMEiYeQ==
X-Received: by 2002:a5d:678a:0:b0:1ef:8e97:363c with SMTP id
 v10-20020a5d678a000000b001ef8e97363cmr22471828wru.617.1646401261772; 
 Fri, 04 Mar 2022 05:41:01 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 g17-20020a5d4891000000b001e74e998bf9sm4586836wrq.33.2022.03.04.05.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:40:58 -0800 (PST)
Date: Fri, 4 Mar 2022 08:40:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/45] pcie: Add a helper to the SR/IOV API
Message-ID: <20220304133556.233983-31-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Knut Omang <knuto@ifi.uio.no>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

Convenience function for retrieving the PCIDevice object of the N-th VF.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Reviewed-by: Knut Omang <knuto@ifi.uio.no>
Message-Id: <20220217174504.1051716-4-lukasz.maniak@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie_sriov.h |  6 ++++++
 hw/pci/pcie_sriov.c         | 10 +++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci/pcie_sriov.h b/include/hw/pci/pcie_sriov.h
index 990cff0a1c..80f5c84e75 100644
--- a/include/hw/pci/pcie_sriov.h
+++ b/include/hw/pci/pcie_sriov.h
@@ -68,4 +68,10 @@ uint16_t pcie_sriov_vf_number(PCIDevice *dev);
  */
 PCIDevice *pcie_sriov_get_pf(PCIDevice *dev);
 
+/*
+ * Get the n-th VF of this physical function - only valid for PF.
+ * Returns NULL if index is invalid
+ */
+PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n);
+
 #endif /* QEMU_PCIE_SRIOV_H */
diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index 3f256d483f..87abad6ac8 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -287,8 +287,16 @@ uint16_t pcie_sriov_vf_number(PCIDevice *dev)
     return dev->exp.sriov_vf.vf_number;
 }
 
-
 PCIDevice *pcie_sriov_get_pf(PCIDevice *dev)
 {
     return dev->exp.sriov_vf.pf;
 }
+
+PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n)
+{
+    assert(!pci_is_vf(dev));
+    if (n < dev->exp.sriov_pf.num_vfs) {
+        return dev->exp.sriov_pf.vf[n];
+    }
+    return NULL;
+}
-- 
MST


