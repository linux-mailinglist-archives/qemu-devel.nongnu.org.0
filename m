Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0601432A265
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:23:33 +0100 (CET)
Received: from localhost ([::1]:54856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5vw-0004zV-2A
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lH5tw-000477-BV
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:21:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lH5tt-0000ET-05
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:21:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614694884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPtb2onXCNJQivydBBk7bSI4OhV4B1OeZvbfsR5zn18=;
 b=cRppB7zasPrGXebq63vCvj5GBfmcGHeDBUZlSf5kqxohVbCtfsYON7eWszL5fIkqYy/9bU
 moUIA7lYPjdYKlNCMN0M20wwywz0cpddgz8yea4AnuFtEnZ+eKF7iIZV+JPF31d1wx61E5
 foqwWNJAs/P1ShoYiKGY8nc5dGQ1VVU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-wTWrpvlSO5aH1aifc3-gBw-1; Tue, 02 Mar 2021 09:21:19 -0500
X-MC-Unique: wTWrpvlSO5aH1aifc3-gBw-1
Received: by mail-ed1-f70.google.com with SMTP id i6so3995487edq.12
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 06:21:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vPtb2onXCNJQivydBBk7bSI4OhV4B1OeZvbfsR5zn18=;
 b=StFOXmR9Xo0KRsWVxS8L0NQJUBgAL1FELq2JtEuQeLLemelJjv8qzl3DHSvAFerEPR
 3OlPoMt40D/ulncJGBefgPUbODerirpT0mG0Pe1NQ9whDdWY+9lPreFuZJkTg1mnbyw0
 ngvPxOonW8w/isRAMHVkyQ/6xLc2moJwyzraQCmjZ0CTmyI6shv0L/7hhFXT4zhkGP50
 pl5nKMnnkY6i1GTFTkP8jLWkzBHJD1W6/twzBOSIxMJJN/AQ1xtFxnUNFy7oF+PtdGR7
 zB60Q9yVpn+yIa0GZWiKmSuIBUt/MbC18RVtqDWvqhLBvKKCI7e+S/SlzUYqkODqyOLD
 bPYw==
X-Gm-Message-State: AOAM532KtC7UClyphTkLrbA72snHrbWdrykJdpewVQQTLICZjiUPyzBy
 H/y2IuPFWfxAJxWv4jCfAg/1dOmrpeFqIFvzi4lBIhaFfX7yMed2TeZBDZ4TT1j10+dG0E7Bajs
 4LIm5gfwW2v5hyKXzg0mYNcx6XXy7ZexWOxCDMRIMCs413+9NASM3jHD13mSf
X-Received: by 2002:a17:906:a8a:: with SMTP id
 y10mr576016ejf.288.1614694877773; 
 Tue, 02 Mar 2021 06:21:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdHNGMrLa7HDRo/7OleAXiszLQD/n34fzFvVAy3OkGIwKfSQviM9tMU19z7cnNOZVoNj3mMA==
X-Received: by 2002:a17:906:a8a:: with SMTP id
 y10mr576006ejf.288.1614694877646; 
 Tue, 02 Mar 2021 06:21:17 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id de17sm11285699ejc.16.2021.03.02.06.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:21:17 -0800 (PST)
Date: Tue, 2 Mar 2021 09:21:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] hw/pci: Have safer pcie_bus_realize() by checking error
 path
Message-ID: <20210302142014.141135-4-mst@redhat.com>
References: <20210302142014.141135-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210302142014.141135-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

While pci_bus_realize() currently does not use the Error* argument,
it would be an error to leave pcie_bus_realize() setting bus->flags
if pci_bus_realize() had failed.

Fix by using a local Error* and return early (propagating the error)
if pci_bus_realize() failed.

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210201153700.618946-1-philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index fa97a671d1..0eadcdbc9e 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -132,8 +132,13 @@ static void pci_bus_realize(BusState *qbus, Error **errp)
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
MST


