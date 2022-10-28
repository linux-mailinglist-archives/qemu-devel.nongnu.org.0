Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04C16112AC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:27:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPMZ-0003rO-VP; Fri, 28 Oct 2022 09:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKq-0001LF-Gu
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKo-0005LR-W4
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CrNgYAdJFz2CZSSIzKd69c4Cpi66fcIsjcRetwkj/mE=;
 b=hDs2NoGNARPrQvPRY8CAt/lILH3j+j9SC4SE7sGRTACnzwAVD7MxbF8A+OLhZYazz9V5Vt
 ShjdaoawE4xVxzr63vVymRbWDzQUFraU3ohfUR+X2RtqFnmqSWkkSnDw2IMU2VIrJKagq/
 7BgFpCNjEl7ZBj8yYxm/BPUBcyzxL8Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-Yq3gkfdVM5qk2kvCT_o0Zw-1; Fri, 28 Oct 2022 09:23:41 -0400
X-MC-Unique: Yq3gkfdVM5qk2kvCT_o0Zw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A891F1C05151;
 Fri, 28 Oct 2022 13:23:40 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7592E1121319;
 Fri, 28 Oct 2022 13:23:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 20/21] tests/qtest: libqos: Do not build virtio-9p
 unconditionally
Date: Fri, 28 Oct 2022 15:23:03 +0200
Message-Id: <20221028132304.829103-21-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

At present the virtio-9p related codes are built into libqos
unconditionally. Change to build them conditionally by testing
the 'virtfs' config option.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221028045736.679903-9-bin.meng@windriver.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqos/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 113c80b4e4..32f028872c 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -33,8 +33,6 @@ libqos_srcs = files(
         'sdhci.c',
         'tpci200.c',
         'virtio.c',
-        'virtio-9p.c',
-        'virtio-9p-client.c',
         'virtio-balloon.c',
         'virtio-blk.c',
         'vhost-user-blk.c',
@@ -62,6 +60,10 @@ libqos_srcs = files(
         'x86_64_pc-machine.c',
 )
 
+if have_virtfs
+  libqos_srcs += files('virtio-9p.c', 'virtio-9p-client.c')
+endif
+
 libqos = static_library('qos', libqos_srcs + genh,
                         name_suffix: 'fa',
                         build_by_default: false)
-- 
2.31.1


