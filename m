Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE4018939D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 02:15:31 +0100 (CET)
Received: from localhost ([::1]:43892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jENIw-0002UR-0y
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 21:15:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57452)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1jENG8-0007VN-75
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 21:12:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1jENG6-0004kl-Mi
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 21:12:36 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:38725)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1jENG6-0004kV-Hh
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 21:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584493954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKK+41mV43lMygsikZOzhnUdZoMCAJVD3k2MPho1DeM=;
 b=EsIRW3u/Xl9zF6bl2l898biIlv4VwCKlpJf1ryplQ8untfl+QCye0KW+cUxCqze1+RdD6N
 WaiwGs/IKnyx4FfFXX61MgaLBwvCUvZyKcoKeu1JFKG7W/yUe5pzTdrEh1EiuY1OP6dcA0
 E7IWRlSXHs5Ymplbkhr6ngbYAvfao0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-oh1GbW7zMqOnbCY0H_tyYQ-1; Tue, 17 Mar 2020 21:12:27 -0400
X-MC-Unique: oh1GbW7zMqOnbCY0H_tyYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EF5C13E2;
 Wed, 18 Mar 2020 01:12:26 +0000 (UTC)
Received: from localhost (ovpn-118-148.rdu2.redhat.com [10.10.118.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C80A7E331;
 Wed, 18 Mar 2020 01:12:25 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/4] scripts/simplebench: add example usage of simplebench
Date: Tue, 17 Mar 2020 21:12:16 -0400
Message-Id: <20200318011217.2102748-4-ehabkost@redhat.com>
In-Reply-To: <20200318011217.2102748-1-ehabkost@redhat.com>
References: <20200318011217.2102748-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This example may be used as a template for custom benchmark.
It illustrates three things to prepare:
 - define bench_func
 - define test environments (columns)
 - define test cases (rows)
And final call of simplebench API.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <20200228071914.11746-4-vsementsov@virtuozzo.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 scripts/simplebench/bench-example.py | 80 ++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 scripts/simplebench/bench-example.py

diff --git a/scripts/simplebench/bench-example.py b/scripts/simplebench/ben=
ch-example.py
new file mode 100644
index 0000000000..c642a5b891
--- /dev/null
+++ b/scripts/simplebench/bench-example.py
@@ -0,0 +1,80 @@
+#!/usr/bin/env python3
+#
+# Benchmark example
+#
+# Copyright (c) 2019 Virtuozzo International GmbH.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import simplebench
+from bench_block_job import bench_block_copy, drv_file, drv_nbd
+
+
+def bench_func(env, case):
+    """ Handle one "cell" of benchmarking table. """
+    return bench_block_copy(env['qemu_binary'], env['cmd'],
+                            case['source'], case['target'])
+
+
+# You may set the following five variables to correct values, to turn this
+# example to real benchmark.
+ssd_source =3D '/path-to-raw-source-image-at-ssd'
+ssd_target =3D '/path-to-raw-target-image-at-ssd'
+hdd_target =3D '/path-to-raw-source-image-at-hdd'
+nbd_ip =3D 'nbd-ip-addr'
+nbd_port =3D 'nbd-port-number'
+
+# Test-cases are "rows" in benchmark resulting table, 'id' is a caption fo=
r
+# the row, other fields are handled by bench_func.
+test_cases =3D [
+    {
+        'id': 'ssd -> ssd',
+        'source': drv_file(ssd_source),
+        'target': drv_file(ssd_target)
+    },
+    {
+        'id': 'ssd -> hdd',
+        'source': drv_file(ssd_source),
+        'target': drv_file(hdd_target)
+    },
+    {
+        'id': 'ssd -> nbd',
+        'source': drv_file(ssd_source),
+        'target': drv_nbd(nbd_ip, nbd_port)
+    },
+]
+
+# Test-envs are "columns" in benchmark resulting table, 'id is a caption f=
or
+# the column, other fields are handled by bench_func.
+test_envs =3D [
+    {
+        'id': 'backup-1',
+        'cmd': 'blockdev-backup',
+        'qemu_binary': '/path-to-qemu-binary-1'
+    },
+    {
+        'id': 'backup-2',
+        'cmd': 'blockdev-backup',
+        'qemu_binary': '/path-to-qemu-binary-2'
+    },
+    {
+        'id': 'mirror',
+        'cmd': 'blockdev-mirror',
+        'qemu_binary': '/path-to-qemu-binary-1'
+    }
+]
+
+result =3D simplebench.bench(bench_func, test_envs, test_cases, count=3D3)
+print(simplebench.ascii(result))
--=20
2.24.1


