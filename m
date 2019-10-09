Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2025D1AC4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 23:20:38 +0200 (CEST)
Received: from localhost ([::1]:58600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIJNt-0005Lc-QG
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 17:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57383)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIHw5-0007GT-Sj
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 15:47:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIHw4-0003ek-Q4
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 15:47:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54680)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIHw2-0003dW-F5; Wed, 09 Oct 2019 15:47:46 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A22223086E21;
 Wed,  9 Oct 2019 19:47:45 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E82010013D9;
 Wed,  9 Oct 2019 19:47:44 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] qemu-iotests: remove forceful execution success from
 library files
Date: Wed,  9 Oct 2019 15:47:38 -0400
Message-Id: <20191009194740.8079-3-crosa@redhat.com>
In-Reply-To: <20191009194740.8079-1-crosa@redhat.com>
References: <20191009194740.8079-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 09 Oct 2019 19:47:45 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Should not be necessary on files that are not executed standalone.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/qemu-iotests/common.config | 3 ---
 tests/qemu-iotests/common.filter | 3 ---
 tests/qemu-iotests/common.rc     | 3 ---
 3 files changed, 9 deletions(-)

diff --git a/tests/qemu-iotests/common.config b/tests/qemu-iotests/common=
.config
index b85a6a6f96..47605d61e2 100644
--- a/tests/qemu-iotests/common.config
+++ b/tests/qemu-iotests/common.config
@@ -36,6 +36,3 @@ _optstr_add()
         echo "$2"
     fi
 }
-
-# make sure this script returns success
-true
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common=
.filter
index a0b52b0ac8..60f675251a 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -226,6 +226,3 @@ _filter_qmp_empty_return()
 {
     grep -v '{"return": {}}'
 }
-
-# make sure this script returns success
-true
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index aa4a7fcc11..3fd4330dbd 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -602,6 +602,3 @@ _require_drivers()
         fi
     done
 }
-
-# make sure this script returns success
-true
--=20
2.21.0


