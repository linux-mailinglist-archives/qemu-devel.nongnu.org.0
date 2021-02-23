Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C43322E5B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:08:09 +0100 (CET)
Received: from localhost ([::1]:60690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaEK-0008UT-7i
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:08:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaCa-0006mz-Km
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:06:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaCY-0004l9-31
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3FZ7ZRtKozgfzX6BDwaNDLcqm+L2lOrK1/3HIq9dCmY=;
 b=VSFtKWqEK3M6nbqQGP1FwdWgTYHeA/RCbnEVESDz/0Cj0X01TmnzQbWWCtpy9zXD7KRmoW
 vSkWwFXOea+/3FSQObDDWVyZQY9xdcMJhJaRIbSbq3TiHHGVEsAzsc9wH2tbwLAWOXeaP/
 GMpl14uiDZ8n5vQcMH+qaSzpqC7NxkY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-__L6bEE0Ppy5zH665MWbyg-1; Tue, 23 Feb 2021 11:03:59 -0500
X-MC-Unique: __L6bEE0Ppy5zH665MWbyg-1
Received: by mail-wr1-f72.google.com with SMTP id d10so7480256wrq.17
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3FZ7ZRtKozgfzX6BDwaNDLcqm+L2lOrK1/3HIq9dCmY=;
 b=WlIxiooSbRXknLsm1b4Dwp/3AucFhaeVE/YiU3/sjbRZscCKx/++Hu/pv77goaQSup
 /MRNQBhIS5Q0Z++EWhMeWNi2VF1S5M0iLEjuqzZhOy96lVYBqxQh6Y/TXY2vCa4Qao3A
 LtjaeABZuIULPGyEYw0L5AQkQa5d84DzTiwRUHarSU8zgfWaNMK1wMekDEu65WFCysBT
 fmWWkLtLViYLlQOJfgBDYK6EBCujY342me0+Zln7SY5h1fOyMZuvbc2ENEujl7hkNxaa
 /GUQ1W8YXUMF2wybAmTz+IqfnLsv0tWhomr+1FsteKLKAYEVAxb/lTRx/tE8iq2MYLxz
 OHjw==
X-Gm-Message-State: AOAM532ifpfKb9J+U1FM6x0hO9Wes7a25f1LLGsYFvb1q5KycfCc20HK
 ygBaegvBW9V7F07SZXpzws5PcHSSGa/LWJObFfQcqDPO5K/D5epMZpJ+ogFgbji64KgQ1iJkYkh
 Q1AzOk5MxI2XQYp36oa5hETxg7ka9YJ/8ekwCdCoftyL/c5pz3/qoO1J855uS
X-Received: by 2002:a1c:d7:: with SMTP id 206mr25836370wma.68.1614096237414;
 Tue, 23 Feb 2021 08:03:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZ5Iit4oOq3wOSd8R9IvRC8aFHJj+d/Za6u4NjlQu+DfV+FiCX52zAyuRGQFXeaRc3cCQ8xg==
X-Received: by 2002:a1c:d7:: with SMTP id 206mr25836324wma.68.1614096237037;
 Tue, 23 Feb 2021 08:03:57 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id x13sm3902092wmj.2.2021.02.23.08.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:03:56 -0800 (PST)
Date: Tue, 23 Feb 2021 11:03:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/17] acpi/gpex: Fix cca attribute check for pxb device
Message-ID: <20210223160144.1507082-7-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Xingang Wang <wangxingang5@huawei.com>, Yubo Miao <miaoyubo@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

When check DMA support for device attached to pxb,
the cache coherency attribute need to be set.
This add _CCA attribute for pxb DSDT.

Fixes: 6f9765fbad ("acpi/gpex: Build tables for pxb")

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Message-Id: <1612490205-48788-3-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/pci-host/gpex-acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 446912d771..0f01f13a6e 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -175,6 +175,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
             aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
             aml_append(dev, aml_name_decl("_STR", aml_unicode("pxb Device")));
+            aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
             if (numa_node != NUMA_NODE_UNASSIGNED) {
                 aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
             }
-- 
MST


