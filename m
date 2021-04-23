Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5836964A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:38:16 +0200 (CEST)
Received: from localhost ([::1]:37586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZxsl-0004JH-Tc
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZxrY-0003mn-4h
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:37:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lZxrT-0002uh-Ak
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619192214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=halc/LbLh6Q0bmhbP1ngY9m8ixo3j+UukUZ+QidpBOs=;
 b=bvcpXhe8LxZr8XuR7dUTYEATxkXP6WluQn4l67blVhhAU3FbNdNhU9242LGxaDp9VNXxQ9
 TxQIqKVMD/7eb59/KHcDoicvzth8XTn3KiKKDgglem7GOY3N5gj4Gua3TEUGXW7Ayzq77x
 Z1PT6IzIyUr5Bth6/cRF/VVeJudcCJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-PDCTyWYGOg-t1NeZ1Ue5jw-1; Fri, 23 Apr 2021 11:36:52 -0400
X-MC-Unique: PDCTyWYGOg-t1NeZ1Ue5jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27D3887504E;
 Fri, 23 Apr 2021 15:36:51 +0000 (UTC)
Received: from thuth.com (ovpn-115-143.ams2.redhat.com [10.36.115.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF65860BE5;
 Fri, 23 Apr 2021 15:36:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH] pc-bios/s390-ccw/netboot: Use "-Wl,
 " prefix to pass parameter to the linker
Date: Fri, 23 Apr 2021 17:36:46 +0200
Message-Id: <20210423153646.593153-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are using the compiler to do the linking of the bios files. GCC still
accepts the "-Ttext=..." linker flag directly and is smart enough to
pass it to the linker, but in case we are compiling with Clang, we have
to use the official way with the "-Wl," prefix instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/netboot.mak | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/netboot.mak b/pc-bios/s390-ccw/netboot.mak
index 577c023afe..68b4d7edcb 100644
--- a/pc-bios/s390-ccw/netboot.mak
+++ b/pc-bios/s390-ccw/netboot.mak
@@ -6,7 +6,7 @@ NETOBJS := start.o sclp.o cio.o virtio.o virtio-net.o jump2ipl.o netmain.o
 LIBC_INC := -nostdinc -I$(SLOF_DIR)/lib/libc/include
 LIBNET_INC := -I$(SLOF_DIR)/lib/libnet
 
-NETLDFLAGS := $(LDFLAGS) -Ttext=0x7800000
+NETLDFLAGS := $(LDFLAGS) -Wl,-Ttext=0x7800000
 
 $(NETOBJS): QEMU_CFLAGS += $(LIBC_INC) $(LIBNET_INC)
 
-- 
2.27.0


