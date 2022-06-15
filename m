Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EB254CDA9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:57:49 +0200 (CEST)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1VOu-0008Ei-2P
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLd-0003n7-5i
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o1VLZ-0007Ga-W9
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655308460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KO0ufAsBnBIG45JVneh8vSVmquRKlnIT5NnIf0eJpLc=;
 b=YErhHZI4LrlFg4jyqQb4kOR3xl5RDEXwfYvAAK2h7GZiEGwrgVZ+ipH498n5XA4/wES0+J
 SCUAZ799jEVv9t1m52UWszOirK8FjCicq50pBO3kAwlI1XsJyp9t2v2XQd91jBp1twfYXr
 5CaMsS07Y2CawnY8y5Sl+rXmzKALzfc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-Qldfxaj6Ox6Dmn2OvfKvlQ-1; Wed, 15 Jun 2022 11:54:14 -0400
X-MC-Unique: Qldfxaj6Ox6Dmn2OvfKvlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69D22802D1C;
 Wed, 15 Jun 2022 15:54:13 +0000 (UTC)
Received: from localhost (unknown [10.39.192.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFAB6C2810D;
 Wed, 15 Jun 2022 15:54:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 <qemu-block@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, virtio-fs@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Julia Suvorova <jusual@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 01/18] MAINTAINERS: update Vladimir's address and repositories
Date: Wed, 15 Jun 2022 16:51:12 +0100
Message-Id: <20220615155129.1025811-2-stefanha@redhat.com>
In-Reply-To: <20220615155129.1025811-1-stefanha@redhat.com>
References: <20220615155129.1025811-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-id: 20220526115432.138384-1-vsementsov@yandex-team.ru
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cf6174f9f..5ba93348aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2546,7 +2546,7 @@ F: scsi/*
 
 Block Jobs
 M: John Snow <jsnow@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 L: qemu-block@nongnu.org
 S: Supported
 F: blockjob.c
@@ -2571,7 +2571,7 @@ F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
 F: include/qemu/co-shared-resource.h
 T: git https://gitlab.com/jsnow/qemu.git jobs
-T: git https://src.openvz.org/scm/~vsementsov/qemu.git jobs
+T: git https://gitlab.com/vsementsov/qemu.git block
 
 Block QAPI, monitor, command line
 M: Markus Armbruster <armbru@redhat.com>
@@ -2592,7 +2592,7 @@ F: include/hw/cxl/
 
 Dirty Bitmaps
 M: Eric Blake <eblake@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 R: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
@@ -2606,6 +2606,7 @@ F: util/hbitmap.c
 F: tests/unit/test-hbitmap.c
 F: docs/interop/bitmaps.rst
 T: git https://repo.or.cz/qemu/ericb.git bitmaps
+T: git https://gitlab.com/vsementsov/qemu.git block
 
 Character device backends
 M: Marc-André Lureau <marcandre.lureau@redhat.com>
@@ -2816,16 +2817,17 @@ F: scripts/*.py
 F: tests/*.py
 
 Benchmark util
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 S: Maintained
 F: scripts/simplebench/
-T: git https://src.openvz.org/scm/~vsementsov/qemu.git simplebench
+T: git https://gitlab.com/vsementsov/qemu.git simplebench
 
 Transactions helper
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 S: Maintained
 F: include/qemu/transactions.h
 F: util/transactions.c
+T: git https://gitlab.com/vsementsov/qemu.git block
 
 QAPI
 M: Markus Armbruster <armbru@redhat.com>
@@ -3402,7 +3404,7 @@ F: block/iscsi-opts.c
 
 Network Block Device (NBD)
 M: Eric Blake <eblake@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 L: qemu-block@nongnu.org
 S: Maintained
 F: block/nbd*
@@ -3414,7 +3416,7 @@ F: docs/interop/nbd.txt
 F: docs/tools/qemu-nbd.rst
 F: tests/qemu-iotests/tests/*nbd*
 T: git https://repo.or.cz/qemu/ericb.git nbd
-T: git https://src.openvz.org/scm/~vsementsov/qemu.git nbd
+T: git https://gitlab.com/vsementsov/qemu.git block
 
 NFS
 M: Peter Lieven <pl@kamp.de>
@@ -3499,13 +3501,13 @@ F: block/dmg.c
 parallels
 M: Stefan Hajnoczi <stefanha@redhat.com>
 M: Denis V. Lunev <den@openvz.org>
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/parallels.c
 F: block/parallels-ext.c
 F: docs/interop/parallels.txt
-T: git https://src.openvz.org/scm/~vsementsov/qemu.git parallels
+T: git https://gitlab.com/vsementsov/qemu.git block
 
 qed
 M: Stefan Hajnoczi <stefanha@redhat.com>
-- 
2.36.1


