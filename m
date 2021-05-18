Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA33388299
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 00:07:26 +0200 (CEST)
Received: from localhost ([::1]:47876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7s5-0004xf-Er
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 18:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7ha-0007KX-NQ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hR-0003JW-CB
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621374984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ikpWd2OyM2n7rA9VZke1YbE+cyYsUCfVNrvrzcxe5R8=;
 b=LpQA5MWbL86j8Q5mgp1rA0Evf0Wi2qeqCqWZaFNZemePNdkW2/uYDAtVNrM0J66mXYgtLK
 967Jsfp1pb0A5tDjHyqIyp5n3cBxopJCjuOi71f3V0Dfksirh6+3yBuz/gOiIm7PZL2jJf
 s9J5CMImyJ8EW6KkEyDN5gJCOjZFIFg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-N8GucO2ENIqrH5O-KyhzKg-1; Tue, 18 May 2021 17:56:22 -0400
X-MC-Unique: N8GucO2ENIqrH5O-KyhzKg-1
Received: by mail-ej1-f71.google.com with SMTP id
 la2-20020a170906ad82b02903d4bcc8de3bso2943298ejb.4
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 14:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ikpWd2OyM2n7rA9VZke1YbE+cyYsUCfVNrvrzcxe5R8=;
 b=BIDrM52+7yYf34Ag8ttQLToZmQ4/Zq8Jd3mbF7FrpM6M6Z4fq7f/nUPOrnt9/aJqsQ
 PpQPto9lZ1mDAPkRmSGQ98NdsZaH/xQUicRVWTFOUN8TlnOsr/ctBX3VtsZ0pexavKzj
 3KvR7kTCs71LHYqTRi8VlDQb5pEPsnR+3fsPZVFB/gh/6/0Sf8I9ZD2U80vGTbsUzOLt
 Dzvz3tt9V0B750UeNk7b4FArACFH+Y3tu8E39f9FuIyBaNQP2LU+7RpXeEWbp/3ktoFr
 fN8W9KBNM/AhpJWg4BmXsLlUWZjuUx5GJGuX9pr1KtbzPzjPIp7ZxTfv9Rju+TliIW5O
 ln+w==
X-Gm-Message-State: AOAM532BsR5RZtqXiCioMSCg0MoSsYSvv6tStyfI1kHpsq0Z3lYzu3Qu
 pC+zHJdeWeafihdo5TfUfkONu36XgCU5W8lr9dZywa+aIDyHOiZ3sdxu0x7bY1uaf2vavv2yi+w
 aPn9U+0Z8BCFKIhc=
X-Received: by 2002:a50:ff08:: with SMTP id a8mr9299083edu.46.1621374981074;
 Tue, 18 May 2021 14:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9z0vfSzJXYPjIgl8PVjjfHMdAt8ZAsx52ZHlLHu0c47c7R7aZomL11YipaDMH4K8432Wyrw==
X-Received: by 2002:a50:ff08:: with SMTP id a8mr9299076edu.46.1621374980899;
 Tue, 18 May 2021 14:56:20 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id p9sm13752152edu.79.2021.05.18.14.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:56:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 07/11] hw/isa: Simplify isa_get_irq()
Date: Tue, 18 May 2021 23:55:41 +0200
Message-Id: <20210518215545.1793947-8-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

Previous commit removed the calls to isa_get_irq() passing a NULL
ISADevice. Simplify the assertion, removing the use on the global
isabus object.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/isa/isa-bus.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index b946e6dc478..65a26ac6c2c 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -89,7 +89,11 @@ qemu_irq isa_bus_get_irq(ISABus *bus, unsigned isairq)
  */
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
 {
-    assert(!dev || ISA_BUS(qdev_get_parent_bus(DEVICE(dev))) == isabus);
+    ISABus *isabus;
+
+    assert(dev);
+    isabus = isa_bus_from_device(dev);
+
     return isa_bus_get_irq(isabus, isairq);
 }
 
-- 
2.26.3


