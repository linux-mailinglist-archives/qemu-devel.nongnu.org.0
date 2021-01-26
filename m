Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB33304550
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 18:30:20 +0100 (CET)
Received: from localhost ([::1]:54390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4SAV-0007JW-9N
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 12:30:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4S4O-0003JK-Ee
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:24:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4S4K-0002Xh-Rb
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:24:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611681835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ca/H9QVfBUYdHSazke7XaN3ct7XsBsijmAhW2XHSOJA=;
 b=CTMx+vfeWAeaTIqxQGl9n6+gcT6Euq9dQto3TT0DhsQfPSMauCiZBaj49ttid+XKpf375s
 ltzxNBR1neUQuj0/SuJX1jH2y+Wjtb2baiTlSk0LKmq5I48WpgIoctxXZR4V1v2YqWqvWi
 28h4AA0BoHhPOjcNfgXdmskLprmmmxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-XcoAYOjOO4OM9UHi2r1QoA-1; Tue, 26 Jan 2021 12:23:53 -0500
X-MC-Unique: XcoAYOjOO4OM9UHi2r1QoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 273EE1842140;
 Tue, 26 Jan 2021 17:23:52 +0000 (UTC)
Received: from thuth.com (ovpn-112-182.ams2.redhat.com [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 695B16B8D4;
 Tue, 26 Jan 2021 17:23:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci.yml: Exclude some redundant targets in
 build-without-default-features
Date: Tue, 26 Jan 2021 18:23:45 +0100
Message-Id: <20210126172345.15947-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, cohuck@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The build-without-default-features job is running quite long and sometimes
already hits the 1h time limit. Exclude some targets which do not provide
additional test coverage here (since we e.g. also already test other targets
of the same type, just with different endianess, or a 64-bit superset) to
avoid that we hit the timeout here so easily.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e2f9c99e27..8e0416f11b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -610,6 +610,7 @@ build-without-default-features:
   variables:
     IMAGE: debian-amd64
     CONFIGURE_ARGS: --without-default-features --disable-user
+        --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
     MAKE_CHECK_ARGS: check-unit
 
 check-patch:
-- 
2.27.0


