Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABF9423BF8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:08:04 +0200 (CEST)
Received: from localhost ([::1]:50266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4mH-0000g7-UC
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eB-00082F-GA
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4e8-0005uV-01
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633517974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2TY0lDuH7MPCwUP698+pV4ISzVSlvQYUGHm5rkdMQw=;
 b=ZVqfkW1OjqfHF3giurBEQTgjtaSjBDnYC8inM+5jQLMCC6y2uSM89LARIyALSNxGAvH1TP
 VrHZVnoPv/5yNJeyqgjitw6UxiOSLAoRRXPyNNNHMBz08LXIpuhqRj+a2JN3ld1HDtCiqP
 4rFW79+LNAtDqUBX5s7OEi+5nwuOARQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-DdvfdaXAMk2HuY3hJFVqHw-1; Wed, 06 Oct 2021 06:59:33 -0400
X-MC-Unique: DdvfdaXAMk2HuY3hJFVqHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18A1A1006AA2;
 Wed,  6 Oct 2021 10:59:32 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2325F60BE5;
 Wed,  6 Oct 2021 10:59:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/13] include/block.h: remove outdated comment
Date: Wed,  6 Oct 2021 12:59:11 +0200
Message-Id: <20211006105923.223549-2-kwolf@redhat.com>
In-Reply-To: <20211006105923.223549-1-kwolf@redhat.com>
References: <20211006105923.223549-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

There are a couple of errors in bdrv_drained_begin header comment:
- block_job_pause does not exist anymore, it has been replaced
  with job_pause in b15de82867
- job_pause is automatically invoked as a .drained_begin callback
  (child_job_drained_begin) by the child_job BdrvChildClass struct
  in blockjob.c. So no additional pause should be required.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210903113800.59970-1-eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 740038a892..ab987e8a99 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -751,9 +751,7 @@ bool bdrv_drain_poll(BlockDriverState *bs, bool recursive,
  * bdrv_drained_begin:
  *
  * Begin a quiesced section for exclusive access to the BDS, by disabling
- * external request sources including NBD server and device model. Note that
- * this doesn't block timers or coroutines from submitting more requests, which
- * means block_job_pause is still necessary.
+ * external request sources including NBD server, block jobs, and device model.
  *
  * This function can be recursive.
  */
-- 
2.31.1


