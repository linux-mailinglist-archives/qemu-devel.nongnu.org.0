Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0A42A6746
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 16:17:49 +0100 (CET)
Received: from localhost ([::1]:57426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaKXk-0003Jz-VD
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 10:17:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kaKIl-0003Cg-C0
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 10:02:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kaKId-00065P-HY
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 10:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604502130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M10GQeYmnUrpQ9+MTbe43h9XrmzLCk+hoOUrwZE6wSc=;
 b=D/LF7KQqr/kApqDdkCMeQcCiXQMZzI7VF+v9fc1GN+F50EGDad2+yqYcaS5eYNxmCscfCs
 rdK2jeqKVy9GiLG03IH7I0vdyDopYB7kROL3G5xZaJIviyW7Unwz4g70zTTurbzvfWixHp
 esY3RSwYy0p9tvZh3dMvJglBD/CWkng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-I_WxseoLP6Sa1jFGNn5UrA-1; Wed, 04 Nov 2020 10:02:07 -0500
X-MC-Unique: I_WxseoLP6Sa1jFGNn5UrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D25A764149
 for <qemu-devel@nongnu.org>; Wed,  4 Nov 2020 15:02:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9663D6EF6A
 for <qemu-devel@nongnu.org>; Wed,  4 Nov 2020 15:02:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] ivshmem-test: do not use short-form boolean option
Date: Wed,  4 Nov 2020 10:01:52 -0500
Message-Id: <20201104150153.541326-20-pbonzini@redhat.com>
In-Reply-To: <20201104150153.541326-1-pbonzini@redhat.com>
References: <20201104150153.541326-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This QemuOpts idiom will be deprecated, so get rid of it in the tests.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/ivshmem-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index d5c8b9f128..dfa69424ed 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -135,7 +135,7 @@ static void setup_vm_cmd(IVState *s, const char *cmd, bool msix)
 static void setup_vm(IVState *s)
 {
     char *cmd = g_strdup_printf("-object memory-backend-file"
-                                ",id=mb1,size=1M,share,mem-path=/dev/shm%s"
+                                ",id=mb1,size=1M,share=on,mem-path=/dev/shm%s"
                                 " -device ivshmem-plain,memdev=mb1", tmpshm);
 
     setup_vm_cmd(s, cmd, false);
-- 
2.26.2



