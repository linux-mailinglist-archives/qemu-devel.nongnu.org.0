Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3D638828E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 00:02:47 +0200 (CEST)
Received: from localhost ([::1]:38154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7na-0006gj-7o
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 18:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hr-0007eL-Q5
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hn-0003Sh-IF
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621375006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SA3xLaeZ2FwOXvV1CNVXzUH12bBqCIlfWoPhxP84IQI=;
 b=P/WBThcQSVWClAPkX6WvsfWt6o5zvpLNb3ND20f51JfbIybXjPeFiyYNqfYzoUN/ZLjOnO
 RGbPiZke0VMkNZwqstGgrQUlMqZmTF6nNgblZYFYP8eBLs3lBitzigbuBsIWfBYsRu7udw
 P9MRpsp6uhxQu4fF4kQd+u8pTrBDoqY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-4PypK6bEOomgfjri6KZvcw-1; Tue, 18 May 2021 17:56:41 -0400
X-MC-Unique: 4PypK6bEOomgfjri6KZvcw-1
Received: by mail-ej1-f70.google.com with SMTP id
 n25-20020a170906b319b02903d4dc1bc46cso2948662ejz.2
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 14:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SA3xLaeZ2FwOXvV1CNVXzUH12bBqCIlfWoPhxP84IQI=;
 b=fR/tYPpEfIf2XVvDhwzu81oEfYbrEJ6AxBBtc5GJb4txhye9tCt996mC/xci8KTXaM
 w+wnmFFF+T3XgyUHGYtVmh04huFVQLWtmCRK0aJszvQlwYvwZy8TpVQ9O172vQBOf+lF
 1hN5zGkcYx6E+avnWmwl/SYLHDk4Yq/wqA/SrByNSlES8y2YvAWVv37QUFN1J8ljj93A
 GijB6nmL4ZLvNHPH+20Lh8uH8HXFESHOngkz50nxvtyMtmedQU5/04QVD2aguTtXEuXa
 3QvC8/nLemzPz+aTabEyZE7h3ZyEkuYML1NJe2D1K8+S2jJBahkkhIqWM2vA7wp7/Xl+
 nBZg==
X-Gm-Message-State: AOAM530PPuquAG8Rm26rQO9hnvRbs6kHMuMlpJueRA2WQrVMtH3VFlzX
 lYWGMFQlsCmDsSDrE9Oy+L27tK2em/IU9+BU2bUiodOwXC++pBIj6g04dzVzoMRS4F1696C8TNA
 /Q3ahks6fSrwmtS4=
X-Received: by 2002:a17:906:4806:: with SMTP id
 w6mr8075539ejq.180.1621375000808; 
 Tue, 18 May 2021 14:56:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIQhd3LfebpiOisU4PBvm0zr/zBYoZN4wHTN01wT0PnsApruV3LJ2lfBYIHz4J9PTSqRC+jw==
X-Received: by 2002:a17:906:4806:: with SMTP id
 w6mr8075532ejq.180.1621375000697; 
 Tue, 18 May 2021 14:56:40 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id jt11sm10868407ejb.83.2021.05.18.14.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:56:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 11/11] hw/isa: Rename isabus singleton as 'g_isabus'
Date: Tue, 18 May 2021 23:55:45 +0200
Message-Id: <20210518215545.1793947-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518215545.1793947-1-philmd@redhat.com>
References: <20210518215545.1793947-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To make explicit the isabus singleton isn't used anywhere else,
move it's static declaration locally to isa_bus_new() and rename
it as 'g_isabus'.

Unfortunately we provide the get_system_io() call which expose
an unique I/O bus to a machine, and the ISA bus rely on this I/O
bus, so we can not remove the ISA bus singleton until we remove
the get_system_io() API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/isa/isa-bus.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index a19e3688c28..422eb9615f4 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -26,8 +26,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/isa/isa.h"
 
-static ISABus *isabus;
-
 static void isabus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 static char *isabus_get_fw_dev_path(DeviceState *dev);
 
@@ -55,7 +53,10 @@ static const TypeInfo isa_bus_info = {
 ISABus *isa_bus_new(DeviceState *dev, MemoryRegion* address_space,
                     MemoryRegion *address_space_io, Error **errp)
 {
-    if (isabus) {
+    static ISABus *g_isabus;
+    ISABus *isabus;
+
+    if (g_isabus) {
         error_setg(errp, "Can't create a second ISA bus");
         return NULL;
     }
@@ -67,6 +68,7 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion* address_space,
     isabus = ISA_BUS(qbus_create(TYPE_ISA_BUS, dev, NULL));
     isabus->address_space = address_space;
     isabus->address_space_io = address_space_io;
+    g_isabus = isabus;
     return isabus;
 }
 
-- 
2.26.3


