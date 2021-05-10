Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72D2377D42
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:37:25 +0200 (CEST)
Received: from localhost ([::1]:51526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0Tk-0004rN-PJ
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lg0SF-0001XX-FO
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:35:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lg0S7-0003g8-ML
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620632142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xuZmnVC+Txim4F1iZTL4QU1yzSIp/XLOwkbHdxPC5WE=;
 b=IU0hkjD+APZR4mxTz1GHzSxBQs5xcyzAWJ0dEfVCujY4l9+N2rm7jx8PYohqYmlQisuV/6
 ITWmnM4DwHXjt9+IB7ZJJYFHnuZwcht4V9BufJIFjDFlU0OvXdnOjIQvND7bCUe70u4Oz8
 fNhVEV6RLAx8anH7MT4LRk8g/0iCGfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-3m4eRdrMONmynivRT4rNpQ-1; Mon, 10 May 2021 03:35:38 -0400
X-MC-Unique: 3m4eRdrMONmynivRT4rNpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6CD7801817;
 Mon, 10 May 2021 07:35:36 +0000 (UTC)
Received: from thuth.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51BB217A9B;
 Mon, 10 May 2021 07:35:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/9] pc-bios/s390-ccw/netboot: Use "-Wl,
 " prefix to pass parameter to the linker
Date: Mon, 10 May 2021 09:35:19 +0200
Message-Id: <20210510073524.85951-5-thuth@redhat.com>
In-Reply-To: <20210510073524.85951-1-thuth@redhat.com>
References: <20210510073524.85951-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are using the compiler to do the linking of the bios files. GCC still
accepts the "-Ttext=..." linker flag directly and is smart enough to
pass it to the linker, but in case we are compiling with Clang, we have
to use the official way with the "-Wl," prefix instead.

Message-Id: <20210423153646.593153-1-thuth@redhat.com>
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


