Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30C64D0BAB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:06:42 +0100 (CET)
Received: from localhost ([::1]:54288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMR7-0006qa-PY
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:06:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM79-0007aL-6d
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM76-0005gN-Ip
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nfa7HHR2REoaTfd34g0WHMW6eNj0XG3k8vtXlnv0J3Q=;
 b=eRAdbPMN9cUm4iKIEjqP+8OmklPmZd+EOh/pFdgXBvKNwI2e8H1Hy/slnwldCxTZEIoqeX
 tnMsKpI4jtocvDTy5pZFFltcYHVHFO7yZ/1Y8v3oLKEsAXFnC+7jgo2iQKNMdHwAwQnehN
 8XrwKd5Fhe/dxm6gQ5UnvUNjFD9GmoQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-BfWGDvXbNDWwV_rU2JQcww-1; Mon, 07 Mar 2022 17:45:59 -0500
X-MC-Unique: BfWGDvXbNDWwV_rU2JQcww-1
Received: by mail-wr1-f70.google.com with SMTP id
 o9-20020adfca09000000b001ea79f7edf8so4965608wrh.16
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:45:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Nfa7HHR2REoaTfd34g0WHMW6eNj0XG3k8vtXlnv0J3Q=;
 b=hpqF1FvXPTexD2rEcAJFAZI21TE9dYoa2z8iuxwUYgwq6APmRVLX22NzoCKm6eQZsg
 NfIZMxUAeauktjPc3z1J2aOq6310sRtfIcb3bAVElXZYZXj/cElVhi1z4zbQzyl6NZ1I
 3vj0UrXsy1beVyqSB7RXK35bAH1zAfPi26oirUyoi6Lda9LvWv+pWBB8CLWvBPGGiAL4
 JrToeD7CiZlEzgTvvj3XbIgz2OH5mXZgw68jwxIaU+dPuASsEAX+W2zv9qvnSFxTybd4
 j+KLa2YaEzyh6pey3GwxAImxeRsldm2C2Bq4cHtOYVbfelfTUqE/Qe9/+QkqM7s9Pt+j
 +aEQ==
X-Gm-Message-State: AOAM5333pDPduVQcEfb7mG/pu6c3wjQNGYRcYADD24f4uYmpE4LHvE8V
 LNBlMQ1lTMo3WfusBqlki1yPPU0ui1bPH09Vnx/mUkObqs/E6S8fysm57DjVZIFUobuDC8Gyghk
 7HTwHCAvOV/NmmCD8FKk61QyfWnluqq5PMuWe33oF7ufHttvKiVARsovVczMZ
X-Received: by 2002:a5d:49cf:0:b0:1f1:e450:cd02 with SMTP id
 t15-20020a5d49cf000000b001f1e450cd02mr8764912wrs.70.1646693157630; 
 Mon, 07 Mar 2022 14:45:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwW4JpgHYyiJQt0HQbji3Gaoxb/0YxRvyw5+buLT4C4Fze7fq/DuxmjcztYonQAKfWHaV7hmw==
X-Received: by 2002:a5d:49cf:0:b0:1f1:e450:cd02 with SMTP id
 t15-20020a5d49cf000000b001f1e450cd02mr8764901wrs.70.1646693157411; 
 Mon, 07 Mar 2022 14:45:57 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 f1-20020a056000128100b001f04a47762dsm12091944wrx.109.2022.03.07.14.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:56 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 26/47] pcie: Add a helper to the SR/IOV API
Message-ID: <20220307224357.682101-27-mst@redhat.com>
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


