Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B004041BB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 01:22:51 +0200 (CEST)
Received: from localhost ([::1]:54428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO6u2-0002i6-UW
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 19:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6sS-00082T-Tz
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:21:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO6sQ-00033k-Dm
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 19:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631143269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=geCiN4saZ2frlXmhHZT44DYe1b4J1aCN7Xj/FRob9pQ=;
 b=Ej2G0uBDOnT4bgcRFr2XEZEQUaG9J7w5/mINcOg8a7am3t3rPUNysiTDy+w+eF/s/VuT+p
 mpc/4x9/mFF+0a9ML2HKhbOG9Joibj5TnStWRA1B3TvQW6aDVAK0DwzSi8orDEbEPssqdn
 Ognn3BuVOzsI74EyAQEykqlVYpt2uBY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-aan1HTk1N_e0Y_MnT3-Gkg-1; Wed, 08 Sep 2021 19:21:08 -0400
X-MC-Unique: aan1HTk1N_e0Y_MnT3-Gkg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p29-20020a1c545d000000b002f88d28e1f1so437wmi.7
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 16:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=geCiN4saZ2frlXmhHZT44DYe1b4J1aCN7Xj/FRob9pQ=;
 b=BkPGRn8shSyfQRCflDnrXuSwqoyTlj6X7hQ+py+FzOou5+r887bnUxYBofrNpeZM4U
 pdDCR4gU2GU0JdB1d0Cw/E1oDT+3OgVJk5bgg9huPqy5F9u/zoWd0bWaCr4U+VWK/3wa
 RVzgkyIlrpirCJHjgMqvGASjhxWBuNwBWOcfVW5zk72/tIDQ/Q7UoCI2cOhikxos2d9P
 GXXWnsJ2c+AIe5l3c6Z8yTWg+z1hbX6aIhb/MG+EC3iVTqxljyNFlS1QWsaXlKl3nPa9
 rE8fjcgIqhHKccH8FY7y3iUS1AOfrwnZYQ1fb5GD1sTYW8pmyv1EmoFJnll69TLOu2hf
 QhTw==
X-Gm-Message-State: AOAM531Mv5FMD5OEfpw/bl8+Y/jNTcOLT8nH80ebcpMSnJmBTwiNBu2G
 W9rBFfYDr1/94zHFvwbmXWVa8Ec1XhQql4BxKaHLJbFW7zSrXwXfkPqr9HwhkZcf/JxXujtsqx7
 69EvLn/CtUk8UJIdLB0MuwirFz+QCVRgxN/jnS03CQQkSWSQS5vQLl3wiiYh9WgHy
X-Received: by 2002:a05:600c:3b84:: with SMTP id
 n4mr5902116wms.50.1631143265125; 
 Wed, 08 Sep 2021 16:21:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCzGiWOShaEshb6oqBDiWr1/WLhbErNDpTZCYYbU0bD2w0oJKgL2kMezD9hKtqCektWiLpSA==
X-Received: by 2002:a05:600c:3b84:: with SMTP id
 n4mr5902087wms.50.1631143264855; 
 Wed, 08 Sep 2021 16:21:04 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t18sm13191wrp.97.2021.09.08.16.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 16:21:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/10] hw/misc: Mark testdev devices as unsafe
Date: Thu,  9 Sep 2021 01:20:22 +0200
Message-Id: <20210908232024.2399215-9-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.393, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/hyperv/hyperv_testdev.c | 1 +
 hw/misc/pc-testdev.c       | 1 +
 hw/misc/pci-testdev.c      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/hyperv/hyperv_testdev.c b/hw/hyperv/hyperv_testdev.c
index 9a56ddf83fe..6a75c350389 100644
--- a/hw/hyperv/hyperv_testdev.c
+++ b/hw/hyperv/hyperv_testdev.c
@@ -310,6 +310,7 @@ static void hv_test_dev_class_init(ObjectClass *klass, void *data)
 
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->realize = hv_test_dev_realizefn;
+    dc->taints_security_policy = true;
 }
 
 static const TypeInfo hv_test_dev_info = {
diff --git a/hw/misc/pc-testdev.c b/hw/misc/pc-testdev.c
index e3896518694..6294b80ec1b 100644
--- a/hw/misc/pc-testdev.c
+++ b/hw/misc/pc-testdev.c
@@ -199,6 +199,7 @@ static void testdev_class_init(ObjectClass *klass, void *data)
 
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->realize = testdev_realizefn;
+    dc->taints_security_policy = true;
 }
 
 static const TypeInfo testdev_info = {
diff --git a/hw/misc/pci-testdev.c b/hw/misc/pci-testdev.c
index 03845c8de34..189eb9bf1bb 100644
--- a/hw/misc/pci-testdev.c
+++ b/hw/misc/pci-testdev.c
@@ -340,6 +340,7 @@ static void pci_testdev_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->reset = qdev_pci_testdev_reset;
     device_class_set_props(dc, pci_testdev_properties);
+    dc->taints_security_policy = true;
 }
 
 static const TypeInfo pci_testdev_info = {
-- 
2.31.1


