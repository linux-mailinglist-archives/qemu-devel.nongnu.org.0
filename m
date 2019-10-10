Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF82AD2E29
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 17:51:49 +0200 (CEST)
Received: from localhost ([::1]:41436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIajE-00047M-D1
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 11:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIaK6-0006NQ-Q3
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIaK5-0004bO-RO
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 11:25:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58832)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIaK0-0004Z6-Ai; Thu, 10 Oct 2019 11:25:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 74CB4308C21C;
 Thu, 10 Oct 2019 15:25:43 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1C80194B6;
 Thu, 10 Oct 2019 15:25:42 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 14/23] iotests/194: Create sockets in $SOCK_DIR
Date: Thu, 10 Oct 2019 17:24:48 +0200
Message-Id: <20191010152457.17713-15-mreitz@redhat.com>
In-Reply-To: <20191010152457.17713-1-mreitz@redhat.com>
References: <20191010152457.17713-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 10 Oct 2019 15:25:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/194 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/194 b/tests/qemu-iotests/194
index d746ab1e21..72e47e8833 100755
--- a/tests/qemu-iotests/194
+++ b/tests/qemu-iotests/194
@@ -26,8 +26,8 @@ iotests.verify_platform(['linux'])
=20
 with iotests.FilePath('source.img') as source_img_path, \
      iotests.FilePath('dest.img') as dest_img_path, \
-     iotests.FilePath('migration.sock') as migration_sock_path, \
-     iotests.FilePath('nbd.sock') as nbd_sock_path, \
+     iotests.FilePaths(['migration.sock', 'nbd.sock'], iotests.sock_dir)=
 as \
+         [migration_sock_path, nbd_sock_path], \
      iotests.VM('source') as source_vm, \
      iotests.VM('dest') as dest_vm:
=20
--=20
2.21.0


