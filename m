Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E677334A2B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 22:54:15 +0100 (CET)
Received: from localhost ([::1]:41560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6mT-0006AS-Vp
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 16:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dv-00036p-Tw; Wed, 10 Mar 2021 16:45:24 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:51985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6ds-0004MR-Or; Wed, 10 Mar 2021 16:45:23 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MBmI6-1lRl4Q3uxQ-00C9jg; Wed, 10 Mar 2021 22:45:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/22] MAINTAINERS: Fix the location of tools manuals
Date: Wed, 10 Mar 2021 22:44:49 +0100
Message-Id: <20210310214504.1183162-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5S3BHfmH+cZoCWU96j+1BtpSKXtNI6dbT54elfjsdSh/fumgHF3
 yt/DrDmwXalxwHlsN+LT7j7PrNvqnWuUeyWwWLBKuchrS4rp7+MzXZSdUL/3RI8j6rF2f2m
 b7L4TZKWICfiQ7GADoYXQ5eqK4i43iC+alKEy82QdgW9VcXVy8WsoSNs71SNDFE0/pF+4Dy
 +PdOxUZYHQ6z0LadqtuAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gibBpayhKSM=:W+n62gAkJtQlMig62Ilgmy
 VGPow3u0OdPtL0Xrg6OWjgEw1vi/5rBr6b67bq0anH53OcLRtoFiQsA90NhlLwBCh76AefQhP
 APwqez9WT2zf6hS1jzqVxinSN4INcF/jUg/t5gHqIou058Wb7sEgOYvlGhaBG8KYiORlangbA
 9yRQkUfCojcXRln3jlXV3jzdsxsGuBJ/4Bcs67qcwJNgujKdd8YYH+lgmS+Ou8yWbnaNQ/2jz
 n3VIF53JD+roiWKRW4lkRIWPecnSEgjCnLSg0hlKwQiRtbeWOwYZHWhHpvUv8oNtiLtTfDqWN
 uK/BzXjKBFT2EfHLEfBpnEyZg4NdhBjg4mfeeJKX+fQRDWt3PAq+4KxUNIHtP+Wa2pkH6StTg
 R1MvXFgEZl8mqF1RhDQxolaBHLDhuJpWVfMXDEqrEfNculNyefleAjhLscPM/QD/j3pAbuV3E
 tzF09s4Klw==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

The qemu-img.rst, qemu-nbd.rst, virtfs-proxy-helper.rst, qemu-trace-stap.rst,
and virtiofsd.rst manuals were moved to docs/tools, so this update MAINTAINERS
accordingly.

Fixes: a08b4a9fe6c ("docs: Move tools documentation to tools manual")
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210204135425.1380280-1-wainersm@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f22d83c17823..ad28f37bc5ff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1862,7 +1862,7 @@ S: Odd Fixes
 F: hw/9pfs/
 X: hw/9pfs/xen-9p*
 F: fsdev/
-F: docs/interop/virtfs-proxy-helper.rst
+F: docs/tools/virtfs-proxy-helper.rst
 F: tests/qtest/virtio-9p-test.c
 T: git https://gitlab.com/gkurz/qemu.git 9p-next
 T: git https://github.com/cschoenebeck/qemu.git 9p.next
@@ -1893,7 +1893,7 @@ S: Supported
 F: tools/virtiofsd/*
 F: hw/virtio/vhost-user-fs*
 F: include/hw/virtio/vhost-user-fs.h
-F: docs/interop/virtiofsd.rst
+F: docs/tools/virtiofsd.rst
 
 virtio-input
 M: Gerd Hoffmann <kraxel@redhat.com>
@@ -2200,7 +2200,7 @@ F: block/
 F: hw/block/
 F: include/block/
 F: qemu-img*
-F: docs/interop/qemu-img.rst
+F: docs/tools/qemu-img.rst
 F: qemu-io*
 F: tests/qemu-iotests/
 F: util/qemu-progress.c
@@ -2656,7 +2656,7 @@ F: qapi/trace.json
 F: scripts/tracetool.py
 F: scripts/tracetool/
 F: scripts/qemu-trace-stap*
-F: docs/interop/qemu-trace-stap.rst
+F: docs/tools/qemu-trace-stap.rst
 F: docs/devel/tracing.txt
 T: git https://github.com/stefanha/qemu.git tracing
 
@@ -3047,7 +3047,7 @@ F: include/block/nbd*
 F: qemu-nbd.*
 F: blockdev-nbd.c
 F: docs/interop/nbd.txt
-F: docs/interop/qemu-nbd.rst
+F: docs/tools/qemu-nbd.rst
 T: git https://repo.or.cz/qemu/ericb.git nbd
 
 NFS
-- 
2.29.2


