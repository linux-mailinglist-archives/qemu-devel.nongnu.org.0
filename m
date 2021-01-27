Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D97305393
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 07:54:05 +0100 (CET)
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4eiK-0002oA-1t
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 01:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4egy-0001yY-0W
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:52:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4egv-0008P4-Eg
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611730355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F4zOs8luYSC2oHsdyywMjFE4/Jns9eJEtQ5KE9WBwds=;
 b=Yk38lOMq7kQAceP34gIHY1Oo7sIBWe5cLY5jScyWq2YxlkjqYGoqbaa5bgRBEsSYiHduDn
 LXGsittJHdLSHyaI0H1wYZ6aFdiIIzpyZ01Bknd6z+gx6X6IMhII2e0rt862w8HVZLip6P
 Opd1afllLjNkPjeWDHMuD3Rk06GOyPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-xa89k7g-NBuUg5k60Gey6g-1; Wed, 27 Jan 2021 01:52:32 -0500
X-MC-Unique: xa89k7g-NBuUg5k60Gey6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 039B7190D341;
 Wed, 27 Jan 2021 06:52:31 +0000 (UTC)
Received: from thuth.com (ovpn-112-136.ams2.redhat.com [10.36.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1FDF63743;
 Wed, 27 Jan 2021 06:52:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PATCH] tests/acceptance: Increase the timeout in the replay tests
Date: Wed, 27 Jan 2021 07:52:22 +0100
Message-Id: <20210127065222.48650-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our gitlab-CI just showed a failed test_ppc_mac99 since it was apparently
killed some few seconds before the test finished. Allow it some more
time to complete.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Seen in this test log:
 https://gitlab.com/qemu-project/qemu/-/jobs/987148065/artifacts/file/build/tests/results/latest/test-results/26-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_ppc_mac99/debug.log

 tests/acceptance/replay_kernel.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 772633b01d..c1cb862468 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -31,7 +31,7 @@ class ReplayKernelBase(LinuxKernelTest):
     terminates.
     """
 
-    timeout = 90
+    timeout = 120
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=1 panic=-1 '
 
     def run_vm(self, kernel_path, kernel_command_line, console_pattern,
-- 
2.27.0


