Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CA64CFB1D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:29:17 +0100 (CET)
Received: from localhost ([::1]:39146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAc8-0000D1-6r
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:29:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACU-0001uZ-T9
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRACT-0002nj-6x
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nfa7HHR2REoaTfd34g0WHMW6eNj0XG3k8vtXlnv0J3Q=;
 b=MzENFFH63QrGh7rxSM9SKM5XHixERQx89faqagMu4Jj476eUUlCRn9AFtFg8TR6aqR8uwg
 5aQbZ5wadxkgWxtYSfL2yzizQAVRd4nheiyCrstdzvdkDaSAyBUE/RZSbmv7mh2gBAOshC
 I2sk+RMywcAkdDVaveQ3FAkQL0jOqaE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-lEb58oT1OEqdjU8QbbAamg-1; Mon, 07 Mar 2022 05:02:43 -0500
X-MC-Unique: lEb58oT1OEqdjU8QbbAamg-1
Received: by mail-ed1-f70.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so8322732eda.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Nfa7HHR2REoaTfd34g0WHMW6eNj0XG3k8vtXlnv0J3Q=;
 b=7dt9RsqJUB+jUt/dyyw0v7c3RFPaEuJFaMdBqgqKChpIe+uD1BrmTj9eUODTbvObl3
 vJq5Ex6KkERA0aUL5NycTqTfTsxluHxidQtOrDIxujAeS1xQovr9E8kbOhb0zODywXXJ
 p0GQNdGD2xSVUFSlnn0zNS+2VzKCBGr3qwkuMU+5EApYlczbInSvUluX+di5W6Bx4Ms5
 gGbNQHRXJQUxrQHi7CTGNbzr1IfuaOCTaSgigvLixBJTNiUsvk5fRnctPVBNKOxqZO3Z
 ZeCiIElDikWSYF4/eQhwwhs92/uu3Pnk+mSiSYukE6w5nvWYSlmnHQCfAzK4+Gl//zpX
 q+XQ==
X-Gm-Message-State: AOAM532KVL32qcjJJFWQiIoNaB+7ado2Uk9tvwiYpt9tprSvuB2qqpPi
 bjFGheIN+QMRLWpAUIiuhDyDFG8yxBQUbT7LuNLryrQ4eURQPoA7Oc35bQgDTPd/mhzSrwt0ud8
 iiJLTVFvCRNcVTzjSST0eUQwVm2+60PRmPKsrUusCXz91IpVnhw4o6/ekL7yV
X-Received: by 2002:a17:906:fb1b:b0:6da:9e7d:1390 with SMTP id
 lz27-20020a170906fb1b00b006da9e7d1390mr8139548ejb.644.1646647362166; 
 Mon, 07 Mar 2022 02:02:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUd24vPcudoC1sglXENnZ0Ntg1GQTMHUT3jECuQGoPC1NyfXRPeUEysJjk5WB0otu/xcaCWw==
X-Received: by 2002:a17:906:fb1b:b0:6da:9e7d:1390 with SMTP id
 lz27-20020a170906fb1b00b006da9e7d1390mr8139530ejb.644.1646647361895; 
 Mon, 07 Mar 2022 02:02:41 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 u10-20020a50d94a000000b004131aa2525esm6031003edj.49.2022.03.07.02.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:41 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 26/47] pcie: Add a helper to the SR/IOV API
Message-ID: <20220307100058.449628-27-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
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


