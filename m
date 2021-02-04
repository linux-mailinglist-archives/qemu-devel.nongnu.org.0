Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E73030F43C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 14:55:46 +0100 (CET)
Received: from localhost ([::1]:54756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7f6n-0001iB-5Q
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 08:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7f5s-0001G6-LZ
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:54:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7f5p-0005KC-BS
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:54:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612446883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vm8BJvUw7VkJ/Bbn1fxoKBpLmf95M1AGJKpYCo34S14=;
 b=M+DmheiAYVPYqhQYD2bWNyAttZBob4nlLDrWoAzKJP4T6tk4QyAkdam9F87mR8+9Ng9lyS
 1NWzvJ57ABvNmQfb7NZPR+yPxjFl5GirV4oNyRiirkklU7DFgGJCQ2760rY/xAZmEzhIMa
 Q5kASekfa6iPEBV851g4F7XcM1SICoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-h8W95NKwOey5JE7wo5kAjg-1; Thu, 04 Feb 2021 08:54:37 -0500
X-MC-Unique: h8W95NKwOey5JE7wo5kAjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BAAB18CAE06;
 Thu,  4 Feb 2021 13:54:36 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFFD210589A1;
 Thu,  4 Feb 2021 13:54:29 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] MAINTAINERS: Fix the location of tools manuals
Date: Thu,  4 Feb 2021 10:54:25 -0300
Message-Id: <20210204135425.1380280-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, dgilbert@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu-img.rst, qemu-nbd.rst, virtfs-proxy-helper.rst, qemu-trace-stap.rst,
and virtiofsd.rst manuals were moved to docs/tools, so this update MAINTAINERS
accordingly.

Fixes: a08b4a9fe6c ("docs: Move tools documentation to tools manual")
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
v1: was "MAINTAINERS: Fix the location of virtiofsd.rst"
v2: Fixed the location of all files [philmd]

 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00626941f1..174425a941 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1829,7 +1829,7 @@ S: Odd Fixes
 F: hw/9pfs/
 X: hw/9pfs/xen-9p*
 F: fsdev/
-F: docs/interop/virtfs-proxy-helper.rst
+F: docs/tools/virtfs-proxy-helper.rst
 F: tests/qtest/virtio-9p-test.c
 T: git https://gitlab.com/gkurz/qemu.git 9p-next
 
@@ -1859,7 +1859,7 @@ S: Supported
 F: tools/virtiofsd/*
 F: hw/virtio/vhost-user-fs*
 F: include/hw/virtio/vhost-user-fs.h
-F: docs/interop/virtiofsd.rst
+F: docs/tools/virtiofsd.rst
 
 virtio-input
 M: Gerd Hoffmann <kraxel@redhat.com>
@@ -2166,7 +2166,7 @@ F: block/
 F: hw/block/
 F: include/block/
 F: qemu-img*
-F: docs/interop/qemu-img.rst
+F: docs/tools/qemu-img.rst
 F: qemu-io*
 F: tests/qemu-iotests/
 F: util/qemu-progress.c
@@ -2620,7 +2620,7 @@ F: qapi/trace.json
 F: scripts/tracetool.py
 F: scripts/tracetool/
 F: scripts/qemu-trace-stap*
-F: docs/interop/qemu-trace-stap.rst
+F: docs/tools/qemu-trace-stap.rst
 F: docs/devel/tracing.txt
 T: git https://github.com/stefanha/qemu.git tracing
 
@@ -2999,7 +2999,7 @@ F: include/block/nbd*
 F: qemu-nbd.*
 F: blockdev-nbd.c
 F: docs/interop/nbd.txt
-F: docs/interop/qemu-nbd.rst
+F: docs/tools/qemu-nbd.rst
 T: git https://repo.or.cz/qemu/ericb.git nbd
 
 NFS
-- 
2.29.2


