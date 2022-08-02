Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1379587D50
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:43:50 +0200 (CEST)
Received: from localhost ([::1]:58450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIsBZ-0005tI-Pa
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs64-0003Xz-Pg
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs63-0002a5-1A
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659447485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8s0xXFthbNdHiX3aLnACAnZtp3l56TbrxVaf8KuEF6k=;
 b=GBFxVAFFBhlXvshA+fsrNydG5sDkLK06WSfrTXodVTcSz4z6kgOBuYxMZiszVOfbRiEqJd
 Muc/qGZhDAS7j2jLjbdgs9a+P0+8GHdyHeLp/Pk18VhYkM0tVkr0ToNSLasJSsOph2bLqy
 gcg0bdafHhHHsz7J4Hi5UtxXtwkuZd8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-z7CufGorN0Shx1MpCZZKLQ-1; Tue, 02 Aug 2022 09:38:04 -0400
X-MC-Unique: z7CufGorN0Shx1MpCZZKLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AB2685A586;
 Tue,  2 Aug 2022 13:38:04 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56F4C2166B26;
 Tue,  2 Aug 2022 13:38:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 2/7] libvduse: Fix the incorrect function name
Date: Tue,  2 Aug 2022 15:37:52 +0200
Message-Id: <20220802133757.138016-3-kwolf@redhat.com>
In-Reply-To: <20220802133757.138016-1-kwolf@redhat.com>
References: <20220802133757.138016-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xie Yongji <xieyongji@bytedance.com>

In vduse_name_is_valid(), we actually check whether
the name is invalid or not. So let's change the
function name to vduse_name_is_invalid() to match
the behavior.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220706095624.328-2-xieyongji@bytedance.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 subprojects/libvduse/libvduse.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 9a2bcec282..6374933881 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -1193,7 +1193,7 @@ static int vduse_dev_init(VduseDev *dev, const char *name,
     return 0;
 }
 
-static inline bool vduse_name_is_valid(const char *name)
+static inline bool vduse_name_is_invalid(const char *name)
 {
     return strlen(name) >= VDUSE_NAME_MAX || strstr(name, "..");
 }
@@ -1242,7 +1242,7 @@ VduseDev *vduse_dev_create_by_name(const char *name, uint16_t num_queues,
     VduseDev *dev;
     int ret;
 
-    if (!name || vduse_name_is_valid(name) || !ops ||
+    if (!name || vduse_name_is_invalid(name) || !ops ||
         !ops->enable_queue || !ops->disable_queue) {
         fprintf(stderr, "Invalid parameter for vduse\n");
         return NULL;
@@ -1276,7 +1276,7 @@ VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
     struct vduse_dev_config *dev_config;
     size_t size = offsetof(struct vduse_dev_config, config);
 
-    if (!name || vduse_name_is_valid(name) ||
+    if (!name || vduse_name_is_invalid(name) ||
         !has_feature(features,  VIRTIO_F_VERSION_1) || !config ||
         !config_size || !ops || !ops->enable_queue || !ops->disable_queue) {
         fprintf(stderr, "Invalid parameter for vduse\n");
-- 
2.35.3


