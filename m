Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFD36F68BF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:58:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVi6-0002JS-3x; Thu, 04 May 2023 05:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puVi4-0002Iw-5x
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:57:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puVi2-00071d-LS
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683194229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h80tO33HC7sjInE8GOS+QicJSI6yD7AQUYhSBWamUAI=;
 b=Nys3S8qPKXGOSmkRni30CK0VOPLBq7cjNNpj63vW0V630vzGy7N93Eqc5yEV0RYX1konRW
 PLAZ6UhrlBDNQH6Z8FLFNRgFQTNvsN/OAREsjvi9ujS+U//yD3iyR3bjrr40orc3+ETgNi
 eziYgXVEt3vn0D+c8+/11b3gNS6IvyA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-m1UeufUkM7Wp7utTbi6bNQ-1; Thu, 04 May 2023 05:57:08 -0400
X-MC-Unique: m1UeufUkM7Wp7utTbi6bNQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20426886063;
 Thu,  4 May 2023 09:57:08 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.45.225.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48E10492C13;
 Thu,  4 May 2023 09:57:07 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/6] qga/commands-win32.c: Drop the check for _WIN32_WINNT >=
 0x0601
Date: Thu,  4 May 2023 12:56:56 +0300
Message-Id: <20230504095657.239048-6-kkostiuk@redhat.com>
In-Reply-To: <20230504095657.239048-1-kkostiuk@redhat.com>
References: <20230504095657.239048-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

From: Thomas Huth <thuth@redhat.com>

All current versions of glib require _WIN32_WINNT set to 0x0601
or higher already, and we also use this value as a minimum in our
osdep.h header file, so there is no way to still compile this code
with an older version of the Windows ABI. Thus we can drop this
check now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
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
2.25.1


