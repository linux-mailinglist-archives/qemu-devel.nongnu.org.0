Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E02275B4B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 17:16:16 +0200 (CEST)
Received: from localhost ([::1]:59244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL6VD-0007Yn-M8
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 11:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kL6Pm-0003Ya-Jy
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 11:10:38 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31859
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kL6Pk-0002PU-HN
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 11:10:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600873834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Njx8N6LNKY6acy+EIjLutcfLUIfBhqeiVNdi+WlFIu4=;
 b=VYqBJu2M0qc6U5PQ+pnGPPNVIXpQFnxXbBKRC27pkHPdDM+SxUlPpAtTGuL+RizA9C58kt
 YSWqgsntWyfxBUF7gF/UiO3inJ0dfDxoJhp72bpapiPB8dPSWK0RwPg4UBTNl00vyftwLa
 sTpAE2sMWsY4ScVnS7OFobIZ0Dg22tc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-YROJayyCO4W31f0AovBEWw-1; Wed, 23 Sep 2020 11:10:32 -0400
X-MC-Unique: YROJayyCO4W31f0AovBEWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A63FC10A7AE4;
 Wed, 23 Sep 2020 15:10:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52CD278822;
 Wed, 23 Sep 2020 15:10:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] travis: remove TCI test
Date: Wed, 23 Sep 2020 11:10:30 -0400
Message-Id: <20200923151030.1613449-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 08:52:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TCI test is already performed on gitlab CI, and it fails because
Travis tests (generally) disable tools and therefore do not have
"make check-qtest".  Just remove it.

Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .travis.yml | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index c75221dca3..5811215957 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -239,14 +239,6 @@ jobs:
         - TEST_CMD=""
 
 
-    # Check the TCG interpreter (TCI)
-    - name: "GCC TCI"
-      env:
-        - CONFIG="--enable-debug-tcg --enable-tcg-interpreter --disable-kvm --disable-containers
-            --target-list=alpha-softmmu,arm-softmmu,hppa-softmmu,m68k-softmmu,microblaze-softmmu,moxie-softmmu,ppc-softmmu,s390x-softmmu,x86_64-softmmu"
-        - TEST_CMD="make check-qtest check-tcg V=1"
-
-
     # We don't need to exercise every backend with every front-end
     - name: "GCC trace log,simple,syslog (user)"
       env:
-- 
2.26.2


