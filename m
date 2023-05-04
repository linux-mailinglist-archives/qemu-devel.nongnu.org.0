Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84D76F6659
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 09:55:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puTnT-000334-09; Thu, 04 May 2023 03:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puTnP-00032g-LC
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:54:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puTnN-0003MC-NE
 for qemu-devel@nongnu.org; Thu, 04 May 2023 03:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683186872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xgrsk0eyD56ZiZZ1n/9OgX4iOmcXuvIUYWxL7rv2OXE=;
 b=HwPQe0hOsrnEAQm4QquNMuNOPrWO2dD9eA8bbCXm+YOl7fHWlw+qONV1TrlYmhMdfFLLD0
 WB3ADCa1J2oPIVqCZyhwwPwleF/08eSzuv9WWKyTByTMlMsSQOzfCOk3d5Utiv+RYKVr4Q
 QFK2EwXYACUGeht9PCR+Bcd7TPMa7NQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-x22mttYTPnS1URPL6bmXGw-1; Thu, 04 May 2023 03:54:12 -0400
X-MC-Unique: x22mttYTPnS1URPL6bmXGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4385B3806729;
 Thu,  4 May 2023 07:54:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60E7A1121331;
 Thu,  4 May 2023 07:54:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Cc: "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH] qga/commands-win32.c: Drop the check for _WIN32_WINNT >=
 0x0601
Date: Thu,  4 May 2023 09:54:09 +0200
Message-Id: <20230504075409.121515-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All current versions of glib require _WIN32_WINNT set to 0x0601
or higher already, and we also use this value as a minimum in our
osdep.h header file, so there is no way to still compile this code
with an older version of the Windows ABI. Thus we can drop this
check now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qga/commands-win32.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index b5fee6a2cd..d23875264f 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -484,7 +484,6 @@ static GuestDiskBusType win2qemu[] = {
     [BusTypeSata] = GUEST_DISK_BUS_TYPE_SATA,
     [BusTypeSd] =  GUEST_DISK_BUS_TYPE_SD,
     [BusTypeMmc] = GUEST_DISK_BUS_TYPE_MMC,
-#if (_WIN32_WINNT >= 0x0601)
     [BusTypeVirtual] = GUEST_DISK_BUS_TYPE_VIRTUAL,
     [BusTypeFileBackedVirtual] = GUEST_DISK_BUS_TYPE_FILE_BACKED_VIRTUAL,
     /*
@@ -492,7 +491,6 @@ static GuestDiskBusType win2qemu[] = {
      */
     [BusTypeSpaces] = GUEST_DISK_BUS_TYPE_UNKNOWN,
     [BusTypeNvme] = GUEST_DISK_BUS_TYPE_NVME,
-#endif
 };
 
 static GuestDiskBusType find_bus_type(STORAGE_BUS_TYPE bus)
-- 
2.31.1


