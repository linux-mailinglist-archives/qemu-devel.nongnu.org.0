Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E5264DCA
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 20:52:10 +0200 (CEST)
Received: from localhost ([::1]:39800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGRg1-0008G8-RY
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 14:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGRCx-0006BD-Ue
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 14:22:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38063
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGRCp-00039n-5e
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 14:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599762118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncs7KEkYHphjI8S3rFJ9Ju5y7UB7QlFM00ehWjI50qQ=;
 b=dADer8CgYXesJwE0UXyxIWe3cgQIzIFoPOJgoy1YpAAJwPxYe3yeSZ8i7PODP1xVw7vGcl
 SpH+U1jgpbFNt8nJ29209vd/+8h6VJVre4ahJLoHgeNmkfDkJPQmpLSiA8r8/x5rAE11F8
 JxTeJAowbXmfQJSIcJW9Bn13XCCWOl0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-hbVoXi25N4u6xLfTsFP0Lg-1; Thu, 10 Sep 2020 14:21:56 -0400
X-MC-Unique: hbVoXi25N4u6xLfTsFP0Lg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A98021DE05;
 Thu, 10 Sep 2020 18:21:55 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58EC019C78;
 Thu, 10 Sep 2020 18:21:55 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 32/33] vhost-user-vga: Use typedef name for instance_size
Date: Thu, 10 Sep 2020 14:21:11 -0400
Message-Id: <20200910182112.4030917-33-ehabkost@redhat.com>
In-Reply-To: <20200910182112.4030917-1-ehabkost@redhat.com>
References: <20200910182112.4030917-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 08:35:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


