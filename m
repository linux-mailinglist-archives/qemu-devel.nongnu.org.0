Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C6E2A49BA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 16:30:54 +0100 (CET)
Received: from localhost ([::1]:32802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZyGr-0004kc-Jl
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 10:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kZy1U-0002Cd-KH
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:15:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kZy1S-0002uf-Bz
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604416496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M10GQeYmnUrpQ9+MTbe43h9XrmzLCk+hoOUrwZE6wSc=;
 b=c6mVh5QXPxHrErWdyJZQIMY5lQg6tgzWVfGEK0gcHT1gwNaTHc81Tvq6H4iqFWerzhSgr8
 WvzEgY4XssBmvR+I/zzYjxGTeBcu2UDnfLVx5jyNnFa5xASh9ms1K0VPaR65sOTuI/WMqt
 Bmdied7Zdl2AWLIHBAsQKx4TxTiietY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-unwJsK31PomFQl1me51p1A-1; Tue, 03 Nov 2020 10:14:54 -0500
X-MC-Unique: unwJsK31PomFQl1me51p1A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCE681018F60
 for <qemu-devel@nongnu.org>; Tue,  3 Nov 2020 15:14:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E1DD100239A;
 Tue,  3 Nov 2020 15:14:53 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 1/4] ivshmem-test: do not use short-form boolean option
Date: Tue,  3 Nov 2020 10:14:49 -0500
Message-Id: <20201103151452.416784-2-pbonzini@redhat.com>
In-Reply-To: <20201103151452.416784-1-pbonzini@redhat.com>
References: <20201103151452.416784-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
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
Cc: armbru@redhat.com
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



