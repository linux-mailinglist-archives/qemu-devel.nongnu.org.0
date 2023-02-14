Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 607CB69624D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:23:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtOG-0007St-4c; Tue, 14 Feb 2023 06:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtOC-0007OV-MQ
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtOB-0002Ng-7B
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kU3/X/4ZFlH1woTzD68byBkYBc1xwVczb+6LuOdDp4=;
 b=PilmqMfthsh94hNhoG/OGxnVsdVj/LqDCIFbg2NwGp/T46aC1OlyEQ0HbtkVKoTQxZx7px
 tW2NYADsCMMEId24udYLrPttXhWWnTsGMovWVQtRmWujJfACFEyAwOWetLiCJTSRZgv3Ht
 ug0rXKqScsKaFTkUxbY8V6ygFlMt6QI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-wc2RW2-GNkeFy0tA8SeC6w-1; Tue, 14 Feb 2023 06:22:19 -0500
X-MC-Unique: wc2RW2-GNkeFy0tA8SeC6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E01BD811E6E;
 Tue, 14 Feb 2023 11:22:18 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DA334010E85;
 Tue, 14 Feb 2023 11:22:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>
Subject: [PULL 20/22] tests/qtest: Don't build virtio-serial-test.c if device
 not present
Date: Tue, 14 Feb 2023 12:21:46 +0100
Message-Id: <20230214112148.646077-21-thuth@redhat.com>
In-Reply-To: <20230214112148.646077-1-thuth@redhat.com>
References: <20230214112148.646077-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fabiano Rosas <farosas@suse.de>

The virtconsole device might not be present in the QEMU build that is
being tested.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Message-Id: <20230213210738.9719-5-farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 4110f8afc2..222e1892fb 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -257,10 +257,14 @@ qos_test_ss.add(
   'virtio-net-test.c',
   'virtio-rng-test.c',
   'virtio-scsi-test.c',
-  'virtio-serial-test.c',
   'virtio-iommu-test.c',
   'vmxnet3-test.c',
 )
+
+if config_all_devices.has_key('CONFIG_VIRTIO_SERIAL')
+  qos_test_ss.add(files('virtio-serial-test.c'))
+endif
+
 if config_host.has_key('CONFIG_POSIX')
   qos_test_ss.add(files('e1000e-test.c'))
 endif
-- 
2.31.1


