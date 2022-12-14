Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3C064C73D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:36:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Oi7-0007hv-Pz; Wed, 14 Dec 2022 05:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohw-0007dz-Iq
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohr-00019k-Hm
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYBb/yUjxNamcfvIsoQSNlUwHNq50gt6HuBMX9rCx3o=;
 b=TeupsrJtSTVdV3vlaRj9AQvw/r6CsvdqjT/paDiGKYn/2fhb/BRK1DWCaLc9bWbZaSIXpX
 VohDXJEP31fLN+2e0RGc1wvtmARHDHKDRJaV77vyBZW++L/X9tCGsxVddZ5iMJOc2mMLlK
 jzCNSdqBPXwMxCeCkyr44eMUA13yVC0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-cfjSFyKBPjOCcklnhP_iYA-1; Wed, 14 Dec 2022 05:09:33 -0500
X-MC-Unique: cfjSFyKBPjOCcklnhP_iYA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BD8380234E;
 Wed, 14 Dec 2022 10:09:33 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B8E0492C14;
 Wed, 14 Dec 2022 10:09:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 12/23] hw: Include the VMWare devices only in the x86 targets
Date: Wed, 14 Dec 2022 11:09:00 +0100
Message-Id: <20221214100911.165291-13-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It seems a little bit weird that the para-virtualized x86 VMWare
devices "vmware-svga" and "vmxnet3" also show up in non-x86 targets.
They are likely pretty useless there (since the guest OSes likely
do not have any drivers for those enabled), so let's change this and
only enable those devices by default for the classical x86 targets.

Message-Id: <20221213095144.42355-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/Kconfig | 2 +-
 hw/net/Kconfig     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index a1b159becd..7b3da68d1c 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -55,7 +55,7 @@ config VGA_MMIO
 
 config VMWARE_VGA
     bool
-    default y if PCI_DEVICES
+    default y if PCI_DEVICES && PC_PCI
     depends on PCI
     select VGA
 
diff --git a/hw/net/Kconfig b/hw/net/Kconfig
index 6d795ec752..1cc1c5775e 100644
--- a/hw/net/Kconfig
+++ b/hw/net/Kconfig
@@ -51,7 +51,7 @@ config RTL8139_PCI
 
 config VMXNET3_PCI
     bool
-    default y if PCI_DEVICES
+    default y if PCI_DEVICES && PC_PCI
     depends on PCI
 
 config SMC91C111
-- 
2.31.1


