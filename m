Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F6D619CC5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:14:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzJT-0007XB-E6; Fri, 04 Nov 2022 12:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oqzJH-0007IR-Ud
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:12:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oqzJG-00009C-Fy
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:12:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667578365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+Dtv2GvyfaHdqaWlIeZLp8NbKnNhdasb5YmvQdBEMg=;
 b=EMgfARImPJPrTZLfeEd8jpykgqP5sNiSIdkyxADl5KUX4VHzd6tpcFQGjOOqO4Hblch17z
 iOuDjTvUDtCVySKlm/O/NmONWNXQ88KTFXLM2oDERUe+FZ2mYw/cOw4PNsxK67SHw80cee
 YZ4DkqPW0vXb/b5yMP57Gdx1jsBi364=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-qPC2TPkuMKySLctdqfcrLA-1; Fri, 04 Nov 2022 12:12:44 -0400
X-MC-Unique: qPC2TPkuMKySLctdqfcrLA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9C19800186
 for <qemu-devel@nongnu.org>; Fri,  4 Nov 2022 16:12:43 +0000 (UTC)
Received: from [172.30.42.193] (unknown [10.22.17.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCE8540C835A;
 Fri,  4 Nov 2022 16:12:43 +0000 (UTC)
Subject: [PULL 1/1] vfio/migration: Fix wrong enum usage
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com
Date: Fri, 04 Nov 2022 10:12:43 -0600
Message-ID: <166757835382.2504527.15205692838331854517.stgit@omen>
In-Reply-To: <166757797349.2504527.17538714015825495328.stgit@omen>
References: <166757797349.2504527.17538714015825495328.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Avihai Horon <avihaih@nvidia.com>

vfio_migration_init() initializes VFIOMigration->device_state using enum
of VFIO migration protocol v2. Current implemented protocol is v1 so v1
enum should be used. Fix it.

Fixes: 429c72800654 ("vfio/migration: Fix incorrect initialization value for parameters in VFIOMigration")
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Link: https://lore.kernel.org/r/20221016085752.32740-1-avihaih@nvidia.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/migration.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 3de4252111ee..c74453e0b5e0 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -806,7 +806,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     }
 
     vbasedev->migration = g_new0(VFIOMigration, 1);
-    vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
+    vbasedev->migration->device_state = VFIO_DEVICE_STATE_V1_RUNNING;
     vbasedev->migration->vm_running = runstate_is_running();
 
     ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,



