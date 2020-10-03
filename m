Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5D82822AA
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 10:52:30 +0200 (CEST)
Received: from localhost ([::1]:52588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOdHJ-0004U5-MQ
	for lists+qemu-devel@lfdr.de; Sat, 03 Oct 2020 04:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kOdFu-0003BL-EV
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 04:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kOdFt-00043L-0o
 for qemu-devel@nongnu.org; Sat, 03 Oct 2020 04:51:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601715060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A/kTLf6UVEo5Spl/NJoPOw7jWcr9EG2BU1kmo3sCcQk=;
 b=gVaZYQeGORlhklKZ9cdH6b9TS+BFlWB21mYWN7itm0Pc6wEFveZcYxvTl6n7xV8Iehba03
 qe+PmFIz9kBjDWXWmdVobRZcVuvLpSHD6KxW9Y7JVeKZ2yobi2U5hUnSTXCYIekCMCtFhj
 0X4lmmpmMfYPqGMNG3C9lJ4kcUhU+As=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-28q3EeNCM3KMOAoLRbaOYw-1; Sat, 03 Oct 2020 04:50:58 -0400
X-MC-Unique: 28q3EeNCM3KMOAoLRbaOYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7C291007469;
 Sat,  3 Oct 2020 08:50:57 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-44.ams2.redhat.com
 [10.36.112.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3EE160C05;
 Sat,  3 Oct 2020 08:50:56 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] dockerfiles: add diffutils to Fedora
Date: Sat,  3 Oct 2020 10:50:54 +0200
Message-Id: <20201003085054.332992-2-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/03 04:48:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some reason diffutils is not included in the Fedora containers anymore,
causing the build to fail.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/dockerfiles/fedora.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 71e4b56977..ec783418c8 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -11,6 +11,7 @@ ENV PACKAGES \
     cyrus-sasl-devel \
     dbus-daemon \
     device-mapper-multipath-devel \
+    diffutils \
     findutils \
     gcc \
     gcc-c++ \
-- 
2.26.2


