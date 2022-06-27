Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6564655BA1E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 15:48:51 +0200 (CEST)
Received: from localhost ([::1]:33964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5p6g-0006ty-GN
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 09:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o5p3L-0003Zj-HW
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:45:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o5p3J-0004Gz-Tv
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:45:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656337512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cix97gxQIEPr+qVKwUqQxBomJRq9lu40OM3N/kEgbD8=;
 b=RLSfyD+ShbvAitPVo7Yl4DeFGyJhj6I8/Ml5Mja2lr1BNQwXtuY6z2qad7jBP12Ncy34AA
 QDslj+/5UXorUvM/fziiBv0Kl76WXO/akV+fuD0ewAByfr/Lg9RCT5tCCVTmPfWCxTUdr3
 4ztDWODwWOg2PpdOcySrKlpNfn/YsA8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-TuoSg4ACOqSMENnCd-NatA-1; Mon, 27 Jun 2022 09:45:08 -0400
X-MC-Unique: TuoSg4ACOqSMENnCd-NatA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D95C3801164;
 Mon, 27 Jun 2022 13:45:08 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 450279D54;
 Mon, 27 Jun 2022 13:45:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, mst@redhat.com, raphael.norwitz@nutanix.com,
 stefanha@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 1/3] docs/vhost-user: Fix mismerge
Date: Mon, 27 Jun 2022 15:44:58 +0200
Message-Id: <20220627134500.94842-2-kwolf@redhat.com>
In-Reply-To: <20220627134500.94842-1-kwolf@redhat.com>
References: <20220627134500.94842-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This reverts commit 76b1b64370007234279ea4cc8b09c98cbd2523de.

The commit only duplicated some text that had already been merged in
commit 31009d13cc5.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/interop/vhost-user.rst | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index d7cf904f7f..3f18ab424e 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1376,14 +1376,6 @@ Front-end message types
   For further details on postcopy, see ``VHOST_USER_SET_MEM_TABLE``.
   They apply to ``VHOST_USER_ADD_MEM_REG`` accordingly.
 
-  Exactly one file descriptor from which the memory is mapped is
-  passed in the ancillary data.
-
-  In postcopy mode (see ``VHOST_USER_POSTCOPY_LISTEN``), the back-end
-  replies with the bases of the memory mapped region to the front-end.
-  For further details on postcopy, see ``VHOST_USER_SET_MEM_TABLE``.
-  They apply to ``VHOST_USER_ADD_MEM_REG`` accordingly.
-
 ``VHOST_USER_REM_MEM_REG``
   :id: 38
   :equivalent ioctl: N/A
@@ -1408,14 +1400,6 @@ Front-end message types
   accept messages with one file descriptor. If a file descriptor is
   passed, the back-end MUST close it without using it otherwise.
 
-  The memory region to be removed is identified by its guest address,
-  user address and size. The mmap offset is ignored.
-
-  No file descriptors SHOULD be passed in the ancillary data. For
-  compatibility with existing incorrect implementations, the back-end MAY
-  accept messages with one file descriptor. If a file descriptor is
-  passed, the back-end MUST close it without using it otherwise.
-
 ``VHOST_USER_SET_STATUS``
   :id: 39
   :equivalent ioctl: VHOST_VDPA_SET_STATUS
-- 
2.35.3


