Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C421F4D37
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 07:48:00 +0200 (CEST)
Received: from localhost ([::1]:50826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jitah-0000r7-7Y
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 01:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jitMO-0005CD-4d
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 01:33:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60094
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jitMB-0003q6-16
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 01:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591767178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+NkMDqZeRBUaF51M/Hju3OELb2hUQyY4kh0/LSnpLg=;
 b=L2V5nmz+RUSPz5osDqYuelJjPhiJXwXysngRI3lPQ+Vfq6mc9Z8cOlNpBg0E3ESrVX58w0
 F1jpoK4krnAwVAEsxjo0VZUfQNlPCBEsjU+QtqNxZJKi2gobxmrMiJ53B2ncH9dkqPoDHI
 oU2ZFLWwvSdMsDyIDc3hE+KOWXzZ12o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-wfeBEbsNPzKXyj46JLvgvg-1; Wed, 10 Jun 2020 01:32:56 -0400
X-MC-Unique: wfeBEbsNPzKXyj46JLvgvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20419107ACCA;
 Wed, 10 Jun 2020 05:32:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5A2D768AE;
 Wed, 10 Jun 2020 05:32:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40A4E113846F; Wed, 10 Jun 2020 07:32:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v3 25/58] ssi: ssi_create_slave_no_init() is now unused, drop
Date: Wed, 10 Jun 2020 07:32:14 +0200
Message-Id: <20200610053247.1583243-26-armbru@redhat.com>
In-Reply-To: <20200610053247.1583243-1-armbru@redhat.com>
References: <20200610053247.1583243-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 21:17:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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


