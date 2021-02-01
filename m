Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A9A30ABB9
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:43:13 +0100 (CET)
Received: from localhost ([::1]:35518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bM8-0004yh-6x
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:43:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6bGG-0006Z5-7I
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:37:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6bGE-00024y-HZ
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:37:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612193826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NiiPUtBQWDN924NgCHiXVlqTEUm0sOxUKiZegSkevc8=;
 b=AKT/YHOsECsCfyGphUMCHDH3dvLS3tPPAgemJ6iiyc3oVexlphMTRkaMDQGvRSgO9dMAt6
 Kgr5GZhEf49cEqRlM2hCw3IbYEg9Z/pkuzTTzp2zHQIxmaBV+Krv/5Tv6KVAKykCKc3tCd
 SbdAhAWyijLJLpYIH0JFWX0BaMceSW4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-f9qFEbrTPvi7ILMp1B-mJQ-1; Mon, 01 Feb 2021 10:37:04 -0500
X-MC-Unique: f9qFEbrTPvi7ILMp1B-mJQ-1
Received: by mail-ed1-f72.google.com with SMTP id w14so610078edv.6
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:37:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NiiPUtBQWDN924NgCHiXVlqTEUm0sOxUKiZegSkevc8=;
 b=TJLORYcS34ggeBHSCxactiAYsQh9K/z2B0D6IZwGZmv0l4qm+D0xURi3bn0409j2ct
 677tQkjAZrxI2eGv93tc4RZ7AaixSe3kCFK7NFEpP/EB31LFeWXJlnSrhSKXWmXIEl7K
 jkM4Ys35p3emfP/gEztEJcKLmhV9MtFcKrlAJfgQHxJEkyWlbRdufniXo7xjHweGxm6L
 4rZH9tDzljh2895QaYlAKylEbV1lPvdqvkW/hbGvmNyMC+OR6n7ruMjLMUnTxCYq134c
 CMyIhLe6cjQYWbjJLdRQOl2xXkKNcPZ+9tbsKn+72WRkI/dIPUzHMQc6AGPhKC3oFHHh
 qgjA==
X-Gm-Message-State: AOAM531lYvo1T+GGDE35FZ4/iOIPhGOAvpABWwy213aYfrTBwOctsulQ
 FcJAFfJ7xgaDU3GLDqLWpA21NvKCcdBVUJ5eCEA6cGmKdCCkfMd4FtnvkdR59AGfO16be9jzuGQ
 ZxdmVJgxlwOJO0WzkPtH3dKzfKc39E9yEAHaZQa+KdMLKgZT5ySUMIqPCRW5flfKN
X-Received: by 2002:a17:906:8617:: with SMTP id
 o23mr5994849ejx.289.1612193822888; 
 Mon, 01 Feb 2021 07:37:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBhQARvhvSGmU091A6RhUM0w5GOuCNzGgufBftNqzbhuVuAN/9VyZ14eNGU7SxigHmr8r9fw==
X-Received: by 2002:a17:906:8617:: with SMTP id
 o23mr5994822ejx.289.1612193822591; 
 Mon, 01 Feb 2021 07:37:02 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id i18sm8694276edt.68.2021.02.01.07.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 07:37:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/pci: Have safer pcie_bus_realize() by checking error path
Date: Mon,  1 Feb 2021 16:37:00 +0100
Message-Id: <20210201153700.618946-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While pci_bus_realize() currently does not use the Error* argument,
it would be an error to leave pcie_bus_realize() setting bus->flags
if pci_bus_realize() had failed.

Fix by using a local Error* and return early (propagating the error)
if pci_bus_realize() failed.

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/pci/pci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 512e9042ffa..0d12e94a02e 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -130,8 +130,13 @@ static void pci_bus_realize(BusState *qbus, Error **errp)
 static void pcie_bus_realize(BusState *qbus, Error **errp)
 {
     PCIBus *bus = PCI_BUS(qbus);
+    Error *local_err = NULL;
 
-    pci_bus_realize(qbus, errp);
+    pci_bus_realize(qbus, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
     /*
      * A PCI-E bus can support extended config space if it's the root
-- 
2.26.2


