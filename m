Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A6F3713D7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:53:35 +0200 (CEST)
Received: from localhost ([::1]:48736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWCk-000468-AI
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4r-0003ug-5z
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4o-0003bH-FQ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620038721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DgLI4Q7kdh4qye6yVEIAMtdffAeuik4GUlzf2Qqvfdw=;
 b=IFT18nNtpbnWBsRMnPxzDdqE4t9TLHhMnYwYpw2mM3vQ5DTppLUjZcmbOqZLb5jb5Mrn84
 h1JjJjdwyO7h6ZrmQjL9guK0/kVBGPWTsbRT/elqbl3jeSA9ybveRBjgq2spWGFpm/3N5V
 4X84D19fR6lp1uwphEKuwmmRXa3Vpj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-g3Xj773cMkW_LqwdQZ5ScQ-1; Mon, 03 May 2021 06:45:20 -0400
X-MC-Unique: g3Xj773cMkW_LqwdQZ5ScQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 742EE801817;
 Mon,  3 May 2021 10:45:19 +0000 (UTC)
Received: from thuth.com (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40A795D9D0;
 Mon,  3 May 2021 10:45:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/10] docs/devel/qgraph: add troubleshooting information
Date: Mon,  3 May 2021 12:44:54 +0200
Message-Id: <20210503104456.1036472-9-thuth@redhat.com>
In-Reply-To: <20210503104456.1036472-1-thuth@redhat.com>
References: <20210503104456.1036472-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

It can be tricky to troubleshoot qos-test when a test won't execute. Add
an explanation of how to trace qgraph node connectivity and find which
node has the problem.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210412143437.727560-3-stefanha@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/qgraph.rst | 58 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/docs/devel/qgraph.rst b/docs/devel/qgraph.rst
index a9aff167ad..318534d4b0 100644
--- a/docs/devel/qgraph.rst
+++ b/docs/devel/qgraph.rst
@@ -92,6 +92,64 @@ The basic framework steps are the following:
 Depending on the QEMU binary used, only some drivers/machines will be
 available and only test that are reached by them will be executed.
 
+Troubleshooting unavailable tests
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+If there is no path from an available machine to a test then that test will be
+unavailable and won't execute. This can happen if a test or driver did not set
+up its qgraph node correctly. It can also happen if the necessary machine type
+or device is missing from the QEMU binary because it was compiled out or
+otherwise.
+
+It is possible to troubleshoot unavailable tests by running::
+
+  $ QTEST_QEMU_BINARY=build/qemu-system-x86_64 build/tests/qtest/qos-test --verbose
+  # ALL QGRAPH EDGES: {
+  #   src='virtio-net'
+  #      |-> dest='virtio-net-tests/vhost-user/multiqueue' type=2 (node=0x559142109e30)
+  #      |-> dest='virtio-net-tests/vhost-user/migrate' type=2 (node=0x559142109d00)
+  #   src='virtio-net-pci'
+  #      |-> dest='virtio-net' type=1 (node=0x55914210d740)
+  #   src='pci-bus'
+  #      |-> dest='virtio-net-pci' type=2 (node=0x55914210d880)
+  #   src='pci-bus-pc'
+  #      |-> dest='pci-bus' type=1 (node=0x559142103f40)
+  #   src='i440FX-pcihost'
+  #      |-> dest='pci-bus-pc' type=0 (node=0x55914210ac70)
+  #   src='x86_64/pc'
+  #      |-> dest='i440FX-pcihost' type=0 (node=0x5591421117f0)
+  #   src=''
+  #      |-> dest='x86_64/pc' type=0 (node=0x559142111600)
+  #      |-> dest='arm/raspi2' type=0 (node=0x559142110740)
+  ...
+  # }
+  # ALL QGRAPH NODES: {
+  #   name='virtio-net-tests/announce-self' type=3 cmd_line='(null)' [available]
+  #   name='arm/raspi2' type=0 cmd_line='-M raspi2 ' [UNAVAILABLE]
+  ...
+  # }
+
+The ``virtio-net-tests/announce-self`` test is listed as "available" in the
+"ALL QGRAPH NODES" output. This means the test will execute. We can follow the
+qgraph path in the "ALL QGRAPH EDGES" output as follows: '' -> 'x86_64/pc' ->
+'i440FX-pcihost' -> 'pci-bus-pc' -> 'pci-bus' -> 'virtio-net-pci' ->
+'virtio-net'. The root of the qgraph is '' and the depth first search begins
+there.
+
+The ``arm/raspi`` machine node is listed as "UNAVAILABLE". Although it is
+reachable from the root via '' -> 'arm/raspi2' the node is unavailable because
+the QEMU binary did not list it when queried by the framework. This is expected
+because we used the ``qemu-system-x86_64`` binary which does not support ARM
+machine types.
+
+If a test is unexpectedly listed as "UNAVAILABLE", first check that the "ALL
+QGRAPH EDGES" output reports edge connectivity from the root ('') to the test.
+If there is no connectivity then the qgraph nodes were not set up correctly and
+the driver or test code is incorrect. If there is connectivity, check the
+availability of each node in the path in the "ALL QGRAPH NODES" output. The
+first unavailable node in the path is the reason why the test is unavailable.
+Typically this is because the QEMU binary lacks support for the necessary
+machine type or device.
+
 Creating a new driver and its interface
 """""""""""""""""""""""""""""""""""""""""
 
-- 
2.27.0


