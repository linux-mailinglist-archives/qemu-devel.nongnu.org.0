Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D6A5EF8AF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:28:12 +0200 (CEST)
Received: from localhost ([::1]:38544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvSN-0005Hd-II
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1odtdr-0005mb-FG
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:31:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1odtdn-0004Eo-Cr
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664458309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WaLYBxCgcZUXTOTcu8QQyjo/tcaOrFk2q/gAj8YiDig=;
 b=N7NkaCN5Ru0zKL9ZT59HtFoM303w9DKzd6PdnJ9WLMVOekhDu0//oxWMJPOnfgxJLhKqFk
 FdmUiD+4N5nWdEn0CZRx9CV6hxMVGa1aNQoRIkTC38dIW4/t8Sad7HiXVEGcVFe004oB/l
 r6g12touOXOLU6aeNDs1yJ8Jr821Heg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-mDw5GU-WMxCMxsroXZOrfQ-1; Thu, 29 Sep 2022 09:31:46 -0400
X-MC-Unique: mDw5GU-WMxCMxsroXZOrfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05B69805AC5;
 Thu, 29 Sep 2022 13:31:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCE1F2166B2B;
 Thu, 29 Sep 2022 13:31:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 874DA180062C; Thu, 29 Sep 2022 15:31:44 +0200 (CEST)
Date: Thu, 29 Sep 2022 15:31:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: missing entries from docs/specs/pci-ids.txt ?
Message-ID: <20220929133144.4k6dbwopkljrbkqt@sirius.home.kraxel.org>
References: <CAFEAcA9dcDNw6QvKSs8BZgjzueEPi0v6R5LAPpsiJU3J_p=AXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9dcDNw6QvKSs8BZgjzueEPi0v6R5LAPpsiJU3J_p=AXw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Sep 27, 2022 at 01:05:36PM +0100, Peter Maydell wrote:
> I noticed today that docs/specs/pci-ids.txt doesn't have
> an entry for the virtio-iommu, which is defined in pci.h as
> 
> #define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014
> 
> There seem to be a few other virtio ID values defined in the
> header but not in the txt file too -- do we need to update it?

Yep.

> Conversely, none of the "modern" ID values in the txt file seem
> to have a #define. I suspect I'm missing something about how
> this works.

Added a short paragraph explaining this.

Not sure what to do with the modern device list.  Add everything ?
Or just point to include/standard-headers/linux/virtio_ids.h ?

take care,
  Gerd

commit 4dac16edd97dd7bdf499f3cedd725a6a87523510
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Thu Sep 29 15:25:19 2022 +0200

    pci-ids: sync docs + header
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index dd6859d039d0..628b87c29dfa 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -15,6 +15,9 @@ The 1000 -> 10ff device ID range is used as follows for virtio-pci devices.
 Note that this allocation separate from the virtio device IDs, which are
 maintained as part of the virtio specification.
 
+Modern virtio-pci devices have a strict id mapping and the rule is:
+pci-device-id = 0x1040 + virtio-device-id
+
 1af4:1000  network device (legacy)
 1af4:1001  block device (legacy)
 1af4:1002  balloon device (legacy)
@@ -22,6 +25,10 @@ maintained as part of the virtio specification.
 1af4:1004  SCSI host bus adapter device (legacy)
 1af4:1005  entropy generator device (legacy)
 1af4:1009  9p filesystem device (legacy)
+1af4:1012  vsock device (legacy)
+1af4:1013  pmem device (legacy)
+1af4:1014  iommu device (legacy)
+1af4:1015  mem device (legacy)
 
 1af4:1041  network device (modern)
 1af4:1042  block device (modern)
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b54b6ef88fc3..3b852199660c 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -71,7 +71,12 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_INTEL_82557        0x1229
 #define PCI_DEVICE_ID_INTEL_82801IR      0x2922
 
-/* Red Hat / Qumranet (for QEMU) -- see pci-ids.txt */
+/*
+ * Red Hat / Qumranet (for QEMU)
+ *
+ * These are documented in docs/specs/pci-ids.txt
+ * PLEASE KEEP HEADER + DOCS IN SYNC
+ */
 #define PCI_VENDOR_ID_REDHAT_QUMRANET    0x1af4
 #define PCI_SUBVENDOR_ID_REDHAT_QUMRANET 0x1af4
 #define PCI_SUBDEVICE_ID_QEMU            0x1100


