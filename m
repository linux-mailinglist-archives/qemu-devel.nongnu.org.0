Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C05E23C9B8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 12:02:34 +0200 (CEST)
Received: from localhost ([::1]:41008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3GFl-0006Ui-C1
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 06:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3GBf-0001SD-Fe
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 05:58:19 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25266
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3GBd-0008Uy-QH
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 05:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596621497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=LtZEzYneV122+4SlhLUgLrkSWw8f4SHDCvejXOhjpGA=;
 b=C0oDC3dzyOnY4f4J1Cl31iMMdV4j6/n8JJjR3c8iHRxSCr9BSV/EvfaTUnN2/VFMldG0Mt
 EENBHLOyDF+DaHlm0x4j8eR1BPFT5GCAHt7JTqVGWOaQAHjojB8KcbEM4rrGrrpN7n7mUf
 8M12wrLbxTnSHjdHpgscHq1G1TERFQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-p95vI8k3MWaDeWabmgkxHQ-1; Wed, 05 Aug 2020 05:58:12 -0400
X-MC-Unique: p95vI8k3MWaDeWabmgkxHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4232910082EC;
 Wed,  5 Aug 2020 09:58:11 +0000 (UTC)
Received: from thuth.com (ovpn-112-142.ams2.redhat.com [10.36.112.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 164DB2DE7E;
 Wed,  5 Aug 2020 09:58:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/6] Get rid of the libqemustub.a remainders
Date: Wed,  5 Aug 2020 11:57:55 +0200
Message-Id: <20200805095755.16414-7-thuth@redhat.com>
In-Reply-To: <20200805095755.16414-1-thuth@redhat.com>
References: <20200805095755.16414-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 03:37:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

libqemustub.a has been removed in commit ebedb37c8d ("Makefile: Remove
libqemustub.a"). Some remainders have been missed. Remove them now.

Message-Id: <20200804170055.2851-8-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Makefile                                | 2 +-
 scripts/coverity-scan/run-coverity-scan | 3 ---
 tests/test-util-sockets.c               | 3 ++-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index c2120d8d48..13dd708c4a 100644
--- a/Makefile
+++ b/Makefile
@@ -726,7 +726,7 @@ virtiofsd$(EXESUF): $(virtiofsd-obj-y) libvhost-user.a $(COMMON_LDADDS)
 	$(call LINK, $^)
 endif
 
-vhost-user-gpu$(EXESUF): $(vhost-user-gpu-obj-y) $(libvhost-user-obj-y) libqemuutil.a libqemustub.a
+vhost-user-gpu$(EXESUF): $(vhost-user-gpu-obj-y) $(libvhost-user-obj-y) libqemuutil.a
 	$(call LINK, $^)
 
 ifdef CONFIG_VHOST_USER_INPUT
diff --git a/scripts/coverity-scan/run-coverity-scan b/scripts/coverity-scan/run-coverity-scan
index 03a791dec9..6eefb4b558 100755
--- a/scripts/coverity-scan/run-coverity-scan
+++ b/scripts/coverity-scan/run-coverity-scan
@@ -403,9 +403,6 @@ echo "Configuring..."
     --enable-mpath --enable-libxml2 --enable-glusterfs \
     --enable-virtfs --enable-zstd
 
-echo "Making libqemustub.a..."
-make libqemustub.a
-
 echo "Running cov-build..."
 rm -rf cov-int
 mkdir cov-int
diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c
index 2ca1e99f17..261dc48c03 100644
--- a/tests/test-util-sockets.c
+++ b/tests/test-util-sockets.c
@@ -64,7 +64,8 @@ int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)
     return dup(mon_fd);
 }
 
-/* Syms in libqemustub.a are discarded at .o file granularity.
+/*
+ * Syms of stubs in libqemuutil.a are discarded at .o file granularity.
  * To replace monitor_get_fd() we must ensure everything in
  * stubs/monitor.c is defined, to make sure monitor.o is discarded
  * otherwise we get duplicate syms at link time.
-- 
2.18.1


