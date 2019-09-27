Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103C5C0896
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 17:28:39 +0200 (CEST)
Received: from localhost ([::1]:52414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDsAf-00043p-8J
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 11:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46542)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iDr43-00011E-C4
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:17:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iDr42-0003Sb-0O
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 10:17:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51724)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iDr3x-0003Nq-Ve; Fri, 27 Sep 2019 10:17:38 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7DB3B3091740;
 Fri, 27 Sep 2019 14:17:31 +0000 (UTC)
Received: from dhcp-17-179.bos.redhat.com (dhcp-17-179.bos.redhat.com
 [10.18.17.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A33AA60BF3;
 Fri, 27 Sep 2019 14:17:30 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] qemu-iotests: remove bash shebang from library files
Date: Fri, 27 Sep 2019 10:17:25 -0400
Message-Id: <20190927141728.7137-2-crosa@redhat.com>
In-Reply-To: <20190927141728.7137-1-crosa@redhat.com>
References: <20190927141728.7137-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 27 Sep 2019 14:17:31 +0000 (UTC)
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

Due to not being able to find a reason to have shebangs on files that
are not executable.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/qemu-iotests/common.config  | 2 --
 tests/qemu-iotests/common.filter  | 2 --
 tests/qemu-iotests/common.nbd     | 1 -
 tests/qemu-iotests/common.pattern | 2 --
 tests/qemu-iotests/common.qemu    | 2 --
 tests/qemu-iotests/common.rc      | 2 --
 tests/qemu-iotests/common.tls     | 2 --
 7 files changed, 13 deletions(-)

diff --git a/tests/qemu-iotests/common.config b/tests/qemu-iotests/common=
.config
index 9bd1a5a6fc..6956d38d4c 100644
--- a/tests/qemu-iotests/common.config
+++ b/tests/qemu-iotests/common.config
@@ -1,5 +1,3 @@
-#!/usr/bin/env bash
-#
 # Copyright (C) 2009 Red Hat, Inc.
 # Copyright (c) 2000-2003,2006 Silicon Graphics, Inc.  All Rights Reserv=
ed.
 #
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common=
.filter
index 445a1c23e0..043c62c10c 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -1,5 +1,3 @@
-#!/usr/bin/env bash
-#
 # Copyright (C) 2009 Red Hat, Inc.
 # Copyright (c) 2000-2001 Silicon Graphics, Inc.  All Rights Reserved.
 #
diff --git a/tests/qemu-iotests/common.nbd b/tests/qemu-iotests/common.nb=
d
index 24b01b60aa..5a9991b7ef 100644
--- a/tests/qemu-iotests/common.nbd
+++ b/tests/qemu-iotests/common.nbd
@@ -1,4 +1,3 @@
-#!/usr/bin/env bash
 # -*- shell-script-mode -*-
 #
 # Helpers for NBD server related config
diff --git a/tests/qemu-iotests/common.pattern b/tests/qemu-iotests/commo=
n.pattern
index 4f5e5bcea0..e8d97dd2bb 100644
--- a/tests/qemu-iotests/common.pattern
+++ b/tests/qemu-iotests/common.pattern
@@ -1,5 +1,3 @@
-#!/usr/bin/env bash
-#
 # Copyright (C) 2009 Red Hat, Inc.
 #
 # This program is free software; you can redistribute it and/or modify
diff --git a/tests/qemu-iotests/common.qemu b/tests/qemu-iotests/common.q=
emu
index 8d2021a7eb..5bdfde890d 100644
--- a/tests/qemu-iotests/common.qemu
+++ b/tests/qemu-iotests/common.qemu
@@ -1,5 +1,3 @@
-#!/usr/bin/env bash
-#
 # This allows for launching of multiple QEMU instances, with independent
 # communication possible to each instance.
 #
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index e45cdfa66b..19bddacf11 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -1,5 +1,3 @@
-#!/usr/bin/env bash
-#
 # Copyright (C) 2009 Red Hat, Inc.
 # Copyright (c) 2000-2006 Silicon Graphics, Inc.  All Rights Reserved.
 #
diff --git a/tests/qemu-iotests/common.tls b/tests/qemu-iotests/common.tl=
s
index 54c331d7a5..61f8ef6037 100644
--- a/tests/qemu-iotests/common.tls
+++ b/tests/qemu-iotests/common.tls
@@ -1,5 +1,3 @@
-#!/usr/bin/env bash
-#
 # Helpers for TLS related config
 #
 # Copyright (C) 2018 Red Hat, Inc.
--=20
2.21.0


