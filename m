Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D561FA22C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 22:58:57 +0200 (CEST)
Received: from localhost ([::1]:46610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkwC0-0006Sy-AI
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 16:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuT-0003Iu-L0
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:49 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54216
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuP-0000bD-6j
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2KvmlevNFS28a5MTipW8yjyj0+heohNbh+C/zDhSVU=;
 b=L0eBSe/wGCpwJ+l4JTiPWOvRJ90GZ+IqkVP3uVA7DdlgaNM+zelMesGge6RqtTt415qQfY
 MI5SoBl8eYtWX98DbgWJvn8c7Qfxrqjq0/B4UkL64lt9B4NPpfXmvIoWBFHxbcbD/ViMLy
 UGd87OWtLzO40V/VzVM2g3MSHddRlx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-cptvGJ3qM3qlUJPfKyQp0w-1; Mon, 15 Jun 2020 16:40:42 -0400
X-MC-Unique: cptvGJ3qM3qlUJPfKyQp0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91005873408;
 Mon, 15 Jun 2020 20:40:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 615A77CAB1;
 Mon, 15 Jun 2020 20:40:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D54FA1132DAE; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 51/84] ssi: ssi_create_slave_no_init() is now unused, drop
Date: Mon, 15 Jun 2020 22:39:35 +0200
Message-Id: <20200615204008.3069956-52-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 15:33:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200610053247.1583243-26-armbru@redhat.com>
---
 include/hw/ssi/ssi.h | 1 -
 hw/ssi/ssi.c         | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index 1725b13c32..93f2b8b0be 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -79,7 +79,6 @@ extern const VMStateDescription vmstate_ssi_slave;
 }
 
 DeviceState *ssi_create_slave(SSIBus *bus, const char *name);
-DeviceState *ssi_create_slave_no_init(SSIBus *bus, const char *name);
 
 /* Master interface.  */
 SSIBus *ssi_create_bus(DeviceState *parent, const char *name);
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 58e7d904db..67b48c31cd 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -90,11 +90,6 @@ static const TypeInfo ssi_slave_info = {
     .abstract = true,
 };
 
-DeviceState *ssi_create_slave_no_init(SSIBus *bus, const char *name)
-{
-    return qdev_create(BUS(bus), name);
-}
-
 DeviceState *ssi_create_slave(SSIBus *bus, const char *name)
 {
     DeviceState *dev = qdev_new(name);
-- 
2.26.2


