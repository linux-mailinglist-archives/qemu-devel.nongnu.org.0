Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F621230C7E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 16:33:35 +0200 (CEST)
Received: from localhost ([::1]:43672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0Qfe-0005ii-CX
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 10:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1k0QeJ-0004CA-UP
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 10:32:11 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53887
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1k0QeI-0001p1-41
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 10:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595946729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hh27FeAClEy2aEXFTVLIIi/K+bseJzd5N5JxzvwHk0c=;
 b=PfwrjDfTUKLJ94XVGoVMdhxU/wZqnbHL+O6K2w8jNKhKyqOaxP1F0W4iH7W8DMhg/HJJ72
 TCYM1CTUacaqtSi+Pw27H0cQ7oXPfamqHyLxXJ98vm+yht3PRddshqvKpkjjxhjXHn86u6
 Owi7Q8CcDekWlvfL5xX2ex89h7oZ0O0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-4tasRzRfOzGsDFJ0hatf1w-1; Tue, 28 Jul 2020 10:32:05 -0400
X-MC-Unique: 4tasRzRfOzGsDFJ0hatf1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19339803C4A
 for <qemu-devel@nongnu.org>; Tue, 28 Jul 2020 14:32:05 +0000 (UTC)
Received: from paraplu.localdomain (ovpn-113-129.ams2.redhat.com
 [10.36.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E0CD60C87;
 Tue, 28 Jul 2020 14:32:03 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi/block-core.json: Remove stale description of
 'blockdev-add'
Date: Tue, 28 Jul 2020 16:32:02 +0200
Message-Id: <20200728143202.616687-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:31:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On a 'qemu-discuss' thread[1], Kevin identifies that the current doc
blurb for @blockdev-add is stale:

    This is actually a documentation bug. @id doesn't exist,
    blockdev-add never creates a BlockBackend. This was different in the
    very first versions of the patches to add blockdev-add and we
    probably just forgot to update the documentation after removing it.

So remove the stale bits.

And the requirement for 'node-name' is already mentioned in the
documentation of @BlockdevOptions:

    [...]
    # @node-name: the node name of the new node (Since 2.0).
    #             This option is required on the top level of blockdev-add.
    #             Valid node names start with an alphabetic character and may
    #             contain only alphanumeric characters, '-', '.' and '_'. Their
    #             maximum length is 31 characters.
    [...]

[1] https://lists.nongnu.org/archive/html/qemu-discuss/2020-07/msg00071.html
    -- equivalent to "-drive if=ide,id=disk0....."

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
Identified-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/block-core.json | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 463ffd83da..3575d73ebf 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4049,9 +4049,7 @@
 ##
 # @blockdev-add:
 #
-# Creates a new block device. If the @id option is given at the top level, a
-# BlockBackend will be created; otherwise, @node-name is mandatory at the top
-# level and no BlockBackend will be created.
+# Creates a new block device.
 #
 # Since: 2.9
 #
-- 
2.26.2


