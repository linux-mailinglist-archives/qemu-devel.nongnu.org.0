Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D6C464BF2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 11:47:52 +0100 (CET)
Received: from localhost ([::1]:45576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msN9T-0005YV-Ge
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 05:47:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1msN6J-0000qM-Ms
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 05:44:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1msN6G-0002jz-E0
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 05:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638355471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=92hJDCmjp7AuMSarM3czHqxdLwuaCN80uRXuGmt6N80=;
 b=hCG0erDt4Qh+VfCKbckpKvlk9Tsu75ieickKb4fxXIltKDOe9KrybB6dPMJ9JOaV5Yq80v
 LKs1NgIEO1sSSARmAV9mb4Z656snY/ODQXp7K2l9uDiD2+hqBSCtfmAQpTa/PkGDzuXly2
 KeVc9PSE4x0NXtXHkdIBzLEPg0+Nny8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-WEN9-StDO-irb--IiZqhSA-1; Wed, 01 Dec 2021 05:44:30 -0500
X-MC-Unique: WEN9-StDO-irb--IiZqhSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B222C81EE60
 for <qemu-devel@nongnu.org>; Wed,  1 Dec 2021 10:44:29 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B1CB60C0F;
 Wed,  1 Dec 2021 10:43:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH for-7.0 1/4] tests/qtest: Run the PPC 32-bit tests with the
 64-bit target binary, too
Date: Wed,  1 Dec 2021 11:43:44 +0100
Message-Id: <20211201104347.51922-2-thuth@redhat.com>
In-Reply-To: <20211201104347.51922-1-thuth@redhat.com>
References: <20211201104347.51922-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ppc64 target is a superset of the 32-bit target, so we should
include the tests here, too. This used to be done in the past already,
but it got lost during the conversion to meson.

Fixes: a2ce7dbd91 ("meson: convert tests/qtest to meson")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c9d8458062..8591a54439 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -134,6 +134,7 @@ qtests_ppc = \
   ['boot-order-test', 'prom-env-test', 'boot-serial-test']                 \
 
 qtests_ppc64 = \
+  qtests_ppc + \
   (config_all_devices.has_key('CONFIG_PSERIES') ? ['device-plug-test'] : []) +               \
   (config_all_devices.has_key('CONFIG_POWERNV') ? ['pnv-xscom-test'] : []) +                 \
   (config_all_devices.has_key('CONFIG_PSERIES') ? ['rtas-test'] : []) +                      \
-- 
2.27.0


