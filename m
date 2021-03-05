Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D5E32E54A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:51:48 +0100 (CET)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI77b-0008AL-Sc
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lI752-0006VO-CT
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:49:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lI74y-00020c-5Y
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614937743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4qtdcHh9qiO4xcUGnzEkm3VNvSbmU37qDpDU01/fg8o=;
 b=AgE4MGS6dU2fHu+f0XQDOpO0nCF//GPQA5aX5xcIDVugnzbeUU9CtYcq8SAIYaxekXfJj1
 22ef1aQZqwYuY5ehrmR6IzpEr/d8DTlluyu0Kh/Kudm1VhrNVJ2rtTyQGdTkrzk2WT+rsw
 ftunqOOkDE3MKMDOjaVNoejAeuxXcZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-M4ZftmmMMx6M7HefkwdrOQ-1; Fri, 05 Mar 2021 04:49:01 -0500
X-MC-Unique: M4ZftmmMMx6M7HefkwdrOQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9AA48030B5;
 Fri,  5 Mar 2021 09:49:00 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8DF55D9C0;
 Fri,  5 Mar 2021 09:48:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] docs: qsd: Explain --export nbd,name=... default
Date: Fri,  5 Mar 2021 10:48:56 +0100
Message-Id: <20210305094856.18964-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'name' option for NBD exports is optional. Add a note that the
default for the option is the node name (people could otherwise expect
that it's the empty string like for qemu-nbd).

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/tools/qemu-storage-daemon.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index fe3042d609..086493ebb3 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -80,8 +80,9 @@ Standard options:
   requests for modifying data (the default is off).
 
   The ``nbd`` export type requires ``--nbd-server`` (see below). ``name`` is
-  the NBD export name. ``bitmap`` is the name of a dirty bitmap reachable from
-  the block node, so the NBD client can use NBD_OPT_SET_META_CONTEXT with the
+  the NBD export name (if not specified, it defaults to the given
+  ``node-name``). ``bitmap`` is the name of a dirty bitmap reachable from the
+  block node, so the NBD client can use NBD_OPT_SET_META_CONTEXT with the
   metadata context name "qemu:dirty-bitmap:BITMAP" to inspect the bitmap.
 
   The ``vhost-user-blk`` export type takes a vhost-user socket address on which
-- 
2.29.2


