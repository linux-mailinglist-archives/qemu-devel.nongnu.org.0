Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F2C262279
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 00:13:09 +0200 (CEST)
Received: from localhost ([::1]:54752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFlrQ-00033p-30
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 18:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kFlYY-0005gB-Vz
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 17:53:39 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27173
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kFlYU-0001Mh-Tx
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 17:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599602009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncs7KEkYHphjI8S3rFJ9Ju5y7UB7QlFM00ehWjI50qQ=;
 b=VEJFaUt3kbGp38wm1kmA3y8dZGolvHKwNYLOf4lZMDbpLYpKie9AABqHcGz6FC+3MCA9lK
 uLwNWRHeZZOBz9idWT2dJMClt/ZVqloogwDEAUbUnB2uMI/N8TNq1EvU+JiVQ6Jt+vREv4
 CAvPZ8QODu+ZUYjjmWcdKV+LmGJ5OQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-12Eqfj-mOH2_I4vJC-sYtQ-1; Tue, 08 Sep 2020 17:53:27 -0400
X-MC-Unique: 12Eqfj-mOH2_I4vJC-sYtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0FF21091064;
 Tue,  8 Sep 2020 21:53:26 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B9D73A40;
 Tue,  8 Sep 2020 21:53:26 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 33/34] vhost-user-vga: Use typedef name for instance_size
Date: Tue,  8 Sep 2020 17:52:38 -0400
Message-Id: <20200908215239.3519638-34-ehabkost@redhat.com>
In-Reply-To: <20200908215239.3519638-1-ehabkost@redhat.com>
References: <20200908215239.3519638-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This makes the code consistent with the rest of QOM code in QEMU,
and will make automated conversion to type declaration macros
simpler.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20200824215936.2961951-6-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/display/vhost-user-vga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/vhost-user-vga.c b/hw/display/vhost-user-vga.c
index 7110ea6231..a34a99856d 100644
--- a/hw/display/vhost-user-vga.c
+++ b/hw/display/vhost-user-vga.c
@@ -41,7 +41,7 @@ static void vhost_user_vga_inst_initfn(Object *obj)
 static const VirtioPCIDeviceTypeInfo vhost_user_vga_info = {
     .generic_name  = TYPE_VHOST_USER_VGA,
     .parent        = TYPE_VIRTIO_VGA_BASE,
-    .instance_size = sizeof(struct VhostUserVGA),
+    .instance_size = sizeof(VhostUserVGA),
     .instance_init = vhost_user_vga_inst_initfn,
 };
 
-- 
2.26.2


