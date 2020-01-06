Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B83E1313F3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 15:45:30 +0100 (CET)
Received: from localhost ([::1]:52776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioTdI-0008OX-MS
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 09:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ioTak-00060C-FF
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ioTaj-0008WD-7d
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27343
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ioTaj-0008VI-4c
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578321768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWlbrJzuULgjCZZfWA/TRSan+80TX2F0hTU19vEOaZg=;
 b=cqKkTwJ8rVWWHDHfrMSvSZ3JZzJBw3VMYgylKC4nYaUHD9DTTz6mrVkbxuEbPcscea3Dxl
 UEJTNf56s7wlahaC6NT/OpnVK+4D+SJOh/iQhCGzx/5Zkdku5qh57AJes2cSKe5LDd4F9d
 Vzi6H9RIN8UpNmUxShEYlFG4xfaN7DQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-mhPUKoe2NnKVHxtGWJ7tUQ-1; Mon, 06 Jan 2020 09:42:45 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22877805149;
 Mon,  6 Jan 2020 14:42:43 +0000 (UTC)
Received: from localhost (ovpn-117-91.ams2.redhat.com [10.36.117.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97C3B7FB72;
 Mon,  6 Jan 2020 14:42:42 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/34] iotests: s/qocw2/qcow2/
Date: Mon,  6 Jan 2020 15:41:40 +0100
Message-Id: <20200106144206.698920-9-mreitz@redhat.com>
In-Reply-To: <20200106144206.698920-1-mreitz@redhat.com>
References: <20200106144206.698920-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: mhPUKoe2NnKVHxtGWJ7tUQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Probably due to blind copy-pasting, we have several instances of "qocw2"
in our iotests.  Fix them.

Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20191107163708.833192-2-mreitz@redhat.com
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/060 | 2 +-
 tests/qemu-iotests/061 | 2 +-
 tests/qemu-iotests/062 | 2 +-
 tests/qemu-iotests/066 | 2 +-
 tests/qemu-iotests/068 | 2 +-
 tests/qemu-iotests/108 | 2 +-
 tests/qemu-iotests/138 | 2 +-
 tests/qemu-iotests/261 | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index d96f17a484..7439be894b 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -44,7 +44,7 @@ _filter_io_error()
 . ./common.rc
 . ./common.filter
=20
-# This tests qocw2-specific low-level functionality
+# This tests qcow2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index 4eac5b83bd..e1b8044630 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -37,7 +37,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 . ./common.rc
 . ./common.filter
=20
-# This tests qocw2-specific low-level functionality
+# This tests qcow2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
diff --git a/tests/qemu-iotests/062 b/tests/qemu-iotests/062
index d5f818fcce..79738b1c26 100755
--- a/tests/qemu-iotests/062
+++ b/tests/qemu-iotests/062
@@ -37,7 +37,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 . ./common.rc
 . ./common.filter
=20
-# This tests qocw2-specific low-level functionality
+# This tests qcow2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto generic
=20
diff --git a/tests/qemu-iotests/066 b/tests/qemu-iotests/066
index 28f8c98412..cacbdb6ae0 100755
--- a/tests/qemu-iotests/066
+++ b/tests/qemu-iotests/066
@@ -36,7 +36,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 . ./common.rc
 . ./common.filter
=20
-# This tests qocw2-specific low-level functionality
+# This tests qcow2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto generic
=20
diff --git a/tests/qemu-iotests/068 b/tests/qemu-iotests/068
index 22f5ca3ba6..c164ccc64a 100755
--- a/tests/qemu-iotests/068
+++ b/tests/qemu-iotests/068
@@ -36,7 +36,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 . ./common.rc
 . ./common.filter
=20
-# This tests qocw2-specific low-level functionality
+# This tests qcow2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto generic
=20
diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
index 9c08172237..872a9afec9 100755
--- a/tests/qemu-iotests/108
+++ b/tests/qemu-iotests/108
@@ -37,7 +37,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 . ./common.rc
 . ./common.filter
=20
-# This tests qocw2-specific low-level functionality
+# This tests qcow2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
diff --git a/tests/qemu-iotests/138 b/tests/qemu-iotests/138
index 6a731370db..8b2f587af0 100755
--- a/tests/qemu-iotests/138
+++ b/tests/qemu-iotests/138
@@ -36,7 +36,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 . ./common.rc
 . ./common.filter
=20
-# This tests qocw2-specific low-level functionality
+# This tests qcow2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
diff --git a/tests/qemu-iotests/261 b/tests/qemu-iotests/261
index fb96bcfbe2..9f2817251f 100755
--- a/tests/qemu-iotests/261
+++ b/tests/qemu-iotests/261
@@ -40,7 +40,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 . ./common.rc
 . ./common.filter
=20
-# This tests qocw2-specific low-level functionality
+# This tests qcow2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
--=20
2.24.1


