Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224461E7F37
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 15:51:46 +0200 (CEST)
Received: from localhost ([::1]:34610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jefQH-0004gu-3H
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 09:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKJ-0002ZA-Be
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:35 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43936
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKI-00071N-BW
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590759933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5VTl7TXODL/XliioKkpwYOl0yhnmRReQFsgo487Hg6o=;
 b=atmMdUhIhAhN9fg1FaXCaK7n2HP39tLHUGU+vhKqJoi4Z86HPD7nXrlcSD02xgVYsdyzV8
 L6syx7YrL6B0ryJkb6xMEZwztDvnkYi0s8x8zsi5ZhpKen4ORYIijOxvEviwY2bBmZNlkF
 DAat9xu7oJcS/APCV2RGL75KiIPR0mY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-eNxNqZlwNuWFqFP9ZuLjAw-1; Fri, 29 May 2020 09:45:31 -0400
X-MC-Unique: eNxNqZlwNuWFqFP9ZuLjAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C87DF1005510
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 13:45:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C9905D9F3
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 13:45:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2271B11358D4; Fri, 29 May 2020 15:45:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/58] isa: isa_create(), isa_try_create() are now unused,
 drop
Date: Fri, 29 May 2020 15:44:46 +0200
Message-Id: <20200529134523.8477-22-armbru@redhat.com>
In-Reply-To: <20200529134523.8477-1-armbru@redhat.com>
References: <20200529134523.8477-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 01:27:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/isa/isa.h |  2 --
 hw/isa/isa-bus.c     | 16 ----------------
 2 files changed, 18 deletions(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 3b6215fafe..52b61eed88 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -103,8 +103,6 @@ void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
 IsaDma *isa_get_dma(ISABus *bus, int nchan);
 MemoryRegion *isa_address_space(ISADevice *dev);
 MemoryRegion *isa_address_space_io(ISADevice *dev);
-ISADevice *isa_create(ISABus *bus, const char *name);
-ISADevice *isa_try_create(ISABus *bus, const char *name);
 ISADevice *isa_new(const char *name);
 ISADevice *isa_try_new(const char *name);
 bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp);
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 9a95ac3f96..630985604d 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -160,22 +160,6 @@ static void isa_device_init(Object *obj)
     dev->isairq[1] = -1;
 }
 
-ISADevice *isa_create(ISABus *bus, const char *name)
-{
-    DeviceState *dev;
-
-    dev = qdev_create(BUS(bus), name);
-    return ISA_DEVICE(dev);
-}
-
-ISADevice *isa_try_create(ISABus *bus, const char *name)
-{
-    DeviceState *dev;
-
-    dev = qdev_try_create(BUS(bus), name);
-    return ISA_DEVICE(dev);
-}
-
 ISADevice *isa_new(const char *name)
 {
     return ISA_DEVICE(qdev_new(name));
-- 
2.21.3


