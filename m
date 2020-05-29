Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CD41E7F5C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 15:56:22 +0200 (CEST)
Received: from localhost ([::1]:57466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jefUj-0005ek-AJ
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 09:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKK-0002c6-7x
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27888
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKI-00071v-SJ
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590759934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jkawstJ+eTtlrC7l+Q1NnZOD+/PLJHhlF7FVFA1/FQM=;
 b=SeGFfTA4WfXsHT0IiPH0t8cQicSt0CqIRZOg9DxxdHtlBYDFXkRk9sY6G186rJRSRGIeKK
 Yn55GTEHrt0qjN7o19/RiLB0uDKd7WsqS3G9NSFLm5lSTXWMB7jPzAsqgSJekLjb8DtWJN
 QP50TJYZLkVljiidOi2IOQyV2n5m8qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-ezKnBbR0NEW8DNrLjRE6BQ-1; Fri, 29 May 2020 09:45:32 -0400
X-MC-Unique: ezKnBbR0NEW8DNrLjRE6BQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6257218FE864;
 Fri, 29 May 2020 13:45:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 287AF5C1B0;
 Fri, 29 May 2020 13:45:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 30D1411358D9; Fri, 29 May 2020 15:45:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/58] ssi: ssi_create_slave_no_init() is now unused, drop
Date: Fri, 29 May 2020 15:44:50 +0200
Message-Id: <20200529134523.8477-26-armbru@redhat.com>
In-Reply-To: <20200529134523.8477-1-armbru@redhat.com>
References: <20200529134523.8477-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 23:43:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
2.21.3


