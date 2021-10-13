Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF6842BDA2
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:46:32 +0200 (CEST)
Received: from localhost ([::1]:45804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mabmK-0001dR-0b
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mabhh-0002WN-VP
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mabhg-0006s3-Cn
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634121703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3wYyhah5TBD+5tb0f6Fmglz6xziVK7NNaX1k9BXRGA=;
 b=Ir7EGoblJwJV2gpLo9GqB3z8ChEDnJgN9UOjwt0kv4WO5rQaCr95staU8palDT2UXFmbMh
 p/iZLDUhwO+sU1rmI174ZHzKINCrUCStJ4VPFNiBDR/noYO0BVOb9tjYNqXpoPnJB+MvxV
 98ettIMQfUjthuW9BLov963YpVJE9+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-kLb36IpyOSGmbDfXBZ-wbA-1; Wed, 13 Oct 2021 06:41:40 -0400
X-MC-Unique: kLb36IpyOSGmbDfXBZ-wbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97C2410A8E02;
 Wed, 13 Oct 2021 10:41:39 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DC6F5D9D5;
 Wed, 13 Oct 2021 10:40:12 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 13/15] vhost-user: Increase VHOST_USER_MAX_RAM_SLOTS to
 496 with CONFIG_VIRTIO_MEM
Date: Wed, 13 Oct 2021 12:33:28 +0200
Message-Id: <20211013103330.26869-14-david@redhat.com>
In-Reply-To: <20211013103330.26869-1-david@redhat.com>
References: <20211013103330.26869-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's increase the number of slots to 4096 to allow for increased
flexibility with virtio-mem when dealing with large virtio-mem devices
that start out small.

In the future, we might want to look into some performance improvements,
but for now there isn't really anything stopping us from raising the
limit.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/vhost-user.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2c8556237f..1c6a720728 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -24,6 +24,7 @@
 #include "sysemu/cryptodev.h"
 #include "migration/migration.h"
 #include "migration/postcopy-ram.h"
+#include CONFIG_DEVICES
 #include "trace.h"
 
 #include <sys/ioctl.h>
@@ -45,8 +46,10 @@
  * the maximum number supported by the target
  * hardware plaform.
  */
-#if defined(TARGET_X86) || defined(TARGET_X86_64) || \
-    defined(TARGET_ARM) || defined(TARGET_ARM_64)
+#if defined(CONFIG_VIRTIO_MEM)
+#define VHOST_USER_MAX_RAM_SLOTS 4096
+#elif defined(TARGET_X86) || defined(TARGET_X86_64) || \
+      defined(TARGET_ARM) || defined(TARGET_ARM_64)
 #include "hw/acpi/acpi.h"
 #define VHOST_USER_MAX_RAM_SLOTS ACPI_MAX_RAM_SLOTS
 
-- 
2.31.1


