Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C437B525192
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:48:54 +0200 (CEST)
Received: from localhost ([::1]:50416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npB3d-00045Z-VA
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApe-0006Ca-9b
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApb-0003S5-RF
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652369663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qudi18RG3hZqO+lwyHf43ie+4OpDI9j9yU5BQHMoDvM=;
 b=KAarz1yNRDaCfVzkYDb+9ZLgcvm/srhsXtzyG1u+aSuHzilswqe8dnV/VEOcoKEWrG4B+3
 HYudQh61+wliLgcwc9usUKKTwKLlrGPDXOat+uBpET95HVfQ7VEQIHJIwo+ZFVjpiPMJw2
 +peM/UzAS3vpIo0TOTNE0xeN1fEJ0GQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-Z5o6fluWM1qqzhcMrd11GA-1; Thu, 12 May 2022 11:34:22 -0400
X-MC-Unique: Z5o6fluWM1qqzhcMrd11GA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A94CB8039D7;
 Thu, 12 May 2022 15:34:21 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 144CD416156;
 Thu, 12 May 2022 15:34:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 10/10] qemu-iotests: inline common.config into common.rc
Date: Thu, 12 May 2022 17:34:01 +0200
Message-Id: <20220512153401.202863-11-kwolf@redhat.com>
In-Reply-To: <20220512153401.202863-1-kwolf@redhat.com>
References: <20220512153401.202863-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Paolo Bonzini <pbonzini@redhat.com>

common.rc has some complicated logic to find the common.config that
dates back to xfstests and is completely unnecessary now.  Just include
the contents of the file.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220505094723.732116-1-pbonzini@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/common.config | 41 --------------------------------
 tests/qemu-iotests/common.rc     | 31 ++++++++++++++----------
 2 files changed, 19 insertions(+), 53 deletions(-)
 delete mode 100644 tests/qemu-iotests/common.config

diff --git a/tests/qemu-iotests/common.config b/tests/qemu-iotests/common.config
deleted file mode 100644
index 9bd1a5a6fc..0000000000
--- a/tests/qemu-iotests/common.config
+++ /dev/null
@@ -1,41 +0,0 @@
-#!/usr/bin/env bash
-#
-# Copyright (C) 2009 Red Hat, Inc.
-# Copyright (c) 2000-2003,2006 Silicon Graphics, Inc.  All Rights Reserved.
-#
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it would be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program.  If not, see <http://www.gnu.org/licenses/>.
-#
-# all tests should use a common language setting to prevent golden
-# output mismatches.
-export LANG=C
-
-PATH=".:$PATH"
-
-HOSTOS=$(uname -s)
-arch=$(uname -m)
-[[ "$arch" =~ "ppc64" ]] && qemu_arch=ppc64 || qemu_arch="$arch"
-
-# make sure we have a standard umask
-umask 022
-
-_optstr_add()
-{
-    if [ -n "$1" ]; then
-        echo "$1,$2"
-    else
-        echo "$2"
-    fi
-}
-
-# make sure this script returns success
-true
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 227e0a5be9..165b54a61e 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -17,6 +17,17 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+export LANG=C
+
+PATH=".:$PATH"
+
+HOSTOS=$(uname -s)
+arch=$(uname -m)
+[[ "$arch" =~ "ppc64" ]] && qemu_arch=ppc64 || qemu_arch="$arch"
+
+# make sure we have a standard umask
+umask 022
+
 # bail out, setting up .notrun file
 _notrun()
 {
@@ -120,18 +131,14 @@ peek_file_raw()
     dd if="$1" bs=1 skip="$2" count="$3" status=none
 }
 
-config=common.config
-test -f $config || config=../common.config
-if ! test -f $config
-then
-    echo "$0: failed to find common.config"
-    exit 1
-fi
-if ! . $config
-    then
-    echo "$0: failed to source common.config"
-    exit 1
-fi
+_optstr_add()
+{
+    if [ -n "$1" ]; then
+        echo "$1,$2"
+    else
+        echo "$2"
+    fi
+}
 
 # Set the variables to the empty string to turn Valgrind off
 # for specific processes, e.g.
-- 
2.35.3


