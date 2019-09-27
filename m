Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D977CC0996
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 18:29:40 +0200 (CEST)
Received: from localhost ([::1]:53234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDt7j-0005c2-BH
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 12:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46537)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iDr43-000118-6h
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:17:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iDr42-0003Sp-4u
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:17:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47604)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iDr3x-0003Nu-NG; Fri, 27 Sep 2019 10:17:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7560E3090FC9;
 Fri, 27 Sep 2019 14:17:32 +0000 (UTC)
Received: from dhcp-17-179.bos.redhat.com (dhcp-17-179.bos.redhat.com
 [10.18.17.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E93960BE2;
 Fri, 27 Sep 2019 14:17:31 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] qemu-iotests: remove forceful execution success from
 library files
Date: Fri, 27 Sep 2019 10:17:26 -0400
Message-Id: <20190927141728.7137-3-crosa@redhat.com>
In-Reply-To: <20190927141728.7137-1-crosa@redhat.com>
References: <20190927141728.7137-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 27 Sep 2019 14:17:32 +0000 (UTC)
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

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/qemu-iotests/common.config | 3 ---
 tests/qemu-iotests/common.filter | 3 ---
 tests/qemu-iotests/common.rc     | 3 ---
 3 files changed, 9 deletions(-)

diff --git a/tests/qemu-iotests/common.config b/tests/qemu-iotests/common=
.config
index 6956d38d4c..0a24d960ff 100644
--- a/tests/qemu-iotests/common.config
+++ b/tests/qemu-iotests/common.config
@@ -34,6 +34,3 @@ _optstr_add()
         echo "$2"
     fi
 }
-
-# make sure this script returns success
-true
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common=
.filter
index 043c62c10c..55db15865a 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -221,6 +221,3 @@ _filter_qmp_empty_return()
 {
     grep -v '{"return": {}}'
 }
-
-# make sure this script returns success
-true
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 19bddacf11..d7e6456086 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -600,6 +600,3 @@ _require_drivers()
         fi
     done
 }
-
-# make sure this script returns success
-true
--=20
2.21.0


