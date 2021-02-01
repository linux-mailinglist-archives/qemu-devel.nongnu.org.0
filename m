Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172AA30B028
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:14:40 +0100 (CET)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6eel-0000mS-4H
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6eXy-0003jr-Sk
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:07:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6eXw-0000Ns-TH
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612206455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o6HA8KRX94IUV2KQn8TjkiJmaisKGKRWWej3xJ7KVkI=;
 b=UpSmpohN7InYtceH1YrZyoE/+6k4IEJegkRF7VYXmz8sVzqJUjLzPOzvbzn8YBTZR1yX8m
 FcToIJVy2O9grX8MDGsQSEx12zW6Q2R2Hk3cXLeBPwTusjgp3FdhJFTzg41HyEyPHSVWEL
 UqO10WlD9PHiRxGaNBvd3K3wq6Tep2U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-uyTksuMWNXWxKyqtOZMwlQ-1; Mon, 01 Feb 2021 14:07:31 -0500
X-MC-Unique: uyTksuMWNXWxKyqtOZMwlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE79118C89CF;
 Mon,  1 Feb 2021 19:07:30 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B401160C66;
 Mon,  1 Feb 2021 19:07:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 1/6] MAINTAINERS: Add Vladimir as co-maintainer for Block Jobs
Date: Mon,  1 Feb 2021 20:07:15 +0100
Message-Id: <20210201190720.245732-2-kwolf@redhat.com>
In-Reply-To: <20210201190720.245732-1-kwolf@redhat.com>
References: <20210201190720.245732-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

I'm developing Qemu backup for several years, and finally new backup
architecture, including block-copy generic engine and backup-top filter
landed upstream, great thanks to reviewers and especially to
Max Reitz!

I also have plans of moving other block-jobs onto block-copy, so that
we finally have one generic block copying path, fast and well-formed.

So, now I suggest to bring all parts of backup architecture into
"Block Jobs" subsystem (actually, aio_task is shared with qcow2 and
qemu-co-shared-resource can be reused somewhere else, but I'd keep an
eye on them in context of block-jobs) and add myself as co-maintainer.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210128144144.27617-1-vsementsov@virtuozzo.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bcd88668bc..00626941f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2210,6 +2210,7 @@ F: scsi/*
 
 Block Jobs
 M: John Snow <jsnow@redhat.com>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: blockjob.c
@@ -2222,7 +2223,16 @@ F: block/commit.c
 F: block/stream.c
 F: block/mirror.c
 F: qapi/job.json
+F: block/block-copy.c
+F: include/block/block-copy.c
+F: block/backup-top.h
+F: block/backup-top.c
+F: include/block/aio_task.h
+F: block/aio_task.c
+F: util/qemu-co-shared-resource.c
+F: include/qemu/co-shared-resource.h
 T: git https://gitlab.com/jsnow/qemu.git jobs
+T: git https://src.openvz.org/scm/~vsementsov/qemu.git jobs
 
 Block QAPI, monitor, command line
 M: Markus Armbruster <armbru@redhat.com>
-- 
2.29.2


