Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1512DE1C2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:07:30 +0100 (CET)
Received: from localhost ([::1]:34600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDbd-0008I8-GF
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCz-0003mD-De
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:42:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCw-0004fa-Jf
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:42:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ayG5vht1yT5nQ7SYaiIUVTjkngKM2r3QOIBwqb3vcYI=;
 b=ha8hfTuiPYPFL0la370tBo6tKYk3lW/M/9QUUsnVVRyp8yURCoUinjzFMeFR2l7WWUGJzE
 lUDxPGlZo+fR5U+bk9PQDMRYcO0Wt4tNo066RoSsAxQqEDQyh4dCKPg1J0MaY+eVO2Ll3t
 HaEN+mJ//fenrZuTMXQ95WZcLZpLQls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-kfASRdh_PNWAkWld8l7mUA-1; Fri, 18 Dec 2020 05:41:52 -0500
X-MC-Unique: kfASRdh_PNWAkWld8l7mUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE0AA9CC03;
 Fri, 18 Dec 2020 10:41:51 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFE3860C15;
 Fri, 18 Dec 2020 10:41:49 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 10/15] virtiofsd: update FUSE_FORGET comment on
 "lo_inode.nlookup"
Date: Fri, 18 Dec 2020 10:41:12 +0000
Message-Id: <20201218104117.199096-11-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laszlo Ersek <lersek@redhat.com>

Miklos confirms it's *only* the FUSE_FORGET request that the client can
use for decrementing "lo_inode.nlookup".

Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Fixes: 1222f015558fc34cea02aa3a5a92de608c82cec8
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Message-Id: <20201208073936.8629-1-lersek@redhat.com>
Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index b00be648d3..5fb36d9407 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -101,7 +101,7 @@ struct lo_inode {
      * This counter keeps the inode alive during the FUSE session.
      * Incremented when the FUSE inode number is sent in a reply
      * (FUSE_LOOKUP, FUSE_READDIRPLUS, etc).  Decremented when an inode is
-     * released by requests like FUSE_FORGET, FUSE_RMDIR, FUSE_RENAME, etc.
+     * released by a FUSE_FORGET request.
      *
      * Note that this value is untrusted because the client can manipulate
      * it arbitrarily using FUSE_FORGET requests.
-- 
2.29.2


